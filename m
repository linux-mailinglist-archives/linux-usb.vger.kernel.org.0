Return-Path: <linux-usb+bounces-29945-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29786C24CA3
	for <lists+linux-usb@lfdr.de>; Fri, 31 Oct 2025 12:32:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E106D3BF290
	for <lists+linux-usb@lfdr.de>; Fri, 31 Oct 2025 11:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CD7034678B;
	Fri, 31 Oct 2025 11:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bUlmL+Tk"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459EB3451DA
	for <linux-usb@vger.kernel.org>; Fri, 31 Oct 2025 11:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761910273; cv=none; b=NhRAxmLyHWNy52VTRkAendFlw7ZmnTjLiYaucgl5jU3G4RiLlhCPvFboccVQ4BkihhMxI9MHz0toAhd7Qy7w9m+9CFg6Q/KBQrqMPjPAPBA3IdOYfsZX1vxYiOce2k+2Ph6nAXpRhcmyMIN6WSkFLfoxvRAGsW9emWgXlj06MrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761910273; c=relaxed/simple;
	bh=uoZzsNmdVk+FYOd4qphEpCv/UBL8jWj0S/py6cYDrIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OkE0jrONSSqprFofIjwmCweTm8cIAU36AhhSzAggku6g+ETemQqULz8ErOdc4O9fQehxpNAJ/IKsKHHBvmWTCF0E82+s76tLepPLDYVHZzVoNoHhcHNvjnP9URXDR/F2tv0FIb2ETN8BFtKdeUJH9q++Nxtotg9Qwyd0He9RSkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bUlmL+Tk; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761910271; x=1793446271;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=uoZzsNmdVk+FYOd4qphEpCv/UBL8jWj0S/py6cYDrIU=;
  b=bUlmL+TkSRYGvZ8llfgJQQQya8UYHPx2zLmj7QS7sdmM+Y7h7nLMHNiT
   Rt0XRroGSeTPEhf3pqDVUHUN/SYzb5lbacF8jDOZN3oU+Qca+6PKFtjdc
   rgPo3HG7joRqNnxFZnYpS+B9th4TU/74iV3br7XrMDo3zL89WHv+A9yqE
   XEpJDX51fhWHhknsVvRH2Cws0ChpYUY3Bb4KoZmRpN25h+p9Hg8Xm3kFz
   z4IhjPlMTT6d66r0Ln1yRrFLktl4fSojQ8qqiDUSinRNpkwO2OzdLs5d1
   ZcE1AUlfPPXbBwIhr/e3gx9t5qFShcOEEgQyuCGQHLYuYFiZHC5XLrOZU
   g==;
X-CSE-ConnectionGUID: 0rXHp2tUSjmbjafqfkeYYw==
X-CSE-MsgGUID: xTnGFq50RQqoojkFIKMr0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="66683342"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="66683342"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 04:31:10 -0700
X-CSE-ConnectionGUID: e2QVY7t2R22ddnYA5ATwhQ==
X-CSE-MsgGUID: ziJVIvMETq+RAHlb5K4KRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="190564334"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa005.fm.intel.com with ESMTP; 31 Oct 2025 04:31:09 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id C365B95; Fri, 31 Oct 2025 12:31:08 +0100 (CET)
Date: Fri, 31 Oct 2025 12:31:08 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yanis Srairi <yanis.srairi@univ-lehavre.fr>
Cc: linux-usb@vger.kernel.org, andreas.noever@gmail.com, westeri@kernel.org,
	YehezkelShB@gmail.com
Subject: Re: [BUG] Dell Thunderbolt 4 dock not enumerated on cold boot -
 Intel Core Ultra 7 255H
Message-ID: <20251031113108.GA2912318@black.igk.intel.com>
References: <45a965a4-3b40-b808-5fde-0c9d78c8f492@univ-lehavre.fr>
 <20251031105946.GZ2912318@black.igk.intel.com>
 <926b30e9-00da-c404-53fd-2f7fb4731d5a@univ-lehavre.fr>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <926b30e9-00da-c404-53fd-2f7fb4731d5a@univ-lehavre.fr>

Hi,

On Fri, Oct 31, 2025 at 12:13:58PM +0100, Yanis Srairi wrote:
>  Thank you for the quick response!
> 
>  I've completed the debugging steps:
>  1. Added thunderbolt.dyndbg=+p to kernel command line
>  2. Powered off completely
>  3. Connected the dock while powered off
>  4. Booted the system
> 
>  Attached is the full dmesg output (dmesg.out). As expected, the peripherals
>  (screen/keyboard/mouse/ethernet) did not work after boot until I unplugged and
> replugged the dock.
> 
>  Let me know if you need any additional information.

Thanks for the log. I looks like the USB4 link is not even up which sounds
more like a Power Delivery issue (on the host side) to me. Can you still
run few more checks?

First after your step 4 above, run this:

  https://github.com/intel/tbtools/wiki/Useful-Commands#dump-status-of-all-adapters

and attach the output. Then also run these commands:

  # tbdump -r 0 -a 1 -N 1 -vv PORT_CS_18
  # tbdump -r 0 -a 3 -N 1 -vv PORT_CS_18

and send me that output too. This tells us if the host router sees the link
at all. If not then there are few options. One is the cable itself may be
bad but Dell docks typically have good cables attached that you even cannot
change. The other thing is to check if there is firmware upgrade available
for the system (e.g the one that contains BIOS and the other integrated
firmwares). This should also contain the PD controller firmwares.

Then one option is to reset the BIOS settings back to defaults just to be
sure. From your log the BIOS CM did not create PCIe tunnels so that would
indicate that the BIOS itself cannot see the link coming up.

BTW, once it works when you plug the dock runtime, do you see it in

  # tblist

output? (tblist is also part of tbtools [1]).

[1] https://github.com/intel/tbtools

