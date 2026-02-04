Return-Path: <linux-usb+bounces-33094-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QIV3E+E9g2kPkQMAu9opvQ
	(envelope-from <linux-usb+bounces-33094-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 13:38:57 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B75E5E84
	for <lists+linux-usb@lfdr.de>; Wed, 04 Feb 2026 13:38:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 304483038FC5
	for <lists+linux-usb@lfdr.de>; Wed,  4 Feb 2026 12:37:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5C3F3F0760;
	Wed,  4 Feb 2026 12:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IIYMe1y+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6272F3F23A3;
	Wed,  4 Feb 2026 12:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770208626; cv=none; b=hFSIgMmb8M1i4gZx6vpCKU+9eeMPCMp1wzO6diXCm0LfTTdcmgVOIRwgBP16OgUzUMKdFRlmkHfdVu8nZOnBf/bJ1GA4ttGlqYWNbQS+0QF3wS22PeJ5Ultsv/jq5RDgCsZOeo7rAWCebowCXcl7NmzXrTo7JwVjG/JPBFol+Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770208626; c=relaxed/simple;
	bh=fBIS6G8rQ2ijfeCXj8IMHk2REClU+UvHE7Vd5DfnRFU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wp5NCzjTif+wYnZivNYYJ7MUQ9Y56rOnKSb9noU+Sbo4ca33EfFIhh6AWMHWVzjKSIrdr4j+TKg+g4O4zx2IF6DqO6sr2eVoGa4v0NCus2L8e8K6RXIDaOlOmqJyN/GASefZ5NopF2DyHdr057FmNj0GVYze9F5EBbOALDehHNg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IIYMe1y+; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770208626; x=1801744626;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=fBIS6G8rQ2ijfeCXj8IMHk2REClU+UvHE7Vd5DfnRFU=;
  b=IIYMe1y+5droFcMJ9pwyeTqO6GMEwdC0cD9zeTWOizEW61166/OxdvXz
   gKZAlJMyT73pJO3RqQHktT2EQOIrJWVlXAy8MEtI19zF0IRvk5LQKq8bh
   uzWewX4TevJweb+e1wTXwe8HCMlWxK4Hb5tLNx2ooKNKoakFFfpCBoP8o
   ZWeiASOLw4EaurGPLkDua5kk8TJcPgTua7QHjD4bqrcJdfSvJR6IDU3u3
   XZgJxmgMoxPFi9/eDm831Z5tudBQ5IJtJYeHLtrYI87MfbLfXUJ2UsjDl
   wnBKQM/FCMUxKd8vRxWkmd8Tb9A+pLplCB6/YV8b9pNqvC/rTW+qfjmKJ
   w==;
X-CSE-ConnectionGUID: nS6SMunYQpCVyM0ViWd1Fg==
X-CSE-MsgGUID: qn4oJCqNSwKY5sF23DaCRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="81707994"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="81707994"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 04:37:05 -0800
X-CSE-ConnectionGUID: lMX6n5QfSp+8PZ/44haIpQ==
X-CSE-MsgGUID: wuLXtn6tS7CgFxKsg+IIHA==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 04 Feb 2026 04:37:03 -0800
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id AD99C95; Wed, 04 Feb 2026 13:37:02 +0100 (CET)
Date: Wed, 4 Feb 2026 13:37:02 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Jayi Li <lijiayi@kylinos.cn>
Cc: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Yehezkel Bernat <YehezkelShB@gmail.com>, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org, Gil Fine <gil.fine@linux.intel.com>
Subject: Re: [PATCH] thunderbolt: Fix PCIe device enumeration with delayed
 rescan
Message-ID: <20260204123702.GO2275908@black.igk.intel.com>
References: <aXg1eBudRAaCZpmR@acelan-Precision-5480>
 <20260127084513.GC2275908@black.igk.intel.com>
 <20260127101701.GI2275908@black.igk.intel.com>
 <aXrZK-WigVeqxBTT@acelan-Precision-5480>
 <20260129065003.GS2275908@black.igk.intel.com>
 <cd006977-513f-43d6-9238-1b9f39313976@kylinos.cn>
 <20260203093957.GD2275908@black.igk.intel.com>
 <087dcbe3-ad68-4f45-877b-8f78721efa4b@kylinos.cn>
 <20260203100752.GF2275908@black.igk.intel.com>
 <8a4874ef-90d4-4d88-a72d-1efa791a5b9b@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8a4874ef-90d4-4d88-a72d-1efa791a5b9b@kylinos.cn>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[canonical.com,gmail.com,kernel.org,vger.kernel.org,linux.intel.com];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	TAGGED_FROM(0.00)[bounces-33094-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mika.westerberg@linux.intel.com,linux-usb@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,intel.com:dkim]
X-Rspamd-Queue-Id: D3B75E5E84
X-Rspamd-Action: no action

On Wed, Feb 04, 2026 at 10:37:58AM +0800, Jayi Li wrote:
> 
> 在 2026/2/3 18:07, Mika Westerberg 写道:
> > On Tue, Feb 03, 2026 at 06:00:06PM +0800, Jayi Li wrote:
> > > > > I'm not sure if this is relevant to this issue, but sharing just in case.
> > > > Thanks for sharing!
> > > > 
> > > > It could be. What device this is?
> > > The device is Targus DOCK221.
> > Is the host Intel or AMD (well can you share bit more details about the
> > topology)? Then if you block runtime PM of the PCIe Downstream Port that
> > leads to the TB3 device like:
> > 
> >   # echo on > /sys/bus/pci/devices/DEVICE/power/control
> > 
> > Does it work?
> 
> The host is ASMedia.

Ah okay. I don't have any experience with ASMedia host. What system/laptop
comes with that?

>  ASMedia Host (0-0, domain0)
>          |
>         └─ Port 3 ──→ Thunderbolt 3 Dock (0-3)
> 
> I tried disabling runtime PM by writing 'on' to power/control for the
> downstream port, but it did not work.

I think that's integrated into the SoC, right? So it's a PCIe root port
used for tunneling. What does 'sudo lspci -vv' say?

