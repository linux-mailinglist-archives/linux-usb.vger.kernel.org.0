Return-Path: <linux-usb+bounces-22590-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3089EA7C14C
	for <lists+linux-usb@lfdr.de>; Fri,  4 Apr 2025 18:10:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 927757A8D20
	for <lists+linux-usb@lfdr.de>; Fri,  4 Apr 2025 16:09:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B4FC207A27;
	Fri,  4 Apr 2025 16:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h05Ybue+"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE878207A1D
	for <linux-usb@vger.kernel.org>; Fri,  4 Apr 2025 16:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743783024; cv=none; b=sOHFk7L07DWpRz8Va0P1sK5x/sNs9fpOAEAFNwU+/PedZrZeuopLMrCSgmm3I2ewyd7lX7IEsnM/dmPI2c8cT7ckMZCYlNEQ55hN2n6ut5JhNX/bS6JxxvybdXZyoP4ZX6cXqbVNHNIdtJRcUZWcK1GfrknZl1osqgwlOvG94HI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743783024; c=relaxed/simple;
	bh=kGdlScKV9sFtxKzKAzWdmVA5vLE3KykUUdpein5HFGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KS/vXgtmxxO9lIAtN3DAatb/0DQMTiLI8BK5fdyUv0E6DFihpaddknVccaWSq/ERDeeC6YnFPu1aRl3L0Sl7V9xARdDj3o+K7es/0L4/Tso6chXhsLHL0+4y9zh6lLp8HXx2B5cbFqu4Ytk3YCwTd/7ckA1Wr43JJ2LRPVG/o1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h05Ybue+; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743783023; x=1775319023;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kGdlScKV9sFtxKzKAzWdmVA5vLE3KykUUdpein5HFGY=;
  b=h05Ybue+oRKE0kyrxPnUBsz0TGt6e0ABs/IifjGd/YdLoPrmTh45OdlX
   bGC0zUUjo2pdaSwIwRuILxpC4LZzFC3RlqW/djoLw3rzGE2ngZZk21qDE
   OQJ2oulmcyuaHpfPcwWxe//dGKjWVuTlSWY/SiARCARPpByUFIqxkr/CK
   R5xdXULVTrn3wfj4xFWAwOpeqSBGPUnI1eCtAUosEJolHBAFi/sa+p+wK
   XVo5IrcIu+Sb0K+KdR4F6CY/B+d7NoATFh+0ID3XVmJwteo68aZBe6DwB
   +dYmMPPgp7Up0t0HxBYJt7mlpyrwccQNUyU0YZfjLzBX51b+8yflb4Pe8
   Q==;
X-CSE-ConnectionGUID: i6N1okTZSCG/7Mff/nb/gw==
X-CSE-MsgGUID: jk9ttIIrSVCzvo2w6iuaoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="62764585"
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="62764585"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 09:10:11 -0700
X-CSE-ConnectionGUID: S/XDDR57TbmBCqKJbNFmcA==
X-CSE-MsgGUID: DC0q80TYT12oMUgUfRjbOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,188,1739865600"; 
   d="scan'208";a="132060001"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa005.fm.intel.com with ESMTP; 04 Apr 2025 09:10:10 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 09E92129; Fri, 04 Apr 2025 19:10:08 +0300 (EEST)
Date: Fri, 4 Apr 2025 19:10:08 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Mario Limonciello <superm1@gmail.com>,
	"open list:USB XHCI DRIVER" <linux-usb@vger.kernel.org>,
	"Gong, Richard" <Richard.Gong@amd.com>
Subject: Re: Wake on connect / wake on disconnect
Message-ID: <20250404161008.GO3152277@black.fi.intel.com>
References: <ce2048af-1044-4424-bca2-3799baefb9c2@amd.com>
 <20250404060203.GM3152277@black.fi.intel.com>
 <3b283147-cd32-410e-a163-9e603fd40bc1@gmail.com>
 <20250404115346.GN3152277@black.fi.intel.com>
 <98539971-3b43-4d64-a105-6790198c46d1@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <98539971-3b43-4d64-a105-6790198c46d1@amd.com>

On Fri, Apr 04, 2025 at 10:03:18AM -0500, Mario Limonciello wrote:
> On 4/4/2025 6:53 AM, Mika Westerberg wrote:
> > On Fri, Apr 04, 2025 at 06:47:31AM -0500, Mario Limonciello wrote:
> > > On 4/4/25 01:02, Mika Westerberg wrote:
> > > > Hi Mario,
> > > > 
> > > > On Thu, Apr 03, 2025 at 01:12:07PM -0500, Mario Limonciello wrote:
> > > > > Mika,
> > > > > 
> > > > > Recently there are some conversations about wake-up from connect/disconnect
> > > > > happening and I wanted to get some background from you about the current
> > > > > policy set in tb_switch_suspend().
> > > > > 
> > > > > Wake on connect and disconnect are only used for runtime, not for system
> > > > > suspend.  Would you be open to adding wake on connect as well for system
> > > > > suspend?  This should help enable use cases like plugging in a closed laptop
> > > > > to a dock (which works on Windows).
> > > > 
> > > > Don't we already have a similar for all usb4_portX devices? That does not
> > > > work for you?
> > > > 
> > > 
> > > I think that will functionally work - but I'll double check.
> > > 
> > > However usb_portX power/wakeup defaults are 'disabled' so this would need a
> > > udev rule.  Could we set the kernel default for those to 'enabled' instead?
> > 
> > No because that would trigger wakeup each time you unplug/plug and this is
> > certainly not good if you close the lid, unplug from dock and throw the
> > laptop to your backpack. Chrome uses this with "dark resume" so if this is
> > supported by the userspace then it can also enable these.
> 
> Ahhh.  I was thinking specifically with wake on connect that's not a
> problem, but the sysfs knob for the port changes both wake on connect and
> wake on disconnect.
> 
> Is there actually a use case for chrome with wake on disconnect?  IE if we
> didn't turn on wake on disconnect but defaulted to wake on connect would
> things be OK?  Or made the sysfs knob control only wake on disconnect?

Good guestion - I don't know ;-) The Chrome folks wanted this so I suppose
their usecase is specifically that dark resume and I think that's when you
unplug a device so disconnect. Not so sure about wake on connect.

