using {LibraryService} from '../../srv/services';

annotate LibraryService.Readers with @odata.draft.enabled;
annotate LibraryService.Readers with @Common.SemanticKey: [readerID];