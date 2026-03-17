Return-Path: <linux-usb+bounces-34959-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6PLxKFmRuWk5KQIAu9opvQ
	(envelope-from <linux-usb+bounces-34959-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 18:37:29 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 403EE2AFE1C
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 18:37:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id EDDF9307EAF4
	for <lists+linux-usb@lfdr.de>; Tue, 17 Mar 2026 17:35:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C4EF379988;
	Tue, 17 Mar 2026 17:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k21jPG1e"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E28CB334C17
	for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 17:35:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773768922; cv=none; b=RZnieRnr3FsjrpvqUI59khy2zH+9Kuy1PMRbVpIuu9jwmN/hP5g657orHGTVr/QyGehdZwslBiSknov7x7Gsi5eFzvg5agIV9PnLvYdj+yh4QLVfMIlpMQBY1NtrVAmb8mekfd94OhG1eVOIE6F4ThLEQDkhH+zOAFvEyYihHko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773768922; c=relaxed/simple;
	bh=bbyP0zDglMxDyEthHK2Wrlc+5c6i/7FLXGX7aZA4o4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M9nBwMwz4Xm9byGQO8Yoa/8W6oiq7PnTYjAf/xRzKdtQC/FjdzG6vTVoQbS0GUOBcA04qBWLN785ZhO+dRKj71Ol8kW0vVOrsre3REGSXVqEhRArPxG8ikq7Ty7EeYAVBiTCEx6mdyf65RjcJx1XX0JKcTmm7vNFmEAXDxZLTdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k21jPG1e; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2c0e3a2605fso607536eec.0
        for <linux-usb@vger.kernel.org>; Tue, 17 Mar 2026 10:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773768920; x=1774373720; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=PmeQ4Gu7cUOx49kFMbZ+6xRvgevZWes4Jn1cxhIfbz4=;
        b=k21jPG1eYLskZ75zvDeaNAib6IFfIP4rE4bNUNQcwBTeQSScalAMaX8yjg+bIfTR+9
         UsFv1xITSsetO5CaiSjaLKLbFkdpLZA93P6UBnla8WyXK2WmOc9OyyDJ6LlCZIJ2woQ4
         hBYePbB8bPMX7Ed1QUnxX+8DVJwNyPOUSq764bz5y5XVItygvMlprS8of0zomJA6YQEc
         yEAfLi1lp/yZrqiSy1OE7Oeb1TQ8cShVJR7k47jvgenKpZ1a9BP/FRx4uVwmyW1YJqx8
         GHPyH7Wf5W7I8GcY02p6G3LgWDrpawzhNQWEcxGnpfbDD2H65ny4szEDI1/XpFhbPXaN
         X0sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773768920; x=1774373720;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PmeQ4Gu7cUOx49kFMbZ+6xRvgevZWes4Jn1cxhIfbz4=;
        b=BuFnS+LzVujmvGhoWadnWJ6aKi6y9ugzvTAuyEsl25+ImznNHIKa4CxDABPh9m04Oo
         HuL1+GpD3oF0mgPLh4S9BaD/Bq9wodXlT+G2+f0KoBYX95jj9QiZGLg4EtSik5A4QAH2
         Zl+pPvOyqrdLUUVxhzsUQzZH23+/PFA9biOiR+yWYON8uaEJGXETv2RPJVhSPHen+Xw7
         vZuCzTwUfytGc+24oWlS04OdGMLWnifabSV+ph+5nAK0Su3r92vCEFfErLzPWf77CBRd
         RLFRYMs+EcKwMqWDMAiWNuKDNL4+K/62mHxnc9CUtENhUzzv44gNzWV5/lJVvQ2Z7uMU
         1fhQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0rC3bAfTf9pzZduIYwme+6NtAXxfzkcdTyexfRHlI11plstBFRIVmDo01QOO2hybmzWKWshmt8Fo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh3N2lOQADLdjWYcG7HtnacgB/ZBTxItix/JOX6XNRrnq6SZ62
	A8N9Agu7zdFjGnA6BPJf+4QH6Fe3PUvv4F2386n+q61+YEz/Yugd1BVvAZsSrjuc
X-Gm-Gg: ATEYQzwcuhkztnOCKc+PM54XUkR6rpws3zJHJcO9nXBsPdw4j974QM6gl89cDooyzsW
	aGLeRSxqM7wYZLP50rFAloWmN5xDMQK+3ctqqEsr80roOOtVV9ctKJ/YGSqdEG+FTIRMzS8ppKc
	GJVSFdFaLFlo+O8ixHH1XJjU52P9ew5WWvhinuBAyHEWo9DEHthx6/Ls4vzEsILrduJZG7YKnDw
	68l5TYSyXhlVs7RVHvWClL/hjvKdKKIPyguAkeN1CSzNs0AqHn6yFj1zkpWVo3yZh0p+07sJSaV
	CI9oNt5EAXSxsBA0Ngl/hfF0Poo5Ec52Cm5kl9GO8okWMLCld2jjDKXKE4p8MNUm07+e3iiYuBE
	KGUGaaaZ5WxdfftKo7VQ0pcHoSwtwydv49ss4Pqshe3TP2LAsiugXi/cyeNbezlx2CcFUuppnPl
	4vAU/MJPJh5IkrAqCas5D1uRWK+8BHzGI5Gt8vm6iUsZ6MthIFYGwbrlpx+eJc84wYKk1o/g==
X-Received: by 2002:a05:7301:9bc8:b0:2be:8216:57c8 with SMTP id 5a478bee46e88-2c0e5115c54mr117337eec.30.1773768919780;
        Tue, 17 Mar 2026 10:35:19 -0700 (PDT)
Received: from localhost (177-4-160-195.user3p.v-tal.net.br. [177.4.160.195])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e51dd413sm235640eec.0.2026.03.17.10.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 10:35:19 -0700 (PDT)
Date: Tue, 17 Mar 2026 14:35:16 -0300
From: =?utf-8?Q?C=C3=A1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-sound@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: usb-audio: validate full match when resolving
 quirk aliases
Message-ID: <abmJV97A1kaxP4Xv@ortodist>
References: <20260317-alsa-usb-fix-quirk-alias-v2-1-6e531c67f0c8@gmail.com>
 <878qbqg75d.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <878qbqg75d.wl-tiwai@suse.de>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34959-lists,linux-usb=lfdr.de];
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
	RCPT_COUNT_SEVEN(0.00)[7];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 403EE2AFE1C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, Mar 17, 2026 at 10:03:10AM +0100, Takashi Iwai wrote:
