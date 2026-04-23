Return-Path: <linux-usb+bounces-36427-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GFhnD5SN6WlwdAIAu9opvQ
	(envelope-from <linux-usb+bounces-36427-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 05:10:12 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id D90D744C775
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 05:10:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E0BC130067B0
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 03:10:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48F323C942A;
	Thu, 23 Apr 2026 03:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b="Fj99squK"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A39DC2459C6
	for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2026 03:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776913806; cv=none; b=b494/n/HMrYnMmO4bhw4soFVjkhwtf7FrC/MLQgBaaEe9hcVkutfBA6wKK5U4udNScJPo/3pNVv8HtE1k5yLrUWu/fyOUuYJCKGbr6CDgZy1RGjFeJyB2LQV7CS+4IgmH1tkWQvHiOwvD3G0wzIfABN26V59gNF2jrP0p5M7UPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776913806; c=relaxed/simple;
	bh=3t0l3gMMeWMD9lp65k899WWBu1BjHKjguWXMvyJAzDQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uM+jBzOc/MH8Z1kty2M1AAVdyIKCEvahT2imxynyVlgrlnGXxqbB3UdGRGqKwmrBOseTmn7rU9bwecar1P8seIQX2RyFx4rnp0948SQZe4w6E4nqnUOA11ZaWTDfiHqVep4EzD/cVBNgfxKkeIIbnfZvFI8aNZGeQ3F7C4/I1Ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (4096-bit key) header.d=canonical.com header.i=@canonical.com header.b=Fj99squK; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E7B8E3F9BE
	for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2026 03:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20251003; t=1776913802;
	bh=f1t1TfEbM6EUmmDnje7F2cVFBM8v6Nbob2+CbpK0PkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:In-Reply-To;
	b=Fj99squKr9c6s3/nJCmFjaGXCCNWKTznbHru9IfymBbLVQhzh+v0ksyFMSqAfOxNd
	 NSOJOohKTkLAqqUsRgFy4JPCoQm47mKRemENdZneYwRI6WIXiBCfcJe3AAwOuDRVjL
	 mX7TyQlUzNBE/+9kjZDwBZv1Wsn0swz/SrPWW4fvmFkwE+TPbA+FlKIDQT7eXPJKiy
	 Z8An0okkakx/yvqXpUp/isaMfiIVkzdgGGOjIWeZRhfSFzRduMchniAbKJbGDJ2Qe9
	 6bfSmhFryGyN9p7OvUGZVg8H0jQw6xa63yBn5VC4XKSm0ZMYbB1reftQsbj5bsHEOW
	 e+JFpCRpOYQUx8amZ3+Gsj2Z2qI8iVMio/IY5P6QcLcWvGl3b0flrcIe3KGOygZFeK
	 69Fc9W6znBiKSBthloRRAH+Mfg7h2NeqULktgwfgDhzwVAJeCQZ/iyAGSTIGL8xys4
	 RJKm6Hgi0GOBEh9yc5lZvWaz+KfrkIrCiJPhVmWbpkwMo21X69Ss5XGXHpzymR4jGx
	 nzsBS+DiVmCrilNxgptSMvMXxsMEpQ3beFokYADADHsWahAOeRRXGM9QHVL8shThpC
	 fDkDPpgcYZEU2dB+nIPGEwNV7R4GqheesT5J0l0s83lHVyqCAC2dQzRPaMd9SMH7OK
	 GYEQ643F5WrrqgAdS/Totee0=
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b458add85aso62107145ad.2
        for <linux-usb@vger.kernel.org>; Wed, 22 Apr 2026 20:10:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776913800; x=1777518600;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f1t1TfEbM6EUmmDnje7F2cVFBM8v6Nbob2+CbpK0PkA=;
        b=LK8S0a1+Jk/bReOMNISd/2gjHt4ouGJhfrZTDQ/oC4ozchwqJ50EMbAqwT76J0tyaL
         bYUbhpFfCyqjnhPfSWdXOnxeIAT75JLn7I3TdutSPTPoo7i9N4y4Lm4OMwCn8xXBTM3v
         jz/OakMhoXWDQV2kOfZ9AXfyMg65Ei9vPp+PpW2WuSPfjQWMHctb1w7MivgR4WrCHe5/
         IAj7FbftuS/j00N9GgX7r0o0MCTNBw9Pe+NY73YR3TUiIyEd1v9DTiyRMfd8OTa9SMoO
         ntgL6+/5B0UGN1cVKk0zchxfpdnBGwxSJjzZd0If0SGdEGLr0OOcPqHalFYUgwyno2NA
         f5zQ==
X-Forwarded-Encrypted: i=1; AFNElJ98PLoLdybPV7U44BHCY5gKn2PasSVjZVQ3Bk/TOEE3ahp+/WXzM6MmJUB6BthSeUQpbXU6aCaFrD0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5IZtT3uixpdclR9Cjpja9vd3RMgBtTngQC7Z//xn6Vim4i26u
	22pn6JVMjIzQNmQQepYNAbj374dsvgRWIaMXfgutWlBUBU2pH+G1Jaat0dKCCfG3oa2MPphmh4c
	r0bT16sOUZWav0oVZDzd324esknzZvJH+wDFLeyT3ugLQ81A6/912vzwD3RnJmTma4SiXjNqK1q
	HX4Q==
X-Gm-Gg: AeBDievLpwc53LAb8p2dtcMcGnYuKOL91lCJkFZnbSHkWUjHdthcQuoAZJiqFRMrtvM
	zPV55wR3zWtbEr81vElC3ieYraz59NDCH7OQo0KjjWUXCJEH+A+YUux4xPtzgd5TmIkN3IC4Tpf
	DcV5bwGnKceyEQKupS8uzuD80IpTa5txUmtWz4/U3HFegmEu5hyBHKE10hZcHL1IcUUvuBkbiu3
	uOfnYcQOSGXTFbeVGfQSXJ87IFiAFOUpgCSEn4XwKnBFxQbqKRbhxKrasC52FVAxuZH8BjA7/0J
	4BIuByt+UDKsZUIwf4rejtjjCn5SZX7JKgsUkCjVB3ZfPeJuKWZsjXGUoYEbMPa8Q8ndCrxrBbP
	GlvKIolF1hdSW2CMlDoLc7E6hyxye+ztePCnL2LUmfA==
X-Received: by 2002:a17:903:fa3:b0:2b2:ebed:7af8 with SMTP id d9443c01a7336-2b5f9e5df98mr264556015ad.1.1776913800266;
        Wed, 22 Apr 2026 20:10:00 -0700 (PDT)
X-Received: by 2002:a17:903:fa3:b0:2b2:ebed:7af8 with SMTP id d9443c01a7336-2b5f9e5df98mr264555695ad.1.1776913799838;
        Wed, 22 Apr 2026 20:09:59 -0700 (PDT)
Received: from acelan-Precision-5480 ([2001:67c:1562:8007::aac:4468])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab0cb92sm171657645ad.50.2026.04.22.20.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 20:09:59 -0700 (PDT)
Date: Thu, 23 Apr 2026 11:09:45 +0800
From: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andrei Kuchynski <akuchynski@chromium.org>, Johan Hovold <johan@kernel.org>, 
	Jameson Thies <jthies@google.com>, Pooja Katiyar <pooja.katiyar@intel.com>, 
	Hsin-Te Yuan <yuanhsinte@chromium.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] usb: typec: ucsi: Detect and skip duplicate
 altmodes from buggy firmware
