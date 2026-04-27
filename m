Return-Path: <linux-usb+bounces-36530-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yM7BGo0t72mb8wAAu9opvQ
	(envelope-from <linux-usb+bounces-36530-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 11:34:05 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDD946FF8E
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 11:34:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BDEF43022F72
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 09:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 162723B2FED;
	Mon, 27 Apr 2026 09:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QRPNySZB"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 411FA2F9D82;
	Mon, 27 Apr 2026 09:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777282355; cv=none; b=m2W/Icg0CA7FlFIQxcAxUIi12JpwBrYfKiWvNTGPEQThNMkapfTEjbrU1ltsR/gFPna1079rzR92FsVhH2lIEsXsYrcQWPgjT4vMbEn6O1gS9CDKdLBh5AzybCln5gMbgfkloI6DmxNuVOlObbrX7I4acyKVPwB/s0ZGxBSWibM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777282355; c=relaxed/simple;
	bh=/+9CFdsM79GHDs6VvRDDETsXUkfLnVFoD6QdQe4Z89M=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F/iraD90k9I9sJ1RO+bxzDod7HyYLpl8737ryhv8HEPPUFTXJvKiqGdNy8VaAZZ6PDb7gxglAmsJQ9eBgcGjmDE8mumahegihEtxilq4S/jca4zgEGbPX/EAmVlsdueBZBBbHPKEtKw0/B/LyRWoCDmFahA4QZbACTviXGGGag4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QRPNySZB; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777282354; x=1808818354;
  h=date:from:to:subject:message-id:references:mime-version:
   content-transfer-encoding:in-reply-to;
  bh=/+9CFdsM79GHDs6VvRDDETsXUkfLnVFoD6QdQe4Z89M=;
  b=QRPNySZBZCQYHigvHIagMSMzdqSUKu4aB/5qtJ1VKp9y52yWtfAEDut9
   HM56Iylo5iihIyvG5SIboBM5DfCBt71jxjfOzRcM6BqhhZxVxl+ykViIA
   dMAOvTsT7sqs2UWB9iZs4txw5QinWhilRUcdnUhtNzQREWBNhV9+4VQrA
   Ulnm0I8BTXCxF8y15bdKJyl8t7L96pgMrmfKihfmpGHVwMLVLeooRaboT
   pnLIy1/HZu9BlOIkxR0xpChlnf+PjrZvYRMC9QiMKjPYMta/2Z8YlQSIc
   Q4hqzd8RAdCKdeFsky2BFYM+lhxSMqlwLcBVBjroRef8ezSOSdaxuJfV+
   A==;
X-CSE-ConnectionGUID: BMq/4seVRzWK0qZxv6x3Og==
X-CSE-MsgGUID: 3q+WwfNDQ62b9miolDyd/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="77870210"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="77870210"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 02:32:34 -0700
X-CSE-ConnectionGUID: 5LSsmvgcSCmGH+4SHVy0Hg==
X-CSE-MsgGUID: +x+uinj5SlCULnQOKGf9wQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="229263690"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 27 Apr 2026 02:32:31 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 205C795; Mon, 27 Apr 2026 11:32:30 +0200 (CEST)
Date: Mon, 27 Apr 2026 12:32:28 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andrei Kuchynski <akuchynski@chromium.org>,
	Johan Hovold <johan@kernel.org>, Jameson Thies <jthies@google.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Hsin-Te Yuan <yuanhsinte@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/3] usb: typec: ucsi: Detect and skip duplicate
 altmodes from buggy firmware
Message-ID: <ae8tLMuLwinxsk04@kuha>
References: <20260413073552.894395-1-acelan.kao@canonical.com>
 <aeCqUma3QeGoIFJL@kuha>
 <aemI6w_dZGpcb2Mi@acelan-Precision-5480>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aemI6w_dZGpcb2Mi@acelan-Precision-5480>
X-Rspamd-Queue-Id: DDDD946FF8E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36530-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[10];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim,canonical.com:email]

Hi,

