Return-Path: <linux-usb+bounces-29943-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 411DEC24AA3
	for <lists+linux-usb@lfdr.de>; Fri, 31 Oct 2025 12:00:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDE23406F66
	for <lists+linux-usb@lfdr.de>; Fri, 31 Oct 2025 10:59:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E639343203;
	Fri, 31 Oct 2025 10:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TNdQWpEK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0731B3195E9
	for <linux-usb@vger.kernel.org>; Fri, 31 Oct 2025 10:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761908392; cv=none; b=gb/w3QpX9pAodi93grMR8mqCZf2phW5KHtOb3FfuhQZQ4XU9W4vPD/6Lr0U7HTENjIrWmQodYizgHmGREprRwunrbu2Hkw43JGJJ9OAXvL0o5ljnHF21L8vgmXZKFZ2ACgPIWdXFSajEz+TU8QBcYjb9AB+HsXINOnIn7T2iRfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761908392; c=relaxed/simple;
	bh=FUxlapOw6gpqpwsvR7rC3v5dJa07SF6uPlxSCj1B/qU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LMpReHcZ+7Aco40dMvA3xNZXF7H/mpZIYuF5PfD9nzUUw+lOzSuOjRY7AeHXllFU1l6IfKnRntCxiaszrAp5SWA7g2gCTWjyYOI7QD60cj41o56xH/aTWKRY2B4p3L75CxPihIANvunc9ejG8NR68Pdsr8YFz1iZL137XikzUCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TNdQWpEK; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761908389; x=1793444389;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=FUxlapOw6gpqpwsvR7rC3v5dJa07SF6uPlxSCj1B/qU=;
  b=TNdQWpEKDEEdJDU1e93qkg7u7z1QgPPQ2qA/NP3SmylK9zLh0urJNmsP
   Rrnj2Rq6HDg4v77vgzPS9hijP3qfdJtZcfCt6t1B0atzSCbgEgyEhm8Jr
   jL2PeK8ahDrpuxS+gqh5PsdMIvEDaRqzfQe9TSbzY7mX3LR7Xx6A69xoc
   k8PAR4N/ldqtA3XxbFSP+GcKNj6a/uHccXJpIXFPlY7zg6U7VM/gx/3ik
   icj0kzbQ3NE2Gac/uXNfKhfSw8fwt5d7Y5utlwBJl6h86ceDnamXcBNMG
   6SG6VbGZJj4PXr7bV9UaUGdGkeDhq+seJ4WR/hVrssc77OLmEYXhrDvRD
   A==;
X-CSE-ConnectionGUID: 8+0qUK7OSru28o/6JTx6GA==
X-CSE-MsgGUID: XUja12rvT/aW1i1J/NORGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="81478143"
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="81478143"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Oct 2025 03:59:47 -0700
X-CSE-ConnectionGUID: TWxvwCLdR8KTcXCOFJEaXw==
X-CSE-MsgGUID: uxQyejiPQoq+iew51+kBnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,269,1754982000"; 
   d="scan'208";a="186144868"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa007.jf.intel.com with ESMTP; 31 Oct 2025 03:59:47 -0700
Received: by black.igk.intel.com (Postfix, from userid 1001)
	id 2B80E95; Fri, 31 Oct 2025 11:59:46 +0100 (CET)
Date: Fri, 31 Oct 2025 11:59:46 +0100
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yanis Srairi <yanis.srairi@univ-lehavre.fr>
Cc: linux-usb@vger.kernel.org, andreas.noever@gmail.com, westeri@kernel.org,
	YehezkelShB@gmail.com
Subject: Re: [BUG] Dell Thunderbolt 4 dock not enumerated on cold boot -
 Intel Core Ultra 7 255H
Message-ID: <20251031105946.GZ2912318@black.igk.intel.com>
References: <45a965a4-3b40-b808-5fde-0c9d78c8f492@univ-lehavre.fr>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <45a965a4-3b40-b808-5fde-0c9d78c8f492@univ-lehavre.fr>

Hi,

