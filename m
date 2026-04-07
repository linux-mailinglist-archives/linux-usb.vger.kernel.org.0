Return-Path: <linux-usb+bounces-36045-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QKhuF+L21GkjywcAu9opvQ
	(envelope-from <linux-usb+bounces-36045-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 07 Apr 2026 14:21:54 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id BC4F53AE3F8
	for <lists+linux-usb@lfdr.de>; Tue, 07 Apr 2026 14:21:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 04A03304CA70
	for <lists+linux-usb@lfdr.de>; Tue,  7 Apr 2026 12:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D05853AE199;
	Tue,  7 Apr 2026 12:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WMLuCcvi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 232313947A9
	for <linux-usb@vger.kernel.org>; Tue,  7 Apr 2026 12:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775564312; cv=none; b=gIqGDHMtFVpRTcX7Wop6jWXDxZ2tufwh3c7RCMqC+vPxNkVcuMGpsDH7vO25MKML4k2T/jernn1gxEdnPb8PSIT9bsC4qO/SxYm/QAZTAo8aGUPCN5UzeSFCScB2BH5HlvO3ndiOlaDo/dwMiwvNN+TcVynAL4cxYPYcqYeOvXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775564312; c=relaxed/simple;
	bh=a701RaR/dQrAERZHSh0YAcH7S2e4ZJlWp4IlOzbc3cM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jJixsERJioqI5FV8r8f0RrF3oIJE4SpfbyUvPo+8D/NWDQO9xwxiwCn+kZICAwIqfwP3RH3GtHVxMUo7y0Bny0IHmqGNZxhqtLCBDu7HkFqMgd88BFnaYfofRomge5N/m1+Ro6BDsZLNhLi12WlzE//C/iTwyxmnNEs9yzEu9ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WMLuCcvi; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775564311; x=1807100311;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=a701RaR/dQrAERZHSh0YAcH7S2e4ZJlWp4IlOzbc3cM=;
  b=WMLuCcviwYuCcBB+UaD8l+etrrbdpqfWPBEljdBHFawq1vbvQRZ/1uW1
   tUXmkuV9lx+dkhUkqhaC22saa1987dASXOpW/s68gmZuX9L7KYhb6yR8a
   3I9G+KOSQc0jOJ6E1eyNawPe62jG1k6daFpsEHc1yxjBVEF5XrTv93gk6
   wSkIdH/C0x7reKaPTBjcFfrqnrlmI4XbQF/ggpT9SUQW+h9jQYCn2uPZJ
   REck6CMH0KDzelxdJBMpulYZP84C2nX3FVkCRUU+CBKqYO8c1KTCvMwEZ
   Np8lr4LCwZxKcIux5++FOG4moaamu10G4zRGfQEiYLAcyR8796N/sb2LW
   w==;
X-CSE-ConnectionGUID: eAyiShoHQw2E3dIdAHerpw==
X-CSE-MsgGUID: cQxN0+cUS+u7L5Ey2J+0tw==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="64070065"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="64070065"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 05:18:30 -0700
X-CSE-ConnectionGUID: 78DSzFA3T3auDrfN1Rke5A==
X-CSE-MsgGUID: PUb8BFQcS6+HIfq+kjYT7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="228061646"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 07 Apr 2026 05:18:30 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 89B7495; Tue, 07 Apr 2026 14:18:28 +0200 (CEST)
Date: Tue, 7 Apr 2026 15:17:39 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: =?iso-8859-1?Q?Fran=E7ois?= Scala <francois@scala.name>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: typec: altmode: Fix altmode to handle multiple
 parners
Message-ID: <adT144chxkINLk63@kuha>
References: <20260402120433.22967-1-francois@scala.name>
 <ac5uh_3N3q61efIb@kuha>
 <8cef8b26-71ce-4fdf-a514-111d9760634c@scala.name>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8cef8b26-71ce-4fdf-a514-111d9760634c@scala.name>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36045-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: BC4F53AE3F8
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi François,

Thank you for the info.

On Thu, Apr 02, 2026 at 08:10:09PM +0200, François Scala wrote:
> Hi,
> 
> On 02/04/2026 15.26, Heikki Krogerus wrote:
> > No. You can not have more than a single partner per mode. Let's figure
> > out the root issue. Please check the svids of the partner altmodes:
> > 
> >          grep . /sys/class/typec/port0-partner/port0-partner.*/svid
> 
> /sys/class/typec/port2-partner/port2-partner.0/svid:8087
> /sys/class/typec/port2-partner/port2-partner.1/svid:8087

Okay, the other svid should almost certainly be ff01 (the DisplayPort
Alternate Mode), most likely the second one (port2-partner.1). 8087 is
the Thunderbolt Alternate Mode, and it should now be always companied
by the DisplayPort Alternate Mode.

>      kworker/5:2-321     [005] .....   465.001617: ucsi_connector_change:
> port3 status: change=4000, opmode=4, connected=1, sourcing=1,
> partner_flags=1, partner_type=2, request_data_obj=00000000, BC status=1
>      kworker/5:2-321     [005] .....   465.111779: ucsi_connector_change:
> port3 status: change=0060, opmode=3, connected=1, sourcing=1,
> partner_flags=1, partner_type=2, request_data_obj=13800000, BC status=1
>      kworker/8:1-174     [008] .....   465.429999: ucsi_connector_change:
> port3 status: change=1000, opmode=5, connected=1, sourcing=0,
> partner_flags=1, partner_type=2, request_data_obj=13800000, BC status=1
>      kworker/8:1-174     [008] .....   465.532708: ucsi_connector_change:
> port3 status: change=0060, opmode=3, connected=1, sourcing=0,
> partner_flags=1, partner_type=2, request_data_obj=42c4b12c, BC status=1
>     kworker/10:1-178     [010] .....   465.883679: ucsi_connector_change:
> port3 status: change=0060, opmode=3, connected=1, sourcing=0,
> partner_flags=1, partner_type=2, request_data_obj=42c7a9ea, BC status=1
>      kworker/3:0-13120   [003] .....   466.330330: ucsi_connector_change:
> port3 status: change=0060, opmode=3, connected=1, sourcing=0,
> partner_flags=1, partner_type=2, request_data_obj=82c7d1f4, BC status=1
>    kworker/u64:2-356     [005] .....   466.890372: ucsi_register_altmode:
> partner alt mode: svid 8087, mode 1 vdo 8087a843

Here the vdo seems to be corrupted in the response to the
GET_ALTERNATE_MODES command.

As you can see, the first 16-bits in the vdo is clearly the TBT svid
again even though the vdo should contain the actual Vendor Defined Object
for the TBT alt mode.

>    kworker/u64:2-356     [005] .....   467.005141: ucsi_register_altmode:
> partner alt mode: svid 8087, mode 2 vdo 1

And here the firmware is returning the TBT SVID again for the second
time, now with vdo that looks almost valid to me. This should not
happen.

The responses to the GET_ALTERNATE_MODES look similar to what we see
on some of the Dell laptops. The response seems almost as if it's
customised some how. It's almost as if the first run of the command
will return some kind of a list of the SVIDs, and the standard
responses start only after the second run of the command.

> > For acpidump you need the acpica-tools installed:
> > 
> >          acpidump -o my_acpi.dump
> 
> The file is quite large, how can I share it ? Or do you need a specific part
> ?
> 
>   -rw-r--r-- 1 fs fs 4.7M Apr  2 19:05 acpi-port3-20260402.dump

It does not look that big. Compress and send to me (drop the list if
you prefer)?

I still have no idea which system are you running? Can you send the
dmesg output from freshly booted machine?

thanks,

-- 
heikki

