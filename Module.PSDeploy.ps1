Deploy Module {
    By PSGalleryModule {
        FromSource Build\PSSherpaDesk
        To PSGallery
        WithOptions @{
            ApiKey = $ENV:PSGalleryKey
        }
    }
}