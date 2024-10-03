Return-Path: <linux-usb+bounces-15655-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 734D398E982
	for <lists+linux-usb@lfdr.de>; Thu,  3 Oct 2024 07:47:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3A4A128663C
	for <lists+linux-usb@lfdr.de>; Thu,  3 Oct 2024 05:47:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0759A224D1;
	Thu,  3 Oct 2024 05:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eP1810i6"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068B51F5FF
	for <linux-usb@vger.kernel.org>; Thu,  3 Oct 2024 05:47:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727934429; cv=none; b=mGF0lpYHJnrlNAs0I8cuJklDoP1Glrydx1xRLCX35KSgLbi/IWEIKzB7YyDZX6H0qunhwhbToOFPEq8j4BRmk/EhP7mrOeSp+B2cyynCEPPl6rSfNyR/a6AbZvo2gN+mXoLFczY5MV6BrxkjmAlKD5519UT/GpXD77NiN6sqbfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727934429; c=relaxed/simple;
	bh=1U4maC12kMzIFQqFpHkuvcqqRovo+/2oME69fl3a/ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B42vYW/CErZA9tAtbWmnl7piC/4eA1uz6aBh+J6NlHk1RNcp50pqGXDO2gedsQo8Pke73VAs/+PX27WSHVHt8i668QmAMvDDXuAfcaPeollNJ5fJ68kVrMCrrZUFep6FiLtz/lcHKsqn4yH5UhK8j4LQyEcUjeYNidxcUUP0hNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eP1810i6; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727934428; x=1759470428;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1U4maC12kMzIFQqFpHkuvcqqRovo+/2oME69fl3a/ak=;
  b=eP1810i6hgQhfEwn9aucptWbdAT1A29KUGizAuEnzrSWBtdarf0YGhlJ
   y5vpBPPbw3KBnU5GKX/kX3k6lHFipSJNLBAbWbXf1bILSDqUtYU+dRUfn
   2qtlc4cNr7xhvf17lmV0qD0cs8OZAuvz4oQc4qEf0qtm8TqtfygNIV/5f
   CVhf+ojuWwPE1jxtk7/0Hz8GWfcWAzHX9WWFn4Ooju7XZ5A6wlPqZg4QT
   E3Gx1c64rInllo41J1QU+KpapdQzn6b7fdX+NpffJLAlrd5q8xt2Myd2A
   YFw3UWWwAlV4iM80s9eT5kXZ5TmZ5jq4zzb58qpP46eANWoQ9uB7NOPbq
   Q==;
X-CSE-ConnectionGUID: FsUl6ouuRSa0ZkVmSqNLUA==
X-CSE-MsgGUID: iTTSTrZKRwKaqHpJQLs5gQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11213"; a="49643702"
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="49643702"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 22:47:08 -0700
X-CSE-ConnectionGUID: y3yNkVjARRSFaKTS8/hSPA==
X-CSE-MsgGUID: 3apkzQj2RwW7UoZWOpwuCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,173,1725346800"; 
   d="scan'208";a="74355760"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 02 Oct 2024 22:47:05 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 6C0A7144; Thu, 03 Oct 2024 08:47:04 +0300 (EEST)
Date: Thu, 3 Oct 2024 08:47:04 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: linux-usb@vger.kernel.org, mathias.nyman@linux.intel.com,
	regressions@lists.linux.dev,
	"Limonciello, Mario" <Mario.Limonciello@amd.com>,
	Raju.Rangoju@amd.com, Sanath.S@amd.com,
	Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [REGRESSION] usb: acpi: add device link between tunneled USB3
 device and USB4 Host Interface
Message-ID: <20241003054704.GM275077@black.fi.intel.com>
References: <cf45e722-144f-4d06-8dd9-2f7f54283fbc@amd.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <cf45e722-144f-4d06-8dd9-2f7f54283fbc@amd.com>

Hi Harry,

On Wed, Oct 02, 2024 at 01:42:29PM -0400, Harry Wentland wrote:
> I was checking out the 6.12 rc1 (through drm-next) kernel and found
> my system hung at boot. No meaningful message showed on the kernel
> boot screen.
> 
> A bisect revealed the culprit to be
> 
> commit f1bfb4a6fed64de1771b43a76631942279851744 (HEAD)
> Author: Mathias Nyman <mathias.nyman@linux.intel.com>
> Date:   Fri Aug 30 18:26:29 2024 +0300
> 
>     usb: acpi: add device link between tunneled USB3 device and USB4 Host Interface
> 
> A revert of this single patch "fixes" the issue and I can boot again.
>     
> The system in question is a Thinkpad T14 with a Ryzen 7 PRO 6850U CPU.
> It's running Arch Linux but I doubt that's of consequence.
> 
> lspci output:
>     https://gist.github.com/hwentland/59aef63d9b742b7b64d2604aae9792e0
> acpidump:
>     https://gist.github.com/hwentland/4824afc8d712c3d600be5c291f7f1089
> 
> Mario suggested I try modprobe.blacklist=xhci-hcd but that did nothing.
> Another suggestion to do usbcore.nousb lets me boot to the desktop
> on a kernel with the faulty patch, without USB functionality, obviously.
> 
> I'd be happy to try any patches, provide more data, or run experiments.

Do you boot with any device connected?

Second thing that I noticed, though I'm not familiar with AMD hardware,
but from your lspci dump, I do not see the PCIe ports that are being
used to tunnel PCIe. Does this system have PCIe tunneling disabled
somehow?

You don't see anything on the console? It's all blank or it just hangs
after some messages?

Can you also provide full dmesg with that commit reverted with
"thunderbolt.dyndbg=+p" in the kernel command line?

