Return-Path: <linux-usb+bounces-31141-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 258A3CA23BE
	for <lists+linux-usb@lfdr.de>; Thu, 04 Dec 2025 04:12:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id CCFB33038760
	for <lists+linux-usb@lfdr.de>; Thu,  4 Dec 2025 03:10:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F0D581F4262;
	Thu,  4 Dec 2025 03:08:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NZPXd/X7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDD23398A
	for <linux-usb@vger.kernel.org>; Thu,  4 Dec 2025 03:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764817720; cv=none; b=Mjc/Qm7U2lyHZwlCFi/vKGuRYLLBOkCzXjCxORPSWNT5DkNG7gQpCUZzzdFAQx6U5LLuns/Ff5ftvgczzTXZpdMKkyghwGlr18yWceiDpamIXYPQ6LORR84ZHGemUAk4ELGy9Dt+dM3ZGr6gR3QG6qWpyyrggaMt2BBppbVxJV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764817720; c=relaxed/simple;
	bh=EAiPrKrqflubP5hRY1blx3OcvbQ+6itZWTJAbnHZgcs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K+v3tRHKLb0aq+y6e5xV/JsQpzI1BvuoSCCobdxH3UuxWUqqmsik0odajL0a9EuSW5gEOSyQetEuPhxogrABw6iR8btlyeYFoCH9h3u7lm//ehUwWGt0rhp4kcNR2jv8gtKtYYq3UcPgH3xjl3hMLSqYgLefTgxoCCO+7tnK17w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NZPXd/X7; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2981f9ce15cso6122195ad.1
        for <linux-usb@vger.kernel.org>; Wed, 03 Dec 2025 19:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764817718; x=1765422518; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:sender:from:to
         :cc:subject:date:message-id:reply-to;
        bh=55O4k4ZXD4VFaVfxfcR+jPByM0PjzKbnUIdncv3jplU=;
        b=NZPXd/X7brhQgpY8F6i//NDAWSwZoObzoCY0bkxx4OKTrs0zN7QoWWSRb5gT7AjXE1
         IZ1cDCM9xt2ZDjFopOTRuYigbd5ZwcWFFDLo5Qn6XqmWUm1M3+sBB+iVEnI9unz6YkIH
         kZ2g9sxoxPuCflbaEjvmmxboox4dfHPYwW1MyYWUICb6g8RPolC0orUOcCC8600T+X4B
         IIjIDm2dAs01PQG3EzAfUXRt9snshsqXc/l2G/WWJsOKEltRekuZbhoRFAGoOcIz1FsN
         FmV9t9Ne219XBq8wajLdrAqt5BdQcqum9WFDBjdxU7nTyqwkpvL1ImmZrh+uS9wYopAA
         OX6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764817718; x=1765422518;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=55O4k4ZXD4VFaVfxfcR+jPByM0PjzKbnUIdncv3jplU=;
        b=oAw0EjWk+Bet77oe0r9kjlOFnuStM/eb235X/NBWku6hBOE9OorHMAsKO8h1gJBZRo
         28L+IUrCo1cdaUTtStjgFk29gu3Kp4cMEY1npnLw9JVz0IrWE1nAfcA4uTLbB2TK1hkQ
         93yqu6YCWslLDH/p9m4UwcyFTD18QfcbHQfEEYt3A/ymE2zoiDfdzJTLEbqEB2Q2vChT
         pdJOgcp29tImwse8+6LMlEQHnJWewmyE6cRnr3jfZp1dob1wFG/g4EpruwgDwKI9J+tZ
         f59Eryuj/lePqtjsnWz8XE8155+bpDzmuccHBgqlQPttLqrjSL5aUbOpQ+JYo5y8xn/+
         fCdg==
X-Forwarded-Encrypted: i=1; AJvYcCV9WHbGwpSVIp689XExsT0iYStObRmPCALagQ4N7E7HhWL6eGOnNfiARQQSQkJxnlbx9Kr/IQmi79k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCf2k6Qmf4yDdLhXBM8ovmDPUTGoaX213lhau8TbsO62cGOFhY
	rhu4X+D03oiagdWdsW4ZhUNUY8gN9H4PpISe+RxocMf9AKvvXnl1C4mI