> On Tue, 17 Mar 2026 05:22:04 +0100,
> Cássio Gabriel wrote:
> > 
> > get_alias_quirk() resolves a quirk for an aliased USB ID by scanning
> > usb_audio_ids[], but it currently checks only the vendor/product pair.
> > 
> > This is weak for quirk table entries that also depend on additional
> > USB_DEVICE_ID match fields, such as device or interface class,
> > subclass, protocol, interface number, or bcdDevice range.
> > 
> > Rework the alias lookup so that it still uses the aliased vid:pid as
> > the initial lookup key, but validates the remaining match_flags
> > constraints of each candidate entry against the real device and
> > interface descriptors before returning the quirk.
> > 
> > Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
> > ---
> > Changes in v2:
> > - drop the temporary usb_device_id reconstruction approach
> > - validate only the remaining match_flags explicitly
> > - pass struct usb_interface * to get_alias_quirk()
> > - Link to v1: https://lore.kernel.org/r/20260314-alsa-usb-fix-quirk-alias-v1-1-3269998f7ada@gmail.com
> > ---
> >  sound/usb/card.c | 72 +++++++++++++++++++++++++++++++++++++++++++++++++-------
> >  1 file changed, 64 insertions(+), 8 deletions(-)
> > 
> > diff --git a/sound/usb/card.c b/sound/usb/card.c
> > index fd81f32a66fb..153085a77d43 100644
> > --- a/sound/usb/card.c
> > +++ b/sound/usb/card.c
> > @@ -864,21 +864,77 @@ static void find_last_interface(struct snd_usb_audio *chip)
> >  	usb_audio_dbg(chip, "Found last interface = %d\n", chip->last_iface);
> >  }
> >  
> > +/*
> > + * Match aliased vid:pid first, then validate remaining fields against
> > + * the real device and interface descriptors.
> > + */
> > +static bool snd_usb_match_alias_entry(struct usb_interface *intf,
> > +				      const struct usb_device_id *id,
> > +				      u32 alias_id)
> > +{
> > +	struct usb_device *dev = interface_to_usbdev(intf);
> > +	const struct usb_host_interface *alt = intf->cur_altsetting;
> > +	const struct usb_interface_descriptor *intfd = &alt->desc;
> > +	const struct usb_device_descriptor *devd = &dev->descriptor;
> > +	u16 bcd = le16_to_cpu(devd->bcdDevice);
> > +
> > +	/* Match aliased vendor/product */
> > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_VENDOR) &&
> > +	    id->idVendor != USB_ID_VENDOR(alias_id))
> > +		return false;
> > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_PRODUCT) &&
> > +	    id->idProduct != USB_ID_PRODUCT(alias_id))
> > +		return false;
> > +	/* Match real device descriptor constraints */
> > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_LO) &&
> > +	    bcd < id->bcdDevice_lo)
> > +		return false;
> > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_HI) &&
> > +	    bcd > id->bcdDevice_hi)
> > +		return false;
> > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_CLASS) &&
> > +	    devd->bDeviceClass != id->bDeviceClass)
> > +		return false;
> > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_SUBCLASS) &&
> > +	    devd->bDeviceSubClass != id->bDeviceSubClass)
> > +		return false;
> > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_PROTOCOL) &&
> > +	    devd->bDeviceProtocol != id->bDeviceProtocol)
> > +		return false;
> > +	/* Match real interface descriptor constraints */
> > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_INT_CLASS) &&
> > +	    intfd->bInterfaceClass != id->bInterfaceClass)
> > +		return false;
> > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_INT_SUBCLASS) &&
> > +	    intfd->bInterfaceSubClass != id->bInterfaceSubClass)
> > +		return false;
> > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_INT_PROTOCOL) &&
> > +	    intfd->bInterfaceProtocol != id->bInterfaceProtocol)
> > +		return false;
> > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_INT_NUMBER) &&
> > +	    intfd->bInterfaceNumber != id->bInterfaceNumber)
> > +		return false;
> > +
> > +	return true;
> > +}
> 
> Hrm, it became larger than I wished.
> You compared with another implementation and decided to choose this
> version?
> 

