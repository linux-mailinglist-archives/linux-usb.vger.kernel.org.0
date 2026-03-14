Return-Path: <linux-usb+bounces-34804-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GPRrCoSntWll3AAAu9opvQ
	(envelope-from <linux-usb+bounces-34804-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 19:23:00 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 83D8828E698
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 19:22:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6D5553016481
	for <lists+linux-usb@lfdr.de>; Sat, 14 Mar 2026 18:22:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E2D7B3368B5;
	Sat, 14 Mar 2026 18:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X+1/y/GS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374EF33507C
	for <linux-usb@vger.kernel.org>; Sat, 14 Mar 2026 18:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773512569; cv=none; b=n1hqYqPcWVFgHEn20k8rn0G79UvsVhRiAjbT+N2E61rhXjHgGviZQk8b/RALFtIqZWA9CUsQcrpcIyHZ1+Tz1rqz/9WxL1GrsTPCK/qNgu7hauZZFNpB0fZ+hMqTMM3sFsiOhlMrmxXMYpLAvu8bOLpKtK2URTxg73s/hNkpyZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773512569; c=relaxed/simple;
	bh=MdmXY2GXew3PZuMW9rQw+epMoKON3b5tfGh93QdDJkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CjB/IVhD3ekZqUBrFyHz9p7BPU64BxBzwdUclwXOFDuiWBOoQm/c7D5SGiyvu1UCrLpjDLmO9BCkhV6M6nVZl2WJCl9PjvSeYsjxFOYyxMIvF9egzjXONqIm422FRHal80NEzyTjvM5PD7ZQeSqwAukqN58qsQK2G322+J1pfZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X+1/y/GS; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-128b9b7e3edso1837995c88.0
        for <linux-usb@vger.kernel.org>; Sat, 14 Mar 2026 11:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773512567; x=1774117367; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NZy4YaOyfC8HFH6Zek8NYX9XPjKHBMRjSMS52NotXW0=;
        b=X+1/y/GSYGygcvV+QVm8woFRFuPszmxCQF71E3wFg30OUUj6zEf3feTy1EFWTUL51T
         0SfB6JBO3Em7ol9bFGviF+exu+YnPUfaGXbDtr1elyZhdSCpEOCMOAmsKRK3qYooXiGa
         Ft4U4DzW0aFic8re5RT/4wEU6pOgGJI+N2heOrYoTFzBoDx1OIF+OEJE/vByFm7ozlsW
         utBkbw/UDSWF7JJAkdrmWa5GpvGfk9NSpogWwf6UP6ZeF15LCFcim2vjlrMs3jwAV3X4
         udEKJ8TrMjTHhyUF2r1amhKuyWhxkMvjuwob8itSEck0LHuQnARgyobMBtvXLyN2RnH6
         CBOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773512567; x=1774117367;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NZy4YaOyfC8HFH6Zek8NYX9XPjKHBMRjSMS52NotXW0=;
        b=cdw3OuVKFEdaueKy7A9/LJ8WaahbFEuvwJADaLva+wa74dWv2vlU+NdGGAoyrZnab2
         5yh7ft8vVMK5S3jdiXqZf+0Qq3lcbtOfdZGaMzI8OaP+lDoKxjeJ/xt2Yad1hIWmJPXp
         EExymfNNrSMtzJ1IlWx6VWqICL66JZkkn5XQ+oB2A5UZu8Dh5sNPLIyib4YjCs/1GsUb
         nxl6XPOILXhEGztrf38Rg97jaIF0CUMLgsN/wxmK9CjCVeCBz1zZGl1kV4DOM+meK5/q
         2BLKx0yynpnf3R00RCc/dkJhSU0p7Q4NWcmdV3Uk7hoxbp+dJlR9jzaW7hdniZQZgLLs
         ds4A==
X-Forwarded-Encrypted: i=1; AJvYcCVB0DZutRZk99YfEGBH0Ic14bBADY+KjvHB6Vd0Wr0pLQ79p2WgsQCPKE0F/O15zBqfIlbvxygibbw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzT4jhR8kGjb44StmcdsAuLb20NJCAZUwqK7tKwutaubtXG3Oca
	MM/bUQin5oH+XgC/LmDpWEoXqriFmNvutlaj2Ocd12qGE5HUHC6Kr03q
X-Gm-Gg: ATEYQzwIZRtAy2lfGkaSZ/WolrtnZ2rCpAJSZ2wLs4St3sJ6jsUlkZAsCgPogmhLDFM
	Dr/yxU7hC5pRIhN36TaSUFkyBaYoCVfXgJ6pRkqv28yWS2wrJb9FXOP/cQLo7u2BwOO5pWQOq31
	Q2FBQiJR+94t8nVoay6Zukkl7cdcOwN1QbTWkIVcaEgUciP8fbpPXfEFyQcInIAwUo+EFTm2RZE
	Uhto5ksAfglKVRqZXIjma8zB3NrRAJmNrTPqwA3GhzACNuORW1eJUx0v+FMDY83anGq6qPgctCA
	yO8H4F1CYc8XZcmKpw64OIeT52v7V+YR7ShSYdYW4aEw6ORqb0BdoXe/GQibA3cVdQnO2blZ7cP
	gD3kg3aJj/waNRoizk0W7okgp7cIwwstqFUxBjulrZxgCmt0sxT5nZjYaJcEuZQkVL4hVlBCzQ+
	a9ncDVQOaHpJe1vYJWrlVXgvfWt9lylcb/I8ASHR8iYyD20FheltTRtWFRph+FhcjgpTpZWmuHh
	YzQYx4i
X-Received: by 2002:a05:7022:684:b0:124:9e46:82d6 with SMTP id a92af1059eb24-128f3dc59dfmr3469949c88.25.1773512566456;
        Sat, 14 Mar 2026 11:22:46 -0700 (PDT)
Received: from localhost (177-4-161-109.user3p.v-tal.net.br. [177.4.161.109])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2beab3a156bsm7615443eec.4.2026.03.14.11.22.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 11:22:45 -0700 (PDT)
Date: Sat, 14 Mar 2026 15:22:41 -0300
From: =?utf-8?Q?C=C3=A1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
	Mark Brown <broonie@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-sound@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ALSA: usb-audio: validate full match when resolving
 quirk aliases
Message-ID: <abWms_JJJrU8ThwV@ortodist>
References: <20260314-alsa-usb-fix-quirk-alias-v1-1-3269998f7ada@gmail.com>
 <87sea2a5hz.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87sea2a5hz.wl-tiwai@suse.de>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34804-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[cassiogabrielcontato@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 83D8828E698
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 14, 2026 at 02:46:16PM +0100, Takashi Iwai wrote:
> On Sat, 14 Mar 2026 04:34:46 +0100,
> Cássio Gabriel wrote:
> > 
> > get_alias_quirk() resolves a quirk for an aliased USB ID by scanning
> > usb_audio_ids[], but it currently checks only the vendor/product pair.
> > 
> > This can make an aliased ID pick the first entry with a matching
> > vid:pid even when that entry also depends on interface descriptor
> > fields that do not match the actual device or interface.
> > 
> > Fix it by re-checking each aliased candidate with usb_match_one_id()
> > against the real interface before returning the quirk.
> > 
> > Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
> > ---
> >  sound/usb/card.c | 21 ++++++++++++++++-----
> >  1 file changed, 16 insertions(+), 5 deletions(-)
> > 
> > diff --git a/sound/usb/card.c b/sound/usb/card.c
> > index 270dad84d825..ff4418017763 100644
> > --- a/sound/usb/card.c
> > +++ b/sound/usb/card.c
> > @@ -870,17 +870,28 @@ static void find_last_interface(struct snd_usb_audio *chip)
> >  
> >  /* look for the corresponding quirk */
> >  static const struct snd_usb_audio_quirk *
> > -get_alias_quirk(struct usb_device *dev, unsigned int id)
> > +get_alias_quirk(struct usb_interface *intf, unsigned int id)
> >  {
> >  	const struct usb_device_id *p;
> > +	struct usb_device_id id_alias;
> >  
> >  	for (p = usb_audio_ids; p->match_flags; p++) {
> > -		/* FIXME: this checks only vendor:product pair in the list */
> >  		if ((p->match_flags & USB_DEVICE_ID_MATCH_DEVICE) ==
> >  		    USB_DEVICE_ID_MATCH_DEVICE &&
> >  		    p->idVendor == USB_ID_VENDOR(id) &&
> > -		    p->idProduct == USB_ID_PRODUCT(id))
> > -			return (const struct snd_usb_audio_quirk *)p->driver_info;
> > +		    p->idProduct == USB_ID_PRODUCT(id)) {
> > +			/*
> > +			 * Re-check the aliased entry against the actual
> > +			 * interface descriptors instead of matching only
> > +			 * the vendor/product pair.
> > +			 */
> > +			id_alias = *p;
> > +			id_alias.idVendor = USB_ID_VENDOR(id);
> > +			id_alias.idProduct = USB_ID_PRODUCT(id);
> > +
> > +			if (usb_match_one_id(intf, &id_alias))
> 
> Hmm, is this really a correct logic?
> 
> In this case, USB_ID_VENDOR(id) and USB_ID_PRODUCT(id) are very same
> as p->idVendor and p->idProduct, hence id_alias and *p are identical,
> i.e. you're basically comparing against *p.
> 
> I suppose you wanted to substitute the original device vendor/product
> IDs there instead?

Hi,

Yes, what I actually wanted was to keep the alias lookup by vid:pid, but
validate the additional match fields from the candidate entry against
the real device and interface descriptors.

I was thinking of keeping the initial lookup by the aliased vid:pid and
then explicitly checking only the remaining match bits, such as DEV_CLASS,
DEV_SUBCLASS, DEV_PROTOCOL, INT_CLASS, INT_SUBCLASS, INT_PROTOCOL, INT_NUMBER,
and bcdDevice_lo/hi. Another option would be to build the match object
from the original device ID instead of the aliased one.

I think the first option would be simpler and more direct here, since
the problem is that the current code resolves the alias only by
vendor/product, even though some quirk table entries also depend
on extra descriptor fields. The quirk table already has such entries,
for example USB_DEVICE_VENDOR_SPEC() and USB_AUDIO_DEVICE(), so explicitly
checking those extra fields in get_alias_quirk() seems to fit
the intended logic better.

