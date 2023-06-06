class CloudStorageExceptions implements Exception {
  const CloudStorageExceptions();
}

//C in Crud
class CouldNotCreateStoreListException extends CloudStorageExceptions {}

//R in Crud
class CouldNotGetAllStoreListException extends CloudStorageExceptions {}

//U in Crud
class CouldNotUpdateStoreListException extends CloudStorageExceptions {}

//D in Crud
class CouldNotDeleteStoreListException extends CloudStorageExceptions {}