On Thu, Apr 23, 2026 at 11:09:45AM +0800, Chia-Lin Kao (AceLan) wrote:
> On Thu, Apr 16, 2026 at 12:22:26PM +0300, Heikki Krogerus wrote:
> > On Mon, Apr 13, 2026 at 03:35:49PM +0800, Chia-Lin Kao (AceLan) wrote:
> > > Some firmware implementations incorrectly return the same altmode
> > > multiple times at different offsets when queried via UCSI_GET_ALTERNATE_MODES.
> > > This causes sysfs duplicate filename errors and kernel call traces when
> > > the driver attempts to register the same altmode twice:
> > >
> > >   sysfs: cannot create duplicate filename '/devices/.../typec/port0/port0.0/partner'
> > >   typec-thunderbolt port0-partner.1: failed to create symlinks
> > >   typec-thunderbolt port0-partner.1: probe with driver typec-thunderbolt failed with error -17
> > >
> > > Detect duplicate altmodes by comparing SVID and VDO before registration.
> > > If a duplicate is detected, skip it and print a single clean warning
> > > message instead of generating a kernel call trace:
> > >
> > >   ucsi_acpi USBC000:00: con2: Firmware bug: duplicate partner altmode SVID 0x8087 (VDO 0x8087a043 vs 0x00000001) at offset 1, ignoring. Please update your system firmware.
> > >
> > > This makes the error handling more user-friendly while still alerting
> > > users to the firmware bug.
> > >
> > > The duplicate detection logic is implemented in a reusable helper
> > > function ucsi_altmode_is_duplicate() and used in ucsi_register_altmodes().
> > > The fix applies to all three recipient types: partner (SOP), port (CON),
> > > and plug (SOP_P) altmodes.
> > >
> > > Fixes: a79f16efcd00 ("usb: typec: ucsi: Add support for the partner USB Modes")
> > > Cc: stable@vger.kernel.org
> > > Signed-off-by: Chia-Lin Kao (AceLan) <acelan.kao@canonical.com>
> > > ---
> > > v4. rebase
> > > v3. 1. move ucsi_altmode_is_duplicate() before ucsi_register_altmodes_nvidia()
> > >        for later modification on ucsi_register_altmodes_nvidia()
> > >     2. use struct typec_altmode **altmodes to simplify the logic
> > > ---
> > >  drivers/usb/typec/ucsi/ucsi.c | 76 +++++++++++++++++++++++++++++++++++
> > >  1 file changed, 76 insertions(+)
> > >
> > > diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
> > > index f181afca2bb28..eebbb80fae566 100644
> > > --- a/drivers/usb/typec/ucsi/ucsi.c
> > > +++ b/drivers/usb/typec/ucsi/ucsi.c
> > > @@ -498,6 +498,73 @@ static int ucsi_register_altmode(struct ucsi_connector *con,
> > >  	return ret;
> > >  }
> > >
> > > +/*
> > > + * Check if an altmode is a duplicate. Some firmware implementations
> > > + * incorrectly return the same altmode multiple times, causing sysfs errors.
> > > + * Returns true if the altmode should be skipped.
> > > + */
> > > +static bool ucsi_altmode_is_duplicate(struct ucsi_connector *con, u8 recipient,
> > > +				      const struct ucsi_altmode *alt_batch, int batch_idx,
> > > +				      u16 svid, u32 vdo, int offset)
> > > +{
> > > +	struct typec_altmode **altmodes;
> > > +	const char *recipient_name;
> > > +	int k;
> > > +
> > > +	/* Check for duplicates within the current batch first */
> > > +	for (k = 0; k < batch_idx; k++) {
> > > +		if (alt_batch[k].svid == svid && alt_batch[k].mid == vdo) {
> > > +			dev_warn_once(con->ucsi->dev,
> > > +				      "con%d: Firmware bug: duplicate altmode SVID 0x%04x in same response at offset %d, ignoring. Please update your system firmware.\n",
> > > +				      con->num, svid, offset);
> > > +			return true;
> > > +		}
> > > +	}
> Hi Heikki,
> 
> Thanks for the review.
> 
> >
> > What is this loop meant to do? It will now always return true because
> > the svid is always from one of the altmodes in the alt_batch, no?
> The loop iterates k from 0 to batch_idx - 1, comparing previously seen
> entries against the current entry at batch_idx. It never compares an
> entry against itself — svid and vdo come from alt_batch[batch_idx],
> while k only reaches batch_idx - 1.
> 
> > The "batch" here means what the PPM returns to the GET_ALTERNATE_MODES
> > command (right?), so you can have maximum of two entries in it. So
> > wouldn't it be simpler to just check if there is two (instead of only
> > the one that was requested) altmodes returned, and then just directly
> > compare the two (alt[0].* == alt[1].*)?
> You're right that the standard path has at most 2 entries per
> GET_ALTERNATE_MODES response. However, the helper is also used in
> ucsi_register_altmodes_nvidia() (patch 2/3), where it iterates over
> the full orig[]/updated[] arrays which are UCSI_MAX_ALTMODES in size.
> A direct alt[0] vs alt[1] comparison wouldn't work there.
> 
> Keeping the loop in the helper means both call sites get correct
> duplicate detection without special-casing each one.

I think this could be handled in ucsi_register_altmode() to cover both
cases. You probable just need to pass a bit more information to that
function, but that should be okay.

thanks,

-- 
heikki