On Fri, Oct 31, 2025 at 11:50:59AM +0100, Yanis Srairi wrote:
> Hello,
> 
> I'm reporting a Thunderbolt dock enumeration issue on a Dell Pro Max 16 
> with Intel Core Ultra 7 255H CPU running Linux kernel 6.14.0-34-generic.
> 
> PROBLEM DESCRIPTION:
> When the laptop is powered off and I connect it to a Dell Thunderbolt 4 
> Dock, the dock provides power and boots the laptop successfully. However, 
> the dock itself is never detected by the Thunderbolt subsystem, and all 
> dock peripherals (displays, keyboard, mouse, ethernet) remain non-functional.
> 
> If I unplug and re-plug the dock AFTER the system has fully booted, it is 
> immediately detected and all peripherals work correctly.
> 
> SYSTEM INFORMATION:
> - Laptop: Dell Pro Max 16 (MC16250)
> - CPU: Intel Core Ultra 7 255H (Arrow Lake generation)
> - BIOS: Version 1.8.0 (Release date: 09/10/2025)
> - Dock: Dell Thunderbolt 4 Dock
> - Kernel: 6.14.0-34-generic
> - Distribution: Ubuntu 24.04.3 LTS
> - Thunderbolt controller: Intel Meteor Lake-P Thunderbolt 4 NHI #1 [8086:7ec3]
>  (Note: PCI ID reports "Meteor Lake-P" but CPU is Arrow Lake generation)
> 
> REPRODUCTION STEPS:
> 1. Power off the laptop completely
> 2. Connect the Dell Thunderbolt 4 dock (with peripherals attached)
> 3. Dock powers on the laptop
> 4. System boots normally
> 5. Dock status remains "disconnected" in boltctl
> 6. All dock peripherals are non-functional
> 
> EXPECTED BEHAVIOR:
> According to Dell BIOS documentation, when "Enable Thunderbolt Boot Support" 
> is enabled, devices connected during pre-boot should function in the operating 
> system regardless of security level. The dock should be enumerated and 
> peripherals should work.
> 
> ACTUAL BEHAVIOR:
> $ boltctl list
> ○ Dell Thunderbolt 4 Dock
>   ├─ status:        disconnected
>   └─ authorized:    [previous connection timestamp]
> 
> $ ls /sys/bus/thunderbolt/devices/
> 0-0  domain0
> 
> The dock device (0-1) is never created.
> 
> WORKAROUNDS ATTEMPTED:
> - PCI rescan: echo 1 > /sys/bus/pci/rescan (no effect)
> - USB4 port rescan: echo 1 > /sys/bus/thunderbolt/devices/0-0/usb4_port*/rescan
> (no effect)
> - udevadm trigger --subsystem-match=thunderbolt (no effect)
> - Thunderbolt initramfs authorization script (device not present to authorize)
> 
> BIOS SETTINGS VERIFIED:
> - Enable External USB Ports: Enabled
> - Enable USB Boot Support: Enabled
> - Enable Thunderbolt Technology Support: Enabled
> - Enable Thunderbolt Boot Support: Enabled
> 
> BIOS NOTE (from USB/Thunderbolt Configuration menu):
> "Enabling the 'Enable Thunderbolt Adapter Boot Support' or 'Enable 
> Thunderbolt Adapter Pre-boot Modules' options may allow devices connected 
> to the Thunderbolt adapter during pre-boot to function in the operating 
> system regardless of the security level selected in BIOS setup. The device 
> will continue to operate in the operating system until it is disconnected. 
> When reconnected while within the operating system the device will connect 
> according to the Security Level and previous OS authorizations."
> 
> This expected behavior does NOT work on Linux - the dock is not detected 
> at all during boot.
> 
> ADDITIONAL OBSERVATIONS:
> - Dock BootACL shows 0/0 (appears unsupported)
> - Detected security mode from kernel: iommu+user
> - No "Thunderbolt Security Level" option visible in BIOS
> - Hot-plugging the dock after boot works perfectly
> - This appears related to the Arrow Lake Thunderbolt issues discussed in 
>  the thread "Thunderbolt call trace occurs on hot-plug" from July-August 2025
> 
> RELEVANT PCI DEVICES:
> 00:0d.3 USB controller [0c03]: Intel Corporation Meteor Lake-P Thunderbolt 4
> NHI #1 [8086:7ec3] (rev 10)
> 04:00.0 PCI bridge [0604]: Intel Corporation Thunderbolt 4 Bridge [Goshen Ridge
> 2020] [8086:0b26] (rev 03)
> 
> Please let me know if you need additional logs or information. I'm happy to 
> test patches or provide more debugging output.

This is an excelent bug report! :) I wish everyone would provide all these
gory details.

Let's start with following steps:

1. Enable dynamic debugging of the driver by adding "thunderbolt.dyndbg=+p"
   in the kernel command line.
2. Power off the system completely.
3. Connect the dock to the system.
4. Power the system on.
5. Wait for it to be booted up.
6. Send me full dmesg (e.g dmesg > dmesg.out and then send that file to me).