Message-ID: <aemI6w_dZGpcb2Mi@acelan-Precision-5480>
Mail-Followup-To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andrei Kuchynski <akuchynski@chromium.org>, Johan Hovold <johan@kernel.org>, 
	Jameson Thies <jthies@google.com>, Pooja Katiyar <pooja.katiyar@intel.com>, 
	Hsin-Te Yuan <yuanhsinte@chromium.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260413073552.894395-1-acelan.kao@canonical.com>
 <aeCqUma3QeGoIFJL@kuha>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aeCqUma3QeGoIFJL@kuha>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[canonical.com,reject];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[canonical.com:s=20251003];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[canonical.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36427-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[acelan.kao@canonical.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[canonical.com:dkim,canonical.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D90D744C775
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Thu, Apr 16, 2026 at 12:22:26PM +0300, Heikki Krogerus wrote:
> On Mon, Apr 13, 2026 at 03:35:49PM +0800, Chia-Lin Kao (AceLan) wrote:
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
> > v4. rebase
> > v3. 1. move ucsi_altmode_is_duplicate() before ucsi_register_altmodes_nvidia()
> >        for later modification on ucsi_register_altmodes_nvidia()
> >     2. use struct typec_altmode **altmodes to simplify the logic
> > ---
> >  drivers/usb/typec/ucsi/ucsi.c | 76 +++++++++++++++++++++++++++++++++++
> >  1 file changed, 76 insertions(+)
> >
> > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> > index f181afca2bb28..eebbb80fae566 100644
> > --- a/drivers/usb/typec/ucsi/ucsi.c
> > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > @@ -498,6 +498,73 @@ static int ucsi_register_altmode(struct ucsi_connector *con,
> >  	return ret;
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
> > +	struct typec_altmode **altmodes;
> > +	const char *recipient_name;
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
Hi Heikki,

Thanks for the review.

>
> What is this loop meant to do? It will now always return true because
> the svid is always from one of the altmodes in the alt_batch, no?
The loop iterates k from 0 to batch_idx - 1, comparing previously seen
entries against the current entry at batch_idx. It never compares an
entry against itself — svid and vdo come from alt_batch[batch_idx],
while k only reaches batch_idx - 1.

> The "batch" here means what the PPM returns to the GET_ALTERNATE_MODES
> command (right?), so you can have maximum of two entries in it. So
> wouldn't it be simpler to just check if there is two (instead of only
> the one that was requested) altmodes returned, and then just directly
> compare the two (alt[0].* == alt[1].*)?
You're right that the standard path has at most 2 entries per
GET_ALTERNATE_MODES response. However, the helper is also used in
ucsi_register_altmodes_nvidia() (patch 2/3), where it iterates over
the full orig[]/updated[] arrays which are UCSI_MAX_ALTMODES in size.
A direct alt[0] vs alt[1] comparison wouldn't work there.

Keeping the loop in the helper means both call sites get correct
duplicate detection without special-casing each one.

>
> > +	/* Check for duplicates in already registered altmodes */
> > +
> > +	switch (recipient) {
> > +	case UCSI_RECIPIENT_CON:
> > +		altmodes = con->port_altmode;
> > +		recipient_name = "port";
> > +		break;
> > +	case UCSI_RECIPIENT_SOP:
> > +		altmodes = con->partner_altmode;
> > +		recipient_name = "partner";
> > +		break;
> > +	case UCSI_RECIPIENT_SOP_P:
> > +		altmodes = con->plug_altmode;
> > +		recipient_name = "plug";
> > +		break;
> > +	default:
> > +		return false;
> > +	}
> > +
> > +	for (k = 0; k < UCSI_MAX_ALTMODES; k++) {
> > +		if (!altmodes[k])
> > +			break;
> > +
> > +		/* Check SVID for all, VDO only for non-SOP */
> > +		if (altmodes[k]->svid != svid)
> > +			continue;
> > +		if (recipient != UCSI_RECIPIENT_SOP && altmodes[k]->vdo != vdo)
> > +			continue;
> > +
> > +		if (recipient == UCSI_RECIPIENT_SOP) {
> > +			dev_warn(con->ucsi->dev,
> > +				 "con%d: Firmware bug: duplicate %s altmode SVID 0x%04x (VDO 0x%08x vs 0x%08x) at offset %d, ignoring. Please update your system firmware.\n",
> > +				 con->num, recipient_name, svid, altmodes[k]->vdo, vdo, offset);
> > +		} else {
> > +			dev_warn_once(con->ucsi->dev,
> > +				      "con%d: Firmware bug: duplicate %s altmode SVID 0x%04x at offset %d, ignoring. Please update your system firmware.\n",
> > +				      con->num, recipient_name, svid, offset);
>
> You have to clean up these prints. Provide a helper function for them.
> You can split the print in two. A generic part, and separate for
> details if necessary.
>
> With the "recipient_name" I would use a lookup table.
Good idea, will do this in v5.

> > +		}
> > +		return true;
> > +	}
> > +
> > +	return false;
> > +}
>
> thanks,
>
> --
> heikki

