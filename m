Return-Path: <linux-usb+bounces-34890-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UJLHN9cxuGmvaAEAu9opvQ
	(envelope-from <linux-usb+bounces-34890-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 17:37:43 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 8396829D7F9
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 17:37:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D651D30186B0
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2026 16:37:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE5DC3CD8B9;
	Mon, 16 Mar 2026 16:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="ggoLq8Nr";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="InBJvDKP";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="vkExBbcg";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="PbBBDpB8"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90ED6332601
	for <linux-usb@vger.kernel.org>; Mon, 16 Mar 2026 16:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773679059; cv=none; b=KUCRarJGcvcqIkhRps2W+WkdASSmhke51VcbweaIl//rsCzjbNs5LrTIqtX6a07axYuFkG1lRFqnULGqv/5aKZAEN9bo0DBHJjVXK8+94ob/tzm6fDaZikSEcQKgweb5RdThCDumCgsTvv66WS6SXtQ4LN9veukhUWbSk65mhgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773679059; c=relaxed/simple;
	bh=KA2V+BstHbG9WNyUP+FThEkm7s5yl9yAWX/ntY4WIh8=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hXSplACCKmxjir0dmtZ8QoiPpmRYHaqhJKmrda1xKlTWIeFhBvBXWRg+UspExeOON1JLT2KQo8F62UYCZ5e2tbUF6ERAydod8HnbFI32jsMQW7Ahm328id7R38cbBSDOrrpxy9MhOyfDWW6P8EsHxwILrrsxdLjWX0/og3qP/Go=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=ggoLq8Nr; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=InBJvDKP; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=vkExBbcg; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=PbBBDpB8; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id E74A55BE42;
	Mon, 16 Mar 2026 16:37:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773679056; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tk5CZoVQ4UXq2yGrVWuQBI10zyAbPW5r65rMRoE9rdY=;
	b=ggoLq8NrM7HSO7SZamfFcUbcr18wMY0fEz0dtl08y6OJkXKATiuMf5lY0Eb2RJieEEgD34
	pAeiIk1uwv2ODxSxPLCbxUUicQcipF0lWHWNDT6sDXHSpgshoLrrKGuMPoIlgjhkHlYzaO
	89VMPQlK5j+CPCUGrTAJmc5fanuKZ6U=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773679056;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tk5CZoVQ4UXq2yGrVWuQBI10zyAbPW5r65rMRoE9rdY=;
	b=InBJvDKPm94vmiaoZXzkh07HfuZJzH2yfDsZ4+ioF6xRo80BoDQfA1CGq/zKvl8fqEedt/
	RW1RvH9P+lZkAYDg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=vkExBbcg;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=PbBBDpB8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773679055; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tk5CZoVQ4UXq2yGrVWuQBI10zyAbPW5r65rMRoE9rdY=;
	b=vkExBbcgQX8RXn0OeaerbF941FZYlC+Ri0tbhOUXiSUgjDywWr78FqOBsXTvbuvhjYnJc5
	Z92+YiTBsZjjqTOhitIzTJRiaB23aYPdwtYyY5GV1rcv4O9Kx2AjLkeQNONPXzgZdosR6l
	+T7i3P/dt//qjbI22C58oTowZunkjtk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773679055;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Tk5CZoVQ4UXq2yGrVWuQBI10zyAbPW5r65rMRoE9rdY=;
	b=PbBBDpB80Sd2haCtU1HnU0Yaik13xzGylHKZZkENQFWfxqGQ8il1DWlK17RPNZP9+KI86v
	tlQxnP9ZczWrOFDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A749C4273B;
	Mon, 16 Mar 2026 16:37:35 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id Wil2J88xuGnSJAAAD6G6ig
	(envelope-from <tiwai@suse.de>); Mon, 16 Mar 2026 16:37:35 +0000
Date: Mon, 16 Mar 2026 17:37:35 +0100
Message-ID: <87se9z7msw.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: validate full match when resolving quirk aliases
In-Reply-To: <abWms_JJJrU8ThwV@ortodist>
References: <20260314-alsa-usb-fix-quirk-alias-v1-1-3269998f7ada@gmail.com>
	<87sea2a5hz.wl-tiwai@suse.de>
	<abWms_JJJrU8ThwV@ortodist>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Flag: NO
X-Spam-Score: -3.51
X-Spam-Level: 
X-Spamd-Result: default: False [-1.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[suse.de,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-34890-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tiwai@suse.de,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 8396829D7F9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 14 Mar 2026 19:22:41 +0100,
Cássio Gabriel wrote:
> 
> On Sat, Mar 14, 2026 at 02:46:16PM +0100, Takashi Iwai wrote:
> > On Sat, 14 Mar 2026 04:34:46 +0100,
> > Cássio Gabriel wrote:
> > > 
> > > get_alias_quirk() resolves a quirk for an aliased USB ID by scanning
> > > usb_audio_ids[], but it currently checks only the vendor/product pair.
> > > 
> > > This can make an aliased ID pick the first entry with a matching
> > > vid:pid even when that entry also depends on interface descriptor
> > > fields that do not match the actual device or interface.
> > > 
> > > Fix it by re-checking each aliased candidate with usb_match_one_id()
> > > against the real interface before returning the quirk.
> > > 
> > > Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
> > > ---
> > >  sound/usb/card.c | 21 ++++++++++++++++-----
> > >  1 file changed, 16 insertions(+), 5 deletions(-)
> > > 
> > > diff --git a/sound/usb/card.c b/sound/usb/card.c
> > > index 270dad84d825..ff4418017763 100644
> > > --- a/sound/usb/card.c
> > > +++ b/sound/usb/card.c
> > > @@ -870,17 +870,28 @@ static void find_last_interface(struct snd_usb_audio *chip)
> > >  
> > >  /* look for the corresponding quirk */
> > >  static const struct snd_usb_audio_quirk *
> > > -get_alias_quirk(struct usb_device *dev, unsigned int id)
> > > +get_alias_quirk(struct usb_interface *intf, unsigned int id)
> > >  {
> > >  	const struct usb_device_id *p;
> > > +	struct usb_device_id id_alias;
> > >  
> > >  	for (p = usb_audio_ids; p->match_flags; p++) {
> > > -		/* FIXME: this checks only vendor:product pair in the list */
> > >  		if ((p->match_flags & USB_DEVICE_ID_MATCH_DEVICE) ==
> > >  		    USB_DEVICE_ID_MATCH_DEVICE &&
> > >  		    p->idVendor == USB_ID_VENDOR(id) &&
> > > -		    p->idProduct == USB_ID_PRODUCT(id))
> > > -			return (const struct snd_usb_audio_quirk *)p->driver_info;
> > > +		    p->idProduct == USB_ID_PRODUCT(id)) {
> > > +			/*
> > > +			 * Re-check the aliased entry against the actual
> > > +			 * interface descriptors instead of matching only
> > > +			 * the vendor/product pair.
> > > +			 */
> > > +			id_alias = *p;
> > > +			id_alias.idVendor = USB_ID_VENDOR(id);
> > > +			id_alias.idProduct = USB_ID_PRODUCT(id);
> > > +
> > > +			if (usb_match_one_id(intf, &id_alias))
> > 
> > Hmm, is this really a correct logic?
> > 
> > In this case, USB_ID_VENDOR(id) and USB_ID_PRODUCT(id) are very same
> > as p->idVendor and p->idProduct, hence id_alias and *p are identical,
> > i.e. you're basically comparing against *p.
> > 
> > I suppose you wanted to substitute the original device vendor/product
> > IDs there instead?
> 
> Hi,
> 
> Yes, what I actually wanted was to keep the alias lookup by vid:pid, but
> validate the additional match fields from the candidate entry against
> the real device and interface descriptors.
> 
> I was thinking of keeping the initial lookup by the aliased vid:pid and
> then explicitly checking only the remaining match bits, such as DEV_CLASS,
> DEV_SUBCLASS, DEV_PROTOCOL, INT_CLASS, INT_SUBCLASS, INT_PROTOCOL, INT_NUMBER,
> and bcdDevice_lo/hi. Another option would be to build the match object
> from the original device ID instead of the aliased one.
> 
> I think the first option would be simpler and more direct here, since
> the problem is that the current code resolves the alias only by
> vendor/product, even though some quirk table entries also depend
> on extra descriptor fields. The quirk table already has such entries,
> for example USB_DEVICE_VENDOR_SPEC() and USB_AUDIO_DEVICE(), so explicitly
> checking those extra fields in get_alias_quirk() seems to fit
> the intended logic better.

I don't have much opinion, you can compare both code and choose a
simpler one :)  In anyway, I'm waiting for your v2 patch.


thanks,

Takashi