Hi,

I went with the explicit matching path in v2 because I wanted to keep
the alias lookup based on the aliased vid:pid while validating the
remaining match_flags against the real descriptors.

> An alternative would be to have a copy of usb_device_id like your
> previous version, and clear match_flags bits with
> ~USB_DEVICE_ID_MATCH_DEVICE.  If match_flags becomes 0, it passes.
> Otherwise call usb_match_one_id().

thanks, that makes sense.

What do you think about this approach?
```
static const struct snd_usb_audio_quirk *
get_alias_quirk(struct usb_interface *intf, unsigned int id)
{
        const struct usb_device_id *p;
        struct usb_device_id match_id;

        for (p = usb_audio_ids; p->match_flags; p++) {
                if ((p->match_flags & USB_DEVICE_ID_MATCH_DEVICE) !=
                    USB_DEVICE_ID_MATCH_DEVICE)
                        continue;

                if (p->idVendor != USB_ID_VENDOR(id) ||
                    p->idProduct != USB_ID_PRODUCT(id))
                        continue;

                match_id = *p;
                match_id.match_flags &= ~USB_DEVICE_ID_MATCH_DEVICE;
                if (!match_id.match_flags || usb_match_one_id(intf, &match_id))
                        return (const struct snd_usb_audio_quirk *)
                                p->driver_info;
        }

        return NULL;
}
```

Thanks,
Cássio.

