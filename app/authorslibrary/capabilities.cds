using {LibraryService} from '../../srv/services';

annotate LibraryService.Authors with @odata.draft.enabled;
annotate LibraryService.Authors with @Common.SemanticKey: [authorID];