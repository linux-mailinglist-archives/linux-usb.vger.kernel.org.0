Return-Path: <linux-usb+bounces-35043-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QEBuDEKVumnSXgIAu9opvQ
	(envelope-from <linux-usb+bounces-35043-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 13:06:26 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 952E32BB396
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 13:06:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 786583017279
	for <lists+linux-usb@lfdr.de>; Wed, 18 Mar 2026 12:06:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51E7C3D3CF8;
	Wed, 18 Mar 2026 12:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LBXcpmF6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08BC37998A
	for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 12:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773835579; cv=none; b=hdAa1JCLCVCcslbxlbYV9u2EGYimLXFDNKXZxQE1YaxpL9dN0TSAzTlKnyaJNCCiChRnXHzL0UK2bOOr4eGIn9cDzwZuFhDktkfxTw4XCZe7LsKTOgOHYYeB0odqY+a5TmHI19s+s5Nrz+wMBQSa3OcNKwhJQBy+0dPke4irPRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773835579; c=relaxed/simple;
	bh=tjVDPwLUWk5i5HJR18PgJWAbXJj+sXaHBNSOnK2FdS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rlELylkCL5SkjKHErafKsgCtP/LQPyDwbA9QT8xT/F6hsb0LdA5aiui+Mw8aTnNaT4WiUWS0GP4lfMe4jQsGOZpKNVGav1AX+HUPA6DHcB+Swng+A/8koP6SN1PGTQRvQKTr+jnICzttLE7tCoVLn7XJxPl5QVFFaC9fPIVKw3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LBXcpmF6; arc=none smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-128b9b7e3edso594349c88.0
        for <linux-usb@vger.kernel.org>; Wed, 18 Mar 2026 05:06:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773835578; x=1774440378; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=svCuu5hiHF3rG9YIC6pMeTrIz+mExhcKjar8Tc2eNgs=;
        b=LBXcpmF6vdpRwb8ULWKFvtzppC8SEjSvj/Bhm3mG4nwh906UN+miMawM7rFLZH0CI9
         kpmdsZ6dQeMUzSORUMyo4UT20nj5nrDymI9jj3p71SXcxwTJaFuRbA55+e6edGKwgJQ9
         vXE74wKFMA+IA4IEhQCbQ5S1SGbVPhWHmecxcMaYGiKymWCrJaRRBrDu77o5KEGqeB5Z
         OViqd/kSlsJW/HgPNcWtqOEYG5xqAE6j8GVnnWqkSuYNNcZL2zvnWr8YXxOBHHuM3NJL
         3WDTG9GHT48zE6FrTXqtbxMCibZOGCJAFRJoOvSvJ56Er/rMAsHN3qPKykM27AuVOpU8
         P+mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773835578; x=1774440378;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=svCuu5hiHF3rG9YIC6pMeTrIz+mExhcKjar8Tc2eNgs=;
        b=qVkP/1Is5hi5zVTpc/SEfRyYxHNTYfdVuD1l+93/yoRmLH2bbhFgHoMW5PvvsOUnFA
         xzPsoXh3p42td0OpWom6tiPllpz0dVFcwX+tXe1w7jUzLe0TUM+/5NJe6Y+EKPqOtxh/
         PWACeVgeW0wBtwjf74ezKfnQlcXtOZduUfGoMzUIG0xS94zIiof6/4w7snohnVEz6JzW
         xx26Q3Ha8VUR08ccPyZlo91qpgB2A3pmu9sr2JEumftvJe8gaBLJ9r7kmtZLNyimN4Tt
         PLrFdJAoFRK8TXQmhJmIpFfwcry2ThxhXSof/2Hi0QMXxELBJVy6yLNLZOdCEWgPTiFk
         8Nwg==
X-Forwarded-Encrypted: i=1; AJvYcCXdJeOX4qjT7LzhcRWotK2/tCyVdIKAj/teap/EAVdKCBXRV2im1CYFfa+57es+kb89YAupUY9/SBA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGrH9wfubL45DrGkuKouTtVRw2lOusX9QyAcTUD7dC+bFbFfcB
	A7cFFVBlWvOZxElbdUU5F8UPp+qXMdwUYUDcHJooI/Lmyuj8WuWlaaDu
X-Gm-Gg: ATEYQzy+qFkQmxy3l5Aw4D1eFoX4xck2XGITQ1XWL8xyJTPKo2x3evH+wbCI1H7AI+l
	IeUDj5xwYIcFkQRYAmK0H757kP+H73TV9c8Z6fWpiy1B9CG7nV2UvTwsKT+Wimuimi0Yw4xjf69
	fwx2fohf2uWqUkVokzAKiFtDmYoecze5FHhZOE7iSd4mUcw4+BWRROeQlP9KqWeWaWh+Maz0yKP
	LHJ4wOE95LyndVLlt40w88LaC6OQJw/AIZJzSTDskfBrBkmNQLEPQjZdYTfBqeJ6GkS97pyi6H8
	c1g+So9+uO2d0i4FZTs+X+VxPIzl39oSQ5b5SRbAU0pUSf99AETxkwTeIXmcIugSnhwl4+GEF+u
	2RwNsRJdFQQOZlVX119MjRv07PdvaEV7qUjgs+1q7OJ7PAFTfx1WlTumXOo6dyNziglFzvlxT1P
	a0jvvA8oSzdPdrixXU9hsDnUtq/4Y0eaHdWHts0BctQ/2Je4/SQ7dx+6LK8nC4/xEQ5Z2qJA==
X-Received: by 2002:a05:7022:523:b0:11d:fd26:234e with SMTP id a92af1059eb24-129a7115f7bmr1513888c88.16.1773835577535;
        Wed, 18 Mar 2026 05:06:17 -0700 (PDT)
Received: from localhost (177-4-160-195.user3p.v-tal.net.br. [177.4.160.195])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-129a723f829sm3893781c88.1.2026.03.18.05.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 05:06:16 -0700 (PDT)
Date: Wed, 18 Mar 2026 09:06:13 -0300
From: =?utf-8?Q?C=C3=A1ssio?= Gabriel <cassiogabrielcontato@gmail.com>
To: Takashi Iwai <tiwai@suse.de>
Cc: Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-sound@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ALSA: usb-audio: validate full match when resolving
 quirk aliases
Message-ID: <abqU93qDlsjK5ZHS@ortodist>
References: <20260317-alsa-usb-fix-quirk-alias-v2-1-6e531c67f0c8@gmail.com>
 <878qbqg75d.wl-tiwai@suse.de>
 <abmJV97A1kaxP4Xv@ortodist>
 <87341xeh9w.wl-tiwai@suse.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87341xeh9w.wl-tiwai@suse.de>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35043-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
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
X-Rspamd-Queue-Id: 952E32BB396
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, Mar 18, 2026 at 08:19:39AM +0100, Takashi Iwai wrote:
> On Tue, 17 Mar 2026 18:35:16 +0100,
> Cássio Gabriel wrote:
> > 
> > On Tue, Mar 17, 2026 at 10:03:10AM +0100, Takashi Iwai wrote:
> > > On Tue, 17 Mar 2026 05:22:04 +0100,
> > > Cássio Gabriel wrote:
> > > > 
> > > > get_alias_quirk() resolves a quirk for an aliased USB ID by scanning
> > > > usb_audio_ids[], but it currently checks only the vendor/product pair.
> > > > 
> > > > This is weak for quirk table entries that also depend on additional
> > > > USB_DEVICE_ID match fields, such as device or interface class,
> > > > subclass, protocol, interface number, or bcdDevice range.
> > > > 
> > > > Rework the alias lookup so that it still uses the aliased vid:pid as
> > > > the initial lookup key, but validates the remaining match_flags
> > > > constraints of each candidate entry against the real device and
> > > > interface descriptors before returning the quirk.
> > > > 
> > > > Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
> > > > ---
> > > > Changes in v2:
> > > > - drop the temporary usb_device_id reconstruction approach
> > > > - validate only the remaining match_flags explicitly
> > > > - pass struct usb_interface * to get_alias_quirk()
> > > > - Link to v1: https://lore.kernel.org/r/20260314-alsa-usb-fix-quirk-alias-v1-1-3269998f7ada@gmail.com
> > > > ---
> > > >  sound/usb/card.c | 72 +++++++++++++++++++++++++++++++++++++++++++++++++-------
> > > >  1 file changed, 64 insertions(+), 8 deletions(-)
> > > > 
> > > > diff --git a/sound/usb/card.c b/sound/usb/card.c
> > > > index fd81f32a66fb..153085a77d43 100644
> > > > --- a/sound/usb/card.c
> > > > +++ b/sound/usb/card.c
> > > > @@ -864,21 +864,77 @@ static void find_last_interface(struct snd_usb_audio *chip)
> > > >  	usb_audio_dbg(chip, "Found last interface = %d\n", chip->last_iface);
> > > >  }
> > > >  
> > > > +/*
> > > > + * Match aliased vid:pid first, then validate remaining fields against
> > > > + * the real device and interface descriptors.
> > > > + */
> > > > +static bool snd_usb_match_alias_entry(struct usb_interface *intf,
> > > > +				      const struct usb_device_id *id,
> > > > +				      u32 alias_id)
> > > > +{
> > > > +	struct usb_device *dev = interface_to_usbdev(intf);
> > > > +	const struct usb_host_interface *alt = intf->cur_altsetting;
> > > > +	const struct usb_interface_descriptor *intfd = &alt->desc;
> > > > +	const struct usb_device_descriptor *devd = &dev->descriptor;
> > > > +	u16 bcd = le16_to_cpu(devd->bcdDevice);
> > > > +
> > > > +	/* Match aliased vendor/product */
> > > > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_VENDOR) &&
> > > > +	    id->idVendor != USB_ID_VENDOR(alias_id))
> > > > +		return false;
> > > > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_PRODUCT) &&
> > > > +	    id->idProduct != USB_ID_PRODUCT(alias_id))
> > > > +		return false;
> > > > +	/* Match real device descriptor constraints */
> > > > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_LO) &&
> > > > +	    bcd < id->bcdDevice_lo)
> > > > +		return false;
> > > > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_HI) &&
> > > > +	    bcd > id->bcdDevice_hi)
> > > > +		return false;
> > > > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_CLASS) &&
> > > > +	    devd->bDeviceClass != id->bDeviceClass)
> > > > +		return false;
> > > > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_SUBCLASS) &&
> > > > +	    devd->bDeviceSubClass != id->bDeviceSubClass)
> > > > +		return false;
> > > > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_DEV_PROTOCOL) &&
> > > > +	    devd->bDeviceProtocol != id->bDeviceProtocol)
> > > > +		return false;
> > > > +	/* Match real interface descriptor constraints */
> > > > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_INT_CLASS) &&
> > > > +	    intfd->bInterfaceClass != id->bInterfaceClass)
> > > > +		return false;
> > > > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_INT_SUBCLASS) &&
> > > > +	    intfd->bInterfaceSubClass != id->bInterfaceSubClass)
> > > > +		return false;
> > > > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_INT_PROTOCOL) &&
> > > > +	    intfd->bInterfaceProtocol != id->bInterfaceProtocol)
> > > > +		return false;
> > > > +	if ((id->match_flags & USB_DEVICE_ID_MATCH_INT_NUMBER) &&
> > > > +	    intfd->bInterfaceNumber != id->bInterfaceNumber)
> > > > +		return false;
> > > > +
> > > > +	return true;
> > > > +}
> > > 
> > > Hrm, it became larger than I wished.
> > > You compared with another implementation and decided to choose this
> > > version?
> > > 
> > 
> > Hi,
> > 
> > I went with the explicit matching path in v2 because I wanted to keep
> > the alias lookup based on the aliased vid:pid while validating the
> > remaining match_flags against the real descriptors.
> > 
> > > An alternative would be to have a copy of usb_device_id like your
> > > previous version, and clear match_flags bits with
> > > ~USB_DEVICE_ID_MATCH_DEVICE.  If match_flags becomes 0, it passes.
> > > Otherwise call usb_match_one_id().
> > 
> > thanks, that makes sense.
> > 
> > What do you think about this approach?
> > ```
> > static const struct snd_usb_audio_quirk *
> > get_alias_quirk(struct usb_interface *intf, unsigned int id)
> > {
> >         const struct usb_device_id *p;
> >         struct usb_device_id match_id;
> > 
> >         for (p = usb_audio_ids; p->match_flags; p++) {
> >                 if ((p->match_flags & USB_DEVICE_ID_MATCH_DEVICE) !=
> >                     USB_DEVICE_ID_MATCH_DEVICE)
> >                         continue;
> > 
> >                 if (p->idVendor != USB_ID_VENDOR(id) ||
> >                     p->idProduct != USB_ID_PRODUCT(id))
> >                         continue;
> > 
> >                 match_id = *p;
> >                 match_id.match_flags &= ~USB_DEVICE_ID_MATCH_DEVICE;
> >                 if (!match_id.match_flags || usb_match_one_id(intf, &match_id))
> >                         return (const struct snd_usb_audio_quirk *)
> >                                 p->driver_info;
> >         }
> > 
> >         return NULL;
> > }
> > ```
> 
> Yes, that's what I had in mind.
> 
> 
> thanks,
> 
> Takashi

Nice, I'm going to send you the v3 patch with the fixes.


Thanks,
Cássio.