X-Gm-Gg: ASbGncuuPU4lNPYN4/ORz63LsdiGHb1r6Y0E8SF1VtfWMvkS/OtTkXjCnpAITPB4/aC
	oGW0Q4PLYO4CymfoKpXq6klNzCa7f2t/e9jVsro0vBEYU+oV/zBTyzAZICXYqja9EGHVqdjH375
	IehNzlqRKTDSvATmPeQGOJlaKfeCWcpaLfLGXl+7hUw5TZ2EFAfrYEzXEL4JY06xCtA+iIix6Le
	QrzN0hgSPQmxsAmk6DBOPzp/pp23Ct0gWRLyaOn+xajkokXjF4069/EoWZgtCcw/dQOxwNIje5R
	WqC5hP9f58KzU1gF3bXC3HyFIaHLV3j6JmZVGmpdqLcOLyWLwclZ9d6Grn4aFm1OCg0jnuHkY+g
	/7epZoPr18tFnoLVuPrwE6lQ13Q8QCCBgzy4q/QXtAZE0yKnJ0cxpoJshKtSZaCmJ6+dX+FOaz1
	GfgZa2nwcuU+fwfBWwdMtubg8zFeHFnmUOQYk/lMvfx4Jj4ZuqXRU=
X-Google-Smtp-Source: AGHT+IHaTLoHs0HMk2drWIQIQoCyusqRgQlVjB3SOMXxoMciWOfzN7SrOnVsB53nX/Z2d5MtxziMug==
X-Received: by 2002:a17:903:908:b0:295:596f:84ef with SMTP id d9443c01a7336-29d68413eeamr47708045ad.31.1764817717777;
        Wed, 03 Dec 2025 19:08:37 -0800 (PST)
Received: from localhost (211-75-139-220.hinet-ip.hinet.net. [211.75.139.220])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae49b070sm3300735ad.19.2025.12.03.19.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 19:08:31 -0800 (PST)
Sender: AceLan Kao <acelan@gmail.com>
Date: Thu, 4 Dec 2025 11:08:27 +0800
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Fedor Pchelkin <boddah8794@gmail.com>, 
	Andrei Kuchynski <akuchynski@chromium.org>, Venkat Jayaraman <venkat.jayaraman@intel.com>, 
	Myrrh Periwinkle <myrrhperiwinkle@qtmlabs.xyz>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] usb: typec: ucsi: Detect and skip duplicate
 altmodes from buggy firmware
Message-ID: <36dn5lc3ys3fpw4dd7rmvcc5zltzoriecdipitjw2etzbnhlk2@dcabmutyxktg>
Mail-Followup-To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Fedor Pchelkin <boddah8794@gmail.com>, 
	Andrei Kuchynski <akuchynski@chromium.org>, Venkat Jayaraman <venkat.jayaraman@intel.com>, 
	Myrrh Periwinkle <myrrhperiwinkle@qtmlabs.xyz>, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20251111010541.145421-1-acelan.kao@canonical.com>
 <aRrkLczHJzONnxtT@kuha.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aRrkLczHJzONnxtT@kuha.fi.intel.com>

