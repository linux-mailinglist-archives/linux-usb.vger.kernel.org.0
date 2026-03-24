Return-Path: <linux-usb+bounces-35372-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WJBIEBJdwmlKcAQAu9opvQ
	(envelope-from <linux-usb+bounces-35372-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 10:44:50 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C350B305D0E
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 10:44:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id D78B83016BB1
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2026 09:44:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A24B3DD536;
	Tue, 24 Mar 2026 09:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fW0xGO3F"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC5053DCD88;
	Tue, 24 Mar 2026 09:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774345485; cv=none; b=t2Ka9elMMFYXdKzPheNaKT3SiIAtYu4Qe4iRmAXOI/V+D1PdftmETxZHxYXRzmVwjH0GsGkRJzIS6jNvlfZaOA4c0/Qgb6YI/zxP8BFj91Og+YLQLTi+l9MuFG0DLn2J2Fi2hRsCW4oszPyBBOORlBiqq8sl8DwUpYiRucYX9Ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774345485; c=relaxed/simple;
	bh=Gnp/JzsQshL/y7bfE5XIuAqulYP4yCWXKNNeS5cCKTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FUWHrdKuH6xs/n5wultGtb9//qXnutNyPXB+sr0fpKb5134k3LNhP/ft4tv4rLcfTmu6z+JVt1iHW87kN5+shsQ9MBwv39IPS/3apvBqdwxJFyCcAfQj/p1VUUmLF/sVJLAI50fRRfacR7pXiGGuh7MARpForMy0kheaT4Lm3SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fW0xGO3F; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774345484; x=1805881484;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Gnp/JzsQshL/y7bfE5XIuAqulYP4yCWXKNNeS5cCKTk=;
  b=fW0xGO3FEH3eIK2hRD2Ury0xk36yCeMNzyDEi1NqdeYbHI0cXA72KlV3
   W+MljMQIEsFEKOCdiUDbbAYQ+N3ZpeegxJ+CJDyGG111VAbPueyPs8dZw
   fQ6DuHGsovlF7qK4HVjjEwcb2IxXlR0Z0+DTnq4MSB8uFtEoC7smcRcFo
   uu6d4PpHj7EmoDDlAaSZSPIqLaB7JFcbRNJAlWh32trDPhrDqOaBEPsRF
   Il15FaJUBpfDxR4V+EAT9LQPqEJfGFNEziTsO+EPtfKXvhDDqMpB4Kx52
   jsqJtYoVmo3UnhjPeb80IwmdgpHaLEAgg5ORb/hmVY+jDJGaGhsYRcQ8N
   w==;
X-CSE-ConnectionGUID: FCW9CCt/Q1OwhlteJXSoYA==
X-CSE-MsgGUID: Iyh+CWoMSJ+ABEZlmrRrtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11738"; a="75549597"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="75549597"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 02:44:43 -0700
X-CSE-ConnectionGUID: ozyZBBx2S8y8eU6rir3YyQ==
X-CSE-MsgGUID: JrdIaezSR1OtYoaQ6L3W9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="254786377"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa002.jf.intel.com with ESMTP; 24 Mar 2026 02:44:42 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id 9489295; Tue, 24 Mar 2026 10:44:40 +0100 (CET)
Date: Tue, 24 Mar 2026 11:43:56 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Andrei Kuchynski <akuchynski@chromium.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Madhu M <madhu.m@intel.corp-partner.google.com>
Subject: Re: [PATCH] usb: typec: Remove alt->adev.dev.class assignment
Message-ID: <acJc3AWs2oNIveAD@kuha>
References: <20260324083818.686269-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260324083818.686269-1-akuchynski@chromium.org>
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35372-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,chromium.org:email]
X-Rspamd-Queue-Id: C350B305D0E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Tue, Mar 24, 2026 at 08:38:18AM +0000, Andrei Kuchynski kirjoitti:
> The typec plug alternate mode is already registered as part of the bus.
> When both class and bus are set for a device, device_add() attempts to
> create the "subsystem" symlink in the device's sysfs directory twice, once
> for the bus and once for the class.
> This results in a duplicate filename error during registration,
> causing the alternate mode registration to fail with warnings:
> 
> cannot create duplicate filename '/devices/pci0000:00/0000:00:1f.0/
>   PNP0C09:00/GOOG0004:00/cros-ec-dev.1.auto/cros_ec_ucsi.3.auto/typec/
>   port1/port1-cable/port1-plug0/port1-plug0.0/subsystem'
> typec port0-plug0: failed to register alternate mode (-17)
> cros_ec_ucsi.3.auto: failed to registers svid 0x8087 mode 1
> 
> Tested-by: Madhu M <madhu.m@intel.corp-partner.google.com>
> Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>

Thanks for the patch. This needs to be marked as a fix:

Fixes: 67ab45426215 ("usb: typec: Set the bus also for the port and plug altmodes")

thanks,

> ---
>  drivers/usb/typec/class.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index 8314309094719..0977581ad1b6e 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -686,10 +686,6 @@ typec_register_altmode(struct device *parent,
>  
>  	alt->adev.dev.bus = &typec_bus;
>  
> -	/* Plug alt modes need a class to generate udev events. */
> -	if (is_typec_plug(parent))
> -		alt->adev.dev.class = &typec_class;
> -
>  	ret = device_register(&alt->adev.dev);
>  	if (ret) {
>  		dev_err(parent, "failed to register alternate mode (%d)\n",
> -- 
> 2.53.0.983.g0bb29b3bc5-goog

-- 
heikki

