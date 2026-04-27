Return-Path: <linux-usb+bounces-36521-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uETOJdYh72lV7gAAu9opvQ
	(envelope-from <linux-usb+bounces-36521-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 10:44:06 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 33F7746F46D
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 10:44:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 9556730191A7
	for <lists+linux-usb@lfdr.de>; Mon, 27 Apr 2026 08:39:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBCD539B4A5;
	Mon, 27 Apr 2026 08:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d/RMeQWa"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D8EB399004
	for <linux-usb@vger.kernel.org>; Mon, 27 Apr 2026 08:39:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777279153; cv=none; b=WE5qQB7ZbR+4Xn91IiApncBRAujKetm34KtOCEnXysPAJrXG3/UH1DCeNbbjlbTiZXH21KVQa8NnBANl2izK2yVpwpXfrEyZXhMbPpqwkarq4HZU3LaOfFmc/xNiI5NX4QG+ppq5xpSGbjrkklekIvdEhREHJPyY5XQhpOonS+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777279153; c=relaxed/simple;
	bh=2DcBJsqBcjLhy4vfdagro6yXUs+8LFEzaKk9tIyFTpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ck2ZSgjbkqreccelLmgoms9DSCfnGLgDdzzLG9+IfNpNWREa7AWSwbGzDLloITkROmiOqwGXrA+TH4l7HIYrtLF7+a+3xO8mNrvW8d3eBTMvm9/vJLDZKA+toEQfm15AW24WlhDEsKBNbpl+H07skjSJMEP8t3CSW37NopEimgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d/RMeQWa; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777279153; x=1808815153;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2DcBJsqBcjLhy4vfdagro6yXUs+8LFEzaKk9tIyFTpU=;
  b=d/RMeQWaIJWmjTv2/tTUbiEUwVga7wjuJjHNIBBWtA/SZm155Gxd4Mu+
   1TVE4tRX7zsZlsq/Rge0SI4hdkVRQlaGdAkppItbBxGzzp8KfaDQxh8Al
   QAmfco2VF4ugHCqLGw2R+t3aglouqD+oA/h/zg9LqWl28h84fEjpEHg9e
   S7FoG5m6vvjIukuMgQtwWyI7RG0W+kx7/WAaBNoTo/tapPoYcYKLhQkec
   759hDNw7Yyl51tuyDBD/jImAZtBdJvBzPUisNelKTC8zaxa9UbfgLc8Qa
   TuC8o8Ej3GavY2SGX0/9pBrjSlvaKtGP1g6iiajVXgxuZ2s22Vtm+h8Ry
   A==;
X-CSE-ConnectionGUID: P1uE1jYVT9+ehuGbTam29w==
X-CSE-MsgGUID: RxSbcwFcT2qS4wLv876AKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11768"; a="78078200"
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="78078200"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Apr 2026 01:39:12 -0700
X-CSE-ConnectionGUID: OFdToTRjQvmRHpBZN6UESA==
X-CSE-MsgGUID: ckGsLMaJS4adoolrCLF4xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,201,1770624000"; 
   d="scan'208";a="233848434"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 27 Apr 2026 01:39:10 -0700
Received: by black.igk.intel.com (Postfix, from userid 1008)
	id A486995; Mon, 27 Apr 2026 10:39:09 +0200 (CEST)
Date: Mon, 27 Apr 2026 11:39:08 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Francesco Orro <ncesco@interstellar.eu>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [RFC PATCH] usb: typec: ucsi: acpi: bootstrap PPM on HP systems
 with empty _DSM func 2
Message-ID: <ae8grG-g0PqsScEn@kuha>
References: <f3M_fpjtt8FxDqGKcA84vqXmRbKzCBfpCrIK4-jCWvIscER51zkD8qD8FYpz75qZw51rMDRSkUyYlrBvLvdM8CGRY2l8TFVvr4MC1LdTzbc=@interstellar.eu>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f3M_fpjtt8FxDqGKcA84vqXmRbKzCBfpCrIK4-jCWvIscER51zkD8qD8FYpz75qZw51rMDRSkUyYlrBvLvdM8CGRY2l8TFVvr4MC1LdTzbc=@interstellar.eu>
X-Rspamd-Queue-Id: 33F7746F46D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-36521-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	SEM_URIBL_UNKNOWN_FAIL(0.00)[interstellar.eu:query timed out];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[intel.com:+];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[heikki.krogerus@linux.intel.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	RCVD_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[linux-usb];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:dkim,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

Hi,

On Mon, Apr 20, 2026 at 04:05:47PM +0000, Francesco Orro wrote:
> Hi,
> 
> The attached RFC patch lets ucsi_acpi probe successfully on HP ZBook
> Fury G1i 16 inch (and likely other HP workstations shipping the same
> "UcsiAcpi" SSDT), where _DSM func 2 (READ) is a stub and UCSI_VERSION
> stays 0. Details in the commit message below.

Please report this to HP. We really need to know which version they
support.

> Main open question for the list: is there a known-good pattern for
> ucsi_acpi drivers to avoid disrupting alt-mode state already negotiated
> by BIOS? On cold boot with a Thunderbolt dock attached, the PPM_RESET
> issued by this patch - and later by Linux UCSI core in ucsi_init() -
> tears down the TBT alt-mode the BIOS had set up, and the DP tunnel to
> the dock dies until the user physically replugs. My local workaround
> is to late-load ucsi_acpi via a systemd service after the thunderbolt
> driver has adopted the tunnels, but that feels like papering over a
> design assumption I am missing.

I'm surprised that PPM_RESET has that effect on your system, because
it does not reset the connectors. If you want to reset the connectors
you are expected to explicitly reset each of them before the executing
PPM_RESET. I'm not sure the PPM on this platform is behaving correctly,
so I think you need to contact HP about this too.

> Tested on one machine only. Happy to refine the patch if the direction
> is acceptable.
> 
> Regards,
> Francesco Orro
> 
> ---
> 
> From: Francesco Orro <ncesco@interstellar.eu>
> Date: Mon, 20 Apr 2026 16:40:00 +0200
> Subject: [PATCH v7] usb: typec: ucsi: acpi: bootstrap PPM on systems with empty _DSM func 2

Please avoid attaching the patch to the coverletter like this. It is
a bit confusing. Is this the same patch as the one you've sent
separately in this thread?

thanks,

-- 
heikki

