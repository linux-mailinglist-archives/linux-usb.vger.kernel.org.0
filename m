Return-Path: <linux-usb+bounces-35021-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eNIxKRFSumkAUQIAu9opvQ
	(envelope-from <linux-usb+bounces-35021-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 08:19:45 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE772B6D35
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 08:19:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9A02F3016BA3
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 07:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5CE3369988;
	Wed, 18 Mar 2026 07:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Wyf1Oi3J";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KfTWxXiH";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Wyf1Oi3J";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="KfTWxXiH"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCB336997D
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 07:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773818383; cv=none; b=BAzPtgZ6HOuEB+dIrn6yZKlTAAlqr9QKBGdoJHJjzFNW7x3rM+2bZLpJndso7vduCkswBI7KQlUDUy16k1ugfXe5FY928e0EQlkYAjf8XsU26lTzWEt9qY1yjh6Pg54b+XYeyp/x4iEvlefI8SUvnMny+UeFqgJPYPDJLRFzk9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773818383; c=relaxed/simple;
	bh=6pcd9SyFrfDwVj1UJzHu0Sld632AbNQrSBBpLgoUHsc=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E6vK3FJKXFKqThFwP/mT2xxDJTDMq4POHX+nS0GylWER/1g2gJDCvSJC7RdbS/fbRR8OKGpemvAKCEIqshZCVHJ0lAZATmd1JsTpZDI5n5r+GlRG7w8+EflxIrLIT1HEkm99Fr7E3mAJ8hSH18sc3bDvO6A8OBA/bZ72Kts1Bis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Wyf1Oi3J; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KfTWxXiH; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Wyf1Oi3J; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=KfTWxXiH; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 14CBA5BDBC;
	Wed, 18 Mar 2026 07:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773818380; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SzV6MbnWGkBRyfijoey2TXO4jCHwE85NIioQJigXMq8=;
	b=Wyf1Oi3JCNpc2Yskb7IHfd1AZseqaiO2jNo6Y6if495EhfcXOZJEzxW3jnjcoGlmFnCO9e
	HTYXV6MCn6bhA8gjjYMiylDLgIHv/SxC6k9PSea6CUHdhCq29sYdTN6ldya5f9G7FUaVne
	GPzG6SWc46aMJsIvlDNhP25Ueoi1ZMQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773818380;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SzV6MbnWGkBRyfijoey2TXO4jCHwE85NIioQJigXMq8=;
	b=KfTWxXiHjYZSFn8qupzF3Pqbl6jke61Y34+HSWUnMKfBu/dJ7vWC0mKrd3WG8O2UPyO7GR
	7TDlprY7thkcZODA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773818380; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SzV6MbnWGkBRyfijoey2TXO4jCHwE85NIioQJigXMq8=;
	b=Wyf1Oi3JCNpc2Yskb7IHfd1AZseqaiO2jNo6Y6if495EhfcXOZJEzxW3jnjcoGlmFnCO9e
	HTYXV6MCn6bhA8gjjYMiylDLgIHv/SxC6k9PSea6CUHdhCq29sYdTN6ldya5f9G7FUaVne
	GPzG6SWc46aMJsIvlDNhP25Ueoi1ZMQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773818380;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SzV6MbnWGkBRyfijoey2TXO4jCHwE85NIioQJigXMq8=;
	b=KfTWxXiHjYZSFn8qupzF3Pqbl6jke61Y34+HSWUnMKfBu/dJ7vWC0mKrd3WG8O2UPyO7GR
	7TDlprY7thkcZODA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C652B4273B;
	Wed, 18 Mar 2026 07:19:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 8PsfLwtSumkzJwAAD6G6ig
	(envelope-from <tiwai@suse.de>); Wed, 18 Mar 2026 07:19:39 +0000
Date: Wed, 18 Mar 2026 08:19:39 +0100
Message-ID: <87341xeh9w.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.de>,
	Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: usb-audio: validate full match when resolving quirk aliases
In-Reply-To: <abmJV97A1kaxP4Xv@ortodist>
References: <20260317-alsa-usb-fix-quirk-alias-v2-1-6e531c67f0c8@gmail.com>
	<878qbqg75d.wl-tiwai@suse.de>
	<abmJV97A1kaxP4Xv@ortodist>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/30.2 Mule/6.0
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-Spam-Score: -3.30
X-Spam-Level: 
X-Spam-Flag: NO
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
	TAGGED_FROM(0.00)[bounces-35021-lists,linux-usb=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4BE772B6D35
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 17 Mar 2026 18:35:16 +0100,
Cássio Gabriel wrote:
> 
> On Tue, Mar 17, 2026 at 10:03:10AM +0100, Takashi Iwai wrote:
> > On Tue, 17 Mar 2026 05:22:04 +0100,
> > Cássio Gabriel wrote:
> > > 
> > > get_alias_quirk() resolves a quirk for an aliased USB ID by scanning
> > > usb_audio_ids[], but it currently checks only the vendor/product pair.
> > > 
> > > This is weak for quirk table entries that also depend on additional
> > > USB_DEVICE_ID match fields, such as device or interface class,
> > > subclass, protocol, interface number, or bcdDevice range.
> > > 
> > > Rework the alias lookup so that it still uses the aliased vid:pid as
> > > the initial lookup key, but validates the remaining match_flags
> > > constraints of each candidate entry against the real device and
> > > interface descriptors before returning the quirk.
> > > 
> > > Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
> > > ---
> > > Changes in v2:
> > > - drop the temporary usb_device_id reconstruction approach
> > > - validate only the remaining match_flags explicitly
> > > - pass struct usb_interface * to get_alias_quirk()
> > > - Link to v1: https://lore.kernel.org/r/20260314-alsa-usb-fix-quirk-alias-v1-1-3269998f7ada@gmail.com
> > > ---
> > >  sound/usb/card.c | 72 +++++++++++++++++++++++++++++++++++++++++++++++++-------
> > >  1 file changed, 64 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/sound/usb/card.c b/sound/usb/card.c
> > > index fd81f32a66fb..153085a77d43 100644
> > > --- a/sound/usb/card.c
> > > +++ b/sound/usb/card.c
> > > @@ -864,21 +864,77 @@ static void find_last_interface(struct snd_usb_audio *chip)
> > >  	usb_audio_dbg(chip, "Found last interface = %d\n", chip->last_iface);
> > >  }
> > >  
> > > +/*
> > > + * Match aliased vid:pid first, then validate remaining fields against
> > > + * the real device and interface descriptors.
> > > + */
> > > +static bool snd_usb_match_alias_entry(struct usb_interface *intf,
> > > +				      const struct usb_device_id *id,
> > > +				      u32 alias_id)
> > > +{
> > > +	struct usb_device *dev = interface_to_usbdev(intf);
> > > +	const struct usb_host_interface *alt = intf->cur_altsetting;
> > > +	const struct usb_interface_descriptor *intfd = &alt->desc;
> > > +	const struct usb_device_descriptor *devd = &dev->descriptor;
> > > +	u16 bcd = le16_to_cpu(devd->bcdDevice);
> > > +
> > > +	/* Match aliased vendor/product */
> > > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_VENDOR) &&
> > > +	    id->idVendor != USB_ID_VENDOR(alias_id))
> > > +		return false;
> > > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_PRODUCT) &&
> > > +	    id->idProduct != USB_ID_PRODUCT(alias_id))
> > > +		return false;
> > > +	/* Match real device descriptor constraints */
> > > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_LO) &&
> > > +	    bcd < id->bcdDevice_lo)
> > > +		return false;
> > > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_HI) &&
> > > +	    bcd > id->bcdDevice_hi)
> > > +		return false;
> > > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_CLASS) &&
> > > +	    devd->bDeviceClass != id->bDeviceClass)
> > > +		return false;
> > > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_SUBCLASS) &&
> > > +	    devd->bDeviceSubClass != id->bDeviceSubClass)
> > > +		return false;
> > > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_PROTOCOL) &&
> > > +	    devd->bDeviceProtocol != id->bDeviceProtocol)
> > > +		return false;
> > > +	/* Match real interface descriptor constraints */
> > > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_INT_CLASS) &&
> > > +	    intfd->bInterfaceClass != id->bInterfaceClass)
> > > +		return false;
> > > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_INT_SUBCLASS) &&
> > > +	    intfd->bInterfaceSubClass != id->bInterfaceSubClass)
> > > +		return false;
> > > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_INT_PROTOCOL) &&
> > > +	    intfd->bInterfaceProtocol != id->bInterfaceProtocol)
> > > +		return false;
> > > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_INT_NUMBER) &&
> > > +	    intfd->bInterfaceNumber != id->bInterfaceNumber)
> > > +		return false;
> > > +
> > > +	return true;
> > > +}
> > 
> > Hrm, it became larger than I wished.
> > You compared with another implementation and decided to choose this
> > version?
> > 
> 
> Hi,
> 
> I went with the explicit matching path in v2 because I wanted to keep
> the alias lookup based on the aliased vid:pid while validating the
> remaining match_flags against the real descriptors.
> 
> > An alternative would be to have a copy of usb_device_id like your
> > previous version, and clear match_flags bits with
> > ~USB_DEVICE_ID_MATCH_DEVICE.  If match_flags becomes 0, it passes.
> > Otherwise call usb_match_one_id().
> 
> thanks, that makes sense.
> 
> What do you think about this approach?
> ```
> static const struct snd_usb_audio_quirk *
> get_alias_quirk(struct usb_interface *intf, unsigned int id)
> {
>         const struct usb_device_id *p;
>         struct usb_device_id match_id;
> 
>         for (p = usb_audio_ids; p->match_flags; p++) {
>                 if ((p->match_flags & USB_DEVICE_ID_MATCH_DEVICE) !=
>                     USB_DEVICE_ID_MATCH_DEVICE)
>                         continue;
> 
>                 if (p->idVendor != USB_ID_VENDOR(id) ||
>                     p->idProduct != USB_ID_PRODUCT(id))
>                         continue;
> 
>                 match_id = *p;
>                 match_id.match_flags &= ~USB_DEVICE_ID_MATCH_DEVICE;
>                 if (!match_id.match_flags || usb_match_one_id(intf, &match_id))
>                         return (const struct snd_usb_audio_quirk *)
>                                 p->driver_info;
>         }
> 
>         return NULL;
> }
> ```

Yes, that's what I had in mind.


thanks,

Takashi

