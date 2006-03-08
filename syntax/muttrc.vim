" Vim syntax file
" Language:	Mutt setup files
" Original:	Preben 'Peppe' Guldberg <peppe-vim@wielders.org>
" Maintainer:	Kyle Wheeler <kyle-muttrc.vim@memoryhole.net>
" Last Change:	8 Mar 2006

" This file covers mutt version 1.5.11

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Set the keyword characters
if version < 600
  set isk=@,48-57,_,-
else
  setlocal isk=@,48-57,_,-
endif

syn match muttrcComment		"^#.*$"
syn match muttrcComment		"[^\\]#.*$"lc=1

" Escape sequences (back-tick and pipe goes here too)
syn match muttrcEscape		+\\[#tnr"'Cc]+
syn match muttrcEscape		+[`|]+

" The variables takes the following arguments
syn match  muttrcString		"=\s*[^ #"']\+"lc=1 contains=muttrcEscape
syn region muttrcString		start=+"+ms=e skip=+\\"+ end=+"+ contains=muttrcEscape,muttrcSet,muttrcUnset,muttrcReset,muttrcToggle,muttrcMacro,muttrcCommand,muttrcAction
syn region muttrcString		start=+'+ms=e skip=+\\'+ end=+'+ contains=muttrcEscape,muttrcSet,muttrcUnset,muttrcReset,muttrcToggle,muttrcMacro,muttrcCommand,muttrcAction

syn match  muttrcRXChars	contained "[^\\][.*?]\+"hs=s+1
syn match  muttrcRXChars	contained "[|()][.*?]*"
syn match  muttrcRXChars	contained "'^"ms=s+1
syn match  muttrcRXChars	contained "$'"me=e-1
syn match  muttrcRXChars	contained "\\"
syn region muttrcRXString	contained start=+'+ skip=+\\'+ end=+'+ contains=muttrcRXChars
syn region muttrcRXString	contained start=+"+ skip=+\\"+ end=+"+ contains=muttrcRXChars

syn match muttrcSpecial		+\(['"]\)!\1+

" Numbers and Quadoptions may be surrounded by " or '
syn match muttrcNumber		/=\s*\d\+/lc=1
syn match muttrcNumber		/=\s*"\d\+"/lc=1
syn match muttrcNumber		/=\s*'\d\+'/lc=1
syn match muttrcQuadopt		+=\s*\(ask-\)\=\(yes\|no\)+lc=1
syn match muttrcQuadopt		+=\s*"\(ask-\)\=\(yes\|no\)"+lc=1
syn match muttrcQuadopt		+=\s*'\(ask-\)\=\(yes\|no\)'+lc=1

" Now catch some email addresses and headers (purified version from mail.vim)
syn match muttrcEmail		"[a-zA-Z0-9._-]\+@[a-zA-Z0-9./-]\+"
syn match muttrcHeader		"\<\(From\|To\|C[Cc]\|B[Cc][Cc]\|Reply-To\|Subject\|Return-Path\|Received\|Date\|Replied\|Attach\)\>:\="

syn match   muttrcKeySpecial	contained +\(\\[Cc'"]\|\^\|\\[01]\d\{2}\)+
syn match   muttrcBindKey	contained "\S\+" contains=muttrcKey nextgroup=muttrcFunction skipwhite
syn match   muttrcKey		contained "\S\+"			contains=muttrcKeySpecial,muttrcKeyName
syn region  muttrcKey		contained start=+"+ skip=+\\\\\|\\"+ end=+"+	contains=muttrcKeySpecial,muttrcKeyName
syn region  muttrcKey		contained start=+'+ skip=+\\\\\|\\'+ end=+'+	contains=muttrcKeySpecial,muttrcKeyName
syn match   muttrcKeyName	contained "\<f\(\d\|10\)\>"
syn match   muttrcKeyName	contained "\\[trne]"
syn match   muttrcKeyName	contained "<\(BackSpace\|Delete\|Down\|End\|[Ee]nter\|Esc\|Home\|Insert\|Left\|PageDown\|PageUp\|Return\|Right\|Space\|Tab\|Up\)>"

syn keyword muttrcVarBool	contained allow_8bit allow_ansi arrow_cursor ascii_chars askbcc askcc attach_split
syn keyword muttrcVarBool	contained auto_tag autoedit beep beep_new bounce_delivered check_new collapse_unread crypt_timestamp
syn keyword muttrcVarBool	contained confirmappend confirmcreate delete_untag digest_collapse duplicate_threads
syn keyword muttrcVarBool	contained edit_hdrs edit_headers encode_from fast_reply fcc_attach use_envelope_from
syn keyword muttrcVarBool	contained fcc_clear followup_to force_name forw_decode forw_decrypt forw_quote
syn keyword muttrcVarBool	contained forward_decode forward_decrypt forward_quote hdrs header help hidden_host
syn keyword muttrcVarBool	contained hide_limited hide_missing hide_top_limited hide_top_missing ignore_list_reply_to
syn keyword muttrcVarBool	contained imap_force_ssl imap_list_subscribed imap_passive imap_peek imap_servernoise
syn keyword muttrcVarBool	contained implicit_autoview keep_flagged mailcap_sanitize maildir_trash mark_old markers
syn keyword muttrcVarBool	contained menu_scroll meta_key metoo mh_purge mime_forward_decode pager_stop crypt_autoencrypt pgp_use_gpg_agent
syn keyword muttrcVarBool	contained crypt_autosign pgp_ignore_subkeys pgp_long_ids crypt_replyencrypt crypt_replysign
syn keyword muttrcVarBool	contained crypt_replysignencrypted pgp_retainable_sigs pgp_show_unusable pgp_strict_enc pgp_auto_decode
syn keyword muttrcVarBool	contained pipe_decode pipe_split pop_auth_try_all pop_last print_decode print_split
syn keyword muttrcVarBool	contained prompt_after read_only reply_self resolve reverse_alias reverse_name
syn keyword muttrcVarBool	contained reverse_realname rfc2047_parameters save_address save_empty save_name score
syn keyword muttrcVarBool	contained sig_dashes sig_on_top smart_wrap sort_re ssl_use_sslv2 ssl_use_sslv3 ssl_use_tlsv1
syn keyword muttrcVarBool	contained ssl_usesystemcerts status_on_top strict_threads suspend text_flowed thorough_search
syn keyword muttrcVarBool	contained thread_received tilde uncollapse_jump use_8bitmime use_domain use_from use_ipv6
syn keyword muttrcVarBool	contained user_agent wait_key weed wrap_search write_bcc
syn keyword muttrcVarBool	contained pgp_autosign nopgp_autosign invpgp_autosign pgp_autoencrypt nopgp_autoencrypt invpgp_autoencrypt
syn keyword muttrcVarBool	contained hide_thread_subject nohide_thread_subject invhide_thread_subject

syn keyword muttrcVarBool	contained noallow_8bit noallow_ansi noarrow_cursor noascii_chars noaskbcc noaskcc
syn keyword muttrcVarBool	contained noattach_split noauto_tag noautoedit nobeep nobeep_new nobounce_delivered
syn keyword muttrcVarBool	contained nocheck_new nocollapse_unread noconfirmappend noconfirmcreate nodelete_untag nocrypt_timestamp
syn keyword muttrcVarBool	contained nodigest_collapse noduplicate_threads noedit_hdrs noedit_headers noencode_from
syn keyword muttrcVarBool	contained noenvelope_from nofast_reply nofcc_attach nofcc_clear nofollowup_to noforce_name nouse_envelope_from
syn keyword muttrcVarBool	contained noforw_decode noforw_decrypt noforw_quote noforward_decode noforward_decrypt
syn keyword muttrcVarBool	contained noforward_quote nohdrs noheader nohelp nohidden_host nohide_limited nohide_missing
syn keyword muttrcVarBool	contained nohide_top_limited nohide_top_missing noignore_list_reply_to noimap_force_ssl
syn keyword muttrcVarBool	contained noimap_list_subscribed noimap_passive noimap_peek noimap_servernoise
syn keyword muttrcVarBool	contained noimplicit_autoview nokeep_flagged nomailcap_sanitize nomaildir_trash nomark_old
syn keyword muttrcVarBool	contained nomarkers nomenu_scroll nometa_key nometoo nomh_purge nomime_forward_decode
syn keyword muttrcVarBool	contained nopager_stop nocrypt_autoencrypt nocrypt_autosign nopgp_ignore_subkeys nopgp_long_ids nopgp_use_gpg_agent
syn keyword muttrcVarBool	contained nocrypt_replyencrypt nocrypt_replysign nocrypt_replysignencrypted nopgp_retainable_sigs
syn keyword muttrcVarBool	contained nopgp_show_unusable nopgp_strict_enc nopipe_decode nopipe_split nopop_auth_try_all nopgp_auto_decode
syn keyword muttrcVarBool	contained nopop_last noprint_decode noprint_split noprompt_after noread_only noreply_self
syn keyword muttrcVarBool	contained noresolve noreverse_alias noreverse_name noreverse_realname norfc2047_parameters
syn keyword muttrcVarBool	contained nosave_address nosave_empty nosave_name noscore nosig_dashes nosig_on_top
syn keyword muttrcVarBool	contained nosmart_wrap nosort_re nossl_use_sslv2 nossl_use_sslv3 nossl_use_tlsv1
syn keyword muttrcVarBool	contained nossl_usesystemcerts nostatus_on_top nostrict_threads nosuspend notext_flowed
syn keyword muttrcVarBool	contained nothorough_search nothread_received notilde nouncollapse_jump nouse_8bitmime
syn keyword muttrcVarBool	contained nouse_domain nouse_from nouse_ipv6 nouser_agent nowait_key noweed nowrap_search
syn keyword muttrcVarBool	contained nowrite_bcc
syn keyword muttrcVarBool	contained imap_idle noimap_idle invimap_idle
syn keyword muttrcVarBool	contained narrow_tree nonarrow_tree invnarrow_tree

syn keyword muttrcVarBool	contained invallow_8bit invallow_ansi invarrow_cursor invascii_chars invaskbcc invaskcc
syn keyword muttrcVarBool	contained invattach_split invauto_tag invautoedit invbeep invbeep_new invbounce_delivered invcrypt_timestamp
syn keyword muttrcVarBool	contained invcheck_new invcollapse_unread invconfirmappend invconfirmcreate invdelete_untag
syn keyword muttrcVarBool	contained invdigest_collapse invduplicate_threads invedit_hdrs invedit_headers invencode_from
syn keyword muttrcVarBool	contained invenvelope_from invfast_reply invfcc_attach invfcc_clear invfollowup_to invforce_name invuse_envelope_from
syn keyword muttrcVarBool	contained invforw_decode invforw_decrypt invforw_quote invforward_decode invforward_decrypt
syn keyword muttrcVarBool	contained invforward_quote invhdrs invheader invhelp invhidden_host invhide_limited
syn keyword muttrcVarBool	contained invhide_missing invhide_top_limited invhide_top_missing invignore_list_reply_to
syn keyword muttrcVarBool	contained invimap_force_ssl invimap_list_subscribed invimap_passive invimap_peek
syn keyword muttrcVarBool	contained invimap_servernoise invimplicit_autoview invkeep_flagged invmailcap_sanitize
syn keyword muttrcVarBool	contained invmaildir_trash invmark_old invmarkers invmenu_scroll invmeta_key invmetoo
syn keyword muttrcVarBool	contained invmh_purge invmime_forward_decode invpager_stop invcrypt_autoencrypt invcrypt_autosign invpgp_use_gpg_agent
syn keyword muttrcVarBool	contained invpgp_ignore_subkeys invpgp_long_ids invcrypt_replyencrypt invcrypt_replysign
syn keyword muttrcVarBool	contained invcrypt_replysignencrypted invpgp_retainable_sigs invpgp_show_unusable invpgp_strict_enc invpgp_auto_decode
syn keyword muttrcVarBool	contained invpipe_decode invpipe_split invpop_auth_try_all invpop_last invprint_decode
syn keyword muttrcVarBool	contained invprint_split invprompt_after invread_only invreply_self invresolve invreverse_alias
syn keyword muttrcVarBool	contained invreverse_name invreverse_realname invrfc2047_parameters invsave_address invsave_empty
syn keyword muttrcVarBool	contained invsave_name invscore invsig_dashes invsig_on_top invsmart_wrap invsort_re
syn keyword muttrcVarBool	contained invssl_use_sslv2 invssl_use_sslv3 invssl_use_tlsv1 invssl_usesystemcerts
syn keyword muttrcVarBool	contained invstatus_on_top invstrict_threads invsuspend invtext_flowed invthorough_search
syn keyword muttrcVarBool	contained invthread_received invtilde invuncollapse_jump invuse_8bitmime invuse_domain invuse_from
syn keyword muttrcVarBool	contained invuse_ipv6 invuser_agent invwait_key invweed invwrap_search invwrite_bcc
syn keyword muttrcVarBool	contained crypt_confirmhook nocrypt_confirmhook invcrypt_confirmhook
syn keyword muttrcVarBool	contained braille_friendly nobraille_friendly invbraille_friendly
syn keyword muttrcVarBool	contained maildir_header_cache_verify nomaildir_header_cache_verify invmaildir_header_cache_verify
syn keyword muttrcVarBool	contained header_cache_compress noheader_cache_compress invheader_cache_compress
syn keyword muttrcVarBool	contained crypt_verify_sig nocrypt_verify_sig invcrypt_verify_sig
syn keyword muttrcVarBool	contained crypt_use_gpgme nocrypt_use_gpgme invcrypt_use_gpgme
syn keyword muttrcVarBool	contained crypt_autopgp nocrypt_autopgp invcrypt_autopgp
syn keyword muttrcVarBool	contained crypt_autosmime nocrypt_autosmime invcrypt_autosmime
syn keyword muttrcVarBool	contained include_onlyfirst noinclude_onlyfirst invinclude_onlyfirst
syn keyword muttrcVarBool	contained pgp_confirmhook nopgp_confirmhook invpgp_confirmhook
syn keyword muttrcVarBool	contained pgp_replyencrypt nopgp_replyencrypt invpgp_replyencrypt
syn keyword muttrcVarBool	contained pgp_replysign nopgp_replysign invpgp_replysign
syn keyword muttrcVarBool	contained pgp_replysignencrypted nopgp_replysignencrypted invpgp_replysignencrypted
syn keyword muttrcVarBool	contained smime_is_default nosmime_is_default invsmime_is_default
syn keyword muttrcVarBool	contained smime_ask_cert_label nosmime_ask_cert_label invsmime_ask_cert_label
syn keyword muttrcVarBool	contained smime_decrypt_use_default_key nosmime_decrypt_use_default_key invsmime_decrypt_use_default_key
syn keyword muttrcVarBool	contained pgp_check_exit nopgp_check_exit invpgp_check_exit 
syn keyword muttrcVarBool	contained pgp_auto_traditional nopgp_auto_traditional invpgp_auto_traditional
syn keyword muttrcVarBool	contained pgp_replyinline nopgp_replyinline invpgp_replyinline
syn keyword muttrcVarBool	contained ssl_force_tls nossl_force_tls invssl_force_tls
syn keyword muttrcVarBool	contained strict_mime nostrict_mime invstrict_mime
syn keyword muttrcVarBool	contained stuff_all_quoted nostuff_all_quoted invstuff_all_quoted
syn keyword muttrcVarBool	contained use_envelope_from nouse_envelope_from invuse_envelope_from
syn keyword muttrcVarBool	contained envelope_from noenvelope_from invenvelope_from
syn keyword muttrcVarBool	contained use_idn nouse_idn invuse_idn
syn keyword muttrcVarBool	contained xterm_set_titles noxterm_set_titles invxterm_set_titles

syn keyword muttrcVarQuad	contained abort_nosubject abort_unmodified copy delete honor_followup_to include mime_forward
syn keyword muttrcVarQuad	contained mime_forward_rest mime_fwd move pgp_create_traditional pop_delete
syn keyword muttrcVarQuad	contained pgp_autoinline pgp_mime_auto bounce forward_edit
syn keyword muttrcVarQuad	contained pop_reconnect postpone print quit recall reply_to ssl_starttls

syn keyword muttrcVarQuad	contained noabort_nosubject noabort_unmodified nocopy nodelete nohonor_followup_to
syn keyword muttrcVarQuad	contained noinclude nomime_forward nocontained nomime_forward_rest nomime_fwd nomove
syn keyword muttrcVarQuad	contained nopgp_create_traditional nopop_delete nopop_reconnect
syn keyword muttrcVarQuad	contained nopgp_autoinline nopgp_mime_auto nobounce noforward_edit
syn keyword muttrcVarQuad	contained nopostpone noprint noquit norecall noreply_to nossl_starttls

syn keyword muttrcVarQuad	contained invabort_nosubject invabort_unmodified invcopy invdelete invhonor_followup_to
syn keyword muttrcVarQuad	contained invinclude invmime_forward invcontained invmime_forward_rest invmime_fwd invmove
syn keyword muttrcVarQuad	contained invpgp_create_traditional invpop_delete invpop_reconnect
syn keyword muttrcVarQuad	contained invpgp_autoinline invpgp_mime_auto invbounce invforward_edit
syn keyword muttrcVarQuad	contained invpostpone invprint invquit invrecall invreply_to invssl_starttls

syn keyword muttrcVarNum	contained connect_timeout history imap_keepalive mail_check pager_context pager_index_lines
syn keyword muttrcVarNum	contained pgp_timeout pop_checkinterval read_inc score_threshold_delete score_threshold_flag
syn keyword muttrcVarNum	contained score_threshold_read sendmail_wait sleep_time timeout wrapmargin write_inc
syn keyword muttrcVarNum	contained menu_context header_cache_pagesize net_inc smime_timeout ssl_min_dh_prime_bits

syn keyword muttrcVarStr	contained alias_file alias_format attach_format attach_sep attribution certificate_file header_cache
syn keyword muttrcVarStr	contained charset compose_format date_format default_hook display_filter dotlock_program dsn_notify
syn keyword muttrcVarStr	contained dsn_return editor entropy_file escape folder folder_format forw_format forward_format
syn keyword muttrcVarStr	contained from gecos_mask hdr_format hostname imap_authenticators imap_delim_chars imap_headers
syn keyword muttrcVarStr	contained imap_home_namespace imap_pass imap_user indent_str indent_string index_format ispell
syn keyword muttrcVarStr	contained locale mailcap_path mask mbox mbox_type message_format mh_seq_flagged mh_seq_replied
syn keyword muttrcVarStr	contained mh_seq_unseen mix_entry_format mixmaster msg_format pager pager_format
syn keyword muttrcVarStr	contained pgp_clearsign_command pgp_decode_command pgp_decrypt_command pgp_encrypt_only_command
syn keyword muttrcVarStr	contained pgp_encrypt_sign_command pgp_entry_format pgp_export_command pgp_getkeys_command
syn keyword muttrcVarStr	contained pgp_good_sign pgp_import_command pgp_list_pubring_command pgp_list_secring_command
syn keyword muttrcVarStr	contained pgp_sign_as pgp_sign_command pgp_sort_keys pgp_verify_command pgp_verify_key_command
syn keyword muttrcVarStr	contained smime_verify_command smime_verify_opaque_command smime_decrypt_command
syn keyword muttrcVarStr	contained smime_sign_command smime_encrypt_command smime_encrypt_with smime_import_cert_command
syn keyword muttrcVarStr	contained smime_get_cert_email_command smime_get_signer_cert_command smime_get_cert_command
syn keyword muttrcVarStr	contained smime_pk7out_command smime_keys smime_certificates smime_ca_location
syn keyword muttrcVarStr	contained pipe_sep pop_authenticators pop_host pop_pass pop_user post_indent_str post_indent_string
syn keyword muttrcVarStr	contained postponed preconnect print_cmd print_command query_command quote_regexp realname record
syn keyword muttrcVarStr	contained reply_regexp send_charset sendmail shell signature simple_search smileys sort sort_alias
syn keyword muttrcVarStr	contained sort_aux sort_browser spoolfile status_chars status_format tmpdir to_chars tunnel visual
syn keyword muttrcVarStr	contained imap_cachedir menu_move_off spam_separator content_type assumed_charset config_charset
syn keyword muttrcVarStr	contained content_type envelope_from_address imap_login smime_sign_opaque_command
syn keyword muttrcVarStr	contained smime_sign_as smime_default_key ssl_client_cert ssl_ca_certificates_file
syn keyword muttrcVarStr	contained smtp_url smtp_authenticators xterm_icon xterm_title

syn keyword muttrcMenu		contained alias attach browser compose editor index pager postpone pgp mix query generic
syn match muttrcMenuList "\S\+" contained contains=muttrcMenu

syn keyword muttrcCommand	account-hook auto_view alternative_order charset-hook uncolor exec fcc-hook fcc-save-hook unalternative_order
syn keyword muttrcCommand	folder-hook hdr_order iconv-hook ignore mailboxes message-hook mbox-hook my_hdr unmailboxes
syn keyword muttrcCommand	pgp-hook push save-hook score send-hook send2-hook crypt-hook source unauto_view unhdr_order
syn keyword muttrcCommand	unhook unignore unmono unmy_hdr unscore
syn keyword muttrcCommand	mime_lookup unmime_lookup spam ungroup
syn keyword muttrcCommand	reply-hook send2-hook nospam unalternative_order

syn match muttrcAttachmentsMimeType contained "[*a-z0-9_-]\+/[*a-z0-9._-]\+\s*" skipwhite nextgroup=muttrcAttachmentsMimeType
syn match muttrcAttachmentsFlag contained "[+-]\([AI]\|inline\|attachment\)\s\+" skipwhite nextgroup=muttrcAttachmentsMimeType
syn match muttrcAttachmentsLine "^\s*\(un\)\?attachments\s\+" skipwhite nextgroup=muttrcAttachmentsFlag

syn match muttrcUnHighlightSpace contained "\(\s\+\|\\$\)"

syn keyword muttrcListsKeyword	contained lists unlists
syn region muttrcListsLine	keepend start=+^\s*\(un\)\?lists\s+ skip=+\\$+ end=+$+ contains=muttrcListsKeyword,muttrcGroupDef,muttrcRXPat,muttrcUnHighlightSpace,muttrcComment

syn keyword muttrcSubscribeKeyword	contained subscribe unsubscribe
syn region muttrcSubscribeLine 	keepend start=+^\s*\(un\)\?subscribe\s+ skip=+\\$+ end=+$+ contains=muttrcSubscribeKeyword,muttrcRXPat,muttrcGroupDef,muttrcUnHighlightSpace,muttrcComment

syn keyword muttrcAlternateKeyword contained alternates unalternates
syn region muttrcAlternatesLine keepend start=+^\s*\(un\)\?alternates\s+ skip=+\\$+ end=+$+ contains=muttrcAlternateKeyword,muttrcGroupDef,muttrcRXPat,muttrcUnHighlightSpace,muttrcComment

syn match muttrcVariable	"\$[a-zA-Z_-]\+"

syn match muttrcBadAction	contained "[^<>]\+" contains=muttrcEmail
syn match muttrcFunction	contained "\(attach\|bounce\|copy\|delete\|display\|flag\|forward\|parent\|pipe\|postpone\|print\|recall\|resent\|save\|send\|tag\|undelete\)-message"
syn match muttrcFunction	contained "\(delete\|next\|previous\|read\|tag\|undelete\)-thread"
syn match muttrcFunction	contained "\(backward\|capitalize\|downcase\|forward\|kill\|upcase\)-word"
syn match muttrcFunction	contained "\(delete\|filter\|first\|last\|next\|pipe\|previous\|print\|save\|select\|tag\|undelete\)-entry"
syn match muttrcFunction	contained "attach-\(file\|key\)"
syn match muttrcFunction	contained "change-\(dir\|folder\|folder-readonly\)"
syn match muttrcFunction	contained "check-\(new\|traditional-pgp\)"
syn match muttrcFunction	contained "current-\(bottom\|middle\|top\)"
syn match muttrcFunction	contained "decode-\(copy\|save\)"
syn match muttrcFunction	contained "delete-\(char\|pattern\|subthread\)"
syn match muttrcFunction	contained "display-\(address\|toggle-weed\)"
syn match muttrcFunction	contained "edit\(-\(bcc\|cc\|description\|encoding\|fcc\|file\|from\|headers\|mime\|reply-to\|subject\|to\|type\)\)\?"
syn match muttrcFunction	contained "enter-\(command\|mask\)"
syn match muttrcFunction	contained "half-\(up\|down\)"
syn match muttrcFunction	contained "history-\(up\|down\)"
syn match muttrcFunction	contained "kill-\(eol\|eow\|line\)"
syn match muttrcFunction	contained "next-\(line\|new\|page\|subthread\|undeleted\|unread\)"
syn match muttrcFunction	contained "previous-\(line\|new\|page\|subthread\|undeleted\|unread\)"
syn match muttrcFunction	contained "search\(-\(next\|opposite\|reverse\|toggle\)\)\?"
syn match muttrcFunction	contained "show-\(limit\|version\)"
syn match muttrcFunction	contained "sort-\(mailbox\|reverse\)"
syn match muttrcFunction	contained "tag-\(pattern\|prefix\)"
syn match muttrcFunction	contained "toggle-\(mailboxes\|new\|quoted\|subscribed\|unlink\|write\)"
syn match muttrcFunction	contained "undelete-\(pattern\|subthread\)"
syn match muttrcFunction	contained "collapse-\(parts\|thread\|all\)"
syn match muttrcFunction	contained "view-\(attach\|attachments\|file\|mailcap\|name\|text\)"
syn match muttrcFunction	contained "\(backspace\|backward-char\|bol\|bottom\|bottom-page\|buffy-cycle\|clear-flag\|complete\(-query\)\?\|copy-file\|create-alias\|detach-file\|eol\|exit\|extract-keys\|\(imap-\)\?fetch-mail\|forget-passphrase\|forward-char\|group-reply\|help\|ispell\|jump\|limit\|list-reply\|mail\|mail-key\|mark-as-new\|middle-page\|new-mime\|pgp-menu\|query\|query-append\|quit\|quote-char\|read-subthread\|redraw-screen\|refresh\|rename-file\|reply\|select-new\|set-flag\|shell-escape\|skip-quoted\|sort\|subscribe\|sync-mailbox\|top\|top-page\|transpose-chars\|unsubscribe\|untag-pattern\|verify-key\|write-fcc\)"
syn match muttrcAction		contained "<[^>]\{-}>" contains=muttrcBadAction,muttrcFunction,muttrcKeyName

syn keyword muttrcSet		set     skipwhite nextgroup=muttrcVar.*
syn keyword muttrcUnset		unset   skipwhite nextgroup=muttrcVar.*
syn keyword muttrcReset		reset   skipwhite nextgroup=muttrcVar.*
syn keyword muttrcToggle	toggle  skipwhite nextgroup=muttrcVar.*

syn keyword muttrcBind		contained bind		skipwhite nextgroup=muttrcMenuList
syn match   muttrcBindLine	"^\s*bind\s\+\S\+"	skipwhite nextgroup=muttrcBindKey contains=muttrcBind

syn keyword muttrcMacro		contained macro		skipwhite nextgroup=muttrcMenuList
syn match   muttrcMacroLine	"^\s*macro\s\+\S\+"	skipwhite nextgroup=muttrcKey contains=muttrcMacro

syn region muttrcRXPat		contained start=+'+ skip=+\\'+ end=+'\s*+ keepend skipwhite contains=muttrcRXString nextgroup=muttrcRXPat
syn region muttrcRXPat		contained start=+"+ skip=+\\"+ end=+"\s*+ keepend skipwhite contains=muttrcRXString nextgroup=muttrcRXPat
syn region muttrcRXPat		contained start=+[^'"#-]+ end=+\($\|\s\+\)+ keepend skipwhite contains=muttrcRXChars nextgroup=muttrcRXPat
syn match muttrcRXDef 		contained "-rx\s\+" skipwhite nextgroup=muttrcRXPat

syn match muttrcAddrContent	contained "[a-zA-Z0-9._-]\+@[a-zA-Z0-9./-]\+\s*" skipwhite contains=muttrcEmail nextgroup=muttrcAddrContent
syn region muttrcAddrContent	contained start=+'+ end=+'\s*+ skip=+\\'+ skipwhite contains=muttrcEmail nextgroup=muttrcAddrContent
syn region muttrcAddrContent	contained start=+"+ end=+"\s*+ skip=+\\"+ skipwhite contains=muttrcEmail nextgroup=muttrcAddrContent
syn match muttrcAddrDef 	contained "-addr\s\+" skipwhite nextgroup=muttrcAddrContent

syn match muttrcGroupFlag	contained "-group"
syn region muttrcGroupDef	contained start="-group\s\+" skip="\\$" end="\s" skipwhite keepend contains=muttrcGroupFlag,muttrcUnHighlightSpace

syn keyword muttrcGroupKeyword	contained group ungroup
syn region muttrcGroupLine	keepend start=+^\s*\(un\)\?group\s+ skip=+\\$+ end=+$+ contains=muttrcGroupKeyword,muttrcGroupDef,muttrcAddrDef,muttrcRXDef,muttrcUnHighlightSpace,muttrcComment

" muttrcAlias* stuff is a giant hack. Please fix.
" (does not support line continuation)
syn match muttrcAliasGroupName	contained "\S\+\s\+" nextgroup=muttrcAliasGroupDef,muttrcAliasAbbr
syn match muttrcAliasGroupDef	contained "-group\s\+" nextgroup=muttrcAliasGroupName contains=muttrcGroupFlag
syn match   muttrcAliasEmail	contained "\S\+@\S\+\s\+" contains=muttrcEmail nextgroup=muttrcAliasName
syn match   muttrcAliasEncEmail	contained "<[^>]\+>" contains=muttrcEmail
syn match   muttrcAliasNameNoParens contained "[^<(@]\+\s\+" nextgroup=muttrcAliasEncEmail
syn match   muttrcAliasParens	contained "[()]"
syn match   muttrcAliasName     contained "([^)]\+)" contains=muttrcAliasParens
syn match   muttrcAliasAbbr	contained "[^-]\S\+\s\+" nextgroup=muttrcAliasEmail,muttrcAliasNameNoParens
syn match   muttrcAlias		"^\s*alias\s\+" nextgroup=muttrcAliasGroupDef,muttrcAliasAbbr

syn keyword muttrcUnAliasKeyword	contained unalias
syn match   muttrcUnAliasAbbr	contained "\S\+\s*" skipwhite nextgroup=muttrcUnAliasAbbr
syn region  muttrcUnAlias	start=+^\s*unalias\s+ skip=+\\$+ end=+$+ contains=muttrcUnAliasKeyword,muttrcUnAliasAbbr

" Colour definitions takes object, foreground and background arguments (regexps excluded).
syn keyword muttrcColorField	contained attachment body bold error hdrdefault header index
syn keyword muttrcColorField	contained indicator markers message normal quoted search signature
syn keyword muttrcColorField	contained status tilde tree underline
syn match   muttrcColorField	contained "\<quoted\d\=\>"
syn keyword muttrcColorFG	contained black blue cyan default green magenta red white yellow
syn keyword muttrcColorFG	contained brightblack brightblue brightcyan brightdefault brightgreen
syn keyword muttrcColorFG	contained brightmagenta brightred brightwhite brightyellow
syn match   muttrcColorFG	contained "\<\(bright\)\=color\d\{1,2}\>"
syn keyword muttrcColorBG	contained black blue cyan default green magenta red white yellow
syn match   muttrcColorBG	contained "\<color\d\{1,2}\>"
" Now for the match
syn match muttrcColorBackground contained "\S\+\s*" contains=muttrcColorBG,muttrcVariable
syn match muttrcColorForeground contained "\S\+\s\+" contains=muttrcColorFG,muttrcVariable nextgroup=muttrcColorBackground
syn match muttrcColor		contained "color\s\+"
syn match muttrcColorInit	contained "\S\+\s\+" contains=muttrcColorField nextgroup=muttrcColorForeground
syn match muttrcColorLine	"^\s*color\s\+"	contains=muttrcColor nextgroup=muttrcColorInit

" Mono are almost like color (ojects inherited from color)
syn keyword muttrcMonoAttrib	contained bold none normal reverse standout underline
syn keyword muttrcMono		contained mono		skipwhite nextgroup=muttrcColorField
syn match   muttrcMonoLine	"^\s*mono\s\+\S\+"	skipwhite nextgroup=muttrcMonoAttrib contains=muttrcMono

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_muttrc_syntax_inits")
  if version < 508
    let did_muttrc_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink muttrcComment		Comment
  HiLink muttrcEscape		SpecialChar
  HiLink muttrcRXChars		SpecialChar
  HiLink muttrcString		String
  HiLink muttrcRXString		String
  HiLink muttrcSpecial		Special
  HiLink muttrcGroupFlag	Type
  HiLink muttrcGroupDef		Macro
  HiLink muttrcAddrDef		muttrcGroupFlag
  HiLink muttrcRXDef		muttrcGroupFlag
  HiLink muttrcRXPat		String
  HiLink muttrcAliasGroupDef	Type
  HiLink muttrcAliasGroupName	Macro
  HiLink muttrcAliasAbbr	Identifier
  HiLink muttrcUnAliasAbbr	Identifier
  HiLink muttrcAliasEncEmail	Identifier
  HiLink muttrcAliasParens	Type
  HiLink muttrcNumber		Number
  HiLink muttrcQuadopt		Boolean
  HiLink muttrcEmail		Special
  HiLink muttrcVariable		Special
  HiLink muttrcHeader		Type
  HiLink muttrcKeySpecial	SpecialChar
  HiLink muttrcKey		Type
  HiLink muttrcKeyName		SpecialChar
  HiLink muttrcVarBool		Identifier
  HiLink muttrcVarQuad		Identifier
  HiLink muttrcVarNum		Identifier
  HiLink muttrcVarStr		Identifier
  HiLink muttrcMenu		Identifier
  HiLink muttrcCommand		Keyword
  HiLink muttrcSet		Keyword
  HiLink muttrcUnset		muttrcCommand
  HiLink muttrcReset		muttrcCommand
  HiLink muttrcToggle		muttrcCommand
  HiLink muttrcBind		muttrcCommand
  HiLink muttrcMacro		muttrcCommand
  HiLink muttrcAlias		muttrcCommand
  HiLink muttrcUnAliasKeyword	muttrcCommand
  HiLink muttrcAction		Macro
  HiLink muttrcBadAction	Error
  HiLink muttrcFunction		Macro
  HiLink muttrcColorField	Identifier
  HiLink muttrcColorFG		String
  HiLink muttrcColorBG		muttrcColorFG
  HiLink muttrcColor		muttrcCommand
  HiLink muttrcMonoAttrib	muttrcColorFG
  HiLink muttrcMono		muttrcCommand
  HiLink muttrcGroupKeyword	muttrcCommand
  HiLink muttrcGroupLine	Error
  HiLink muttrcSubscribeKeyword	muttrcCommand
  HiLink muttrcSubscribeLine	Error
  HiLink muttrcListsKeyword	muttrcCommand
  HiLink muttrcListsLine	Error
  HiLink muttrcAlternateKeyword	muttrcCommand
  HiLink muttrcAlternatesLine	Error
  HiLink muttrcAttachmentsLine	muttrcCommand
  HiLink muttrcAttachmentsFlag	Type
  HiLink muttrcAttachmentsMimeType	String

  delcommand HiLink
endif

let b:current_syntax = "muttrc"

"EOF	vim: ts=8 noet tw=100 sw=8 sts=0
