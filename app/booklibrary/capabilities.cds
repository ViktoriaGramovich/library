using {LibraryService} from '../../srv/services';

annotate LibraryService.Books with @odata.draft.enabled;
annotate LibraryService.Books with @Common.SemanticKey: [bookID];