Return-Path: <linux-usb+bounces-37760-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLekD6yGDWpdygUAu9opvQ
	(envelope-from <linux-usb+bounces-37760-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 12:02:20 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F6CC58B461
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 12:02:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3392C301AB86
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2026 09:56:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01EFB3D301F;
	Wed, 20 May 2026 09:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V3cue/r4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41EB23D091B
	for <linux-usb@vger.kernel.org>; Wed, 20 May 2026 09:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779270965; cv=none; b=atDwO6qU+LVmL3B4k9ZdBOYtHudakXhg+A4uJZD0whzgomRgbR14x5rh2pqdeAXicmlWbhSw2z3TZBDVEtExgbrNvFZwqhwuNabtcXqbxAVwzpQ2AnmUZ6/mzVlrQYb30XxMMhuoFAcA2sXb4XDX6t+wNChRXwtq1ccg3t2ywog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779270965; c=relaxed/simple;
	bh=L+UFOsAszlV+duz1urRSW6QFal0eGvHWNO6OglS4mU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fQR39fHXZDZ/L9oYcC79YP9PyB3DPOZ+i+x6JaO6xJB/x3Yh91P04uBaWLlNmYpeu2JR+ugz38vUi1C2zPpt3piePOWZO3YmB0B9h1n0EJjQMTXn9dPpF3aHEoGX9kbkSOIHy18lXsjqaafU9haMi+rFCh2ZZT20xo3Dug/qmow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V3cue/r4; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779270963; x=1810806963;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L+UFOsAszlV+duz1urRSW6QFal0eGvHWNO6OglS4mU0=;
  b=V3cue/r4z9w6CeoFmT135dP78P9Zir4dMxsA0BuBg0NSurAWJ5TwLMmi
   nZdevkFoLa9laT9/bOzk4CEcPmgKEKQFJOIofAOfC548Ow4QuLmuzxUcx
   8FWakSTvtPJFG6WA9B+5Lxjuns3yY2abqugO3XrYbfx5GqN1rTDqSWplT
   nD2dtyvOweqNaIpgX21GlV5JZ+GkpgwmSvRKU5yH4KoMLxodAO3qysxja
   M1DeEl0cz/PjiqlJPgAw+Z/woujjppFMySr4Ma8XuFIOdb7R0ZKkjKzdK
   dypkahgPxDwCCPVJdDuYesIry2HfqecfCGRHvDVx53qhT9M4UHW547Zbh
   g==;
X-CSE-ConnectionGUID: oVT2aOpXR62x7QGcjSPtaQ==
X-CSE-MsgGUID: pGQDKdnSSBC9FgmrvtPHUw==
X-IronPort-AV: E=McAfee;i="6800,10657,11791"; a="80067281"
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="80067281"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 02:56:03 -0700
X-CSE-ConnectionGUID: 99ruAICXTqW2v2z4i6Wm2Q==
X-CSE-MsgGUID: BUrg6QU5RnOtkxDiLCv1vQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,244,1770624000"; 
   d="scan'208";a="239120721"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa006.jf.intel.com with ESMTP; 20 May 2026 02:56:01 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id DC52295; Wed, 20 May 2026 11:55:59 +0200 (CEST)
Date: Wed, 20 May 2026 11:55:59 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: linux-usb@vger.kernel.org
Cc: Yehezkel Bernat <YehezkelShB@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>,
	Alan Borzeszkowski <alan.borzeszkowski@linux.intel.com>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Rene Sapiens <rene.sapiens@linux.intel.com>,
	Gil Fine <gil.fine@linux.intel.com>
Subject: Re: [PATCH 0/8] thunderbolt: Make the driver follow CM guide more
 closely
Message-ID: <20260520095559.GD8580@black.igk.intel.com>
References: <20260512122955.271688-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260512122955.271688-1-mika.westerberg@linux.intel.com>
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[gmail.com,wunner.de,linux.intel.com,intel.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_FROM(0.00)[bounces-37760-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,intel.com:dkim]
X-Rspamd-Queue-Id: 8F6CC58B461
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, May 12, 2026 at 02:29:47PM +0200, Mika Westerberg wrote:
> Hi all,
> 
> This series includes various improvements to make the Thunderbolt/USB4
> driver follow the USB4 Connection Manager guide more closely (and hopefully
> work better with wider range of USB4 devices). There is also one
> improvement for DisplayPort tunneling with more than 2 tunnels when
> bandwidth allocation mode is enabled.
> 
> Alan Borzeszkowski (1):
>   thunderbolt: Improve multi-display DisplayPort tunnel allocation
> 
> Gil Fine (6):
>   thunderbolt: Fix lane bonding log when bonding not possible
>   thunderbolt: Activate path hops from source to destination
>   thunderbolt: Verify PCIe adapter in detect state before tunnel setup
>   thunderbolt: Verify Router Ready bit is set after router enumeration
>   thunderbolt: Increase timeout for Configuration Ready bit
>   thunderbolt: Increase Notification Timeout to 255 ms for USB4 routers
> 
> Pooja Katiyar (1):
>   thunderbolt: Don't access path config space on Lane 1 adapters in tb_switch_reset_host()

All applied to thunderbolt.git/next.

