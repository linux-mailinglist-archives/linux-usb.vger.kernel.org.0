Return-Path: <linux-usb+bounces-7046-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EF47866B35
	for <lists+linux-usb@lfdr.de>; Mon, 26 Feb 2024 08:43:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 954221F23A10
	for <lists+linux-usb@lfdr.de>; Mon, 26 Feb 2024 07:43:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C9381CAAE;
	Mon, 26 Feb 2024 07:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I1lzTtAV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAF71CA8B
	for <linux-usb@vger.kernel.org>; Mon, 26 Feb 2024 07:42:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708933338; cv=none; b=X+0/2fXEYNrsAFAnaUZrDFmdoNhRM5weWKfs+IJhMbQsMLwYT3xtgcUho9OEItFjrg9Z8ct+RJyjKqX7C7T/WgX+nKQB4EwEHW9Hv0RbUM7EP8AUdhBQt9KXCuh8hu81AhoQCuU10LasW/WzNY7TgllZNUFSVjxAtFX9y4tbCEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708933338; c=relaxed/simple;
	bh=XeZRWDLe9izE82DJ4KHqGkxsUw/0HU7dAqaJrxfyLuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WhmW/QwG8Fp4DJvLBPKh4NfIzaNRfBACITc5POJrGooMndYl67XIvUZKp0MycGBJgojIU3sua0oC9AQymigq4G5iffix0QKiD+K18AfVvIwgh3WKEti4BGqWFeGrTlH/KcqcuvKkKY7grwVGScLg60Weh7tGHzY89eSgmMDWddw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I1lzTtAV; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708933326; x=1740469326;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=XeZRWDLe9izE82DJ4KHqGkxsUw/0HU7dAqaJrxfyLuw=;
  b=I1lzTtAV9oc87ijYQCilDAt6cffuFogq0/m59QRA6IyWTOzUa7Vh12JI
   J/exkXMPjRPghehsl/H52yYU/ka4iUedeSebFJUu79oli2Z6B3gqwb5Yj
   Dcge8qve+cdvi2jBWTBJC+I9VFL8lR533zsbV56mNBqQiU8MDxkbX9D+l
   dQ0qOkaytAhLysZqLYqotM/VCUSpcPnPd5z1iuRYTinE5b1y0M8hIUMJV
   uywomS7ztcplRcutbUcGl/kN0kLcnLzqdJXWuSdBF4w1tYwK8fwGlyHFW
   8R/p5pLEtG14gCkKVXtsERpGPdyf99QvspL4mN7dSY/cYcIXu72allcIS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="3367316"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="3367316"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2024 23:41:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10995"; a="937029416"
X-IronPort-AV: E=Sophos;i="6.06,185,1705392000"; 
   d="scan'208";a="937029416"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 25 Feb 2024 23:41:32 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 26 Feb 2024 09:41:32 +0200
Date: Mon, 26 Feb 2024 09:41:32 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
	Hans de Goede <hdegoede@redhat.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: Dell XPS 13 9360 und USB-C adapter: Non-working USB mouse and
 keyboard
Message-ID: <ZdxArA4MZEScbz/X@kuha.fi.intel.com>
References: <304d1dc4-3023-4d78-a7c2-e609622afe4e@molgen.mpg.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <304d1dc4-3023-4d78-a7c2-e609622afe4e@molgen.mpg.de>

Hi Paul,

On Thu, Feb 15, 2024 at 09:06:50PM +0100, Paul Menzel wrote:
> Dear Linux folks,
>=20
>=20
> On the Dell XPS 13 9360, I had a Dell DA300 USB-C adapter attached, then I
> ACPI S3 suspended the system, unplugged the Dell DA300 adapter, and attac=
hed
> a LMP USB-C mini Dock (P/N 15954) [1] that already had a monitor over HDMI
> attached, and a USB cable from the monitor, in whose USB hub a USB keyboa=
rd
> and mouse are plugged in. But the USB keyboard and mouse did not work (al=
so
> not Ethernet). After re-plugging the USB cable they finally worked.
>=20
> 	[    0.000000] microcode: updated early: 0xf0 -> 0xf4, date =3D 2023-02-=
22
> 	[    0.000000] Linux version 6.6.15-amd64 (debian-kernel@lists.debian.or=
g)
> (gcc-13 (Debian 13.2.0-13) 13.2.0, GNU ld (GNU Binutils for Debian) 2.42)=
 #1
> SMP PREEMPT_DYNAMIC Debian 6.6.15-2 (2024-02-04)
> 	[    0.000000] Command line: BOOT_IMAGE=3D/vmlinuz-6.6.15-amd64
> root=3DUUID=3D32e29882-d94d-4a92-9ee4-4d03002bfa29 ro quiet pci=3Dnoaer
> mem_sleep_default=3Ddeep log_buf_len=3D8M cryptomgr.notests i8042.dumbkbd=
=3D1
> 	[=E2=80=A6]
> 	[    0.000000] DMI: Dell Inc. XPS 13 9360/0596KF, BIOS 2.21.0 06/02/2022
>=20
> 	[38587.844513] PM: suspend entry (deep)
> 	[38587.846982] Filesystems sync: 0.002 seconds
> 	[38587.848976] (NULL device *): firmware: direct-loading firmware
> i915/kbl_dmc_ver1_04.bin
> 	[38587.849030] (NULL device *): firmware: direct-loading firmware
> regulatory.db.p7s
> 	[38587.849126] (NULL device *): firmware: direct-loading firmware
> regulatory.db
> 	[38587.850591] Freezing user space processes
> 	[38587.853113] Freezing user space processes completed (elapsed 0.002
> seconds)
> 	[38587.853116] OOM killer disabled.
> 	[38587.853116] Freezing remaining freezable tasks
> 	[38587.854406] Freezing remaining freezable tasks completed (elapsed 0.0=
01
> seconds)
> 	[38587.854452] printk: Suspending console(s) (use no_console_suspend to
> debug)
> 	[38588.408656] ACPI: EC: interrupt blocked
> 	[38588.441444] ACPI: PM: Preparing to enter system sleep state S3
> 	[38588.452770] ACPI: EC: event blocked
> 	[38588.452774] ACPI: EC: EC stopped
> 	[38588.452776] ACPI: PM: Saving platform NVS memory
> 	[38588.456301] Disabling non-boot CPUs ...
> 	[38588.458465] smpboot: CPU 1 is now offline
> 	[38588.463291] smpboot: CPU 2 is now offline
> 	[38588.468360] smpboot: CPU 3 is now offline
> 	[38588.478875] ACPI: PM: Low-level resume complete
> 	[38588.478919] ACPI: EC: EC started
> 	[38588.478919] ACPI: PM: Restoring platform NVS memory
> 	[38588.481038] Enabling non-boot CPUs ...
> 	[38588.481063] smpboot: Booting Node 0 Processor 1 APIC 0x2
> 	[38588.481775] CPU1 is up
> 	[38588.481793] smpboot: Booting Node 0 Processor 2 APIC 0x1
> 	[38588.482548] CPU2 is up
> 	[38588.482564] smpboot: Booting Node 0 Processor 3 APIC 0x3
> 	[38588.483227] CPU3 is up
> 	[38588.486173] ACPI: PM: Waking up from system sleep state S3
> 	[38588.803799] ACPI: EC: interrupt unblocked
> 	[38588.804144] pcieport 0000:00:1c.0: Intel SPT PCH root port ACS
> workaround enabled
> 	[38588.804182] pcieport 0000:00:1c.4: Intel SPT PCH root port ACS
> workaround enabled
> 	[38588.804202] pcieport 0000:00:1d.0: Intel SPT PCH root port ACS
> workaround enabled
> 	[38588.839792] DMAR: DRHD: handling fault status reg 2
> 	[38588.839800] DMAR: [INTR-REMAP] Request device [f0:1f.0] fault index 0=
x0
> [fault reason 0x25] Blocked a compatibility format interrupt request
> 	[38588.841394] ACPI: EC: event unblocked
> 	[38588.881941] nvme nvme0: 4/0/0 default/read/poll queues
> 	[38588.952089] i915 0000:00:02.0: [drm] [ENCODER:94:DDI A/PHY A] is
> disabled/in DSI mode with an ungated DDI clock, gate it
> 	[38588.952097] i915 0000:00:02.0: [drm] [ENCODER:102:DDI B/PHY B] is
> disabled/in DSI mode with an ungated DDI clock, gate it
> 	[38588.952102] i915 0000:00:02.0: [drm] [ENCODER:113:DDI C/PHY C] is
> disabled/in DSI mode with an ungated DDI clock, gate it
> 	[38589.174114] usb 1-3: reset full-speed USB device number 2 using xhci_=
hcd
> 	[38589.238809] Registered IR keymap rc-cec
> 	[38589.238840] rc rc0: DP-1 as /devices/pci0000:00/0000:00:02.0/rc/rc0
> 	[38589.238878] input: DP-1 as
> /devices/pci0000:00/0000:00:02.0/rc/rc0/input68
> 	[38589.454005] usb 1-5: reset high-speed USB device number 4 using xhci_=
hcd
> 	[38589.730018] usb 1-4: reset full-speed USB device number 3 using xhci_=
hcd
> 	[38589.896901] xhci_hcd 0000:39:00.0: xHC error in resume, USBSTS 0x411,
> Reinit
> 	[38589.896905] usb usb3: root hub lost power or was reset
> 	[38589.896906] usb usb4: root hub lost power or was reset
> 	[38590.189991] usb 3-1: reset high-speed USB device number 2 using xhci_=
hcd
> 	[38590.338375] usb 3-1: device firmware changed
> 	[38595.538452] mei_hdcp 0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1c54b627f0=
4:
> bound 0000:00:02.0 (ops i915_hdcp_ops [i915])
> 	[38595.539692] OOM killer enabled.
> 	[38595.539694] Restarting tasks ...
> 	[38595.539819] pci_bus 0000:02: Allocating resources
> 	[38595.539843] pcieport 0000:02:01.0: bridge window [io  0x1000-0x0fff] =
to
> [bus 04-38] add_size 1000
> 	[38595.539849] pcieport 0000:02:02.0: bridge window [io  0x1000-0x0fff] =
to
> [bus 39] add_size 1000
> 	[38595.539853] pcieport 0000:02:02.0: bridge window [mem
> 0x00100000-0x000fffff 64bit pref] to [bus 39] add_size 200000 add_align
> 100000
> 	[38595.539859] pcieport 0000:01:00.0: bridge window [io  0x1000-0x0fff] =
to
> [bus 02-39] add_size 2000
> 	[38595.539865] pcieport 0000:01:00.0: BAR 13: no space for [io  size
> 0x2000]
> 	[38595.539869] pcieport 0000:01:00.0: BAR 13: failed to assign [io size
> 0x2000]
> 	[38595.539981] usb 1-1: USB disconnect, device number 5
> 	[38595.540111] usb 3-1: USB disconnect, device number 2
> 	[38595.540115] usb 3-1.1: USB disconnect, device number 3
> 	[38595.540299] pcieport 0000:01:00.0: BAR 13: no space for [io  size
> 0x2000]
> 	[38595.540302] pcieport 0000:01:00.0: BAR 13: failed to assign [io size
> 0x2000]
> 	[38595.540309] pcieport 0000:02:02.0: BAR 15: no space for [mem size
> 0x00200000 64bit pref]
> 	[38595.540312] pcieport 0000:02:02.0: BAR 15: failed to assign [mem size
> 0x00200000 64bit pref]
> 	[38595.540315] pcieport 0000:02:01.0: BAR 13: no space for [io  size
> 0x1000]
> 	[38595.540317] pcieport 0000:02:01.0: BAR 13: failed to assign [io size
> 0x1000]
> 	[38595.540319] pcieport 0000:02:02.0: BAR 13: no space for [io  size
> 0x1000]
> 	[38595.540322] pcieport 0000:02:02.0: BAR 13: failed to assign [io size
> 0x1000]
> 	[38595.540326] pcieport 0000:02:02.0: BAR 15: no space for [mem size
> 0x00200000 64bit pref]
> 	[38595.540329] pcieport 0000:02:02.0: BAR 15: failed to assign [mem size
> 0x00200000 64bit pref]
> 	[38595.540331] pcieport 0000:02:02.0: BAR 13: no space for [io  size
> 0x1000]
> 	[38595.540333] pcieport 0000:02:02.0: BAR 13: failed to assign [io size
> 0x1000]
> 	[38595.540335] pcieport 0000:02:01.0: BAR 13: no space for [io  size
> 0x1000]
> 	[38595.540338] pcieport 0000:02:01.0: BAR 13: failed to assign [io size
> 0x1000]
> 	[38595.540943] pci_bus 0000:02: Allocating resources
> 	[38595.540957] pcieport 0000:02:01.0: bridge window [io  0x1000-0x0fff] =
to
> [bus 04-38] add_size 1000
> 	[38595.540959] pcieport 0000:02:02.0: bridge window [io  0x1000-0x0fff] =
to
> [bus 39] add_size 1000
> 	[38595.540961] pcieport 0000:02:02.0: bridge window [mem
> 0x00100000-0x000fffff 64bit pref] to [bus 39] add_size 200000 add_align
> 100000
> 	[38595.540964] pcieport 0000:01:00.0: bridge window [io  0x1000-0x0fff] =
to
> [bus 02-39] add_size 2000
> 	[38595.540967] pcieport 0000:01:00.0: BAR 13: no space for [io  size
> 0x2000]
> 	[38595.540968] pcieport 0000:01:00.0: BAR 13: failed to assign [io size
> 0x2000]
> 	[38595.540970] pcieport 0000:01:00.0: BAR 13: no space for [io  size
> 0x2000]
> 	[38595.540971] pcieport 0000:01:00.0: BAR 13: failed to assign [io size
> 0x2000]
> 	[38595.540974] pcieport 0000:02:02.0: BAR 15: no space for [mem size
> 0x00200000 64bit pref]
> 	[38595.540975] pcieport 0000:02:02.0: BAR 15: failed to assign [mem size
> 0x00200000 64bit pref]
> 	[38595.540977] pcieport 0000:02:01.0: BAR 13: no space for [io  size
> 0x1000]
> 	[38595.540978] pcieport 0000:02:01.0: BAR 13: failed to assign [io size
> 0x1000]
> 	[38595.540979] pcieport 0000:02:02.0: BAR 13: no space for [io  size
> 0x1000]
> 	[38595.540980] pcieport 0000:02:02.0: BAR 13: failed to assign [io size
> 0x1000]
> 	[38595.540982] pcieport 0000:02:02.0: BAR 15: no space for [mem size
> 0x00200000 64bit pref]
> 	[38595.540984] pcieport 0000:02:02.0: BAR 15: failed to assign [mem size
> 0x00200000 64bit pref]
> 	[38595.540985] pcieport 0000:02:02.0: BAR 13: no space for [io  size
> 0x1000]
> 	[38595.540986] pcieport 0000:02:02.0: BAR 13: failed to assign [io size
> 0x1000]
> 	[38595.540988] pcieport 0000:02:01.0: BAR 13: no space for [io  size
> 0x1000]
> 	[38595.540989] pcieport 0000:02:01.0: BAR 13: failed to assign [io size
> 0x1000]
> 	[38595.543682] done.
> 	[38595.543695] random: crng reseeded on system resumption
> 	[38595.545827] usb 4-1: USB disconnect, device number 2
> 	[38595.545836] r8152-cfgselector 4-1.2: USB disconnect, device number 3
> 	[38595.638205] bluetooth hci0: firmware: direct-loading firmware
> qca/rampatch_usb_00000302.bin
> 	[38595.638597] Bluetooth: hci0: using rampatch file:
> qca/rampatch_usb_00000302.bin
> 	[38595.638600] Bluetooth: hci0: QCA: patch rome 0x302 build 0x3e8, firmw=
are
> rome 0x302 build 0x111
> 	[38595.639047] PM: suspend exit
> 	[38595.705929] usb 3-1: new high-speed USB device number 5 using xhci_hcd
> 	[38595.781281] Process accounting resumed
> 	[38595.789445] usb 1-2: USB disconnect, device number 6
> 	[38595.855626] usb 3-1: New USB device found, idVendor=3D2109,
> idProduct=3D2817, bcdDevice=3D 5.e3
> 	[38595.855634] usb 3-1: New USB device strings: Mfr=3D1, Product=3D2,
> SerialNumber=3D3
> 	[38595.855636] usb 3-1: Product: USB2.0 Hub
> 	[38595.855637] usb 3-1: Manufacturer: VIA Labs, Inc.
> 	[38595.855639] usb 3-1: SerialNumber: 000000000
> 	[38595.857093] hub 3-1:1.0: USB hub found
> 	[38595.860701] hub 3-1:1.0: 5 ports detected
> 	[38596.001459] bluetooth hci0: firmware: direct-loading firmware
> qca/nvm_usb_00000302.bin
> 	[38596.001523] Bluetooth: hci0: using NVM file: qca/nvm_usb_00000302.bin
> 	[38596.027638] Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection
> command is advertised, but not supported.
> 	[38596.053936] usb 4-1: new SuperSpeed USB device number 4 using xhci_hcd
> 	[38596.106850] usb 4-1: New USB device found, idVendor=3D2109,
> idProduct=3D0817, bcdDevice=3D 5.e3
> 	[38596.106874] usb 4-1: New USB device strings: Mfr=3D1, Product=3D2,
> SerialNumber=3D3
> 	[38596.106885] usb 4-1: Product: USB3.0 Hub
> 	[38596.106892] usb 4-1: Manufacturer: VIA Labs, Inc.
> 	[38596.106900] usb 4-1: SerialNumber: 000000000
> 	[38596.112949] hub 4-1:1.0: USB hub found
> 	[38596.113079] hub 4-1:1.0: 4 ports detected
> 	[38596.613810] usb 3-1.1: new high-speed USB device number 6 using xhci_=
hcd
> 	[38596.771748] usb 3-1.1: New USB device found, idVendor=3D2109,
> idProduct=3D2817, bcdDevice=3D 7.b4
> 	[38596.771773] usb 3-1.1: New USB device strings: Mfr=3D1, Product=3D2,
> SerialNumber=3D3
> 	[38596.771784] usb 3-1.1: Product: USB2.0 Hub
> 	[38596.771792] usb 3-1.1: Manufacturer: VIA Labs, Inc.
> 	[38596.771799] usb 3-1.1: SerialNumber: 000000000
> 	[38596.775239] hub 3-1.1:1.0: USB hub found
> 	[38596.780934] hub 3-1.1:1.0: 4 ports detected
> 	[38597.159115] usb 4-1.1: new SuperSpeed USB device number 5 using xhci_=
hcd
> 	[38597.248403] usb 4-1.1: New USB device found, idVendor=3D2109,
> idProduct=3D0817, bcdDevice=3D 7.b4
> 	[38597.248410] usb 4-1.1: New USB device strings: Mfr=3D1, Product=3D2,
> SerialNumber=3D3
> 	[38597.248413] usb 4-1.1: Product: USB3.0 Hub
> 	[38597.248416] usb 4-1.1: Manufacturer: VIA Labs, Inc.
> 	[38597.248418] usb 4-1.1: SerialNumber: 000000000
> 	[38597.253883] hub 4-1.1:1.0: USB hub found
> 	[38597.254033] hub 4-1.1:1.0: 4 ports detected
> 	[38597.325788] usb 3-1.5: new high-speed USB device number 7 using xhci_=
hcd
> 	[38597.438305] usb 3-1.5: New USB device found, idVendor=3D2109,
> idProduct=3D8817, bcdDevice=3D 0.01
> 	[38597.438312] usb 3-1.5: New USB device strings: Mfr=3D1, Product=3D2,
> SerialNumber=3D3
> 	[38597.438314] usb 3-1.5: Product: USB Billboard Device
> 	[38597.438316] usb 3-1.5: Manufacturer: VIA Labs, Inc.
> 	[38597.438317] usb 3-1.5: SerialNumber: 0000000000000001
> 	[38602.697828] xhci_hcd 0000:39:00.0: Timeout while waiting for setup
> device command
> 	[38608.073709] xhci_hcd 0000:39:00.0: Timeout while waiting for setup
> device command
> 	[38608.281683] usb 4-1.4: device not accepting address 6, error -62
> 	[38608.361686] usb 3-1.1.2: new high-speed USB device number 8 using
> xhci_hcd
> 	[38608.478074] usb 3-1.1.2: New USB device found, idVendor=3D0bda,
> idProduct=3D5409, bcdDevice=3D 1.41
> 	[38608.478078] usb 3-1.1.2: New USB device strings: Mfr=3D1, Product=3D2,
> SerialNumber=3D0
> 	[38608.478080] usb 3-1.1.2: Product: 4-Port USB 2.0 Hub
> 	[38608.478081] usb 3-1.1.2: Manufacturer: Generic
> 	[38608.479686] hub 3-1.1.2:1.0: USB hub found
> 	[38608.481125] hub 3-1.1.2:1.0: 4 ports detected
> 	[38608.546211] usb 4-1.1.2: new SuperSpeed USB device number 7 using
> xhci_hcd
> 	[38608.580992] usb 4-1.1.2: New USB device found, idVendor=3D0bda,
> idProduct=3D0409, bcdDevice=3D 1.41
> 	[38608.580997] usb 4-1.1.2: New USB device strings: Mfr=3D1, Product=3D2,
> SerialNumber=3D0
> 	[38608.581000] usb 4-1.1.2: Product: 4-Port USB 3.0 Hub
> 	[38608.581001] usb 4-1.1.2: Manufacturer: Generic
> 	[38608.586469] hub 4-1.1.2:1.0: USB hub found
> 	[38608.587779] hub 4-1.1.2:1.0: 2 ports detected
> 	[38613.965663] xhci_hcd 0000:39:00.0: Timeout while waiting for setup
> device command
> 	[38619.337632] xhci_hcd 0000:39:00.0: Timeout while waiting for setup
> device command
> 	[38619.549614] usb 4-1.4: device not accepting address 8, error -62
> 	[38619.549715] usb 4-1-port4: attempt power cycle
> 	[38619.821998] usb 4-1.1.2: USB disconnect, device number 7
> 	[38620.526463] usb 3-1.1.2-port3: cannot reset (err =3D -71)
> 	[38620.526588] usb 3-1.1.2-port3: cannot reset (err =3D -71)
> 	[38620.526707] usb 3-1.1.2-port3: cannot reset (err =3D -71)
> 	[38620.526826] usb 3-1.1.2-port3: cannot reset (err =3D -71)
> 	[38620.526946] usb 3-1.1.2-port3: cannot reset (err =3D -71)
> 	[38620.526947] usb 3-1.1.2-port3: Cannot enable. Maybe the USB cable is
> bad?
> 	[38620.527067] usb 3-1.1.2-port3: cannot disable (err =3D -71)
> 	[38620.527168] usb 3-1.1.2: USB disconnect, device number 8
> 	[38620.527276] usb 3-1.1.2-port3: cannot reset (err =3D -71)
> 	[38620.527315] usb 3-1.1.2-port3: attempt power cycle
> 	[38620.605648] usb 4-1.1.3: new SuperSpeed USB device number 9 using
> xhci_hcd
> 	[38620.626284] usb 4-1.1.3: New USB device found, idVendor=3D0bda,
> idProduct=3D8153, bcdDevice=3D30.00
> 	[38620.626289] usb 4-1.1.3: New USB device strings: Mfr=3D1, Product=3D2,
> SerialNumber=3D6
> 	[38620.626291] usb 4-1.1.3: Product: USB 10/100/1000 LAN
> 	[38620.626293] usb 4-1.1.3: Manufacturer: Realtek
> 	[38620.626294] usb 4-1.1.3: SerialNumber: 000001
> 	[38620.709920] r8152-cfgselector 4-1.1.3: reset SuperSpeed USB device
> number 9 using xhci_hcd
> 	[38620.735991] r8152 4-1.1.3:1.0: firmware: direct-loading firmware
> rtl_nic/rtl8153a-4.fw
> 	[38620.751888] r8152 4-1.1.3:1.0: load rtl8153a-4 v2 02/07/20 successful=
ly
> 	[38620.778160] r8152 4-1.1.3:1.0 eth0: v1.12.13
> 	[38625.993752] xhci_hcd 0000:39:00.0: Timeout while waiting for setup
> device command
> 	[38631.377560] xhci_hcd 0000:39:00.0: Timeout while waiting for setup
> device command
> 	[38631.585798] usb 4-1.4: device not accepting address 10, error -62
> 	[38632.354657] usb 4-1.1.2: new SuperSpeed USB device number 12 using
> xhci_hcd
> 	[38632.393341] usb 4-1.1.2: New USB device found, idVendor=3D0bda,
> idProduct=3D0409, bcdDevice=3D 1.41
> 	[38632.393369] usb 4-1.1.2: New USB device strings: Mfr=3D1, Product=3D2,
> SerialNumber=3D0
> 	[38632.393380] usb 4-1.1.2: Product: 4-Port USB 3.0 Hub
> 	[38632.393389] usb 4-1.1.2: Manufacturer: Generic
> 	[38632.400130] hub 4-1.1.2:1.0: USB hub found
> 	[38632.401721] hub 4-1.1.2:1.0: 2 ports detected
> 	[38632.499522] r8152 4-1.1.3:1.0 enx00e04ceabc41: renamed from eth0
> 	[38632.501556] usb 3-1.1.2: new high-speed USB device number 14 using
> xhci_hcd
> 	[38632.556184] r8152 4-1.1.3:1.0 enx00e04ceabc41: carrier on
> 	[38632.619579] usb 3-1.1.2: New USB device found, idVendor=3D0bda,
> idProduct=3D5409, bcdDevice=3D 1.41
> 	[38632.619594] usb 3-1.1.2: New USB device strings: Mfr=3D1, Product=3D2,
> SerialNumber=3D0
> 	[38632.619600] usb 3-1.1.2: Product: 4-Port USB 2.0 Hub
> 	[38632.619605] usb 3-1.1.2: Manufacturer: Generic
> 	[38632.622412] hub 3-1.1.2:1.0: USB hub found
> 	[38632.623596] hub 3-1.1.2:1.0: 4 ports detected
> 	[38632.913524] usb 3-1.1.2.3: new low-speed USB device number 15 using
> xhci_hcd
> 	[38633.019668] usb 3-1.1.2.3: New USB device found, idVendor=3D1bcf,
> idProduct=3D0005, bcdDevice=3D 0.14
> 	[38633.019695] usb 3-1.1.2.3: New USB device strings: Mfr=3D0, Product=
=3D2,
> SerialNumber=3D0
> 	[38633.019707] usb 3-1.1.2.3: Product: USB Optical Mouse
> 	[38633.031545] input: USB Optical Mouse as /devices/pci0000:00/0000:00:1=
c.0/0000:01:00.0/0000:02:02.0/0000:39:00.0/usb3/3-1/3-1.1/3-1.1.2/3-1.1.2.3=
/3-1.1.2.3:1.0/0003:1BCF:0005.0014/input/input70
> 	[38633.033300] hid-generic 0003:1BCF:0005.0014: input,hidraw2: USB HID
> v1.10 Mouse [USB Optical Mouse] on usb-0000:39:00.0-1.1.2.3/input0
> 	[38633.113596] usb 3-1.1.2.4: new low-speed USB device number 16 using
> xhci_hcd
> 	[38633.225735] usb 3-1.1.2.4: New USB device found, idVendor=3D413c,
> idProduct=3D2113, bcdDevice=3D 1.08
> 	[38633.225768] usb 3-1.1.2.4: New USB device strings: Mfr=3D0, Product=
=3D2,
> SerialNumber=3D0
> 	[38633.225779] usb 3-1.1.2.4: Product: Dell KB216 Wired Keyboard
> 	[38633.239071] input: Dell KB216 Wired Keyboard as /devices/pci0000:00/0=
000:00:1c.0/0000:01:00.0/0000:02:02.0/0000:39:00.0/usb3/3-1/3-1.1/3-1.1.2/3=
-1.1.2.4/3-1.1.2.4:1.0/0003:413C:2113.0015/input/input71
> 	[38633.298892] hid-generic 0003:413C:2113.0015: input,hidraw3: USB HID
> v1.11 Keyboard [Dell KB216 Wired Keyboard] on
> usb-0000:39:00.0-1.1.2.4/input0
> 	[38633.304640] input: Dell KB216 Wired Keyboard System Control as /devic=
es/pci0000:00/0000:00:1c.0/0000:01:00.0/0000:02:02.0/0000:39:00.0/usb3/3-1/=
3-1.1/3-1.1.2/3-1.1.2.4/3-1.1.2.4:1.1/0003:413C:2113.0016/input/input72
> 	[38633.364625] input: Dell KB216 Wired Keyboard Consumer Control as /dev=
ices/pci0000:00/0000:00:1c.0/0000:01:00.0/0000:02:02.0/0000:39:00.0/usb3/3-=
1/3-1.1/3-1.1.2/3-1.1.2.4/3-1.1.2.4:1.1/0003:413C:2113.0016/input/input73
> 	[38633.366247] hid-generic 0003:413C:2113.0016: input,hidraw4: USB HID
> v1.11 Device [Dell KB216 Wired Keyboard] on usb-0000:39:00.0-1.1.2.4/inpu=
t1
> 	[38638.537721] xhci_hcd 0000:39:00.0: Timeout while waiting for setup
> device command
> 	[38638.537926] r8152-cfgselector 4-1.1.3: Failed to read 4 bytes at
> 0xc010/0x0100 (-110)
> 	[38642.633437] ------------[ cut here ]------------
> 	[38642.633441] NETDEV WATCHDOG: enx00e04ceabc41 (r8152): transmit queue 0
> timed out 9108 ms
> 	[38642.633456] WARNING: CPU: 0 PID: 18199 at net/sched/sch_generic.c:525
> dev_watchdog+0x232/0x240
> 	[38642.633463] Modules linked in: snd_usb_audio snd_usbmidi_lib snd_rawm=
idi
> rfcomm cmac algif_hash algif_skcipher af_alg bnep st sr_mod cdrom nvram
> typec_displayport r8153_ecm cdc_ether usbnet r8152 mii ccm sd_mod sg uas
> usb_storage scsi_mod scsi_common snd_seq_dummy snd_hrtimer snd_seq
> snd_seq_device l2tp_ppp l2tp_netlink l2tp_core ip6_udp_tunnel xfrm_interf=
ace
> xfrm6_tunnel udp_tunnel tunnel6 tunnel4 pppox xfrm_user xfrm_algo
> ppp_generic slhc qrtr snd_sof_pci_intel_skl snd_sof_intel_hda_common
> snd_hda_codec_hdmi soundwire_intel soundwire_generic_allocation
> snd_sof_intel_hda_mlink soundwire_cadence snd_ctl_led snd_sof_intel_hda
> snd_sof_pci snd_sof_xtensa_dsp snd_sof snd_hda_codec_realtek
> snd_hda_codec_generic snd_sof_utils soundwire_bus snd_soc_avs
> snd_soc_hda_codec snd_soc_skl snd_soc_hdac_hda snd_hda_ext_core
> snd_soc_sst_ipc snd_soc_sst_dsp snd_soc_acpi_intel_match binfmt_misc
> snd_soc_acpi snd_soc_core ath10k_pci snd_compress x86_pkg_temp_thermal
> intel_powerclamp ath10k_core coretemp snd_pcm_dmaengine kvm_intel
> 	[38642.633516]  nls_ascii snd_hda_intel nls_cp437 ath snd_intel_dspcfg k=
vm
> vfat mei_hdcp snd_intel_sdw_acpi mei_pxp mei_wdt fat i915 snd_hda_codec
> mac80211 uvcvideo irqbypass intel_rapl_msr btusb dell_laptop snd_hda_core
> ledtrig_audio btrtl libarc4 dell_wmi dell_smm_hwmon btintel snd_hwdep rapl
> joydev videobuf2_vmalloc dell_smbios intel_cstate snd_pcm iTCO_wdt dcdbas
> btbcm intel_wmi_thunderbolt intel_pmc_bxt snd_timer uvc cfg80211 btmtk
> videobuf2_memops wmi_bmof snd intel_uncore videobuf2_v4l2
> dell_wmi_descriptor bluetooth iTCO_vendor_support videodev mei_me watchdog
> soundcore pcspkr ucsi_acpi typec_ucsi videobuf2_common ecdh_generic mei
> typec rfkill mc drm_buddy intel_pch_thermal drm_display_helper cec
> intel_vbtn processor_thermal_device_pci_legacy soc_button_array rc_core
> processor_thermal_device ttm processor_thermal_rfim processor_thermal_mbox
> drm_kms_helper int3403_thermal processor_thermal_rapl intel_rapl_common
> intel_xhci_usb_role_switch int3400_thermal i2c_algo_bit int340x_thermal_z=
one
> intel_hid intel_pmc_core
> 	[38642.633571]  acpi_thermal_rel ac roles intel_soc_dts_iosf acpi_pad
> sparse_keymap evdev button hid_multitouch serio_raw msr parport_pc ppdev =
lp
> parport loop efi_pstore configfs nfnetlink efivarfs ip_tables x_tables
> autofs4 ext4 crc16 mbcache jbd2 crc32c_generic usbhid dm_crypt dm_mod nvme
> crc32_pclmul nvme_core crc32c_intel ghash_clmulni_intel t10_pi hid_generic
> sha512_ssse3 xhci_pci crc64_rocksoft_generic xhci_hcd sha256_ssse3
> i2c_hid_acpi i2c_hid sha1_ssse3 crc64_rocksoft drm usbcore crc_t10dif
> aesni_intel i2c_i801 intel_lpss_pci crct10dif_generic crct10dif_pclmul
> intel_lpss crc64 crypto_simd cryptd idma64 crct10dif_common i2c_smbus
> usb_common hid battery video wmi
> 	[38642.633615] CPU: 0 PID: 18199 Comm: Compositor Not tainted 6.6.15-amd=
64
> #1  Debian 6.6.15-2
> 	[38642.633618] Hardware name: Dell Inc. XPS 13 9360/0596KF, BIOS 2.21.0
> 06/02/2022
> 	[38642.633619] RIP: 0010:dev_watchdog+0x232/0x240
> 	[38642.633622] Code: ff ff ff 48 89 df c6 05 6e e1 3f 01 01 e8 86 32 fa =
ff
> 45 89 f8 44 89 f1 48 89 de 48 89 c2 48 c7 c7 98 5f 12 8c e8 be 97 6a ff <=
0f>
> 0b e9 2d ff ff ff 0f 1f 80 00 00 00 00 90 90 90 90 90 90 90 90
> 	[38642.633624] RSP: 0018:ffffc90000003e78 EFLAGS: 00010286
> 	[38642.633626] RAX: 0000000000000000 RBX: ffff888166230000 RCX:
> 0000000000000027
> 	[38642.633627] RDX: ffff88846f0213c8 RSI: 0000000000000001 RDI:
> ffff88846f0213c0
> 	[38642.633629] RBP: ffff8881662304c8 R08: 0000000000000000 R09:
> ffffc90000003d00
> 	[38642.633630] R10: 0000000000000003 R11: ffff888480ffdfe8 R12:
> ffff8881079b9a00
> 	[38642.633631] R13: ffff88816623041c R14: 0000000000000000 R15:
> 0000000000002394
> 	[38642.633632] FS:  00007f87749ff6c0(0000) GS:ffff88846f000000(0000)
> knlGS:0000000000000000
> 	[38642.633634] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> 	[38642.633635] CR2: 00007f875e26d000 CR3: 000000014536e003 CR4:
> 00000000003706f0
> 	[38642.633637] Call Trace:
> 	[38642.633639]  <IRQ>
> 	[38642.633640]  ? dev_watchdog+0x232/0x240
> 	[38642.633642]  ? __warn+0x81/0x130
> 	[38642.633647]  ? dev_watchdog+0x232/0x240
> 	[38642.633649]  ? report_bug+0x171/0x1a0
> 	[38642.633652]  ? prb_read_valid+0x1b/0x30
> 	[38642.633655]  ? handle_bug+0x3c/0x80
> 	[38642.633658]  ? exc_invalid_op+0x17/0x70
> 	[38642.633660]  ? asm_exc_invalid_op+0x1a/0x20
> 	[38642.633664]  ? dev_watchdog+0x232/0x240
> 	[38642.633666]  ? dev_watchdog+0x232/0x240
> 	[38642.633668]  ? __pfx_dev_watchdog+0x10/0x10
> 	[38642.633670]  call_timer_fn+0x24/0x130
> 	[38642.633673]  ? __pfx_dev_watchdog+0x10/0x10
> 	[38642.633675]  __run_timers+0x222/0x2c0
> 	[38642.633679]  run_timer_softirq+0x1d/0x40
> 	[38642.633681]  __do_softirq+0xc7/0x2ae
> 	[38642.633686]  __irq_exit_rcu+0x96/0xb0
> 	[38642.633689]  sysvec_apic_timer_interrupt+0x72/0x90
> 	[38642.633693]  </IRQ>
> 	[38642.633694]  <TASK>
> 	[38642.633695]  asm_sysvec_apic_timer_interrupt+0x1a/0x20
> 	[38642.633697] RIP: 0010:_compound_head+0x8/0x40
> 	[38642.633700] Code: 44 00 00 c3 cc cc cc cc 66 2e 0f 1f 84 00 00 00 00 =
00
> 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 48 8b 47 08 a8 01 75 21 <=
66>
> 90 48 89 f8 c3 cc cc cc cc f7 c7 ff 0f 00 00 75 f0 48 8b 07 a8
> 	[38642.633702] RSP: 0018:ffffc90006453c00 EFLAGS: 00000246
> 	[38642.633704] RAX: ffffea000bbc0208 RBX: ffff8882f72e52c0 RCX:
> 0000000000000000
> 	[38642.633705] RDX: 8000000000000867 RSI: 80000002fd040867 RDI:
> ffffea000bf41000
> 	[38642.633706] RBP: 00007f8737059000 R08: ffff8882de5b4cf0 R09:
> 0000000000000011
> 	[38642.633707] R10: 0000000000000001 R11: 0000000000000100 R12:
> ffffc90006453d30
> 	[38642.633708] R13: 00007f8737058000 R14: ffffea000bf41000 R15:
> 0000000000000000
> 	[38642.633712]  unmap_page_range+0x601/0x1060
> 	[38642.633717]  zap_page_range_single+0x122/0x1d0
> 	[38642.633721]  do_madvise+0xc85/0x1000
> 	[38642.633726]  ? exit_to_user_mode_prepare+0x40/0x1e0
> 	[38642.633728]  ? syscall_exit_to_user_mode+0x2b/0x40
> 	[38642.633731]  __x64_sys_madvise+0x2c/0x40
> 	[38642.633733]  do_syscall_64+0x5d/0xc0
> 	[38642.633737]  ? do_user_addr_fault+0x30f/0x660
> 	[38642.633741]  ? exit_to_user_mode_prepare+0x40/0x1e0
> 	[38642.633743]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
> 	[38642.633745] RIP: 0033:0x7f878f11f337
> 	[38642.633747] Code: ff ff ff ff c3 66 0f 1f 44 00 00 48 8b 15 d9 1a 0d =
00
> f7 d8 64 89 02 b8 ff ff ff ff eb bc 0f 1f 44 00 00 b8 1c 00 00 00 0f 05 <=
48>
> 3d 01 f0 ff ff 73 01 c3 48 8b 0d b1 1a 0d 00 f7 d8 64 89 01 48
> 	[38642.633749] RSP: 002b:00007f87749fe8c8 EFLAGS: 00000206 ORIG_RAX:
> 000000000000001c
> 	[38642.633751] RAX: ffffffffffffffda RBX: 0000000000000080 RCX:
> 00007f878f11f337
> 	[38642.633752] RDX: 0000000000000004 RSI: 0000000000017000 RDI:
> 00007f873704b000
> 	[38642.633753] RBP: 000000000000004b R08: 00007f875e000c68 R09:
> 000000000006b008
> 	[38642.633754] R10: 0000000000000000 R11: 0000000000000206 R12:
> 00007f8737000000
> 	[38642.633755] R13: 00007f8737000018 R14: 00007f878ef00000 R15:
> 00007f878ef00060
> 	[38642.633758]  </TASK>
> 	[38642.633759] ---[ end trace 0000000000000000 ]---
> 	[38642.633763] r8152 4-1.1.3:1.0 enx00e04ceabc41: Tx timeout
> 	[38642.634888] usb 3-1.1.2: USB disconnect, device number 14
> 	[38642.634893] usb 3-1.1.2.3: USB disconnect, device number 15
> 	[38643.913481] xhci_hcd 0000:39:00.0: Timeout while waiting for setup
> device command
> 	[38643.913970] usb 4-1.1.2: USB disconnect, device number 12
> 	[38643.967204] usb 3-1.1.2.4: USB disconnect, device number 16
> 	[38644.121497] usb 4-1.4: device not accepting address 13, error -62
> 	[38644.204560] r8152-cfgselector 4-1.1.3: reset SuperSpeed USB device
> number 9 using xhci_hcd
> 	[38644.222345] r8152-cfgselector 4-1.1.3: device firmware changed
> 	[38644.222683] r8152 4-1.1.3:1.0 enx00e04ceabc41: Get ether addr fail
> 	[38644.223644] r8152-cfgselector 4-1.1.3: USB disconnect, device number 9
> 	[38645.241754] usb 4-1.1.3: new SuperSpeed USB device number 15 using
> xhci_hcd
> 	[38645.274925] usb 4-1.1.3: New USB device found, idVendor=3D0bda,
> idProduct=3D8153, bcdDevice=3D30.00
> 	[38645.274933] usb 4-1.1.3: New USB device strings: Mfr=3D1, Product=3D2,
> SerialNumber=3D6
> 	[38645.274936] usb 4-1.1.3: Product: USB 10/100/1000 LAN
> 	[38645.274938] usb 4-1.1.3: Manufacturer: Realtek
> 	[38645.274940] usb 4-1.1.3: SerialNumber: 000001
> 	[38645.353643] usb 3-1.1.2: new high-speed USB device number 17 using
> xhci_hcd
> 	[38645.471405] usb 3-1.1.2: New USB device found, idVendor=3D0bda,
> idProduct=3D5409, bcdDevice=3D 1.41
> 	[38645.471430] usb 3-1.1.2: New USB device strings: Mfr=3D1, Product=3D2,
> SerialNumber=3D0
> 	[38645.471439] usb 3-1.1.2: Product: 4-Port USB 2.0 Hub
> 	[38645.471447] usb 3-1.1.2: Manufacturer: Generic
> 	[38645.477812] hub 3-1.1.2:1.0: USB hub found
> 	[38645.479071] hub 3-1.1.2:1.0: 4 ports detected
> 	[38645.541942] r8152-cfgselector 4-1.1.3: reset SuperSpeed USB device
> number 15 using xhci_hcd
> 	[38645.567808] r8152 4-1.1.3:1.0: firmware: direct-loading firmware
> rtl_nic/rtl8153a-4.fw
> 	[38645.584243] r8152 4-1.1.3:1.0: load rtl8153a-4 v2 02/07/20 successful=
ly
> 	[38645.615859] r8152 4-1.1.3:1.0 eth0: v1.12.13
> 	[38645.769699] usb 3-1.1.2.3: new low-speed USB device number 18 using
> xhci_hcd
> 	[38645.875122] usb 3-1.1.2.3: New USB device found, idVendor=3D1bcf,
> idProduct=3D0005, bcdDevice=3D 0.14
> 	[38645.875148] usb 3-1.1.2.3: New USB device strings: Mfr=3D0, Product=
=3D2,
> SerialNumber=3D0
> 	[38645.875158] usb 3-1.1.2.3: Product: USB Optical Mouse
> 	[38645.886715] input: USB Optical Mouse as /devices/pci0000:00/0000:00:1=
c.0/0000:01:00.0/0000:02:02.0/0000:39:00.0/usb3/3-1/3-1.1/3-1.1.2/3-1.1.2.3=
/3-1.1.2.3:1.0/0003:1BCF:0005.0017/input/input74
> 	[38645.887619] hid-generic 0003:1BCF:0005.0017: input,hidraw2: USB HID
> v1.10 Mouse [USB Optical Mouse] on usb-0000:39:00.0-1.1.2.3/input0
> 	[38645.950471] usb 4-1.1.2: new SuperSpeed USB device number 16 using
> xhci_hcd
> 	[38645.987887] usb 4-1.1.2: New USB device found, idVendor=3D0bda,
> idProduct=3D0409, bcdDevice=3D 1.41
> 	[38645.987912] usb 4-1.1.2: New USB device strings: Mfr=3D1, Product=3D2,
> SerialNumber=3D0
> 	[38645.987923] usb 4-1.1.2: Product: 4-Port USB 3.0 Hub
> 	[38645.987931] usb 4-1.1.2: Manufacturer: Generic
> 	[38645.997841] hub 4-1.1.2:1.0: USB hub found
> 	[38645.999463] hub 4-1.1.2:1.0: 2 ports detected
> 	[38646.057710] usb 3-1.1.2.4: new low-speed USB device number 19 using
> xhci_hcd
> 	[38646.167623] usb 3-1.1.2.4: New USB device found, idVendor=3D413c,
> idProduct=3D2113, bcdDevice=3D 1.08
> 	[38646.167652] usb 3-1.1.2.4: New USB device strings: Mfr=3D0, Product=
=3D2,
> SerialNumber=3D0
> 	[38646.167667] usb 3-1.1.2.4: Product: Dell KB216 Wired Keyboard
> 	[38646.179226] input: Dell KB216 Wired Keyboard as /devices/pci0000:00/0=
000:00:1c.0/0000:01:00.0/0000:02:02.0/0000:39:00.0/usb3/3-1/3-1.1/3-1.1.2/3=
-1.1.2.4/3-1.1.2.4:1.0/0003:413C:2113.0018/input/input75
> 	[38646.228219] r8152 4-1.1.3:1.0 enx00e04ceabc41: renamed from eth0
> 	[38646.237585] hid-generic 0003:413C:2113.0018: input,hidraw3: USB HID
> v1.11 Keyboard [Dell KB216 Wired Keyboard] on
> usb-0000:39:00.0-1.1.2.4/input0
> 	[38646.242108] input: Dell KB216 Wired Keyboard System Control as /devic=
es/pci0000:00/0000:00:1c.0/0000:01:00.0/0000:02:02.0/0000:39:00.0/usb3/3-1/=
3-1.1/3-1.1.2/3-1.1.2.4/3-1.1.2.4:1.1/0003:413C:2113.0019/input/input76
> 	[38646.301897] input: Dell KB216 Wired Keyboard Consumer Control as /dev=
ices/pci0000:00/0000:00:1c.0/0000:01:00.0/0000:02:02.0/0000:39:00.0/usb3/3-=
1/3-1.1/3-1.1.2/3-1.1.2.4/3-1.1.2.4:1.1/0003:413C:2113.0019/input/input77
> 	[38646.302145] hid-generic 0003:413C:2113.0019: input,hidraw4: USB HID
> v1.11 Device [Dell KB216 Wired Keyboard] on usb-0000:39:00.0-1.1.2.4/inpu=
t1
> 	[38649.323714] r8152 4-1.1.3:1.0 enx00e04ceabc41: carrier on
> 	[38651.133683] usb 4-1.1.2: USB disconnect, device number 16
> 	[38651.339130] usb 3-1.1.2: USB disconnect, device number 17
> 	[38651.339137] usb 3-1.1.2.3: USB disconnect, device number 18
> 	[38651.373344] usb 3-1.1.2.4: USB disconnect, device number 19
> 	[38655.226715] usb 4-1.1.2: new SuperSpeed USB device number 17 using
> xhci_hcd
> 	[38655.262775] usb 4-1.1.2: New USB device found, idVendor=3D0bda,
> idProduct=3D0409, bcdDevice=3D 1.41
> 	[38655.262787] usb 4-1.1.2: New USB device strings: Mfr=3D1, Product=3D2,
> SerialNumber=3D0
> 	[38655.262791] usb 4-1.1.2: Product: 4-Port USB 3.0 Hub
> 	[38655.262794] usb 4-1.1.2: Manufacturer: Generic
> 	[38655.268905] hub 4-1.1.2:1.0: USB hub found
> 	[38655.270308] hub 4-1.1.2:1.0: 2 ports detected
> 	[38655.405611] usb 3-1.1.2: new high-speed USB device number 20 using
> xhci_hcd
> 	[38655.530977] usb 3-1.1.2: New USB device found, idVendor=3D0bda,
> idProduct=3D5409, bcdDevice=3D 1.41
> 	[38655.531005] usb 3-1.1.2: New USB device strings: Mfr=3D1, Product=3D2,
> SerialNumber=3D0
> 	[38655.531017] usb 3-1.1.2: Product: 4-Port USB 2.0 Hub
> 	[38655.531025] usb 3-1.1.2: Manufacturer: Generic
> 	[38655.537787] hub 3-1.1.2:1.0: USB hub found
> 	[38655.539698] hub 3-1.1.2:1.0: 4 ports detected
> 	[38655.829616] usb 3-1.1.2.3: new low-speed USB device number 21 using
> xhci_hcd
> 	[38655.938429] usb 3-1.1.2.3: New USB device found, idVendor=3D1bcf,
> idProduct=3D0005, bcdDevice=3D 0.14
> 	[38655.938437] usb 3-1.1.2.3: New USB device strings: Mfr=3D0, Product=
=3D2,
> SerialNumber=3D0
> 	[38655.938440] usb 3-1.1.2.3: Product: USB Optical Mouse
> 	[38655.947994] input: USB Optical Mouse as /devices/pci0000:00/0000:00:1=
c.0/0000:01:00.0/0000:02:02.0/0000:39:00.0/usb3/3-1/3-1.1/3-1.1.2/3-1.1.2.3=
/3-1.1.2.3:1.0/0003:1BCF:0005.001A/input/input78
> 	[38655.948311] hid-generic 0003:1BCF:0005.001A: input,hidraw2: USB HID
> v1.10 Mouse [USB Optical Mouse] on usb-0000:39:00.0-1.1.2.3/input0
> 	[38656.025535] usb 3-1.1.2.4: new low-speed USB device number 22 using
> xhci_hcd
> 	[38656.132800] usb 3-1.1.2.4: New USB device found, idVendor=3D413c,
> idProduct=3D2113, bcdDevice=3D 1.08
> 	[38656.132827] usb 3-1.1.2.4: New USB device strings: Mfr=3D0, Product=
=3D2,
> SerialNumber=3D0
> 	[38656.132839] usb 3-1.1.2.4: Product: Dell KB216 Wired Keyboard
> 	[38656.145479] input: Dell KB216 Wired Keyboard as /devices/pci0000:00/0=
000:00:1c.0/0000:01:00.0/0000:02:02.0/0000:39:00.0/usb3/3-1/3-1.1/3-1.1.2/3=
-1.1.2.4/3-1.1.2.4:1.0/0003:413C:2113.001B/input/input79
> 	[38656.206967] hid-generic 0003:413C:2113.001B: input,hidraw3: USB HID
> v1.11 Keyboard [Dell KB216 Wired Keyboard] on
> usb-0000:39:00.0-1.1.2.4/input0
> 	[38656.214961] input: Dell KB216 Wired Keyboard System Control as /devic=
es/pci0000:00/0000:00:1c.0/0000:01:00.0/0000:02:02.0/0000:39:00.0/usb3/3-1/=
3-1.1/3-1.1.2/3-1.1.2.4/3-1.1.2.4:1.1/0003:413C:2113.001C/input/input80
> 	[38656.274216] input: Dell KB216 Wired Keyboard Consumer Control as /dev=
ices/pci0000:00/0000:00:1c.0/0000:01:00.0/0000:02:02.0/0000:39:00.0/usb3/3-=
1/3-1.1/3-1.1.2/3-1.1.2.4/3-1.1.2.4:1.1/0003:413C:2113.001C/input/input81
> 	[38656.274934] hid-generic 0003:413C:2113.001C: input,hidraw4: USB HID
> v1.11 Device [Dell KB216 Wired Keyboard] on usb-0000:39:00.0-1.1.2.4/inpu=
t1
>=20
> They are detected by Linux also in the non-working case. Do you spot
> something in the logs? Or could it be a hardware issue with the LMP devic=
e?

This looks like muxing issue, but I can't be sure. If that is the
case, then there is nothing we can do about it in the operating
system. All that is handled in the firmware.

Mathias, can you take a look at this?

>=20
> Kind regards,
>=20
> Paul
>=20
>=20
> [1]: https://lmp-adapter.com/product/lmp-usb-c-mini-dock/?attribute_pa_co=
lor=3Dsilver
>      "LMP USB-C mini Dock (P/N 15954)"

> [    0.000000] microcode: updated early: 0xf0 -> 0xf4, date =3D 2023-02-22
> [    0.000000] Linux version 6.6.15-amd64 (debian-kernel@lists.debian.org=
) (gcc-13 (Debian 13.2.0-13) 13.2.0, GNU ld (GNU Binutils for Debian) 2.42)=
 #1 SMP PREEMPT_DYNAMIC Debian 6.6.15-2 (2024-02-04)
> [    0.000000] Command line: BOOT_IMAGE=3D/vmlinuz-6.6.15-amd64 root=3DUU=
ID=3D32e29882-d94d-4a92-9ee4-4d03002bfa29 ro quiet pci=3Dnoaer mem_sleep_de=
fault=3Ddeep log_buf_len=3D8M cryptomgr.notests i8042.dumbkbd=3D1
> [    0.000000] BIOS-provided physical RAM map:
> [    0.000000] BIOS-e820: [mem 0x0000000000000000-0x0000000000057fff] usa=
ble
> [    0.000000] BIOS-e820: [mem 0x0000000000058000-0x0000000000058fff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x0000000000059000-0x000000000009dfff] usa=
ble
> [    0.000000] BIOS-e820: [mem 0x000000000009e000-0x00000000000fffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x0000000000100000-0x00000000556aafff] usa=
ble
> [    0.000000] BIOS-e820: [mem 0x00000000556ab000-0x00000000556abfff] ACP=
I NVS
> [    0.000000] BIOS-e820: [mem 0x00000000556ac000-0x00000000556acfff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000556ad000-0x0000000064df3fff] usa=
ble
> [    0.000000] BIOS-e820: [mem 0x0000000064df4000-0x000000006517ffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x0000000065180000-0x00000000651c3fff] ACP=
I data
> [    0.000000] BIOS-e820: [mem 0x00000000651c4000-0x000000006f871fff] ACP=
I NVS
> [    0.000000] BIOS-e820: [mem 0x000000006f872000-0x000000006fffefff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x000000006ffff000-0x000000006fffffff] usa=
ble
> [    0.000000] BIOS-e820: [mem 0x0000000070000000-0x0000000077ffffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x0000000078000000-0x00000000785fffff] usa=
ble
> [    0.000000] BIOS-e820: [mem 0x0000000078600000-0x000000007c7fffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000e0000000-0x00000000efffffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000fe000000-0x00000000fe010fff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000fec00000-0x00000000fec00fff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000fee00000-0x00000000fee00fff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x00000000ff000000-0x00000000ffffffff] res=
erved
> [    0.000000] BIOS-e820: [mem 0x0000000100000000-0x00000004817fffff] usa=
ble
> [    0.000000] NX (Execute Disable) protection: active
> [    0.000000] APIC: Static calls initialized
> [    0.000000] e820: update [mem 0x52e59018-0x52e69057] usable =3D=3D> us=
able
> [    0.000000] e820: update [mem 0x52e59018-0x52e69057] usable =3D=3D> us=
able
> [    0.000000] extended physical RAM map:
> [    0.000000] reserve setup_data: [mem 0x0000000000000000-0x000000000005=
7fff] usable
> [    0.000000] reserve setup_data: [mem 0x0000000000058000-0x000000000005=
8fff] reserved
> [    0.000000] reserve setup_data: [mem 0x0000000000059000-0x000000000009=
dfff] usable
> [    0.000000] reserve setup_data: [mem 0x000000000009e000-0x00000000000f=
ffff] reserved
> [    0.000000] reserve setup_data: [mem 0x0000000000100000-0x0000000052e5=
9017] usable
> [    0.000000] reserve setup_data: [mem 0x0000000052e59018-0x0000000052e6=
9057] usable
> [    0.000000] reserve setup_data: [mem 0x0000000052e69058-0x00000000556a=
afff] usable
> [    0.000000] reserve setup_data: [mem 0x00000000556ab000-0x00000000556a=
bfff] ACPI NVS
> [    0.000000] reserve setup_data: [mem 0x00000000556ac000-0x00000000556a=
cfff] reserved
> [    0.000000] reserve setup_data: [mem 0x00000000556ad000-0x0000000064df=
3fff] usable
> [    0.000000] reserve setup_data: [mem 0x0000000064df4000-0x000000006517=
ffff] reserved
> [    0.000000] reserve setup_data: [mem 0x0000000065180000-0x00000000651c=
3fff] ACPI data
> [    0.000000] reserve setup_data: [mem 0x00000000651c4000-0x000000006f87=
1fff] ACPI NVS
> [    0.000000] reserve setup_data: [mem 0x000000006f872000-0x000000006fff=
efff] reserved
> [    0.000000] reserve setup_data: [mem 0x000000006ffff000-0x000000006fff=
ffff] usable
> [    0.000000] reserve setup_data: [mem 0x0000000070000000-0x0000000077ff=
ffff] reserved
> [    0.000000] reserve setup_data: [mem 0x0000000078000000-0x00000000785f=
ffff] usable
> [    0.000000] reserve setup_data: [mem 0x0000000078600000-0x000000007c7f=
ffff] reserved
> [    0.000000] reserve setup_data: [mem 0x00000000e0000000-0x00000000efff=
ffff] reserved
> [    0.000000] reserve setup_data: [mem 0x00000000fe000000-0x00000000fe01=
0fff] reserved
> [    0.000000] reserve setup_data: [mem 0x00000000fec00000-0x00000000fec0=
0fff] reserved
> [    0.000000] reserve setup_data: [mem 0x00000000fee00000-0x00000000fee0=
0fff] reserved
> [    0.000000] reserve setup_data: [mem 0x00000000ff000000-0x00000000ffff=
ffff] reserved
> [    0.000000] reserve setup_data: [mem 0x0000000100000000-0x00000004817f=
ffff] usable
> [    0.000000] efi: EFI v2.4 by American Megatrends
> [    0.000000] efi: ACPI=3D0x6518d000 ACPI 2.0=3D0x6518d000 SMBIOS=3D0xf0=
000 SMBIOS 3.0=3D0xf0020 TPMFinalLog=3D0x6f812000 ESRT=3D0x6fc86698 MEMATTR=
=3D0x62676018 INITRD=3D0x5577da98 TPMEventLog=3D0x55778018=20
> [    0.000000] efi: Remove mem37: MMIO range=3D[0xe0000000-0xefffffff] (2=
56MB) from e820 map
> [    0.000000] e820: remove [mem 0xe0000000-0xefffffff] reserved
> [    0.000000] efi: Not removing mem38: MMIO range=3D[0xfe000000-0xfe010f=
ff] (68KB) from e820 map
> [    0.000000] efi: Not removing mem39: MMIO range=3D[0xfec00000-0xfec00f=
ff] (4KB) from e820 map
> [    0.000000] efi: Not removing mem40: MMIO range=3D[0xfee00000-0xfee00f=
ff] (4KB) from e820 map
> [    0.000000] efi: Remove mem41: MMIO range=3D[0xff000000-0xffffffff] (1=
6MB) from e820 map
> [    0.000000] e820: remove [mem 0xff000000-0xffffffff] reserved
> [    0.000000] secureboot: Secure boot disabled
> [    0.000000] SMBIOS 3.0.0 present.
> [    0.000000] DMI: Dell Inc. XPS 13 9360/0596KF, BIOS 2.21.0 06/02/2022
> [    0.000000] tsc: Detected 2900.000 MHz processor
> [    0.000000] tsc: Detected 2899.886 MHz TSC
> [    0.000627] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> re=
served
> [    0.000630] e820: remove [mem 0x000a0000-0x000fffff] usable
> [    0.000637] last_pfn =3D 0x481800 max_arch_pfn =3D 0x400000000
> [    0.000641] MTRR map: 4 entries (3 fixed + 1 variable; max 23), built =
=66rom 10 variable MTRRs
> [    0.000643] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- =
WT =20
> [    0.000947] last_pfn =3D 0x78600 max_arch_pfn =3D 0x400000000
> [    0.007310] esrt: Reserving ESRT space from 0x000000006fc86698 to 0x00=
0000006fc866d0.
> [    0.007315] Using GB pages for direct mapping
> [    0.014018] printk: log_buf_len: 8388608 bytes
> [    0.014019] printk: early log buf free: 125216(95%)
> [    0.014020] RAMDISK: [mem 0x4b351000-0x4edfffff]
> [    0.014024] ACPI: Early table checksum verification disabled
> [    0.014027] ACPI: RSDP 0x000000006518D000 000024 (v02 DELL  )
> [    0.014030] ACPI: XSDT 0x000000006518D0C8 00010C (v01 DELL   CBX3     =
01072009 AMI  00010013)
> [    0.014035] ACPI: FACP 0x00000000651B2A48 00010C (v05 DELL   CBX3     =
01072009 AMI  00010013)
> [    0.014039] ACPI: DSDT 0x000000006518D260 0257E7 (v02 DELL   CBX3     =
01072009 INTL 20160422)
> [    0.014042] ACPI: FACS 0x000000006F86F180 000040
> [    0.014044] ACPI: APIC 0x00000000651B2B58 000084 (v03 DELL   CBX3     =
01072009 AMI  00010013)
> [    0.014047] ACPI: FPDT 0x00000000651B2BE0 000044 (v01 DELL   CBX3     =
01072009 AMI  00010013)
> [    0.014049] ACPI: FIDT 0x00000000651B2C28 0000AC (v01 DELL   CBX3     =
01072009 AMI  00010013)
> [    0.014052] ACPI: MCFG 0x00000000651B2CD8 00003C (v01 DELL   CBX3     =
01072009 MSFT 00000097)
> [    0.014054] ACPI: HPET 0x00000000651B2D18 000038 (v01 DELL   CBX3     =
01072009 AMI. 0005000B)
> [    0.014057] ACPI: SSDT 0x00000000651B2D50 000359 (v01 SataRe SataTabl =
00001000 INTL 20160422)
> [    0.014059] ACPI: BOOT 0x00000000651B30B0 000028 (v01 DELL   CBX3     =
01072009 AMI  00010013)
> [    0.014062] ACPI: SSDT 0x00000000651B30D8 0012CF (v02 SaSsdt SaSsdt   =
00003000 INTL 20160422)
> [    0.014064] ACPI: HPET 0x00000000651B43A8 000038 (v01 INTEL  KBL-ULT  =
00000001 MSFT 0000005F)
> [    0.014067] ACPI: SSDT 0x00000000651B43E0 000D84 (v02 INTEL  xh_rvp07 =
00000000 INTL 20160422)
> [    0.014069] ACPI: UEFI 0x00000000651B5168 000042 (v01                 =
00000000      00000000)
> [    0.014072] ACPI: SSDT 0x00000000651B51B0 000EDE (v02 CpuRef CpuSsdt  =
00003000 INTL 20160422)
> [    0.014074] ACPI: LPIT 0x00000000651B6090 000094 (v01 INTEL  KBL-ULT  =
00000000 MSFT 0000005F)
> [    0.014077] ACPI: WSMT 0x00000000651B6128 000028 (v01 DELL   CBX3     =
00000000 MSFT 0000005F)
> [    0.014079] ACPI: SSDT 0x00000000651B6150 000161 (v02 INTEL  HdaDsp   =
00000000 INTL 20160422)
> [    0.014082] ACPI: SSDT 0x00000000651B62B8 00029F (v02 INTEL  sensrhub =
00000000 INTL 20160422)
> [    0.014084] ACPI: SSDT 0x00000000651B6558 003002 (v02 INTEL  PtidDevc =
00001000 INTL 20160422)
> [    0.014087] ACPI: SSDT 0x00000000651B9560 0000DB (v02 INTEL  TbtTypeC =
00000000 INTL 20160422)
> [    0.014089] ACPI: DBGP 0x00000000651B9640 000034 (v01 INTEL           =
00000002 MSFT 0000005F)
> [    0.014091] ACPI: DBG2 0x00000000651B9678 000054 (v00 INTEL           =
00000002 MSFT 0000005F)
> [    0.014094] ACPI: SSDT 0x00000000651B96D0 0007DD (v02 INTEL  UsbCTabl =
00001000 INTL 20160422)
> [    0.014096] ACPI: SSDT 0x00000000651B9EB0 0084F1 (v02 DptfTa DptfTabl =
00001000 INTL 20160422)
> [    0.014099] ACPI: SLIC 0x00000000651C23A8 000176 (v03 DELL   CBX3     =
01072009 MSFT 00010013)
> [    0.014101] ACPI: NHLT 0x00000000651C2520 00002D (v00 INTEL  EDK2     =
00000002      01000013)
> [    0.014104] ACPI: BGRT 0x00000000651C2550 000038 (v00                 =
01072009 AMI  00010013)
> [    0.014106] ACPI: TPM2 0x00000000651C2588 000034 (v03        Tpm2Tabl =
00000001 AMI  00000000)
> [    0.014109] ACPI: ASF! 0x00000000651C25C0 0000A0 (v32 INTEL   HCG     =
00000001 TFSM 000F4240)
> [    0.014111] ACPI: DMAR 0x00000000651C2660 0000F0 (v01 INTEL  KBL      =
00000001 INTL 00000001)
> [    0.014113] ACPI: Reserving FACP table memory at [mem 0x651b2a48-0x651=
b2b53]
> [    0.014115] ACPI: Reserving DSDT table memory at [mem 0x6518d260-0x651=
b2a46]
> [    0.014115] ACPI: Reserving FACS table memory at [mem 0x6f86f180-0x6f8=
6f1bf]
> [    0.014116] ACPI: Reserving APIC table memory at [mem 0x651b2b58-0x651=
b2bdb]
> [    0.014117] ACPI: Reserving FPDT table memory at [mem 0x651b2be0-0x651=
b2c23]
> [    0.014117] ACPI: Reserving FIDT table memory at [mem 0x651b2c28-0x651=
b2cd3]
> [    0.014118] ACPI: Reserving MCFG table memory at [mem 0x651b2cd8-0x651=
b2d13]
> [    0.014119] ACPI: Reserving HPET table memory at [mem 0x651b2d18-0x651=
b2d4f]
> [    0.014119] ACPI: Reserving SSDT table memory at [mem 0x651b2d50-0x651=
b30a8]
> [    0.014120] ACPI: Reserving BOOT table memory at [mem 0x651b30b0-0x651=
b30d7]
> [    0.014121] ACPI: Reserving SSDT table memory at [mem 0x651b30d8-0x651=
b43a6]
> [    0.014121] ACPI: Reserving HPET table memory at [mem 0x651b43a8-0x651=
b43df]
> [    0.014122] ACPI: Reserving SSDT table memory at [mem 0x651b43e0-0x651=
b5163]
> [    0.014122] ACPI: Reserving UEFI table memory at [mem 0x651b5168-0x651=
b51a9]
> [    0.014123] ACPI: Reserving SSDT table memory at [mem 0x651b51b0-0x651=
b608d]
> [    0.014124] ACPI: Reserving LPIT table memory at [mem 0x651b6090-0x651=
b6123]
> [    0.014124] ACPI: Reserving WSMT table memory at [mem 0x651b6128-0x651=
b614f]
> [    0.014125] ACPI: Reserving SSDT table memory at [mem 0x651b6150-0x651=
b62b0]
> [    0.014126] ACPI: Reserving SSDT table memory at [mem 0x651b62b8-0x651=
b6556]
> [    0.014126] ACPI: Reserving SSDT table memory at [mem 0x651b6558-0x651=
b9559]
> [    0.014127] ACPI: Reserving SSDT table memory at [mem 0x651b9560-0x651=
b963a]
> [    0.014127] ACPI: Reserving DBGP table memory at [mem 0x651b9640-0x651=
b9673]
> [    0.014128] ACPI: Reserving DBG2 table memory at [mem 0x651b9678-0x651=
b96cb]
> [    0.014129] ACPI: Reserving SSDT table memory at [mem 0x651b96d0-0x651=
b9eac]
> [    0.014129] ACPI: Reserving SSDT table memory at [mem 0x651b9eb0-0x651=
c23a0]
> [    0.014130] ACPI: Reserving SLIC table memory at [mem 0x651c23a8-0x651=
c251d]
> [    0.014131] ACPI: Reserving NHLT table memory at [mem 0x651c2520-0x651=
c254c]
> [    0.014131] ACPI: Reserving BGRT table memory at [mem 0x651c2550-0x651=
c2587]
> [    0.014132] ACPI: Reserving TPM2 table memory at [mem 0x651c2588-0x651=
c25bb]
> [    0.014133] ACPI: Reserving ASF! table memory at [mem 0x651c25c0-0x651=
c265f]
> [    0.014133] ACPI: Reserving DMAR table memory at [mem 0x651c2660-0x651=
c274f]
> [    0.014268] No NUMA configuration found
> [    0.014269] Faking a node at [mem 0x0000000000000000-0x00000004817ffff=
f]
> [    0.014276] NODE_DATA(0) allocated [mem 0x47f3d3000-0x47f3fdfff]
> [    0.014422] Zone ranges:
> [    0.014423]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
> [    0.014425]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
> [    0.014426]   Normal   [mem 0x0000000100000000-0x00000004817fffff]
> [    0.014427]   Device   empty
> [    0.014428] Movable zone start for each node
> [    0.014430] Early memory node ranges
> [    0.014430]   node   0: [mem 0x0000000000001000-0x0000000000057fff]
> [    0.014432]   node   0: [mem 0x0000000000059000-0x000000000009dfff]
> [    0.014433]   node   0: [mem 0x0000000000100000-0x00000000556aafff]
> [    0.014433]   node   0: [mem 0x00000000556ad000-0x0000000064df3fff]
> [    0.014434]   node   0: [mem 0x000000006ffff000-0x000000006fffffff]
> [    0.014435]   node   0: [mem 0x0000000078000000-0x00000000785fffff]
> [    0.014436]   node   0: [mem 0x0000000100000000-0x00000004817fffff]
> [    0.014437] Initmem setup node 0 [mem 0x0000000000001000-0x00000004817=
fffff]
> [    0.014441] On node 0, zone DMA: 1 pages in unavailable ranges
> [    0.014443] On node 0, zone DMA: 1 pages in unavailable ranges
> [    0.014465] On node 0, zone DMA: 98 pages in unavailable ranges
> [    0.016807] On node 0, zone DMA32: 2 pages in unavailable ranges
> [    0.017385] On node 0, zone DMA32: 45579 pages in unavailable ranges
> [    0.018001] On node 0, zone Normal: 31232 pages in unavailable ranges
> [    0.018336] On node 0, zone Normal: 26624 pages in unavailable ranges
> [    0.018343] Reserving Intel graphics memory at [mem 0x7a800000-0x7c7ff=
fff]
> [    0.018538] ACPI: PM-Timer IO Port: 0x1808
> [    0.018543] ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
> [    0.018544] ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
> [    0.018545] ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
> [    0.018546] ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
> [    0.018572] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI =
0-119
> [    0.018575] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
> [    0.018576] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
> [    0.018579] ACPI: Using ACPI (MADT) for SMP configuration information
> [    0.018580] ACPI: HPET id: 0x8086a701 base: 0xfed00000
> [    0.018585] e820: update [mem 0x62262000-0x623eefff] usable =3D=3D> re=
served
> [    0.018595] TSC deadline timer available
> [    0.018596] smpboot: Allowing 4 CPUs, 0 hotplug CPUs
> [    0.018609] PM: hibernation: Registered nosave memory: [mem 0x00000000=
-0x00000fff]
> [    0.018611] PM: hibernation: Registered nosave memory: [mem 0x00058000=
-0x00058fff]
> [    0.018612] PM: hibernation: Registered nosave memory: [mem 0x0009e000=
-0x000fffff]
> [    0.018614] PM: hibernation: Registered nosave memory: [mem 0x52e59000=
-0x52e59fff]
> [    0.018615] PM: hibernation: Registered nosave memory: [mem 0x52e69000=
-0x52e69fff]
> [    0.018616] PM: hibernation: Registered nosave memory: [mem 0x556ab000=
-0x556abfff]
> [    0.018617] PM: hibernation: Registered nosave memory: [mem 0x556ac000=
-0x556acfff]
> [    0.018618] PM: hibernation: Registered nosave memory: [mem 0x62262000=
-0x623eefff]
> [    0.018619] PM: hibernation: Registered nosave memory: [mem 0x64df4000=
-0x6517ffff]
> [    0.018620] PM: hibernation: Registered nosave memory: [mem 0x65180000=
-0x651c3fff]
> [    0.018620] PM: hibernation: Registered nosave memory: [mem 0x651c4000=
-0x6f871fff]
> [    0.018621] PM: hibernation: Registered nosave memory: [mem 0x6f872000=
-0x6fffefff]
> [    0.018622] PM: hibernation: Registered nosave memory: [mem 0x70000000=
-0x77ffffff]
> [    0.018623] PM: hibernation: Registered nosave memory: [mem 0x78600000=
-0x7c7fffff]
> [    0.018624] PM: hibernation: Registered nosave memory: [mem 0x7c800000=
-0xfdffffff]
> [    0.018625] PM: hibernation: Registered nosave memory: [mem 0xfe000000=
-0xfe010fff]
> [    0.018625] PM: hibernation: Registered nosave memory: [mem 0xfe011000=
-0xfebfffff]
> [    0.018626] PM: hibernation: Registered nosave memory: [mem 0xfec00000=
-0xfec00fff]
> [    0.018626] PM: hibernation: Registered nosave memory: [mem 0xfec01000=
-0xfedfffff]
> [    0.018627] PM: hibernation: Registered nosave memory: [mem 0xfee00000=
-0xfee00fff]
> [    0.018627] PM: hibernation: Registered nosave memory: [mem 0xfee01000=
-0xffffffff]
> [    0.018628] [mem 0x7c800000-0xfdffffff] available for PCI devices
> [    0.018630] Booting paravirtualized kernel on bare hardware
> [    0.018631] clocksource: refined-jiffies: mask: 0xffffffff max_cycles:=
 0xffffffff, max_idle_ns: 7645519600211568 ns
> [    0.023053] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:4 nr_cpu_ids:4 =
nr_node_ids:1
> [    0.023342] percpu: Embedded 63 pages/cpu s221184 r8192 d28672 u524288
> [    0.023347] pcpu-alloc: s221184 r8192 d28672 u524288 alloc=3D1*2097152
> [    0.023349] pcpu-alloc: [0] 0 1 2 3=20
> [    0.023365] Kernel command line: BOOT_IMAGE=3D/vmlinuz-6.6.15-amd64 ro=
ot=3DUUID=3D32e29882-d94d-4a92-9ee4-4d03002bfa29 ro quiet pci=3Dnoaer mem_s=
leep_default=3Ddeep log_buf_len=3D8M cryptomgr.notests i8042.dumbkbd=3D1
> [    0.023436] Unknown kernel command line parameters "BOOT_IMAGE=3D/vmli=
nuz-6.6.15-amd64", will be passed to user space.
> [    0.023469] random: crng init done
> [    0.024929] Dentry cache hash table entries: 2097152 (order: 12, 16777=
216 bytes, linear)
> [    0.025690] Inode-cache hash table entries: 1048576 (order: 11, 838860=
8 bytes, linear)
> [    0.025740] Fallback order for Node 0: 0=20
> [    0.025743] Built 1 zonelists, mobility grouping on.  Total pages: 402=
6691
> [    0.025744] Policy zone: Normal
> [    0.025748] mem auto-init: stack:all(zero), heap alloc:on, heap free:o=
ff
> [    0.025754] software IO TLB: area num 4.
> [    0.044467] Memory: 1573576K/16363068K available (16384K kernel code, =
2363K rwdata, 10548K rodata, 3964K init, 3620K bss, 541288K reserved, 0K cm=
a-reserved)
> [    0.044648] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D4,=
 Nodes=3D1
> [    0.044658] Kernel/User page tables isolation: enabled
> [    0.044690] ftrace: allocating 43122 entries in 169 pages
> [    0.051779] ftrace: allocated 169 pages with 4 groups
> [    0.052367] Dynamic Preempt: voluntary
> [    0.052404] rcu: Preemptible hierarchical RCU implementation.
> [    0.052404] rcu: 	RCU restricting CPUs from NR_CPUS=3D8192 to nr_cpu_i=
ds=3D4.
> [    0.052405] 	Trampoline variant of Tasks RCU enabled.
> [    0.052406] 	Rude variant of Tasks RCU enabled.
> [    0.052406] 	Tracing variant of Tasks RCU enabled.
> [    0.052406] rcu: RCU calculated value of scheduler-enlistment delay is=
 25 jiffies.
> [    0.052407] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_i=
ds=3D4
> [    0.054785] NR_IRQS: 524544, nr_irqs: 1024, preallocated irqs: 16
> [    0.054986] rcu: srcu_init: Setting srcu_struct sizes based on content=
ion.
> [    0.055159] spurious 8259A interrupt: IRQ7.
> [    0.055183] Console: colour dummy device 80x25
> [    0.055185] printk: console [tty0] enabled
> [    0.055218] ACPI: Core revision 20230628
> [    0.055363] hpet: HPET dysfunctional in PC10. Force disabled.
> [    0.055364] APIC: Switch to symmetric I/O mode setup
> [    0.055366] DMAR: Host address width 39
> [    0.055367] DMAR: DRHD base: 0x000000fed90000 flags: 0x0
> [    0.055372] DMAR: dmar0: reg_base_addr fed90000 ver 1:0 cap 1c0000c406=
60462 ecap 19e2ff0505e
> [    0.055374] DMAR: DRHD base: 0x000000fed91000 flags: 0x1
> [    0.055378] DMAR: dmar1: reg_base_addr fed91000 ver 1:0 cap d2008c4066=
0462 ecap f050da
> [    0.055379] DMAR: RMRR base: 0x00000064ec2000 end: 0x00000064ee1fff
> [    0.055381] DMAR: RMRR base: 0x0000007a000000 end: 0x0000007c7fffff
> [    0.055382] DMAR: ANDD device: 1 name: \_SB.PCI0.I2C0
> [    0.055382] DMAR: ANDD device: 2 name: \_SB.PCI0.I2C1
> [    0.055384] DMAR-IR: IOAPIC id 2 under DRHD base  0xfed91000 IOMMU 1
> [    0.055385] DMAR-IR: HPET id 0 under DRHD base 0xfed91000
> [    0.055386] DMAR-IR: Queued invalidation will be enabled to support x2=
apic and Intr-remapping.
> [    0.057011] DMAR-IR: Enabled IRQ remapping in x2apic mode
> [    0.057012] x2apic enabled
> [    0.057072] APIC: Switched APIC routing to: cluster x2apic
> [    0.061132] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycle=
s: 0x29ccd767b87, max_idle_ns: 440795223720 ns
> [    0.061138] Calibrating delay loop (skipped), value calculated using t=
imer frequency.. 5799.77 BogoMIPS (lpj=3D11599544)
> [    0.061167] CPU0: Thermal monitoring enabled (TM1)
> [    0.061208] process: using mwait in idle threads
> [    0.061211] Last level iTLB entries: 4KB 64, 2MB 8, 4MB 8
> [    0.061212] Last level dTLB entries: 4KB 64, 2MB 0, 4MB 0, 1GB 4
> [    0.061216] Spectre V1 : Mitigation: usercopy/swapgs barriers and __us=
er pointer sanitization
> [    0.061218] Spectre V2 : Mitigation: IBRS
> [    0.061219] Spectre V2 : Spectre v2 / SpectreRSB mitigation: Filling R=
SB on context switch
> [    0.061220] Spectre V2 : Spectre v2 / SpectreRSB : Filling RSB on VMEX=
IT
> [    0.061220] RETBleed: Mitigation: IBRS
> [    0.061222] Spectre V2 : mitigation: Enabling conditional Indirect Bra=
nch Prediction Barrier
> [    0.061223] Spectre V2 : User space: Mitigation: STIBP via prctl
> [    0.061224] Speculative Store Bypass: Mitigation: Speculative Store By=
pass disabled via prctl
> [    0.061231] MDS: Mitigation: Clear CPU buffers
> [    0.061232] MMIO Stale Data: Mitigation: Clear CPU buffers
> [    0.061235] SRBDS: Mitigation: Microcode
> [    0.061241] GDS: Mitigation: Microcode
> [    0.061246] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating poi=
nt registers'
> [    0.061248] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
> [    0.061249] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
> [    0.061250] x86/fpu: Supporting XSAVE feature 0x008: 'MPX bounds regis=
ters'
> [    0.061251] x86/fpu: Supporting XSAVE feature 0x010: 'MPX CSR'
> [    0.061252] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
> [    0.061254] x86/fpu: xstate_offset[3]:  832, xstate_sizes[3]:   64
> [    0.061255] x86/fpu: xstate_offset[4]:  896, xstate_sizes[4]:   64
> [    0.061256] x86/fpu: Enabled xstate features 0x1f, context size is 960=
 bytes, using 'compacted' format.
> [    0.065135] Freeing SMP alternatives memory: 36K
> [    0.065135] pid_max: default: 32768 minimum: 301
> [    0.065135] LSM: initializing lsm=3Dlockdown,capability,landlock,yama,=
apparmor,tomoyo,bpf,integrity
> [    0.065135] landlock: Up and running.
> [    0.065135] Yama: disabled by default; enable with sysctl kernel.yama.*
> [    0.065135] AppArmor: AppArmor initialized
> [    0.065135] TOMOYO Linux initialized
> [    0.065135] LSM support for eBPF active
> [    0.065135] Mount-cache hash table entries: 32768 (order: 6, 262144 by=
tes, linear)
> [    0.065135] Mountpoint-cache hash table entries: 32768 (order: 6, 2621=
44 bytes, linear)
> [    0.065135] smpboot: CPU0: Intel(R) Core(TM) i7-7500U CPU @ 2.70GHz (f=
amily: 0x6, model: 0x8e, stepping: 0x9)
> [    0.065135] RCU Tasks: Setting shift to 2 and lim to 1 rcu_task_cb_adj=
ust=3D1.
> [    0.065135] RCU Tasks Rude: Setting shift to 2 and lim to 1 rcu_task_c=
b_adjust=3D1.
> [    0.065135] RCU Tasks Trace: Setting shift to 2 and lim to 1 rcu_task_=
cb_adjust=3D1.
> [    0.065135] Performance Events: PEBS fmt3+, Skylake events, 32-deep LB=
R, full-width counters, Intel PMU driver.
> [    0.065135] ... version:                4
> [    0.065135] ... bit width:              48
> [    0.065135] ... generic registers:      4
> [    0.065135] ... value mask:             0000ffffffffffff
> [    0.065135] ... max period:             00007fffffffffff
> [    0.065135] ... fixed-purpose events:   3
> [    0.065135] ... event mask:             000000070000000f
> [    0.065135] signal: max sigframe size: 2032
> [    0.065135] Estimated ratio of average max frequency by base frequency=
 (times 1024): 1235
> [    0.065135] rcu: Hierarchical SRCU implementation.
> [    0.065135] rcu: 	Max phase no-delay instances is 1000.
> [    0.065135] NMI watchdog: Enabled. Permanently consumes one hw-PMU cou=
nter.
> [    0.065135] smp: Bringing up secondary CPUs ...
> [    0.065135] smpboot: x86: Booting SMP configuration:
> [    0.065135] .... node  #0, CPUs:      #1 #2 #3
> [    0.069225] MDS CPU bug present and SMT on, data leak possible. See ht=
tps://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/mds.html for more =
details.
> [    0.069225] MMIO Stale Data CPU bug present and SMT on, data leak poss=
ible. See https://www.kernel.org/doc/html/latest/admin-guide/hw-vuln/proces=
sor_mmio_stale_data.html for more details.
> [    0.069225] smp: Brought up 1 node, 4 CPUs
> [    0.069225] smpboot: Max logical packages: 1
> [    0.069225] smpboot: Total of 4 processors activated (23199.08 BogoMIP=
S)
> [    0.091891] node 0 deferred pages initialised in 20ms
> [    0.091965] devtmpfs: initialized
> [    0.091965] x86/mm: Memory block size: 128MB
> [    0.093889] ACPI: PM: Registering ACPI NVS region [mem 0x556ab000-0x55=
6abfff] (4096 bytes)
> [    0.093889] ACPI: PM: Registering ACPI NVS region [mem 0x651c4000-0x6f=
871fff] (174776320 bytes)
> [    0.094253] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffff=
fff, max_idle_ns: 7645041785100000 ns
> [    0.094259] futex hash table entries: 1024 (order: 4, 65536 bytes, lin=
ear)
> [    0.094315] pinctrl core: initialized pinctrl subsystem
> [    0.094785] NET: Registered PF_NETLINK/PF_ROUTE protocol family
> [    0.095014] DMA: preallocated 2048 KiB GFP_KERNEL pool for atomic allo=
cations
> [    0.095135] DMA: preallocated 2048 KiB GFP_KERNEL|GFP_DMA pool for ato=
mic allocations
> [    0.095255] DMA: preallocated 2048 KiB GFP_KERNEL|GFP_DMA32 pool for a=
tomic allocations
> [    0.095279] audit: initializing netlink subsys (disabled)
> [    0.097166] audit: type=3D2000 audit(1707929281.036:1): state=3Dinitia=
lized audit_enabled=3D0 res=3D1
> [    0.097253] thermal_sys: Registered thermal governor 'fair_share'
> [    0.097255] thermal_sys: Registered thermal governor 'bang_bang'
> [    0.097255] thermal_sys: Registered thermal governor 'step_wise'
> [    0.097256] thermal_sys: Registered thermal governor 'user_space'
> [    0.097257] thermal_sys: Registered thermal governor 'power_allocator'
> [    0.097270] cpuidle: using governor ladder
> [    0.097270] cpuidle: using governor menu
> [    0.097270] Simple Boot Flag at 0x47 set to 0x80
> [    0.097270] ACPI FADT declares the system doesn't support PCIe ASPM, s=
o disable it
> [    0.097270] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
> [    0.097270] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe00000=
00-0xefffffff] (base 0xe0000000)
> [    0.097270] PCI: not using MMCONFIG
> [    0.097270] PCI: Using configuration type 1 for base access
> [    0.097435] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
> [    0.097441] kprobes: kprobe jump-optimization is enabled. All kprobes =
are optimized if possible.
> [    0.097441] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pa=
ges
> [    0.097441] HugeTLB: 16380 KiB vmemmap can be freed for a 1.00 GiB page
> [    0.097441] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pa=
ges
> [    0.097441] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
> [    0.097441] ACPI: Added _OSI(Module Device)
> [    0.097441] ACPI: Added _OSI(Processor Device)
> [    0.097441] ACPI: Added _OSI(3.0 _SCP Extensions)
> [    0.097441] ACPI: Added _OSI(Processor Aggregator Device)
> [    0.128195] ACPI: 11 ACPI AML tables successfully acquired and loaded
> [    0.132721] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
> [    0.137874] ACPI: Dynamic OEM Table Load:
> [    0.137881] ACPI: SSDT 0xFFFF88846F0D4800 0003FF (v02 PmRef  Cpu0Cst  =
00003001 INTL 20160422)
> [    0.141170] ACPI: Dynamic OEM Table Load:
> [    0.141175] ACPI: SSDT 0xFFFF888100CB9800 0006F6 (v02 PmRef  Cpu0Ist  =
00003000 INTL 20160422)
> [    0.142743] ACPI: Dynamic OEM Table Load:
> [    0.142748] ACPI: SSDT 0xFFFF888100CBF800 00065C (v02 PmRef  ApIst    =
00003000 INTL 20160422)
> [    0.143909] ACPI: Dynamic OEM Table Load:
> [    0.143913] ACPI: SSDT 0xFFFF888100CF8000 00018A (v02 PmRef  ApCst    =
00003000 INTL 20160422)
> [    0.146318] ACPI: _OSC evaluated successfully for all CPUs
> [    0.146446] ACPI: EC: EC started
> [    0.146447] ACPI: EC: interrupt blocked
> [    0.150607] ACPI: EC: EC_CMD/EC_SC=3D0x934, EC_DATA=3D0x930
> [    0.150609] ACPI: \_SB_.PCI0.LPCB.ECDV: Boot DSDT EC used to handle tr=
ansactions
> [    0.150611] ACPI: Interpreter enabled
> [    0.150646] ACPI: PM: (supports S0 S3 S4 S5)
> [    0.150647] ACPI: Using IOAPIC for interrupt routing
> [    0.150678] PCI: MMCONFIG for domain 0000 [bus 00-ff] at [mem 0xe00000=
00-0xefffffff] (base 0xe0000000)
> [    0.151369] PCI: MMCONFIG at [mem 0xe0000000-0xefffffff] reserved as A=
CPI motherboard resource
> [    0.151378] PCI: Using host bridge windows from ACPI; if necessary, us=
e "pci=3Dnocrs" and report a bug
> [    0.151380] PCI: Using E820 reservations for host bridge windows
> [    0.151862] ACPI: Enabled 8 GPEs in block 00 to 7F
> [    0.155739] ACPI: \_SB_.PCI0.RP09.PXSX.WRST: New power resource
> [    0.155997] ACPI: \_SB_.PCI0.RP10.PXSX.WRST: New power resource
> [    0.156249] ACPI: \_SB_.PCI0.RP11.PXSX.WRST: New power resource
> [    0.157320] ACPI: \_SB_.PCI0.RP12.PXSX.WRST: New power resource
> [    0.157571] ACPI: \_SB_.PCI0.RP13.PXSX.WRST: New power resource
> [    0.157823] ACPI: \_SB_.PCI0.RP01.PXSX.WRST: New power resource
> [    0.158421] ACPI: \_SB_.PCI0.RP02.PXSX.WRST: New power resource
> [    0.158672] ACPI: \_SB_.PCI0.RP03.PXSX.WRST: New power resource
> [    0.158923] ACPI: \_SB_.PCI0.RP04.PXSX.WRST: New power resource
> [    0.159172] ACPI: \_SB_.PCI0.RP05.PXSX.WRST: New power resource
> [    0.159421] ACPI: \_SB_.PCI0.RP06.PXSX.WRST: New power resource
> [    0.159672] ACPI: \_SB_.PCI0.RP07.PXSX.WRST: New power resource
> [    0.159925] ACPI: \_SB_.PCI0.RP08.PXSX.WRST: New power resource
> [    0.160178] ACPI: \_SB_.PCI0.RP17.PXSX.WRST: New power resource
> [    0.160427] ACPI: \_SB_.PCI0.RP18.PXSX.WRST: New power resource
> [    0.160676] ACPI: \_SB_.PCI0.RP19.PXSX.WRST: New power resource
> [    0.160926] ACPI: \_SB_.PCI0.RP20.PXSX.WRST: New power resource
> [    0.161970] ACPI: \_SB_.PCI0.RP14.PXSX.WRST: New power resource
> [    0.162219] ACPI: \_SB_.PCI0.RP15.PXSX.WRST: New power resource
> [    0.162471] ACPI: \_SB_.PCI0.RP16.PXSX.WRST: New power resource
> [    0.177710] ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-fe])
> [    0.177716] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM Cl=
ockPM Segments MSI HPX-Type3]
> [    0.177863] acpi PNP0A08:00: _OSC: platform does not support [PCIeHotp=
lug SHPCHotplug PME]
> [    0.178135] acpi PNP0A08:00: _OSC: OS now controls [PCIeCapability LTR]
> [    0.178137] acpi PNP0A08:00: FADT indicates ASPM is unsupported, using=
 BIOS configuration
> [    0.178931] PCI host bridge to bus 0000:00
> [    0.178932] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 wind=
ow]
> [    0.178934] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff wind=
ow]
> [    0.178936] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000df=
fff window]
> [    0.178938] pci_bus 0000:00: root bus resource [mem 0x7c800000-0xdffff=
fff window]
> [    0.178939] pci_bus 0000:00: root bus resource [mem 0xfd000000-0xfe7ff=
fff window]
> [    0.178940] pci_bus 0000:00: root bus resource [bus 00-fe]
> [    0.178957] pci 0000:00:00.0: [8086:5904] type 00 class 0x060000
> [    0.179029] pci 0000:00:02.0: [8086:5916] type 00 class 0x030000
> [    0.179036] pci 0000:00:02.0: reg 0x10: [mem 0xdb000000-0xdbffffff 64b=
it]
> [    0.179041] pci 0000:00:02.0: reg 0x18: [mem 0x90000000-0x9fffffff 64b=
it pref]
> [    0.179045] pci 0000:00:02.0: reg 0x20: [io  0xf000-0xf03f]
> [    0.179057] pci 0000:00:02.0: BAR 2: assigned to efifb
> [    0.179059] pci 0000:00:02.0: Video device with shadowed ROM at [mem 0=
x000c0000-0x000dffff]
> [    0.179193] pci 0000:00:04.0: [8086:1903] type 00 class 0x118000
> [    0.179201] pci 0000:00:04.0: reg 0x10: [mem 0xdc320000-0xdc327fff 64b=
it]
> [    0.179441] pci 0000:00:14.0: [8086:9d2f] type 00 class 0x0c0330
> [    0.179455] pci 0000:00:14.0: reg 0x10: [mem 0xdc310000-0xdc31ffff 64b=
it]
> [    0.179512] pci 0000:00:14.0: PME# supported from D3hot D3cold
> [    0.179947] pci 0000:00:14.2: [8086:9d31] type 00 class 0x118000
> [    0.179962] pci 0000:00:14.2: reg 0x10: [mem 0xdc334000-0xdc334fff 64b=
it]
> [    0.180104] pci 0000:00:15.0: [8086:9d60] type 00 class 0x118000
> [    0.180145] pci 0000:00:15.0: reg 0x10: [mem 0xdc333000-0xdc333fff 64b=
it]
> [    0.180467] pci 0000:00:15.1: [8086:9d61] type 00 class 0x118000
> [    0.180509] pci 0000:00:15.1: reg 0x10: [mem 0xdc332000-0xdc332fff 64b=
it]
> [    0.180818] pci 0000:00:16.0: [8086:9d3a] type 00 class 0x078000
> [    0.180830] pci 0000:00:16.0: reg 0x10: [mem 0xdc331000-0xdc331fff 64b=
it]
> [    0.180874] pci 0000:00:16.0: PME# supported from D3hot
> [    0.181167] pci 0000:00:1c.0: [8086:9d10] type 01 class 0x060400
> [    0.181231] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
> [    0.181246] pci 0000:00:1c.0: Intel SPT PCH root port ACS workaround e=
nabled
> [    0.181614] pci 0000:00:1c.4: [8086:9d14] type 01 class 0x060400
> [    0.181685] pci 0000:00:1c.4: PME# supported from D0 D3hot D3cold
> [    0.181704] pci 0000:00:1c.4: Intel SPT PCH root port ACS workaround e=
nabled
> [    0.182066] pci 0000:00:1d.0: [8086:9d18] type 01 class 0x060400
> [    0.182127] pci 0000:00:1d.0: PME# supported from D0 D3hot D3cold
> [    0.182143] pci 0000:00:1d.0: Intel SPT PCH root port ACS workaround e=
nabled
> [    0.182519] pci 0000:00:1f.0: [8086:9d58] type 00 class 0x060100
> [    0.182796] pci 0000:00:1f.2: [8086:9d21] type 00 class 0x058000
> [    0.182808] pci 0000:00:1f.2: reg 0x10: [mem 0xdc32c000-0xdc32ffff]
> [    0.183011] pci 0000:00:1f.3: [8086:9d71] type 00 class 0x040380
> [    0.183028] pci 0000:00:1f.3: reg 0x10: [mem 0xdc328000-0xdc32bfff 64b=
it]
> [    0.183051] pci 0000:00:1f.3: reg 0x20: [mem 0xdc300000-0xdc30ffff 64b=
it]
> [    0.183092] pci 0000:00:1f.3: PME# supported from D3hot D3cold
> [    0.183612] pci 0000:00:1f.4: [8086:9d23] type 00 class 0x0c0500
> [    0.183670] pci 0000:00:1f.4: reg 0x10: [mem 0xdc330000-0xdc3300ff 64b=
it]
> [    0.183741] pci 0000:00:1f.4: reg 0x20: [io  0xf040-0xf05f]
> [    0.184027] pci 0000:00:1c.0: PCI bridge to [bus 01-39]
> [    0.184031] pci 0000:00:1c.0:   bridge window [mem 0xc4000000-0xda0fff=
ff]
> [    0.184035] pci 0000:00:1c.0:   bridge window [mem 0xa0000000-0xc1ffff=
ff 64bit pref]
> [    0.184354] pci 0000:3a:00.0: [168c:003e] type 00 class 0x028000
> [    0.184569] pci 0000:3a:00.0: reg 0x10: [mem 0xdc000000-0xdc1fffff 64b=
it]
> [    0.185680] pci 0000:3a:00.0: PME# supported from D0 D3hot D3cold
> [    0.187282] pci 0000:00:1c.4: PCI bridge to [bus 3a]
> [    0.187287] pci 0000:00:1c.4:   bridge window [mem 0xdc000000-0xdc1fff=
ff]
> [    0.187371] pci 0000:3b:00.0: [1c5c:1284] type 00 class 0x010802
> [    0.187390] pci 0000:3b:00.0: reg 0x10: [mem 0xdc200000-0xdc203fff 64b=
it]
> [    0.187496] pci 0000:3b:00.0: PME# supported from D0 D1 D3hot
> [    0.187807] pci 0000:00:1d.0: PCI bridge to [bus 3b]
> [    0.187811] pci 0000:00:1d.0:   bridge window [mem 0xdc200000-0xdc2fff=
ff]
> [    0.189709] ACPI: PCI: Interrupt link LNKA configured for IRQ 11
> [    0.189751] ACPI: PCI: Interrupt link LNKB configured for IRQ 10
> [    0.189790] ACPI: PCI: Interrupt link LNKC configured for IRQ 11
> [    0.189830] ACPI: PCI: Interrupt link LNKD configured for IRQ 11
> [    0.189868] ACPI: PCI: Interrupt link LNKE configured for IRQ 11
> [    0.189907] ACPI: PCI: Interrupt link LNKF configured for IRQ 11
> [    0.189947] ACPI: PCI: Interrupt link LNKG configured for IRQ 11
> [    0.189986] ACPI: PCI: Interrupt link LNKH configured for IRQ 11
> [    0.196747] ACPI: EC: interrupt unblocked
> [    0.196748] ACPI: EC: event unblocked
> [    0.196754] ACPI: EC: EC_CMD/EC_SC=3D0x934, EC_DATA=3D0x930
> [    0.196756] ACPI: EC: GPE=3D0x14
> [    0.196757] ACPI: \_SB_.PCI0.LPCB.ECDV: Boot DSDT EC initialization co=
mplete
> [    0.196759] ACPI: \_SB_.PCI0.LPCB.ECDV: EC: Used to handle transaction=
s and events
> [    0.197163] iommu: Default domain type: Translated
> [    0.197301] iommu: DMA domain TLB invalidation policy: lazy mode
> [    0.197395] pps_core: LinuxPPS API ver. 1 registered
> [    0.197396] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolf=
o Giometti <giometti@linux.it>
> [    0.197399] PTP clock support registered
> [    0.197405] EDAC MC: Ver: 3.0.0
> [    0.201201] efivars: Registered efivars operations
> [    0.201700] NetLabel: Initializing
> [    0.201702] NetLabel:  domain hash size =3D 128
> [    0.201703] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
> [    0.201725] NetLabel:  unlabeled traffic allowed by default
> [    0.201726] PCI: Using ACPI for IRQ routing
> [    0.224686] PCI: pci_cache_line_size set to 64 bytes
> [    0.225063] e820: reserve RAM buffer [mem 0x00058000-0x0005ffff]
> [    0.225065] e820: reserve RAM buffer [mem 0x0009e000-0x0009ffff]
> [    0.225066] e820: reserve RAM buffer [mem 0x52e59018-0x53ffffff]
> [    0.225067] e820: reserve RAM buffer [mem 0x556ab000-0x57ffffff]
> [    0.225068] e820: reserve RAM buffer [mem 0x62262000-0x63ffffff]
> [    0.225069] e820: reserve RAM buffer [mem 0x64df4000-0x67ffffff]
> [    0.225070] e820: reserve RAM buffer [mem 0x78600000-0x7bffffff]
> [    0.225071] e820: reserve RAM buffer [mem 0x481800000-0x483ffffff]
> [    0.225143] pci 0000:00:02.0: vgaarb: setting as boot VGA device
> [    0.225144] pci 0000:00:02.0: vgaarb: bridge control possible
> [    0.225146] pci 0000:00:02.0: vgaarb: VGA device added: decodes=3Dio+m=
em,owns=3Dio+mem,locks=3Dnone
> [    0.225150] vgaarb: loaded
> [    0.226305] clocksource: Switched to clocksource tsc-early
> [    0.226413] VFS: Disk quotas dquot_6.6.0
> [    0.226423] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 by=
tes)
> [    0.226537] AppArmor: AppArmor Filesystem Enabled
> [    0.226549] pnp: PnP ACPI init
> [    0.226757] system 00:00: [io  0x0680-0x069f] has been reserved
> [    0.226760] system 00:00: [io  0xffff] has been reserved
> [    0.226762] system 00:00: [io  0xffff] has been reserved
> [    0.226763] system 00:00: [io  0xffff] has been reserved
> [    0.226765] system 00:00: [io  0x1800-0x18fe] has been reserved
> [    0.226766] system 00:00: [io  0x164e-0x164f] has been reserved
> [    0.226882] system 00:02: [io  0x1854-0x1857] has been reserved
> [    0.227204] system 00:05: [mem 0xfed10000-0xfed17fff] has been reserved
> [    0.227207] system 00:05: [mem 0xfed18000-0xfed18fff] has been reserved
> [    0.227208] system 00:05: [mem 0xfed19000-0xfed19fff] has been reserved
> [    0.227210] system 00:05: [mem 0xe0000000-0xefffffff] has been reserved
> [    0.227212] system 00:05: [mem 0xfed20000-0xfed3ffff] has been reserved
> [    0.227213] system 00:05: [mem 0xfed90000-0xfed93fff] could not be res=
erved
> [    0.227215] system 00:05: [mem 0xfed45000-0xfed8ffff] has been reserved
> [    0.227216] system 00:05: [mem 0xff000000-0xffffffff] has been reserved
> [    0.227218] system 00:05: [mem 0xfee00000-0xfeefffff] could not be res=
erved
> [    0.227220] system 00:05: [mem 0xdffe0000-0xdfffffff] has been reserved
> [    0.227256] system 00:06: [mem 0xfd000000-0xfdabffff] has been reserved
> [    0.227258] system 00:06: [mem 0xfdad0000-0xfdadffff] has been reserved
> [    0.227259] system 00:06: [mem 0xfdb00000-0xfdffffff] has been reserved
> [    0.227261] system 00:06: [mem 0xfe000000-0xfe01ffff] could not be res=
erved
> [    0.227262] system 00:06: [mem 0xfe036000-0xfe03bfff] has been reserved
> [    0.227264] system 00:06: [mem 0xfe03d000-0xfe3fffff] has been reserved
> [    0.227265] system 00:06: [mem 0xfe410000-0xfe7fffff] has been reserved
> [    0.227508] system 00:07: [io  0xff00-0xfffe] has been reserved
> [    0.228392] system 00:08: [mem 0xfe029000-0xfe029fff] has been reserved
> [    0.228395] system 00:08: [mem 0xfe028000-0xfe028fff] has been reserved
> [    0.230596] pnp: PnP ACPI: found 9 devices
> [    0.236296] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff,=
 max_idle_ns: 2085701024 ns
> [    0.236340] pci 0000:00:1f.1: [8086:9d20] type 00 class 0x058000
> [    0.236399] pci 0000:00:1f.1: reg 0x10: [mem 0xfd000000-0xfdffffff 64b=
it]
> [    0.236678] NET: Registered PF_INET protocol family
> [    0.236798] IP idents hash table entries: 262144 (order: 9, 2097152 by=
tes, linear)
> [    0.239080] tcp_listen_portaddr_hash hash table entries: 8192 (order: =
5, 131072 bytes, linear)
> [    0.239106] Table-perturb hash table entries: 65536 (order: 6, 262144 =
bytes, linear)
> [    0.239167] TCP established hash table entries: 131072 (order: 8, 1048=
576 bytes, linear)
> [    0.239350] TCP bind hash table entries: 65536 (order: 9, 2097152 byte=
s, linear)
> [    0.239540] TCP: Hash tables configured (established 131072 bind 65536)
> [    0.239607] MPTCP token hash table entries: 16384 (order: 6, 393216 by=
tes, linear)
> [    0.239657] UDP hash table entries: 8192 (order: 6, 262144 bytes, line=
ar)
> [    0.239689] UDP-Lite hash table entries: 8192 (order: 6, 262144 bytes,=
 linear)
> [    0.239741] NET: Registered PF_UNIX/PF_LOCAL protocol family
> [    0.239747] NET: Registered PF_XDP protocol family
> [    0.239754] pci 0000:00:1c.0: bridge window [io  0x1000-0x0fff] to [bu=
s 01-39] add_size 1000
> [    0.239763] pci 0000:00:1c.0: BAR 13: assigned [io  0x2000-0x2fff]
> [    0.239766] pci 0000:00:1c.0: PCI bridge to [bus 01-39]
> [    0.239769] pci 0000:00:1c.0:   bridge window [io  0x2000-0x2fff]
> [    0.239772] pci 0000:00:1c.0:   bridge window [mem 0xc4000000-0xda0fff=
ff]
> [    0.239775] pci 0000:00:1c.0:   bridge window [mem 0xa0000000-0xc1ffff=
ff 64bit pref]
> [    0.239779] pci 0000:00:1c.4: PCI bridge to [bus 3a]
> [    0.239782] pci 0000:00:1c.4:   bridge window [mem 0xdc000000-0xdc1fff=
ff]
> [    0.239788] pci 0000:00:1d.0: PCI bridge to [bus 3b]
> [    0.239791] pci 0000:00:1d.0:   bridge window [mem 0xdc200000-0xdc2fff=
ff]
> [    0.239796] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
> [    0.239798] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
> [    0.239799] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000dffff win=
dow]
> [    0.239800] pci_bus 0000:00: resource 7 [mem 0x7c800000-0xdfffffff win=
dow]
> [    0.239801] pci_bus 0000:00: resource 8 [mem 0xfd000000-0xfe7fffff win=
dow]
> [    0.239803] pci_bus 0000:01: resource 0 [io  0x2000-0x2fff]
> [    0.239804] pci_bus 0000:01: resource 1 [mem 0xc4000000-0xda0fffff]
> [    0.239805] pci_bus 0000:01: resource 2 [mem 0xa0000000-0xc1ffffff 64b=
it pref]
> [    0.239808] pci_bus 0000:3a: resource 1 [mem 0xdc000000-0xdc1fffff]
> [    0.239812] pci_bus 0000:3b: resource 1 [mem 0xdc200000-0xdc2fffff]
> [    0.240387] PCI: CLS 0 bytes, default 64
> [    0.240398] DMAR: ACPI device "device:79" under DMAR at fed91000 as 00=
:15.0
> [    0.240401] DMAR: ACPI device "device:7a" under DMAR at fed91000 as 00=
:15.1
> [    0.240408] DMAR: No ATSR found
> [    0.240408] DMAR: No SATC found
> [    0.240409] DMAR: IOMMU feature fl1gp_support inconsistent
> [    0.240410] DMAR: IOMMU feature pgsel_inv inconsistent
> [    0.240411] DMAR: IOMMU feature nwfs inconsistent
> [    0.240412] DMAR: IOMMU feature pasid inconsistent
> [    0.240412] DMAR: IOMMU feature eafs inconsistent
> [    0.240413] DMAR: IOMMU feature prs inconsistent
> [    0.240413] DMAR: IOMMU feature nest inconsistent
> [    0.240414] DMAR: IOMMU feature mts inconsistent
> [    0.240414] DMAR: IOMMU feature sc_support inconsistent
> [    0.240415] DMAR: IOMMU feature dev_iotlb_support inconsistent
> [    0.240416] DMAR: dmar0: Using Queued invalidation
> [    0.240419] DMAR: dmar1: Using Queued invalidation
> [    0.240443] Trying to unpack rootfs image as initramfs...
> [    0.240704] pci 0000:00:02.0: Adding to iommu group 0
> [    0.240735] pci 0000:00:00.0: Adding to iommu group 1
> [    0.240742] pci 0000:00:04.0: Adding to iommu group 2
> [    0.240755] pci 0000:00:14.0: Adding to iommu group 3
> [    0.240762] pci 0000:00:14.2: Adding to iommu group 3
> [    0.240774] pci 0000:00:15.0: Adding to iommu group 4
> [    0.240781] pci 0000:00:15.1: Adding to iommu group 4
> [    0.240790] pci 0000:00:16.0: Adding to iommu group 5
> [    0.240798] pci 0000:00:1c.0: Adding to iommu group 6
> [    0.240807] pci 0000:00:1c.4: Adding to iommu group 7
> [    0.240825] pci 0000:00:1d.0: Adding to iommu group 8
> [    0.240842] pci 0000:00:1f.0: Adding to iommu group 9
> [    0.240849] pci 0000:00:1f.2: Adding to iommu group 9
> [    0.240856] pci 0000:00:1f.3: Adding to iommu group 9
> [    0.240864] pci 0000:00:1f.4: Adding to iommu group 9
> [    0.240874] pci 0000:3a:00.0: Adding to iommu group 10
> [    0.240883] pci 0000:3b:00.0: Adding to iommu group 11
> [    0.241601] DMAR: Intel(R) Virtualization Technology for Directed I/O
> [    0.241604] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
> [    0.241605] software IO TLB: mapped [mem 0x000000005e262000-0x00000000=
62262000] (64MB)
> [    0.241673] sgx: EPC section 0x70200000-0x75f7ffff
> [    0.242464] Initialise system trusted keyrings
> [    0.242474] Key type blacklist registered
> [    0.242518] workingset: timestamp_bits=3D36 max_order=3D22 bucket_orde=
r=3D0
> [    0.242528] zbud: loaded
> [    0.242609] fuse: init (API version 7.39)
> [    0.242739] integrity: Platform Keyring initialized
> [    0.242742] integrity: Machine keyring initialized
> [    0.242785] alg: self-tests disabled
> [    0.254702] Key type asymmetric registered
> [    0.254707] Asymmetric key parser 'x509' registered
> [    0.374942] Freeing initrd memory: 60092K
> [    0.378589] Block layer SCSI generic (bsg) driver version 0.4 loaded (=
major 247)
> [    0.378616] io scheduler mq-deadline registered
> [    0.379610] shpchp: Standard Hot Plug PCI Controller Driver version: 0=
=2E4
> [    0.381624] thermal LNXTHERM:00: registered as thermal_zone0
> [    0.381626] ACPI: thermal: Thermal Zone [THM] (25 C)
> [    0.381806] Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
> [    0.382403] hpet_acpi_add: no address or irqs in _CRS
> [    0.382421] Linux agpgart interface v0.103
> [    0.394917] tpm_tis MSFT0101:00: 2.0 TPM (device-id 0xFE, rev-id 4)
> [    0.435843] AMD-Vi: AMD IOMMUv2 functionality not available on this sy=
stem - This is not a bug.
> [    0.436287] i8042: PNP: PS/2 Controller [PNP0303:PS2K,PNP0f13:PS2M] at=
 0x60,0x64 irq 1,12
> [    0.436674] i8042: Warning: Keylock active
> [    0.439087] serio: i8042 KBD port at 0x60,0x64 irq 1
> [    0.439093] serio: i8042 AUX port at 0x60,0x64 irq 12
> [    0.439238] mousedev: PS/2 mouse device common for all mice
> [    0.439255] rtc_cmos 00:01: RTC can wake from S4
> [    0.439928] input: AT Translated Set 2 keyboard as /devices/platform/i=
8042/serio0/input/input0
> [    0.439994] rtc_cmos 00:01: registered as rtc0
> [    0.440171] rtc_cmos 00:01: setting system clock to 2024-02-14T16:48:0=
2 UTC (1707929282)
> [    0.440218] rtc_cmos 00:01: alarms up to one month, y3k, 242 bytes nvr=
am
> [    0.440375] intel_pstate: Intel P-state driver initializing
> [    0.440567] intel_pstate: HWP enabled
> [    0.440598] ledtrig-cpu: registered to indicate activity on CPUs
> [    0.440975] efifb: probing for efifb
> [    0.440990] efifb: framebuffer at 0x90000000, using 22500k, total 2250=
0k
> [    0.440993] efifb: mode is 3200x1800x32, linelength=3D12800, pages=3D1
> [    0.440995] efifb: scrolling: redraw
> [    0.440995] efifb: Truecolor: size=3D8:8:8:8, shift=3D24:16:8:0
> [    0.441123] Console: switching to colour frame buffer device 200x56
> [    0.447209] fb0: EFI VGA frame buffer device
> [    0.466650] NET: Registered PF_INET6 protocol family
> [    0.473895] Segment Routing with IPv6
> [    0.473913] In-situ OAM (IOAM) with IPv6
> [    0.473952] mip6: Mobile IPv6
> [    0.473958] NET: Registered PF_PACKET protocol family
> [    0.474054] mpls_gso: MPLS GSO support
> [    0.474736] microcode: Microcode Update Driver: v2.2.
> [    0.474744] IPI shorthand broadcast: enabled
> [    0.476692] sched_clock: Marking stable (468708939, 6020579)->(5058648=
28, -31135310)
> [    0.477000] registered taskstats version 1
> [    0.477100] Loading compiled-in X.509 certificates
> [    0.482223] Loaded X.509 cert 'Build time autogenerated kernel key: c2=
5862bc1c97b79f4f0a84dce70f181995ac69cc'
> [    0.485108] Key type .fscrypt registered
> [    0.485110] Key type fscrypt-provisioning registered
> [    0.491669] Key type encrypted registered
> [    0.491677] AppArmor: AppArmor sha1 policy hashing enabled
> [    0.491947] integrity: Loading X.509 certificate: UEFI:db
> [    0.491987] integrity: Loaded X.509 cert 'Dell Inc. UEFI DB: 5ddb772dc=
880660055ba0bc131886bb630a639e7'
> [    0.491989] integrity: Loading X.509 certificate: UEFI:db
> [    0.492026] integrity: Loaded X.509 cert 'Microsoft Corporation UEFI C=
A 2011: 13adbf4309bd82709c8cd54f316ed522988a1bd4'
> [    0.492027] integrity: Loading X.509 certificate: UEFI:db
> [    0.492055] integrity: Loaded X.509 cert 'Microsoft Windows Production=
 PCA 2011: a92902398e16c49778cd90f99e4f9ae17c55af53'
> [    0.492546] ima: Allocated hash algorithm: sha256
> [    0.538075] ima: No architecture policies found
> [    0.538141] evm: Initialising EVM extended attributes:
> [    0.538144] evm: security.selinux
> [    0.538147] evm: security.SMACK64 (disabled)
> [    0.538150] evm: security.SMACK64EXEC (disabled)
> [    0.538152] evm: security.SMACK64TRANSMUTE (disabled)
> [    0.538154] evm: security.SMACK64MMAP (disabled)
> [    0.538156] evm: security.apparmor
> [    0.538158] evm: security.ima
> [    0.538160] evm: security.capability
> [    0.538163] evm: HMAC attrs: 0x1
> [    0.541475] RAS: Correctable Errors collector initialized.
> [    0.541655] clk: Disabling unused clocks
> [    0.544438] Freeing unused decrypted memory: 2028K
> [    0.545641] Freeing unused kernel image (initmem) memory: 3964K
> [    0.566048] Write protecting the kernel read-only data: 28672k
> [    0.567474] Freeing unused kernel image (rodata/data gap) memory: 1740K
> [    0.639476] x86/mm: Checked W+X mappings: passed, no W+X pages found.
> [    0.639478] x86/mm: Checking user space page tables
> [    0.681490] x86/mm: Checked W+X mappings: passed, no W+X pages found.
> [    0.681501] Run /init as init process
> [    0.681503]   with arguments:
> [    0.681504]     /init
> [    0.681505]   with environment:
> [    0.681506]     HOME=3D/
> [    0.681507]     TERM=3Dlinux
> [    0.681512]     BOOT_IMAGE=3D/vmlinuz-6.6.15-amd64
> [    0.864830] wmi_bus wmi_bus-PNP0C14:01: WQBC data block query control =
method not found
> [    0.881460] hid: raw HID events driver (C) Jiri Kosina
> [    0.898855] cryptd: max_cpu_qlen set to 1000
> [    0.929725] ACPI: battery: Slot [BAT0] (battery present)
> [    0.947475] intel-lpss 0000:00:15.0: enabling device (0000 -> 0002)
> [    0.947661] platform idma64.0: Adding to iommu group 12
> [    0.948758] i801_smbus 0000:00:1f.4: SPD Write Disable is set
> [    0.948798] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
> [    0.949038] AVX2 version of gcm_enc/dec engaged.
> [    0.949066] AES CTR mode by8 optimization enabled
> [    0.951135] idma64 idma64.0: Found Intel integrated DMA 64-bit
> [    0.951183] platform i2c_designware.0: Adding to iommu group 13
> [    0.964632] intel-lpss 0000:00:15.1: enabling device (0000 -> 0002)
> [    0.964833] platform idma64.1: Adding to iommu group 14
> [    0.964967] idma64 idma64.1: Found Intel integrated DMA 64-bit
> [    0.965119] platform i2c_designware.1: Adding to iommu group 15
> [    0.975258] ACPI: bus type USB registered
> [    0.975297] usbcore: registered new interface driver usbfs
> [    0.975307] usbcore: registered new interface driver hub
> [    0.975319] usbcore: registered new device driver usb
> [    0.979106] i2c i2c-0: 2/2 memory slots populated (from DMI)
> [    0.996258] ACPI: bus type drm_connector registered
> [    1.184430] xhci_hcd 0000:00:14.0: xHCI Host Controller
> [    1.184457] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bu=
s number 1
> [    1.185878] xhci_hcd 0000:00:14.0: hcc params 0x200077c1 hci version 0=
x100 quirks 0x0000000081109810
> [    1.187210] xhci_hcd 0000:00:14.0: xHCI Host Controller
> [    1.187231] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bu=
s number 2
> [    1.187246] xhci_hcd 0000:00:14.0: Host supports USB 3.0 SuperSpeed
> [    1.187365] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.06
> [    1.187377] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Se=
rialNumber=3D1
> [    1.187385] usb usb1: Product: xHCI Host Controller
> [    1.187392] usb usb1: Manufacturer: Linux 6.6.15-amd64 xhci-hcd
> [    1.187399] usb usb1: SerialNumber: 0000:00:14.0
> [    1.189145] hub 1-0:1.0: USB hub found
> [    1.189183] hub 1-0:1.0: 12 ports detected
> [    1.189797] input: DLL075B:01 06CB:76AF Mouse as /devices/pci0000:00/0=
000:00:15.1/i2c_designware.1/i2c-2/i2c-DLL075B:01/0018:06CB:76AF.0001/input=
/input2
> [    1.190397] input: DLL075B:01 06CB:76AF Touchpad as /devices/pci0000:0=
0/0000:00:15.1/i2c_designware.1/i2c-2/i2c-DLL075B:01/0018:06CB:76AF.0001/in=
put/input3
> [    1.190921] hid-generic 0018:06CB:76AF.0001: input,hidraw0: I2C HID v1=
=2E00 Mouse [DLL075B:01 06CB:76AF] on i2c-DLL075B:01
> [    1.199487] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.06
> [    1.199502] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Se=
rialNumber=3D1
> [    1.199510] usb usb2: Product: xHCI Host Controller
> [    1.199518] usb usb2: Manufacturer: Linux 6.6.15-amd64 xhci-hcd
> [    1.199524] usb usb2: SerialNumber: 0000:00:14.0
> [    1.199955] hub 2-0:1.0: USB hub found
> [    1.199984] hub 2-0:1.0: 6 ports detected
> [    1.202328] usb: port power management may be unreliable
> [    1.242198] tsc: Refined TSC clocksource calibration: 2904.007 MHz
> [    1.242220] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x2=
9dc0c50045, max_idle_ns: 440795208304 ns
> [    1.248560] clocksource: Switched to clocksource tsc
> [    1.253338] nvme nvme0: pci function 0000:3b:00.0
> [    1.271981] nvme nvme0: 4/0/0 default/read/poll queues
> [    1.278658]  nvme0n1: p1 p2 p3 p4
> [    1.394534] device-mapper: core: CONFIG_IMA_DISABLE_HTABLE is disabled=
=2E Duplicate IMA measurements will not be recorded in the IMA log.
> [    1.394580] device-mapper: uevent: version 1.0.3
> [    1.394714] device-mapper: ioctl: 4.48.0-ioctl (2023-03-01) initialise=
d: dm-devel@redhat.com
> [    1.454252] usb 1-3: new full-speed USB device number 2 using xhci_hcd
> [    1.604161] usb 1-3: New USB device found, idVendor=3D0cf3, idProduct=
=3De300, bcdDevice=3D 0.01
> [    1.604179] usb 1-3: New USB device strings: Mfr=3D0, Product=3D0, Ser=
ialNumber=3D0
> [    1.734256] usb 1-4: new full-speed USB device number 3 using xhci_hcd
> [    1.884693] usb 1-4: New USB device found, idVendor=3D04f3, idProduct=
=3D2234, bcdDevice=3D11.11
> [    1.884709] usb 1-4: New USB device strings: Mfr=3D4, Product=3D14, Se=
rialNumber=3D0
> [    1.884717] usb 1-4: Product: Touchscreen
> [    1.884722] usb 1-4: Manufacturer: ELAN
> [    1.906797] input: ELAN Touchscreen as /devices/pci0000:00/0000:00:14.=
0/usb1/1-4/1-4:1.0/0003:04F3:2234.0002/input/input5
> [    1.906878] input: ELAN Touchscreen as /devices/pci0000:00/0000:00:14.=
0/usb1/1-4/1-4:1.0/0003:04F3:2234.0002/input/input6
> [    1.906898] input: ELAN Touchscreen as /devices/pci0000:00/0000:00:14.=
0/usb1/1-4/1-4:1.0/0003:04F3:2234.0002/input/input7
> [    1.906970] hid-generic 0003:04F3:2234.0002: input,hiddev0,hidraw1: US=
B HID v1.10 Device [ELAN Touchscreen] on usb-0000:00:14.0-4/input0
> [    1.907003] usbcore: registered new interface driver usbhid
> [    1.907004] usbhid: USB HID core driver
> [    2.014307] usb 1-5: new high-speed USB device number 4 using xhci_hcd
> [    2.223222] usb 1-5: New USB device found, idVendor=3D0c45, idProduct=
=3D670c, bcdDevice=3D56.26
> [    2.223240] usb 1-5: New USB device strings: Mfr=3D2, Product=3D1, Ser=
ialNumber=3D0
> [    2.223247] usb 1-5: Product: Integrated_Webcam_HD
> [    2.223252] usb 1-5: Manufacturer: CN09GTFMLOG008C8B7FWA01
> [    8.077253] PM: Image not found (code -22)
> [    8.223980] EXT4-fs (dm-0): mounted filesystem 32e29882-d94d-4a92-9ee4=
-4d03002bfa29 ro with ordered data mode. Quota mode: none.
> [    8.267645] Not activating Mandatory Access Control as /sbin/tomoyo-in=
it does not exist.
> [    8.410989] systemd[1]: Inserted module 'autofs4'
> [    8.455550] systemd[1]: systemd 255.3-2 running in system mode (+PAM +=
AUDIT +SELINUX +APPARMOR +IMA +SMACK +SECCOMP +GCRYPT -GNUTLS +OPENSSL +ACL=
 +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETUP +LIBFD=
ISK +PCRE2 -PWQUALITY +P11KIT +QRENCODE +TPM2 +BZIP2 +LZ4 +XZ +ZLIB +ZSTD -=
BPF_FRAMEWORK -XKBCOMMON +UTMP +SYSVINIT default-hierarchy=3Dunified)
> [    8.455563] systemd[1]: Detected architecture x86-64.
> [    8.456641] systemd[1]: Hostname set to <abreu>.
> [    8.643651] systemd[1]: Queued start job for default target graphical.=
target.
> [    8.671176] systemd[1]: Created slice system-getty.slice - Slice /syst=
em/getty.
> [    8.671530] systemd[1]: Created slice system-modprobe.slice - Slice /s=
ystem/modprobe.
> [    8.671824] systemd[1]: Created slice system-systemd\x2dcryptsetup.sli=
ce - Encrypted Volume Units Service Slice.
> [    8.672111] systemd[1]: Created slice system-systemd\x2dfsck.slice - S=
lice /system/systemd-fsck.
> [    8.672337] systemd[1]: Created slice user.slice - User and Session Sl=
ice.
> [    8.672407] systemd[1]: Started systemd-ask-password-console.path - Di=
spatch Password Requests to Console Directory Watch.
> [    8.672466] systemd[1]: Started systemd-ask-password-wall.path - Forwa=
rd Password Requests to Wall Directory Watch.
> [    8.672642] systemd[1]: Set up automount proc-sys-fs-binfmt_misc.autom=
ount - Arbitrary Executable File Formats File System Automount Point.
> [    8.672663] systemd[1]: Expecting device dev-disk-by\x2ddiskseq-1\x2dp=
art4.device - /dev/disk/by-diskseq/1-part4...
> [    8.672670] systemd[1]: Expecting device dev-disk-by\x2duuid-2d23fd4c\=
x2d5d03\x2d4e1a\x2d8a42\x2d0e859d1f00d8.device - /dev/disk/by-uuid/2d23fd4c=
-5d03-4e1a-8a42-0e859d1f00d8...
> [    8.672676] systemd[1]: Expecting device dev-disk-by\x2duuid-61be8f50\=
x2d69c5\x2d49a5\x2dbcad\x2d3f4521e9c7b5.device - /dev/disk/by-uuid/61be8f50=
-69c5-49a5-bcad-3f4521e9c7b5...
> [    8.672681] systemd[1]: Expecting device dev-disk-by\x2duuid-96BD\x2d5=
653.device - /dev/disk/by-uuid/96BD-5653...
> [    8.672699] systemd[1]: Reached target integritysetup.target - Local I=
ntegrity Protected Volumes.
> [    8.672718] systemd[1]: Reached target nss-user-lookup.target - User a=
nd Group Name Lookups.
> [    8.672727] systemd[1]: Reached target paths.target - Path Units.
> [    8.672740] systemd[1]: Reached target remote-fs.target - Remote File =
Systems.
> [    8.672748] systemd[1]: Reached target slices.target - Slice Units.
> [    8.672774] systemd[1]: Reached target veritysetup.target - Local Veri=
ty Protected Volumes.
> [    8.673997] systemd[1]: Listening on systemd-coredump.socket - Process=
 Core Dump Socket.
> [    8.674112] systemd[1]: Listening on systemd-fsckd.socket - fsck to fs=
ckd communication Socket.
> [    8.674172] systemd[1]: Listening on systemd-initctl.socket - initctl =
Compatibility Named Pipe.
> [    8.674295] systemd[1]: Listening on systemd-journald-dev-log.socket -=
 Journal Socket (/dev/log).
> [    8.674424] systemd[1]: Listening on systemd-journald.socket - Journal=
 Socket.
> [    8.674464] systemd[1]: systemd-pcrextend.socket - TPM2 PCR Extension =
(Varlink) was skipped because of an unmet condition check (ConditionSecurit=
y=3Dmeasured-uki).
> [    8.674718] systemd[1]: Listening on systemd-udevd-control.socket - ud=
ev Control Socket.
> [    8.674823] systemd[1]: Listening on systemd-udevd-kernel.socket - ude=
v Kernel Socket.
> [    8.675989] systemd[1]: Mounting dev-hugepages.mount - Huge Pages File=
 System...
> [    8.676768] systemd[1]: Mounting dev-mqueue.mount - POSIX Message Queu=
e File System...
> [    8.677979] systemd[1]: Mounting sys-kernel-debug.mount - Kernel Debug=
 File System...
> [    8.682177] systemd[1]: Mounting sys-kernel-tracing.mount - Kernel Tra=
ce File System...
> [    8.683819] systemd[1]: Starting keyboard-setup.service - Set the cons=
ole keyboard layout...
> [    8.687014] systemd[1]: Starting kmod-static-nodes.service - Create Li=
st of Static Device Nodes...
> [    8.689193] systemd[1]: Starting modprobe@configfs.service - Load Kern=
el Module configfs...
> [    8.693409] systemd[1]: Starting modprobe@dm_mod.service - Load Kernel=
 Module dm_mod...
> [    8.696414] systemd[1]: Starting modprobe@drm.service - Load Kernel Mo=
dule drm...
> [    8.702276] systemd[1]: Starting modprobe@efi_pstore.service - Load Ke=
rnel Module efi_pstore...
> [    8.705003] systemd[1]: Starting modprobe@fuse.service - Load Kernel M=
odule fuse...
> [    8.710323] systemd[1]: Starting modprobe@loop.service - Load Kernel M=
odule loop...
> [    8.710496] systemd[1]: systemd-fsck-root.service - File System Check =
on Root Device was skipped because of an unmet condition check (ConditionPa=
thExists=3D!/run/initramfs/fsck-root).
> [    8.713837] systemd[1]: Starting systemd-journald.service - Journal Se=
rvice...
> [    8.718269] systemd[1]: Starting systemd-modules-load.service - Load K=
ernel Modules...
> [    8.718297] systemd[1]: systemd-pcrmachine.service - TPM2 PCR Machine =
ID Measurement was skipped because of an unmet condition check (ConditionSe=
curity=3Dmeasured-uki).
> [    8.720093] systemd[1]: Starting systemd-remount-fs.service - Remount =
Root and Kernel File Systems...
> [    8.722112] systemd[1]: systemd-tpm2-setup-early.service - TPM2 SRK Se=
tup (Early) was skipped because of an unmet condition check (ConditionSecur=
ity=3Dmeasured-uki).
> [    8.722497] pstore: Using crash dump compression: deflate
> [    8.723784] systemd[1]: Starting systemd-udev-trigger.service - Coldpl=
ug All udev Devices...
> [    8.730196] systemd[1]: Mounted dev-hugepages.mount - Huge Pages File =
System.
> [    8.730376] systemd[1]: Mounted dev-mqueue.mount - POSIX Message Queue=
 File System.
> [    8.730508] systemd[1]: Mounted sys-kernel-debug.mount - Kernel Debug =
File System.
> [    8.730634] systemd[1]: Mounted sys-kernel-tracing.mount - Kernel Trac=
e File System.
> [    8.730908] systemd[1]: Finished keyboard-setup.service - Set the cons=
ole keyboard layout.
> [    8.731243] systemd[1]: Finished kmod-static-nodes.service - Create Li=
st of Static Device Nodes.
> [    8.731660] systemd[1]: modprobe@configfs.service: Deactivated success=
fully.
> [    8.731842] systemd[1]: Finished modprobe@configfs.service - Load Kern=
el Module configfs.
> [    8.735074] systemd[1]: modprobe@dm_mod.service: Deactivated successfu=
lly.
> [    8.735786] systemd[1]: Finished modprobe@dm_mod.service - Load Kernel=
 Module dm_mod.
> [    8.736219] systemd[1]: modprobe@drm.service: Deactivated successfully.
> [    8.736450] pstore: Registered efi_pstore as persistent store backend
> [    8.736818] systemd[1]: Finished modprobe@drm.service - Load Kernel Mo=
dule drm.
> [    8.737277] systemd[1]: modprobe@efi_pstore.service: Deactivated succe=
ssfully.
> [    8.737497] systemd[1]: Finished modprobe@efi_pstore.service - Load Ke=
rnel Module efi_pstore.
> [    8.737878] systemd[1]: modprobe@fuse.service: Deactivated successfull=
y.
> [    8.738187] systemd[1]: Finished modprobe@fuse.service - Load Kernel M=
odule fuse.
> [    8.742285] loop: module loaded
> [    8.742736] systemd[1]: Mounting sys-fs-fuse-connections.mount - FUSE =
Control File System...
> [    8.743902] systemd[1]: Mounting sys-kernel-config.mount - Kernel Conf=
iguration File System...
> [    8.750271] systemd[1]: Starting systemd-tmpfiles-setup-dev-early.serv=
ice - Create Static Device Nodes in /dev gracefully...
> [    8.751338] systemd[1]: modprobe@loop.service: Deactivated successfull=
y.
> [    8.751539] systemd[1]: Finished modprobe@loop.service - Load Kernel M=
odule loop.
> [    8.751783] systemd[1]: systemd-repart.service - Repartition Root Disk=
 was skipped because no trigger condition checks were met.
> [    8.753792] systemd[1]: Mounted sys-fs-fuse-connections.mount - FUSE C=
ontrol File System.
> [    8.755981] systemd[1]: Mounted sys-kernel-config.mount - Kernel Confi=
guration File System.
> [    8.756565] systemd-journald[420]: Collecting audit messages is disabl=
ed.
> [    8.772267] EXT4-fs (dm-0): re-mounted 32e29882-d94d-4a92-9ee4-4d03002=
bfa29 r/w. Quota mode: none.
> [    8.774040] lp: driver loaded but no devices found
> [    8.774778] systemd[1]: Finished systemd-remount-fs.service - Remount =
Root and Kernel File Systems.
> [    8.775758] systemd[1]: systemd-hwdb-update.service - Rebuild Hardware=
 Database was skipped because of an unmet condition check (ConditionNeedsUp=
date=3D/etc).
> [    8.775827] systemd[1]: systemd-pstore.service - Platform Persistent S=
torage Archival was skipped because of an unmet condition check (ConditionD=
irectoryNotEmpty=3D/sys/fs/pstore).
> [    8.782653] systemd[1]: Starting systemd-random-seed.service - Load/Sa=
ve OS Random Seed...
> [    8.782694] systemd[1]: systemd-tpm2-setup.service - TPM2 SRK Setup wa=
s skipped because of an unmet condition check (ConditionSecurity=3Dmeasured=
-uki).
> [    8.786197] ppdev: user-space parallel port driver
> [    8.789159] systemd[1]: Finished systemd-tmpfiles-setup-dev-early.serv=
ice - Create Static Device Nodes in /dev gracefully.
> [    8.789381] systemd[1]: systemd-sysusers.service - Create System Users=
 was skipped because no trigger condition checks were met.
> [    8.794227] systemd[1]: Starting systemd-tmpfiles-setup-dev.service - =
Create Static Device Nodes in /dev...
> [    8.813522] systemd[1]: Started systemd-journald.service - Journal Ser=
vice.
> [    8.839842] systemd-journald[420]: Received client request to flush ru=
ntime journal.
> [    8.854396] systemd-journald[420]: /var/log/journal/16ae67b9dca94ecebb=
c8ec78ab24e074/system.journal: Journal file uses a different sequence numbe=
r ID, rotating.
> [    8.854403] systemd-journald[420]: Rotating system journal.
> [    9.054245] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0=
C0D:00/input/input9
> [    9.063364] ACPI: AC: AC Adapter [AC] (on-line)
> [    9.065351] intel_pmc_core INT33A1:00:  initialized
> [    9.071262] input: Intel HID events as /devices/platform/INT33D5:00/in=
put/input10
> [    9.096857] Consider using thermal netlink events interface
> [    9.110557] ACPI: button: Lid Switch [LID0]
> [    9.110638] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PN=
P0C0C:00/input/input11
> [    9.149424] input: Intel Virtual Buttons as /devices/pci0000:00/0000:0=
0:1f.0/PNP0C09:00/INT33D6:00/input/input12
> [    9.151878] intel-hid INT33D5:00: platform supports 5 button array
> [    9.152254] input: Intel HID 5 button array as /devices/platform/INT33=
D5:00/input/input13
> [    9.158008] proc_thermal 0000:00:04.0: enabling device (0000 -> 0002)
> [    9.168368] ACPI: button: Power Button [PBTN]
> [    9.168467] input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PN=
P0C0E:00/input/input15
> [    9.170878] intel_rapl_common: Found RAPL domain package
> [    9.170881] intel_rapl_common: Found RAPL domain dram
> [    9.201444] Adding 8387904k swap on /dev/nvme0n1p4.  Priority:-2 exten=
ts:1 across:8387904k SS
> [    9.237082] mc: Linux media interface: v0.10
> [    9.239992] ACPI: button: Sleep Button [SBTN]
> [    9.240062] input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/in=
put/input16
> [    9.256708] ACPI: button: Power Button [PWRF]
> [    9.266385] input: DLL075B:01 06CB:76AF Mouse as /devices/pci0000:00/0=
000:00:15.1/i2c_designware.1/i2c-2/i2c-DLL075B:01/0018:06CB:76AF.0001/input=
/input17
> [    9.276573] input: DLL075B:01 06CB:76AF Touchpad as /devices/pci0000:0=
0/0000:00:15.1/i2c_designware.1/i2c-2/i2c-DLL075B:01/0018:06CB:76AF.0001/in=
put/input18
> [    9.276914] hid-multitouch 0018:06CB:76AF.0001: input,hidraw0: I2C HID=
 v1.00 Mouse [DLL075B:01 06CB:76AF] on i2c-DLL075B:01
> [    9.288011] input: PC Speaker as /devices/platform/pcspkr/input/input20
> [    9.295676] mei_me 0000:00:16.0: enabling device (0000 -> 0002)
> [    9.313360] videodev: Linux video capture interface: v2.00
> [    9.459257] Bluetooth: Core ver 2.22
> [    9.459276] NET: Registered PF_BLUETOOTH protocol family
> [    9.459277] Bluetooth: HCI device and connection manager initialized
> [    9.459282] Bluetooth: HCI socket layer initialized
> [    9.459284] Bluetooth: L2CAP socket layer initialized
> [    9.459287] Bluetooth: SCO socket layer initialized
> [    9.471303] iTCO_vendor_support: vendor-support=3D0
> [    9.511536] input: ELAN Touchscreen as /devices/pci0000:00/0000:00:14.=
0/usb1/1-4/1-4:1.0/0003:04F3:2234.0002/input/input21
> [    9.513294] input: ELAN Touchscreen UNKNOWN as /devices/pci0000:00/000=
0:00:14.0/usb1/1-4/1-4:1.0/0003:04F3:2234.0002/input/input22
> [    9.514917] input: ELAN Touchscreen UNKNOWN as /devices/pci0000:00/000=
0:00:14.0/usb1/1-4/1-4:1.0/0003:04F3:2234.0002/input/input23
> [    9.515807] hid-multitouch 0003:04F3:2234.0002: input,hiddev0,hidraw1:=
 USB HID v1.10 Device [ELAN Touchscreen] on usb-0000:00:14.0-4/input0
> [    9.537299] iTCO_wdt iTCO_wdt: Found a Intel PCH TCO device (Version=
=3D4, TCOBASE=3D0x0400)
> [    9.537420] iTCO_wdt iTCO_wdt: initialized. heartbeat=3D30 sec (nowayo=
ut=3D0)
> [    9.626281] cfg80211: Loading compiled-in X.509 certificates for regul=
atory database
> [    9.626959] Loaded X.509 cert 'benh@debian.org: 577e021cb980e0e820821b=
a7b54b4961b8b4fadf'
> [    9.627112] Loaded X.509 cert 'romain.perier@gmail.com: 3abbc6ec146e09=
d1b6016ab9d6cf71dd233f0328'
> [    9.627270] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
> [    9.628129] Loaded X.509 cert 'wens: 61c038651aabdcf94bd0ac7ff06c7248d=
b18c600'
> [    9.639384] platform regulatory.0: firmware: direct-loading firmware r=
egulatory.db
> [    9.640278] platform regulatory.0: firmware: direct-loading firmware r=
egulatory.db.p7s
> [    9.641102] EXT4-fs (nvme0n1p2): mounted filesystem 2d23fd4c-5d03-4e1a=
-8a42-0e859d1f00d8 r/w with ordered data mode. Quota mode: none.
> [    9.658685] input: Dell WMI hotkeys as /devices/platform/PNP0C14:01/wm=
i_bus/wmi_bus-PNP0C14:01/9DBB5994-A997-11DA-B012-B622A1EF5492/input/input25
> [    9.682093] RAPL PMU: API unit is 2^-32 Joules, 5 fixed counters, 6553=
60 ms ovfl timer
> [    9.682097] RAPL PMU: hw unit of domain pp0-core 2^-14 Joules
> [    9.682099] RAPL PMU: hw unit of domain package 2^-14 Joules
> [    9.682100] RAPL PMU: hw unit of domain dram 2^-14 Joules
> [    9.682101] RAPL PMU: hw unit of domain pp1-gpu 2^-14 Joules
> [    9.682102] RAPL PMU: hw unit of domain psys 2^-14 Joules
> [    9.694773] intel_rapl_common: Found RAPL domain package
> [    9.694778] intel_rapl_common: Found RAPL domain core
> [    9.694779] intel_rapl_common: Found RAPL domain uncore
> [    9.694781] intel_rapl_common: Found RAPL domain dram
> [    9.694782] intel_rapl_common: Found RAPL domain psys
> [    9.726044] usb 1-5: Found UVC 1.00 device Integrated_Webcam_HD (0c45:=
670c)
> [    9.794801] usbcore: registered new interface driver uvcvideo
> [    9.835502] usbcore: registered new interface driver btusb
> [    9.853546] bluetooth hci0: firmware: direct-loading firmware qca/ramp=
atch_usb_00000302.bin
> [    9.853868] Bluetooth: hci0: using rampatch file: qca/rampatch_usb_000=
00302.bin
> [    9.853870] Bluetooth: hci0: QCA: patch rome 0x302 build 0x3e8, firmwa=
re rome 0x302 build 0x111
> [   10.267699] bluetooth hci0: firmware: direct-loading firmware qca/nvm_=
usb_00000302.bin
> [   10.267739] Bluetooth: hci0: using NVM file: qca/nvm_usb_00000302.bin
> [   10.295745] Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection=
 command is advertised, but not supported.
> [   10.297430] i915 0000:00:02.0: [drm] VT-d active for gfx access
> [   10.297743] Console: switching to colour dummy device 80x25
> [   10.298402] i915 0000:00:02.0: vgaarb: deactivate vga console
> [   10.298456] i915 0000:00:02.0: [drm] Using Transparent Hugepages
> [   10.358158] i915 0000:00:02.0: vgaarb: VGA decodes changed: olddecodes=
=3Dio+mem,decodes=3Dio+mem:owns=3Dio+mem
> [   10.358614] mei_hdcp 0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1c54b627f04=
: bound 0000:00:02.0 (ops i915_hdcp_ops [i915])
> [   10.359467] snd_hda_intel 0000:00:1f.3: DSP detected with PCI class/su=
bclass/prog-if info 0x040380
> [   10.359484] snd_hda_intel 0000:00:1f.3: enabling device (0000 -> 0002)
> [   10.360849] i915 0000:00:02.0: firmware: direct-loading firmware i915/=
kbl_dmc_ver1_04.bin
> [   10.361213] i915 0000:00:02.0: [drm] Finished loading DMC firmware i91=
5/kbl_dmc_ver1_04.bin (v1.4)
> [   10.443735] i915 0000:00:02.0: [drm] [ENCODER:102:DDI B/PHY B] is disa=
bled/in DSI mode with an ungated DDI clock, gate it
> [   10.454716] ath10k_pci 0000:3a:00.0: enabling device (0000 -> 0002)
> [   10.466092] i915 0000:00:02.0: [drm] [ENCODER:113:DDI C/PHY C] is disa=
bled/in DSI mode with an ungated DDI clock, gate it
> [   10.467250] ath10k_pci 0000:3a:00.0: pci irq msi oper_irq_mode 2 irq_m=
ode 0 reset_mode 0
> [   10.505098] audit: type=3D1400 audit(1707929292.560:2): apparmor=3D"ST=
ATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"lsb_release=
" pid=3D605 comm=3D"apparmor_parser"
> [   10.505660] audit: type=3D1400 audit(1707929292.560:3): apparmor=3D"ST=
ATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"nvidia_modp=
robe" pid=3D606 comm=3D"apparmor_parser"
> [   10.505665] audit: type=3D1400 audit(1707929292.560:4): apparmor=3D"ST=
ATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"nvidia_modp=
robe//kmod" pid=3D606 comm=3D"apparmor_parser"
> [   10.521223] audit: type=3D1400 audit(1707929292.576:5): apparmor=3D"ST=
ATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"/usr/bin/ma=
n" pid=3D611 comm=3D"apparmor_parser"
> [   10.521229] audit: type=3D1400 audit(1707929292.576:6): apparmor=3D"ST=
ATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"man_filter"=
 pid=3D611 comm=3D"apparmor_parser"
> [   10.521231] audit: type=3D1400 audit(1707929292.576:7): apparmor=3D"ST=
ATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"man_groff" =
pid=3D611 comm=3D"apparmor_parser"
> [   10.527460] [drm] Initialized i915 1.6.0 20201103 for 0000:00:02.0 on =
minor 0
> [   10.528811] audit: type=3D1400 audit(1707929292.584:8): apparmor=3D"ST=
ATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"/usr/lib/Ne=
tworkManager/nm-dhcp-client.action" pid=3D607 comm=3D"apparmor_parser"
> [   10.528816] audit: type=3D1400 audit(1707929292.584:9): apparmor=3D"ST=
ATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"/usr/lib/Ne=
tworkManager/nm-dhcp-helper" pid=3D607 comm=3D"apparmor_parser"
> [   10.528818] audit: type=3D1400 audit(1707929292.584:10): apparmor=3D"S=
TATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"/usr/lib/c=
onnman/scripts/dhclient-script" pid=3D607 comm=3D"apparmor_parser"
> [   10.528820] audit: type=3D1400 audit(1707929292.584:11): apparmor=3D"S=
TATUS" operation=3D"profile_load" profile=3D"unconfined" name=3D"/{,usr/}sb=
in/dhclient" pid=3D607 comm=3D"apparmor_parser"
> [   10.547477] ACPI: video: Video Device [GFX0] (multi-head: yes  rom: no=
  post: no)
> [   10.548189] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A=
08:00/LNXVIDEO:00/input/input26
> [   10.548407] snd_hda_intel 0000:00:1f.3: bound 0000:00:02.0 (ops i915_a=
udio_component_bind_ops [i915])
> [   10.556873] fbcon: i915drmfb (fb0) is primary device
> [   10.564911] Console: switching to colour frame buffer device 200x56
> [   10.588831] i915 0000:00:02.0: [drm] fb0: i915drmfb frame buffer device
> [   10.749543] ath10k_pci 0000:3a:00.0: firmware: failed to load ath10k/p=
re-cal-pci-0000:3a:00.0.bin (-2)
> [   10.749576] firmware_class: See https://wiki.debian.org/Firmware for i=
nformation about missing firmware
> [   10.749618] ath10k_pci 0000:3a:00.0: firmware: failed to load ath10k/p=
re-cal-pci-0000:3a:00.0.bin (-2)
> [   10.749655] ath10k_pci 0000:3a:00.0: firmware: failed to load ath10k/c=
al-pci-0000:3a:00.0.bin (-2)
> [   10.749686] ath10k_pci 0000:3a:00.0: firmware: failed to load ath10k/c=
al-pci-0000:3a:00.0.bin (-2)
> [   10.761772] ath10k_pci 0000:3a:00.0: firmware: direct-loading firmware=
 ath10k/QCA6174/hw3.0/firmware-6.bin
> [   10.764040] ath10k_pci 0000:3a:00.0: qca6174 hw3.2 target 0x05030000 c=
hip_id 0x00340aff sub 1a56:1535
> [   10.764046] ath10k_pci 0000:3a:00.0: kconfig debug 0 debugfs 0 tracing=
 0 dfs 0 testmode 0
> [   10.764445] ath10k_pci 0000:3a:00.0: firmware ver WLAN.RM.4.4.1-00288-=
 api 6 features wowlan,ignore-otp,mfp crc32 bf907c7c
> [   10.798401] snd_hda_codec_realtek hdaudioC0D0: autoconfig for ALC3246:=
 line_outs=3D1 (0x14/0x0/0x0/0x0/0x0) type:speaker
> [   10.798408] snd_hda_codec_realtek hdaudioC0D0:    speaker_outs=3D0 (0x=
0/0x0/0x0/0x0/0x0)
> [   10.798411] snd_hda_codec_realtek hdaudioC0D0:    hp_outs=3D1 (0x21/0x=
0/0x0/0x0/0x0)
> [   10.798414] snd_hda_codec_realtek hdaudioC0D0:    mono: mono_out=3D0x0
> [   10.798416] snd_hda_codec_realtek hdaudioC0D0:    inputs:
> [   10.798417] snd_hda_codec_realtek hdaudioC0D0:      Headset Mic=3D0x19
> [   10.798419] snd_hda_codec_realtek hdaudioC0D0:      Headphone Mic=3D0x=
1a
> [   10.798421] snd_hda_codec_realtek hdaudioC0D0:      Internal Mic=3D0x12
> [   10.863066] ath10k_pci 0000:3a:00.0: firmware: direct-loading firmware=
 ath10k/QCA6174/hw3.0/board-2.bin
> [   10.866548] ath10k_pci 0000:3a:00.0: board_file api 2 bmi_id N/A crc32=
 d2863f91
> [   10.930388] input: HDA Digital PCBeep as /devices/pci0000:00/0000:00:1=
f.3/sound/card0/input27
> [   10.930471] input: HDA Intel PCH Headphone Mic as /devices/pci0000:00/=
0000:00:1f.3/sound/card0/input28
> [   10.930539] input: HDA Intel PCH HDMI/DP,pcm=3D3 as /devices/pci0000:0=
0/0000:00:1f.3/sound/card0/input29
> [   10.930607] input: HDA Intel PCH HDMI/DP,pcm=3D7 as /devices/pci0000:0=
0/0000:00:1f.3/sound/card0/input30
> [   10.930675] input: HDA Intel PCH HDMI/DP,pcm=3D8 as /devices/pci0000:0=
0/0000:00:1f.3/sound/card0/input31
> [   11.002520] ath10k_pci 0000:3a:00.0: htt-ver 3.87 wmi-op 4 htt-op 3 ca=
l otp max-sta 32 raw 0 hwcrypto 1
> [   11.094038] ath: EEPROM regdomain: 0x6c
> [   11.094042] ath: EEPROM indicates we should expect a direct regpair map
> [   11.094044] ath: Country alpha2 being used: 00
> [   11.094045] ath: Regpair used: 0x6c
> [   11.103634] ath10k_pci 0000:3a:00.0 wlp58s0: renamed from wlan0
> [   11.171809] NET: Registered PF_QIPCRTR protocol family
> [   11.328225] PPP generic driver version 2.4.2
> [   11.360229] Initializing XFRM netlink socket
> [   11.631372] NET: Registered PF_PPPOX protocol family
> [   11.655380] IPsec XFRM device driver
> [   11.908421] pipewire[853]: memfd_create() called without MFD_EXEC or M=
FD_NOEXEC_SEAL set
> [   11.964409] l2tp_core: L2TP core driver, V2.0
> [   11.976663] l2tp_netlink: L2TP netlink interface
> [   11.987665] l2tp_ppp: PPPoL2TP kernel driver, V2.0
> [   13.770288] pci 0000:01:00.0: [8086:1576] type 01 class 0x060400
> [   13.770346] pci 0000:01:00.0: enabling Extended Tags
> [   13.770643] pci 0000:01:00.0: supports D1 D2
> [   13.770645] pci 0000:01:00.0: PME# supported from D0 D1 D2 D3hot D3cold
> [   13.770731] pci 0000:01:00.0: 15.752 Gb/s available PCIe bandwidth, li=
mited by 8.0 GT/s PCIe x2 link at 0000:00:1c.0 (capable of 31.504 Gb/s with=
 8.0 GT/s PCIe x4 link)
> [   13.775620] pci 0000:01:00.0: Adding to iommu group 16
> [   13.835880] pci 0000:02:00.0: [8086:1576] type 01 class 0x060400
> [   13.835933] pci 0000:02:00.0: enabling Extended Tags
> [   13.836034] pci 0000:02:00.0: supports D1 D2
> [   13.836036] pci 0000:02:00.0: PME# supported from D0 D1 D2 D3hot D3cold
> [   13.836238] pci 0000:02:00.0: Adding to iommu group 17
> [   13.836344] pci 0000:02:01.0: [8086:1576] type 01 class 0x060400
> [   13.836398] pci 0000:02:01.0: enabling Extended Tags
> [   13.836497] pci 0000:02:01.0: supports D1 D2
> [   13.836499] pci 0000:02:01.0: PME# supported from D0 D1 D2 D3hot D3cold
> [   13.837131] pci 0000:02:01.0: Adding to iommu group 18
> [   13.837250] pci 0000:02:02.0: [8086:1576] type 01 class 0x060400
> [   13.837307] pci 0000:02:02.0: enabling Extended Tags
> [   13.837408] pci 0000:02:02.0: supports D1 D2
> [   13.837410] pci 0000:02:02.0: PME# supported from D0 D1 D2 D3hot D3cold
> [   13.840984] pci 0000:02:02.0: Adding to iommu group 19
> [   13.841122] pci 0000:01:00.0: PCI bridge to [bus 02-39]
> [   13.841133] pci 0000:01:00.0:   bridge window [mem 0xc4000000-0xda0fff=
ff]
> [   13.841140] pci 0000:01:00.0:   bridge window [mem 0xa0000000-0xc1ffff=
ff 64bit pref]
> [   13.842919] pci 0000:02:00.0: PCI bridge to [bus 03]
> [   13.842932] pci 0000:02:00.0:   bridge window [mem 0xda000000-0xda0fff=
ff]
> [   13.843019] pci 0000:02:01.0: PCI bridge to [bus 04-38]
> [   13.843029] pci 0000:02:01.0:   bridge window [mem 0xc4000000-0xd9efff=
ff]
> [   13.843036] pci 0000:02:01.0:   bridge window [mem 0xa0000000-0xc1ffff=
ff 64bit pref]
> [   13.844244] pci 0000:39:00.0: [8086:15b5] type 00 class 0x0c0330
> [   13.844270] pci 0000:39:00.0: reg 0x10: [mem 0xd9f00000-0xd9f0ffff]
> [   13.844346] pci 0000:39:00.0: enabling Extended Tags
> [   13.844474] pci 0000:39:00.0: supports D1 D2
> [   13.844476] pci 0000:39:00.0: PME# supported from D0 D1 D2 D3hot D3cold
> [   13.844590] pci 0000:39:00.0: 8.000 Gb/s available PCIe bandwidth, lim=
ited by 2.5 GT/s PCIe x4 link at 0000:02:02.0 (capable of 31.504 Gb/s with =
8.0 GT/s PCIe x4 link)
> [   13.845740] pci 0000:39:00.0: Adding to iommu group 19
> [   13.845818] pci 0000:02:02.0: PCI bridge to [bus 39]
> [   13.845830] pci 0000:02:02.0:   bridge window [mem 0xd9f00000-0xd9ffff=
ff]
> [   13.845863] pci_bus 0000:02: Allocating resources
> [   13.845880] pci 0000:02:01.0: bridge window [io  0x1000-0x0fff] to [bu=
s 04-38] add_size 1000
> [   13.845884] pci 0000:02:02.0: bridge window [io  0x1000-0x0fff] to [bu=
s 39] add_size 1000
> [   13.845887] pci 0000:02:02.0: bridge window [mem 0x00100000-0x000fffff=
 64bit pref] to [bus 39] add_size 200000 add_align 100000
> [   13.845891] pci 0000:01:00.0: bridge window [io  0x1000-0x0fff] to [bu=
s 02-39] add_size 2000
> [   13.845895] pci 0000:01:00.0: BAR 13: no space for [io  size 0x2000]
> [   13.845898] pci 0000:01:00.0: BAR 13: failed to assign [io  size 0x200=
0]
> [   13.845900] pci 0000:01:00.0: BAR 13: no space for [io  size 0x2000]
> [   13.845903] pci 0000:01:00.0: BAR 13: failed to assign [io  size 0x200=
0]
> [   13.845908] pci 0000:02:02.0: BAR 15: no space for [mem size 0x0020000=
0 64bit pref]
> [   13.845910] pci 0000:02:02.0: BAR 15: failed to assign [mem size 0x002=
00000 64bit pref]
> [   13.845913] pci 0000:02:01.0: BAR 13: no space for [io  size 0x1000]
> [   13.845915] pci 0000:02:01.0: BAR 13: failed to assign [io  size 0x100=
0]
> [   13.845918] pci 0000:02:02.0: BAR 13: no space for [io  size 0x1000]
> [   13.845920] pci 0000:02:02.0: BAR 13: failed to assign [io  size 0x100=
0]
> [   13.845923] pci 0000:02:02.0: BAR 15: no space for [mem size 0x0020000=
0 64bit pref]
> [   13.845926] pci 0000:02:02.0: BAR 15: failed to assign [mem size 0x002=
00000 64bit pref]
> [   13.845928] pci 0000:02:02.0: BAR 13: no space for [io  size 0x1000]
> [   13.845930] pci 0000:02:02.0: BAR 13: failed to assign [io  size 0x100=
0]
> [   13.845932] pci 0000:02:01.0: BAR 13: no space for [io  size 0x1000]
> [   13.845934] pci 0000:02:01.0: BAR 13: failed to assign [io  size 0x100=
0]
> [   13.845936] pci 0000:02:00.0: PCI bridge to [bus 03]
> [   13.845942] pci 0000:02:00.0:   bridge window [mem 0xda000000-0xda0fff=
ff]
> [   13.845952] pci 0000:02:01.0: PCI bridge to [bus 04-38]
> [   13.845957] pci 0000:02:01.0:   bridge window [mem 0xc4000000-0xd9efff=
ff]
> [   13.845962] pci 0000:02:01.0:   bridge window [mem 0xa0000000-0xc1ffff=
ff 64bit pref]
> [   13.845969] pci 0000:02:02.0: PCI bridge to [bus 39]
> [   13.845975] pci 0000:02:02.0:   bridge window [mem 0xd9f00000-0xd9ffff=
ff]
> [   13.845984] pci 0000:01:00.0: PCI bridge to [bus 02-39]
> [   13.845990] pci 0000:01:00.0:   bridge window [mem 0xc4000000-0xda0fff=
ff]
> [   13.845994] pci 0000:01:00.0:   bridge window [mem 0xa0000000-0xc1ffff=
ff 64bit pref]
> [   13.847600] xhci_hcd 0000:39:00.0: xHCI Host Controller
> [   13.847811] xhci_hcd 0000:39:00.0: new USB bus registered, assigned bu=
s number 3
> [   13.849339] xhci_hcd 0000:39:00.0: hcc params 0x200077c1 hci version 0=
x110 quirks 0x0000000200009810
> [   13.851404] xhci_hcd 0000:39:00.0: xHCI Host Controller
> [   13.851411] xhci_hcd 0000:39:00.0: new USB bus registered, assigned bu=
s number 4
> [   13.851416] xhci_hcd 0000:39:00.0: Host supports USB 3.1 Enhanced Supe=
rSpeed
> [   13.851463] usb usb3: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.06
> [   13.851466] usb usb3: New USB device strings: Mfr=3D3, Product=3D2, Se=
rialNumber=3D1
> [   13.851468] usb usb3: Product: xHCI Host Controller
> [   13.851470] usb usb3: Manufacturer: Linux 6.6.15-amd64 xhci-hcd
> [   13.851472] usb usb3: SerialNumber: 0000:39:00.0
> [   13.851628] hub 3-0:1.0: USB hub found
> [   13.851640] hub 3-0:1.0: 2 ports detected
> [   13.855322] usb usb4: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.06
> [   13.855328] usb usb4: New USB device strings: Mfr=3D3, Product=3D2, Se=
rialNumber=3D1
> [   13.855330] usb usb4: Product: xHCI Host Controller
> [   13.855332] usb usb4: Manufacturer: Linux 6.6.15-amd64 xhci-hcd
> [   13.855334] usb usb4: SerialNumber: 0000:39:00.0
> [   13.855469] hub 4-0:1.0: USB hub found
> [   13.855481] hub 4-0:1.0: 2 ports detected
> [   13.862394] pci_bus 0000:02: Allocating resources
> [   13.862412] pcieport 0000:02:01.0: bridge window [io  0x1000-0x0fff] t=
o [bus 04-38] add_size 1000
> [   13.862417] pcieport 0000:02:02.0: bridge window [io  0x1000-0x0fff] t=
o [bus 39] add_size 1000
> [   13.862421] pcieport 0000:02:02.0: bridge window [mem 0x00100000-0x000=
fffff 64bit pref] to [bus 39] add_size 200000 add_align 100000
> [   13.862425] pcieport 0000:01:00.0: bridge window [io  0x1000-0x0fff] t=
o [bus 02-39] add_size 2000
> [   13.862429] pcieport 0000:01:00.0: BAR 13: no space for [io  size 0x20=
00]
> [   13.862431] pcieport 0000:01:00.0: BAR 13: failed to assign [io  size =
0x2000]
> [   13.862434] pcieport 0000:01:00.0: BAR 13: no space for [io  size 0x20=
00]
> [   13.862436] pcieport 0000:01:00.0: BAR 13: failed to assign [io  size =
0x2000]
> [   13.862441] pcieport 0000:02:02.0: BAR 15: no space for [mem size 0x00=
200000 64bit pref]
> [   13.862443] pcieport 0000:02:02.0: BAR 15: failed to assign [mem size =
0x00200000 64bit pref]
> [   13.862445] pcieport 0000:02:01.0: BAR 13: no space for [io  size 0x10=
00]
> [   13.862447] pcieport 0000:02:01.0: BAR 13: failed to assign [io  size =
0x1000]
> [   13.862449] pcieport 0000:02:02.0: BAR 13: no space for [io  size 0x10=
00]
> [   13.862450] pcieport 0000:02:02.0: BAR 13: failed to assign [io  size =
0x1000]
> [   13.862453] pcieport 0000:02:02.0: BAR 15: no space for [mem size 0x00=
200000 64bit pref]
> [   13.862455] pcieport 0000:02:02.0: BAR 15: failed to assign [mem size =
0x00200000 64bit pref]
> [   13.862457] pcieport 0000:02:02.0: BAR 13: no space for [io  size 0x10=
00]
> [   13.862459] pcieport 0000:02:02.0: BAR 13: failed to assign [io  size =
0x1000]
> [   13.862461] pcieport 0000:02:01.0: BAR 13: no space for [io  size 0x10=
00]
> [   13.862462] pcieport 0000:02:01.0: BAR 13: failed to assign [io  size =
0x1000]
> [   14.110043] usb 3-1: new high-speed USB device number 2 using xhci_hcd
> [   14.260592] usb 3-1: New USB device found, idVendor=3D2109, idProduct=
=3D2817, bcdDevice=3D 5.e3
> [   14.260599] usb 3-1: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D3
> [   14.260601] usb 3-1: Product: USB2.0 Hub            =20
> [   14.260604] usb 3-1: Manufacturer: VIA Labs, Inc.        =20
> [   14.260605] usb 3-1: SerialNumber: 000000000
> [   14.262307] hub 3-1:1.0: USB hub found
> [   14.262489] hub 3-1:1.0: 5 ports detected
> [   14.390178] usb 4-1: new SuperSpeed USB device number 2 using xhci_hcd
> [   14.392177] rfkill: input handler disabled
> [   14.439584] usb 4-1: New USB device found, idVendor=3D2109, idProduct=
=3D0817, bcdDevice=3D 5.e3
> [   14.439591] usb 4-1: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D3
> [   14.439594] usb 4-1: Product: USB3.0 Hub            =20
> [   14.439595] usb 4-1: Manufacturer: VIA Labs, Inc.        =20
> [   14.439597] usb 4-1: SerialNumber: 000000000
> [   14.443963] hub 4-1:1.0: USB hub found
> [   14.444169] hub 4-1:1.0: 4 ports detected
> [   14.466397] Registered IR keymap rc-cec
> [   14.466459] rc rc0: DP-1 as /devices/pci0000:00/0000:00:02.0/rc/rc0
> [   14.466512] input: DP-1 as /devices/pci0000:00/0000:00:02.0/rc/rc0/inp=
ut32
> [   14.978058] usb 3-1.1: new high-speed USB device number 3 using xhci_h=
cd
> [   15.134388] usb 3-1.1: New USB device found, idVendor=3D2109, idProduc=
t=3D2817, bcdDevice=3D 7.b4
> [   15.134395] usb 3-1.1: New USB device strings: Mfr=3D1, Product=3D2, S=
erialNumber=3D3
> [   15.134397] usb 3-1.1: Product: USB2.0 Hub            =20
> [   15.134399] usb 3-1.1: Manufacturer: VIA Labs, Inc.        =20
> [   15.134401] usb 3-1.1: SerialNumber: 000000000
> [   15.135357] hub 3-1.1:1.0: USB hub found
> [   15.135572] hub 3-1.1:1.0: 4 ports detected
> [   15.513546] usb 4-1.1: new SuperSpeed USB device number 3 using xhci_h=
cd
> [   15.604694] usb 4-1.1: New USB device found, idVendor=3D2109, idProduc=
t=3D0817, bcdDevice=3D 7.b4
> [   15.604702] usb 4-1.1: New USB device strings: Mfr=3D1, Product=3D2, S=
erialNumber=3D3
> [   15.604705] usb 4-1.1: Product: USB3.0 Hub            =20
> [   15.604707] usb 4-1.1: Manufacturer: VIA Labs, Inc.        =20
> [   15.604709] usb 4-1.1: SerialNumber: 000000000
> [   15.606580] hub 4-1.1:1.0: USB hub found
> [   15.606671] hub 4-1.1:1.0: 4 ports detected
> [   15.787015] usb 4-1.4: new SuperSpeed USB device number 4 using xhci_h=
cd
> [   15.807955] usb 4-1.4: New USB device found, idVendor=3D058f, idProduc=
t=3D8468, bcdDevice=3D 1.00
> [   15.807961] usb 4-1.4: New USB device strings: Mfr=3D1, Product=3D2, S=
erialNumber=3D3
> [   15.807964] usb 4-1.4: Product: Mass Storage Device
> [   15.807966] usb 4-1.4: Manufacturer: Generic
> [   15.807968] usb 4-1.4: SerialNumber: 058F84688461
> [   15.863643] SCSI subsystem initialized
> [   15.878669] usb-storage 4-1.4:1.0: USB Mass Storage device detected
> [   15.879098] scsi host0: usb-storage 4-1.4:1.0
> [   15.879683] usbcore: registered new interface driver usb-storage
> [   15.885493] usbcore: registered new interface driver uas
> [   16.146066] usb 3-1.1.2: new high-speed USB device number 4 using xhci=
_hcd
> [   16.262487] usb 3-1.1.2: New USB device found, idVendor=3D0bda, idProd=
uct=3D5409, bcdDevice=3D 1.41
> [   16.262490] usb 3-1.1.2: New USB device strings: Mfr=3D1, Product=3D2,=
 SerialNumber=3D0
> [   16.262492] usb 3-1.1.2: Product: 4-Port USB 2.0 Hub
> [   16.262493] usb 3-1.1.2: Manufacturer: Generic
> [   16.264432] hub 3-1.1.2:1.0: USB hub found
> [   16.265460] hub 3-1.1.2:1.0: 4 ports detected
> [   16.330608] usb 4-1.1.2: new SuperSpeed USB device number 5 using xhci=
_hcd
> [   16.365246] usb 4-1.1.2: New USB device found, idVendor=3D0bda, idProd=
uct=3D0409, bcdDevice=3D 1.41
> [   16.365250] usb 4-1.1.2: New USB device strings: Mfr=3D1, Product=3D2,=
 SerialNumber=3D0
> [   16.365253] usb 4-1.1.2: Product: 4-Port USB 3.0 Hub
> [   16.365255] usb 4-1.1.2: Manufacturer: Generic
> [   16.371156] hub 4-1.1.2:1.0: USB hub found
> [   16.372478] hub 4-1.1.2:1.0: 2 ports detected
> [   16.891116] scsi 0:0:0:0: Direct-Access     Generic- SD/MMC           =
1.00 PQ: 0 ANSI: 6
> [   16.891767] scsi 0:0:0:1: Direct-Access     Generic- Micro SD/M2      =
1.08 PQ: 0 ANSI: 6
> [   16.909759] scsi 0:0:0:0: Attached scsi generic sg0 type 0
> [   16.910112] scsi 0:0:0:1: Attached scsi generic sg1 type 0
> [   16.925236] sd 0:0:0:0: [sda] Media removed, stopped polling
> [   16.925721] sd 0:0:0:1: [sdb] Media removed, stopped polling
> [   16.926303] sd 0:0:0:1: [sdb] Attached SCSI removable disk
> [   16.926558] sd 0:0:0:0: [sda] Attached SCSI removable disk
> [   17.038692] wlp58s0: authenticate with 88:71:b1:81:93:1b
> [   17.075068] wlp58s0: send auth to 88:71:b1:81:93:1b (try 1/3)
> [   17.077048] wlp58s0: authenticated
> [   17.078025] wlp58s0: associate with 88:71:b1:81:93:1b (try 1/3)
> [   17.099609] wlp58s0: RX AssocResp from 88:71:b1:81:93:1b (capab=3D0x10=
11 status=3D0 aid=3D1)
> [   17.102039] wlp58s0: associated
> [   17.107198] wlp58s0: Limiting TX power to 23 (23 - 0) dBm as advertise=
d by 88:71:b1:81:93:1b
> [   17.130106] usb 3-1.1.2.3: new low-speed USB device number 6 using xhc=
i_hcd
> [   17.238841] usb 3-1.1.2.3: New USB device found, idVendor=3D1bcf, idPr=
oduct=3D0005, bcdDevice=3D 0.14
> [   17.238847] usb 3-1.1.2.3: New USB device strings: Mfr=3D0, Product=3D=
2, SerialNumber=3D0
> [   17.238849] usb 3-1.1.2.3: Product: USB Optical Mouse
> [   17.249638] input: USB Optical Mouse as /devices/pci0000:00/0000:00:1c=
=2E0/0000:01:00.0/0000:02:02.0/0000:39:00.0/usb3/3-1/3-1.1/3-1.1.2/3-1.1.2.=
3/3-1.1.2.3:1.0/0003:1BCF:0005.0003/input/input33
> [   17.249805] hid-generic 0003:1BCF:0005.0003: input,hidraw2: USB HID v1=
=2E10 Mouse [USB Optical Mouse] on usb-0000:39:00.0-1.1.2.3/input0
> [   17.314444] usb 4-1.1.3: new SuperSpeed USB device number 6 using xhci=
_hcd
> [   17.335014] usb 4-1.1.3: New USB device found, idVendor=3D0bda, idProd=
uct=3D8153, bcdDevice=3D30.00
> [   17.335026] usb 4-1.1.3: New USB device strings: Mfr=3D1, Product=3D2,=
 SerialNumber=3D6
> [   17.335027] usb 4-1.1.3: Product: USB 10/100/1000 LAN
> [   17.335029] usb 4-1.1.3: Manufacturer: Realtek
> [   17.335030] usb 4-1.1.3: SerialNumber: 000001
> [   17.372036] usbcore: registered new device driver r8152-cfgselector
> [   17.422129] usb 3-1.1.2.4: new low-speed USB device number 7 using xhc=
i_hcd
> [   17.529923] usb 3-1.1.2.4: New USB device found, idVendor=3D413c, idPr=
oduct=3D2113, bcdDevice=3D 1.08
> [   17.529941] usb 3-1.1.2.4: New USB device strings: Mfr=3D0, Product=3D=
2, SerialNumber=3D0
> [   17.529948] usb 3-1.1.2.4: Product: Dell KB216 Wired Keyboard
> [   17.542335] input: Dell KB216 Wired Keyboard as /devices/pci0000:00/00=
00:00:1c.0/0000:01:00.0/0000:02:02.0/0000:39:00.0/usb3/3-1/3-1.1/3-1.1.2/3-=
1.1.2.4/3-1.1.2.4:1.0/0003:413C:2113.0004/input/input34
> [   17.602674] r8152-cfgselector 4-1.1.3: reset SuperSpeed USB device num=
ber 6 using xhci_hcd
> [   17.603018] hid-generic 0003:413C:2113.0004: input,hidraw3: USB HID v1=
=2E11 Keyboard [Dell KB216 Wired Keyboard] on usb-0000:39:00.0-1.1.2.4/inpu=
t0
> [   17.608746] input: Dell KB216 Wired Keyboard System Control as /device=
s/pci0000:00/0000:00:1c.0/0000:01:00.0/0000:02:02.0/0000:39:00.0/usb3/3-1/3=
-1.1/3-1.1.2/3-1.1.2.4/3-1.1.2.4:1.1/0003:413C:2113.0005/input/input35
> [   17.631928] r8152 4-1.1.3:1.0: firmware: direct-loading firmware rtl_n=
ic/rtl8153a-4.fw
> [   17.650325] r8152 4-1.1.3:1.0: load rtl8153a-4 v2 02/07/20 successfully
> [   17.666587] input: Dell KB216 Wired Keyboard Consumer Control as /devi=
ces/pci0000:00/0000:00:1c.0/0000:01:00.0/0000:02:02.0/0000:39:00.0/usb3/3-1=
/3-1.1/3-1.1.2/3-1.1.2.4/3-1.1.2.4:1.1/0003:413C:2113.0005/input/input36
> [   17.667078] hid-generic 0003:413C:2113.0005: input,hidraw4: USB HID v1=
=2E11 Device [Dell KB216 Wired Keyboard] on usb-0000:39:00.0-1.1.2.4/input1
> [   17.684397] r8152 4-1.1.3:1.0 eth0: v1.12.13
> [   17.684544] usbcore: registered new interface driver r8152
> [   17.759904] usbcore: registered new interface driver cdc_ether
> [   17.803743] usbcore: registered new interface driver r8153_ecm
> [   17.883661] r8152 4-1.1.3:1.0 enx00e04ceabc41: renamed from eth0
> [   18.202226] ucsi_acpi USBC000:00: ucsi_handle_connector_change: ACK fa=
iled (-110)
> [   19.029679] systemd-journald[420]: /var/log/journal/16ae67b9dca94ecebb=
c8ec78ab24e074/user-5272.journal: Journal file uses a different sequence nu=
mber ID, rotating.
> [   19.198180] usb 3-1.5: new high-speed USB device number 8 using xhci_h=
cd
> [   19.303611] usb 3-1.5: New USB device found, idVendor=3D2109, idProduc=
t=3D8817, bcdDevice=3D 0.01
> [   19.303631] usb 3-1.5: New USB device strings: Mfr=3D1, Product=3D2, S=
erialNumber=3D3
> [   19.303639] usb 3-1.5: Product: USB Billboard Device  =20
> [   19.303645] usb 3-1.5: Manufacturer: VIA Labs, Inc.        =20
> [   19.303651] usb 3-1.5: SerialNumber: 0000000000000001
> [   19.418159] rfkill: input handler enabled
> [   22.826968] r8152 4-1.1.3:1.0 enx00e04ceabc41: carrier on
> [   23.322032] ucsi_acpi USBC000:00: GET_CONNECTOR_STATUS failed (-110)
> [   24.213721] rfkill: input handler disabled
> [   29.978167] ucsi_acpi USBC000:00: ucsi_handle_connector_change: ACK fa=
iled (-110)
> [   51.007358] systemd-journald[420]: Time jumped backwards, rotating.
> [  190.561203] Non-volatile memory driver v1.3
> [  190.757190] st: Version 20160209, fixed bufsize 32768, s/g segs 256
> [  190.857151] warning: `hwinfo' uses wireless extensions which will stop=
 working for Wi-Fi 7 hardware; use nl80211
> [  257.387357] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
> [  257.387360] Bluetooth: BNEP filters: protocol multicast
> [  257.387364] Bluetooth: BNEP socket layer initialized
> [  257.389738] Bluetooth: MGMT ver 1.22
> [  257.398149] NET: Registered PF_ALG protocol family
> [  257.462607] Bluetooth: RFCOMM TTY layer initialized
> [  257.462615] Bluetooth: RFCOMM socket layer initialized
> [  257.462620] Bluetooth: RFCOMM ver 1.11
> [  419.088158] mmap: pool-spawner (4300): VmData 617984000 exceed data ul=
imit 612467986. Update limits or use boot option ignore_rlimit_data.
> [  419.099320] show_signal: 21 callbacks suppressed
> [  419.099324] traps: av:h264:df3[4322] trap int3 ip:7f1872e27587 sp:7f18=
2db1aa80 error:0 in libglib-2.0.so.0.7800.3[7f1872de3000+99000]
> [  419.343686] traps: av:h264:df3[4346] trap int3 ip:7fdb38e97587 sp:7fda=
ef7f4a80 error:0 in libglib-2.0.so.0.7800.3[7fdb38e53000+99000]
> [  423.473372] traps: multiqueue0:src[4483] trap int3 ip:7fa3779a9587 sp:=
7fa372041700 error:0 in libglib-2.0.so.0.7800.3[7fa377965000+99000]
> [  423.954465] traps: av:h264:df3[4539] trap int3 ip:7fcc77415587 sp:7fcc=
327efa80 error:0 in libglib-2.0.so.0.7800.3[7fcc773d1000+99000]
> [  702.980506] wlp58s0: deauthenticating from 88:71:b1:81:93:1b by local =
choice (Reason: 3=3DDEAUTH_LEAVING)
> [ 1593.115466] usb 3-1.1.2: USB disconnect, device number 4
> [ 1593.115485] usb 3-1.1.2.3: USB disconnect, device number 6
> [ 1593.132028] usb 4-1.1.2: USB disconnect, device number 5
> [ 1593.161374] usb 3-1.1.2.4: USB disconnect, device number 7
> [ 1622.132945] PM: suspend entry (deep)
> [ 1622.136673] Filesystems sync: 0.003 seconds
> [ 1622.136983] (NULL device *): firmware: direct-loading firmware regulat=
ory.db
> [ 1622.137080] (NULL device *): firmware: direct-loading firmware regulat=
ory.db.p7s
> [ 1622.137155] (NULL device *): firmware: direct-loading firmware qca/ram=
patch_usb_00000302.bin
> [ 1622.137177] (NULL device *): firmware: direct-loading firmware i915/kb=
l_dmc_ver1_04.bin
> [ 1622.137306] (NULL device *): firmware: direct-loading firmware qca/nvm=
_usb_00000302.bin
> [ 1622.141043] Freezing user space processes
> [ 1622.144171] Freezing user space processes completed (elapsed 0.003 sec=
onds)
> [ 1622.144175] OOM killer disabled.
> [ 1622.144176] Freezing remaining freezable tasks
> [ 1622.145525] Freezing remaining freezable tasks completed (elapsed 0.00=
1 seconds)
> [ 1622.145579] printk: Suspending console(s) (use no_console_suspend to d=
ebug)
> [ 1622.701719] ACPI: EC: interrupt blocked
> [ 1622.736972] ACPI: PM: Preparing to enter system sleep state S3
> [ 1622.742344] ACPI: EC: event blocked
> [ 1622.742346] ACPI: EC: EC stopped
> [ 1622.742347] ACPI: PM: Saving platform NVS memory
> [ 1622.744231] Disabling non-boot CPUs ...
> [ 1622.745751] smpboot: CPU 1 is now offline
> [ 1622.748530] smpboot: CPU 2 is now offline
> [ 1622.751872] smpboot: CPU 3 is now offline
> [ 1622.759988] ACPI: PM: Low-level resume complete
> [ 1622.760030] ACPI: EC: EC started
> [ 1622.760031] ACPI: PM: Restoring platform NVS memory
> [ 1622.762159] Enabling non-boot CPUs ...
> [ 1622.762186] smpboot: Booting Node 0 Processor 1 APIC 0x2
> [ 1622.762899] CPU1 is up
> [ 1622.762916] smpboot: Booting Node 0 Processor 2 APIC 0x1
> [ 1622.763646] CPU2 is up
> [ 1622.763662] smpboot: Booting Node 0 Processor 3 APIC 0x3
> [ 1622.764320] CPU3 is up
> [ 1622.767459] ACPI: PM: Waking up from system sleep state S3
> [ 1623.063270] ACPI: EC: interrupt unblocked
> [ 1623.063564] pcieport 0000:00:1c.0: Intel SPT PCH root port ACS workaro=
und enabled
> [ 1623.063574] pcieport 0000:00:1c.4: Intel SPT PCH root port ACS workaro=
und enabled
> [ 1623.063576] pcieport 0000:00:1d.0: Intel SPT PCH root port ACS workaro=
und enabled
> [ 1623.083451] DMAR: DRHD: handling fault status reg 2
> [ 1623.083459] DMAR: [INTR-REMAP] Request device [f0:1f.0] fault index 0x=
0 [fault reason 0x25] Blocked a compatibility format interrupt request
> [ 1623.085038] ACPI: EC: event unblocked
> [ 1623.174519] i915 0000:00:02.0: [drm] [ENCODER:94:DDI A/PHY A] is disab=
led/in DSI mode with an ungated DDI clock, gate it
> [ 1623.174530] i915 0000:00:02.0: [drm] [ENCODER:102:DDI B/PHY B] is disa=
bled/in DSI mode with an ungated DDI clock, gate it
> [ 1623.174536] i915 0000:00:02.0: [drm] [ENCODER:113:DDI C/PHY C] is disa=
bled/in DSI mode with an ungated DDI clock, gate it
> [ 1623.184059] nvme nvme0: 4/0/0 default/read/poll queues
> [ 1623.489896] usb 1-4: reset full-speed USB device number 3 using xhci_h=
cd
> [ 1623.769597] usb 1-5: reset high-speed USB device number 4 using xhci_h=
cd
> [ 1624.045730] usb 1-3: reset full-speed USB device number 2 using xhci_h=
cd
> [ 1624.208615] xhci_hcd 0000:39:00.0: xHC error in resume, USBSTS 0x411, =
Reinit
> [ 1624.208619] usb usb3: root hub lost power or was reset
> [ 1624.208621] usb usb4: root hub lost power or was reset
> [ 1624.505507] usb 3-1: reset high-speed USB device number 2 using xhci_h=
cd
> [ 1624.781709] usb 4-1: reset SuperSpeed USB device number 2 using xhci_h=
cd
> [ 1625.401481] usb 3-1.1: reset high-speed USB device number 3 using xhci=
_hcd
> [ 1625.629553] usb 3-1.5: reset high-speed USB device number 8 using xhci=
_hcd
> [ 1625.928112] usb 4-1.1: reset SuperSpeed USB device number 3 using xhci=
_hcd
> [ 1626.093639] usb 4-1.4: reset SuperSpeed USB device number 4 using xhci=
_hcd
> [ 1626.697671] r8152-cfgselector 4-1.1.3: reset SuperSpeed USB device num=
ber 6 using xhci_hcd
> [ 1626.717806] r8152-cfgselector 4-1.1.3: device firmware changed
> [ 1626.719798] OOM killer enabled.
> [ 1626.719800] Restarting tasks ...=20
> [ 1626.719923] pci_bus 0000:02: Allocating resources
> [ 1626.719967] pcieport 0000:02:01.0: bridge window [io  0x1000-0x0fff] t=
o [bus 04-38] add_size 1000
> [ 1626.719973] pcieport 0000:02:02.0: bridge window [io  0x1000-0x0fff] t=
o [bus 39] add_size 1000
> [ 1626.719977] pcieport 0000:02:02.0: bridge window [mem 0x00100000-0x000=
fffff 64bit pref] to [bus 39] add_size 200000 add_align 100000
> [ 1626.719983] pcieport 0000:01:00.0: bridge window [io  0x1000-0x0fff] t=
o [bus 02-39] add_size 2000
> [ 1626.719995] pcieport 0000:01:00.0: BAR 13: no space for [io  size 0x20=
00]
> [ 1626.719999] pcieport 0000:01:00.0: BAR 13: failed to assign [io  size =
0x2000]
> [ 1626.720002] pcieport 0000:01:00.0: BAR 13: no space for [io  size 0x20=
00]
> [ 1626.720005] pcieport 0000:01:00.0: BAR 13: failed to assign [io  size =
0x2000]
> [ 1626.720018] pcieport 0000:02:02.0: BAR 15: no space for [mem size 0x00=
200000 64bit pref]
> [ 1626.720021] pcieport 0000:02:02.0: BAR 15: failed to assign [mem size =
0x00200000 64bit pref]
> [ 1626.720024] pcieport 0000:02:01.0: BAR 13: no space for [io  size 0x10=
00]
> [ 1626.720026] pcieport 0000:02:01.0: BAR 13: failed to assign [io  size =
0x1000]
> [ 1626.720029] pcieport 0000:02:02.0: BAR 13: no space for [io  size 0x10=
00]
> [ 1626.720031] pcieport 0000:02:02.0: BAR 13: failed to assign [io  size =
0x1000]
> [ 1626.720042] pcieport 0000:02:02.0: BAR 15: no space for [mem size 0x00=
200000 64bit pref]
> [ 1626.720044] pcieport 0000:02:02.0: BAR 15: failed to assign [mem size =
0x00200000 64bit pref]
> [ 1626.720047] pcieport 0000:02:02.0: BAR 13: no space for [io  size 0x10=
00]
> [ 1626.720050] pcieport 0000:02:02.0: BAR 13: failed to assign [io  size =
0x1000]
> [ 1626.720052] pcieport 0000:02:01.0: BAR 13: no space for [io  size 0x10=
00]
> [ 1626.720055] pcieport 0000:02:01.0: BAR 13: failed to assign [io  size =
0x1000]
> [ 1626.723214] pci_bus 0000:02: Allocating resources
> [ 1626.723299] pcieport 0000:02:01.0: bridge window [io  0x1000-0x0fff] t=
o [bus 04-38] add_size 1000
> [ 1626.723365] pcieport 0000:02:02.0: bridge window [io  0x1000-0x0fff] t=
o [bus 39] add_size 1000
> [ 1626.723369] pcieport 0000:02:02.0: bridge window [mem 0x00100000-0x000=
fffff 64bit pref] to [bus 39] add_size 200000 add_align 100000
> [ 1626.723375] pcieport 0000:01:00.0: bridge window [io  0x1000-0x0fff] t=
o [bus 02-39] add_size 2000
> [ 1626.723387] pcieport 0000:01:00.0: BAR 13: no space for [io  size 0x20=
00]
> [ 1626.723392] pcieport 0000:01:00.0: BAR 13: failed to assign [io  size =
0x2000]
> [ 1626.723407] pcieport 0000:01:00.0: BAR 13: no space for [io  size 0x20=
00]
> [ 1626.723410] pcieport 0000:01:00.0: BAR 13: failed to assign [io  size =
0x2000]
> [ 1626.723417] pcieport 0000:02:02.0: BAR 15: no space for [mem size 0x00=
200000 64bit pref]
> [ 1626.723421] pcieport 0000:02:02.0: BAR 15: failed to assign [mem size =
0x00200000 64bit pref]
> [ 1626.723436] pcieport 0000:02:01.0: BAR 13: no space for [io  size 0x10=
00]
> [ 1626.723439] pcieport 0000:02:01.0: BAR 13: failed to assign [io  size =
0x1000]
> [ 1626.723442] pcieport 0000:02:02.0: BAR 13: no space for [io  size 0x10=
00]
> [ 1626.723444] pcieport 0000:02:02.0: BAR 13: failed to assign [io  size =
0x1000]
> [ 1626.723449] pcieport 0000:02:02.0: BAR 15: no space for [mem size 0x00=
200000 64bit pref]
> [ 1626.723458] pcieport 0000:02:02.0: BAR 15: failed to assign [mem size =
0x00200000 64bit pref]
> [ 1626.723461] pcieport 0000:02:02.0: BAR 13: no space for [io  size 0x10=
00]
> [ 1626.723464] pcieport 0000:02:02.0: BAR 13: failed to assign [io  size =
0x1000]
> [ 1626.723466] pcieport 0000:02:01.0: BAR 13: no space for [io  size 0x10=
00]
> [ 1626.723469] pcieport 0000:02:01.0: BAR 13: failed to assign [io  size =
0x1000]
> [ 1626.727493] done.
> [ 1626.727519] random: crng reseeded on system resumption
> [ 1626.797423] usb 3-1.1.2: new high-speed USB device number 9 using xhci=
_hcd
> [ 1626.808741] PM: suspend exit
> [ 1626.887994] Process accounting resumed
> [ 1626.917835] usb 3-1.1.2: New USB device found, idVendor=3D0bda, idProd=
uct=3D5409, bcdDevice=3D 1.41
> [ 1626.917849] usb 3-1.1.2: New USB device strings: Mfr=3D1, Product=3D2,=
 SerialNumber=3D0
> [ 1626.917851] usb 3-1.1.2: Product: 4-Port USB 2.0 Hub
> [ 1626.917853] usb 3-1.1.2: Manufacturer: Generic
> [ 1626.919839] hub 3-1.1.2:1.0: USB hub found
> [ 1626.921510] hub 3-1.1.2:1.0: 4 ports detected
> [ 1626.925798] mei_hdcp 0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1c54b627f04=
: bound 0000:00:02.0 (ops i915_hdcp_ops [i915])
> [ 1626.987726] usb 4-1.1.2: new SuperSpeed USB device number 7 using xhci=
_hcd
> [ 1627.021280] usb 4-1.1.2: New USB device found, idVendor=3D0bda, idProd=
uct=3D0409, bcdDevice=3D 1.41
> [ 1627.021287] usb 4-1.1.2: New USB device strings: Mfr=3D1, Product=3D2,=
 SerialNumber=3D0
> [ 1627.021289] usb 4-1.1.2: Product: 4-Port USB 3.0 Hub
> [ 1627.021291] usb 4-1.1.2: Manufacturer: Generic
> [ 1627.026938] hub 4-1.1.2:1.0: USB hub found
> [ 1627.029452] hub 4-1.1.2:1.0: 2 ports detected
> [ 1627.033134] r8152-cfgselector 4-1.1.3: USB disconnect, device number 6
> [ 1627.049621] Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection=
 command is advertised, but not supported.
> [ 1627.220433] Bluetooth: MGMT ver 1.22
> [ 1627.969762] usb 4-1.4: reset SuperSpeed USB device number 4 using xhci=
_hcd
> [ 1628.317452] usb 4-1.1.3: new SuperSpeed USB device number 8 using xhci=
_hcd
> [ 1628.337969] usb 4-1.1.3: New USB device found, idVendor=3D0bda, idProd=
uct=3D8153, bcdDevice=3D30.00
> [ 1628.337975] usb 4-1.1.3: New USB device strings: Mfr=3D1, Product=3D2,=
 SerialNumber=3D6
> [ 1628.337977] usb 4-1.1.3: Product: USB 10/100/1000 LAN
> [ 1628.337978] usb 4-1.1.3: Manufacturer: Realtek
> [ 1628.337980] usb 4-1.1.3: SerialNumber: 000001
> [ 1628.417407] usb 3-1.1.2.3: new low-speed USB device number 10 using xh=
ci_hcd
> [ 1628.521984] usb 3-1.1.2.3: New USB device found, idVendor=3D1bcf, idPr=
oduct=3D0005, bcdDevice=3D 0.14
> [ 1628.521990] usb 3-1.1.2.3: New USB device strings: Mfr=3D0, Product=3D=
2, SerialNumber=3D0
> [ 1628.521992] usb 3-1.1.2.3: Product: USB Optical Mouse
> [ 1628.530824] input: USB Optical Mouse as /devices/pci0000:00/0000:00:1c=
=2E0/0000:01:00.0/0000:02:02.0/0000:39:00.0/usb3/3-1/3-1.1/3-1.1.2/3-1.1.2.=
3/3-1.1.2.3:1.0/0003:1BCF:0005.0006/input/input38
> [ 1628.530975] hid-generic 0003:1BCF:0005.0006: input,hidraw2: USB HID v1=
=2E10 Mouse [USB Optical Mouse] on usb-0000:39:00.0-1.1.2.3/input0
> [ 1628.597723] r8152-cfgselector 4-1.1.3: reset SuperSpeed USB device num=
ber 8 using xhci_hcd
> [ 1628.639680] r8152 4-1.1.3:1.0: load rtl8153a-4 v2 02/07/20 successfully
> [ 1628.667227] r8152 4-1.1.3:1.0 eth0: v1.12.13
> [ 1628.697434] usb 3-1.1.2.4: new low-speed USB device number 11 using xh=
ci_hcd
> [ 1628.753497] r8152 4-1.1.3:1.0 enx00e04ceabc41: renamed from eth0
> [ 1628.804240] usb 3-1.1.2.4: New USB device found, idVendor=3D413c, idPr=
oduct=3D2113, bcdDevice=3D 1.08
> [ 1628.804248] usb 3-1.1.2.4: New USB device strings: Mfr=3D0, Product=3D=
2, SerialNumber=3D0
> [ 1628.804257] usb 3-1.1.2.4: Product: Dell KB216 Wired Keyboard
> [ 1628.815085] input: Dell KB216 Wired Keyboard as /devices/pci0000:00/00=
00:00:1c.0/0000:01:00.0/0000:02:02.0/0000:39:00.0/usb3/3-1/3-1.1/3-1.1.2/3-=
1.1.2.4/3-1.1.2.4:1.0/0003:413C:2113.0007/input/input39
> [ 1628.873823] hid-generic 0003:413C:2113.0007: input,hidraw3: USB HID v1=
=2E11 Keyboard [Dell KB216 Wired Keyboard] on usb-0000:39:00.0-1.1.2.4/inpu=
t0
> [ 1628.878114] input: Dell KB216 Wired Keyboard System Control as /device=
s/pci0000:00/0000:00:1c.0/0000:01:00.0/0000:02:02.0/0000:39:00.0/usb3/3-1/3=
-1.1/3-1.1.2/3-1.1.2.4/3-1.1.2.4:1.1/0003:413C:2113.0008/input/input40
> [ 1628.937554] input: Dell KB216 Wired Keyboard Consumer Control as /devi=
ces/pci0000:00/0000:00:1c.0/0000:01:00.0/0000:02:02.0/0000:39:00.0/usb3/3-1=
/3-1.1/3-1.1.2/3-1.1.2.4/3-1.1.2.4:1.1/0003:413C:2113.0008/input/input41
> [ 1628.937717] hid-generic 0003:413C:2113.0008: input,hidraw4: USB HID v1=
=2E11 Device [Dell KB216 Wired Keyboard] on usb-0000:39:00.0-1.1.2.4/input1
> [ 1631.571891] r8152 4-1.1.3:1.0 enx00e04ceabc41: carrier on
> [ 1659.283014] usb 3-1.1.2: USB disconnect, device number 9
> [ 1659.283025] usb 3-1.1.2.3: USB disconnect, device number 10
> [ 1659.315006] usb 4-1.1.2: USB disconnect, device number 7
> [ 1659.329772] usb 3-1.1.2.4: USB disconnect, device number 11
> [ 1660.405851] usb 4-1.1.2: new SuperSpeed USB device number 9 using xhci=
_hcd
> [ 1660.441876] usb 4-1.1.2: New USB device found, idVendor=3D0bda, idProd=
uct=3D0409, bcdDevice=3D 1.41
> [ 1660.441881] usb 4-1.1.2: New USB device strings: Mfr=3D1, Product=3D2,=
 SerialNumber=3D0
> [ 1660.441883] usb 4-1.1.2: Product: 4-Port USB 3.0 Hub
> [ 1660.441885] usb 4-1.1.2: Manufacturer: Generic
> [ 1660.446894] hub 4-1.1.2:1.0: USB hub found
> [ 1660.448204] hub 4-1.1.2:1.0: 2 ports detected
> [ 1662.069472] usb 3-1.1.2: new high-speed USB device number 12 using xhc=
i_hcd
> [ 1662.183261] usb 3-1.1.2: New USB device found, idVendor=3D0bda, idProd=
uct=3D5409, bcdDevice=3D 1.41
> [ 1662.183267] usb 3-1.1.2: New USB device strings: Mfr=3D1, Product=3D2,=
 SerialNumber=3D0
> [ 1662.183269] usb 3-1.1.2: Product: 4-Port USB 2.0 Hub
> [ 1662.183270] usb 3-1.1.2: Manufacturer: Generic
> [ 1662.184996] hub 3-1.1.2:1.0: USB hub found
> [ 1662.186851] hub 3-1.1.2:1.0: 4 ports detected
> [ 1662.477768] usb 3-1.1.2.3: new low-speed USB device number 13 using xh=
ci_hcd
> [ 1662.581939] usb 3-1.1.2.3: New USB device found, idVendor=3D1bcf, idPr=
oduct=3D0005, bcdDevice=3D 0.14
> [ 1662.581946] usb 3-1.1.2.3: New USB device strings: Mfr=3D0, Product=3D=
2, SerialNumber=3D0
> [ 1662.581949] usb 3-1.1.2.3: Product: USB Optical Mouse
> [ 1662.591205] input: USB Optical Mouse as /devices/pci0000:00/0000:00:1c=
=2E0/0000:01:00.0/0000:02:02.0/0000:39:00.0/usb3/3-1/3-1.1/3-1.1.2/3-1.1.2.=
3/3-1.1.2.3:1.0/0003:1BCF:0005.0009/input/input42
> [ 1662.591332] hid-generic 0003:1BCF:0005.0009: input,hidraw2: USB HID v1=
=2E10 Mouse [USB Optical Mouse] on usb-0000:39:00.0-1.1.2.3/input0
> [ 1662.669459] usb 3-1.1.2.4: new low-speed USB device number 14 using xh=
ci_hcd
> [ 1662.776140] usb 3-1.1.2.4: New USB device found, idVendor=3D413c, idPr=
oduct=3D2113, bcdDevice=3D 1.08
> [ 1662.776147] usb 3-1.1.2.4: New USB device strings: Mfr=3D0, Product=3D=
2, SerialNumber=3D0
> [ 1662.776149] usb 3-1.1.2.4: Product: Dell KB216 Wired Keyboard
> [ 1662.785920] input: Dell KB216 Wired Keyboard as /devices/pci0000:00/00=
00:00:1c.0/0000:01:00.0/0000:02:02.0/0000:39:00.0/usb3/3-1/3-1.1/3-1.1.2/3-=
1.1.2.4/3-1.1.2.4:1.0/0003:413C:2113.000A/input/input43
> [ 1662.845499] hid-generic 0003:413C:2113.000A: input,hidraw3: USB HID v1=
=2E11 Keyboard [Dell KB216 Wired Keyboard] on usb-0000:39:00.0-1.1.2.4/inpu=
t0
> [ 1662.850063] input: Dell KB216 Wired Keyboard System Control as /device=
s/pci0000:00/0000:00:1c.0/0000:01:00.0/0000:02:02.0/0000:39:00.0/usb3/3-1/3=
-1.1/3-1.1.2/3-1.1.2.4/3-1.1.2.4:1.1/0003:413C:2113.000B/input/input44
> [ 1662.909389] input: Dell KB216 Wired Keyboard Consumer Control as /devi=
ces/pci0000:00/0000:00:1c.0/0000:01:00.0/0000:02:02.0/0000:39:00.0/usb3/3-1=
/3-1.1/3-1.1.2/3-1.1.2.4/3-1.1.2.4:1.1/0003:413C:2113.000B/input/input45
> [ 1662.909529] hid-generic 0003:413C:2113.000B: input,hidraw4: USB HID v1=
=2E11 Device [Dell KB216 Wired Keyboard] on usb-0000:39:00.0-1.1.2.4/input1
> [ 1669.503529] usb 3-1: USB disconnect, device number 2
> [ 1669.503535] usb 3-1.1: USB disconnect, device number 3
> [ 1669.503536] usb 3-1.1.2: USB disconnect, device number 12
> [ 1669.503538] usb 3-1.1.2.3: USB disconnect, device number 13
> [ 1669.559200] xhci_hcd 0000:39:00.0: xHCI host controller not responding=
, assume dead
> [ 1669.559230] xhci_hcd 0000:39:00.0: HC died; cleaning up
> [ 1669.559273] r8152 4-1.1.3:1.0 enx00e04ceabc41: Stop submitting intr, s=
tatus -108
> [ 1669.601958] usb 3-1.1.2.4: USB disconnect, device number 14
> [ 1669.614389] xhci_hcd 0000:39:00.0: remove, state 1
> [ 1669.614398] usb usb4: USB disconnect, device number 1
> [ 1669.673325] usb 4-1: USB disconnect, device number 2
> [ 1669.673332] usb 4-1.1: USB disconnect, device number 3
> [ 1669.673334] usb 4-1.1.2: USB disconnect, device number 9
> [ 1669.674006] r8152-cfgselector 4-1.1.3: USB disconnect, device number 8
> [ 1669.734097] usb 4-1.4: USB disconnect, device number 4
> [ 1669.837571] usb 3-1.5: USB disconnect, device number 8
> [ 1669.889604] xhci_hcd 0000:39:00.0: USB bus 4 deregistered
> [ 1669.889624] xhci_hcd 0000:39:00.0: remove, state 1
> [ 1669.889628] usb usb3: USB disconnect, device number 1
> [ 1669.891880] xhci_hcd 0000:39:00.0: Host halt failed, -19
> [ 1669.891886] xhci_hcd 0000:39:00.0: Host not accessible, reset failed.
> [ 1669.892163] xhci_hcd 0000:39:00.0: USB bus 3 deregistered
> [ 1669.903928] pci_bus 0000:02: Allocating resources
> [ 1669.903943] pcieport 0000:02:01.0: bridge window [io  0x1000-0x0fff] t=
o [bus 04-38] add_size 1000
> [ 1669.903947] pcieport 0000:02:02.0: bridge window [io  0x1000-0x0fff] t=
o [bus 39] add_size 1000
> [ 1669.903949] pcieport 0000:02:02.0: bridge window [mem 0x00100000-0x000=
fffff 64bit pref] to [bus 39] add_size 200000 add_align 100000
> [ 1669.903952] pcieport 0000:01:00.0: bridge window [io  0x1000-0x0fff] t=
o [bus 02-39] add_size 2000
> [ 1669.903955] pcieport 0000:01:00.0: BAR 13: no space for [io  size 0x20=
00]
> [ 1669.903957] pcieport 0000:01:00.0: BAR 13: failed to assign [io  size =
0x2000]
> [ 1669.903959] pcieport 0000:01:00.0: BAR 13: no space for [io  size 0x20=
00]
> [ 1669.903961] pcieport 0000:01:00.0: BAR 13: failed to assign [io  size =
0x2000]
> [ 1669.903964] pcieport 0000:02:02.0: BAR 15: no space for [mem size 0x00=
200000 64bit pref]
> [ 1669.903966] pcieport 0000:02:02.0: BAR 15: failed to assign [mem size =
0x00200000 64bit pref]
> [ 1669.903967] pcieport 0000:02:01.0: BAR 13: no space for [io  size 0x10=
00]
> [ 1669.903968] pcieport 0000:02:01.0: BAR 13: failed to assign [io  size =
0x1000]
> [ 1669.903970] pcieport 0000:02:02.0: BAR 13: no space for [io  size 0x10=
00]
> [ 1669.903971] pcieport 0000:02:02.0: BAR 13: failed to assign [io  size =
0x1000]
> [ 1669.903973] pcieport 0000:02:02.0: BAR 15: no space for [mem size 0x00=
200000 64bit pref]
> [ 1669.903974] pcieport 0000:02:02.0: BAR 15: failed to assign [mem size =
0x00200000 64bit pref]
> [ 1669.903976] pcieport 0000:02:02.0: BAR 13: no space for [io  size 0x10=
00]
> [ 1669.903977] pcieport 0000:02:02.0: BAR 13: failed to assign [io  size =
0x1000]
> [ 1669.903978] pcieport 0000:02:01.0: BAR 13: no space for [io  size 0x10=
00]
> [ 1669.903980] pcieport 0000:02:01.0: BAR 13: failed to assign [io  size =
0x1000]
> [ 1675.033217] ucsi_acpi USBC000:00: ucsi_handle_connector_change: ACK fa=
iled (-110)
> [ 1675.686871] pci 0000:39:00.0: [8086:15b5] type 00 class 0x0c0330
> [ 1675.686920] pci 0000:39:00.0: reg 0x10: [mem 0xd9f00000-0xd9f0ffff]
> [ 1675.687034] pci 0000:39:00.0: enabling Extended Tags
> [ 1675.687277] pci 0000:39:00.0: supports D1 D2
> [ 1675.687281] pci 0000:39:00.0: PME# supported from D0 D1 D2 D3hot D3cold
> [ 1675.687453] pci 0000:39:00.0: 8.000 Gb/s available PCIe bandwidth, lim=
ited by 2.5 GT/s PCIe x4 link at 0000:02:02.0 (capable of 31.504 Gb/s with =
8.0 GT/s PCIe x4 link)
> [ 1675.687978] pci 0000:39:00.0: Adding to iommu group 19
> [ 1675.688139] pcieport 0000:02:02.0: ASPM: current common clock configur=
ation is inconsistent, reconfiguring
> [ 1675.688242] pci_bus 0000:02: Allocating resources
> [ 1675.688289] pcieport 0000:02:01.0: bridge window [io  0x1000-0x0fff] t=
o [bus 04-38] add_size 1000
> [ 1675.688297] pcieport 0000:02:02.0: bridge window [io  0x1000-0x0fff] t=
o [bus 39] add_size 1000
> [ 1675.688299] pcieport 0000:02:02.0: bridge window [mem 0x00100000-0x000=
fffff 64bit pref] to [bus 39] add_size 200000 add_align 100000
> [ 1675.688302] pcieport 0000:01:00.0: bridge window [io  0x1000-0x0fff] t=
o [bus 02-39] add_size 2000
> [ 1675.688317] pcieport 0000:01:00.0: BAR 13: no space for [io  size 0x20=
00]
> [ 1675.688320] pcieport 0000:01:00.0: BAR 13: failed to assign [io  size =
0x2000]
> [ 1675.688322] pcieport 0000:01:00.0: BAR 13: no space for [io  size 0x20=
00]
> [ 1675.688324] pcieport 0000:01:00.0: BAR 13: failed to assign [io  size =
0x2000]
> [ 1675.688328] pcieport 0000:02:02.0: BAR 15: no space for [mem size 0x00=
200000 64bit pref]
> [ 1675.688338] pcieport 0000:02:02.0: BAR 15: failed to assign [mem size =
0x00200000 64bit pref]
> [ 1675.688341] pcieport 0000:02:01.0: BAR 13: no space for [io  size 0x10=
00]
> [ 1675.688343] pcieport 0000:02:01.0: BAR 13: failed to assign [io  size =
0x1000]
> [ 1675.688347] pcieport 0000:02:02.0: BAR 13: no space for [io  size 0x10=
00]
> [ 1675.688349] pcieport 0000:02:02.0: BAR 13: failed to assign [io  size =
0x1000]
> [ 1675.688362] pcieport 0000:02:02.0: BAR 15: no space for [mem size 0x00=
200000 64bit pref]
> [ 1675.688364] pcieport 0000:02:02.0: BAR 15: failed to assign [mem size =
0x00200000 64bit pref]
> [ 1675.688367] pcieport 0000:02:02.0: BAR 13: no space for [io  size 0x10=
00]
> [ 1675.688369] pcieport 0000:02:02.0: BAR 13: failed to assign [io  size =
0x1000]
> [ 1675.688371] pcieport 0000:02:01.0: BAR 13: no space for [io  size 0x10=
00]
> [ 1675.688374] pcieport 0000:02:01.0: BAR 13: failed to assign [io  size =
0x1000]
> [ 1675.689621] xhci_hcd 0000:39:00.0: xHCI Host Controller
> [ 1675.689651] xhci_hcd 0000:39:00.0: new USB bus registered, assigned bu=
s number 3
> [ 1675.692890] xhci_hcd 0000:39:00.0: hcc params 0x200077c1 hci version 0=
x110 quirks 0x0000000200009810
> [ 1675.694701] xhci_hcd 0000:39:00.0: xHCI Host Controller
> [ 1675.694726] xhci_hcd 0000:39:00.0: new USB bus registered, assigned bu=
s number 4
> [ 1675.694743] xhci_hcd 0000:39:00.0: Host supports USB 3.1 Enhanced Supe=
rSpeed
> [ 1675.694845] usb usb3: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.06
> [ 1675.694850] usb usb3: New USB device strings: Mfr=3D3, Product=3D2, Se=
rialNumber=3D1
> [ 1675.694852] usb usb3: Product: xHCI Host Controller
> [ 1675.694860] usb usb3: Manufacturer: Linux 6.6.15-amd64 xhci-hcd
> [ 1675.694862] usb usb3: SerialNumber: 0000:39:00.0
> [ 1675.700199] hub 3-0:1.0: USB hub found
> [ 1675.700221] hub 3-0:1.0: 2 ports detected
> [ 1675.700993] usb usb4: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.06
> [ 1675.700997] usb usb4: New USB device strings: Mfr=3D3, Product=3D2, Se=
rialNumber=3D1
> [ 1675.701000] usb usb4: Product: xHCI Host Controller
> [ 1675.701002] usb usb4: Manufacturer: Linux 6.6.15-amd64 xhci-hcd
> [ 1675.701004] usb usb4: SerialNumber: 0000:39:00.0
> [ 1675.701368] hub 4-0:1.0: USB hub found
> [ 1675.701382] hub 4-0:1.0: 2 ports detected
> [ 1675.957287] usb 3-1: new high-speed USB device number 2 using xhci_hcd
> [ 1676.107544] usb 3-1: New USB device found, idVendor=3D2109, idProduct=
=3D2817, bcdDevice=3D 5.e3
> [ 1676.107563] usb 3-1: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D3
> [ 1676.107566] usb 3-1: Product: USB2.0 Hub            =20
> [ 1676.107568] usb 3-1: Manufacturer: VIA Labs, Inc.        =20
> [ 1676.107570] usb 3-1: SerialNumber: 000000000
> [ 1676.109404] hub 3-1:1.0: USB hub found
> [ 1676.113247] hub 3-1:1.0: 5 ports detected
> [ 1676.239302] usb 4-1: new SuperSpeed USB device number 2 using xhci_hcd
> [ 1676.290133] usb 4-1: New USB device found, idVendor=3D2109, idProduct=
=3D0817, bcdDevice=3D 5.e3
> [ 1676.290140] usb 4-1: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D3
> [ 1676.290143] usb 4-1: Product: USB3.0 Hub            =20
> [ 1676.290145] usb 4-1: Manufacturer: VIA Labs, Inc.        =20
> [ 1676.290147] usb 4-1: SerialNumber: 000000000
> [ 1676.291934] hub 4-1:1.0: USB hub found
> [ 1676.292196] hub 4-1:1.0: 4 ports detected
> [ 1676.482591] Registered IR keymap rc-cec
> [ 1676.482670] rc rc0: DP-1 as /devices/pci0000:00/0000:00:02.0/rc/rc0
> [ 1676.482720] input: DP-1 as /devices/pci0000:00/0000:00:02.0/rc/rc0/inp=
ut46
> [ 1676.841207] usb 3-1.1: new high-speed USB device number 3 using xhci_h=
cd
> [ 1676.999760] usb 3-1.1: New USB device found, idVendor=3D2109, idProduc=
t=3D2817, bcdDevice=3D 7.b4
> [ 1676.999766] usb 3-1.1: New USB device strings: Mfr=3D1, Product=3D2, S=
erialNumber=3D3
> [ 1676.999768] usb 3-1.1: Product: USB2.0 Hub            =20
> [ 1676.999769] usb 3-1.1: Manufacturer: VIA Labs, Inc.        =20
> [ 1676.999770] usb 3-1.1: SerialNumber: 000000000
> [ 1677.001355] hub 3-1.1:1.0: USB hub found
> [ 1677.001511] hub 3-1.1:1.0: 4 ports detected
> [ 1677.381277] usb 4-1.1: new SuperSpeed USB device number 3 using xhci_h=
cd
> [ 1677.468758] usb 4-1.1: New USB device found, idVendor=3D2109, idProduc=
t=3D0817, bcdDevice=3D 7.b4
> [ 1677.468774] usb 4-1.1: New USB device strings: Mfr=3D1, Product=3D2, S=
erialNumber=3D3
> [ 1677.468778] usb 4-1.1: Product: USB3.0 Hub            =20
> [ 1677.468780] usb 4-1.1: Manufacturer: VIA Labs, Inc.        =20
> [ 1677.468782] usb 4-1.1: SerialNumber: 000000000
> [ 1677.471158] hub 4-1.1:1.0: USB hub found
> [ 1677.471440] hub 4-1.1:1.0: 4 ports detected
> [ 1677.661349] usb 4-1.4: new SuperSpeed USB device number 4 using xhci_h=
cd
> [ 1677.683192] usb 4-1.4: New USB device found, idVendor=3D058f, idProduc=
t=3D8468, bcdDevice=3D 1.00
> [ 1677.683205] usb 4-1.4: New USB device strings: Mfr=3D1, Product=3D2, S=
erialNumber=3D3
> [ 1677.683207] usb 4-1.4: Product: Mass Storage Device
> [ 1677.683210] usb 4-1.4: Manufacturer: Generic
> [ 1677.683212] usb 4-1.4: SerialNumber: 058F84688461
> [ 1677.685721] usb-storage 4-1.4:1.0: USB Mass Storage device detected
> [ 1677.689758] scsi host0: usb-storage 4-1.4:1.0
> [ 1678.005208] usb 3-1.1.2: new high-speed USB device number 4 using xhci=
_hcd
> [ 1678.127246] usb 3-1.1.2: New USB device found, idVendor=3D0bda, idProd=
uct=3D5409, bcdDevice=3D 1.41
> [ 1678.127253] usb 3-1.1.2: New USB device strings: Mfr=3D1, Product=3D2,=
 SerialNumber=3D0
> [ 1678.127256] usb 3-1.1.2: Product: 4-Port USB 2.0 Hub
> [ 1678.127258] usb 3-1.1.2: Manufacturer: Generic
> [ 1678.128922] hub 3-1.1.2:1.0: USB hub found
> [ 1678.129940] hub 3-1.1.2:1.0: 4 ports detected
> [ 1678.201198] usb 4-1.1.2: new SuperSpeed USB device number 5 using xhci=
_hcd
> [ 1678.237278] usb 4-1.1.2: New USB device found, idVendor=3D0bda, idProd=
uct=3D0409, bcdDevice=3D 1.41
> [ 1678.237291] usb 4-1.1.2: New USB device strings: Mfr=3D1, Product=3D2,=
 SerialNumber=3D0
> [ 1678.237293] usb 4-1.1.2: Product: 4-Port USB 3.0 Hub
> [ 1678.237295] usb 4-1.1.2: Manufacturer: Generic
> [ 1678.243870] hub 4-1.1.2:1.0: USB hub found
> [ 1678.245271] hub 4-1.1.2:1.0: 2 ports detected
> [ 1679.001195] usb 3-1.1.2.3: new low-speed USB device number 6 using xhc=
i_hcd
> [ 1679.111385] usb 3-1.1.2.3: New USB device found, idVendor=3D1bcf, idPr=
oduct=3D0005, bcdDevice=3D 0.14
> [ 1679.111395] usb 3-1.1.2.3: New USB device strings: Mfr=3D0, Product=3D=
2, SerialNumber=3D0
> [ 1679.111398] usb 3-1.1.2.3: Product: USB Optical Mouse
> [ 1679.127141] input: USB Optical Mouse as /devices/pci0000:00/0000:00:1c=
=2E0/0000:01:00.0/0000:02:02.0/0000:39:00.0/usb3/3-1/3-1.1/3-1.1.2/3-1.1.2.=
3/3-1.1.2.3:1.0/0003:1BCF:0005.000C/input/input47
> [ 1679.127643] hid-generic 0003:1BCF:0005.000C: input,hidraw2: USB HID v1=
=2E10 Mouse [USB Optical Mouse] on usb-0000:39:00.0-1.1.2.3/input0
> [ 1679.189442] usb 4-1.1.3: new SuperSpeed USB device number 6 using xhci=
_hcd
> [ 1679.210118] usb 4-1.1.3: New USB device found, idVendor=3D0bda, idProd=
uct=3D8153, bcdDevice=3D30.00
> [ 1679.210127] usb 4-1.1.3: New USB device strings: Mfr=3D1, Product=3D2,=
 SerialNumber=3D6
> [ 1679.210130] usb 4-1.1.3: Product: USB 10/100/1000 LAN
> [ 1679.210132] usb 4-1.1.3: Manufacturer: Realtek
> [ 1679.210134] usb 4-1.1.3: SerialNumber: 000001
> [ 1679.549527] usb 4-1.4: reset SuperSpeed USB device number 4 using xhci=
_hcd
> [ 1679.589880] scsi 0:0:0:0: Direct-Access     Generic- SD/MMC           =
1.00 PQ: 0 ANSI: 6
> [ 1679.590164] scsi 0:0:0:0: Attached scsi generic sg0 type 0
> [ 1679.591508] sd 0:0:0:0: [sda] Media removed, stopped polling
> [ 1679.591826] sd 0:0:0:0: [sda] Attached SCSI removable disk
> [ 1679.653191] usb 3-1.1.2.4: new low-speed USB device number 7 using xhc=
i_hcd
> [ 1679.764948] usb 3-1.1.2.4: New USB device found, idVendor=3D413c, idPr=
oduct=3D2113, bcdDevice=3D 1.08
> [ 1679.764956] usb 3-1.1.2.4: New USB device strings: Mfr=3D0, Product=3D=
2, SerialNumber=3D0
> [ 1679.764958] usb 3-1.1.2.4: Product: Dell KB216 Wired Keyboard
> [ 1679.775964] input: Dell KB216 Wired Keyboard as /devices/pci0000:00/00=
00:00:1c.0/0000:01:00.0/0000:02:02.0/0000:39:00.0/usb3/3-1/3-1.1/3-1.1.2/3-=
1.1.2.4/3-1.1.2.4:1.0/0003:413C:2113.000D/input/input48
> [ 1679.837982] hid-generic 0003:413C:2113.000D: input,hidraw3: USB HID v1=
=2E11 Keyboard [Dell KB216 Wired Keyboard] on usb-0000:39:00.0-1.1.2.4/inpu=
t0
> [ 1679.838426] r8152-cfgselector 4-1.1.3: reset SuperSpeed USB device num=
ber 6 using xhci_hcd
> [ 1679.842777] input: Dell KB216 Wired Keyboard System Control as /device=
s/pci0000:00/0000:00:1c.0/0000:01:00.0/0000:02:02.0/0000:39:00.0/usb3/3-1/3=
-1.1/3-1.1.2/3-1.1.2.4/3-1.1.2.4:1.1/0003:413C:2113.000E/input/input49
> [ 1679.869371] r8152 4-1.1.3:1.0: firmware: direct-loading firmware rtl_n=
ic/rtl8153a-4.fw
> [ 1679.889436] r8152 4-1.1.3:1.0: load rtl8153a-4 v2 02/07/20 successfully
> [ 1679.904052] input: Dell KB216 Wired Keyboard Consumer Control as /devi=
ces/pci0000:00/0000:00:1c.0/0000:01:00.0/0000:02:02.0/0000:39:00.0/usb3/3-1=
/3-1.1/3-1.1.2/3-1.1.2.4/3-1.1.2.4:1.1/0003:413C:2113.000E/input/input50
> [ 1679.904164] hid-generic 0003:413C:2113.000E: input,hidraw4: USB HID v1=
=2E11 Device [Dell KB216 Wired Keyboard] on usb-0000:39:00.0-1.1.2.4/input1
> [ 1679.917758] r8152 4-1.1.3:1.0 eth0: v1.12.13
> [ 1680.072727] r8152 4-1.1.3:1.0 enx00e04ceabc41: renamed from eth0
> [ 1680.785574] pci_bus 0000:02: Allocating resources
> [ 1680.785597] pcieport 0000:02:01.0: bridge window [io  0x1000-0x0fff] t=
o [bus 04-38] add_size 1000
> [ 1680.785602] pcieport 0000:02:02.0: bridge window [io  0x1000-0x0fff] t=
o [bus 39] add_size 1000
> [ 1680.785606] pcieport 0000:02:02.0: bridge window [mem 0x00100000-0x000=
fffff 64bit pref] to [bus 39] add_size 200000 add_align 100000
> [ 1680.785611] pcieport 0000:01:00.0: bridge window [io  0x1000-0x0fff] t=
o [bus 02-39] add_size 2000
> [ 1680.785615] pcieport 0000:01:00.0: BAR 13: no space for [io  size 0x20=
00]
> [ 1680.785617] pcieport 0000:01:00.0: BAR 13: failed to assign [io  size =
0x2000]
> [ 1680.785620] pcieport 0000:01:00.0: BAR 13: no space for [io  size 0x20=
00]
> [ 1680.785622] pcieport 0000:01:00.0: BAR 13: failed to assign [io  size =
0x2000]
> [ 1680.785628] pcieport 0000:02:02.0: BAR 15: no space for [mem size 0x00=
200000 64bit pref]
> [ 1680.785629] pcieport 0000:02:02.0: BAR 15: failed to assign [mem size =
0x00200000 64bit pref]
> [ 1680.785632] pcieport 0000:02:01.0: BAR 13: no space for [io  size 0x10=
00]
> [ 1680.785633] pcieport 0000:02:01.0: BAR 13: failed to assign [io  size =
0x1000]
> [ 1680.785635] pcieport 0000:02:02.0: BAR 13: no space for [io  size 0x10=
00]
> [ 1680.785637] pcieport 0000:02:02.0: BAR 13: failed to assign [io  size =
0x1000]
> [ 1680.785639] pcieport 0000:02:02.0: BAR 15: no space for [mem size 0x00=
200000 64bit pref]
> [ 1680.785641] pcieport 0000:02:02.0: BAR 15: failed to assign [mem size =
0x00200000 64bit pref]
> [ 1680.785642] pcieport 0000:02:02.0: BAR 13: no space for [io  size 0x10=
00]
> [ 1680.785644] pcieport 0000:02:02.0: BAR 13: failed to assign [io  size =
0x1000]
> [ 1680.785646] pcieport 0000:02:01.0: BAR 13: no space for [io  size 0x10=
00]
> [ 1680.785648] pcieport 0000:02:01.0: BAR 13: failed to assign [io  size =
0x1000]
> [ 1681.053190] usb 3-1.5: new high-speed USB device number 8 using xhci_h=
cd
> [ 1681.166184] usb 3-1.5: New USB device found, idVendor=3D2109, idProduc=
t=3D8817, bcdDevice=3D 0.01
> [ 1681.166192] usb 3-1.5: New USB device strings: Mfr=3D1, Product=3D2, S=
erialNumber=3D3
> [ 1681.166194] usb 3-1.5: Product: USB Billboard Device  =20
> [ 1681.166195] usb 3-1.5: Manufacturer: VIA Labs, Inc.        =20
> [ 1681.166197] usb 3-1.5: SerialNumber: 0000000000000001
> [ 1683.216486] r8152 4-1.1.3:1.0 enx00e04ceabc41: carrier on
> [ 2012.892056] wlp58s0: authenticate with 88:71:b1:81:93:1b
> [ 2012.928348] wlp58s0: send auth to 88:71:b1:81:93:1b (try 1/3)
> [ 2012.931504] wlp58s0: authenticated
> [ 2012.932387] wlp58s0: associate with 88:71:b1:81:93:1b (try 1/3)
> [ 2012.971769] wlp58s0: RX AssocResp from 88:71:b1:81:93:1b (capab=3D0x10=
11 status=3D0 aid=3D1)
> [ 2012.974501] wlp58s0: associated
> [ 2013.024605] wlp58s0: Limiting TX power to 23 (23 - 0) dBm as advertise=
d by 88:71:b1:81:93:1b
> [ 2259.031172] wlp58s0: deauthenticating from 88:71:b1:81:93:1b by local =
choice (Reason: 3=3DDEAUTH_LEAVING)
> [ 2262.267455] usb 3-1: USB disconnect, device number 2
> [ 2262.267461] usb 3-1.1: USB disconnect, device number 3
> [ 2262.267463] usb 3-1.1.2: USB disconnect, device number 4
> [ 2262.267465] usb 3-1.1.2.3: USB disconnect, device number 6
> [ 2262.323287] xhci_hcd 0000:39:00.0: xHCI host controller not responding=
, assume dead
> [ 2262.354801] xhci_hcd 0000:39:00.0: HC died; cleaning up
> [ 2262.354838] r8152 4-1.1.3:1.0 enx00e04ceabc41: Stop submitting intr, s=
tatus -108
> [ 2262.356693] usb 3-1.1.2.4: USB disconnect, device number 7
> [ 2262.381135] xhci_hcd 0000:39:00.0: remove, state 1
> [ 2262.381142] usb usb4: USB disconnect, device number 1
> [ 2262.472067] usb 4-1: USB disconnect, device number 2
> [ 2262.472074] usb 4-1.1: USB disconnect, device number 3
> [ 2262.472077] usb 4-1.1.2: USB disconnect, device number 5
> [ 2262.472323] r8152-cfgselector 4-1.1.3: USB disconnect, device number 6
> [ 2262.525055] usb 4-1.4: USB disconnect, device number 4
> [ 2262.597064] xhci_hcd 0000:39:00.0: USB bus 4 deregistered
> [ 2262.597084] xhci_hcd 0000:39:00.0: remove, state 1
> [ 2262.597088] usb usb3: USB disconnect, device number 1
> [ 2262.628951] usb 3-1.5: USB disconnect, device number 8
> [ 2262.629584] xhci_hcd 0000:39:00.0: Host halt failed, -19
> [ 2262.629588] xhci_hcd 0000:39:00.0: Host not accessible, reset failed.
> [ 2262.629805] xhci_hcd 0000:39:00.0: USB bus 3 deregistered
> [ 2262.643628] pci_bus 0000:02: Allocating resources
> [ 2262.643644] pcieport 0000:02:01.0: bridge window [io  0x1000-0x0fff] t=
o [bus 04-38] add_size 1000
> [ 2262.643649] pcieport 0000:02:02.0: bridge window [io  0x1000-0x0fff] t=
o [bus 39] add_size 1000
> [ 2262.643652] pcieport 0000:02:02.0: bridge window [mem 0x00100000-0x000=
fffff 64bit pref] to [bus 39] add_size 200000 add_align 100000
> [ 2262.643655] pcieport 0000:01:00.0: bridge window [io  0x1000-0x0fff] t=
o [bus 02-39] add_size 2000
> [ 2262.643659] pcieport 0000:01:00.0: BAR 13: no space for [io  size 0x20=
00]
> [ 2262.643662] pcieport 0000:01:00.0: BAR 13: failed to assign [io  size =
0x2000]
> [ 2262.643665] pcieport 0000:01:00.0: BAR 13: no space for [io  size 0x20=
00]
> [ 2262.643667] pcieport 0000:01:00.0: BAR 13: failed to assign [io  size =
0x2000]
> [ 2262.643671] pcieport 0000:02:02.0: BAR 15: no space for [mem size 0x00=
200000 64bit pref]
> [ 2262.643673] pcieport 0000:02:02.0: BAR 15: failed to assign [mem size =
0x00200000 64bit pref]
> [ 2262.643676] pcieport 0000:02:01.0: BAR 13: no space for [io  size 0x10=
00]
> [ 2262.643677] pcieport 0000:02:01.0: BAR 13: failed to assign [io  size =
0x1000]
> [ 2262.643679] pcieport 0000:02:02.0: BAR 13: no space for [io  size 0x10=
00]
> [ 2262.643681] pcieport 0000:02:02.0: BAR 13: failed to assign [io  size =
0x1000]
> [ 2262.643684] pcieport 0000:02:02.0: BAR 15: no space for [mem size 0x00=
200000 64bit pref]
> [ 2262.643686] pcieport 0000:02:02.0: BAR 15: failed to assign [mem size =
0x00200000 64bit pref]
> [ 2262.643687] pcieport 0000:02:02.0: BAR 13: no space for [io  size 0x10=
00]
> [ 2262.643689] pcieport 0000:02:02.0: BAR 13: failed to assign [io  size =
0x1000]
> [ 2262.643690] pcieport 0000:02:01.0: BAR 13: no space for [io  size 0x10=
00]
> [ 2262.643692] pcieport 0000:02:01.0: BAR 13: failed to assign [io  size =
0x1000]
> [ 2267.470783] pcieport 0000:02:00.0: Unable to change power state from D=
3hot to D0, device inaccessible
> [ 2267.473207] pci_bus 0000:03: busn_res: [bus 03] is released
> [ 2267.473434] pci_bus 0000:04: busn_res: [bus 04-38] is released
> [ 2267.473646] pci_bus 0000:39: busn_res: [bus 39] is released
> [ 2267.474562] pci_bus 0000:02: busn_res: [bus 02-39] is released
> [ 2289.398847] PM: suspend entry (deep)
> [ 2289.413801] Filesystems sync: 0.014 seconds
> [ 2289.413898] (NULL device *): firmware: direct-loading firmware i915/kb=
l_dmc_ver1_04.bin
> [ 2289.413985] (NULL device *): firmware: direct-loading firmware regulat=
ory.db
> [ 2289.414033] (NULL device *): firmware: direct-loading firmware regulat=
ory.db.p7s
> [ 2289.416489] Freezing user space processes
> [ 2289.419005] Freezing user space processes completed (elapsed 0.002 sec=
onds)
> [ 2289.419008] OOM killer disabled.
> [ 2289.419009] Freezing remaining freezable tasks
> [ 2289.420136] Freezing remaining freezable tasks completed (elapsed 0.00=
1 seconds)
> [ 2289.420183] printk: Suspending console(s) (use no_console_suspend to d=
ebug)
> [ 2289.989137] ACPI: EC: interrupt blocked
> [ 2290.024310] ACPI: PM: Preparing to enter system sleep state S3
> [ 2290.036009] ACPI: EC: event blocked
> [ 2290.036013] ACPI: EC: EC stopped
> [ 2290.036015] ACPI: PM: Saving platform NVS memory
> [ 2290.039759] Disabling non-boot CPUs ...
> [ 2290.041955] smpboot: CPU 1 is now offline
> [ 2290.046115] smpboot: CPU 2 is now offline
> [ 2290.051349] smpboot: CPU 3 is now offline
> [ 2290.059934] ACPI: PM: Low-level resume complete
> [ 2290.059977] ACPI: EC: EC started
> [ 2290.059977] ACPI: PM: Restoring platform NVS memory
> [ 2290.062090] Enabling non-boot CPUs ...
> [ 2290.062114] smpboot: Booting Node 0 Processor 1 APIC 0x2
> [ 2290.063202] CPU1 is up
> [ 2290.063220] smpboot: Booting Node 0 Processor 2 APIC 0x1
> [ 2290.063942] CPU2 is up
> [ 2290.063959] smpboot: Booting Node 0 Processor 3 APIC 0x3
> [ 2290.064612] CPU3 is up
> [ 2290.067510] ACPI: PM: Waking up from system sleep state S3
> [ 2290.106487] ACPI: EC: interrupt unblocked
> [ 2290.106788] pcieport 0000:00:1c.0: Intel SPT PCH root port ACS workaro=
und enabled
> [ 2290.106915] pcieport 0000:00:1c.4: Intel SPT PCH root port ACS workaro=
und enabled
> [ 2290.106925] pcieport 0000:00:1d.0: Intel SPT PCH root port ACS workaro=
und enabled
> [ 2290.133856] DMAR: DRHD: handling fault status reg 2
> [ 2290.133865] DMAR: [INTR-REMAP] Request device [f0:1f.0] fault index 0x=
0 [fault reason 0x25] Blocked a compatibility format interrupt request
> [ 2290.135244] ACPI: EC: event unblocked
> [ 2290.176768] i915 0000:00:02.0: [drm] [ENCODER:94:DDI A/PHY A] is disab=
led/in DSI mode with an ungated DDI clock, gate it
> [ 2290.177442] i915 0000:00:02.0: [drm] [ENCODER:102:DDI B/PHY B] is disa=
bled/in DSI mode with an ungated DDI clock, gate it
> [ 2290.180083] i915 0000:00:02.0: [drm] [ENCODER:113:DDI C/PHY C] is disa=
bled/in DSI mode with an ungated DDI clock, gate it
> [ 2290.184565] nvme nvme0: 4/0/0 default/read/poll queues
> [ 2290.445036] usb 1-4: reset full-speed USB device number 3 using xhci_h=
cd
> [ 2290.720921] usb 1-5: reset high-speed USB device number 4 using xhci_h=
cd
> [ 2290.997040] usb 1-3: reset full-speed USB device number 2 using xhci_h=
cd
> [ 2291.158814] OOM killer enabled.
> [ 2291.158821] Restarting tasks ... done.
> [ 2291.186316] random: crng reseeded on system resumption
> [ 2291.272895] PM: suspend exit
> [ 2291.354212] bluetooth hci0: firmware: direct-loading firmware qca/ramp=
atch_usb_00000302.bin
> [ 2291.354587] Bluetooth: hci0: using rampatch file: qca/rampatch_usb_000=
00302.bin
> [ 2291.354589] Bluetooth: hci0: QCA: patch rome 0x302 build 0x3e8, firmwa=
re rome 0x302 build 0x111
> [ 2291.355926] Process accounting resumed
> [ 2291.516514] mei_hdcp 0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1c54b627f04=
: bound 0000:00:02.0 (ops i915_hdcp_ops [i915])
> [ 2291.714644] bluetooth hci0: firmware: direct-loading firmware qca/nvm_=
usb_00000302.bin
> [ 2291.714724] Bluetooth: hci0: using NVM file: qca/nvm_usb_00000302.bin
> [ 2291.742648] Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection=
 command is advertised, but not supported.
> [ 2292.012075] Bluetooth: MGMT ver 1.22
> [ 2295.329549] ucsi_acpi USBC000:00: failed to re-enable notifications (-=
110)
> [ 2300.700827] ucsi_acpi USBC000:00: ucsi_handle_connector_change: ACK fa=
iled (-110)
> [ 2350.391729] perf: interrupt took too long (2537 > 2500), lowering kern=
el.perf_event_max_sample_rate to 78750
> [ 2350.400284] perf: interrupt took too long (3200 > 3171), lowering kern=
el.perf_event_max_sample_rate to 62500
> [ 2350.421571] perf: interrupt took too long (4018 > 4000), lowering kern=
el.perf_event_max_sample_rate to 49750
> [ 2350.516879] perf: interrupt took too long (5047 > 5022), lowering kern=
el.perf_event_max_sample_rate to 39500
> [ 2350.948154] perf: interrupt took too long (6345 > 6308), lowering kern=
el.perf_event_max_sample_rate to 31500
> [ 2350.955266] perf: interrupt took too long (7954 > 7931), lowering kern=
el.perf_event_max_sample_rate to 25000
> [ 2350.969243] perf: interrupt took too long (9951 > 9942), lowering kern=
el.perf_event_max_sample_rate to 20000
> [ 2350.986802] perf: interrupt took too long (12452 > 12438), lowering ke=
rnel.perf_event_max_sample_rate to 16000
> [ 2351.056784] perf: interrupt took too long (15603 > 15565), lowering ke=
rnel.perf_event_max_sample_rate to 12750
> [ 2452.459464] hrtimer: interrupt took 3382 ns
> [ 2735.963201] wlp58s0: authenticate with 1c:d1:e0:3c:be:2f
> [ 2735.997768] wlp58s0: send auth to 1c:d1:e0:3c:be:2f (try 1/3)
> [ 2735.999014] wlp58s0: authenticated
> [ 2736.002375] wlp58s0: associate with 1c:d1:e0:3c:be:2f (try 1/3)
> [ 2736.009419] wlp58s0: RX AssocResp from 1c:d1:e0:3c:be:2f (capab=3D0x10=
1 status=3D0 aid=3D81)
> [ 2736.013602] wlp58s0: associated
> [ 2736.013942] ath: EEPROM regdomain: 0x8114
> [ 2736.013950] ath: EEPROM indicates we should expect a country code
> [ 2736.013954] ath: doing EEPROM country->regdmn map search
> [ 2736.013957] ath: country maps to regdmn code: 0x37
> [ 2736.013960] ath: Country alpha2 being used: DE
> [ 2736.013965] ath: Regpair used: 0x37
> [ 2736.013968] ath: regdomain 0x8114 dynamically updated by country eleme=
nt
> [ 2736.118154] wlp58s0: Limiting TX power to 30 (30 - 0) dBm as advertise=
d by 1c:d1:e0:3c:be:2f
> [ 2739.391113] wlp58s0: deauthenticating from 1c:d1:e0:3c:be:2f by local =
choice (Reason: 3=3DDEAUTH_LEAVING)
> [ 2747.424152] wlp58s0: authenticate with b8:11:4b:ba:15:ef
> [ 2747.461697] wlp58s0: send auth to b8:11:4b:ba:15:ef (try 1/3)
> [ 2747.463138] wlp58s0: authenticated
> [ 2747.466303] wlp58s0: associate with b8:11:4b:ba:15:ef (try 1/3)
> [ 2747.494609] wlp58s0: RX AssocResp from b8:11:4b:ba:15:ef (capab=3D0x10=
1 status=3D0 aid=3D143)
> [ 2747.497772] wlp58s0: associated
> [ 2747.498433] ath: EEPROM regdomain: 0x8114
> [ 2747.498444] ath: EEPROM indicates we should expect a country code
> [ 2747.498448] ath: doing EEPROM country->regdmn map search
> [ 2747.498451] ath: country maps to regdmn code: 0x37
> [ 2747.498457] ath: Country alpha2 being used: DE
> [ 2747.498461] ath: Regpair used: 0x37
> [ 2747.498466] ath: regdomain 0x8114 dynamically updated by country eleme=
nt
> [ 2747.568286] wlp58s0: Limiting TX power to 23 (23 - 0) dBm as advertise=
d by b8:11:4b:ba:15:ef
> [ 2791.194044] ath10k_pci 0000:3a:00.0: failed to flush transmit queue (s=
kip 0 ar-state 1): 0
> [ 2791.200557] wlp58s0: Connection to AP 00:00:00:00:00:00 lost
> [ 2791.682876] wlp58s0: authenticate with 1c:d1:e0:3b:99:af
> [ 2791.724259] wlp58s0: send auth to 1c:d1:e0:3b:99:af (try 1/3)
> [ 2791.725421] wlp58s0: send auth to 1c:d1:e0:3b:99:af (try 2/3)
> [ 2791.726569] wlp58s0: send auth to 1c:d1:e0:3b:99:af (try 3/3)
> [ 2791.727707] wlp58s0: authentication with 1c:d1:e0:3b:99:af timed out
> [ 2797.115305] wlp58s0: authenticate with b8:11:4b:ba:15:ef
> [ 2797.152651] wlp58s0: send auth to b8:11:4b:ba:15:ef (try 1/3)
> [ 2797.153786] wlp58s0: send auth to b8:11:4b:ba:15:ef (try 2/3)
> [ 2797.155025] wlp58s0: send auth to b8:11:4b:ba:15:ef (try 3/3)
> [ 2797.156173] wlp58s0: authentication with b8:11:4b:ba:15:ef timed out
> [ 2845.232273] wlp58s0: authenticate with 00:f2:8b:3a:b9:bf
> [ 2845.273979] wlp58s0: send auth to 00:f2:8b:3a:b9:bf (try 1/3)
> [ 2845.274600] wlp58s0: authenticated
> [ 2845.277670] wlp58s0: associate with 00:f2:8b:3a:b9:bf (try 1/3)
> [ 2845.279628] wlp58s0: RX AssocResp from 00:f2:8b:3a:b9:bf (capab=3D0x10=
1 status=3D0 aid=3D161)
> [ 2845.282351] wlp58s0: associated
> [ 2845.282530] ath: EEPROM regdomain: 0x8114
> [ 2845.282533] ath: EEPROM indicates we should expect a country code
> [ 2845.282534] ath: doing EEPROM country->regdmn map search
> [ 2845.282535] ath: country maps to regdmn code: 0x37
> [ 2845.282537] ath: Country alpha2 being used: DE
> [ 2845.282538] ath: Regpair used: 0x37
> [ 2845.282539] ath: regdomain 0x8114 dynamically updated by country eleme=
nt
> [ 2845.304526] wlp58s0: Limiting TX power to 17 dBm as advertised by 00:f=
2:8b:3a:b9:bf
> [ 2898.706385] wlp58s0: disconnect from AP 00:f2:8b:3a:b9:bf for new auth=
 to 00:f2:8b:8f:11:8f
> [ 2898.726310] wlp58s0: authenticate with 00:f2:8b:8f:11:8f
> [ 2898.768652] wlp58s0: send auth to 00:f2:8b:8f:11:8f (try 1/3)
> [ 2898.771423] wlp58s0: authenticated
> [ 2898.782288] wlp58s0: associate with 00:f2:8b:8f:11:8f (try 1/3)
> [ 2898.791914] wlp58s0: RX ReassocResp from 00:f2:8b:8f:11:8f (capab=3D0x=
101 status=3D0 aid=3D63)
> [ 2898.795158] wlp58s0: associated
> [ 2898.796275] ath: EEPROM regdomain: 0x8114
> [ 2898.796292] ath: EEPROM indicates we should expect a country code
> [ 2898.796297] ath: doing EEPROM country->regdmn map search
> [ 2898.796302] ath: country maps to regdmn code: 0x37
> [ 2898.796309] ath: Country alpha2 being used: DE
> [ 2898.796315] ath: Regpair used: 0x37
> [ 2898.796320] ath: regdomain 0x8114 dynamically updated by country eleme=
nt
> [ 2898.886103] wlp58s0: Limiting TX power to 17 dBm as advertised by 00:f=
2:8b:8f:11:8f
> [ 2913.579136] wlp58s0: disconnect from AP 00:f2:8b:8f:11:8f for new auth=
 to 78:bc:1a:02:dc:4f
> [ 2918.681132] ath10k_pci 0000:3a:00.0: failed to flush transmit queue (s=
kip 0 ar-state 1): 0
> [ 2918.688626] wlp58s0: authenticate with 78:bc:1a:02:dc:4f
> [ 2918.722981] wlp58s0: send auth to 78:bc:1a:02:dc:4f (try 1/3)
> [ 2918.724320] wlp58s0: send auth to 78:bc:1a:02:dc:4f (try 2/3)
> [ 2918.725711] wlp58s0: send auth to 78:bc:1a:02:dc:4f (try 3/3)
> [ 2918.727297] wlp58s0: authentication with 78:bc:1a:02:dc:4f timed out
> [ 2919.540925] wlp58s0: authenticate with 00:f2:8b:87:63:cf
> [ 2919.579503] wlp58s0: send auth to 00:f2:8b:87:63:cf (try 1/3)
> [ 2919.583993] wlp58s0: send auth to 00:f2:8b:87:63:cf (try 2/3)
> [ 2919.585642] wlp58s0: send auth to 00:f2:8b:87:63:cf (try 3/3)
> [ 2919.587454] wlp58s0: authentication with 00:f2:8b:87:63:cf timed out
> [ 2920.645318] wlp58s0: authenticate with 00:f2:8b:87:63:c0
> [ 2920.645363] wlp58s0: 80 MHz not supported, disabling VHT
> [ 2920.709675] wlp58s0: send auth to 00:f2:8b:87:63:c0 (try 1/3)
> [ 2920.711670] wlp58s0: send auth to 00:f2:8b:87:63:c0 (try 2/3)
> [ 2920.716983] wlp58s0: send auth to 00:f2:8b:87:63:c0 (try 3/3)
> [ 2920.720546] wlp58s0: authentication with 00:f2:8b:87:63:c0 timed out
> [ 2922.217491] wlp58s0: authenticate with 00:f2:8b:87:5f:ff
> [ 2922.258867] wlp58s0: send auth to 00:f2:8b:87:5f:ff (try 1/3)
> [ 2922.260075] wlp58s0: send auth to 00:f2:8b:87:5f:ff (try 2/3)
> [ 2922.261735] wlp58s0: send auth to 00:f2:8b:87:5f:ff (try 3/3)
> [ 2922.264247] wlp58s0: authentication with 00:f2:8b:87:5f:ff timed out
> [ 2982.537315] wlp58s0: authenticate with 00:81:c4:f8:8c:3f
> [ 2982.578690] wlp58s0: send auth to 00:81:c4:f8:8c:3f (try 1/3)
> [ 2982.579780] wlp58s0: authenticated
> [ 2982.580856] wlp58s0: associate with 00:81:c4:f8:8c:3f (try 1/3)
> [ 2982.585672] wlp58s0: RX AssocResp from 00:81:c4:f8:8c:3f (capab=3D0x10=
1 status=3D0 aid=3D76)
> [ 2982.589426] wlp58s0: associated
> [ 2982.590101] ath: EEPROM regdomain: 0x8114
> [ 2982.590114] ath: EEPROM indicates we should expect a country code
> [ 2982.590119] ath: doing EEPROM country->regdmn map search
> [ 2982.590123] ath: country maps to regdmn code: 0x37
> [ 2982.590129] ath: Country alpha2 being used: DE
> [ 2982.590134] ath: Regpair used: 0x37
> [ 2982.590138] ath: regdomain 0x8114 dynamically updated by country eleme=
nt
> [ 2982.682200] wlp58s0: Limiting TX power to 17 dBm as advertised by 00:8=
1:c4:f8:8c:3f
> [ 3001.445409] wlp58s0: disconnect from AP 00:81:c4:f8:8c:3f for new auth=
 to 00:81:c4:6e:6e:2f
> [ 3006.744771] ath10k_pci 0000:3a:00.0: failed to flush transmit queue (s=
kip 0 ar-state 1): 0
> [ 3006.753118] wlp58s0: authenticate with 00:81:c4:6e:6e:2f
> [ 3006.786899] wlp58s0: send auth to 00:81:c4:6e:6e:2f (try 1/3)
> [ 3006.800918] wlp58s0: send auth to 00:81:c4:6e:6e:2f (try 2/3)
> [ 3686.165659] PM: suspend entry (deep)
> [ 3686.174953] Filesystems sync: 0.009 seconds
> [ 3686.175074] (NULL device *): firmware: direct-loading firmware i915/kb=
l_dmc_ver1_04.bin
> [ 3686.175133] (NULL device *): firmware: direct-loading firmware regulat=
ory.db
> [ 3686.175170] (NULL device *): firmware: direct-loading firmware regulat=
ory.db.p7s
> [ 3686.175195] (NULL device *): firmware: direct-loading firmware qca/ram=
patch_usb_00000302.bin
> [ 3686.175196] (NULL device *): firmware: direct-loading firmware qca/nvm=
_usb_00000302.bin
> [ 3686.177310] Freezing user space processes
> [ 3686.180138] Freezing user space processes completed (elapsed 0.002 sec=
onds)
> [ 3686.180141] OOM killer disabled.
> [ 3686.180142] Freezing remaining freezable tasks
> [ 3686.181615] Freezing remaining freezable tasks completed (elapsed 0.00=
1 seconds)
> [ 3686.181660] printk: Suspending console(s) (use no_console_suspend to d=
ebug)
> [ 3686.728148] ACPI: EC: interrupt blocked
> [ 3686.764305] ACPI: PM: Preparing to enter system sleep state S3
> [ 3686.773923] ACPI: EC: event blocked
> [ 3686.773926] ACPI: EC: EC stopped
> [ 3686.773928] ACPI: PM: Saving platform NVS memory
> [ 3686.777270] Disabling non-boot CPUs ...
> [ 3686.780166] smpboot: CPU 1 is now offline
> [ 3686.784535] smpboot: CPU 2 is now offline
> [ 3686.787537] smpboot: CPU 3 is now offline
> [ 3686.795846] ACPI: PM: Low-level resume complete
> [ 3686.795888] ACPI: EC: EC started
> [ 3686.795889] ACPI: PM: Restoring platform NVS memory
> [ 3686.798006] Enabling non-boot CPUs ...
> [ 3686.798037] smpboot: Booting Node 0 Processor 1 APIC 0x2
> [ 3686.798741] CPU1 is up
> [ 3686.798758] smpboot: Booting Node 0 Processor 2 APIC 0x1
> [ 3686.799472] CPU2 is up
> [ 3686.799489] smpboot: Booting Node 0 Processor 3 APIC 0x3
> [ 3686.800142] CPU3 is up
> [ 3686.803057] ACPI: PM: Waking up from system sleep state S3
> [ 3686.830851] ACPI: EC: interrupt unblocked
> [ 3686.831311] pcieport 0000:00:1c.0: Intel SPT PCH root port ACS workaro=
und enabled
> [ 3686.831407] pcieport 0000:00:1c.4: Intel SPT PCH root port ACS workaro=
und enabled
> [ 3686.831431] pcieport 0000:00:1d.0: Intel SPT PCH root port ACS workaro=
und enabled
> [ 3686.905888] DMAR: DRHD: handling fault status reg 2
> [ 3686.905897] DMAR: [INTR-REMAP] Request device [f0:1f.0] fault index 0x=
0 [fault reason 0x25] Blocked a compatibility format interrupt request
> [ 3686.907738] ACPI: EC: event unblocked
> [ 3686.942684] i915 0000:00:02.0: [drm] [ENCODER:94:DDI A/PHY A] is disab=
led/in DSI mode with an ungated DDI clock, gate it
> [ 3686.947320] i915 0000:00:02.0: [drm] [ENCODER:102:DDI B/PHY B] is disa=
bled/in DSI mode with an ungated DDI clock, gate it
> [ 3686.948175] nvme nvme0: 4/0/0 default/read/poll queues
> [ 3686.959404] i915 0000:00:02.0: [drm] [ENCODER:113:DDI C/PHY C] is disa=
bled/in DSI mode with an ungated DDI clock, gate it
> [ 3687.236928] usb 1-5: reset high-speed USB device number 4 using xhci_h=
cd
> [ 3687.513065] usb 1-3: reset full-speed USB device number 2 using xhci_h=
cd
> [ 3687.789038] usb 1-4: reset full-speed USB device number 3 using xhci_h=
cd
> [ 3687.958754] OOM killer enabled.
> [ 3687.958756] Restarting tasks ... done.
> [ 3687.967755] random: crng reseeded on system resumption
> [ 3688.052259] PM: suspend exit
> [ 3688.133001] Process accounting resumed
> [ 3688.169609] Bluetooth: hci0: using rampatch file: qca/rampatch_usb_000=
00302.bin
> [ 3688.169620] Bluetooth: hci0: QCA: patch rome 0x302 build 0x3e8, firmwa=
re rome 0x302 build 0x111
> [ 3688.258584] mei_hdcp 0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1c54b627f04=
: bound 0000:00:02.0 (ops i915_hdcp_ops [i915])
> [ 3688.532997] Bluetooth: hci0: using NVM file: qca/nvm_usb_00000302.bin
> [ 3688.562684] Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection=
 command is advertised, but not supported.
> [ 3688.862650] Bluetooth: MGMT ver 1.22
> [ 3692.060961] ucsi_acpi USBC000:00: failed to re-enable notifications (-=
110)
> [ 3736.924205] wlp58s0: authenticate with 00:81:c4:7c:8b:7f
> [ 3736.961773] wlp58s0: send auth to 00:81:c4:7c:8b:7f (try 1/3)
> [ 3736.966637] wlp58s0: authenticated
> [ 3736.968452] wlp58s0: associate with 00:81:c4:7c:8b:7f (try 1/3)
> [ 3736.970208] wlp58s0: RX AssocResp from 00:81:c4:7c:8b:7f (capab=3D0x10=
1 status=3D0 aid=3D179)
> [ 3736.973128] wlp58s0: associated
> [ 3736.973449] ath: EEPROM regdomain: 0x8114
> [ 3736.973453] ath: EEPROM indicates we should expect a country code
> [ 3736.973455] ath: doing EEPROM country->regdmn map search
> [ 3736.973457] ath: country maps to regdmn code: 0x37
> [ 3736.973459] ath: Country alpha2 being used: DE
> [ 3736.973461] ath: Regpair used: 0x37
> [ 3736.973462] ath: regdomain 0x8114 dynamically updated by country eleme=
nt
> [ 3737.054881] wlp58s0: Limiting TX power to 17 dBm as advertised by 00:8=
1:c4:7c:8b:7f
> [ 4051.634492] wlp58s0: disconnect from AP 00:81:c4:7c:8b:7f for new auth=
 to 00:81:c4:93:da:ff
> [ 4051.674692] wlp58s0: authenticate with 00:81:c4:93:da:ff
> [ 4051.720649] wlp58s0: send auth to 00:81:c4:93:da:ff (try 1/3)
> [ 4051.721928] wlp58s0: send auth to 00:81:c4:93:da:ff (try 2/3)
> [ 4051.723548] wlp58s0: send auth to 00:81:c4:93:da:ff (try 3/3)
> [ 4051.763978] wlp58s0: authentication with 00:81:c4:93:da:ff timed out
> [ 4052.309511] wlp58s0: authenticate with 00:81:c4:7c:8b:70
> [ 4052.309561] wlp58s0: 80 MHz not supported, disabling VHT
> [ 4052.360870] wlp58s0: send auth to 00:81:c4:7c:8b:70 (try 1/3)
> [ 4052.364356] wlp58s0: send auth to 00:81:c4:7c:8b:70 (try 2/3)
> [ 4052.368757] wlp58s0: send auth to 00:81:c4:7c:8b:70 (try 3/3)
> [ 4052.372907] wlp58s0: authentication with 00:81:c4:7c:8b:70 timed out
> [ 4053.273041] wlp58s0: authenticate with 00:81:c4:93:da:f0
> [ 4053.273078] wlp58s0: 80 MHz not supported, disabling VHT
> [ 4053.375117] wlp58s0: send auth to 00:81:c4:93:da:f0 (try 1/3)
> [ 4053.377018] wlp58s0: send auth to 00:81:c4:93:da:f0 (try 2/3)
> [ 4053.380118] wlp58s0: send auth to 00:81:c4:93:da:f0 (try 3/3)
> [ 4053.384640] wlp58s0: authentication with 00:81:c4:93:da:f0 timed out
> [ 4054.733304] wlp58s0: authenticate with 00:81:c4:7c:8b:7f
> [ 4054.775306] wlp58s0: send auth to 00:81:c4:7c:8b:7f (try 1/3)
> [ 4054.776533] wlp58s0: send auth to 00:81:c4:7c:8b:7f (try 2/3)
> [ 4054.779044] wlp58s0: send auth to 00:81:c4:7c:8b:7f (try 3/3)
> [ 4054.780176] wlp58s0: authentication with 00:81:c4:7c:8b:7f timed out
> [ 4090.526857] wlp58s0: authenticate with 00:81:c4:e7:0a:ff
> [ 4090.564341] wlp58s0: send auth to 00:81:c4:e7:0a:ff (try 1/3)
> [ 4090.565497] wlp58s0: authenticated
> [ 4090.570108] wlp58s0: associate with 00:81:c4:e7:0a:ff (try 1/3)
> [ 4090.572009] wlp58s0: RX AssocResp from 00:81:c4:e7:0a:ff (capab=3D0x10=
1 status=3D0 aid=3D3)
> [ 4090.576095] wlp58s0: associated
> [ 4090.576554] ath: EEPROM regdomain: 0x8114
> [ 4090.576567] ath: EEPROM indicates we should expect a country code
> [ 4090.576573] ath: doing EEPROM country->regdmn map search
> [ 4090.576579] ath: country maps to regdmn code: 0x37
> [ 4090.576586] ath: Country alpha2 being used: DE
> [ 4090.576591] ath: Regpair used: 0x37
> [ 4090.576596] ath: regdomain 0x8114 dynamically updated by country eleme=
nt
> [ 4090.652208] wlp58s0: Limiting TX power to 17 dBm as advertised by 00:8=
1:c4:e7:0a:ff
> [ 4114.329030] wlp58s0: disconnect from AP 00:81:c4:e7:0a:ff for new auth=
 to 00:81:c4:91:00:4f
> [ 4119.577970] ath10k_pci 0000:3a:00.0: failed to flush transmit queue (s=
kip 0 ar-state 1): 0
> [ 4119.585232] wlp58s0: authenticate with 00:81:c4:91:00:4f
> [ 4119.631483] wlp58s0: send auth to 00:81:c4:91:00:4f (try 1/3)
> [ 4119.633067] wlp58s0: send auth to 00:81:c4:91:00:4f (try 2/3)
> [ 4119.634335] wlp58s0: send auth to 00:81:c4:91:00:4f (try 3/3)
> [ 4119.635746] wlp58s0: authentication with 00:81:c4:91:00:4f timed out
> [ 4120.341458] wlp58s0: authenticate with 00:81:c4:e7:0a:f0
> [ 4120.341520] wlp58s0: 80 MHz not supported, disabling VHT
> [ 4120.392881] wlp58s0: send auth to 00:81:c4:e7:0a:f0 (try 1/3)
> [ 4120.396040] wlp58s0: send auth to 00:81:c4:e7:0a:f0 (try 2/3)
> [ 4120.397734] wlp58s0: send auth to 00:81:c4:e7:0a:f0 (try 3/3)
> [ 4120.399148] wlp58s0: authentication with 00:81:c4:e7:0a:f0 timed out
> [ 4121.505316] wlp58s0: authenticate with 00:81:c4:f8:8b:3f
> [ 4121.546660] wlp58s0: send auth to 00:81:c4:f8:8b:3f (try 1/3)
> [ 4121.549260] wlp58s0: send auth to 00:81:c4:f8:8b:3f (try 2/3)
> [ 4121.550474] wlp58s0: send auth to 00:81:c4:f8:8b:3f (try 3/3)
> [ 4121.551636] wlp58s0: authentication with 00:81:c4:f8:8b:3f timed out
> [ 4122.952051] wlp58s0: authenticate with 00:81:c4:f8:8b:30
> [ 4122.952086] wlp58s0: 80 MHz not supported, disabling VHT
> [ 4123.003444] wlp58s0: send auth to 00:81:c4:f8:8b:30 (try 1/3)
> [ 4123.005923] wlp58s0: send auth to 00:81:c4:f8:8b:30 (try 2/3)
> [ 4123.007626] wlp58s0: send auth to 00:81:c4:f8:8b:30 (try 3/3)
> [ 4123.009091] wlp58s0: authentication with 00:81:c4:f8:8b:30 timed out
> [ 4132.359158] wlp58s0: authenticate with 00:81:c4:e7:0a:ff
> [ 4132.399507] wlp58s0: send auth to 00:81:c4:e7:0a:ff (try 1/3)
> [ 4132.400655] wlp58s0: send auth to 00:81:c4:e7:0a:ff (try 2/3)
> [ 4132.401897] wlp58s0: send auth to 00:81:c4:e7:0a:ff (try 3/3)
> [ 4132.403261] wlp58s0: authentication with 00:81:c4:e7:0a:ff timed out
> [ 4135.674412] wlp58s0: authenticate with 00:81:c4:e7:0d:df
> [ 4135.715835] wlp58s0: send auth to 00:81:c4:e7:0d:df (try 1/3)
> [ 4135.717070] wlp58s0: send auth to 00:81:c4:e7:0d:df (try 2/3)
> [ 4135.718292] wlp58s0: send auth to 00:81:c4:e7:0d:df (try 3/3)
> [ 4135.719664] wlp58s0: authentication with 00:81:c4:e7:0d:df timed out
> [ 4165.425896] wlp58s0: authenticate with 4c:a6:4d:7c:b2:af
> [ 4165.471836] wlp58s0: send auth to 4c:a6:4d:7c:b2:af (try 1/3)
> [ 4165.473138] wlp58s0: authenticated
> [ 4165.481689] wlp58s0: associate with 4c:a6:4d:7c:b2:af (try 1/3)
> [ 4165.489083] wlp58s0: RX AssocResp from 4c:a6:4d:7c:b2:af (capab=3D0x10=
1 status=3D0 aid=3D5)
> [ 4165.493160] wlp58s0: associated
> [ 4165.493638] ath: EEPROM regdomain: 0x8114
> [ 4165.493647] ath: EEPROM indicates we should expect a country code
> [ 4165.493651] ath: doing EEPROM country->regdmn map search
> [ 4165.493656] ath: country maps to regdmn code: 0x37
> [ 4165.493660] ath: Country alpha2 being used: DE
> [ 4165.493665] ath: Regpair used: 0x37
> [ 4165.493669] ath: regdomain 0x8114 dynamically updated by country eleme=
nt
> [ 4165.598204] wlp58s0: Limiting TX power to 30 (30 - 0) dBm as advertise=
d by 4c:a6:4d:7c:b2:af
> [ 4194.577764] wlp58s0: disconnect from AP 4c:a6:4d:7c:b2:af for new auth=
 to ac:4a:56:9a:97:6f
> [ 4199.705442] ath10k_pci 0000:3a:00.0: failed to flush transmit queue (s=
kip 0 ar-state 1): 0
> [ 4199.713225] wlp58s0: authenticate with ac:4a:56:9a:97:6f
> [ 4199.751555] wlp58s0: send auth to ac:4a:56:9a:97:6f (try 1/3)
> [ 4199.752838] wlp58s0: send auth to ac:4a:56:9a:97:6f (try 2/3)
> [ 4199.754171] wlp58s0: send auth to ac:4a:56:9a:97:6f (try 3/3)
> [ 4199.755364] wlp58s0: authentication with ac:4a:56:9a:97:6f timed out
> [ 4200.396988] wlp58s0: authenticate with 4c:a6:4d:7c:b2:af
> [ 4200.443874] wlp58s0: send auth to 4c:a6:4d:7c:b2:af (try 1/3)
> [ 4200.445196] wlp58s0: send auth to 4c:a6:4d:7c:b2:af (try 2/3)
> [ 4200.446442] wlp58s0: send auth to 4c:a6:4d:7c:b2:af (try 3/3)
> [ 4200.447693] wlp58s0: authentication with 4c:a6:4d:7c:b2:af timed out
> [ 4225.069503] wlp58s0: authenticate with 00:81:c4:f8:8a:9f
> [ 4225.110205] wlp58s0: send auth to 00:81:c4:f8:8a:9f (try 1/3)
> [ 4225.110949] wlp58s0: authenticated
> [ 4225.113222] wlp58s0: associate with 00:81:c4:f8:8a:9f (try 1/3)
> [ 4225.115242] wlp58s0: RX AssocResp from 00:81:c4:f8:8a:9f (capab=3D0x10=
1 status=3D0 aid=3D9)
> [ 4225.119049] wlp58s0: associated
> [ 4225.119458] ath: EEPROM regdomain: 0x8114
> [ 4225.119468] ath: EEPROM indicates we should expect a country code
> [ 4225.119473] ath: doing EEPROM country->regdmn map search
> [ 4225.119477] ath: country maps to regdmn code: 0x37
> [ 4225.119483] ath: Country alpha2 being used: DE
> [ 4225.119488] ath: Regpair used: 0x37
> [ 4225.119493] ath: regdomain 0x8114 dynamically updated by country eleme=
nt
> [ 4225.178194] wlp58s0: Limiting TX power to 17 dBm as advertised by 00:8=
1:c4:f8:8a:9f
> [ 4262.253656] wlp58s0: disconnect from AP 00:81:c4:f8:8a:9f for new auth=
 to 00:81:c4:f6:24:cf
> [ 4267.545163] ath10k_pci 0000:3a:00.0: failed to flush transmit queue (s=
kip 0 ar-state 1): 0
> [ 4267.552441] wlp58s0: authenticate with 00:81:c4:f6:24:cf
> [ 4267.555476] wlp58s0: send auth to 00:81:c4:f6:24:cf (try 1/3)
> [ 4267.566898] wlp58s0: send auth to 00:81:c4:f6:24:cf (try 2/3)
> [ 4267.581347] wlp58s0: send auth to 00:81:c4:f6:24:cf (try 3/3)
> [ 4267.585996] wlp58s0: authentication with 00:81:c4:f6:24:cf timed out
> [ 4268.004305] wlp58s0: authenticate with 00:81:c4:f6:24:c0
> [ 4268.004367] wlp58s0: 80 MHz not supported, disabling VHT
> [ 4268.086933] wlp58s0: send auth to 00:81:c4:f6:24:c0 (try 1/3)
> [ 4268.088433] wlp58s0: send auth to 00:81:c4:f6:24:c0 (try 2/3)
> [ 4268.090715] wlp58s0: send auth to 00:81:c4:f6:24:c0 (try 3/3)
> [ 4268.092360] wlp58s0: authentication with 00:81:c4:f6:24:c0 timed out
> [ 4268.791793] wlp58s0: authenticate with 00:81:c4:f8:8a:9f
> [ 4268.833616] wlp58s0: send auth to 00:81:c4:f8:8a:9f (try 1/3)
> [ 4268.834862] wlp58s0: send auth to 00:81:c4:f8:8a:9f (try 2/3)
> [ 4268.836109] wlp58s0: send auth to 00:81:c4:f8:8a:9f (try 3/3)
> [ 4268.837222] wlp58s0: authentication with 00:81:c4:f8:8a:9f timed out
> [ 4401.346464] wlp58s0: authenticate with 00:81:c4:7c:a1:ef
> [ 4401.383428] wlp58s0: send auth to 00:81:c4:7c:a1:ef (try 1/3)
> [ 4401.384046] wlp58s0: authenticated
> [ 4401.388200] wlp58s0: associate with 00:81:c4:7c:a1:ef (try 1/3)
> [ 4401.389959] wlp58s0: RX AssocResp from 00:81:c4:7c:a1:ef (capab=3D0x10=
1 status=3D0 aid=3D136)
> [ 4401.393572] wlp58s0: associated
> [ 4401.393845] ath: EEPROM regdomain: 0x8114
> [ 4401.393850] ath: EEPROM indicates we should expect a country code
> [ 4401.393852] ath: doing EEPROM country->regdmn map search
> [ 4401.393869] ath: country maps to regdmn code: 0x37
> [ 4401.393873] ath: Country alpha2 being used: DE
> [ 4401.393876] ath: Regpair used: 0x37
> [ 4401.393879] ath: regdomain 0x8114 dynamically updated by country eleme=
nt
> [ 4401.409747] wlp58s0: Limiting TX power to 17 dBm as advertised by 00:8=
1:c4:7c:a1:ef
> [ 4435.479863] ath10k_pci 0000:3a:00.0: failed to flush transmit queue (s=
kip 0 ar-state 1): 0
> [ 4435.487002] wlp58s0: Connection to AP 00:00:00:00:00:00 lost
> [ 4435.976335] wlp58s0: authenticate with 00:81:c4:7c:a1:e0
> [ 4435.976393] wlp58s0: 80 MHz not supported, disabling VHT
> [ 4436.031137] wlp58s0: send auth to 00:81:c4:7c:a1:e0 (try 1/3)
> [ 4436.033430] wlp58s0: send auth to 00:81:c4:7c:a1:e0 (try 2/3)
> [ 4436.035074] wlp58s0: send auth to 00:81:c4:7c:a1:e0 (try 3/3)
> [ 4436.038570] wlp58s0: authentication with 00:81:c4:7c:a1:e0 timed out
> [ 4436.881404] wlp58s0: authenticate with a4:88:73:86:96:4f
> [ 4436.927562] wlp58s0: send auth to a4:88:73:86:96:4f (try 1/3)
> [ 4436.928860] wlp58s0: send auth to a4:88:73:86:96:4f (try 2/3)
> [ 4436.930116] wlp58s0: send auth to a4:88:73:86:96:4f (try 3/3)
> [ 4436.931391] wlp58s0: authentication with a4:88:73:86:96:4f timed out
> [ 4438.118205] wlp58s0: authenticate with 00:2a:10:09:ad:2f
> [ 4438.155991] wlp58s0: send auth to 00:2a:10:09:ad:2f (try 1/3)
> [ 4438.157395] wlp58s0: send auth to 00:2a:10:09:ad:2f (try 2/3)
> [ 4438.158639] wlp58s0: send auth to 00:2a:10:09:ad:2f (try 3/3)
> [ 4438.159812] wlp58s0: authentication with 00:2a:10:09:ad:2f timed out
> [ 4449.057368] wlp58s0: authenticate with 5c:e1:76:1d:93:ef
> [ 4449.105462] wlp58s0: send auth to 5c:e1:76:1d:93:ef (try 1/3)
> [ 4449.106698] wlp58s0: send auth to 5c:e1:76:1d:93:ef (try 2/3)
> [ 4449.107813] wlp58s0: send auth to 5c:e1:76:1d:93:ef (try 3/3)
> [ 4449.109195] wlp58s0: authentication with 5c:e1:76:1d:93:ef timed out
> [ 4452.120287] wlp58s0: authenticate with 5c:e1:76:1d:a4:ef
> [ 4452.154038] wlp58s0: send auth to 5c:e1:76:1d:a4:ef (try 1/3)
> [ 4452.155275] wlp58s0: authenticated
> [ 4452.159803] wlp58s0: associate with 5c:e1:76:1d:a4:ef (try 1/3)
> [ 4452.163174] wlp58s0: RX AssocResp from 5c:e1:76:1d:a4:ef (capab=3D0x10=
1 status=3D17 aid=3D0)
> [ 4452.163192] wlp58s0: 5c:e1:76:1d:a4:ef denied association (code=3D17)
> [ 4462.817469] wlp58s0: authenticate with 5c:e1:76:1c:86:2f
> [ 4462.854735] wlp58s0: send auth to 5c:e1:76:1c:86:2f (try 1/3)
> [ 4462.855902] wlp58s0: send auth to 5c:e1:76:1c:86:2f (try 2/3)
> [ 4462.857434] wlp58s0: send auth to 5c:e1:76:1c:86:2f (try 3/3)
> [ 4462.858491] wlp58s0: authentication with 5c:e1:76:1c:86:2f timed out
> [ 4473.197662] PM: suspend entry (deep)
> [ 4473.216980] Filesystems sync: 0.019 seconds
> [ 4473.217267] (NULL device *): firmware: direct-loading firmware i915/kb=
l_dmc_ver1_04.bin
> [ 4473.217442] (NULL device *): firmware: direct-loading firmware regulat=
ory.db
> [ 4473.217598] (NULL device *): firmware: direct-loading firmware regulat=
ory.db.p7s
> [ 4473.224024] Freezing user space processes
> [ 4473.227842] Freezing user space processes completed (elapsed 0.003 sec=
onds)
> [ 4473.227847] OOM killer disabled.
> [ 4473.227849] Freezing remaining freezable tasks
> [ 4473.229335] Freezing remaining freezable tasks completed (elapsed 0.00=
1 seconds)
> [ 4473.229398] printk: Suspending console(s) (use no_console_suspend to d=
ebug)
> [ 4473.783377] ACPI: EC: interrupt blocked
> [ 4473.819874] ACPI: PM: Preparing to enter system sleep state S3
> [ 4473.830587] ACPI: EC: event blocked
> [ 4473.830591] ACPI: EC: EC stopped
> [ 4473.830593] ACPI: PM: Saving platform NVS memory
> [ 4473.833884] Disabling non-boot CPUs ...
> [ 4473.836830] smpboot: CPU 1 is now offline
> [ 4473.840293] smpboot: CPU 2 is now offline
> [ 4473.843362] smpboot: CPU 3 is now offline
> [ 4473.852009] ACPI: PM: Low-level resume complete
> [ 4473.852051] ACPI: EC: EC started
> [ 4473.852052] ACPI: PM: Restoring platform NVS memory
> [ 4473.854187] Enabling non-boot CPUs ...
> [ 4473.854212] smpboot: Booting Node 0 Processor 1 APIC 0x2
> [ 4473.854920] CPU1 is up
> [ 4473.854937] smpboot: Booting Node 0 Processor 2 APIC 0x1
> [ 4473.855660] CPU2 is up
> [ 4473.855675] smpboot: Booting Node 0 Processor 3 APIC 0x3
> [ 4473.856343] CPU3 is up
> [ 4473.859247] ACPI: PM: Waking up from system sleep state S3
> [ 4473.892116] ACPI: EC: interrupt unblocked
> [ 4473.892410] pcieport 0000:00:1c.0: Intel SPT PCH root port ACS workaro=
und enabled
> [ 4473.892425] pcieport 0000:00:1d.0: Intel SPT PCH root port ACS workaro=
und enabled
> [ 4473.892425] pcieport 0000:00:1c.4: Intel SPT PCH root port ACS workaro=
und enabled
> [ 4473.933550] DMAR: DRHD: handling fault status reg 2
> [ 4473.933559] DMAR: [INTR-REMAP] Request device [f0:1f.0] fault index 0x=
0 [fault reason 0x25] Blocked a compatibility format interrupt request
> [ 4473.934947] ACPI: EC: event unblocked
> [ 4473.965676] i915 0000:00:02.0: [drm] [ENCODER:94:DDI A/PHY A] is disab=
led/in DSI mode with an ungated DDI clock, gate it
> [ 4473.966363] i915 0000:00:02.0: [drm] [ENCODER:102:DDI B/PHY B] is disa=
bled/in DSI mode with an ungated DDI clock, gate it
> [ 4473.969002] i915 0000:00:02.0: [drm] [ENCODER:113:DDI C/PHY C] is disa=
bled/in DSI mode with an ungated DDI clock, gate it
> [ 4473.971992] nvme nvme0: 4/0/0 default/read/poll queues
> [ 4474.240625] usb 1-3: reset full-speed USB device number 2 using xhci_h=
cd
> [ 4474.516587] usb 1-4: reset full-speed USB device number 3 using xhci_h=
cd
> [ 4474.792566] usb 1-5: reset high-speed USB device number 4 using xhci_h=
cd
> [ 4475.006809] OOM killer enabled.
> [ 4475.006812] Restarting tasks ... done.
> [ 4475.016606] random: crng reseeded on system resumption
> [ 4475.093260] PM: suspend exit
> [ 4475.151090] Process accounting resumed
> [ 4475.216165] bluetooth hci0: firmware: direct-loading firmware qca/ramp=
atch_usb_00000302.bin
> [ 4475.216600] Bluetooth: hci0: using rampatch file: qca/rampatch_usb_000=
00302.bin
> [ 4475.216604] Bluetooth: hci0: QCA: patch rome 0x302 build 0x3e8, firmwa=
re rome 0x302 build 0x111
> [ 4475.315969] mei_hdcp 0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1c54b627f04=
: bound 0000:00:02.0 (ops i915_hdcp_ops [i915])
> [ 4475.578936] bluetooth hci0: firmware: direct-loading firmware qca/nvm_=
usb_00000302.bin
> [ 4475.578982] Bluetooth: hci0: using NVM file: qca/nvm_usb_00000302.bin
> [ 4475.606092] Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection=
 command is advertised, but not supported.
> [ 4475.906723] Bluetooth: MGMT ver 1.22
> [ 4549.113445] wlp58s0: authenticate with 00:81:c4:7c:cf:3f
> [ 4549.154188] wlp58s0: send auth to 00:81:c4:7c:cf:3f (try 1/3)
> [ 4549.154814] wlp58s0: authenticated
> [ 4549.155816] wlp58s0: associate with 00:81:c4:7c:cf:3f (try 1/3)
> [ 4549.157874] wlp58s0: RX AssocResp from 00:81:c4:7c:cf:3f (capab=3D0x10=
1 status=3D0 aid=3D5)
> [ 4549.161383] wlp58s0: associated
> [ 4549.161557] ath: EEPROM regdomain: 0x8114
> [ 4549.161560] ath: EEPROM indicates we should expect a country code
> [ 4549.161561] ath: doing EEPROM country->regdmn map search
> [ 4549.161563] ath: country maps to regdmn code: 0x37
> [ 4549.161564] ath: Country alpha2 being used: DE
> [ 4549.161566] ath: Regpair used: 0x37
> [ 4549.161568] ath: regdomain 0x8114 dynamically updated by country eleme=
nt
> [ 4549.180629] wlp58s0: Limiting TX power to 17 dBm as advertised by 00:8=
1:c4:7c:cf:3f
> [ 4593.439766] ath10k_pci 0000:3a:00.0: failed to flush transmit queue (s=
kip 0 ar-state 1): 0
> [ 4593.447025] wlp58s0: Connection to AP 00:00:00:00:00:00 lost
> [ 4593.729849] wlp58s0: authenticate with 00:81:c4:f8:8c:3f
> [ 4593.775905] wlp58s0: send auth to 00:81:c4:f8:8c:3f (try 1/3)
> [ 4593.776996] wlp58s0: send auth to 00:81:c4:f8:8c:3f (try 2/3)
> [ 4593.778103] wlp58s0: send auth to 00:81:c4:f8:8c:3f (try 3/3)
> [ 4593.779308] wlp58s0: authentication with 00:81:c4:f8:8c:3f timed out
> [ 4599.154528] wlp58s0: authenticate with 00:81:c4:7c:cf:3f
> [ 4599.195340] wlp58s0: send auth to 00:81:c4:7c:cf:3f (try 1/3)
> [ 4599.196500] wlp58s0: send auth to 00:81:c4:7c:cf:3f (try 2/3)
> [ 4599.197582] wlp58s0: send auth to 00:81:c4:7c:cf:3f (try 3/3)
> [ 4599.198810] wlp58s0: authentication with 00:81:c4:7c:cf:3f timed out
> [ 4618.889709] wlp58s0: authenticate with 78:bc:1a:02:dc:4f
> [ 4618.923180] wlp58s0: send auth to 78:bc:1a:02:dc:4f (try 1/3)
> [ 4618.924402] wlp58s0: send auth to 78:bc:1a:02:dc:4f (try 2/3)
> [ 4618.925996] wlp58s0: send auth to 78:bc:1a:02:dc:4f (try 3/3)
> [ 4618.927109] wlp58s0: authentication with 78:bc:1a:02:dc:4f timed out
> [ 4628.444502] wlp58s0: authenticate with 00:f2:8b:87:5f:ff
> [ 4628.480420] wlp58s0: send auth to 00:f2:8b:87:5f:ff (try 1/3)
> [ 4628.481074] wlp58s0: authenticated
> [ 4628.483337] wlp58s0: associate with 00:f2:8b:87:5f:ff (try 1/3)
> [ 4628.485277] wlp58s0: RX AssocResp from 00:f2:8b:87:5f:ff (capab=3D0x10=
1 status=3D0 aid=3D10)
> [ 4628.488528] wlp58s0: associated
> [ 4628.488941] ath: EEPROM regdomain: 0x8114
> [ 4628.488951] ath: EEPROM indicates we should expect a country code
> [ 4628.488954] ath: doing EEPROM country->regdmn map search
> [ 4628.488958] ath: country maps to regdmn code: 0x37
> [ 4628.488963] ath: Country alpha2 being used: DE
> [ 4628.488968] ath: Regpair used: 0x37
> [ 4628.488972] ath: regdomain 0x8114 dynamically updated by country eleme=
nt
> [ 4628.501697] wlp58s0: Limiting TX power to 17 dBm as advertised by 00:f=
2:8b:87:5f:ff
> [ 4671.799751] wlp58s0: deauthenticating from 00:f2:8b:87:5f:ff by local =
choice (Reason: 3=3DDEAUTH_LEAVING)
> [ 4940.810281] wlp58s0: authenticate with 00:81:c4:9d:b4:ef
> [ 4940.856227] wlp58s0: send auth to 00:81:c4:9d:b4:ef (try 1/3)
> [ 4940.857412] wlp58s0: authenticated
> [ 4940.861350] wlp58s0: associate with 00:81:c4:9d:b4:ef (try 1/3)
> [ 4940.866294] wlp58s0: RX AssocResp from 00:81:c4:9d:b4:ef (capab=3D0x10=
1 status=3D0 aid=3D154)
> [ 4940.869790] wlp58s0: associated
> [ 4940.870606] ath: EEPROM regdomain: 0x8114
> [ 4940.870619] ath: EEPROM indicates we should expect a country code
> [ 4940.870626] ath: doing EEPROM country->regdmn map search
> [ 4940.870630] ath: country maps to regdmn code: 0x37
> [ 4940.870636] ath: Country alpha2 being used: DE
> [ 4940.870641] ath: Regpair used: 0x37
> [ 4940.870646] ath: regdomain 0x8114 dynamically updated by country eleme=
nt
> [ 4940.961966] wlp58s0: Limiting TX power to 17 dBm as advertised by 00:8=
1:c4:9d:b4:ef
> [ 4947.969713] wlp58s0: deauthenticating from 00:81:c4:9d:b4:ef by local =
choice (Reason: 3=3DDEAUTH_LEAVING)
> [ 4953.117246] ath10k_pci 0000:3a:00.0: failed to flush transmit queue (s=
kip 0 ar-state 1): 0
> [ 5212.151259] PM: suspend entry (deep)
> [ 5212.161299] Filesystems sync: 0.010 seconds
> [ 5212.161528] (NULL device *): firmware: direct-loading firmware i915/kb=
l_dmc_ver1_04.bin
> [ 5212.161728] (NULL device *): firmware: direct-loading firmware regulat=
ory.db.p7s
> [ 5212.161864] (NULL device *): firmware: direct-loading firmware qca/nvm=
_usb_00000302.bin
> [ 5212.161890] (NULL device *): firmware: direct-loading firmware qca/ram=
patch_usb_00000302.bin
> [ 5212.162018] (NULL device *): firmware: direct-loading firmware regulat=
ory.db
> [ 5212.171978] Freezing user space processes
> [ 5212.175712] Freezing user space processes completed (elapsed 0.003 sec=
onds)
> [ 5212.175723] OOM killer disabled.
> [ 5212.175725] Freezing remaining freezable tasks
> [ 5212.177437] Freezing remaining freezable tasks completed (elapsed 0.00=
1 seconds)
> [ 5212.177542] printk: Suspending console(s) (use no_console_suspend to d=
ebug)
> [ 5212.731805] ACPI: EC: interrupt blocked
> [ 5212.767695] ACPI: PM: Preparing to enter system sleep state S3
> [ 5212.778193] ACPI: EC: event blocked
> [ 5212.778197] ACPI: EC: EC stopped
> [ 5212.778198] ACPI: PM: Saving platform NVS memory
> [ 5212.781203] Disabling non-boot CPUs ...
> [ 5212.783074] smpboot: CPU 1 is now offline
> [ 5212.787759] smpboot: CPU 2 is now offline
> [ 5212.791113] smpboot: CPU 3 is now offline
> [ 5212.797311] ACPI: PM: Low-level resume complete
> [ 5212.797354] ACPI: EC: EC started
> [ 5212.797355] ACPI: PM: Restoring platform NVS memory
> [ 5212.799496] Enabling non-boot CPUs ...
> [ 5212.799526] smpboot: Booting Node 0 Processor 1 APIC 0x2
> [ 5212.800669] CPU1 is up
> [ 5212.800686] smpboot: Booting Node 0 Processor 2 APIC 0x1
> [ 5212.801407] CPU2 is up
> [ 5212.801423] smpboot: Booting Node 0 Processor 3 APIC 0x3
> [ 5212.802079] CPU3 is up
> [ 5212.804991] ACPI: PM: Waking up from system sleep state S3
> [ 5212.835807] ACPI: EC: interrupt unblocked
> [ 5212.836098] pcieport 0000:00:1c.0: Intel SPT PCH root port ACS workaro=
und enabled
> [ 5212.836110] pcieport 0000:00:1c.4: Intel SPT PCH root port ACS workaro=
und enabled
> [ 5212.836111] pcieport 0000:00:1d.0: Intel SPT PCH root port ACS workaro=
und enabled
> [ 5212.887537] DMAR: DRHD: handling fault status reg 2
> [ 5212.887545] DMAR: [INTR-REMAP] Request device [f0:1f.0] fault index 0x=
0 [fault reason 0x25] Blocked a compatibility format interrupt request
> [ 5212.888892] ACPI: EC: event unblocked
> [ 5212.918224] i915 0000:00:02.0: [drm] [ENCODER:94:DDI A/PHY A] is disab=
led/in DSI mode with an ungated DDI clock, gate it
> [ 5212.921062] i915 0000:00:02.0: [drm] [ENCODER:102:DDI B/PHY B] is disa=
bled/in DSI mode with an ungated DDI clock, gate it
> [ 5212.925320] nvme nvme0: 4/0/0 default/read/poll queues
> [ 5212.929244] i915 0000:00:02.0: [drm] [ENCODER:113:DDI C/PHY C] is disa=
bled/in DSI mode with an ungated DDI clock, gate it
> [ 5213.186467] usb 1-3: reset full-speed USB device number 2 using xhci_h=
cd
> [ 5213.462394] usb 1-4: reset full-speed USB device number 3 using xhci_h=
cd
> [ 5213.738460] usb 1-5: reset high-speed USB device number 4 using xhci_h=
cd
> [ 5213.952144] OOM killer enabled.
> [ 5213.952147] Restarting tasks ... done.
> [ 5213.959689] random: crng reseeded on system resumption
> [ 5214.042231] PM: suspend exit
> [ 5214.115192] Process accounting resumed
> [ 5214.158430] Bluetooth: hci0: using rampatch file: qca/rampatch_usb_000=
00302.bin
> [ 5214.158436] Bluetooth: hci0: QCA: patch rome 0x302 build 0x3e8, firmwa=
re rome 0x302 build 0x111
> [ 5214.265189] mei_hdcp 0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1c54b627f04=
: bound 0000:00:02.0 (ops i915_hdcp_ops [i915])
> [ 5214.520139] Bluetooth: hci0: using NVM file: qca/nvm_usb_00000302.bin
> [ 5214.547920] Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection=
 command is advertised, but not supported.
> [ 5214.849387] Bluetooth: MGMT ver 1.22
> [ 5264.170857] wlp58s0: authenticate with 88:71:b1:81:93:1b
> [ 5264.207369] wlp58s0: send auth to 88:71:b1:81:93:1b (try 1/3)
> [ 5264.210352] wlp58s0: authenticated
> [ 5264.213960] wlp58s0: associate with 88:71:b1:81:93:1b (try 1/3)
> [ 5264.247934] wlp58s0: RX AssocResp from 88:71:b1:81:93:1b (capab=3D0x10=
11 status=3D0 aid=3D2)
> [ 5264.251228] wlp58s0: associated
> [ 5264.260991] wlp58s0: Limiting TX power to 23 (23 - 0) dBm as advertise=
d by 88:71:b1:81:93:1b
> [ 6152.262930] wlp58s0: deauthenticating from 88:71:b1:81:93:1b by local =
choice (Reason: 3=3DDEAUTH_LEAVING)
> [ 6157.181927] PM: suspend entry (deep)
> [ 6157.198321] Filesystems sync: 0.016 seconds
> [ 6157.198580] (NULL device *): firmware: direct-loading firmware i915/kb=
l_dmc_ver1_04.bin
> [ 6157.198808] (NULL device *): firmware: direct-loading firmware regulat=
ory.db
> [ 6157.199003] (NULL device *): firmware: direct-loading firmware regulat=
ory.db.p7s
> [ 6157.211013] Freezing user space processes
> [ 6157.216068] Freezing user space processes completed (elapsed 0.005 sec=
onds)
> [ 6157.216076] OOM killer disabled.
> [ 6157.216078] Freezing remaining freezable tasks
> [ 6157.217755] Freezing remaining freezable tasks completed (elapsed 0.00=
1 seconds)
> [ 6157.217879] printk: Suspending console(s) (use no_console_suspend to d=
ebug)
> [ 6157.775071] ACPI: EC: interrupt blocked
> [ 6157.808273] ACPI: PM: Preparing to enter system sleep state S3
> [ 6157.815763] ACPI: EC: event blocked
> [ 6157.815764] ACPI: EC: EC stopped
> [ 6157.815765] ACPI: PM: Saving platform NVS memory
> [ 6157.817280] Disabling non-boot CPUs ...
> [ 6157.818580] smpboot: CPU 1 is now offline
> [ 6157.820718] smpboot: CPU 2 is now offline
> [ 6157.822535] smpboot: CPU 3 is now offline
> [ 6157.829732] ACPI: PM: Low-level resume complete
> [ 6157.829774] ACPI: EC: EC started
> [ 6157.829775] ACPI: PM: Restoring platform NVS memory
> [ 6157.831914] Enabling non-boot CPUs ...
> [ 6157.831938] smpboot: Booting Node 0 Processor 1 APIC 0x2
> [ 6157.832648] CPU1 is up
> [ 6157.832665] smpboot: Booting Node 0 Processor 2 APIC 0x1
> [ 6157.833387] CPU2 is up
> [ 6157.833404] smpboot: Booting Node 0 Processor 3 APIC 0x3
> [ 6157.834061] CPU3 is up
> [ 6157.837027] ACPI: PM: Waking up from system sleep state S3
> [ 6157.867077] ACPI: EC: interrupt unblocked
> [ 6157.867340] pcieport 0000:00:1c.0: Intel SPT PCH root port ACS workaro=
und enabled
> [ 6157.867355] pcieport 0000:00:1c.4: Intel SPT PCH root port ACS workaro=
und enabled
> [ 6157.867356] pcieport 0000:00:1d.0: Intel SPT PCH root port ACS workaro=
und enabled
> [ 6157.909568] DMAR: DRHD: handling fault status reg 2
> [ 6157.909576] DMAR: [INTR-REMAP] Request device [f0:1f.0] fault index 0x=
0 [fault reason 0x25] Blocked a compatibility format interrupt request
> [ 6157.911286] ACPI: EC: event unblocked
> [ 6157.940628] i915 0000:00:02.0: [drm] [ENCODER:94:DDI A/PHY A] is disab=
led/in DSI mode with an ungated DDI clock, gate it
> [ 6157.942353] i915 0000:00:02.0: [drm] [ENCODER:102:DDI B/PHY B] is disa=
bled/in DSI mode with an ungated DDI clock, gate it
> [ 6157.948620] nvme nvme0: 4/0/0 default/read/poll queues
> [ 6157.961736] i915 0000:00:02.0: [drm] [ENCODER:113:DDI C/PHY C] is disa=
bled/in DSI mode with an ungated DDI clock, gate it
> [ 6158.220809] usb 1-4: reset full-speed USB device number 3 using xhci_h=
cd
> [ 6158.496817] usb 1-3: reset full-speed USB device number 2 using xhci_h=
cd
> [ 6158.772785] usb 1-5: reset high-speed USB device number 4 using xhci_h=
cd
> [ 6158.986801] OOM killer enabled.
> [ 6158.986804] Restarting tasks ... done.
> [ 6159.004453] random: crng reseeded on system resumption
> [ 6159.089020] PM: suspend exit
> [ 6159.168666] Process accounting resumed
> [ 6159.198573] bluetooth hci0: firmware: direct-loading firmware qca/ramp=
atch_usb_00000302.bin
> [ 6159.199062] Bluetooth: hci0: using rampatch file: qca/rampatch_usb_000=
00302.bin
> [ 6159.199064] Bluetooth: hci0: QCA: patch rome 0x302 build 0x3e8, firmwa=
re rome 0x302 build 0x111
> [ 6159.292677] mei_hdcp 0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1c54b627f04=
: bound 0000:00:02.0 (ops i915_hdcp_ops [i915])
> [ 6159.574023] bluetooth hci0: firmware: direct-loading firmware qca/nvm_=
usb_00000302.bin
> [ 6159.574062] Bluetooth: hci0: using NVM file: qca/nvm_usb_00000302.bin
> [ 6159.602948] Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection=
 command is advertised, but not supported.
> [ 6159.850840] Bluetooth: MGMT ver 1.22
> [ 6164.604800] wlp58s0: authenticate with 88:71:b1:81:93:1b
> [ 6164.642096] wlp58s0: send auth to 88:71:b1:81:93:1b (try 1/3)
> [ 6164.645025] wlp58s0: authenticated
> [ 6164.648684] wlp58s0: associate with 88:71:b1:81:93:1b (try 1/3)
> [ 6164.666266] wlp58s0: RX AssocResp from 88:71:b1:81:93:1b (capab=3D0x10=
11 status=3D0 aid=3D3)
> [ 6164.669304] wlp58s0: associated
> [ 6164.757798] wlp58s0: Limiting TX power to 23 (23 - 0) dBm as advertise=
d by 88:71:b1:81:93:1b
> [ 6784.088329] wlp58s0: deauthenticating from 88:71:b1:81:93:1b by local =
choice (Reason: 3=3DDEAUTH_LEAVING)
> [ 6814.445642] PM: hibernation: hibernation entry
> [ 6814.445753] (NULL device *): firmware: direct-loading firmware i915/kb=
l_dmc_ver1_04.bin
> [ 6814.446218] (NULL device *): firmware: direct-loading firmware regulat=
ory.db
> [ 6814.446236] (NULL device *): firmware: direct-loading firmware regulat=
ory.db.p7s
> [ 6814.446273] (NULL device *): firmware: direct-loading firmware qca/nvm=
_usb_00000302.bin
> [ 6814.446288] (NULL device *): firmware: direct-loading firmware qca/ram=
patch_usb_00000302.bin
> [ 6814.592994] Filesystems sync: 0.144 seconds
> [ 6814.593450] Freezing user space processes
> [ 6814.600775] Freezing user space processes completed (elapsed 0.007 sec=
onds)
> [ 6814.600789] OOM killer disabled.
> [ 6814.601160] PM: hibernation: Marking nosave pages: [mem 0x00000000-0x0=
0000fff]
> [ 6814.601170] PM: hibernation: Marking nosave pages: [mem 0x00058000-0x0=
0058fff]
> [ 6814.601176] PM: hibernation: Marking nosave pages: [mem 0x0009e000-0x0=
00fffff]
> [ 6814.601188] PM: hibernation: Marking nosave pages: [mem 0x52e59000-0x5=
2e59fff]
> [ 6814.601193] PM: hibernation: Marking nosave pages: [mem 0x52e69000-0x5=
2e69fff]
> [ 6814.601197] PM: hibernation: Marking nosave pages: [mem 0x556ab000-0x5=
56acfff]
> [ 6814.601202] PM: hibernation: Marking nosave pages: [mem 0x62262000-0x6=
23eefff]
> [ 6814.601238] PM: hibernation: Marking nosave pages: [mem 0x64df4000-0x6=
fffefff]
> [ 6814.604926] PM: hibernation: Marking nosave pages: [mem 0x70000000-0x7=
7ffffff]
> [ 6814.606615] PM: hibernation: Marking nosave pages: [mem 0x78600000-0xf=
fffffff]
> [ 6814.635558] PM: hibernation: Basic memory bitmaps created
> [ 6814.635564] PM: hibernation: Preallocating image memory
> [ 6824.573437] PM: hibernation: Allocated 1549021 pages for snapshot
> [ 6824.573442] PM: hibernation: Allocated 6196084 kbytes in 9.93 seconds =
(623.97 MB/s)
> [ 6824.573445] Freezing remaining freezable tasks
> [ 6824.575193] Freezing remaining freezable tasks completed (elapsed 0.00=
1 seconds)
> [ 6824.594005] printk: Suspending console(s) (use no_console_suspend to d=
ebug)
> [ 6825.139501] ACPI: EC: interrupt blocked
> [ 6825.147640] Disabling non-boot CPUs ...
> [ 6825.149272] smpboot: CPU 1 is now offline
> [ 6825.151448] smpboot: CPU 2 is now offline
> [ 6825.153344] smpboot: CPU 3 is now offline
> [ 6825.155625] PM: hibernation: Creating image:
> [ 6825.507970] PM: hibernation: Need to copy 1534014 pages
> [ 6825.507973] PM: hibernation: Normal pages needed: 1534014 + 1024, avai=
lable pages: 2555900
> [ 6826.827436] PM: hibernation: Image created (1211152 pages copied, 3228=
62 zero pages)
> [ 6825.157308] Enabling non-boot CPUs ...
> [ 6825.157333] smpboot: Booting Node 0 Processor 1 APIC 0x2
> [ 6825.158145] CPU1 is up
> [ 6825.158163] smpboot: Booting Node 0 Processor 2 APIC 0x1
> [ 6825.158953] CPU2 is up
> [ 6825.158970] smpboot: Booting Node 0 Processor 3 APIC 0x3
> [ 6825.159682] CPU3 is up
> [ 6825.161495] ACPI: EC: interrupt unblocked
> [ 6825.161962] pcieport 0000:00:1c.0: Intel SPT PCH root port ACS workaro=
und enabled
> [ 6825.162077] pcieport 0000:00:1c.4: Intel SPT PCH root port ACS workaro=
und enabled
> [ 6825.162079] pcieport 0000:00:1d.0: Intel SPT PCH root port ACS workaro=
und enabled
> [ 6825.215901] nvme nvme0: 4/0/0 default/read/poll queues
> [ 6825.788408] PM: Using 3 thread(s) for compression
> [ 6825.788424] PM: Compressing and saving image data (1214149 pages)...
> [ 6825.788497] PM: Image saving progress:   0%
> [ 6825.789159] mei_hdcp 0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1c54b627f04=
: bound 0000:00:02.0 (ops i915_hdcp_ops [i915])
> [ 6826.476834] PM: Image saving progress:  10%
> [ 6827.139791] PM: Image saving progress:  20%
> [ 6827.766047] PM: Image saving progress:  30%
> [ 6828.399857] PM: Image saving progress:  40%
> [ 6829.019935] PM: Image saving progress:  50%
> [ 6829.689384] PM: Image saving progress:  60%
> [ 6830.385422] PM: Image saving progress:  70%
> [ 6831.109954] PM: Image saving progress:  80%
> [ 6831.711660] PM: Image saving progress:  90%
> [ 6832.216789] PM: Image saving progress: 100%
> [ 6832.217287] PM: Image saving done
> [ 6832.217289] PM: hibernation: Wrote 4856596 kbytes in 6.42 seconds (756=
=2E47 MB/s)
> [ 6832.217356] PM: S|
> [ 6832.431501] printk: Suspending console(s) (use no_console_suspend to d=
ebug)
> [ 6832.970827] ACPI: EC: interrupt blocked
> [ 6833.007279] ACPI: PM: Preparing to enter system sleep state S3
> [ 6833.015163] ACPI: EC: event blocked
> [ 6833.015167] ACPI: EC: EC stopped
> [ 6833.015169] ACPI: PM: Saving platform NVS memory
> [ 6833.018446] Disabling non-boot CPUs ...
> [ 6833.020348] smpboot: CPU 1 is now offline
> [ 6833.024552] smpboot: CPU 2 is now offline
> [ 6833.027668] smpboot: CPU 3 is now offline
> [ 6833.035512] ACPI: PM: Low-level resume complete
> [ 6833.035554] ACPI: EC: EC started
> [ 6833.035555] ACPI: PM: Restoring platform NVS memory
> [ 6833.037678] Enabling non-boot CPUs ...
> [ 6833.037703] smpboot: Booting Node 0 Processor 1 APIC 0x2
> [ 6833.038424] CPU1 is up
> [ 6833.038441] smpboot: Booting Node 0 Processor 2 APIC 0x1
> [ 6833.039174] CPU2 is up
> [ 6833.039190] smpboot: Booting Node 0 Processor 3 APIC 0x3
> [ 6833.039858] CPU3 is up
> [ 6833.042762] ACPI: PM: Waking up from system sleep state S3
> [ 6833.071478] ACPI: EC: interrupt unblocked
> [ 6833.072125] pcieport 0000:00:1c.0: Intel SPT PCH root port ACS workaro=
und enabled
> [ 6833.072238] pcieport 0000:00:1c.4: Intel SPT PCH root port ACS workaro=
und enabled
> [ 6833.072280] pcieport 0000:00:1d.0: Intel SPT PCH root port ACS workaro=
und enabled
> [ 6833.129668] ACPI: EC: event unblocked
> [ 6833.167504] i915 0000:00:02.0: [drm] [ENCODER:94:DDI A/PHY A] is disab=
led/in DSI mode with an ungated DDI clock, gate it
> [ 6833.174968] nvme nvme0: 4/0/0 default/read/poll queues
> [ 6833.202296] i915 0000:00:02.0: [drm] [ENCODER:102:DDI B/PHY B] is disa=
bled/in DSI mode with an ungated DDI clock, gate it
> [ 6833.210018] i915 0000:00:02.0: [drm] [ENCODER:113:DDI C/PHY C] is disa=
bled/in DSI mode with an ungated DDI clock, gate it
> [ 6833.444013] usb 1-4: reset full-speed USB device number 3 using xhci_h=
cd
> [ 6833.720021] usb 1-3: reset full-speed USB device number 2 using xhci_h=
cd
> [ 6834.000001] usb 1-5: reset high-speed USB device number 4 using xhci_h=
cd
> [ 6834.304928] PM: hibernation: Basic memory bitmaps freed
> [ 6834.305296] OOM killer enabled.
> [ 6834.305310] Restarting tasks ... done.
> [ 6834.465631] PM: hibernation: hibernation exit
> [ 6834.466412] Bluetooth: hci0: using rampatch file: qca/rampatch_usb_000=
00302.bin
> [ 6834.466415] Bluetooth: hci0: QCA: patch rome 0x302 build 0x3e8, firmwa=
re rome 0x302 build 0x111
> [ 6834.491361] mei_hdcp 0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1c54b627f04=
: bound 0000:00:02.0 (ops i915_hdcp_ops [i915])
> [ 6834.609625] Process accounting resumed
> [ 6834.825028] Bluetooth: hci0: using NVM file: qca/nvm_usb_00000302.bin
> [ 6834.853492] Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection=
 command is advertised, but not supported.
> [ 6839.782643] wlp58s0: authenticate with 88:71:b1:81:93:1b
> [ 6839.822419] wlp58s0: send auth to 88:71:b1:81:93:1b (try 1/3)
> [ 6839.826947] wlp58s0: authenticated
> [ 6839.831719] wlp58s0: associate with 88:71:b1:81:93:1b (try 1/3)
> [ 6839.852298] wlp58s0: RX AssocResp from 88:71:b1:81:93:1b (capab=3D0x10=
11 status=3D0 aid=3D3)
> [ 6839.854831] wlp58s0: associated
> [ 6839.943967] wlp58s0: Limiting TX power to 23 (23 - 0) dBm as advertise=
d by 88:71:b1:81:93:1b
> [10604.870486] wlp58s0: deauthenticating from 88:71:b1:81:93:1b by local =
choice (Reason: 3=3DDEAUTH_LEAVING)
> [10609.151780] PM: suspend entry (deep)
> [10609.160982] Filesystems sync: 0.009 seconds
> [10609.164173] (NULL device *): firmware: direct-loading firmware regulat=
ory.db
> [10609.164350] (NULL device *): firmware: direct-loading firmware regulat=
ory.db.p7s
> [10609.164754] (NULL device *): firmware: direct-loading firmware i915/kb=
l_dmc_ver1_04.bin
> [10609.168514] Freezing user space processes
> [10609.172937] Freezing user space processes completed (elapsed 0.004 sec=
onds)
> [10609.172943] OOM killer disabled.
> [10609.172945] Freezing remaining freezable tasks
> [10609.174555] Freezing remaining freezable tasks completed (elapsed 0.00=
1 seconds)
> [10609.174620] printk: Suspending console(s) (use no_console_suspend to d=
ebug)
> [10609.737605] ACPI: EC: interrupt blocked
> [10609.773365] ACPI: PM: Preparing to enter system sleep state S3
> [10609.783967] ACPI: EC: event blocked
> [10609.783971] ACPI: EC: EC stopped
> [10609.783973] ACPI: PM: Saving platform NVS memory
> [10609.787283] Disabling non-boot CPUs ...
> [10609.790290] smpboot: CPU 1 is now offline
> [10609.794560] smpboot: CPU 2 is now offline
> [10609.798222] smpboot: CPU 3 is now offline
> [10609.807205] ACPI: PM: Low-level resume complete
> [10609.807247] ACPI: EC: EC started
> [10609.807247] ACPI: PM: Restoring platform NVS memory
> [10609.809388] Enabling non-boot CPUs ...
> [10609.809413] smpboot: Booting Node 0 Processor 1 APIC 0x2
> [10609.810120] CPU1 is up
> [10609.810137] smpboot: Booting Node 0 Processor 2 APIC 0x1
> [10609.810850] CPU2 is up
> [10609.810866] smpboot: Booting Node 0 Processor 3 APIC 0x3
> [10609.811514] CPU3 is up
> [10609.814434] ACPI: PM: Waking up from system sleep state S3
> [10609.847390] ACPI: EC: interrupt unblocked
> [10609.847825] pcieport 0000:00:1c.0: Intel SPT PCH root port ACS workaro=
und enabled
> [10609.847882] pcieport 0000:00:1c.4: Intel SPT PCH root port ACS workaro=
und enabled
> [10609.847885] pcieport 0000:00:1d.0: Intel SPT PCH root port ACS workaro=
und enabled
> [10609.870815] DMAR: DRHD: handling fault status reg 2
> [10609.870822] DMAR: [INTR-REMAP] Request device [f0:1f.0] fault index 0x=
0 [fault reason 0x25] Blocked a compatibility format interrupt request
> [10609.872292] ACPI: EC: event unblocked
> [10609.905664] i915 0000:00:02.0: [drm] [ENCODER:94:DDI A/PHY A] is disab=
led/in DSI mode with an ungated DDI clock, gate it
> [10609.909830] i915 0000:00:02.0: [drm] [ENCODER:102:DDI B/PHY B] is disa=
bled/in DSI mode with an ungated DDI clock, gate it
> [10609.913326] nvme nvme0: 4/0/0 default/read/poll queues
> [10609.919118] i915 0000:00:02.0: [drm] [ENCODER:113:DDI C/PHY C] is disa=
bled/in DSI mode with an ungated DDI clock, gate it
> [10610.170125] usb 1-3: reset full-speed USB device number 2 using xhci_h=
cd
> [10610.446101] usb 1-5: reset high-speed USB device number 4 using xhci_h=
cd
> [10610.722016] usb 1-4: reset full-speed USB device number 3 using xhci_h=
cd
> [10611.132441] OOM killer enabled.
> [10611.132443] Restarting tasks ... done.
> [10611.144831] random: crng reseeded on system resumption
> [10611.230640] PM: suspend exit
> [10611.271022] mei_hdcp 0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1c54b627f04=
: bound 0000:00:02.0 (ops i915_hdcp_ops [i915])
> [10611.327290] Process accounting resumed
> [10611.344700] bluetooth hci0: firmware: direct-loading firmware qca/ramp=
atch_usb_00000302.bin
> [10611.345098] Bluetooth: hci0: using rampatch file: qca/rampatch_usb_000=
00302.bin
> [10611.345101] Bluetooth: hci0: QCA: patch rome 0x302 build 0x3e8, firmwa=
re rome 0x302 build 0x111
> [10611.705724] bluetooth hci0: firmware: direct-loading firmware qca/nvm_=
usb_00000302.bin
> [10611.705811] Bluetooth: hci0: using NVM file: qca/nvm_usb_00000302.bin
> [10611.735593] Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection=
 command is advertised, but not supported.
> [10616.788715] wlp58s0: authenticate with 88:71:b1:81:93:1b
> [10616.825078] wlp58s0: send auth to 88:71:b1:81:93:1b (try 1/3)
> [10616.828299] wlp58s0: authenticated
> [10616.829807] wlp58s0: associate with 88:71:b1:81:93:1b (try 1/3)
> [10616.861607] wlp58s0: RX AssocResp from 88:71:b1:81:93:1b (capab=3D0x10=
11 status=3D0 aid=3D3)
> [10616.864472] wlp58s0: associated
> [10616.918021] wlp58s0: Limiting TX power to 23 (23 - 0) dBm as advertise=
d by 88:71:b1:81:93:1b
> [12213.326914] wlp58s0: deauthenticating from 88:71:b1:81:93:1b by local =
choice (Reason: 3=3DDEAUTH_LEAVING)
> [12218.209174] PM: suspend entry (deep)
> [12218.227387] Filesystems sync: 0.018 seconds
> [12218.227701] (NULL device *): firmware: direct-loading firmware i915/kb=
l_dmc_ver1_04.bin
> [12218.227891] (NULL device *): firmware: direct-loading firmware regulat=
ory.db
> [12218.228074] (NULL device *): firmware: direct-loading firmware regulat=
ory.db.p7s
> [12218.228140] (NULL device *): firmware: direct-loading firmware qca/ram=
patch_usb_00000302.bin
> [12218.228183] (NULL device *): firmware: direct-loading firmware qca/nvm=
_usb_00000302.bin
> [12218.234339] Freezing user space processes
> [12218.238487] Freezing user space processes completed (elapsed 0.004 sec=
onds)
> [12218.238493] OOM killer disabled.
> [12218.238494] Freezing remaining freezable tasks
> [12218.239921] Freezing remaining freezable tasks completed (elapsed 0.00=
1 seconds)
> [12218.239979] printk: Suspending console(s) (use no_console_suspend to d=
ebug)
> [12218.798288] ACPI: EC: interrupt blocked
> [12218.833474] ACPI: PM: Preparing to enter system sleep state S3
> [12218.840930] ACPI: EC: event blocked
> [12218.840931] ACPI: EC: EC stopped
> [12218.840932] ACPI: PM: Saving platform NVS memory
> [12218.842433] Disabling non-boot CPUs ...
> [12218.843715] smpboot: CPU 1 is now offline
> [12218.846205] smpboot: CPU 2 is now offline
> [12218.848599] smpboot: CPU 3 is now offline
> [12218.856461] ACPI: PM: Low-level resume complete
> [12218.856504] ACPI: EC: EC started
> [12218.856504] ACPI: PM: Restoring platform NVS memory
> [12218.858624] Enabling non-boot CPUs ...
> [12218.858655] smpboot: Booting Node 0 Processor 1 APIC 0x2
> [12218.859771] CPU1 is up
> [12218.859789] smpboot: Booting Node 0 Processor 2 APIC 0x1
> [12218.860509] CPU2 is up
> [12218.860526] smpboot: Booting Node 0 Processor 3 APIC 0x3
> [12218.861176] CPU3 is up
> [12218.864124] ACPI: PM: Waking up from system sleep state S3
> [12218.902821] ACPI: EC: interrupt unblocked
> [12218.903061] pcieport 0000:00:1c.4: Intel SPT PCH root port ACS workaro=
und enabled
> [12218.903067] pcieport 0000:00:1c.0: Intel SPT PCH root port ACS workaro=
und enabled
> [12218.903068] pcieport 0000:00:1d.0: Intel SPT PCH root port ACS workaro=
und enabled
> [12218.931015] DMAR: DRHD: handling fault status reg 2
> [12218.931022] DMAR: [INTR-REMAP] Request device [f0:1f.0] fault index 0x=
0 [fault reason 0x25] Blocked a compatibility format interrupt request
> [12218.932578] ACPI: EC: event unblocked
> [12218.975433] i915 0000:00:02.0: [drm] [ENCODER:94:DDI A/PHY A] is disab=
led/in DSI mode with an ungated DDI clock, gate it
> [12218.980486] i915 0000:00:02.0: [drm] [ENCODER:102:DDI B/PHY B] is disa=
bled/in DSI mode with an ungated DDI clock, gate it
> [12218.981652] nvme nvme0: 4/0/0 default/read/poll queues
> [12218.992748] i915 0000:00:02.0: [drm] [ENCODER:113:DDI C/PHY C] is disa=
bled/in DSI mode with an ungated DDI clock, gate it
> [12219.318161] usb 1-3: reset full-speed USB device number 2 using xhci_h=
cd
> [12219.593988] usb 1-4: reset full-speed USB device number 3 using xhci_h=
cd
> [12219.870088] usb 1-5: reset high-speed USB device number 4 using xhci_h=
cd
> [12220.087432] OOM killer enabled.
> [12220.087435] Restarting tasks ... done.
> [12220.095174] random: crng reseeded on system resumption
> [12220.235442] PM: suspend exit
> [12220.292108] Bluetooth: hci0: using rampatch file: qca/rampatch_usb_000=
00302.bin
> [12220.292124] Bluetooth: hci0: QCA: patch rome 0x302 build 0x3e8, firmwa=
re rome 0x302 build 0x111
> [12220.310947] mei_hdcp 0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1c54b627f04=
: bound 0000:00:02.0 (ops i915_hdcp_ops [i915])
> [12220.330481] Process accounting resumed
> [12220.652418] Bluetooth: hci0: using NVM file: qca/nvm_usb_00000302.bin
> [12220.679601] Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection=
 command is advertised, but not supported.
> [12224.785791] ucsi_acpi USBC000:00: ucsi_handle_connector_change: ACK fa=
iled (-110)
> [12224.785793] ucsi_acpi USBC000:00: failed to re-enable notifications (-=
110)
> [12225.789482] wlp58s0: authenticate with 88:71:b1:81:93:1b
> [12225.823148] wlp58s0: send auth to 88:71:b1:81:93:1b (try 1/3)
> [12225.825710] wlp58s0: authenticated
> [12225.833780] wlp58s0: associate with 88:71:b1:81:93:1b (try 1/3)
> [12225.857506] wlp58s0: RX AssocResp from 88:71:b1:81:93:1b (capab=3D0x10=
11 status=3D0 aid=3D3)
> [12225.860202] wlp58s0: associated
> [12225.922375] wlp58s0: Limiting TX power to 30 (30 - 0) dBm as advertise=
d by 88:71:b1:81:93:1b
> [12798.057628] wlp58s0: deauthenticating from 88:71:b1:81:93:1b by local =
choice (Reason: 3=3DDEAUTH_LEAVING)
> [12801.156554] PM: hibernation: hibernation entry
> [12801.156768] (NULL device *): firmware: direct-loading firmware i915/kb=
l_dmc_ver1_04.bin
> [12801.157824] (NULL device *): firmware: direct-loading firmware regulat=
ory.db
> [12801.157884] (NULL device *): firmware: direct-loading firmware regulat=
ory.db.p7s
> [12801.170769] Filesystems sync: 0.010 seconds
> [12801.170849] Freezing user space processes
> [12801.173412] Freezing user space processes completed (elapsed 0.002 sec=
onds)
> [12801.173416] OOM killer disabled.
> [12801.173512] PM: hibernation: Marking nosave pages: [mem 0x00000000-0x0=
0000fff]
> [12801.173514] PM: hibernation: Marking nosave pages: [mem 0x00058000-0x0=
0058fff]
> [12801.173515] PM: hibernation: Marking nosave pages: [mem 0x0009e000-0x0=
00fffff]
> [12801.173518] PM: hibernation: Marking nosave pages: [mem 0x52e59000-0x5=
2e59fff]
> [12801.173519] PM: hibernation: Marking nosave pages: [mem 0x52e69000-0x5=
2e69fff]
> [12801.173520] PM: hibernation: Marking nosave pages: [mem 0x556ab000-0x5=
56acfff]
> [12801.173521] PM: hibernation: Marking nosave pages: [mem 0x62262000-0x6=
23eefff]
> [12801.173530] PM: hibernation: Marking nosave pages: [mem 0x64df4000-0x6=
fffefff]
> [12801.174370] PM: hibernation: Marking nosave pages: [mem 0x70000000-0x7=
7ffffff]
> [12801.174765] PM: hibernation: Marking nosave pages: [mem 0x78600000-0xf=
fffffff]
> [12801.181579] PM: hibernation: Basic memory bitmaps created
> [12801.181581] PM: hibernation: Preallocating image memory
> [12807.106255] PM: hibernation: Allocated 1560527 pages for snapshot
> [12807.106261] PM: hibernation: Allocated 6242108 kbytes in 5.92 seconds =
(1054.41 MB/s)
> [12807.106263] Freezing remaining freezable tasks
> [12807.107960] Freezing remaining freezable tasks completed (elapsed 0.00=
1 seconds)
> [12807.126570] printk: Suspending console(s) (use no_console_suspend to d=
ebug)
> [12807.672561] ACPI: EC: interrupt blocked
> [12807.680504] Disabling non-boot CPUs ...
> [12807.682638] smpboot: CPU 1 is now offline
> [12807.687198] smpboot: CPU 2 is now offline
> [12807.689642] smpboot: CPU 3 is now offline
> [12807.691532] PM: hibernation: Creating image:
> [12808.042100] PM: hibernation: Need to copy 1538524 pages
> [12808.042102] PM: hibernation: Normal pages needed: 1538524 + 1024, avai=
lable pages: 2551389
> [12809.342464] PM: hibernation: Image created (1029123 pages copied, 5094=
01 zero pages)
> [12807.692610] Enabling non-boot CPUs ...
> [12807.692636] smpboot: Booting Node 0 Processor 1 APIC 0x2
> [12807.693320] CPU1 is up
> [12807.693336] smpboot: Booting Node 0 Processor 2 APIC 0x1
> [12807.694047] CPU2 is up
> [12807.694064] smpboot: Booting Node 0 Processor 3 APIC 0x3
> [12807.694710] CPU3 is up
> [12807.696452] ACPI: EC: interrupt unblocked
> [12807.696710] pcieport 0000:00:1c.0: Intel SPT PCH root port ACS workaro=
und enabled
> [12807.696732] pcieport 0000:00:1d.0: Intel SPT PCH root port ACS workaro=
und enabled
> [12807.696772] pcieport 0000:00:1c.4: Intel SPT PCH root port ACS workaro=
und enabled
> [12807.735217] DMAR: DRHD: handling fault status reg 2
> [12807.735222] DMAR: [DMA Write NO_PASID] Request device [3b:00.0] fault =
addr 0x0 [fault reason 0x05] PTE Write access is not set
> [12807.735521] DMAR: DRHD: handling fault status reg 2
> [12807.735525] DMAR: [DMA Write NO_PASID] Request device [3b:00.0] fault =
addr 0x0 [fault reason 0x05] PTE Write access is not set
> [12807.736094] DMAR: DRHD: handling fault status reg 2
> [12807.736096] DMAR: [DMA Write NO_PASID] Request device [3b:00.0] fault =
addr 0x0 [fault reason 0x05] PTE Write access is not set
> [12807.736726] DMAR: DRHD: handling fault status reg 2
> [12807.738329] nvme nvme0: 4/0/0 default/read/poll queues
> [12808.241536] PM: Using 3 thread(s) for compression
> [12808.241547] PM: Compressing and saving image data (1032128 pages)...
> [12808.241315] mei_hdcp 0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1c54b627f04=
: bound 0000:00:02.0 (ops i915_hdcp_ops [i915])
> [12808.241617] PM: Image saving progress:   0%
> [12808.763807] PM: Image saving progress:  10%
> [12809.323926] PM: Image saving progress:  20%
> [12810.061757] PM: Image saving progress:  30%
> [12810.518599] PM: Image saving progress:  40%
> [12810.971699] PM: Image saving progress:  50%
> [12811.424603] PM: Image saving progress:  60%
> [12811.892109] PM: Image saving progress:  70%
> [12812.262130] PM: Image saving progress:  80%
> [12812.610698] PM: Image saving progress:  90%
> [12812.948884] PM: Image saving progress: 100%
> [12812.949142] PM: Image saving done
> [12812.949143] PM: hibernation: Wrote 4128512 kbytes in 4.70 seconds (878=
=2E40 MB/s)
> [12812.949214] PM: S|
> [12813.162629] printk: Suspending console(s) (use no_console_suspend to d=
ebug)
> [12813.268196] dmar_fault: 23 callbacks suppressed
> [12813.268206] DMAR: DRHD: handling fault status reg 2
> [12813.268212] DMAR: [DMA Write NO_PASID] Request device [3b:00.0] fault =
addr 0x0 [fault reason 0x05] PTE Write access is not set
> [12813.268443] DMAR: DRHD: handling fault status reg 2
> [12813.268449] DMAR: [DMA Write NO_PASID] Request device [3b:00.0] fault =
addr 0x0 [fault reason 0x05] PTE Write access is not set
> [12813.268767] DMAR: DRHD: handling fault status reg 2
> [12813.268772] DMAR: [DMA Write NO_PASID] Request device [3b:00.0] fault =
addr 0x0 [fault reason 0x05] PTE Write access is not set
> [12813.269011] DMAR: DRHD: handling fault status reg 2
> [12813.695554] ACPI: EC: interrupt blocked
> [12813.731482] ACPI: PM: Preparing to enter system sleep state S3
> [12813.739145] ACPI: EC: event blocked
> [12813.739148] ACPI: EC: EC stopped
> [12813.739149] ACPI: PM: Saving platform NVS memory
> [12813.741810] Disabling non-boot CPUs ...
> [12813.744389] smpboot: CPU 1 is now offline
> [12813.749114] smpboot: CPU 2 is now offline
> [12813.751764] smpboot: CPU 3 is now offline
> [12813.759617] ACPI: PM: Low-level resume complete
> [12813.759659] ACPI: EC: EC started
> [12813.759660] ACPI: PM: Restoring platform NVS memory
> [12813.761793] Enabling non-boot CPUs ...
> [12813.761816] smpboot: Booting Node 0 Processor 1 APIC 0x2
> [12813.762532] CPU1 is up
> [12813.762549] smpboot: Booting Node 0 Processor 2 APIC 0x1
> [12813.763283] CPU2 is up
> [12813.763298] smpboot: Booting Node 0 Processor 3 APIC 0x3
> [12813.763968] CPU3 is up
> [12813.766878] ACPI: PM: Waking up from system sleep state S3
> [12813.794657] ACPI: EC: interrupt unblocked
> [12813.795132] pcieport 0000:00:1c.0: Intel SPT PCH root port ACS workaro=
und enabled
> [12813.795231] pcieport 0000:00:1c.4: Intel SPT PCH root port ACS workaro=
und enabled
> [12813.795246] pcieport 0000:00:1d.0: Intel SPT PCH root port ACS workaro=
und enabled
> [12813.870928] ACPI: EC: event unblocked
> [12813.903687] i915 0000:00:02.0: [drm] [ENCODER:94:DDI A/PHY A] is disab=
led/in DSI mode with an ungated DDI clock, gate it
> [12813.909656] nvme nvme0: 4/0/0 default/read/poll queues
> [12813.934486] i915 0000:00:02.0: [drm] [ENCODER:102:DDI B/PHY B] is disa=
bled/in DSI mode with an ungated DDI clock, gate it
> [12813.936750] i915 0000:00:02.0: [drm] [ENCODER:113:DDI C/PHY C] is disa=
bled/in DSI mode with an ungated DDI clock, gate it
> [12814.220135] usb 1-4: reset full-speed USB device number 3 using xhci_h=
cd
> [12814.508120] usb 1-3: reset full-speed USB device number 2 using xhci_h=
cd
> [12814.784202] usb 1-5: reset high-speed USB device number 4 using xhci_h=
cd
> [12815.038600] PM: hibernation: Basic memory bitmaps freed
> [12815.038945] OOM killer enabled.
> [12815.038946] Restarting tasks ... done.
> [12815.217687] mei_hdcp 0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1c54b627f04=
: bound 0000:00:02.0 (ops i915_hdcp_ops [i915])
> [12815.241721] PM: hibernation: hibernation exit
> [12815.246521] bluetooth hci0: firmware: direct-loading firmware qca/ramp=
atch_usb_00000302.bin
> [12815.247498] Bluetooth: hci0: using rampatch file: qca/rampatch_usb_000=
00302.bin
> [12815.247507] Bluetooth: hci0: QCA: patch rome 0x302 build 0x3e8, firmwa=
re rome 0x302 build 0x111
> [12815.399120] Process accounting resumed
> [12815.606814] bluetooth hci0: firmware: direct-loading firmware qca/nvm_=
usb_00000302.bin
> [12815.606885] Bluetooth: hci0: using NVM file: qca/nvm_usb_00000302.bin
> [12815.633764] Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection=
 command is advertised, but not supported.
> [12820.490857] wlp58s0: authenticate with 88:71:b1:81:93:1b
> [12820.523580] wlp58s0: send auth to 88:71:b1:81:93:1b (try 1/3)
> [12820.527718] wlp58s0: authenticated
> [12820.531900] wlp58s0: associate with 88:71:b1:81:93:1b (try 1/3)
> [12820.569623] wlp58s0: RX AssocResp from 88:71:b1:81:93:1b (capab=3D0x10=
11 status=3D0 aid=3D3)
> [12820.572447] wlp58s0: associated
> [12820.585452] wlp58s0: Limiting TX power to 30 (30 - 0) dBm as advertise=
d by 88:71:b1:81:93:1b
> [13017.991160] wlp58s0: deauthenticating from 88:71:b1:81:93:1b by local =
choice (Reason: 3=3DDEAUTH_LEAVING)
> [13022.218162] PM: suspend entry (deep)
> [13022.227046] Filesystems sync: 0.008 seconds
> [13022.227269] (NULL device *): firmware: direct-loading firmware qca/ram=
patch_usb_00000302.bin
> [13022.227342] (NULL device *): firmware: direct-loading firmware qca/nvm=
_usb_00000302.bin
> [13022.227776] (NULL device *): firmware: direct-loading firmware i915/kb=
l_dmc_ver1_04.bin
> [13022.228011] (NULL device *): firmware: direct-loading firmware regulat=
ory.db
> [13022.228078] (NULL device *): firmware: direct-loading firmware regulat=
ory.db.p7s
> [13022.229434] Freezing user space processes
> [13022.232257] Freezing user space processes completed (elapsed 0.002 sec=
onds)
> [13022.232260] OOM killer disabled.
> [13022.232261] Freezing remaining freezable tasks
> [13022.233721] Freezing remaining freezable tasks completed (elapsed 0.00=
1 seconds)
> [13022.233767] printk: Suspending console(s) (use no_console_suspend to d=
ebug)
> [13022.827022] ACPI: EC: interrupt blocked
> [13022.862473] ACPI: PM: Preparing to enter system sleep state S3
> [13022.869826] ACPI: EC: event blocked
> [13022.869827] ACPI: EC: EC stopped
> [13022.869827] ACPI: PM: Saving platform NVS memory
> [13022.871380] Disabling non-boot CPUs ...
> [13022.872652] smpboot: CPU 1 is now offline
> [13022.875307] smpboot: CPU 2 is now offline
> [13022.877666] smpboot: CPU 3 is now offline
> [13022.885358] ACPI: PM: Low-level resume complete
> [13022.885400] ACPI: EC: EC started
> [13022.885401] ACPI: PM: Restoring platform NVS memory
> [13022.887516] Enabling non-boot CPUs ...
> [13022.887546] smpboot: Booting Node 0 Processor 1 APIC 0x2
> [13022.888265] CPU1 is up
> [13022.888283] smpboot: Booting Node 0 Processor 2 APIC 0x1
> [13022.889016] CPU2 is up
> [13022.889031] smpboot: Booting Node 0 Processor 3 APIC 0x3
> [13022.889692] CPU3 is up
> [13022.892605] ACPI: PM: Waking up from system sleep state S3
> [13022.929877] ACPI: EC: interrupt unblocked
> [13022.930242] pcieport 0000:00:1c.0: Intel SPT PCH root port ACS workaro=
und enabled
> [13022.930251] pcieport 0000:00:1c.4: Intel SPT PCH root port ACS workaro=
und enabled
> [13022.930255] pcieport 0000:00:1d.0: Intel SPT PCH root port ACS workaro=
und enabled
> [13022.952045] dmar_fault: 17 callbacks suppressed
> [13022.952050] DMAR: DRHD: handling fault status reg 2
> [13022.952053] DMAR: [INTR-REMAP] Request device [f0:1f.0] fault index 0x=
0 [fault reason 0x25] Blocked a compatibility format interrupt request
> [13022.953278] ACPI: EC: event unblocked
> [13022.971509] i915 0000:00:02.0: [drm] [ENCODER:94:DDI A/PHY A] is disab=
led/in DSI mode with an ungated DDI clock, gate it
> [13022.972832] i915 0000:00:02.0: [drm] [ENCODER:102:DDI B/PHY B] is disa=
bled/in DSI mode with an ungated DDI clock, gate it
> [13022.979677] i915 0000:00:02.0: [drm] [ENCODER:113:DDI C/PHY C] is disa=
bled/in DSI mode with an ungated DDI clock, gate it
> [13022.979728] nvme nvme0: 4/0/0 default/read/poll queues
> [13023.239039] usb 1-5: reset high-speed USB device number 4 using xhci_h=
cd
> [13023.515067] usb 1-4: reset full-speed USB device number 3 using xhci_h=
cd
> [13023.791182] usb 1-3: reset full-speed USB device number 2 using xhci_h=
cd
> [13023.942205] OOM killer enabled.
> [13023.942207] Restarting tasks ... done.
> [13023.948055] random: crng reseeded on system resumption
> [13023.993888] PM: suspend exit
> [13024.061834] Process accounting resumed
> [13024.146617] Bluetooth: hci0: using rampatch file: qca/rampatch_usb_000=
00302.bin
> [13024.146624] Bluetooth: hci0: QCA: patch rome 0x302 build 0x3e8, firmwa=
re rome 0x302 build 0x111
> [13024.344742] mei_hdcp 0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1c54b627f04=
: bound 0000:00:02.0 (ops i915_hdcp_ops [i915])
> [13024.504889] Bluetooth: hci0: using NVM file: qca/nvm_usb_00000302.bin
> [13024.532593] Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection=
 command is advertised, but not supported.
> [13052.467555] PM: suspend entry (deep)
> [13052.484339] Filesystems sync: 0.016 seconds
> [13052.484456] (NULL device *): firmware: direct-loading firmware i915/kb=
l_dmc_ver1_04.bin
> [13052.484544] (NULL device *): firmware: direct-loading firmware regulat=
ory.db.p7s
> [13052.484580] (NULL device *): firmware: direct-loading firmware regulat=
ory.db
> [13052.487986] Freezing user space processes
> [13052.542784] Freezing user space processes completed (elapsed 0.054 sec=
onds)
> [13052.542789] OOM killer disabled.
> [13052.542789] Freezing remaining freezable tasks
> [13052.544137] Freezing remaining freezable tasks completed (elapsed 0.00=
1 seconds)
> [13052.544193] printk: Suspending console(s) (use no_console_suspend to d=
ebug)
> [13053.098132] ACPI: EC: interrupt blocked
> [13053.130866] ACPI: PM: Preparing to enter system sleep state S3
> [13053.142138] ACPI: EC: event blocked
> [13053.142142] ACPI: EC: EC stopped
> [13053.142144] ACPI: PM: Saving platform NVS memory
> [13053.145632] Disabling non-boot CPUs ...
> [13053.147778] smpboot: CPU 1 is now offline
> [13053.152271] smpboot: CPU 2 is now offline
> [13053.157197] smpboot: CPU 3 is now offline
> [13053.164998] ACPI: PM: Low-level resume complete
> [13053.165040] ACPI: EC: EC started
> [13053.165041] ACPI: PM: Restoring platform NVS memory
> [13053.167167] Enabling non-boot CPUs ...
> [13053.167191] smpboot: Booting Node 0 Processor 1 APIC 0x2
> [13053.167909] CPU1 is up
> [13053.167927] smpboot: Booting Node 0 Processor 2 APIC 0x1
> [13053.168660] CPU2 is up
> [13053.168677] smpboot: Booting Node 0 Processor 3 APIC 0x3
> [13053.169334] CPU3 is up
> [13053.172267] ACPI: PM: Waking up from system sleep state S3
> [13053.196885] ACPI: EC: interrupt unblocked
> [13053.197598] pcieport 0000:00:1c.0: Intel SPT PCH root port ACS workaro=
und enabled
> [13053.197694] pcieport 0000:00:1c.4: Intel SPT PCH root port ACS workaro=
und enabled
> [13053.197732] pcieport 0000:00:1d.0: Intel SPT PCH root port ACS workaro=
und enabled
> [13053.248506] DMAR: DRHD: handling fault status reg 2
> [13053.248514] DMAR: [INTR-REMAP] Request device [f0:1f.0] fault index 0x=
0 [fault reason 0x25] Blocked a compatibility format interrupt request
> [13053.249963] ACPI: EC: event unblocked
> [13053.286861] i915 0000:00:02.0: [drm] [ENCODER:94:DDI A/PHY A] is disab=
led/in DSI mode with an ungated DDI clock, gate it
> [13053.294135] nvme nvme0: 4/0/0 default/read/poll queues
> [13053.305875] i915 0000:00:02.0: [drm] [ENCODER:102:DDI B/PHY B] is disa=
bled/in DSI mode with an ungated DDI clock, gate it
> [13053.313684] i915 0000:00:02.0: [drm] [ENCODER:113:DDI C/PHY C] is disa=
bled/in DSI mode with an ungated DDI clock, gate it
> [13053.559571] usb 1-5: reset high-speed USB device number 4 using xhci_h=
cd
> [13053.835481] usb 1-4: reset full-speed USB device number 3 using xhci_h=
cd
> [13054.111494] usb 1-3: reset full-speed USB device number 2 using xhci_h=
cd
> [13054.262220] OOM killer enabled.
> [13054.262222] Restarting tasks ... done.
> [13054.267115] random: crng reseeded on system resumption
> [13054.343464] PM: suspend exit
> [13054.431198] Process accounting resumed
> [13054.471894] bluetooth hci0: firmware: direct-loading firmware qca/ramp=
atch_usb_00000302.bin
> [13054.472262] Bluetooth: hci0: using rampatch file: qca/rampatch_usb_000=
00302.bin
> [13054.472265] Bluetooth: hci0: QCA: patch rome 0x302 build 0x3e8, firmwa=
re rome 0x302 build 0x111
> [13054.625693] mei_hdcp 0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1c54b627f04=
: bound 0000:00:02.0 (ops i915_hdcp_ops [i915])
> [13054.836890] bluetooth hci0: firmware: direct-loading firmware qca/nvm_=
usb_00000302.bin
> [13054.836924] Bluetooth: hci0: using NVM file: qca/nvm_usb_00000302.bin
> [13054.865008] Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection=
 command is advertised, but not supported.
> [13059.255960] wlp58s0: authenticate with 6c:f3:7f:10:ae:18
> [13059.288944] wlp58s0: send auth to 6c:f3:7f:10:ae:18 (try 1/3)
> [13059.295650] wlp58s0: authenticated
> [13059.296345] wlp58s0: VHT capa missing/short, disabling VHT/HE/EHT
> [13059.299342] wlp58s0: associate with 6c:f3:7f:10:ae:18 (try 1/3)
> [13059.307353] wlp58s0: RX AssocResp from 6c:f3:7f:10:ae:18 (capab=3D0x41=
1 status=3D0 aid=3D2)
> [13059.311060] wlp58s0: associated
> [13085.071800] pci 0000:01:00.0: [8086:1576] type 01 class 0x060400
> [13085.071941] pci 0000:01:00.0: enabling Extended Tags
> [13085.073396] pci 0000:01:00.0: supports D1 D2
> [13085.073419] pci 0000:01:00.0: PME# supported from D0 D1 D2 D3hot D3cold
> [13085.073594] pci 0000:01:00.0: 15.752 Gb/s available PCIe bandwidth, li=
mited by 8.0 GT/s PCIe x2 link at 0000:00:1c.0 (capable of 31.504 Gb/s with=
 8.0 GT/s PCIe x4 link)
> [13085.082018] pci 0000:01:00.0: Adding to iommu group 16
> [13085.198288] pci 0000:02:00.0: [8086:1576] type 01 class 0x060400
> [13085.198431] pci 0000:02:00.0: enabling Extended Tags
> [13085.198682] pci 0000:02:00.0: supports D1 D2
> [13085.198687] pci 0000:02:00.0: PME# supported from D0 D1 D2 D3hot D3cold
> [13085.199462] pci 0000:02:00.0: Adding to iommu group 17
> [13085.199971] pci 0000:02:01.0: [8086:1576] type 01 class 0x060400
> [13085.200147] pci 0000:02:01.0: enabling Extended Tags
> [13085.200474] pci 0000:02:01.0: supports D1 D2
> [13085.200482] pci 0000:02:01.0: PME# supported from D0 D1 D2 D3hot D3cold
> [13085.201428] pci 0000:02:01.0: Adding to iommu group 18
> [13085.201963] pci 0000:02:02.0: [8086:1576] type 01 class 0x060400
> [13085.202143] pci 0000:02:02.0: enabling Extended Tags
> [13085.202439] pci 0000:02:02.0: supports D1 D2
> [13085.202447] pci 0000:02:02.0: PME# supported from D0 D1 D2 D3hot D3cold
> [13085.224803] pci 0000:02:02.0: Adding to iommu group 19
> [13085.225305] pci 0000:01:00.0: PCI bridge to [bus 02-39]
> [13085.225348] pci 0000:01:00.0:   bridge window [mem 0xc4000000-0xda0fff=
ff]
> [13085.225382] pci 0000:01:00.0:   bridge window [mem 0xa0000000-0xc1ffff=
ff 64bit pref]
> [13085.225611] pci 0000:02:00.0: PCI bridge to [bus 03]
> [13085.225648] pci 0000:02:00.0:   bridge window [mem 0xda000000-0xda0fff=
ff]
> [13085.225897] pci 0000:02:01.0: PCI bridge to [bus 04-38]
> [13085.225922] pci 0000:02:01.0:   bridge window [mem 0xc4000000-0xd9efff=
ff]
> [13085.225953] pci 0000:02:01.0:   bridge window [mem 0xa0000000-0xc1ffff=
ff 64bit pref]
> [13085.226406] pci 0000:39:00.0: [8086:15b5] type 00 class 0x0c0330
> [13085.226472] pci 0000:39:00.0: reg 0x10: [mem 0xd9f00000-0xd9f0ffff]
> [13085.226679] pci 0000:39:00.0: enabling Extended Tags
> [13085.227073] pci 0000:39:00.0: supports D1 D2
> [13085.227096] pci 0000:39:00.0: PME# supported from D0 D1 D2 D3hot D3cold
> [13085.231281] pci 0000:39:00.0: 8.000 Gb/s available PCIe bandwidth, lim=
ited by 2.5 GT/s PCIe x4 link at 0000:02:02.0 (capable of 31.504 Gb/s with =
8.0 GT/s PCIe x4 link)
> [13085.238604] pci 0000:39:00.0: Adding to iommu group 19
> [13085.238895] pci 0000:02:02.0: PCI bridge to [bus 39]
> [13085.238935] pci 0000:02:02.0:   bridge window [mem 0xd9f00000-0xd9ffff=
ff]
> [13085.239109] pci_bus 0000:02: Allocating resources
> [13085.239371] pci 0000:02:01.0: bridge window [io  0x1000-0x0fff] to [bu=
s 04-38] add_size 1000
> [13085.239403] pci 0000:02:02.0: bridge window [io  0x1000-0x0fff] to [bu=
s 39] add_size 1000
> [13085.239416] pci 0000:02:02.0: bridge window [mem 0x00100000-0x000fffff=
 64bit pref] to [bus 39] add_size 200000 add_align 100000
> [13085.239446] pci 0000:01:00.0: bridge window [io  0x1000-0x0fff] to [bu=
s 02-39] add_size 2000
> [13085.239476] pci 0000:01:00.0: BAR 13: no space for [io  size 0x2000]
> [13085.239486] pci 0000:01:00.0: BAR 13: failed to assign [io  size 0x200=
0]
> [13085.239497] pci 0000:01:00.0: BAR 13: no space for [io  size 0x2000]
> [13085.239519] pci 0000:01:00.0: BAR 13: failed to assign [io  size 0x200=
0]
> [13085.239538] pci 0000:02:02.0: BAR 15: no space for [mem size 0x0020000=
0 64bit pref]
> [13085.239562] pci 0000:02:02.0: BAR 15: failed to assign [mem size 0x002=
00000 64bit pref]
> [13085.239572] pci 0000:02:01.0: BAR 13: no space for [io  size 0x1000]
> [13085.239580] pci 0000:02:01.0: BAR 13: failed to assign [io  size 0x100=
0]
> [13085.239588] pci 0000:02:02.0: BAR 13: no space for [io  size 0x1000]
> [13085.239610] pci 0000:02:02.0: BAR 13: failed to assign [io  size 0x100=
0]
> [13085.239624] pci 0000:02:02.0: BAR 15: no space for [mem size 0x0020000=
0 64bit pref]
> [13085.239647] pci 0000:02:02.0: BAR 15: failed to assign [mem size 0x002=
00000 64bit pref]
> [13085.239656] pci 0000:02:02.0: BAR 13: no space for [io  size 0x1000]
> [13085.239664] pci 0000:02:02.0: BAR 13: failed to assign [io  size 0x100=
0]
> [13085.239673] pci 0000:02:01.0: BAR 13: no space for [io  size 0x1000]
> [13085.239695] pci 0000:02:01.0: BAR 13: failed to assign [io  size 0x100=
0]
> [13085.239705] pci 0000:02:00.0: PCI bridge to [bus 03]
> [13085.239734] pci 0000:02:00.0:   bridge window [mem 0xda000000-0xda0fff=
ff]
> [13085.239755] pci 0000:02:01.0: PCI bridge to [bus 04-38]
> [13085.239783] pci 0000:02:01.0:   bridge window [mem 0xc4000000-0xd9efff=
ff]
> [13085.239795] pci 0000:02:01.0:   bridge window [mem 0xa0000000-0xc1ffff=
ff 64bit pref]
> [13085.239827] pci 0000:02:02.0: PCI bridge to [bus 39]
> [13085.239840] pci 0000:02:02.0:   bridge window [mem 0xd9f00000-0xd9ffff=
ff]
> [13085.239874] pci 0000:01:00.0: PCI bridge to [bus 02-39]
> [13085.239902] pci 0000:01:00.0:   bridge window [mem 0xc4000000-0xda0fff=
ff]
> [13085.239914] pci 0000:01:00.0:   bridge window [mem 0xa0000000-0xc1ffff=
ff 64bit pref]
> [13085.252922] xhci_hcd 0000:39:00.0: xHCI Host Controller
> [13085.252965] xhci_hcd 0000:39:00.0: new USB bus registered, assigned bu=
s number 3
> [13085.254809] xhci_hcd 0000:39:00.0: hcc params 0x200077c1 hci version 0=
x110 quirks 0x0000000200009810
> [13085.255847] xhci_hcd 0000:39:00.0: xHCI Host Controller
> [13085.255879] xhci_hcd 0000:39:00.0: new USB bus registered, assigned bu=
s number 4
> [13085.255896] xhci_hcd 0000:39:00.0: Host supports USB 3.1 Enhanced Supe=
rSpeed
> [13085.256144] usb usb3: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.06
> [13085.256173] usb usb3: New USB device strings: Mfr=3D3, Product=3D2, Se=
rialNumber=3D1
> [13085.256186] usb usb3: Product: xHCI Host Controller
> [13085.256193] usb usb3: Manufacturer: Linux 6.6.15-amd64 xhci-hcd
> [13085.256214] usb usb3: SerialNumber: 0000:39:00.0
> [13085.257287] hub 3-0:1.0: USB hub found
> [13085.257339] hub 3-0:1.0: 2 ports detected
> [13085.260677] usb usb4: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.06
> [13085.260708] usb usb4: New USB device strings: Mfr=3D3, Product=3D2, Se=
rialNumber=3D1
> [13085.260718] usb usb4: Product: xHCI Host Controller
> [13085.260741] usb usb4: Manufacturer: Linux 6.6.15-amd64 xhci-hcd
> [13085.260749] usb usb4: SerialNumber: 0000:39:00.0
> [13085.261488] hub 4-0:1.0: USB hub found
> [13085.261533] hub 4-0:1.0: 2 ports detected
> [13085.265628] pci_bus 0000:02: Allocating resources
> [13085.265696] pcieport 0000:02:01.0: bridge window [io  0x1000-0x0fff] t=
o [bus 04-38] add_size 1000
> [13085.265715] pcieport 0000:02:02.0: bridge window [io  0x1000-0x0fff] t=
o [bus 39] add_size 1000
> [13085.265742] pcieport 0000:02:02.0: bridge window [mem 0x00100000-0x000=
fffff 64bit pref] to [bus 39] add_size 200000 add_align 100000
> [13085.265775] pcieport 0000:01:00.0: bridge window [io  0x1000-0x0fff] t=
o [bus 02-39] add_size 2000
> [13085.265790] pcieport 0000:01:00.0: BAR 13: no space for [io  size 0x20=
00]
> [13085.265800] pcieport 0000:01:00.0: BAR 13: failed to assign [io  size =
0x2000]
> [13085.265824] pcieport 0000:01:00.0: BAR 13: no space for [io  size 0x20=
00]
> [13085.265833] pcieport 0000:01:00.0: BAR 13: failed to assign [io  size =
0x2000]
> [13085.265866] pcieport 0000:02:02.0: BAR 15: no space for [mem size 0x00=
200000 64bit pref]
> [13085.265875] pcieport 0000:02:02.0: BAR 15: failed to assign [mem size =
0x00200000 64bit pref]
> [13085.265884] pcieport 0000:02:01.0: BAR 13: no space for [io  size 0x10=
00]
> [13085.265906] pcieport 0000:02:01.0: BAR 13: failed to assign [io  size =
0x1000]
> [13085.265914] pcieport 0000:02:02.0: BAR 13: no space for [io  size 0x10=
00]
> [13085.265923] pcieport 0000:02:02.0: BAR 13: failed to assign [io  size =
0x1000]
> [13085.265951] pcieport 0000:02:02.0: BAR 15: no space for [mem size 0x00=
200000 64bit pref]
> [13085.265960] pcieport 0000:02:02.0: BAR 15: failed to assign [mem size =
0x00200000 64bit pref]
> [13085.265970] pcieport 0000:02:02.0: BAR 13: no space for [io  size 0x10=
00]
> [13085.265993] pcieport 0000:02:02.0: BAR 13: failed to assign [io  size =
0x1000]
> [13085.266001] pcieport 0000:02:01.0: BAR 13: no space for [io  size 0x10=
00]
> [13085.266009] pcieport 0000:02:01.0: BAR 13: failed to assign [io  size =
0x1000]
> [13085.515144] usb 3-1: new high-speed USB device number 2 using xhci_hcd
> [13085.673932] usb 3-1: New USB device found, idVendor=3D2109, idProduct=
=3D2820, bcdDevice=3D30.03
> [13085.673954] usb 3-1: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D0
> [13085.673980] usb 3-1: Product: USB2.0 Hub            =20
> [13085.673988] usb 3-1: Manufacturer: VIA Labs, Inc.        =20
> [13085.677792] hub 3-1:1.0: USB hub found
> [13085.681588] hub 3-1:1.0: 5 ports detected
> [13085.809774] usb 4-1: new SuperSpeed Plus Gen 2x1 USB device number 2 u=
sing xhci_hcd
> [13085.837162] usb 4-1: New USB device found, idVendor=3D2109, idProduct=
=3D0820, bcdDevice=3D30.03
> [13085.837171] usb 4-1: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D0
> [13085.837187] usb 4-1: Product: USB3.1 Hub            =20
> [13085.837190] usb 4-1: Manufacturer: VIA Labs, Inc.        =20
> [13085.842139] hub 4-1:1.0: USB hub found
> [13085.842532] hub 4-1:1.0: 4 ports detected
> [13086.419344] usb 3-1.1: new full-speed USB device number 3 using xhci_h=
cd
> [13086.584687] usb 3-1.1: New USB device found, idVendor=3D06c4, idProduc=
t=3Dc412, bcdDevice=3D 0.06
> [13086.584722] usb 3-1.1: New USB device strings: Mfr=3D1, Product=3D2, S=
erialNumber=3D3
> [13086.584732] usb 3-1.1: Product: DELL DA300
> [13086.584751] usb 3-1.1: Manufacturer: Bizlink
> [13086.584757] usb 3-1.1: SerialNumber: MCU Ver0006
> [13086.600417] hid-generic 0003:06C4:C412.000F: hiddev1,hidraw2: USB HID =
v1.11 Device [Bizlink DELL DA300] on usb-0000:39:00.0-1.1/input0
> [13086.655154] usb 4-1.2: new SuperSpeed USB device number 3 using xhci_h=
cd
> [13086.679913] usb 4-1.2: New USB device found, idVendor=3D0bda, idProduc=
t=3D8153, bcdDevice=3D31.00
> [13086.679922] usb 4-1.2: New USB device strings: Mfr=3D1, Product=3D2, S=
erialNumber=3D6
> [13086.679926] usb 4-1.2: Product: USB 10/100/1000 LAN
> [13086.679928] usb 4-1.2: Manufacturer: Realtek
> [13086.679930] usb 4-1.2: SerialNumber: 001000001
> [13086.764151] r8152-cfgselector 4-1.2: reset SuperSpeed USB device numbe=
r 3 using xhci_hcd
> [13086.792277] r8152 4-1.2:1.0 (unnamed net_device) (uninitialized): Usin=
g pass-thru MAC addr 18:db:f2:2d:cc:f3
> [13086.793038] r8152 4-1.2:1.0: firmware: direct-loading firmware rtl_nic=
/rtl8153b-2.fw
> [13086.811787] r8152 4-1.2:1.0: load rtl8153b-2 v2 04/27/23 successfully
> [13086.854380] r8152 4-1.2:1.0 eth0: v1.12.13
> [13086.927969] r8152 4-1.2:1.0 enx18dbf22dccf3: renamed from eth0
> [13090.060316] r8152 4-1.2:1.0 enx18dbf22dccf3: carrier on
> [13091.419275] usb 1-1: new low-speed USB device number 5 using xhci_hcd
> [13091.575965] usb 1-1: New USB device found, idVendor=3D0bf8, idProduct=
=3D101e, bcdDevice=3D 1.09
> [13091.575992] usb 1-1: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D0
> [13091.576004] usb 1-1: Product: Fujitsu Keyboard
> [13091.576013] usb 1-1: Manufacturer: Fujitsu
> [13091.582849] input: Fujitsu Fujitsu Keyboard as /devices/pci0000:00/000=
0:00:14.0/usb1/1-1/1-1:1.0/0003:0BF8:101E.0010/input/input62
> [13091.640141] hid-generic 0003:0BF8:101E.0010: input,hidraw3: USB HID v1=
=2E10 Keyboard [Fujitsu Fujitsu Keyboard] on usb-0000:00:14.0-1/input0
> [13091.649641] input: Fujitsu Fujitsu Keyboard System Control as /devices=
/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.1/0003:0BF8:101E.0011/input/input63
> [13091.707752] input: Fujitsu Fujitsu Keyboard Consumer Control as /devic=
es/pci0000:00/0000:00:14.0/usb1/1-1/1-1:1.1/0003:0BF8:101E.0011/input/input=
64
> [13091.708282] hid-generic 0003:0BF8:101E.0011: input,hiddev2,hidraw4: US=
B HID v1.10 Device [Fujitsu Fujitsu Keyboard] on usb-0000:00:14.0-1/input1
> [13101.455032] i915 0000:00:02.0: [drm] Reducing the compressed framebuff=
er size. This may lead to less power savings than a non-reduced-size. Try t=
o increase stolen memory size if available in BIOS.
> [13120.627356] wlp58s0: deauthenticating from 6c:f3:7f:10:ae:18 by local =
choice (Reason: 3=3DDEAUTH_LEAVING)
> [13156.322481] usb 1-2: new low-speed USB device number 6 using xhci_hcd
> [13156.474194] usb 1-2: New USB device found, idVendor=3D046d, idProduct=
=3Dc077, bcdDevice=3D72.00
> [13156.474207] usb 1-2: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D0
> [13156.474213] usb 1-2: Product: USB Optical Mouse
> [13156.474218] usb 1-2: Manufacturer: Logitech
> [13156.480989] input: Logitech USB Optical Mouse as /devices/pci0000:00/0=
000:00:14.0/usb1/1-2/1-2:1.0/0003:046D:C077.0012/input/input65
> [13156.481425] hid-generic 0003:046D:C077.0012: input,hidraw5: USB HID v1=
=2E11 Mouse [Logitech USB Optical Mouse] on usb-0000:00:14.0-2/input0
> [13862.228793] usb 3-1.3: new full-speed USB device number 4 using xhci_h=
cd
> [13862.620729] usb 3-1.3: New USB device found, idVendor=3D046d, idProduc=
t=3D0a4d, bcdDevice=3D 1.19
> [13862.620749] usb 3-1.3: New USB device strings: Mfr=3D1, Product=3D2, S=
erialNumber=3D0
> [13862.620752] usb 3-1.3: Product: Logitech G430 Gaming Headset
> [13862.620754] usb 3-1.3: Manufacturer: Logitech
> [13862.625880] input: Logitech Logitech G430 Gaming Headset as /devices/p=
ci0000:00/0000:00:1c.0/0000:01:00.0/0000:02:02.0/0000:39:00.0/usb3/3-1/3-1.=
3/3-1.3:1.3/0003:046D:0A4D.0013/input/input66
> [13862.685667] hid-generic 0003:046D:0A4D.0013: input,hidraw6: USB HID v1=
=2E00 Device [Logitech Logitech G430 Gaming Headset] on usb-0000:39:00.0-1.=
3/input3
> [13863.039010] usbcore: registered new interface driver snd-usb-audio
> [15658.823787] usb 3-1.3: USB disconnect, device number 4
> [20440.772719] PM: suspend entry (deep)
> [20440.784034] Filesystems sync: 0.011 seconds
> [20440.785904] (NULL device *): firmware: direct-loading firmware qca/nvm=
_usb_00000302.bin
> [20440.785963] (NULL device *): firmware: direct-loading firmware i915/kb=
l_dmc_ver1_04.bin
> [20440.786366] (NULL device *): firmware: direct-loading firmware regulat=
ory.db.p7s
> [20440.786387] (NULL device *): firmware: direct-loading firmware regulat=
ory.db
> [20440.787046] (NULL device *): firmware: direct-loading firmware qca/ram=
patch_usb_00000302.bin
> [20440.787653] Freezing user space processes
> [20440.790804] Freezing user space processes completed (elapsed 0.003 sec=
onds)
> [20440.790808] OOM killer disabled.
> [20440.790809] Freezing remaining freezable tasks
> [20440.792304] Freezing remaining freezable tasks completed (elapsed 0.00=
1 seconds)
> [20440.792350] printk: Suspending console(s) (use no_console_suspend to d=
ebug)
> [20441.345976] ACPI: EC: interrupt blocked
> [20441.380953] ACPI: PM: Preparing to enter system sleep state S3
> [20441.391905] ACPI: EC: event blocked
> [20441.391910] ACPI: EC: EC stopped
> [20441.391912] ACPI: PM: Saving platform NVS memory
> [20441.395407] Disabling non-boot CPUs ...
> [20441.398842] smpboot: CPU 1 is now offline
> [20441.406945] smpboot: CPU 2 is now offline
> [20441.412605] smpboot: CPU 3 is now offline
> [20441.421029] ACPI: PM: Low-level resume complete
> [20441.421072] ACPI: EC: EC started
> [20441.421073] ACPI: PM: Restoring platform NVS memory
> [20441.423241] Enabling non-boot CPUs ...
> [20441.423269] smpboot: Booting Node 0 Processor 1 APIC 0x2
> [20441.423982] CPU1 is up
> [20441.423999] smpboot: Booting Node 0 Processor 2 APIC 0x1
> [20441.424727] CPU2 is up
> [20441.424744] smpboot: Booting Node 0 Processor 3 APIC 0x3
> [20441.425411] CPU3 is up
> [20441.428385] ACPI: PM: Waking up from system sleep state S3
> [20441.732781] ACPI: EC: interrupt unblocked
> [20441.733167] pcieport 0000:00:1c.0: Intel SPT PCH root port ACS workaro=
und enabled
> [20441.733192] pcieport 0000:00:1c.4: Intel SPT PCH root port ACS workaro=
und enabled
> [20441.733195] pcieport 0000:00:1d.0: Intel SPT PCH root port ACS workaro=
und enabled
> [20441.758099] DMAR: DRHD: handling fault status reg 2
> [20441.758105] DMAR: [INTR-REMAP] Request device [f0:1f.0] fault index 0x=
0 [fault reason 0x25] Blocked a compatibility format interrupt request
> [20441.759719] ACPI: EC: event unblocked
> [20441.866794] nvme nvme0: 4/0/0 default/read/poll queues
> [20441.882051] i915 0000:00:02.0: [drm] [ENCODER:94:DDI A/PHY A] is disab=
led/in DSI mode with an ungated DDI clock, gate it
> [20441.883405] i915 0000:00:02.0: [drm] [ENCODER:102:DDI B/PHY B] is disa=
bled/in DSI mode with an ungated DDI clock, gate it
> [20441.895928] i915 0000:00:02.0: [drm] [ENCODER:113:DDI C/PHY C] is disa=
bled/in DSI mode with an ungated DDI clock, gate it
> [20442.171642] usb 1-4: reset full-speed USB device number 3 using xhci_h=
cd
> [20442.447572] usb 1-5: reset high-speed USB device number 4 using xhci_h=
cd
> [20442.723596] usb 1-3: reset full-speed USB device number 2 using xhci_h=
cd
> [20442.872876] xhci_hcd 0000:39:00.0: xHC error in resume, USBSTS 0x411, =
Reinit
> [20442.872878] usb usb3: root hub lost power or was reset
> [20442.872880] usb usb4: root hub lost power or was reset
> [20443.159684] usb 1-1: reset low-speed USB device number 5 using xhci_hcd
> [20443.167572] usb 3-1: reset high-speed USB device number 2 using xhci_h=
cd
> [20443.443706] usb 4-1: reset SuperSpeed Plus Gen 2x1 USB device number 2=
 using xhci_hcd
> [20443.747667] usb 1-2: reset low-speed USB device number 6 using xhci_hcd
> [20444.083442] usb 3-1.1: reset full-speed USB device number 3 using xhci=
_hcd
> [20445.107638] r8152-cfgselector 4-1.2: reset SuperSpeed USB device numbe=
r 3 using xhci_hcd
> [20445.130537] r8152 4-1.2:1.0: skip request firmware
> [20445.130628] r8152 4-1.2:1.0 enx18dbf22dccf3: Using pass-thru MAC addr =
18:db:f2:2d:cc:f3
> [20445.133417] r8152 4-1.2:1.0: load rtl8153b-2 v2 04/27/23 successfully
> [20445.174076] OOM killer enabled.
> [20445.174078] Restarting tasks ...=20
> [20445.174196] pci_bus 0000:02: Allocating resources
> [20445.174217] pcieport 0000:02:01.0: bridge window [io  0x1000-0x0fff] t=
o [bus 04-38] add_size 1000
> [20445.174224] pcieport 0000:02:02.0: bridge window [io  0x1000-0x0fff] t=
o [bus 39] add_size 1000
> [20445.174228] pcieport 0000:02:02.0: bridge window [mem 0x00100000-0x000=
fffff 64bit pref] to [bus 39] add_size 200000 add_align 100000
> [20445.174233] pcieport 0000:01:00.0: bridge window [io  0x1000-0x0fff] t=
o [bus 02-39] add_size 2000
> [20445.174239] pcieport 0000:01:00.0: BAR 13: no space for [io  size 0x20=
00]
> [20445.174242] pcieport 0000:01:00.0: BAR 13: failed to assign [io  size =
0x2000]
> [20445.174246] pcieport 0000:01:00.0: BAR 13: no space for [io  size 0x20=
00]
> [20445.174248] pcieport 0000:01:00.0: BAR 13: failed to assign [io  size =
0x2000]
> [20445.174255] pcieport 0000:02:02.0: BAR 15: no space for [mem size 0x00=
200000 64bit pref]
> [20445.174258] pcieport 0000:02:02.0: BAR 15: failed to assign [mem size =
0x00200000 64bit pref]
> [20445.174260] pcieport 0000:02:01.0: BAR 13: no space for [io  size 0x10=
00]
> [20445.174263] pcieport 0000:02:01.0: BAR 13: failed to assign [io  size =
0x1000]
> [20445.174316] pcieport 0000:02:02.0: BAR 13: no space for [io  size 0x10=
00]
> [20445.174319] pcieport 0000:02:02.0: BAR 13: failed to assign [io  size =
0x1000]
> [20445.174324] pcieport 0000:02:02.0: BAR 15: no space for [mem size 0x00=
200000 64bit pref]
> [20445.174327] pcieport 0000:02:02.0: BAR 15: failed to assign [mem size =
0x00200000 64bit pref]
> [20445.174329] pcieport 0000:02:02.0: BAR 13: no space for [io  size 0x10=
00]
> [20445.174332] pcieport 0000:02:02.0: BAR 13: failed to assign [io  size =
0x1000]
> [20445.174334] pcieport 0000:02:01.0: BAR 13: no space for [io  size 0x10=
00]
> [20445.174336] pcieport 0000:02:01.0: BAR 13: failed to assign [io  size =
0x1000]
> [20445.175518] pci_bus 0000:02: Allocating resources
> [20445.175541] pcieport 0000:02:01.0: bridge window [io  0x1000-0x0fff] t=
o [bus 04-38] add_size 1000
> [20445.175550] pcieport 0000:02:02.0: bridge window [io  0x1000-0x0fff] t=
o [bus 39] add_size 1000
> [20445.175553] pcieport 0000:02:02.0: bridge window [mem 0x00100000-0x000=
fffff 64bit pref] to [bus 39] add_size 200000 add_align 100000
> [20445.175558] pcieport 0000:01:00.0: bridge window [io  0x1000-0x0fff] t=
o [bus 02-39] add_size 2000
> [20445.175573] pcieport 0000:01:00.0: BAR 13: no space for [io  size 0x20=
00]
> [20445.175577] pcieport 0000:01:00.0: BAR 13: failed to assign [io  size =
0x2000]
> [20445.175580] pcieport 0000:01:00.0: BAR 13: no space for [io  size 0x20=
00]
> [20445.175582] pcieport 0000:01:00.0: BAR 13: failed to assign [io  size =
0x2000]
> [20445.175588] pcieport 0000:02:02.0: BAR 15: no space for [mem size 0x00=
200000 64bit pref]
> [20445.175591] pcieport 0000:02:02.0: BAR 15: failed to assign [mem size =
0x00200000 64bit pref]
> [20445.175594] pcieport 0000:02:01.0: BAR 13: no space for [io  size 0x10=
00]
> [20445.175596] pcieport 0000:02:01.0: BAR 13: failed to assign [io  size =
0x1000]
> [20445.175599] pcieport 0000:02:02.0: BAR 13: no space for [io  size 0x10=
00]
> [20445.175602] pcieport 0000:02:02.0: BAR 13: failed to assign [io  size =
0x1000]
> [20445.175606] pcieport 0000:02:02.0: BAR 15: no space for [mem size 0x00=
200000 64bit pref]
> [20445.175609] pcieport 0000:02:02.0: BAR 15: failed to assign [mem size =
0x00200000 64bit pref]
> [20445.175611] pcieport 0000:02:02.0: BAR 13: no space for [io  size 0x10=
00]
> [20445.175613] pcieport 0000:02:02.0: BAR 13: failed to assign [io  size =
0x1000]
> [20445.175616] pcieport 0000:02:01.0: BAR 13: no space for [io  size 0x10=
00]
> [20445.175618] pcieport 0000:02:01.0: BAR 13: failed to assign [io  size =
0x1000]
> [20445.177078] mei_hdcp 0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1c54b627f04=
: bound 0000:00:02.0 (ops i915_hdcp_ops [i915])
> [20445.187985] done.
> [20445.188007] random: crng reseeded on system resumption
> [20445.275089] PM: suspend exit
> [20445.346694] Process accounting resumed
> [20445.517505] Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection=
 command is advertised, but not supported.
> [20448.446091] r8152 4-1.2:1.0 enx18dbf22dccf3: carrier on
> [20456.926315] SshMasterConnec[23197]: segfault at 7fd2355cff46 ip 00007f=
d60455d80a sp 00007fd5d3f7e790 error 4 in libssh.so.4.9.6[7fd604535000+4500=
0] likely on CPU 3 (core 1, socket 0)
> [20456.926333] Code: f3 0f 1e fa 48 85 ff 0f 84 af 00 00 00 41 54 49 89 f=
c 55 53 48 83 3f 00 0f 84 97 00 00 00 48 89 f5 48 85 f6 0f 84 8b 00 00 00 <=
48> 8b be c8 05 00 00 48 85 ff 75 2f eb 7d 0f 1f 84 00 00 00 00 00
> [38297.969041] audit: type=3D1400 audit(1708016808.845:33): apparmor=3D"A=
LLOWED" operation=3D"open" class=3D"file" profile=3D"libreoffice-soffice" n=
ame=3D"/home/pmenzel/.thunderbird/profiles.ini" pid=3D35303 comm=3D"soffice=
=2Ebin" requested_mask=3D"r" denied_mask=3D"r" fsuid=3D5272 ouid=3D5272
> [38297.989903] audit: type=3D1400 audit(1708016808.865:34): apparmor=3D"A=
LLOWED" operation=3D"open" class=3D"file" profile=3D"libreoffice-soffice" n=
ame=3D"/home/pmenzel/.thunderbird/iglp44v6.default/cert9.db" pid=3D35303 co=
mm=3D"soffice.bin" requested_mask=3D"wrc" denied_mask=3D"wrc" fsuid=3D5272 =
ouid=3D5272
> [38297.990237] audit: type=3D1400 audit(1708016808.865:35): apparmor=3D"A=
LLOWED" operation=3D"file_lock" class=3D"file" profile=3D"libreoffice-soffi=
ce" name=3D"/home/pmenzel/.thunderbird/iglp44v6.default/cert9.db" pid=3D353=
03 comm=3D"soffice.bin" requested_mask=3D"k" denied_mask=3D"k" fsuid=3D5272=
 ouid=3D5272
> [38297.992246] audit: type=3D1400 audit(1708016808.869:36): apparmor=3D"A=
LLOWED" operation=3D"open" class=3D"file" profile=3D"libreoffice-soffice" n=
ame=3D"/home/pmenzel/.thunderbird/iglp44v6.default/key4.db" pid=3D35303 com=
m=3D"soffice.bin" requested_mask=3D"wrc" denied_mask=3D"wrc" fsuid=3D5272 o=
uid=3D5272
> [38297.992443] audit: type=3D1400 audit(1708016808.869:37): apparmor=3D"A=
LLOWED" operation=3D"file_lock" class=3D"file" profile=3D"libreoffice-soffi=
ce" name=3D"/home/pmenzel/.thunderbird/iglp44v6.default/key4.db" pid=3D3530=
3 comm=3D"soffice.bin" requested_mask=3D"k" denied_mask=3D"k" fsuid=3D5272 =
ouid=3D5272
> [38587.844513] PM: suspend entry (deep)
> [38587.846982] Filesystems sync: 0.002 seconds
> [38587.848976] (NULL device *): firmware: direct-loading firmware i915/kb=
l_dmc_ver1_04.bin
> [38587.849030] (NULL device *): firmware: direct-loading firmware regulat=
ory.db.p7s
> [38587.849126] (NULL device *): firmware: direct-loading firmware regulat=
ory.db
> [38587.850591] Freezing user space processes
> [38587.853113] Freezing user space processes completed (elapsed 0.002 sec=
onds)
> [38587.853116] OOM killer disabled.
> [38587.853116] Freezing remaining freezable tasks
> [38587.854406] Freezing remaining freezable tasks completed (elapsed 0.00=
1 seconds)
> [38587.854452] printk: Suspending console(s) (use no_console_suspend to d=
ebug)
> [38588.408656] ACPI: EC: interrupt blocked
> [38588.441444] ACPI: PM: Preparing to enter system sleep state S3
> [38588.452770] ACPI: EC: event blocked
> [38588.452774] ACPI: EC: EC stopped
> [38588.452776] ACPI: PM: Saving platform NVS memory
> [38588.456301] Disabling non-boot CPUs ...
> [38588.458465] smpboot: CPU 1 is now offline
> [38588.463291] smpboot: CPU 2 is now offline
> [38588.468360] smpboot: CPU 3 is now offline
> [38588.478875] ACPI: PM: Low-level resume complete
> [38588.478919] ACPI: EC: EC started
> [38588.478919] ACPI: PM: Restoring platform NVS memory
> [38588.481038] Enabling non-boot CPUs ...
> [38588.481063] smpboot: Booting Node 0 Processor 1 APIC 0x2
> [38588.481775] CPU1 is up
> [38588.481793] smpboot: Booting Node 0 Processor 2 APIC 0x1
> [38588.482548] CPU2 is up
> [38588.482564] smpboot: Booting Node 0 Processor 3 APIC 0x3
> [38588.483227] CPU3 is up
> [38588.486173] ACPI: PM: Waking up from system sleep state S3
> [38588.803799] ACPI: EC: interrupt unblocked
> [38588.804144] pcieport 0000:00:1c.0: Intel SPT PCH root port ACS workaro=
und enabled
> [38588.804182] pcieport 0000:00:1c.4: Intel SPT PCH root port ACS workaro=
und enabled
> [38588.804202] pcieport 0000:00:1d.0: Intel SPT PCH root port ACS workaro=
und enabled
> [38588.839792] DMAR: DRHD: handling fault status reg 2
> [38588.839800] DMAR: [INTR-REMAP] Request device [f0:1f.0] fault index 0x=
0 [fault reason 0x25] Blocked a compatibility format interrupt request
> [38588.841394] ACPI: EC: event unblocked
> [38588.881941] nvme nvme0: 4/0/0 default/read/poll queues
> [38588.952089] i915 0000:00:02.0: [drm] [ENCODER:94:DDI A/PHY A] is disab=
led/in DSI mode with an ungated DDI clock, gate it
> [38588.952097] i915 0000:00:02.0: [drm] [ENCODER:102:DDI B/PHY B] is disa=
bled/in DSI mode with an ungated DDI clock, gate it
> [38588.952102] i915 0000:00:02.0: [drm] [ENCODER:113:DDI C/PHY C] is disa=
bled/in DSI mode with an ungated DDI clock, gate it
> [38589.174114] usb 1-3: reset full-speed USB device number 2 using xhci_h=
cd
> [38589.238809] Registered IR keymap rc-cec
> [38589.238840] rc rc0: DP-1 as /devices/pci0000:00/0000:00:02.0/rc/rc0
> [38589.238878] input: DP-1 as /devices/pci0000:00/0000:00:02.0/rc/rc0/inp=
ut68
> [38589.454005] usb 1-5: reset high-speed USB device number 4 using xhci_h=
cd
> [38589.730018] usb 1-4: reset full-speed USB device number 3 using xhci_h=
cd
> [38589.896901] xhci_hcd 0000:39:00.0: xHC error in resume, USBSTS 0x411, =
Reinit
> [38589.896905] usb usb3: root hub lost power or was reset
> [38589.896906] usb usb4: root hub lost power or was reset
> [38590.189991] usb 3-1: reset high-speed USB device number 2 using xhci_h=
cd
> [38590.338375] usb 3-1: device firmware changed
> [38595.538452] mei_hdcp 0000:00:16.0-b638ab7e-94e2-4ea2-a552-d1c54b627f04=
: bound 0000:00:02.0 (ops i915_hdcp_ops [i915])
> [38595.539692] OOM killer enabled.
> [38595.539694] Restarting tasks ...=20
> [38595.539819] pci_bus 0000:02: Allocating resources
> [38595.539843] pcieport 0000:02:01.0: bridge window [io  0x1000-0x0fff] t=
o [bus 04-38] add_size 1000
> [38595.539849] pcieport 0000:02:02.0: bridge window [io  0x1000-0x0fff] t=
o [bus 39] add_size 1000
> [38595.539853] pcieport 0000:02:02.0: bridge window [mem 0x00100000-0x000=
fffff 64bit pref] to [bus 39] add_size 200000 add_align 100000
> [38595.539859] pcieport 0000:01:00.0: bridge window [io  0x1000-0x0fff] t=
o [bus 02-39] add_size 2000
> [38595.539865] pcieport 0000:01:00.0: BAR 13: no space for [io  size 0x20=
00]
> [38595.539869] pcieport 0000:01:00.0: BAR 13: failed to assign [io  size =
0x2000]
> [38595.539981] usb 1-1: USB disconnect, device number 5
> [38595.540111] usb 3-1: USB disconnect, device number 2
> [38595.540115] usb 3-1.1: USB disconnect, device number 3
> [38595.540299] pcieport 0000:01:00.0: BAR 13: no space for [io  size 0x20=
00]
> [38595.540302] pcieport 0000:01:00.0: BAR 13: failed to assign [io  size =
0x2000]
> [38595.540309] pcieport 0000:02:02.0: BAR 15: no space for [mem size 0x00=
200000 64bit pref]
> [38595.540312] pcieport 0000:02:02.0: BAR 15: failed to assign [mem size =
0x00200000 64bit pref]
> [38595.540315] pcieport 0000:02:01.0: BAR 13: no space for [io  size 0x10=
00]
> [38595.540317] pcieport 0000:02:01.0: BAR 13: failed to assign [io  size =
0x1000]
> [38595.540319] pcieport 0000:02:02.0: BAR 13: no space for [io  size 0x10=
00]
> [38595.540322] pcieport 0000:02:02.0: BAR 13: failed to assign [io  size =
0x1000]
> [38595.540326] pcieport 0000:02:02.0: BAR 15: no space for [mem size 0x00=
200000 64bit pref]
> [38595.540329] pcieport 0000:02:02.0: BAR 15: failed to assign [mem size =
0x00200000 64bit pref]
> [38595.540331] pcieport 0000:02:02.0: BAR 13: no space for [io  size 0x10=
00]
> [38595.540333] pcieport 0000:02:02.0: BAR 13: failed to assign [io  size =
0x1000]
> [38595.540335] pcieport 0000:02:01.0: BAR 13: no space for [io  size 0x10=
00]
> [38595.540338] pcieport 0000:02:01.0: BAR 13: failed to assign [io  size =
0x1000]
> [38595.540943] pci_bus 0000:02: Allocating resources
> [38595.540957] pcieport 0000:02:01.0: bridge window [io  0x1000-0x0fff] t=
o [bus 04-38] add_size 1000
> [38595.540959] pcieport 0000:02:02.0: bridge window [io  0x1000-0x0fff] t=
o [bus 39] add_size 1000
> [38595.540961] pcieport 0000:02:02.0: bridge window [mem 0x00100000-0x000=
fffff 64bit pref] to [bus 39] add_size 200000 add_align 100000
> [38595.540964] pcieport 0000:01:00.0: bridge window [io  0x1000-0x0fff] t=
o [bus 02-39] add_size 2000
> [38595.540967] pcieport 0000:01:00.0: BAR 13: no space for [io  size 0x20=
00]
> [38595.540968] pcieport 0000:01:00.0: BAR 13: failed to assign [io  size =
0x2000]
> [38595.540970] pcieport 0000:01:00.0: BAR 13: no space for [io  size 0x20=
00]
> [38595.540971] pcieport 0000:01:00.0: BAR 13: failed to assign [io  size =
0x2000]
> [38595.540974] pcieport 0000:02:02.0: BAR 15: no space for [mem size 0x00=
200000 64bit pref]
> [38595.540975] pcieport 0000:02:02.0: BAR 15: failed to assign [mem size =
0x00200000 64bit pref]
> [38595.540977] pcieport 0000:02:01.0: BAR 13: no space for [io  size 0x10=
00]
> [38595.540978] pcieport 0000:02:01.0: BAR 13: failed to assign [io  size =
0x1000]
> [38595.540979] pcieport 0000:02:02.0: BAR 13: no space for [io  size 0x10=
00]
> [38595.540980] pcieport 0000:02:02.0: BAR 13: failed to assign [io  size =
0x1000]
> [38595.540982] pcieport 0000:02:02.0: BAR 15: no space for [mem size 0x00=
200000 64bit pref]
> [38595.540984] pcieport 0000:02:02.0: BAR 15: failed to assign [mem size =
0x00200000 64bit pref]
> [38595.540985] pcieport 0000:02:02.0: BAR 13: no space for [io  size 0x10=
00]
> [38595.540986] pcieport 0000:02:02.0: BAR 13: failed to assign [io  size =
0x1000]
> [38595.540988] pcieport 0000:02:01.0: BAR 13: no space for [io  size 0x10=
00]
> [38595.540989] pcieport 0000:02:01.0: BAR 13: failed to assign [io  size =
0x1000]
> [38595.543682] done.
> [38595.543695] random: crng reseeded on system resumption
> [38595.545827] usb 4-1: USB disconnect, device number 2
> [38595.545836] r8152-cfgselector 4-1.2: USB disconnect, device number 3
> [38595.638205] bluetooth hci0: firmware: direct-loading firmware qca/ramp=
atch_usb_00000302.bin
> [38595.638597] Bluetooth: hci0: using rampatch file: qca/rampatch_usb_000=
00302.bin
> [38595.638600] Bluetooth: hci0: QCA: patch rome 0x302 build 0x3e8, firmwa=
re rome 0x302 build 0x111
> [38595.639047] PM: suspend exit
> [38595.705929] usb 3-1: new high-speed USB device number 5 using xhci_hcd
> [38595.781281] Process accounting resumed
> [38595.789445] usb 1-2: USB disconnect, device number 6
> [38595.855626] usb 3-1: New USB device found, idVendor=3D2109, idProduct=
=3D2817, bcdDevice=3D 5.e3
> [38595.855634] usb 3-1: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D3
> [38595.855636] usb 3-1: Product: USB2.0 Hub            =20
> [38595.855637] usb 3-1: Manufacturer: VIA Labs, Inc.        =20
> [38595.855639] usb 3-1: SerialNumber: 000000000
> [38595.857093] hub 3-1:1.0: USB hub found
> [38595.860701] hub 3-1:1.0: 5 ports detected
> [38596.001459] bluetooth hci0: firmware: direct-loading firmware qca/nvm_=
usb_00000302.bin
> [38596.001523] Bluetooth: hci0: using NVM file: qca/nvm_usb_00000302.bin
> [38596.027638] Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection=
 command is advertised, but not supported.
> [38596.053936] usb 4-1: new SuperSpeed USB device number 4 using xhci_hcd
> [38596.106850] usb 4-1: New USB device found, idVendor=3D2109, idProduct=
=3D0817, bcdDevice=3D 5.e3
> [38596.106874] usb 4-1: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D3
> [38596.106885] usb 4-1: Product: USB3.0 Hub            =20
> [38596.106892] usb 4-1: Manufacturer: VIA Labs, Inc.        =20
> [38596.106900] usb 4-1: SerialNumber: 000000000
> [38596.112949] hub 4-1:1.0: USB hub found
> [38596.113079] hub 4-1:1.0: 4 ports detected
> [38596.613810] usb 3-1.1: new high-speed USB device number 6 using xhci_h=
cd
> [38596.771748] usb 3-1.1: New USB device found, idVendor=3D2109, idProduc=
t=3D2817, bcdDevice=3D 7.b4
> [38596.771773] usb 3-1.1: New USB device strings: Mfr=3D1, Product=3D2, S=
erialNumber=3D3
> [38596.771784] usb 3-1.1: Product: USB2.0 Hub            =20
> [38596.771792] usb 3-1.1: Manufacturer: VIA Labs, Inc.        =20
> [38596.771799] usb 3-1.1: SerialNumber: 000000000
> [38596.775239] hub 3-1.1:1.0: USB hub found
> [38596.780934] hub 3-1.1:1.0: 4 ports detected
> [38597.159115] usb 4-1.1: new SuperSpeed USB device number 5 using xhci_h=
cd
> [38597.248403] usb 4-1.1: New USB device found, idVendor=3D2109, idProduc=
t=3D0817, bcdDevice=3D 7.b4
> [38597.248410] usb 4-1.1: New USB device strings: Mfr=3D1, Product=3D2, S=
erialNumber=3D3
> [38597.248413] usb 4-1.1: Product: USB3.0 Hub            =20
> [38597.248416] usb 4-1.1: Manufacturer: VIA Labs, Inc.        =20
> [38597.248418] usb 4-1.1: SerialNumber: 000000000
> [38597.253883] hub 4-1.1:1.0: USB hub found
> [38597.254033] hub 4-1.1:1.0: 4 ports detected
> [38597.325788] usb 3-1.5: new high-speed USB device number 7 using xhci_h=
cd
> [38597.438305] usb 3-1.5: New USB device found, idVendor=3D2109, idProduc=
t=3D8817, bcdDevice=3D 0.01
> [38597.438312] usb 3-1.5: New USB device strings: Mfr=3D1, Product=3D2, S=
erialNumber=3D3
> [38597.438314] usb 3-1.5: Product: USB Billboard Device  =20
> [38597.438316] usb 3-1.5: Manufacturer: VIA Labs, Inc.        =20
> [38597.438317] usb 3-1.5: SerialNumber: 0000000000000001
> [38602.697828] xhci_hcd 0000:39:00.0: Timeout while waiting for setup dev=
ice command
> [38608.073709] xhci_hcd 0000:39:00.0: Timeout while waiting for setup dev=
ice command
> [38608.281683] usb 4-1.4: device not accepting address 6, error -62
> [38608.361686] usb 3-1.1.2: new high-speed USB device number 8 using xhci=
_hcd
> [38608.478074] usb 3-1.1.2: New USB device found, idVendor=3D0bda, idProd=
uct=3D5409, bcdDevice=3D 1.41
> [38608.478078] usb 3-1.1.2: New USB device strings: Mfr=3D1, Product=3D2,=
 SerialNumber=3D0
> [38608.478080] usb 3-1.1.2: Product: 4-Port USB 2.0 Hub
> [38608.478081] usb 3-1.1.2: Manufacturer: Generic
> [38608.479686] hub 3-1.1.2:1.0: USB hub found
> [38608.481125] hub 3-1.1.2:1.0: 4 ports detected
> [38608.546211] usb 4-1.1.2: new SuperSpeed USB device number 7 using xhci=
_hcd
> [38608.580992] usb 4-1.1.2: New USB device found, idVendor=3D0bda, idProd=
uct=3D0409, bcdDevice=3D 1.41
> [38608.580997] usb 4-1.1.2: New USB device strings: Mfr=3D1, Product=3D2,=
 SerialNumber=3D0
> [38608.581000] usb 4-1.1.2: Product: 4-Port USB 3.0 Hub
> [38608.581001] usb 4-1.1.2: Manufacturer: Generic
> [38608.586469] hub 4-1.1.2:1.0: USB hub found
> [38608.587779] hub 4-1.1.2:1.0: 2 ports detected
> [38613.965663] xhci_hcd 0000:39:00.0: Timeout while waiting for setup dev=
ice command
> [38619.337632] xhci_hcd 0000:39:00.0: Timeout while waiting for setup dev=
ice command
> [38619.549614] usb 4-1.4: device not accepting address 8, error -62
> [38619.549715] usb 4-1-port4: attempt power cycle
> [38619.821998] usb 4-1.1.2: USB disconnect, device number 7
> [38620.526463] usb 3-1.1.2-port3: cannot reset (err =3D -71)
> [38620.526588] usb 3-1.1.2-port3: cannot reset (err =3D -71)
> [38620.526707] usb 3-1.1.2-port3: cannot reset (err =3D -71)
> [38620.526826] usb 3-1.1.2-port3: cannot reset (err =3D -71)
> [38620.526946] usb 3-1.1.2-port3: cannot reset (err =3D -71)
> [38620.526947] usb 3-1.1.2-port3: Cannot enable. Maybe the USB cable is b=
ad?
> [38620.527067] usb 3-1.1.2-port3: cannot disable (err =3D -71)
> [38620.527168] usb 3-1.1.2: USB disconnect, device number 8
> [38620.527276] usb 3-1.1.2-port3: cannot reset (err =3D -71)
> [38620.527315] usb 3-1.1.2-port3: attempt power cycle
> [38620.605648] usb 4-1.1.3: new SuperSpeed USB device number 9 using xhci=
_hcd
> [38620.626284] usb 4-1.1.3: New USB device found, idVendor=3D0bda, idProd=
uct=3D8153, bcdDevice=3D30.00
> [38620.626289] usb 4-1.1.3: New USB device strings: Mfr=3D1, Product=3D2,=
 SerialNumber=3D6
> [38620.626291] usb 4-1.1.3: Product: USB 10/100/1000 LAN
> [38620.626293] usb 4-1.1.3: Manufacturer: Realtek
> [38620.626294] usb 4-1.1.3: SerialNumber: 000001
> [38620.709920] r8152-cfgselector 4-1.1.3: reset SuperSpeed USB device num=
ber 9 using xhci_hcd
> [38620.735991] r8152 4-1.1.3:1.0: firmware: direct-loading firmware rtl_n=
ic/rtl8153a-4.fw
> [38620.751888] r8152 4-1.1.3:1.0: load rtl8153a-4 v2 02/07/20 successfully
> [38620.778160] r8152 4-1.1.3:1.0 eth0: v1.12.13
> [38625.993752] xhci_hcd 0000:39:00.0: Timeout while waiting for setup dev=
ice command
> [38631.377560] xhci_hcd 0000:39:00.0: Timeout while waiting for setup dev=
ice command
> [38631.585798] usb 4-1.4: device not accepting address 10, error -62
> [38632.354657] usb 4-1.1.2: new SuperSpeed USB device number 12 using xhc=
i_hcd
> [38632.393341] usb 4-1.1.2: New USB device found, idVendor=3D0bda, idProd=
uct=3D0409, bcdDevice=3D 1.41
> [38632.393369] usb 4-1.1.2: New USB device strings: Mfr=3D1, Product=3D2,=
 SerialNumber=3D0
> [38632.393380] usb 4-1.1.2: Product: 4-Port USB 3.0 Hub
> [38632.393389] usb 4-1.1.2: Manufacturer: Generic
> [38632.400130] hub 4-1.1.2:1.0: USB hub found
> [38632.401721] hub 4-1.1.2:1.0: 2 ports detected
> [38632.499522] r8152 4-1.1.3:1.0 enx00e04ceabc41: renamed from eth0
> [38632.501556] usb 3-1.1.2: new high-speed USB device number 14 using xhc=
i_hcd
> [38632.556184] r8152 4-1.1.3:1.0 enx00e04ceabc41: carrier on
> [38632.619579] usb 3-1.1.2: New USB device found, idVendor=3D0bda, idProd=
uct=3D5409, bcdDevice=3D 1.41
> [38632.619594] usb 3-1.1.2: New USB device strings: Mfr=3D1, Product=3D2,=
 SerialNumber=3D0
> [38632.619600] usb 3-1.1.2: Product: 4-Port USB 2.0 Hub
> [38632.619605] usb 3-1.1.2: Manufacturer: Generic
> [38632.622412] hub 3-1.1.2:1.0: USB hub found
> [38632.623596] hub 3-1.1.2:1.0: 4 ports detected
> [38632.913524] usb 3-1.1.2.3: new low-speed USB device number 15 using xh=
ci_hcd
> [38633.019668] usb 3-1.1.2.3: New USB device found, idVendor=3D1bcf, idPr=
oduct=3D0005, bcdDevice=3D 0.14
> [38633.019695] usb 3-1.1.2.3: New USB device strings: Mfr=3D0, Product=3D=
2, SerialNumber=3D0
> [38633.019707] usb 3-1.1.2.3: Product: USB Optical Mouse
> [38633.031545] input: USB Optical Mouse as /devices/pci0000:00/0000:00:1c=
=2E0/0000:01:00.0/0000:02:02.0/0000:39:00.0/usb3/3-1/3-1.1/3-1.1.2/3-1.1.2.=
3/3-1.1.2.3:1.0/0003:1BCF:0005.0014/input/input70
> [38633.033300] hid-generic 0003:1BCF:0005.0014: input,hidraw2: USB HID v1=
=2E10 Mouse [USB Optical Mouse] on usb-0000:39:00.0-1.1.2.3/input0
> [38633.113596] usb 3-1.1.2.4: new low-speed USB device number 16 using xh=
ci_hcd
> [38633.225735] usb 3-1.1.2.4: New USB device found, idVendor=3D413c, idPr=
oduct=3D2113, bcdDevice=3D 1.08
> [38633.225768] usb 3-1.1.2.4: New USB device strings: Mfr=3D0, Product=3D=
2, SerialNumber=3D0
> [38633.225779] usb 3-1.1.2.4: Product: Dell KB216 Wired Keyboard
> [38633.239071] input: Dell KB216 Wired Keyboard as /devices/pci0000:00/00=
00:00:1c.0/0000:01:00.0/0000:02:02.0/0000:39:00.0/usb3/3-1/3-1.1/3-1.1.2/3-=
1.1.2.4/3-1.1.2.4:1.0/0003:413C:2113.0015/input/input71
> [38633.298892] hid-generic 0003:413C:2113.0015: input,hidraw3: USB HID v1=
=2E11 Keyboard [Dell KB216 Wired Keyboard] on usb-0000:39:00.0-1.1.2.4/inpu=
t0
> [38633.304640] input: Dell KB216 Wired Keyboard System Control as /device=
s/pci0000:00/0000:00:1c.0/0000:01:00.0/0000:02:02.0/0000:39:00.0/usb3/3-1/3=
-1.1/3-1.1.2/3-1.1.2.4/3-1.1.2.4:1.1/0003:413C:2113.0016/input/input72
> [38633.364625] input: Dell KB216 Wired Keyboard Consumer Control as /devi=
ces/pci0000:00/0000:00:1c.0/0000:01:00.0/0000:02:02.0/0000:39:00.0/usb3/3-1=
/3-1.1/3-1.1.2/3-1.1.2.4/3-1.1.2.4:1.1/0003:413C:2113.0016/input/input73
> [38633.366247] hid-generic 0003:413C:2113.0016: input,hidraw4: USB HID v1=
=2E11 Device [Dell KB216 Wired Keyboard] on usb-0000:39:00.0-1.1.2.4/input1
> [38638.537721] xhci_hcd 0000:39:00.0: Timeout while waiting for setup dev=
ice command
> [38638.537926] r8152-cfgselector 4-1.1.3: Failed to read 4 bytes at 0xc01=
0/0x0100 (-110)
> [38642.633437] ------------[ cut here ]------------
> [38642.633441] NETDEV WATCHDOG: enx00e04ceabc41 (r8152): transmit queue 0=
 timed out 9108 ms
> [38642.633456] WARNING: CPU: 0 PID: 18199 at net/sched/sch_generic.c:525 =
dev_watchdog+0x232/0x240
> [38642.633463] Modules linked in: snd_usb_audio snd_usbmidi_lib snd_rawmi=
di rfcomm cmac algif_hash algif_skcipher af_alg bnep st sr_mod cdrom nvram =
typec_displayport r8153_ecm cdc_ether usbnet r8152 mii ccm sd_mod sg uas us=
b_storage scsi_mod scsi_common snd_seq_dummy snd_hrtimer snd_seq snd_seq_de=
vice l2tp_ppp l2tp_netlink l2tp_core ip6_udp_tunnel xfrm_interface xfrm6_tu=
nnel udp_tunnel tunnel6 tunnel4 pppox xfrm_user xfrm_algo ppp_generic slhc =
qrtr snd_sof_pci_intel_skl snd_sof_intel_hda_common snd_hda_codec_hdmi soun=
dwire_intel soundwire_generic_allocation snd_sof_intel_hda_mlink soundwire_=
cadence snd_ctl_led snd_sof_intel_hda snd_sof_pci snd_sof_xtensa_dsp snd_so=
f snd_hda_codec_realtek snd_hda_codec_generic snd_sof_utils soundwire_bus s=
nd_soc_avs snd_soc_hda_codec snd_soc_skl snd_soc_hdac_hda snd_hda_ext_core =
snd_soc_sst_ipc snd_soc_sst_dsp snd_soc_acpi_intel_match binfmt_misc snd_so=
c_acpi snd_soc_core ath10k_pci snd_compress x86_pkg_temp_thermal intel_powe=
rclamp ath10k_core coretemp snd_pcm_dmaengine kvm_intel
> [38642.633516]  nls_ascii snd_hda_intel nls_cp437 ath snd_intel_dspcfg kv=
m vfat mei_hdcp snd_intel_sdw_acpi mei_pxp mei_wdt fat i915 snd_hda_codec m=
ac80211 uvcvideo irqbypass intel_rapl_msr btusb dell_laptop snd_hda_core le=
dtrig_audio btrtl libarc4 dell_wmi dell_smm_hwmon btintel snd_hwdep rapl jo=
ydev videobuf2_vmalloc dell_smbios intel_cstate snd_pcm iTCO_wdt dcdbas btb=
cm intel_wmi_thunderbolt intel_pmc_bxt snd_timer uvc cfg80211 btmtk videobu=
f2_memops wmi_bmof snd intel_uncore videobuf2_v4l2 dell_wmi_descriptor blue=
tooth iTCO_vendor_support videodev mei_me watchdog soundcore pcspkr ucsi_ac=
pi typec_ucsi videobuf2_common ecdh_generic mei typec rfkill mc drm_buddy i=
ntel_pch_thermal drm_display_helper cec intel_vbtn processor_thermal_device=
_pci_legacy soc_button_array rc_core processor_thermal_device ttm processor=
_thermal_rfim processor_thermal_mbox drm_kms_helper int3403_thermal process=
or_thermal_rapl intel_rapl_common intel_xhci_usb_role_switch int3400_therma=
l i2c_algo_bit int340x_thermal_zone intel_hid intel_pmc_core
> [38642.633571]  acpi_thermal_rel ac roles intel_soc_dts_iosf acpi_pad spa=
rse_keymap evdev button hid_multitouch serio_raw msr parport_pc ppdev lp pa=
rport loop efi_pstore configfs nfnetlink efivarfs ip_tables x_tables autofs=
4 ext4 crc16 mbcache jbd2 crc32c_generic usbhid dm_crypt dm_mod nvme crc32_=
pclmul nvme_core crc32c_intel ghash_clmulni_intel t10_pi hid_generic sha512=
_ssse3 xhci_pci crc64_rocksoft_generic xhci_hcd sha256_ssse3 i2c_hid_acpi i=
2c_hid sha1_ssse3 crc64_rocksoft drm usbcore crc_t10dif aesni_intel i2c_i80=
1 intel_lpss_pci crct10dif_generic crct10dif_pclmul intel_lpss crc64 crypto=
_simd cryptd idma64 crct10dif_common i2c_smbus usb_common hid battery video=
 wmi
> [38642.633615] CPU: 0 PID: 18199 Comm: Compositor Not tainted 6.6.15-amd6=
4 #1  Debian 6.6.15-2
> [38642.633618] Hardware name: Dell Inc. XPS 13 9360/0596KF, BIOS 2.21.0 0=
6/02/2022
> [38642.633619] RIP: 0010:dev_watchdog+0x232/0x240
> [38642.633622] Code: ff ff ff 48 89 df c6 05 6e e1 3f 01 01 e8 86 32 fa f=
f 45 89 f8 44 89 f1 48 89 de 48 89 c2 48 c7 c7 98 5f 12 8c e8 be 97 6a ff <=
0f> 0b e9 2d ff ff ff 0f 1f 80 00 00 00 00 90 90 90 90 90 90 90 90
> [38642.633624] RSP: 0018:ffffc90000003e78 EFLAGS: 00010286
> [38642.633626] RAX: 0000000000000000 RBX: ffff888166230000 RCX: 000000000=
0000027
> [38642.633627] RDX: ffff88846f0213c8 RSI: 0000000000000001 RDI: ffff88846=
f0213c0
> [38642.633629] RBP: ffff8881662304c8 R08: 0000000000000000 R09: ffffc9000=
0003d00
> [38642.633630] R10: 0000000000000003 R11: ffff888480ffdfe8 R12: ffff88810=
79b9a00
> [38642.633631] R13: ffff88816623041c R14: 0000000000000000 R15: 000000000=
0002394
> [38642.633632] FS:  00007f87749ff6c0(0000) GS:ffff88846f000000(0000) knlG=
S:0000000000000000
> [38642.633634] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [38642.633635] CR2: 00007f875e26d000 CR3: 000000014536e003 CR4: 000000000=
03706f0
> [38642.633637] Call Trace:
> [38642.633639]  <IRQ>
> [38642.633640]  ? dev_watchdog+0x232/0x240
> [38642.633642]  ? __warn+0x81/0x130
> [38642.633647]  ? dev_watchdog+0x232/0x240
> [38642.633649]  ? report_bug+0x171/0x1a0
> [38642.633652]  ? prb_read_valid+0x1b/0x30
> [38642.633655]  ? handle_bug+0x3c/0x80
> [38642.633658]  ? exc_invalid_op+0x17/0x70
> [38642.633660]  ? asm_exc_invalid_op+0x1a/0x20
> [38642.633664]  ? dev_watchdog+0x232/0x240
> [38642.633666]  ? dev_watchdog+0x232/0x240
> [38642.633668]  ? __pfx_dev_watchdog+0x10/0x10
> [38642.633670]  call_timer_fn+0x24/0x130
> [38642.633673]  ? __pfx_dev_watchdog+0x10/0x10
> [38642.633675]  __run_timers+0x222/0x2c0
> [38642.633679]  run_timer_softirq+0x1d/0x40
> [38642.633681]  __do_softirq+0xc7/0x2ae
> [38642.633686]  __irq_exit_rcu+0x96/0xb0
> [38642.633689]  sysvec_apic_timer_interrupt+0x72/0x90
> [38642.633693]  </IRQ>
> [38642.633694]  <TASK>
> [38642.633695]  asm_sysvec_apic_timer_interrupt+0x1a/0x20
> [38642.633697] RIP: 0010:_compound_head+0x8/0x40
> [38642.633700] Code: 44 00 00 c3 cc cc cc cc 66 2e 0f 1f 84 00 00 00 00 0=
0 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 48 8b 47 08 a8 01 75 21 <=
66> 90 48 89 f8 c3 cc cc cc cc f7 c7 ff 0f 00 00 75 f0 48 8b 07 a8
> [38642.633702] RSP: 0018:ffffc90006453c00 EFLAGS: 00000246
> [38642.633704] RAX: ffffea000bbc0208 RBX: ffff8882f72e52c0 RCX: 000000000=
0000000
> [38642.633705] RDX: 8000000000000867 RSI: 80000002fd040867 RDI: ffffea000=
bf41000
> [38642.633706] RBP: 00007f8737059000 R08: ffff8882de5b4cf0 R09: 000000000=
0000011
> [38642.633707] R10: 0000000000000001 R11: 0000000000000100 R12: ffffc9000=
6453d30
> [38642.633708] R13: 00007f8737058000 R14: ffffea000bf41000 R15: 000000000=
0000000
> [38642.633712]  unmap_page_range+0x601/0x1060
> [38642.633717]  zap_page_range_single+0x122/0x1d0
> [38642.633721]  do_madvise+0xc85/0x1000
> [38642.633726]  ? exit_to_user_mode_prepare+0x40/0x1e0
> [38642.633728]  ? syscall_exit_to_user_mode+0x2b/0x40
> [38642.633731]  __x64_sys_madvise+0x2c/0x40
> [38642.633733]  do_syscall_64+0x5d/0xc0
> [38642.633737]  ? do_user_addr_fault+0x30f/0x660
> [38642.633741]  ? exit_to_user_mode_prepare+0x40/0x1e0
> [38642.633743]  entry_SYSCALL_64_after_hwframe+0x6e/0xd8
> [38642.633745] RIP: 0033:0x7f878f11f337
> [38642.633747] Code: ff ff ff ff c3 66 0f 1f 44 00 00 48 8b 15 d9 1a 0d 0=
0 f7 d8 64 89 02 b8 ff ff ff ff eb bc 0f 1f 44 00 00 b8 1c 00 00 00 0f 05 <=
48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d b1 1a 0d 00 f7 d8 64 89 01 48
> [38642.633749] RSP: 002b:00007f87749fe8c8 EFLAGS: 00000206 ORIG_RAX: 0000=
00000000001c
> [38642.633751] RAX: ffffffffffffffda RBX: 0000000000000080 RCX: 00007f878=
f11f337
> [38642.633752] RDX: 0000000000000004 RSI: 0000000000017000 RDI: 00007f873=
704b000
> [38642.633753] RBP: 000000000000004b R08: 00007f875e000c68 R09: 000000000=
006b008
> [38642.633754] R10: 0000000000000000 R11: 0000000000000206 R12: 00007f873=
7000000
> [38642.633755] R13: 00007f8737000018 R14: 00007f878ef00000 R15: 00007f878=
ef00060
> [38642.633758]  </TASK>
> [38642.633759] ---[ end trace 0000000000000000 ]---
> [38642.633763] r8152 4-1.1.3:1.0 enx00e04ceabc41: Tx timeout
> [38642.634888] usb 3-1.1.2: USB disconnect, device number 14
> [38642.634893] usb 3-1.1.2.3: USB disconnect, device number 15
> [38643.913481] xhci_hcd 0000:39:00.0: Timeout while waiting for setup dev=
ice command
> [38643.913970] usb 4-1.1.2: USB disconnect, device number 12
> [38643.967204] usb 3-1.1.2.4: USB disconnect, device number 16
> [38644.121497] usb 4-1.4: device not accepting address 13, error -62
> [38644.204560] r8152-cfgselector 4-1.1.3: reset SuperSpeed USB device num=
ber 9 using xhci_hcd
> [38644.222345] r8152-cfgselector 4-1.1.3: device firmware changed
> [38644.222683] r8152 4-1.1.3:1.0 enx00e04ceabc41: Get ether addr fail
> [38644.223644] r8152-cfgselector 4-1.1.3: USB disconnect, device number 9
> [38645.241754] usb 4-1.1.3: new SuperSpeed USB device number 15 using xhc=
i_hcd
> [38645.274925] usb 4-1.1.3: New USB device found, idVendor=3D0bda, idProd=
uct=3D8153, bcdDevice=3D30.00
> [38645.274933] usb 4-1.1.3: New USB device strings: Mfr=3D1, Product=3D2,=
 SerialNumber=3D6
> [38645.274936] usb 4-1.1.3: Product: USB 10/100/1000 LAN
> [38645.274938] usb 4-1.1.3: Manufacturer: Realtek
> [38645.274940] usb 4-1.1.3: SerialNumber: 000001
> [38645.353643] usb 3-1.1.2: new high-speed USB device number 17 using xhc=
i_hcd
> [38645.471405] usb 3-1.1.2: New USB device found, idVendor=3D0bda, idProd=
uct=3D5409, bcdDevice=3D 1.41
> [38645.471430] usb 3-1.1.2: New USB device strings: Mfr=3D1, Product=3D2,=
 SerialNumber=3D0
> [38645.471439] usb 3-1.1.2: Product: 4-Port USB 2.0 Hub
> [38645.471447] usb 3-1.1.2: Manufacturer: Generic
> [38645.477812] hub 3-1.1.2:1.0: USB hub found
> [38645.479071] hub 3-1.1.2:1.0: 4 ports detected
> [38645.541942] r8152-cfgselector 4-1.1.3: reset SuperSpeed USB device num=
ber 15 using xhci_hcd
> [38645.567808] r8152 4-1.1.3:1.0: firmware: direct-loading firmware rtl_n=
ic/rtl8153a-4.fw
> [38645.584243] r8152 4-1.1.3:1.0: load rtl8153a-4 v2 02/07/20 successfully
> [38645.615859] r8152 4-1.1.3:1.0 eth0: v1.12.13
> [38645.769699] usb 3-1.1.2.3: new low-speed USB device number 18 using xh=
ci_hcd
> [38645.875122] usb 3-1.1.2.3: New USB device found, idVendor=3D1bcf, idPr=
oduct=3D0005, bcdDevice=3D 0.14
> [38645.875148] usb 3-1.1.2.3: New USB device strings: Mfr=3D0, Product=3D=
2, SerialNumber=3D0
> [38645.875158] usb 3-1.1.2.3: Product: USB Optical Mouse
> [38645.886715] input: USB Optical Mouse as /devices/pci0000:00/0000:00:1c=
=2E0/0000:01:00.0/0000:02:02.0/0000:39:00.0/usb3/3-1/3-1.1/3-1.1.2/3-1.1.2.=
3/3-1.1.2.3:1.0/0003:1BCF:0005.0017/input/input74
> [38645.887619] hid-generic 0003:1BCF:0005.0017: input,hidraw2: USB HID v1=
=2E10 Mouse [USB Optical Mouse] on usb-0000:39:00.0-1.1.2.3/input0
> [38645.950471] usb 4-1.1.2: new SuperSpeed USB device number 16 using xhc=
i_hcd
> [38645.987887] usb 4-1.1.2: New USB device found, idVendor=3D0bda, idProd=
uct=3D0409, bcdDevice=3D 1.41
> [38645.987912] usb 4-1.1.2: New USB device strings: Mfr=3D1, Product=3D2,=
 SerialNumber=3D0
> [38645.987923] usb 4-1.1.2: Product: 4-Port USB 3.0 Hub
> [38645.987931] usb 4-1.1.2: Manufacturer: Generic
> [38645.997841] hub 4-1.1.2:1.0: USB hub found
> [38645.999463] hub 4-1.1.2:1.0: 2 ports detected
> [38646.057710] usb 3-1.1.2.4: new low-speed USB device number 19 using xh=
ci_hcd
> [38646.167623] usb 3-1.1.2.4: New USB device found, idVendor=3D413c, idPr=
oduct=3D2113, bcdDevice=3D 1.08
> [38646.167652] usb 3-1.1.2.4: New USB device strings: Mfr=3D0, Product=3D=
2, SerialNumber=3D0
> [38646.167667] usb 3-1.1.2.4: Product: Dell KB216 Wired Keyboard
> [38646.179226] input: Dell KB216 Wired Keyboard as /devices/pci0000:00/00=
00:00:1c.0/0000:01:00.0/0000:02:02.0/0000:39:00.0/usb3/3-1/3-1.1/3-1.1.2/3-=
1.1.2.4/3-1.1.2.4:1.0/0003:413C:2113.0018/input/input75
> [38646.228219] r8152 4-1.1.3:1.0 enx00e04ceabc41: renamed from eth0
> [38646.237585] hid-generic 0003:413C:2113.0018: input,hidraw3: USB HID v1=
=2E11 Keyboard [Dell KB216 Wired Keyboard] on usb-0000:39:00.0-1.1.2.4/inpu=
t0
> [38646.242108] input: Dell KB216 Wired Keyboard System Control as /device=
s/pci0000:00/0000:00:1c.0/0000:01:00.0/0000:02:02.0/0000:39:00.0/usb3/3-1/3=
-1.1/3-1.1.2/3-1.1.2.4/3-1.1.2.4:1.1/0003:413C:2113.0019/input/input76
> [38646.301897] input: Dell KB216 Wired Keyboard Consumer Control as /devi=
ces/pci0000:00/0000:00:1c.0/0000:01:00.0/0000:02:02.0/0000:39:00.0/usb3/3-1=
/3-1.1/3-1.1.2/3-1.1.2.4/3-1.1.2.4:1.1/0003:413C:2113.0019/input/input77
> [38646.302145] hid-generic 0003:413C:2113.0019: input,hidraw4: USB HID v1=
=2E11 Device [Dell KB216 Wired Keyboard] on usb-0000:39:00.0-1.1.2.4/input1
> [38649.323714] r8152 4-1.1.3:1.0 enx00e04ceabc41: carrier on
> [38651.133683] usb 4-1.1.2: USB disconnect, device number 16
> [38651.339130] usb 3-1.1.2: USB disconnect, device number 17
> [38651.339137] usb 3-1.1.2.3: USB disconnect, device number 18
> [38651.373344] usb 3-1.1.2.4: USB disconnect, device number 19
> [38655.226715] usb 4-1.1.2: new SuperSpeed USB device number 17 using xhc=
i_hcd
> [38655.262775] usb 4-1.1.2: New USB device found, idVendor=3D0bda, idProd=
uct=3D0409, bcdDevice=3D 1.41
> [38655.262787] usb 4-1.1.2: New USB device strings: Mfr=3D1, Product=3D2,=
 SerialNumber=3D0
> [38655.262791] usb 4-1.1.2: Product: 4-Port USB 3.0 Hub
> [38655.262794] usb 4-1.1.2: Manufacturer: Generic
> [38655.268905] hub 4-1.1.2:1.0: USB hub found
> [38655.270308] hub 4-1.1.2:1.0: 2 ports detected
> [38655.405611] usb 3-1.1.2: new high-speed USB device number 20 using xhc=
i_hcd
> [38655.530977] usb 3-1.1.2: New USB device found, idVendor=3D0bda, idProd=
uct=3D5409, bcdDevice=3D 1.41
> [38655.531005] usb 3-1.1.2: New USB device strings: Mfr=3D1, Product=3D2,=
 SerialNumber=3D0
> [38655.531017] usb 3-1.1.2: Product: 4-Port USB 2.0 Hub
> [38655.531025] usb 3-1.1.2: Manufacturer: Generic
> [38655.537787] hub 3-1.1.2:1.0: USB hub found
> [38655.539698] hub 3-1.1.2:1.0: 4 ports detected
> [38655.829616] usb 3-1.1.2.3: new low-speed USB device number 21 using xh=
ci_hcd
> [38655.938429] usb 3-1.1.2.3: New USB device found, idVendor=3D1bcf, idPr=
oduct=3D0005, bcdDevice=3D 0.14
> [38655.938437] usb 3-1.1.2.3: New USB device strings: Mfr=3D0, Product=3D=
2, SerialNumber=3D0
> [38655.938440] usb 3-1.1.2.3: Product: USB Optical Mouse
> [38655.947994] input: USB Optical Mouse as /devices/pci0000:00/0000:00:1c=
=2E0/0000:01:00.0/0000:02:02.0/0000:39:00.0/usb3/3-1/3-1.1/3-1.1.2/3-1.1.2.=
3/3-1.1.2.3:1.0/0003:1BCF:0005.001A/input/input78
> [38655.948311] hid-generic 0003:1BCF:0005.001A: input,hidraw2: USB HID v1=
=2E10 Mouse [USB Optical Mouse] on usb-0000:39:00.0-1.1.2.3/input0
> [38656.025535] usb 3-1.1.2.4: new low-speed USB device number 22 using xh=
ci_hcd
> [38656.132800] usb 3-1.1.2.4: New USB device found, idVendor=3D413c, idPr=
oduct=3D2113, bcdDevice=3D 1.08
> [38656.132827] usb 3-1.1.2.4: New USB device strings: Mfr=3D0, Product=3D=
2, SerialNumber=3D0
> [38656.132839] usb 3-1.1.2.4: Product: Dell KB216 Wired Keyboard
> [38656.145479] input: Dell KB216 Wired Keyboard as /devices/pci0000:00/00=
00:00:1c.0/0000:01:00.0/0000:02:02.0/0000:39:00.0/usb3/3-1/3-1.1/3-1.1.2/3-=
1.1.2.4/3-1.1.2.4:1.0/0003:413C:2113.001B/input/input79
> [38656.206967] hid-generic 0003:413C:2113.001B: input,hidraw3: USB HID v1=
=2E11 Keyboard [Dell KB216 Wired Keyboard] on usb-0000:39:00.0-1.1.2.4/inpu=
t0
> [38656.214961] input: Dell KB216 Wired Keyboard System Control as /device=
s/pci0000:00/0000:00:1c.0/0000:01:00.0/0000:02:02.0/0000:39:00.0/usb3/3-1/3=
-1.1/3-1.1.2/3-1.1.2.4/3-1.1.2.4:1.1/0003:413C:2113.001C/input/input80
> [38656.274216] input: Dell KB216 Wired Keyboard Consumer Control as /devi=
ces/pci0000:00/0000:00:1c.0/0000:01:00.0/0000:02:02.0/0000:39:00.0/usb3/3-1=
/3-1.1/3-1.1.2/3-1.1.2.4/3-1.1.2.4:1.1/0003:413C:2113.001C/input/input81
> [38656.274934] hid-generic 0003:413C:2113.001C: input,hidraw4: USB HID v1=
=2E11 Device [Dell KB216 Wired Keyboard] on usb-0000:39:00.0-1.1.2.4/input1


--=20
heikki