On Mon, Nov 17, 2025 at 11:00:29AM +0200, Heikki Krogerus wrote:
> Hi,
> 
> Tue, Nov 11, 2025 at 09:05:39AM +0800, Chia-Lin Kao (AceLan) kirjoitti:
> > Some firmware implementations incorrectly return the same altmode
> > multiple times at different offsets when queried via UCSI_GET_ALTERNATE_MODES.
> > This causes sysfs duplicate filename errors and kernel call traces when
> > the driver attempts to register the same altmode twice:
> > 
> >   sysfs: cannot create duplicate filename '/devices/.../typec/port0/port0.0/partner'
> >   typec-thunderbolt port0-partner.1: failed to create symlinks
> >   typec-thunderbolt port0-partner.1: probe with driver typec-thunderbolt failed with error -17
> > 
> > Detect duplicate altmodes by comparing SVID and VDO before registration.
> > If a duplicate is detected, skip it and print a single clean warning
> > message instead of generating a kernel call trace:
> > 
> >   ucsi_acpi USBC000:00: con2: Firmware bug: duplicate partner altmode SVID 0x8087 (VDO 0x8087a043 vs 0x00000001) at offset 1, ignoring. Please update your system firmware.
> > 
> > This makes the error handling more user-friendly while still alerting
> > users to the firmware bug.
> > 
> > The duplicate detection logic is implemented in a reusable helper
> > function ucsi_altmode_is_duplicate() and used in ucsi_register_altmodes().
> > The fix applies to all three recipient types: partner (SOP), port (CON),
> > and plug (SOP_P) altmodes.
> > 
> > Fixes: a79f16efcd00 ("usb: typec: ucsi: Add support for the partner USB Modes")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
> > ---
> >  drivers/usb/typec/ucsi/ucsi.c | 77 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 77 insertions(+)
> > 
> > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> > index 3f568f790f39..7b79e7491094 100644
> > --- a/drivers/usb/typec/ucsi/ucsi.c
> > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > @@ -556,6 +556,74 @@ ucsi_register_altmodes_nvidia(struct ucsi_connector *con, u8 recipient)
> >  	return 0;
> >  }
> >  
> > +/*
> > + * Check if an altmode is a duplicate. Some firmware implementations
> > + * incorrectly return the same altmode multiple times, causing sysfs errors.
> > + * Returns true if the altmode should be skipped.
> > + */
> > +static bool ucsi_altmode_is_duplicate(struct ucsi_connector *con, u8 recipient,
> > +				      const struct ucsi_altmode *alt_batch, int batch_idx,
> > +				      u16 svid, u32 vdo, int offset)
> > +{
> > +	int k;
> > +
> > +	/* Check for duplicates within the current batch first */
> > +	for (k = 0; k < batch_idx; k++) {
> > +		if (alt_batch[k].svid == svid && alt_batch[k].mid == vdo) {
> > +			dev_warn_once(con->ucsi->dev,
> > +				      "con%d: Firmware bug: duplicate altmode SVID 0x%04x in same response at offset %d, ignoring. Please update your system firmware.\n",
> > +				      con->num, svid, offset);
> > +			return true;
> > +		}
> > +	}
> > +
> > +	/* Check for duplicates in already registered altmodes */
> > +	if (recipient == UCSI_RECIPIENT_SOP) {
> > +		for (k = 0; k < UCSI_MAX_ALTMODES; k++) {
> > +			if (!con->partner_altmode[k])
> > +				break;
> > +			/*
> > +			 * Some buggy firmware returns the same SVID multiple times
> > +			 * with different VDOs. This causes duplicate device registration
> > +			 * and sysfs errors. Check SVID only for partner altmodes.
> > +			 */
> > +			if (con->partner_altmode[k]->svid == svid) {
> 
> I'm not sure this works. Some vendor specific modes always come in
> pairs. Check Apple for example. I think you always need to check the
> VID on top of the SVID.
Sorry, just found that my emails were queued/deferred locally.

What does VID means here? USB VID?
I'm not quite understanding what you're trying to do.
Could you elaborate?

> 
> > +				dev_warn(con->ucsi->dev,
> > +					 "con%d: Firmware bug: duplicate partner altmode SVID 0x%04x (VDO 0x%08x vs 0x%08x) at offset %d, ignoring. Please update your system firmware.\n",
> > +					 con->num, svid, con->partner_altmode[k]->vdo,
> > +					 vdo, offset);
> > +				return true;
> > +			}
> > +		}
> > +	} else if (recipient == UCSI_RECIPIENT_CON) {
> > +		for (k = 0; k < UCSI_MAX_ALTMODES; k++) {
> > +			if (!con->port_altmode[k])
> > +				break;
> > +			if (con->port_altmode[k]->svid == svid &&
> > +			    con->port_altmode[k]->vdo == vdo) {
> > +				dev_warn_once(con->ucsi->dev,
> > +					      "con%d: Firmware bug: duplicate port altmode SVID 0x%04x at offset %d, ignoring. Please update your system firmware.\n",
> > +					      con->num, svid, offset);
> > +				return true;
> > +			}
> > +		}
> > +	} else if (recipient == UCSI_RECIPIENT_SOP_P) {
> > +		for (k = 0; k < UCSI_MAX_ALTMODES; k++) {
> > +			if (!con->plug_altmode[k])
> > +				break;
> > +			if (con->plug_altmode[k]->svid == svid &&
> > +			    con->plug_altmode[k]->vdo == vdo) {
> > +				dev_warn_once(con->ucsi->dev,
> > +					      "con%d: Firmware bug: duplicate plug altmode SVID 0x%04x at offset %d, ignoring. Please update your system firmware.\n",
> > +					      con->num, svid, offset);
> > +				return true;
> > +			}
> > +		}
> > +	}
> 
>         struct typec_altmode *altmodes;
> 
>         switch (recipient) {
>         case UCSI_RECIPIENT_CON:
>                 altmodes = con->port->altmode;
>                 break;
>         case UCSI_RECIPIENT_SOP_P:
>                 altmodes = con->plug_altmode;
>                 break;
>         ...
Cool, this make the code cleaner, I'll submit v3 later.

> 
> > +
> > +	return false;
> > +}
> > +
> >  static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
> >  {
> >  	int max_altmodes = UCSI_MAX_ALTMODES;
> > @@ -605,6 +673,15 @@ static int ucsi_register_altmodes(struct ucsi_connector *con, u8 recipient)
> >  			if (!alt[j].svid)
> >  				return 0;
> >  
> > +			/*
> > +			 * Check for duplicates in current batch and already
> > +			 * registered altmodes. Skip if duplicate found.
> > +			 */
> > +			if (ucsi_altmode_is_duplicate(con, recipient, alt, j,
> > +						      alt[j].svid, alt[j].mid,
> > +						      i - num + j))
> > +				continue;
> > +
> >  			memset(&desc, 0, sizeof(desc));
> >  			desc.vdo = alt[j].mid;
> >  			desc.svid = alt[j].svid;
> > -- 
> > 2.43.0
> 
> thanks,
> 
> -- 
> heikki

