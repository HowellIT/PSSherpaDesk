# PSSherpaDesk

This module is designed to work with Shera Desk's API (https://sherpadesk.com)

Their API docs:

 - https://github.com/sherpadesk/api/wiki
 - https://documenter.getpostman.com/view/4454237/apisherpadeskcom-playground/RW8AooQg

This is not endorsed by Sherpa Desk, I've developed it because I use the product and prefer to automate what I can.

This module mostly just retrieves some of the data so far, but more is being added as needed.

This doc is just a standin until I update all the help for each cmdlet.

PRs welcome!

## How to set up

Publishing to the PSGallery soon.

Download or clone this repo and:

```PowerShell
Import-Module $ModulePath\build\PSSherpaDesk
```
To be able to use this module, you must already have a Sherpa Desk account.

## How to authenticate

Using the email address for your account:

```PowerShell
Get-SDAPIKey -Email 'email@domain.com'
```

This will prompt you for your password and store the API key in a module-scoped AuthConfig variable for the other cmdlets to reference.

There is an optional ```-PassThru``` parameter if you wish it to be returned as a string.

Sherpa Desk requires an Organization and Instance to be sent with each request, these can be retrieved with:

```PowerShell
Get-SDMetadata
```

This will also add these to the module-scoped AuthConfig variable for the other cmdlets to access. It currently sets the first Organization and the first Instance as the working reference points.

**Once you have run both ```Get-SDAPIKey``` and ```Get-SDMetadata``` all cmdlets will not require authentication.**

## How to query

To retrieve all data:

```PowerShell
Get-SDTicket
```

To get a single object:

```PowerShell
Get-SDTicket -Key <ticket key or ID>
```

## How to set data

To set one property (where supported):

```PowerShell
Set-SDTicket -Key <ticket key or ID> -Status 'Closed'
```

To set multiple properties:

```PowerShell
$body = @{
    status = 'waiting'
    note_text = 'This is the note text'
}
Set-SDTicket -key <ticket key or ID> -Body $body
```

## How to create data

To create a new user:

```PowerShell
New-SDUser -FirstName 'Anthony' -LastName 'Howell' -Email 'anthony@howell-it.com'
```