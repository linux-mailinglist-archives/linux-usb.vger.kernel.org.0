Return-Path: <linux-usb+bounces-34798-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2EJBHLFmtWl90AAAu9opvQ
	(envelope-from <linux-usb+bounces-34798-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 14:46:25 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A86B28D5BE
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 14:46:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id A09C8300D570
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 13:46:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24ED5378D79;
	Sat, 14 Mar 2026 13:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TFU/tGjh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EJbfuGKT";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="TFU/tGjh";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="EJbfuGKT"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2A122A80D
	for <linux-usb@vger.kernel.org>; Sat, 14 Mar 2026 13:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773495979; cv=none; b=GPxrzcGVW6tZ+Af+WwlCiDNM0vTCspJt5RrRW5iRblIT8OGlzF5K3mJtUDQ3JRfyhi204qMHZW1jgRhiMo54g8AGtAivKP10ZAKLXkSBXMUiV4BYvUC6XNiRpU6cXzuD8G/CkFV4fDu0xwR7aOy3lqF7Qq6mE4RFpuuMkUsIwk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773495979; c=relaxed/simple;
	bh=0qiuYpKbU8frizpHl2dDLIr/YgqfJv2dQiVQBkkxmfs=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=UWhuMW2hi8m4z8MU+3xoBSG4loxGob/TBWLaMy3kzAUKgoKcKdkCjJHT2e7ct64KMRus77+RiPgu8CJhRKm9bOOwbI0xeA7RbUXury/Hqwy1WmBKdy+DXNxLlQdnJWk4rtKK0/Vv1sUMZbk8b9U0Dp7TftkJF0wTV7fZWWs/i3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TFU/tGjh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EJbfuGKT; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=TFU/tGjh; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=EJbfuGKT; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id B49B64D342;
	Sat, 14 Mar 2026 13:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773495976; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z8lKPIDgReKgLiFNQDMR54LnZEle2eENrmDgA7OdRis=;
	b=TFU/tGjhLmJd8h1Oz6DrDqQNhgruQksLY0huImah0bfPaJV4wGkda2GRi/jOLtNBbc8ArG
	at3IqQyAb5FzqNin9Q6x/2L+BkybPuV0sJFbjocC0UEjQdcYXQMnVyEYTUXH763sHC7aVD
	GZomlZIHV4Ylttd7UVjl2tdNs7WQ3TI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773495976;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z8lKPIDgReKgLiFNQDMR54LnZEle2eENrmDgA7OdRis=;
	b=EJbfuGKTdg9NbhsByHgT96OF+gdfwn1J4bzQjsI2yZE86/xIkpbLMHNbZmB5m1cK/cmv53
	qQxuur+7ZI4idhDA==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1773495976; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z8lKPIDgReKgLiFNQDMR54LnZEle2eENrmDgA7OdRis=;
	b=TFU/tGjhLmJd8h1Oz6DrDqQNhgruQksLY0huImah0bfPaJV4wGkda2GRi/jOLtNBbc8ArG
	at3IqQyAb5FzqNin9Q6x/2L+BkybPuV0sJFbjocC0UEjQdcYXQMnVyEYTUXH763sHC7aVD
	GZomlZIHV4Ylttd7UVjl2tdNs7WQ3TI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1773495976;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z8lKPIDgReKgLiFNQDMR54LnZEle2eENrmDgA7OdRis=;
	b=EJbfuGKTdg9NbhsByHgT96OF+gdfwn1J4bzQjsI2yZE86/xIkpbLMHNbZmB5m1cK/cmv53
	qQxuur+7ZI4idhDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 73A4B42724;
	Sat, 14 Mar 2026 13:46:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 3r7gGqhmtWlqGgAAD6G6ig
	(envelope-from <tiwai@suse.de>); Sat, 14 Mar 2026 13:46:16 +0000
Date: Sat, 14 Mar 2026 14:46:16 +0100
Message-ID: <87sea2a5hz.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: =?ISO-8859-1?Q?C=E1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
Cc: Takashi Iwai <tiwai@suse.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: validate full match when resolving quirk aliases
In-Reply-To: <20260314-alsa-usb-fix-quirk-alias-v1-1-3269998f7ada@gmail.com>
References: <20260314-alsa-usb-fix-quirk-alias-v1-1-3269998f7ada@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-34798-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[suse.de:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tiwai@suse.de,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim,suse.de:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 7A86B28D5BE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, 14 Mar 2026 04:34:46 +0100,
Cássio Gabriel wrote:
> 
> get_alias_quirk() resolves a quirk for an aliased USB ID by scanning
> usb_audio_ids[], but it currently checks only the vendor/product pair.
> 
> This can make an aliased ID pick the first entry with a matching
> vid:pid even when that entry also depends on interface descriptor
> fields that do not match the actual device or interface.
> 
> Fix it by re-checking each aliased candidate with usb_match_one_id()
> against the real interface before returning the quirk.
> 
> Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
> ---
>  sound/usb/card.c | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)
> 
> diff --git a/sound/usb/card.c b/sound/usb/card.c
> index 270dad84d825..ff4418017763 100644
> --- a/sound/usb/card.c
> +++ b/sound/usb/card.c
> @@ -870,17 +870,28 @@ static void find_last_interface(struct snd_usb_audio *chip)
>  
>  /* look for the corresponding quirk */
>  static const struct snd_usb_audio_quirk *
> -get_alias_quirk(struct usb_device *dev, unsigned int id)
> +get_alias_quirk(struct usb_interface *intf, unsigned int id)
>  {
>  	const struct usb_device_id *p;
> +	struct usb_device_id id_alias;
>  
>  	for (p = usb_audio_ids; p->match_flags; p++) {
> -		/* FIXME: this checks only vendor:product pair in the list */
>  		if ((p->match_flags & USB_DEVICE_ID_MATCH_DEVICE) ==
>  		    USB_DEVICE_ID_MATCH_DEVICE &&
>  		    p->idVendor == USB_ID_VENDOR(id) &&
> -		    p->idProduct == USB_ID_PRODUCT(id))
> -			return (const struct snd_usb_audio_quirk *)p->driver_info;
> +		    p->idProduct == USB_ID_PRODUCT(id)) {
> +			/*
> +			 * Re-check the aliased entry against the actual
> +			 * interface descriptors instead of matching only
> +			 * the vendor/product pair.
> +			 */
> +			id_alias = *p;
> +			id_alias.idVendor = USB_ID_VENDOR(id);
> +			id_alias.idProduct = USB_ID_PRODUCT(id);
> +
> +			if (usb_match_one_id(intf, &id_alias))

Hmm, is this really a correct logic?

In this case, USB_ID_VENDOR(id) and USB_ID_PRODUCT(id) are very same
as p->idVendor and p->idProduct, hence id_alias and *p are identical,
i.e. you're basically comparing against *p.

I suppose you wanted to substitute the original device vendor/product
IDs there instead?


thanks,

Takashi

