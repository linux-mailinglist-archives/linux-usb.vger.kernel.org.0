Return-Path: <linux-usb+bounces-31852-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 673D6CEA89C
	for <lists+linux-usb@lfdr.de>; Tue, 30 Dec 2025 20:35:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3CAFF30133E8
	for <lists+linux-usb@lfdr.de>; Tue, 30 Dec 2025 19:35:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 418C926F2A7;
	Tue, 30 Dec 2025 19:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=frehi.be header.i=@frehi.be header.b="glSOugo4"
X-Original-To: linux-usb@vger.kernel.org
Received: from torino.frehi.be (torino.frehi.be [51.178.16.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0634F1B81CA;
	Tue, 30 Dec 2025 19:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=51.178.16.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767123304; cv=none; b=en+P9NVGhtxm1W+yu36kk/stRF//3oo0rIGPGxfY7Y2D2qCt9usntRQGhqTmDimtQgt1XgZnTSOn4RRQ/fdDHhkQFgHTC6Y0x4t5BrG7D02g94z1Q7wZ+MXNn2tOFTqlcKaagWuX2wK0w982GC1Y2AUUOA84203ZE+a9DsBFJ7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767123304; c=relaxed/simple;
	bh=f3T1RsL8BmCXjbcrnnpqV2rLh0F6si0zpZbQbNxu+hw=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LLQcPUYcGJHXvqgtBFEOAhI+SnmlknuD/lp03O+hkx+MaID99VaZpdGBEJI4XHUNpqUSSj7rY+Z0smXAF2RIt6i+M2rE61PrSK1pgnziciosbR0FYitHvprqgLNNn2RHG4r+LJnzFcfo5h8A7jO84x+ahBe3b5QVLkgzGWJrcGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=frehi.be; spf=pass smtp.mailfrom=frehi.be; dkim=pass (2048-bit key) header.d=frehi.be header.i=@frehi.be header.b=glSOugo4; arc=none smtp.client-ip=51.178.16.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=frehi.be
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=frehi.be
Received: from localhost (localhost [127.0.0.1])
	by torino.frehi.be (Postfix) with ESMTP id 6129AD72E22;
	Tue, 30 Dec 2025 20:34:56 +0100 (CET)
Received: from torino.frehi.be ([127.0.0.1])
 by localhost (torino.frehi.be [127.0.0.1]) (amavis, port 10026) with LMTP
 id eV8sbO9PcVz0; Tue, 30 Dec 2025 20:34:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=frehi.be;
	s=torino-201912; t=1767123294;
	bh=f3T1RsL8BmCXjbcrnnpqV2rLh0F6si0zpZbQbNxu+hw=;
	h=Date:From:To:Subject:From;
	b=glSOugo4fILQuYKvCndyQRQQVmrciN6g6WtMhp6qaWRNdM9G6qutA7O0z2M60pGQZ
	 /mJ/mNQghurBYdVU6CwpdQSQAk6F5zy+QQUNI9EfwHMRWfEv7wmpSFI0THpuDKBJQV
	 msyHKUOngcX+Y4Fy10K+a3MLxCfE9pGh5Xb6waQk0MbCd1rKGXMaSYNB5/RvXau9Vu
	 LiMUYRZDafLgKtq//d+nKC21JyqmJ697fLKaApysc8X+FWsBOH11peG4YqcxJx5gg5
	 aKF+0KqLogznS5VTIidVkEVpJhKZcDFsAMv6fAeDoEBbgmRHujuVgjazpt9jTOT6PD
	 4eygPjVHKvg4g==
Received: by torino.frehi.be (Postfix, from userid 1000)
	id 2B5CAD72E1F; Tue, 30 Dec 2025 20:34:54 +0100 (CET)
Date: Tue, 30 Dec 2025 20:34:54 +0100
From: Frederik Himpe <frederik@frehi.be>
To: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Endless loop USB device disconnects and connects after wakeup from
 s2idle
Message-ID: <aVQpXiJbuxT9YKFL@frehi.be>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="x9CtWmzuiv/fctnO"
Content-Disposition: inline


--x9CtWmzuiv/fctnO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On my HP EliteBook 8 G1a 14 with Linux 6.28.2, sometimes when waking up
my system after s2idle, the system triggers and andless loop of
disconnect and connect events for the ELAN:ARM-M4 USB device, which I
guess is the fingerprint reader.

On this system, I also have a second problem with an amd-pmf error
appearing in an enless loop, which I reported here:
https://lore.kernel.org/lkml/aVK0QPrtjyASafJm@frehi.be/T/#u
but I have not yet seen those two problems together, so I have the
feeling these are distinct problems.

Any idea how I could debug this further?

[ 5203.044043] kernel: usb 3-4: reset full-speed USB device number 3 using xhci_hcd
[ 5222.850312] kernel: usb 3-4: reset full-speed USB device number 3 using xhci_hcd
[ 5253.836061] kernel: usb 3-4: USB disconnect, device number 3
[ 5253.960060] kernel: usb 3-4: new full-speed USB device number 5 using xhci_hcd
[ 5254.128038] kernel: usb 3-4: New USB device found, idVendor=04f3, idProduct=0c9f, bcdDevice= 8.03
[ 5254.128382] kernel: usb 3-4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[ 5254.128518] kernel: usb 3-4: Product: ELAN:ARM-M4
[ 5254.128634] kernel: usb 3-4: Manufacturer: ELAN
[ 5254.128744] kernel: usb 3-4: Device is not authorized for usage
[ 5254.132045] kernel: usb 3-4: authorized to connect
[ 5259.844069] kernel: usb 3-4: USB disconnect, device number 5
[ 5260.092265] kernel: usb 3-4: new full-speed USB device number 6 using xhci_hcd
[ 5260.260030] kernel: usb 3-4: New USB device found, idVendor=04f3, idProduct=0c9f, bcdDevice= 8.03
[ 5260.260343] kernel: usb 3-4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[ 5260.260484] kernel: usb 3-4: Product: ELAN:ARM-M4
[ 5260.260599] kernel: usb 3-4: Manufacturer: ELAN
[ 5260.260711] kernel: usb 3-4: Device is not authorized for usage
[ 5260.264025] kernel: usb 3-4: authorized to connect
[ 5265.864043] kernel: usb 3-4: USB disconnect, device number 6
[ 5265.988113] kernel: usb 3-4: new full-speed USB device number 7 using xhci_hcd
[ 5266.156039] kernel: usb 3-4: New USB device found, idVendor=04f3, idProduct=0c9f, bcdDevice= 8.03
[ 5266.156357] kernel: usb 3-4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[ 5266.156489] kernel: usb 3-4: Product: ELAN:ARM-M4
[ 5266.156606] kernel: usb 3-4: Manufacturer: ELAN
[ 5266.156714] kernel: usb 3-4: Device is not authorized for usage
[ 5266.160031] kernel: usb 3-4: authorized to connect
[ 5271.880036] kernel: usb 3-4: USB disconnect, device number 7
[ 5272.136191] kernel: usb 3-4: new full-speed USB device number 8 using xhci_hcd
[ 5272.304041] kernel: usb 3-4: New USB device found, idVendor=04f3, idProduct=0c9f, bcdDevice= 8.03
[ 5272.304371] kernel: usb 3-4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[ 5272.304511] kernel: usb 3-4: Product: ELAN:ARM-M4
[ 5272.304623] kernel: usb 3-4: Manufacturer: ELAN
[ 5272.304727] kernel: usb 3-4: Device is not authorized for usage
[ 5272.308026] kernel: usb 3-4: authorized to connect
[ 5277.916053] kernel: usb 3-4: USB disconnect, device number 8

Full kernel log attached.

--x9CtWmzuiv/fctnO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="kernel.log"

[    0.893304] kernel: Linux version 6.18-amd64 (debian-kernel@lists.debian.org) (x86_64-linux-gnu-gcc-15 (Debian 15.2.0-11) 15.2.0, GNU ld (GNU Binutils for Debian) 2.45.50.20251209) #1 SMP PREEMPT_DYNAMIC Debian 6.18.2-1~exp1 (2025-12-18)
[    0.893339] kernel: Command line: initrd=\efc892db302843fb9ae1201a4a541dcb\6.18-amd64\initrd.img-6.18-amd64 root=UUID=158e40e5-7a47-422d-9742-681072369fa3 rootflags=subvol=@rootfs quiet splash pcie_aspm=force systemd.machine_id=efc892db302843fb9ae1201a4a541dcb
[    0.893348] kernel: x86/split lock detection: #DB: warning on user-space bus_locks
[    0.893353] kernel: BIOS-provided physical RAM map:
[    0.893358] kernel: BIOS-e820: [mem 0x0000000000000000-0x000000000009efff] usable
[    0.893362] kernel: BIOS-e820: [mem 0x000000000009f000-0x000000000009ffff] reserved
[    0.893368] kernel: BIOS-e820: [mem 0x0000000000100000-0x0000000009efffff] usable
[    0.893372] kernel: BIOS-e820: [mem 0x0000000009f00000-0x0000000009f3bfff] ACPI NVS
[    0.893377] kernel: BIOS-e820: [mem 0x0000000009f3c000-0x0000000044ad3fff] usable
[    0.893383] kernel: BIOS-e820: [mem 0x0000000044ad4000-0x0000000048851fff] reserved
[    0.893388] kernel: BIOS-e820: [mem 0x0000000048852000-0x0000000048f51fff] ACPI NVS
[    0.893393] kernel: BIOS-e820: [mem 0x0000000048f52000-0x0000000048ff6fff] ACPI data
[    0.893398] kernel: BIOS-e820: [mem 0x0000000048ff7000-0x0000000052bcefff] usable
[    0.893402] kernel: BIOS-e820: [mem 0x0000000052bcf000-0x0000000052bcffff] reserved
[    0.893408] kernel: BIOS-e820: [mem 0x0000000052bd0000-0x0000000052bdbfff] usable
[    0.893414] kernel: BIOS-e820: [mem 0x0000000052bdc000-0x0000000052bdcfff] reserved
[    0.893418] kernel: BIOS-e820: [mem 0x0000000052bdd000-0x000000005cfecfff] usable
[    0.893422] kernel: BIOS-e820: [mem 0x000000005cfed000-0x000000005cff1fff] reserved
[    0.893427] kernel: BIOS-e820: [mem 0x000000005cff2000-0x0000000077ffffff] usable
[    0.893432] kernel: BIOS-e820: [mem 0x0000000078000000-0x000000007bffffff] reserved
[    0.893437] kernel: BIOS-e820: [mem 0x000000007d675000-0x000000007d6fffff] reserved
[    0.893441] kernel: BIOS-e820: [mem 0x000000007d800000-0x000000007fffffff] reserved
[    0.893446] kernel: BIOS-e820: [mem 0x00000000e0000000-0x00000000efffffff] reserved
[    0.893451] kernel: BIOS-e820: [mem 0x00000000fd300000-0x00000000fd3fffff] reserved
[    0.893456] kernel: BIOS-e820: [mem 0x00000000fec00000-0x00000000fec00fff] reserved
[    0.893460] kernel: BIOS-e820: [mem 0x00000000fec10000-0x00000000fec10fff] reserved
[    0.893465] kernel: BIOS-e820: [mem 0x00000000fed80000-0x00000000fed80fff] reserved
[    0.893470] kernel: BIOS-e820: [mem 0x00000000fedf1000-0x00000000fedf1fff] reserved
[    0.893474] kernel: BIOS-e820: [mem 0x00000000fee00000-0x00000000fee00fff] reserved
[    0.893479] kernel: BIOS-e820: [mem 0x0000000100000000-0x000000085e27ffff] usable
[    0.893484] kernel: BIOS-e820: [mem 0x000000085e280000-0x00000008a01fffff] reserved
[    0.893488] kernel: BIOS-e820: [mem 0x000000fd00000000-0x000000fd01ffffff] reserved
[    0.893493] kernel: NX (Execute Disable) protection: active
[    0.893498] kernel: APIC: Static calls initialized
[    0.893502] kernel: efi: EFI v2.9 by HP
[    0.893508] kernel: efi: ACPI=0x48ff6000 ACPI 2.0=0x48ff6014 SMBIOS=0x45da4000 SMBIOS 3.0=0x45da2000 TPMFinalLog=0x48e9f000 ESRT=0x45d39118 RTPROP=0x45d39898 MEMATTR=0x38488418 MOKvar=0x45dcd000 RNG=0x48f71f18 INITRD=0x2deecf98 TPMEventLog=0x48f66018 
[    0.893513] kernel: random: crng init done
[    0.893519] kernel: efi: Remove mem60: MMIO range=[0xe0000000-0xefffffff] (256MB) from e820 map
[    0.893524] kernel: e820: remove [mem 0xe0000000-0xefffffff] reserved
[    0.893529] kernel: efi: Remove mem61: MMIO range=[0xfd300000-0xfd3fffff] (1MB) from e820 map
[    0.893535] kernel: e820: remove [mem 0xfd300000-0xfd3fffff] reserved
[    0.893539] kernel: efi: Not removing mem62: MMIO range=[0xfec00000-0xfec00fff] (4KB) from e820 map
[    0.893544] kernel: efi: Not removing mem63: MMIO range=[0xfec10000-0xfec10fff] (4KB) from e820 map
[    0.893548] kernel: efi: Not removing mem64: MMIO range=[0xfed80000-0xfed80fff] (4KB) from e820 map
[    0.893552] kernel: efi: Not removing mem65: MMIO range=[0xfedf1000-0xfedf1fff] (4KB) from e820 map
[    0.893557] kernel: efi: Not removing mem66: MMIO range=[0xfee00000-0xfee00fff] (4KB) from e820 map
[    0.893561] kernel: efi: Remove mem68: MMIO range=[0x880000000-0x8a01fffff] (514MB) from e820 map
[    0.893566] kernel: e820: remove [mem 0x880000000-0x8a01fffff] reserved
[    0.893571] kernel: efi: Remove mem69: MMIO range=[0xfd00000000-0xfd01ffffff] (32MB) from e820 map
[    0.893576] kernel: e820: remove [mem 0xfd00000000-0xfd01ffffff] reserved
[    0.893581] kernel: Kernel is locked down from EFI Secure Boot; see man kernel_lockdown.7
[    0.893586] kernel: secureboot: Secure boot enabled
[    0.893591] kernel: SMBIOS 3.4.0 present.
[    0.893595] kernel: DMI: HP HP EliteBook 8 G1a 14 inch Notebook Next Gen AI PC/8E17, BIOS X84 Ver. 01.03.03 10/14/2025
[    0.893600] kernel: DMI: Memory slots populated: 2/2
[    0.893604] kernel: tsc: Fast TSC calibration using PIT
[    0.893609] kernel: tsc: Detected 1996.377 MHz processor
[    0.893613] kernel: e820: update [mem 0x00000000-0x00000fff] usable ==> reserved
[    0.893620] kernel: e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.893626] kernel: last_pfn = 0x85e280 max_arch_pfn = 0x400000000
[    0.893633] kernel: MTRR map: 8 entries (3 fixed + 5 variable; max 20), built from 9 variable MTRRs
[    0.893639] kernel: x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT  
[    0.893646] kernel: last_pfn = 0x78000 max_arch_pfn = 0x400000000
[    0.893652] kernel: esrt: Reserving ESRT space from 0x0000000045d39118 to 0x0000000045d391c8.
[    0.893660] kernel: Using GB pages for direct mapping
[    0.893667] kernel: RAMDISK: [mem 0x26f23000-0x2a01bfff]
[    0.893674] kernel: ACPI: Early table checksum verification disabled
[    0.893680] kernel: ACPI: RSDP 0x0000000048FF6014 000024 (v02 HPQOEM)
[    0.893687] kernel: ACPI: XSDT 0x0000000048F80228 0001C4 (v01 HPQOEM SLIC-BPC 00000001      01000013)
[    0.893694] kernel: ACPI: FACP 0x0000000048FE2000 00010C (v05 HPQOEM SLIC-BPC 00000001 HP   00000001)
[    0.893701] kernel: ACPI: DSDT 0x0000000048FC1000 01B4D6 (v02 HPQOEM 8E17     00000000 INTL 20200717)
[    0.893708] kernel: ACPI: FACS 0x0000000048C73000 000040
[    0.893716] kernel: ACPI: SSDT 0x0000000048FF4000 000353 (v02 HP     NVTEC    00000001 INTL 20200717)
[    0.893723] kernel: ACPI: SSDT 0x0000000048FF3000 00013E (v02 HP     ShmTable 00000001 INTL 20200717)
[    0.893730] kernel: ACPI: SSDT 0x0000000048FEB000 007F18 (v02 AMD    AmdTable 00000002 MSFT 05000000)
[    0.893736] kernel: ACPI: RTMA 0x0000000048FEA000 00009E (v01 HP     _HBMART_ 00001000 HP   00000001)
[    0.893742] kernel: ACPI: SSDT 0x0000000048FE8000 001A39 (v02 HP     UcsiAcpi 00000001 INTL 20200717)
[    0.893750] kernel: ACPI: SSDT 0x0000000048FE7000 0000FB (v02 HP     UcsiCntr 00000001 INTL 20200717)
[    0.893756] kernel: ACPI: SSDT 0x0000000048FE6000 0000C2 (v01 HP     OPALPWD  00000001 INTL 20200717)
[    0.893763] kernel: ACPI: OEML 0x0000000048FE5000 000028 (v03 HPQOEM EDK2     00000002      01000013)
[    0.893817] kernel: ACPI: SSDT 0x0000000048FE4000 0005FB (v02 HPQOEM Tpm2Tabl 00001000 INTL 20200717)
[    0.893828] kernel: ACPI: TPM2 0x0000000048FE3000 000034 (v03 HPQOEM EDK2     00000002      01000013)
[    0.893835] kernel: ACPI: WSMT 0x0000000048FE1000 000028 (v01 HPQOEM 8E17     00000001 HP   00000001)
[    0.893842] kernel: ACPI: ASF! 0x0000000048FE0000 00006E (v32 HPQOEM 8E17     00000001 HP   00000001)
[    0.893848] kernel: ACPI: HPET 0x0000000048FDF000 000038 (v01 HPQOEM 8E17     00000001 HP   00000001)
[    0.893855] kernel: ACPI: APIC 0x0000000048FDE000 0001B2 (v02 HPQOEM 8E17     00000001 HP   00000001)
[    0.893862] kernel: ACPI: MCFG 0x0000000048FDD000 00003C (v01 HPQOEM 8E17     00000001 HP   00000001)
[    0.893870] kernel: ACPI: SSDT 0x0000000048FC0000 000167 (v01 HPQOEM AMDNFCI2 00000001 INTL 20200717)
[    0.893876] kernel: ACPI: SSDT 0x0000000048FBF000 00021A (v02 AMD    Hetero   00000001 INTL 20200717)
[    0.893883] kernel: ACPI: PCCT 0x0000000048FBE000 0000D4 (v02 AMD    AmdTable 00000001 AMD  00000001)
[    0.893889] kernel: ACPI: SSDT 0x0000000048FB8000 00547E (v02 AMD    AMD CPU  00000001 AMD  00000001)
[    0.893896] kernel: ACPI: FPDT 0x0000000048FB7000 000044 (v01 HPQOEM EDK2     00000002      01000013)
[    0.893901] kernel: ACPI: ABLT 0x0000000048FF5000 0002C2 (v00                 00000000      00000000)
[    0.893907] kernel: ACPI: SSDT 0x0000000048FB5000 000045 (v02 HP     HPNBCONV 00001000 INTL 20200717)
[    0.893913] kernel: ACPI: SSDT 0x0000000048FB4000 000783 (v01 HP     AMDTPL   00001000 INTL 20200717)
[    0.893919] kernel: ACPI: SSDT 0x0000000048FAF000 004DA8 (v02 HP     HPAMD_WL 00001000 INTL 20200717)
[    0.893927] kernel: ACPI: SSDT 0x0000000048FAE000 000032 (v02 HP     HPCONDEV 00001000 INTL 20200717)
[    0.893934] kernel: ACPI: SSDT 0x0000000048FAD000 000E9F (v02 HPQOEM HPPATT   00001000 INTL 20200717)
[    0.893940] kernel: ACPI: VFCT 0x0000000048FA7000 005484 (v01 HPQOEM SLIC-BPC 00000001 AMD  33504F47)
[    0.893947] kernel: ACPI: SSDT 0x0000000048FA6000 000EA4 (v02 AMD    OEMACP   00000001 INTL 20200717)
[    0.893953] kernel: ACPI: SSDT 0x0000000048FA3000 002A8E (v02 AMD    OEMPMF   00000001 INTL 20200717)
[    0.893959] kernel: ACPI: SSDT 0x0000000048FA1000 001DB7 (v02 AMD    CPMPMF   00000001 INTL 20200717)
[    0.893964] kernel: ACPI: SSDT 0x0000000048FA0000 000490 (v02 AMD    CPMWBH   00000001 INTL 20200717)
[    0.893969] kernel: ACPI: SSDT 0x0000000048F9F000 0007C4 (v02 AMD    CPMDFIG4 00000001 INTL 20200717)
[    0.893973] kernel: ACPI: SSDT 0x0000000048F9C000 002B4E (v02 AMD    CDFAAIG2 00000001 INTL 20200717)
[    0.893980] kernel: ACPI: SSDT 0x0000000048F92000 009A47 (v02 AMD    CPMCMN   00000001 INTL 20200717)
[    0.893987] kernel: ACPI: BGRT 0x0000000048F91000 000038 (v01 HPQOEM EDK2     00000002      01000013)
[    0.893994] kernel: ACPI: SSDT 0x0000000048F90000 000B04 (v02 AMD    WLAN     00000001 INTL 20200717)
[    0.894001] kernel: ACPI: SSDT 0x0000000048F8F000 000E5E (v02 AMD    NVME     00000001 INTL 20200717)
[    0.894008] kernel: ACPI: SSDT 0x0000000048F8D000 001497 (v02 AMD    UPEP     00000001 INTL 20200717)
[    0.894013] kernel: ACPI: SSDT 0x0000000048F8B000 00101C (v02 AMD    GPP_PME_ 00000001 INTL 20200717)
[    0.894019] kernel: ACPI: SSDT 0x0000000048F81000 0097D1 (v02 AMD    INTBUSC_ 00000001 INTL 20200717)
[    0.894024] kernel: ACPI: SSDT 0x0000000048F7B000 004608 (v02 AMD    INTGPPA_ 00000001 INTL 20200717)
[    0.894031] kernel: ACPI: SSDT 0x0000000048FB6000 000B21 (v02 AMD    CPMGPIO0 00000001 INTL 20200717)
[    0.894037] kernel: ACPI: SSDT 0x0000000048F7A000 00010D (v02 MSFT   MHSP     00000004 INTL 20200717)
[    0.894041] kernel: ACPI: SSDT 0x0000000048F79000 000051 (v02 AMD    DRTM     00000001 INTL 20200717)
[    0.894048] kernel: ACPI: IVRS 0x0000000048F78000 0001F6 (v02 AMD    AmdTable 00000001 AMD  00000001)
[    0.894054] kernel: ACPI: SSDT 0x0000000048F77000 000500 (v02 AMD    MEMTOOL0 00000002 INTL 20200717)
[    0.894062] kernel: ACPI: SSDT 0x0000000048F76000 00096A (v02 AMD    CPMMSOSC 00000001 INTL 20200717)
[    0.894068] kernel: ACPI: SSDT 0x0000000048F75000 00008D (v02 AMD    CPMMSLPI 00000001 INTL 20200717)
[    0.894074] kernel: ACPI: SSDT 0x0000000048F74000 000509 (v02 AMD    CPMSFAML 00000001 INTL 20200717)
[    0.894080] kernel: ACPI: SSDT 0x0000000048F73000 000F5C (v02 AMD    CPMACPV8 00000001 INTL 20200717)
[    0.894085] kernel: ACPI: SDEV 0x0000000048F72000 00014E (v01                 00000000      00000000)
[    0.894090] kernel: ACPI: Reserving FACP table memory at [mem 0x48fe2000-0x48fe210b]
[    0.894095] kernel: ACPI: Reserving DSDT table memory at [mem 0x48fc1000-0x48fdc4d5]
[    0.894102] kernel: ACPI: Reserving FACS table memory at [mem 0x48c73000-0x48c7303f]
[    0.894108] kernel: ACPI: Reserving SSDT table memory at [mem 0x48ff4000-0x48ff4352]
[    0.894113] kernel: ACPI: Reserving SSDT table memory at [mem 0x48ff3000-0x48ff313d]
[    0.894118] kernel: ACPI: Reserving SSDT table memory at [mem 0x48feb000-0x48ff2f17]
[    0.894122] kernel: ACPI: Reserving RTMA table memory at [mem 0x48fea000-0x48fea09d]
[    0.894126] kernel: ACPI: Reserving SSDT table memory at [mem 0x48fe8000-0x48fe9a38]
[    0.894133] kernel: ACPI: Reserving SSDT table memory at [mem 0x48fe7000-0x48fe70fa]
[    0.894138] kernel: ACPI: Reserving SSDT table memory at [mem 0x48fe6000-0x48fe60c1]
[    0.894143] kernel: ACPI: Reserving OEML table memory at [mem 0x48fe5000-0x48fe5027]
[    0.894150] kernel: ACPI: Reserving SSDT table memory at [mem 0x48fe4000-0x48fe45fa]
[    0.894154] kernel: ACPI: Reserving TPM2 table memory at [mem 0x48fe3000-0x48fe3033]
[    0.894159] kernel: ACPI: Reserving WSMT table memory at [mem 0x48fe1000-0x48fe1027]
[    0.894163] kernel: ACPI: Reserving ASF! table memory at [mem 0x48fe0000-0x48fe006d]
[    0.894168] kernel: ACPI: Reserving HPET table memory at [mem 0x48fdf000-0x48fdf037]
[    0.894172] kernel: ACPI: Reserving APIC table memory at [mem 0x48fde000-0x48fde1b1]
[    0.894177] kernel: ACPI: Reserving MCFG table memory at [mem 0x48fdd000-0x48fdd03b]
[    0.894183] kernel: ACPI: Reserving SSDT table memory at [mem 0x48fc0000-0x48fc0166]
[    0.894188] kernel: ACPI: Reserving SSDT table memory at [mem 0x48fbf000-0x48fbf219]
[    0.894193] kernel: ACPI: Reserving PCCT table memory at [mem 0x48fbe000-0x48fbe0d3]
[    0.894199] kernel: ACPI: Reserving SSDT table memory at [mem 0x48fb8000-0x48fbd47d]
[    0.894203] kernel: ACPI: Reserving FPDT table memory at [mem 0x48fb7000-0x48fb7043]
[    0.894208] kernel: ACPI: Reserving ABLT table memory at [mem 0x48ff5000-0x48ff52c1]
[    0.894211] kernel: ACPI: Reserving SSDT table memory at [mem 0x48fb5000-0x48fb5044]
[    0.894215] kernel: ACPI: Reserving SSDT table memory at [mem 0x48fb4000-0x48fb4782]
[    0.894220] kernel: ACPI: Reserving SSDT table memory at [mem 0x48faf000-0x48fb3da7]
[    0.894224] kernel: ACPI: Reserving SSDT table memory at [mem 0x48fae000-0x48fae031]
[    0.894229] kernel: ACPI: Reserving SSDT table memory at [mem 0x48fad000-0x48fade9e]
[    0.894233] kernel: ACPI: Reserving VFCT table memory at [mem 0x48fa7000-0x48fac483]
[    0.894238] kernel: ACPI: Reserving SSDT table memory at [mem 0x48fa6000-0x48fa6ea3]
[    0.894246] kernel: ACPI: Reserving SSDT table memory at [mem 0x48fa3000-0x48fa5a8d]
[    0.894250] kernel: ACPI: Reserving SSDT table memory at [mem 0x48fa1000-0x48fa2db6]
[    0.894256] kernel: ACPI: Reserving SSDT table memory at [mem 0x48fa0000-0x48fa048f]
[    0.894259] kernel: ACPI: Reserving SSDT table memory at [mem 0x48f9f000-0x48f9f7c3]
[    0.894263] kernel: ACPI: Reserving SSDT table memory at [mem 0x48f9c000-0x48f9eb4d]
[    0.894269] kernel: ACPI: Reserving SSDT table memory at [mem 0x48f92000-0x48f9ba46]
[    0.894274] kernel: ACPI: Reserving BGRT table memory at [mem 0x48f91000-0x48f91037]
[    0.894280] kernel: ACPI: Reserving SSDT table memory at [mem 0x48f90000-0x48f90b03]
[    0.894283] kernel: ACPI: Reserving SSDT table memory at [mem 0x48f8f000-0x48f8fe5d]
[    0.894288] kernel: ACPI: Reserving SSDT table memory at [mem 0x48f8d000-0x48f8e496]
[    0.894294] kernel: ACPI: Reserving SSDT table memory at [mem 0x48f8b000-0x48f8c01b]
[    0.894298] kernel: ACPI: Reserving SSDT table memory at [mem 0x48f81000-0x48f8a7d0]
[    0.894303] kernel: ACPI: Reserving SSDT table memory at [mem 0x48f7b000-0x48f7f607]
[    0.894307] kernel: ACPI: Reserving SSDT table memory at [mem 0x48fb6000-0x48fb6b20]
[    0.894311] kernel: ACPI: Reserving SSDT table memory at [mem 0x48f7a000-0x48f7a10c]
[    0.894315] kernel: ACPI: Reserving SSDT table memory at [mem 0x48f79000-0x48f79050]
[    0.894320] kernel: ACPI: Reserving IVRS table memory at [mem 0x48f78000-0x48f781f5]
[    0.894325] kernel: ACPI: Reserving SSDT table memory at [mem 0x48f77000-0x48f774ff]
[    0.894329] kernel: ACPI: Reserving SSDT table memory at [mem 0x48f76000-0x48f76969]
[    0.894335] kernel: ACPI: Reserving SSDT table memory at [mem 0x48f75000-0x48f7508c]
[    0.894340] kernel: ACPI: Reserving SSDT table memory at [mem 0x48f74000-0x48f74508]
[    0.894346] kernel: ACPI: Reserving SSDT table memory at [mem 0x48f73000-0x48f73f5b]
[    0.894350] kernel: ACPI: Reserving SDEV table memory at [mem 0x48f72000-0x48f7214d]
[    0.894354] kernel: No NUMA configuration found
[    0.894360] kernel: Faking a node at [mem 0x0000000000000000-0x000000085e27ffff]
[    0.894364] kernel: NODE_DATA(0) allocated [mem 0x85e255500-0x85e27ffff]
[    0.894368] kernel: Zone ranges:
[    0.894372] kernel:   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.894377] kernel:   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.894381] kernel:   Normal   [mem 0x0000000100000000-0x000000085e27ffff]
[    0.894387] kernel:   Device   empty
[    0.894392] kernel: Movable zone start for each node
[    0.894397] kernel: Early memory node ranges
[    0.894404] kernel:   node   0: [mem 0x0000000000001000-0x000000000009efff]
[    0.894409] kernel:   node   0: [mem 0x0000000000100000-0x0000000009efffff]
[    0.894414] kernel:   node   0: [mem 0x0000000009f3c000-0x0000000044ad3fff]
[    0.894421] kernel:   node   0: [mem 0x0000000048ff7000-0x0000000052bcefff]
[    0.894426] kernel:   node   0: [mem 0x0000000052bd0000-0x0000000052bdbfff]
[    0.894430] kernel:   node   0: [mem 0x0000000052bdd000-0x000000005cfecfff]
[    0.894435] kernel:   node   0: [mem 0x000000005cff2000-0x0000000077ffffff]
[    0.894440] kernel:   node   0: [mem 0x0000000100000000-0x000000085e27ffff]
[    0.894443] kernel: Initmem setup node 0 [mem 0x0000000000001000-0x000000085e27ffff]
[    0.894450] kernel: On node 0, zone DMA: 1 pages in unavailable ranges
[    0.894456] kernel: On node 0, zone DMA: 97 pages in unavailable ranges
[    0.894461] kernel: On node 0, zone DMA32: 60 pages in unavailable ranges
[    0.894466] kernel: On node 0, zone DMA32: 17699 pages in unavailable ranges
[    0.894472] kernel: On node 0, zone DMA32: 1 pages in unavailable ranges
[    0.894480] kernel: On node 0, zone DMA32: 1 pages in unavailable ranges
[    0.894484] kernel: On node 0, zone DMA32: 5 pages in unavailable ranges
[    0.894490] kernel: On node 0, zone Normal: 7552 pages in unavailable ranges
[    0.894497] kernel: ACPI: PM-Timer IO Port: 0x408
[    0.894504] kernel: CPU topo: Ignoring hot-pluggable APIC ID 0 in present package.
[    0.894511] kernel: ACPI: LAPIC_NMI (acpi_id[0x00] high edge lint[0x1])
[    0.894516] kernel: ACPI: LAPIC_NMI (acpi_id[0x01] high edge lint[0x1])
[    0.894520] kernel: ACPI: LAPIC_NMI (acpi_id[0x02] high edge lint[0x1])
[    0.894526] kernel: ACPI: LAPIC_NMI (acpi_id[0x03] high edge lint[0x1])
[    0.894531] kernel: ACPI: LAPIC_NMI (acpi_id[0x04] high edge lint[0x1])
[    0.894536] kernel: ACPI: LAPIC_NMI (acpi_id[0x05] high edge lint[0x1])
[    0.894541] kernel: ACPI: LAPIC_NMI (acpi_id[0x06] high edge lint[0x1])
[    0.894544] kernel: ACPI: LAPIC_NMI (acpi_id[0x07] high edge lint[0x1])
[    0.894550] kernel: ACPI: LAPIC_NMI (acpi_id[0x08] high edge lint[0x1])
[    0.894554] kernel: ACPI: LAPIC_NMI (acpi_id[0x09] high edge lint[0x1])
[    0.894559] kernel: ACPI: LAPIC_NMI (acpi_id[0x0a] high edge lint[0x1])
[    0.894563] kernel: ACPI: LAPIC_NMI (acpi_id[0x0b] high edge lint[0x1])
[    0.894568] kernel: ACPI: LAPIC_NMI (acpi_id[0x0c] high edge lint[0x1])
[    0.894571] kernel: ACPI: LAPIC_NMI (acpi_id[0x0d] high edge lint[0x1])
[    0.894577] kernel: ACPI: LAPIC_NMI (acpi_id[0x0e] high edge lint[0x1])
[    0.894580] kernel: ACPI: LAPIC_NMI (acpi_id[0x0f] high edge lint[0x1])
[    0.894584] kernel: ACPI: LAPIC_NMI (acpi_id[0x10] high edge lint[0x1])
[    0.894590] kernel: ACPI: LAPIC_NMI (acpi_id[0x11] high edge lint[0x1])
[    0.894594] kernel: ACPI: LAPIC_NMI (acpi_id[0x12] high edge lint[0x1])
[    0.894599] kernel: ACPI: LAPIC_NMI (acpi_id[0x13] high edge lint[0x1])
[    0.894603] kernel: ACPI: LAPIC_NMI (acpi_id[0x14] high edge lint[0x1])
[    0.894609] kernel: ACPI: LAPIC_NMI (acpi_id[0x15] high edge lint[0x1])
[    0.894612] kernel: ACPI: LAPIC_NMI (acpi_id[0x16] high edge lint[0x1])
[    0.894619] kernel: ACPI: LAPIC_NMI (acpi_id[0x17] high edge lint[0x1])
[    0.894624] kernel: IOAPIC[0]: apic_id 4, version 33, address 0xfec00000, GSI 0-23
[    0.894629] kernel: IOAPIC[1]: apic_id 5, version 33, address 0xfec01000, GSI 24-55
[    0.894636] kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 1 global_irq 1 low edge)
[    0.894641] kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.894646] kernel: ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 low level)
[    0.894649] kernel: ACPI: Using ACPI (MADT) for SMP configuration information
[    0.894656] kernel: ACPI: HPET id: 0x10228210 base: 0xfed00000
[    0.894662] kernel: e820: update [mem 0x38253000-0x383f4fff] usable ==> reserved
[    0.894667] kernel: CPU topo: Max. logical packages:   1
[    0.894674] kernel: CPU topo: Max. logical dies:       1
[    0.894679] kernel: CPU topo: Max. dies per package:   1
[    0.894683] kernel: CPU topo: Max. threads per core:   2
[    0.894688] kernel: CPU topo: Num. cores per package:     8
[    0.894693] kernel: CPU topo: Num. threads per package:  16
[    0.894698] kernel: CPU topo: Allowing 16 present CPUs plus 0 hotplug CPUs
[    0.894705] kernel: CPU topo: Rejected CPUs 8
[    0.894710] kernel: PM: hibernation: Registered nosave memory: [mem 0x00000000-0x00000fff]
[    0.894716] kernel: PM: hibernation: Registered nosave memory: [mem 0x0009f000-0x000fffff]
[    0.894720] kernel: PM: hibernation: Registered nosave memory: [mem 0x09f00000-0x09f3bfff]
[    0.894724] kernel: PM: hibernation: Registered nosave memory: [mem 0x38253000-0x383f4fff]
[    0.894729] kernel: PM: hibernation: Registered nosave memory: [mem 0x44ad4000-0x48ff6fff]
[    0.894735] kernel: PM: hibernation: Registered nosave memory: [mem 0x52bcf000-0x52bcffff]
[    0.894739] kernel: PM: hibernation: Registered nosave memory: [mem 0x52bdc000-0x52bdcfff]
[    0.894743] kernel: PM: hibernation: Registered nosave memory: [mem 0x5cfed000-0x5cff1fff]
[    0.894748] kernel: PM: hibernation: Registered nosave memory: [mem 0x78000000-0xffffffff]
[    0.894755] kernel: [mem 0x80000000-0xfebfffff] available for PCI devices
[    0.894760] kernel: Booting paravirtualized kernel on bare hardware
[    0.894764] kernel: clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645519600211568 ns
[    0.894769] kernel: setup_percpu: NR_CPUS:8192 nr_cpumask_bits:16 nr_cpu_ids:16 nr_node_ids:1
[    0.894774] kernel: percpu: Embedded 62 pages/cpu s217088 r8192 d28672 u262144
[    0.894779] kernel: pcpu-alloc: s217088 r8192 d28672 u262144 alloc=1*2097152
[    0.894783] kernel: pcpu-alloc: [0] 00 01 02 03 04 05 06 07 [0] 08 09 10 11 12 13 14 15 
[    0.894791] kernel: Kernel command line: initrd=\efc892db302843fb9ae1201a4a541dcb\6.18-amd64\initrd.img-6.18-amd64 root=UUID=158e40e5-7a47-422d-9742-681072369fa3 rootflags=subvol=@rootfs quiet splash pcie_aspm=force systemd.machine_id=efc892db302843fb9ae1201a4a541dcb
[    0.894797] kernel: PCIe ASPM is forcibly enabled
[    0.894803] kernel: Unknown kernel command line parameters "splash", will be passed to user space.
[    0.894807] kernel: printk: log buffer data + meta data: 131072 + 458752 = 589824 bytes
[    0.894813] kernel: Dentry cache hash table entries: 4194304 (order: 13, 33554432 bytes, linear)
[    0.894818] kernel: Inode-cache hash table entries: 2097152 (order: 12, 16777216 bytes, linear)
[    0.894823] kernel: software IO TLB: area num 16.
[    0.894828] kernel: Fallback order for Node 0: 0 
[    0.894832] kernel: Built 1 zonelists, mobility grouping on.  Total pages: 8199352
[    0.894838] kernel: Policy zone: Normal
[    0.894843] kernel: mem auto-init: stack:all(zero), heap alloc:on, heap free:off
[    0.894848] kernel: SLUB: HWalign=64, Order=0-3, MinObjects=0, CPUs=16, Nodes=1
[    0.894853] kernel: ftrace: allocating 48083 entries in 188 pages
[    0.894858] kernel: ftrace: allocated 188 pages with 5 groups
[    0.894864] kernel: Dynamic Preempt: lazy
[    0.894868] kernel: rcu: Preemptible hierarchical RCU implementation.
[    0.894873] kernel: rcu:         RCU restricting CPUs from NR_CPUS=8192 to nr_cpu_ids=16.
[    0.894880] kernel:         Trampoline variant of Tasks RCU enabled.
[    0.894886] kernel:         Rude variant of Tasks RCU enabled.
[    0.894890] kernel:         Tracing variant of Tasks RCU enabled.
[    0.894895] kernel: rcu: RCU calculated value of scheduler-enlistment delay is 25 jiffies.
[    0.894900] kernel: rcu: Adjusting geometry for rcu_fanout_leaf=16, nr_cpu_ids=16
[    0.894907] kernel: RCU Tasks: Setting shift to 4 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=16.
[    0.894912] kernel: RCU Tasks Rude: Setting shift to 4 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=16.
[    0.894919] kernel: RCU Tasks Trace: Setting shift to 4 and lim to 1 rcu_task_cb_adjust=1 rcu_task_cpu_ids=16.
[    0.894923] kernel: NR_IRQS: 524544, nr_irqs: 1096, preallocated irqs: 16
[    0.894930] kernel: rcu: srcu_init: Setting srcu_struct sizes based on contention.
[    0.894936] kernel: Console: colour dummy device 80x25
[    0.894941] kernel: printk: legacy console [tty0] enabled
[    0.894949] kernel: ACPI: Core revision 20250807
[    0.894954] kernel: clocksource: hpet: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 133484873504 ns
[    0.894958] kernel: APIC: Switch to symmetric I/O mode setup
[    0.894964] kernel: AMD-Vi: ivrs, add hid:AMDI0020, uid:ID00, rdevid:0xa0
[    0.894971] kernel: AMD-Vi: ivrs, add hid:AMDI0020, uid:ID01, rdevid:0xa0
[    0.894975] kernel: AMD-Vi: ivrs, add hid:AMDI0020, uid:ID02, rdevid:0xa0
[    0.894980] kernel: AMD-Vi: ivrs, add hid:AMDI0020, uid:ID03, rdevid:0x98
[    0.894985] kernel: AMD-Vi: ivrs, add hid:MSFT0201, uid:1, rdevid:0x60
[    0.894992] kernel: AMD-Vi: ivrs, add hid:AMDI0020, uid:ID04, rdevid:0x98
[    0.894998] kernel: AMD-Vi: Using global IVHD EFR:0x246577efa2254afa, EFR2:0x10
[    0.895003] kernel: ..TIMER: vector=0x30 apic1=0 pin1=2 apic2=-1 pin2=-1
[    0.895009] kernel: clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles: 0x398d9fa1d8e, max_idle_ns: 881590727065 ns
[    0.895013] kernel: Calibrating delay loop (skipped), value calculated using timer frequency.. 3992.75 BogoMIPS (lpj=7985508)
[    0.895020] kernel: x86/cpu: User Mode Instruction Prevention (UMIP) activated
[    0.895026] kernel: LVT offset 1 assigned for vector 0xf9
[    0.895031] kernel: LVT offset 2 assigned for vector 0xf4
[    0.895037] kernel: Last level iTLB entries: 4KB 64, 2MB 64, 4MB 32
[    0.895041] kernel: Last level dTLB entries: 4KB 128, 2MB 128, 4MB 64, 1GB 0
[    0.895046] kernel: process: using mwait in idle threads
[    0.895050] kernel: mitigations: Enabled attack vectors: user_kernel, user_user, guest_host, guest_guest, SMT mitigations: auto
[    0.895056] kernel: Speculative Store Bypass: Mitigation: Speculative Store Bypass disabled via prctl
[    0.895061] kernel: Spectre V2 : Mitigation: Enhanced / Automatic IBRS
[    0.895067] kernel: Spectre V2 : User space: Mitigation: STIBP always-on protection
[    0.895071] kernel: Speculative Return Stack Overflow: Mitigation: IBPB on VMEXIT only
[    0.895075] kernel: VMSCAPE: Mitigation: IBPB on VMEXIT
[    0.895079] kernel: Spectre V1 : Mitigation: usercopy/swapgs barriers and __user pointer sanitization
[    0.895084] kernel: Spectre V2 : mitigation: Enabling conditional Indirect Branch Prediction Barrier
[    0.895089] kernel: x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point registers'
[    0.895095] kernel: x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.895100] kernel: x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.895104] kernel: x86/fpu: Supporting XSAVE feature 0x020: 'AVX-512 opmask'
[    0.895110] kernel: x86/fpu: Supporting XSAVE feature 0x040: 'AVX-512 Hi256'
[    0.895114] kernel: x86/fpu: Supporting XSAVE feature 0x080: 'AVX-512 ZMM_Hi256'
[    0.895118] kernel: x86/fpu: Supporting XSAVE feature 0x200: 'Protection Keys User registers'
[    0.895122] kernel: x86/fpu: Supporting XSAVE feature 0x800: 'Control-flow User registers'
[    0.895126] kernel: x86/fpu: Supporting XSAVE feature 0x1000: 'Control-flow Kernel registers (KVM only)'
[    0.895134] kernel: x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.895138] kernel: x86/fpu: xstate_offset[5]:  832, xstate_sizes[5]:   64
[    0.895143] kernel: x86/fpu: xstate_offset[6]:  896, xstate_sizes[6]:  512
[    0.895147] kernel: x86/fpu: xstate_offset[7]: 1408, xstate_sizes[7]: 1024
[    0.895152] kernel: x86/fpu: xstate_offset[9]: 2432, xstate_sizes[9]:    8
[    0.895156] kernel: x86/fpu: xstate_offset[11]: 2440, xstate_sizes[11]:   16
[    0.895160] kernel: x86/fpu: xstate_offset[12]: 2456, xstate_sizes[12]:   24
[    0.895164] kernel: x86/fpu: Enabled xstate features 0x1ae7, context size is 2480 bytes, using 'compacted' format.
[    0.895169] kernel: Freeing SMP alternatives memory: 44K
[    0.895175] kernel: pid_max: default: 32768 minimum: 301
[    0.895181] kernel: LSM: initializing lsm=lockdown,capability,landlock,yama,apparmor,tomoyo,bpf,ipe,ima,evm
[    0.895187] kernel: landlock: Up and running.
[    0.895192] kernel: Yama: disabled by default; enable with sysctl kernel.yama.*
[    0.895196] kernel: AppArmor: AppArmor initialized
[    0.895201] kernel: TOMOYO Linux initialized
[    0.895206] kernel: LSM support for eBPF active
[    0.895211] kernel: Mount-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    0.895215] kernel: Mountpoint-cache hash table entries: 65536 (order: 7, 524288 bytes, linear)
[    0.895220] kernel: smpboot: CPU0: AMD Ryzen AI 7 PRO 350 w/ Radeon 860M (family: 0x1a, model: 0x60, stepping: 0x0)
[    0.895224] kernel: Performance Events: Fam17h+ 16-deep LBR, core perfctr, AMD PMU driver.
[    0.895230] kernel: ... version:                   2
[    0.895238] kernel: ... bit width:                 48
[    0.895242] kernel: ... generic counters:          6
[    0.895247] kernel: ... generic bitmap:            000000000000003f
[    0.895251] kernel: ... fixed-purpose counters:    0
[    0.895260] kernel: ... fixed-purpose bitmap:      0000000000000000
[    0.895264] kernel: ... value mask:                0000ffffffffffff
[    0.895268] kernel: ... max period:                00007fffffffffff
[    0.895272] kernel: ... global_ctrl mask:          000000000000003f
[    0.895275] kernel: signal: max sigframe size: 3376
[    0.895279] kernel: rcu: Hierarchical SRCU implementation.
[    0.895284] kernel: rcu:         Max phase no-delay instances is 1000.
[    0.895289] kernel: Timer migration: 2 hierarchy levels; 8 children per group; 2 crossnode level
[    0.895295] kernel: NMI watchdog: Enabled. Permanently consumes one hw-PMU counter.
[    0.895299] kernel: smp: Bringing up secondary CPUs ...
[    0.895303] kernel: smpboot: x86: Booting SMP configuration:
[    0.895308] kernel: .... node  #0, CPUs:        #2  #4  #6  #8 #10 #12 #14  #1  #3  #5  #7  #9 #11 #13 #15
[    0.895312] kernel: Spectre V2 : Update user space SMT mitigation: STIBP always-on
[    0.895316] kernel: smp: Brought up 1 node, 16 CPUs
[    0.895321] kernel: smpboot: Total of 16 processors activated (63884.06 BogoMIPS)
[    0.895327] kernel: node 0 deferred pages initialised in 16ms
[    0.895331] kernel: Memory: 32043480K/32797408K available (17663K kernel code, 3332K rwdata, 13448K rodata, 4448K init, 3616K bss, 735528K reserved, 0K cma-reserved)
[    0.895335] kernel: devtmpfs: initialized
[    0.895339] kernel: x86/mm: Memory block size: 128MB
[    0.895343] kernel: ACPI: PM: Registering ACPI NVS region [mem 0x09f00000-0x09f3bfff] (245760 bytes)
[    0.895349] kernel: ACPI: PM: Registering ACPI NVS region [mem 0x48852000-0x48f51fff] (7340032 bytes)
[    0.895355] kernel: clocksource: jiffies: mask: 0xffffffff max_cycles: 0xffffffff, max_idle_ns: 7645041785100000 ns
[    0.895358] kernel: posixtimers hash table entries: 8192 (order: 5, 131072 bytes, linear)
[    0.895362] kernel: futex hash table entries: 4096 (262144 bytes on 1 NUMA nodes, total 256 KiB, linear).
[    0.895367] kernel: pinctrl core: initialized pinctrl subsystem
[    0.895371] kernel: NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.895376] kernel: DMA: preallocated 4096 KiB GFP_KERNEL pool for atomic allocations
[    0.895381] kernel: DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA pool for atomic allocations
[    0.895385] kernel: DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA32 pool for atomic allocations
[    0.895388] kernel: audit: initializing netlink subsys (disabled)
[    0.895393] kernel: audit: type=2000 audit(1767039726.000:1): state=initialized audit_enabled=0 res=1
[    0.895397] kernel: thermal_sys: Registered thermal governor 'fair_share'
[    0.895401] kernel: thermal_sys: Registered thermal governor 'bang_bang'
[    0.895405] kernel: thermal_sys: Registered thermal governor 'step_wise'
[    0.895409] kernel: thermal_sys: Registered thermal governor 'user_space'
[    0.895413] kernel: thermal_sys: Registered thermal governor 'power_allocator'
[    0.895417] kernel: cpuidle: using governor ladder
[    0.895422] kernel: cpuidle: using governor menu
[    0.895425] kernel: Detected 1 PCC Subspaces
[    0.895429] kernel: Registering PCC driver as Mailbox controller
[    0.895434] kernel: ACPI FADT declares the system doesn't support PCIe ASPM, so disable it
[    0.895438] kernel: acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.895441] kernel: PCI: ECAM [mem 0xe0000000-0xefffffff] (base 0xe0000000) for domain 0000 [bus 00-ff]
[    0.895445] kernel: PCI: Using configuration type 1 for base access
[    0.895449] kernel: kprobes: kprobe jump-optimization is enabled. All kprobes are optimized if possible.
[    0.895452] kernel: HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
[    0.895456] kernel: HugeTLB: 16380 KiB vmemmap can be freed for a 1.00 GiB page
[    0.895460] kernel: HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
[    0.895464] kernel: HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
[    0.895468] kernel: ACPI: Added _OSI(Module Device)
[    0.895473] kernel: ACPI: Added _OSI(Processor Device)
[    0.895477] kernel: ACPI: Added _OSI(Processor Aggregator Device)
[    0.895481] kernel: ACPI: 37 ACPI AML tables successfully acquired and loaded
[    0.895485] kernel: ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
[    0.895489] kernel: ACPI: USB4 _OSC: OS supports USB3+ DisplayPort+ PCIe+ XDomain+
[    0.895494] kernel: ACPI: USB4 _OSC: OS controls USB3+ DisplayPort+ PCIe+ XDomain+
[    0.895497] kernel: ACPI: EC: EC started
[    0.895501] kernel: ACPI: EC: interrupt blocked
[    0.895505] kernel: ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
[    0.895511] kernel: ACPI: \_SB_.PCI0.LPCB.EC0_: Boot DSDT EC used to handle transactions
[    0.895517] kernel: ACPI: Interpreter enabled
[    0.895521] kernel: ACPI: PM: (supports S0 S4 S5)
[    0.895526] kernel: ACPI: Using IOAPIC for interrupt routing
[    0.895530] kernel: PCI: Using host bridge windows from ACPI; if necessary, use "pci=nocrs" and report a bug
[    0.895535] kernel: PCI: Ignoring E820 reservations for host bridge windows
[    0.895541] kernel: ACPI: Enabled 6 GPEs in block 00 to 1F
[    0.895545] kernel: ACPI: \_SB_.PCI0.GP11.PWRS: New power resource
[    0.895550] kernel: ACPI: \_SB_.PCI0.GP11.SWUS.PWRS: New power resource
[    0.895556] kernel: ACPI: \_SB_.PCI0.GP12.PWRS: New power resource
[    0.895560] kernel: ACPI: \_SB_.PCI0.GP12.SWUS.PWRS: New power resource
[    0.895565] kernel: ACPI: \_SB_.PCI0.GP21.P0NV: New power resource
[    0.895570] kernel: ACPI: \_SB_.PCI0.GP23.PWSR: New power resource
[    0.895574] kernel: ACPI: \_SB_.PCI0.GP23.NCRD.WRST: New power resource
[    0.895578] kernel: ACPI: \_SB_.PCI0.GP25.PXP_: New power resource
[    0.895582] kernel: ACPI: \_SB_.PCI0.GP25.PWAN.MRST: New power resource
[    0.895586] kernel: ACPI: \_SB_.PCI0.GPPA.PWRS: New power resource
[    0.895591] kernel: ACPI: \_SB_.PCI0.GPPA.VGA_.PWRS: New power resource
[    0.895596] kernel: ACPI: \_SB_.PCI0.GPPA.HDAU.PWRS: New power resource
[    0.895601] kernel: ACPI: \_SB_.PCI0.GPPA.XHC1.PWRS: New power resource
[    0.895605] kernel: ACPI: \_SB_.PCI0.GPPA.ACP_.PWRS: New power resource
[    0.895610] kernel: ACPI: \_SB_.PCI0.GPPA.HDEF.PWRS: New power resource
[    0.895615] kernel: ACPI: \_SB_.PCI0.BUSC.XHC0.PWRS: New power resource
[    0.895619] kernel: ACPI: \_SB_.PCI0.BUSC.XHC0.RHUB.HS03.DBTR: New power resource
[    0.895623] kernel: ACPI: \_SB_.PCI0.BUSC.XHC3.PWRS: New power resource
[    0.895627] kernel: ACPI: \_SB_.PCI0.BUSC.XHC4.PWRS: New power resource
[    0.895633] kernel: ACPI: \_SB_.PCI0.BUSC.NHI0.PWRS: New power resource
[    0.895638] kernel: ACPI: \_SB_.PCI0.BUSC.NHI1.PWRS: New power resource
[    0.895643] kernel: ACPI: PCI Root Bridge [PCI0] (domain 0000 [bus 00-ff])
[    0.895790] kernel: acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM ClockPM Segments MSI HPX-Type3]
[    0.895855] kernel: acpi PNP0A08:00: _OSC: platform does not support [SHPCHotplug AER]
[    0.895910] kernel: acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug PME PCIeCapability LTR]
[    0.895963] kernel: acpi PNP0A08:00: FADT indicates ASPM is unsupported, using BIOS configuration
[    0.895969] kernel: PCI host bridge to bus 0000:00
[    0.896050] kernel: pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    0.896103] kernel: pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.896152] kernel: pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bffff window]
[    0.896203] kernel: pci_bus 0000:00: root bus resource [mem 0x000c0000-0x000cffff window]
[    0.896251] kernel: pci_bus 0000:00: root bus resource [mem 0x000d0000-0x000effff window]
[    0.896298] kernel: pci_bus 0000:00: root bus resource [mem 0x80000000-0xefffffff window]
[    0.896347] kernel: pci_bus 0000:00: root bus resource [mem 0xfed45000-0xfed814ff window]
[    0.896395] kernel: pci_bus 0000:00: root bus resource [mem 0xfed81900-0xfed81fff window]
[    0.896442] kernel: pci_bus 0000:00: root bus resource [mem 0xfedc0000-0xfedc0fff window]
[    0.896489] kernel: pci_bus 0000:00: root bus resource [mem 0xfedc6000-0xfedc6fff window]
[    0.896537] kernel: pci_bus 0000:00: root bus resource [mem 0x85e280000-0x87fffffff window]
[    0.896586] kernel: pci_bus 0000:00: root bus resource [mem 0x8a0200000-0x813fffffff window]
[    0.896634] kernel: pci_bus 0000:00: root bus resource [bus 00-ff]
[    0.896704] kernel: pci 0000:00:00.0: [1022:1122] type 00 class 0x060000 conventional PCI endpoint
[    0.896769] kernel: pci 0000:00:00.2: [1022:1123] type 00 class 0x080600 conventional PCI endpoint
[    0.896832] kernel: pci 0000:00:01.0: [1022:1124] type 00 class 0x060000 conventional PCI endpoint
[    0.896894] kernel: pci 0000:00:01.1: [1022:1125] type 01 class 0x060400 PCIe Root Port
[    0.896949] kernel: pci 0000:00:01.1: PCI bridge to [bus 01-60]
[    0.897004] kernel: pci 0000:00:01.1:   bridge window [io  0x6000-0x9fff]
[    0.897061] kernel: pci 0000:00:01.1:   bridge window [mem 0x9c000000-0xb3ffffff]
[    0.897118] kernel: pci 0000:00:01.1:   bridge window [mem 0x3000000000-0x4fffffffff 64bit pref]
[    0.897173] kernel: pci 0000:00:01.1: PME# supported from D0 D3hot D3cold
[    0.897238] kernel: pci 0000:00:01.2: [1022:1125] type 01 class 0x060400 PCIe Root Port
[    0.897292] kernel: pci 0000:00:01.2: PCI bridge to [bus 61-c0]
[    0.897349] kernel: pci 0000:00:01.2:   bridge window [io  0x2000-0x5fff]
[    0.897406] kernel: pci 0000:00:01.2:   bridge window [mem 0x84000000-0x9bffffff]
[    0.897462] kernel: pci 0000:00:01.2:   bridge window [mem 0x1000000000-0x2fffffffff 64bit pref]
[    0.897519] kernel: pci 0000:00:01.2: PME# supported from D0 D3hot D3cold
[    0.897579] kernel: pci 0000:00:02.0: [1022:1124] type 00 class 0x060000 conventional PCI endpoint
[    0.897641] kernel: pci 0000:00:02.1: [1022:1126] type 01 class 0x060400 PCIe Root Port
[    0.897698] kernel: pci 0000:00:02.1: PCI bridge to [bus c1]
[    0.897755] kernel: pci 0000:00:02.1:   bridge window [mem 0xb4f00000-0xb4ffffff]
[    0.897812] kernel: pci 0000:00:02.1: PME# supported from D0 D3hot D3cold
[    0.897871] kernel: pci 0000:00:02.3: [1022:1126] type 01 class 0x060400 PCIe Root Port
[    0.897925] kernel: pci 0000:00:02.3: PCI bridge to [bus c2]
[    0.897978] kernel: pci 0000:00:02.3:   bridge window [mem 0xb4600000-0xb48fffff]
[    0.898034] kernel: pci 0000:00:02.3: PME# supported from D0 D3hot D3cold
[    0.898092] kernel: pci 0000:00:03.0: [1022:1124] type 00 class 0x060000 conventional PCI endpoint
[    0.898155] kernel: pci 0000:00:08.0: [1022:1124] type 00 class 0x060000 conventional PCI endpoint
[    0.898217] kernel: pci 0000:00:08.1: [1022:1110] type 01 class 0x060400 PCIe Root Port
[    0.898272] kernel: pci 0000:00:08.1: PCI bridge to [bus c3]
[    0.898326] kernel: pci 0000:00:08.1:   bridge window [io  0x1000-0x1fff]
[    0.898381] kernel: pci 0000:00:08.1:   bridge window [mem 0xb4000000-0xb45fffff]
[    0.898437] kernel: pci 0000:00:08.1:   bridge window [mem 0x5000000000-0x50207fffff 64bit pref]
[    0.898491] kernel: pci 0000:00:08.1: enabling Extended Tags
[    0.898550] kernel: pci 0000:00:08.1: PME# supported from D0 D3hot D3cold
[    0.898613] kernel: pci 0000:00:08.2: [1022:1111] type 01 class 0x060400 PCIe Root Port
[    0.898666] kernel: pci 0000:00:08.2: PCI bridge to [bus c4]
[    0.898724] kernel: pci 0000:00:08.2:   bridge window [mem 0xb4d00000-0xb4efffff]
[    0.898779] kernel: pci 0000:00:08.2:   bridge window [mem 0x5020800000-0x50208fffff 64bit pref]
[    0.898834] kernel: pci 0000:00:08.2: enabling Extended Tags
[    0.898890] kernel: pci 0000:00:08.2: PME# supported from D0 D3hot D3cold
[    0.898950] kernel: pci 0000:00:08.3: [1022:1112] type 01 class 0x060400 PCIe Root Port
[    0.899005] kernel: pci 0000:00:08.3: PCI bridge to [bus c5]
[    0.899061] kernel: pci 0000:00:08.3:   bridge window [mem 0xb4900000-0xb4cfffff]
[    0.899115] kernel: pci 0000:00:08.3: enabling Extended Tags
[    0.899170] kernel: pci 0000:00:08.3: PME# supported from D0 D3hot D3cold
[    0.899230] kernel: pci 0000:00:14.0: [1022:790b] type 00 class 0x0c0500 conventional PCI endpoint
[    0.899293] kernel: pci 0000:00:14.3: [1022:790e] type 00 class 0x060100 conventional PCI endpoint
[    0.899355] kernel: pci 0000:00:18.0: [1022:1248] type 00 class 0x060000 conventional PCI endpoint
[    0.899417] kernel: pci 0000:00:18.1: [1022:1249] type 00 class 0x060000 conventional PCI endpoint
[    0.899482] kernel: pci 0000:00:18.2: [1022:124a] type 00 class 0x060000 conventional PCI endpoint
[    0.899544] kernel: pci 0000:00:18.3: [1022:124b] type 00 class 0x060000 conventional PCI endpoint
[    0.899604] kernel: pci 0000:00:18.4: [1022:124c] type 00 class 0x060000 conventional PCI endpoint
[    0.899663] kernel: pci 0000:00:18.5: [1022:124d] type 00 class 0x060000 conventional PCI endpoint
[    0.899720] kernel: pci 0000:00:18.6: [1022:124e] type 00 class 0x060000 conventional PCI endpoint
[    0.899779] kernel: pci 0000:00:18.7: [1022:124f] type 00 class 0x060000 conventional PCI endpoint
[    0.899835] kernel: pci 0000:00:01.1: PCI bridge to [bus 01-60]
[    0.899889] kernel: pci 0000:00:01.2: PCI bridge to [bus 61-c0]
[    0.899953] kernel: pci 0000:c1:00.0: [15b7:5049] type 00 class 0x010802 PCIe Endpoint
[    0.900021] kernel: pci 0000:c1:00.0: BAR 0 [mem 0xb4f00000-0xb4f03fff 64bit]
[    0.900079] kernel: pci 0000:c1:00.0: 31.504 Gb/s available PCIe bandwidth, limited by 8.0 GT/s PCIe x4 link at 0000:00:02.1 (capable of 63.012 Gb/s with 16.0 GT/s PCIe x4 link)
[    0.900137] kernel: pci 0000:00:02.1: PCI bridge to [bus c1]
[    0.900199] kernel: pci 0000:c2:00.0: [14c3:7925] type 00 class 0x028000 PCIe Endpoint
[    0.900256] kernel: pci 0000:c2:00.0: BAR 0 [mem 0xb4600000-0xb47fffff 64bit]
[    0.900313] kernel: pci 0000:c2:00.0: BAR 2 [mem 0xb4800000-0xb4807fff 64bit]
[    0.900368] kernel: pci 0000:c2:00.0: PME# supported from D0 D3hot D3cold
[    0.900423] kernel: pci 0000:00:02.3: PCI bridge to [bus c2]
[    0.900485] kernel: pci 0000:c3:00.0: [1002:1114] type 00 class 0x038000 PCIe Legacy Endpoint
[    0.900541] kernel: pci 0000:c3:00.0: BAR 0 [mem 0x5000000000-0x501fffffff 64bit pref]
[    0.900597] kernel: pci 0000:c3:00.0: BAR 2 [mem 0xb4000000-0xb41fffff 64bit pref]
[    0.900654] kernel: pci 0000:c3:00.0: BAR 4 [io  0x1000-0x10ff]
[    0.900709] kernel: pci 0000:c3:00.0: BAR 5 [mem 0xb4500000-0xb457ffff]
[    0.900766] kernel: pci 0000:c3:00.0: enabling Extended Tags
[    0.900822] kernel: pci 0000:c3:00.0: PME# supported from D1 D2 D3hot D3cold
[    0.900884] kernel: pci 0000:c3:00.1: [1002:1640] type 00 class 0x040300 PCIe Legacy Endpoint
[    0.900940] kernel: pci 0000:c3:00.1: BAR 0 [mem 0xb45c8000-0xb45cbfff]
[    0.900995] kernel: pci 0000:c3:00.1: enabling Extended Tags
[    0.901051] kernel: pci 0000:c3:00.1: PME# supported from D1 D2 D3hot D3cold
[    0.901113] kernel: pci 0000:c3:00.2: [1022:17e0] type 00 class 0x108000 PCIe Endpoint
[    0.901171] kernel: pci 0000:c3:00.2: BAR 2 [mem 0xb4400000-0xb44fffff]
[    0.901226] kernel: pci 0000:c3:00.2: BAR 5 [mem 0xb45ce000-0xb45cffff]
[    0.901283] kernel: pci 0000:c3:00.2: enabling Extended Tags
[    0.901345] kernel: pci 0000:c3:00.4: [1022:1128] type 00 class 0x0c0330 PCIe Endpoint
[    0.901401] kernel: pci 0000:c3:00.4: BAR 0 [mem 0xb4200000-0xb42fffff 64bit]
[    0.901457] kernel: pci 0000:c3:00.4: enabling Extended Tags
[    0.901514] kernel: pci 0000:c3:00.4: PME# supported from D0 D3hot D3cold
[    0.901574] kernel: pci 0000:c3:00.5: [1022:15e2] type 00 class 0x048000 PCIe Endpoint
[    0.901632] kernel: pci 0000:c3:00.5: BAR 0 [mem 0xb4580000-0xb45bffff]
[    0.901688] kernel: pci 0000:c3:00.5: BAR 2 [mem 0x5020000000-0x50207fffff 64bit pref]
[    0.901747] kernel: pci 0000:c3:00.5: enabling Extended Tags
[    0.901803] kernel: pci 0000:c3:00.5: PME# supported from D0 D3hot D3cold
[    0.901867] kernel: pci 0000:c3:00.6: [1022:15e3] type 00 class 0x040300 PCIe Endpoint
[    0.901924] kernel: pci 0000:c3:00.6: BAR 0 [mem 0xb45c0000-0xb45c7fff]
[    0.901980] kernel: pci 0000:c3:00.6: enabling Extended Tags
[    0.902037] kernel: pci 0000:c3:00.6: PME# supported from D0 D3hot D3cold
[    0.902099] kernel: pci 0000:c3:00.7: [1022:164a] type 00 class 0x118000 PCIe Endpoint
[    0.902157] kernel: pci 0000:c3:00.7: BAR 2 [mem 0xb4300000-0xb43fffff]
[    0.902214] kernel: pci 0000:c3:00.7: BAR 5 [mem 0xb45cc000-0xb45cdfff]
[    0.902270] kernel: pci 0000:c3:00.7: enabling Extended Tags
[    0.902325] kernel: pci 0000:00:08.1: PCI bridge to [bus c3]
[    0.902386] kernel: pci 0000:c4:00.0: [1022:1116] type 00 class 0x130000 PCIe Endpoint
[    0.902442] kernel: pci 0000:c4:00.0: enabling Extended Tags
[    0.902506] kernel: pci 0000:c4:00.1: [1022:17f0] type 00 class 0x118000 PCIe Endpoint
[    0.902562] kernel: pci 0000:c4:00.1: BAR 0 [mem 0xb4d00000-0xb4dfffff]
[    0.902618] kernel: pci 0000:c4:00.1: BAR 1 [mem 0xb4e00000-0xb4e01fff]
[    0.902673] kernel: pci 0000:c4:00.1: BAR 2 [mem 0x5020800000-0x502087ffff 64bit pref]
[    0.902728] kernel: pci 0000:c4:00.1: BAR 4 [mem 0xb4e03000-0xb4e03fff]
[    0.902783] kernel: pci 0000:c4:00.1: BAR 5 [mem 0xb4e02000-0xb4e02fff]
[    0.902839] kernel: pci 0000:c4:00.1: enabling Extended Tags
[    0.902897] kernel: pci 0000:00:08.2: PCI bridge to [bus c4]
[    0.902959] kernel: pci 0000:c5:00.0: [1022:1118] type 00 class 0x0c0330 PCIe Endpoint
[    0.903017] kernel: pci 0000:c5:00.0: BAR 0 [mem 0xb4900000-0xb49fffff 64bit]
[    0.903075] kernel: pci 0000:c5:00.0: enabling Extended Tags
[    0.903132] kernel: pci 0000:c5:00.0: PME# supported from D0 D3hot D3cold
[    0.903194] kernel: pci 0000:c5:00.3: [1022:111c] type 00 class 0x0c0330 PCIe Endpoint
[    0.903251] kernel: pci 0000:c5:00.3: BAR 0 [mem 0xb4a00000-0xb4afffff 64bit]
[    0.903308] kernel: pci 0000:c5:00.3: enabling Extended Tags
[    0.903364] kernel: pci 0000:c5:00.3: PME# supported from D0 D3hot D3cold
[    0.903428] kernel: pci 0000:c5:00.4: [1022:111e] type 00 class 0x0c0330 PCIe Endpoint
[    0.903485] kernel: pci 0000:c5:00.4: BAR 0 [mem 0xb4b00000-0xb4bfffff 64bit]
[    0.903542] kernel: pci 0000:c5:00.4: enabling Extended Tags
[    0.903599] kernel: pci 0000:c5:00.4: PME# supported from D0 D3hot D3cold
[    0.903665] kernel: pci 0000:c5:00.5: [1022:1120] type 00 class 0x0c0340 PCIe Endpoint
[    0.903722] kernel: pci 0000:c5:00.5: BAR 0 [mem 0xb4c00000-0xb4c7ffff 64bit]
[    0.903779] kernel: pci 0000:c5:00.5: Max Payload Size set to 128 (was 256, max 256)
[    0.903842] kernel: pci 0000:c5:00.5: enabling Extended Tags
[    0.903907] kernel: pci 0000:c5:00.5: PME# supported from D0 D3hot D3cold
[    0.903975] kernel: pci 0000:c5:00.6: [1022:1121] type 00 class 0x0c0340 PCIe Endpoint
[    0.904038] kernel: pci 0000:c5:00.6: BAR 0 [mem 0xb4c80000-0xb4cfffff 64bit]
[    0.904095] kernel: pci 0000:c5:00.6: Max Payload Size set to 128 (was 256, max 256)
[    0.904151] kernel: pci 0000:c5:00.6: enabling Extended Tags
[    0.904210] kernel: pci 0000:c5:00.6: PME# supported from D0 D3hot D3cold
[    0.904268] kernel: pci 0000:00:08.3: PCI bridge to [bus c5]
[    0.904274] kernel: Low-power S0 idle used by default for system suspend
[    0.904279] kernel: ACPI: PCI: Interrupt link LNKA configured for IRQ 0
[    0.904283] kernel: ACPI: PCI: Interrupt link LNKA disabled
[    0.904288] kernel: ACPI: PCI: Interrupt link LNKB configured for IRQ 0
[    0.904292] kernel: ACPI: PCI: Interrupt link LNKB disabled
[    0.904296] kernel: ACPI: PCI: Interrupt link LNKC configured for IRQ 0
[    0.904301] kernel: ACPI: PCI: Interrupt link LNKC disabled
[    0.904305] kernel: ACPI: PCI: Interrupt link LNKD configured for IRQ 0
[    0.904309] kernel: ACPI: PCI: Interrupt link LNKD disabled
[    0.904314] kernel: ACPI: PCI: Interrupt link LNKE configured for IRQ 0
[    0.904319] kernel: ACPI: PCI: Interrupt link LNKE disabled
[    0.904323] kernel: ACPI: PCI: Interrupt link LNKF configured for IRQ 0
[    0.904327] kernel: ACPI: PCI: Interrupt link LNKF disabled
[    0.904333] kernel: ACPI: PCI: Interrupt link LNKG configured for IRQ 0
[    0.904337] kernel: ACPI: PCI: Interrupt link LNKG disabled
[    0.904341] kernel: ACPI: PCI: Interrupt link LNKH configured for IRQ 0
[    0.904346] kernel: ACPI: PCI: Interrupt link LNKH disabled
[    0.904350] kernel: ACPI: EC: interrupt unblocked
[    0.904355] kernel: ACPI: EC: event unblocked
[    0.904360] kernel: ACPI: EC: EC_CMD/EC_SC=0x66, EC_DATA=0x62
[    0.904365] kernel: ACPI: EC: GPE=0x3
[    0.904370] kernel: ACPI: \_SB_.PCI0.LPCB.EC0_: Boot DSDT EC initialization complete
[    0.904376] kernel: ACPI: \_SB_.PCI0.LPCB.EC0_: EC: Used to handle transactions and events
[    0.904380] kernel: iommu: Default domain type: Translated
[    0.904387] kernel: iommu: DMA domain TLB invalidation policy: lazy mode
[    0.904391] kernel: pps_core: LinuxPPS API ver. 1 registered
[    0.904395] kernel: pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo Giometti <giometti@linux.it>
[    0.904402] kernel: PTP clock support registered
[    0.904408] kernel: EDAC MC: Ver: 3.0.0
[    0.904414] kernel: efivars: Registered efivars operations
[    0.904421] kernel: NetLabel: Initializing
[    0.904425] kernel: NetLabel:  domain hash size = 128
[    0.904429] kernel: NetLabel:  protocols = UNLABELED CIPSOv4 CALIPSO
[    0.904433] kernel: NetLabel:  unlabeled traffic allowed by default
[    0.904437] kernel: PCI: Using ACPI for IRQ routing
[    0.904443] kernel: PCI: pci_cache_line_size set to 64 bytes
[    0.904448] kernel: e820: reserve RAM buffer [mem 0x0009f000-0x0009ffff]
[    0.904452] kernel: e820: reserve RAM buffer [mem 0x09f00000-0x0bffffff]
[    0.904461] kernel: e820: reserve RAM buffer [mem 0x38253000-0x3bffffff]
[    0.904468] kernel: e820: reserve RAM buffer [mem 0x44ad4000-0x47ffffff]
[    0.904472] kernel: e820: reserve RAM buffer [mem 0x52bcf000-0x53ffffff]
[    0.904476] kernel: e820: reserve RAM buffer [mem 0x52bdc000-0x53ffffff]
[    0.904480] kernel: e820: reserve RAM buffer [mem 0x5cfed000-0x5fffffff]
[    0.904484] kernel: e820: reserve RAM buffer [mem 0x85e280000-0x85fffffff]
[    0.904490] kernel: vgaarb: loaded
[    0.904495] kernel: hpet0: at MMIO 0xfed00000, IRQs 2, 8, 0
[    0.904499] kernel: hpet0: 3 comparators, 32-bit 14.318180 MHz counter
[    0.904504] kernel: clocksource: Switched to clocksource tsc-early
[    0.904508] kernel: VFS: Disk quotas dquot_6.6.0
[    0.904513] kernel: VFS: Dquot-cache hash table entries: 512 (order 0, 4096 bytes)
[    0.904519] kernel: AppArmor: AppArmor Filesystem Enabled
[    0.904523] kernel: pnp: PnP ACPI init
[    0.904590] kernel: system 00:01: [io  0x0400-0x04cf] has been reserved
[    0.904642] kernel: system 00:01: [io  0x04d0-0x04d1] has been reserved
[    0.904697] kernel: system 00:01: [io  0x04d6] has been reserved
[    0.904746] kernel: system 00:01: [io  0x0680-0x06ff] has been reserved
[    0.904796] kernel: system 00:01: [io  0x077a] has been reserved
[    0.904846] kernel: system 00:01: [io  0x0c00-0x0c01] has been reserved
[    0.904895] kernel: system 00:01: [io  0x0c14] has been reserved
[    0.904943] kernel: system 00:01: [io  0x0c50-0x0c52] has been reserved
[    0.904994] kernel: system 00:01: [io  0x0c6c] has been reserved
[    0.905044] kernel: system 00:01: [io  0x0c6f] has been reserved
[    0.905094] kernel: system 00:01: [io  0x0cd0-0x0cdb] has been reserved
[    0.905142] kernel: system 00:01: [io  0x0840-0x0847] has been reserved
[    0.905197] kernel: system 00:02: [mem 0x000e0000-0x000fffff] could not be reserved
[    0.905253] kernel: system 00:04: [io  0x0600-0x067f] has been reserved
[    0.905303] kernel: system 00:04: [mem 0xfedf1000-0xfedf1fff] has been reserved
[    0.905357] kernel: system 00:05: [mem 0xfec00000-0xfec00fff] could not be reserved
[    0.905409] kernel: system 00:05: [mem 0xfee00000-0xfee00fff] has been reserved
[    0.905458] kernel: system 00:05: [mem 0xfec20000-0xfec20fff] has been reserved
[    0.905463] kernel: pnp: PnP ACPI: found 6 devices
[    0.905468] kernel: clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
[    0.905474] kernel: NET: Registered PF_INET protocol family
[    0.905480] kernel: IP idents hash table entries: 262144 (order: 9, 2097152 bytes, linear)
[    0.905485] kernel: tcp_listen_portaddr_hash hash table entries: 16384 (order: 6, 262144 bytes, linear)
[    0.905489] kernel: Table-perturb hash table entries: 65536 (order: 6, 262144 bytes, linear)
[    0.905493] kernel: TCP established hash table entries: 262144 (order: 9, 2097152 bytes, linear)
[    0.905498] kernel: TCP bind hash table entries: 65536 (order: 9, 2097152 bytes, linear)
[    0.905502] kernel: TCP: Hash tables configured (established 262144 bind 65536)
[    0.905507] kernel: MPTCP token hash table entries: 32768 (order: 8, 786432 bytes, linear)
[    0.905511] kernel: UDP hash table entries: 16384 (order: 8, 1048576 bytes, linear)
[    0.905516] kernel: UDP-Lite hash table entries: 16384 (order: 8, 1048576 bytes, linear)
[    0.905520] kernel: NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.905525] kernel: NET: Registered PF_XDP protocol family
[    0.905582] kernel: pci 0000:00:01.1: PCI bridge to [bus 01-60]
[    0.905637] kernel: pci 0000:00:01.1:   bridge window [io  0x6000-0x9fff]
[    0.905694] kernel: pci 0000:00:01.1:   bridge window [mem 0x9c000000-0xb3ffffff]
[    0.905749] kernel: pci 0000:00:01.1:   bridge window [mem 0x3000000000-0x4fffffffff 64bit pref]
[    0.905806] kernel: pci 0000:00:01.2: PCI bridge to [bus 61-c0]
[    0.905862] kernel: pci 0000:00:01.2:   bridge window [io  0x2000-0x5fff]
[    0.905919] kernel: pci 0000:00:01.2:   bridge window [mem 0x84000000-0x9bffffff]
[    0.905975] kernel: pci 0000:00:01.2:   bridge window [mem 0x1000000000-0x2fffffffff 64bit pref]
[    0.906031] kernel: pci 0000:00:02.1: PCI bridge to [bus c1]
[    0.906086] kernel: pci 0000:00:02.1:   bridge window [mem 0xb4f00000-0xb4ffffff]
[    0.906139] kernel: pci 0000:00:02.3: PCI bridge to [bus c2]
[    0.906194] kernel: pci 0000:00:02.3:   bridge window [mem 0xb4600000-0xb48fffff]
[    0.906248] kernel: pci 0000:00:08.1: PCI bridge to [bus c3]
[    0.906302] kernel: pci 0000:00:08.1:   bridge window [io  0x1000-0x1fff]
[    0.906356] kernel: pci 0000:00:08.1:   bridge window [mem 0xb4000000-0xb45fffff]
[    0.906410] kernel: pci 0000:00:08.1:   bridge window [mem 0x5000000000-0x50207fffff 64bit pref]
[    0.906464] kernel: pci 0000:00:08.2: PCI bridge to [bus c4]
[    0.906519] kernel: pci 0000:00:08.2:   bridge window [mem 0xb4d00000-0xb4efffff]
[    0.906573] kernel: pci 0000:00:08.2:   bridge window [mem 0x5020800000-0x50208fffff 64bit pref]
[    0.906627] kernel: pci 0000:00:08.3: PCI bridge to [bus c5]
[    0.906680] kernel: pci 0000:00:08.3:   bridge window [mem 0xb4900000-0xb4cfffff]
[    0.906736] kernel: pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    0.906788] kernel: pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    0.906837] kernel: pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff window]
[    0.906886] kernel: pci_bus 0000:00: resource 7 [mem 0x000c0000-0x000cffff window]
[    0.906935] kernel: pci_bus 0000:00: resource 8 [mem 0x000d0000-0x000effff window]
[    0.906983] kernel: pci_bus 0000:00: resource 9 [mem 0x80000000-0xefffffff window]
[    0.907032] kernel: pci_bus 0000:00: resource 10 [mem 0xfed45000-0xfed814ff window]
[    0.907079] kernel: pci_bus 0000:00: resource 11 [mem 0xfed81900-0xfed81fff window]
[    0.907127] kernel: pci_bus 0000:00: resource 12 [mem 0xfedc0000-0xfedc0fff window]
[    0.907175] kernel: pci_bus 0000:00: resource 13 [mem 0xfedc6000-0xfedc6fff window]
[    0.907221] kernel: pci_bus 0000:00: resource 14 [mem 0x85e280000-0x87fffffff window]
[    0.907272] kernel: pci_bus 0000:00: resource 15 [mem 0x8a0200000-0x813fffffff window]
[    0.907336] kernel: pci_bus 0000:01: resource 0 [io  0x6000-0x9fff]
[    0.907395] kernel: pci_bus 0000:01: resource 1 [mem 0x9c000000-0xb3ffffff]
[    0.907446] kernel: pci_bus 0000:01: resource 2 [mem 0x3000000000-0x4fffffffff 64bit pref]
[    0.907507] kernel: pci_bus 0000:61: resource 0 [io  0x2000-0x5fff]
[    0.907578] kernel: pci_bus 0000:61: resource 1 [mem 0x84000000-0x9bffffff]
[    0.907632] kernel: pci_bus 0000:61: resource 2 [mem 0x1000000000-0x2fffffffff 64bit pref]
[    0.907687] kernel: pci_bus 0000:c1: resource 1 [mem 0xb4f00000-0xb4ffffff]
[    0.907745] kernel: pci_bus 0000:c2: resource 1 [mem 0xb4600000-0xb48fffff]
[    0.907802] kernel: pci_bus 0000:c3: resource 0 [io  0x1000-0x1fff]
[    0.907858] kernel: pci_bus 0000:c3: resource 1 [mem 0xb4000000-0xb45fffff]
[    0.907909] kernel: pci_bus 0000:c3: resource 2 [mem 0x5000000000-0x50207fffff 64bit pref]
[    0.907969] kernel: pci_bus 0000:c4: resource 1 [mem 0xb4d00000-0xb4efffff]
[    0.908033] kernel: pci_bus 0000:c4: resource 2 [mem 0x5020800000-0x50208fffff 64bit pref]
[    0.908089] kernel: pci_bus 0000:c5: resource 1 [mem 0xb4900000-0xb4cfffff]
[    0.908154] kernel: pci 0000:c3:00.1: D0 power state depends on 0000:c3:00.0
[    0.908215] kernel: pci 0000:c3:00.4: enabling device (0000 -> 0002)
[    0.908276] kernel: pci 0000:c5:00.0: enabling device (0000 -> 0002)
[    0.908334] kernel: pci 0000:c5:00.3: enabling device (0000 -> 0002)
[    0.908395] kernel: pci 0000:c5:00.4: enabling device (0000 -> 0002)
[    0.908400] kernel: PCI: CLS 0 bytes, default 64
[    0.908456] kernel: pci 0000:00:00.2: AMD-Vi: IOMMU performance counters supported
[    0.908520] kernel: platform MSFT0201:00: Adding to iommu group 0
[    0.908527] kernel: Trying to unpack rootfs image as initramfs...
[    0.908585] kernel: pci 0000:00:01.0: Adding to iommu group 1
[    0.908641] kernel: pci 0000:00:01.1: Adding to iommu group 2
[    0.908696] kernel: pci 0000:00:01.2: Adding to iommu group 3
[    0.908752] kernel: pci 0000:00:02.0: Adding to iommu group 4
[    0.908807] kernel: pci 0000:00:02.1: Adding to iommu group 5
[    0.908861] kernel: pci 0000:00:02.3: Adding to iommu group 6
[    0.908917] kernel: pci 0000:00:03.0: Adding to iommu group 7
[    0.908972] kernel: pci 0000:00:08.0: Adding to iommu group 8
[    0.909026] kernel: pci 0000:00:08.1: Adding to iommu group 9
[    0.909088] kernel: pci 0000:00:08.2: Adding to iommu group 10
[    0.909150] kernel: pci 0000:00:08.3: Adding to iommu group 11
[    0.909208] kernel: pci 0000:00:14.0: Adding to iommu group 12
[    0.909265] kernel: pci 0000:00:14.3: Adding to iommu group 12
[    0.909329] kernel: pci 0000:00:18.0: Adding to iommu group 13
[    0.909387] kernel: pci 0000:00:18.1: Adding to iommu group 13
[    0.909450] kernel: pci 0000:00:18.2: Adding to iommu group 13
[    0.909509] kernel: pci 0000:00:18.3: Adding to iommu group 13
[    0.909570] kernel: pci 0000:00:18.4: Adding to iommu group 13
[    0.909627] kernel: pci 0000:00:18.5: Adding to iommu group 13
[    0.909684] kernel: pci 0000:00:18.6: Adding to iommu group 13
[    0.909741] kernel: pci 0000:00:18.7: Adding to iommu group 13
[    0.909809] kernel: pci 0000:c1:00.0: Adding to iommu group 14
[    0.909874] kernel: pci 0000:c2:00.0: Adding to iommu group 15
[    0.909933] kernel: pci 0000:c3:00.0: Adding to iommu group 16
[    0.909991] kernel: pci 0000:c3:00.1: Adding to iommu group 17
[    0.910058] kernel: pci 0000:c3:00.2: Adding to iommu group 18
[    0.910116] kernel: pci 0000:c3:00.4: Adding to iommu group 19
[    0.910180] kernel: pci 0000:c3:00.5: Adding to iommu group 20
[    0.910240] kernel: pci 0000:c3:00.6: Adding to iommu group 21
[    0.910300] kernel: pci 0000:c3:00.7: Adding to iommu group 22
[    0.910358] kernel: pci 0000:c4:00.0: Adding to iommu group 23
[    0.910417] kernel: pci 0000:c4:00.1: Adding to iommu group 24
[    0.910473] kernel: pci 0000:c5:00.0: Adding to iommu group 25
[    0.910531] kernel: pci 0000:c5:00.3: Adding to iommu group 26
[    0.910587] kernel: pci 0000:c5:00.4: Adding to iommu group 27
[    0.910647] kernel: pci 0000:c5:00.5: Adding to iommu group 28
[    0.910705] kernel: pci 0000:c5:00.6: Adding to iommu group 29
[    0.910711] kernel: AMD-Vi: Extended features (0x246577efa2254afa, 0x10): PPR NX GT [5] IA GA PC GA_vAPIC
[    0.910716] kernel: AMD-Vi: Interrupt remapping enabled
[    0.910720] kernel: AMD-Vi: Virtual APIC enabled
[    0.910726] kernel: PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.910731] kernel: software IO TLB: mapped [mem 0x0000000074000000-0x0000000078000000] (64MB)
[    0.910735] kernel: LVT offset 0 assigned for vector 0x400
[    0.910740] kernel: perf: AMD IBS detected (0x00081bff)
[    0.910744] kernel: amd_uncore: 16 amd_df counters detected
[    0.910749] kernel: amd_uncore: 6 amd_l3 counters detected
[    0.910753] kernel: amd_uncore: 4 amd_umc_0 counters detected
[    0.910757] kernel: amd_uncore: 4 amd_umc_1 counters detected
[    0.910762] kernel: amd_uncore: 4 amd_umc_2 counters detected
[    0.910767] kernel: amd_uncore: 4 amd_umc_3 counters detected
[    0.910771] kernel: perf/amd_iommu: Detected AMD IOMMU #0 (2 banks, 4 counters/bank).
[    0.910776] kernel: Initialise system trusted keyrings
[    0.910781] kernel: Key type blacklist registered
[    0.910785] kernel: workingset: timestamp_bits=36 max_order=23 bucket_order=0
[    0.910790] kernel: fuse: init (API version 7.45)
[    0.910794] kernel: integrity: Platform Keyring initialized
[    0.910798] kernel: integrity: Machine keyring initialized
[    0.910803] kernel: Key type asymmetric registered
[    0.910808] kernel: Asymmetric key parser 'x509' registered
[    0.910812] kernel: Block layer SCSI generic (bsg) driver version 0.4 loaded (major 245)
[    0.910817] kernel: io scheduler mq-deadline registered
[    0.910821] kernel: ledtrig-cpu: registered to indicate activity on CPUs
[    0.910877] kernel: pcieport 0000:00:01.1: PME: Signaling with IRQ 34
[    0.910933] kernel: pcieport 0000:00:01.1: pciehp: Slot #0 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActRep+
[    0.910989] kernel: pcieport 0000:00:01.2: PME: Signaling with IRQ 35
[    0.911048] kernel: pcieport 0000:00:01.2: pciehp: Slot #0 AttnBtn- PwrCtrl- MRL- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActRep+
[    0.911105] kernel: pcieport 0000:00:02.1: PME: Signaling with IRQ 36
[    0.911169] kernel: pcieport 0000:00:02.3: PME: Signaling with IRQ 37
[    0.911225] kernel: pcieport 0000:00:08.1: PME: Signaling with IRQ 38
[    0.911279] kernel: pcieport 0000:00:08.2: PME: Signaling with IRQ 39
[    0.911340] kernel: pcieport 0000:00:08.3: PME: Signaling with IRQ 40
[    0.911346] kernel: Monitor-Mwait will be used to enter C-1 state
[    0.911351] kernel: Estimated ratio of average max frequency by base frequency (times 1024): 1815
[    0.911434] kernel: thermal LNXTHERM:00: registered as thermal_zone0
[    0.911440] kernel: ACPI: thermal: Thermal Zone [CPUZ] (38 C)
[    0.911505] kernel: thermal LNXTHERM:01: registered as thermal_zone1
[    0.911513] kernel: ACPI: thermal: Thermal Zone [GFXZ] (25 C)
[    0.911574] kernel: thermal LNXTHERM:02: registered as thermal_zone2
[    0.911580] kernel: ACPI: thermal: Thermal Zone [EXTZ] (31 C)
[    0.911652] kernel: thermal LNXTHERM:03: registered as thermal_zone3
[    0.911664] kernel: ACPI: thermal: Thermal Zone [LOCZ] (37 C)
[    0.911728] kernel: thermal LNXTHERM:04: registered as thermal_zone4
[    0.911734] kernel: ACPI: thermal: Thermal Zone [BATZ] (27 C)
[    0.911792] kernel: thermal LNXTHERM:05: registered as thermal_zone5
[    0.911797] kernel: ACPI: thermal: Thermal Zone [CHGZ] (35 C)
[    0.911856] kernel: thermal LNXTHERM:06: registered as thermal_zone6
[    0.911862] kernel: ACPI: thermal: Thermal Zone [BAGZ] (30 C)
[    0.911921] kernel: thermal LNXTHERM:07: registered as thermal_zone7
[    0.911927] kernel: ACPI: thermal: Thermal Zone [MSHZ] (30 C)
[    0.911990] kernel: thermal LNXTHERM:08: registered as thermal_zone8
[    0.911996] kernel: ACPI: thermal: Thermal Zone [PGTZ] (30 C)
[    0.912001] kernel: Serial: 8250/16550 driver, 4 ports, IRQ sharing enabled
[    0.912007] kernel: Linux agpgart interface v0.103
[    0.912081] kernel: tpm_tis NTC0702:00: 2.0 TPM (device-id 0xFC, rev-id 1)
[    0.912088] kernel: i8042: PNP: PS/2 Controller [PNP0303:KBC0] at 0x60,0x64 irq 1
[    0.912094] kernel: i8042: PNP: PS/2 appears to have AUX port disabled, if this is incorrect please boot with i8042.nopnp
[    0.912099] kernel: serio: i8042 KBD port at 0x60,0x64 irq 1
[    0.912104] kernel: mousedev: PS/2 mouse device common for all mice
[    0.912165] kernel: rtc_cmos 00:00: RTC can wake from S4
[    0.912219] kernel: rtc_cmos 00:00: registered as rtc0
[    0.912268] kernel: rtc_cmos 00:00: setting system clock to 2025-12-29T20:22:07 UTC (1767039727)
[    0.912318] kernel: rtc_cmos 00:00: alarms up to one month, y3k, 114 bytes nvram
[    0.912323] kernel: efifb: probing for efifb
[    0.912329] kernel: efifb: framebuffer at 0x5000000000, using 16000k, total 16000k
[    0.912333] kernel: efifb: mode is 2560x1600x32, linelength=10240, pages=1
[    0.912338] kernel: efifb: scrolling: redraw
[    0.912343] kernel: efifb: Truecolor: size=8:8:8:8, shift=24:16:8:0
[    0.912347] kernel: Console: switching to colour frame buffer device 160x50
[    0.912351] kernel: fb0: EFI VGA frame buffer device
[    0.912356] kernel: NET: Registered PF_INET6 protocol family
[    0.912360] kernel: Segment Routing with IPv6
[    0.912365] kernel: RPL Segment Routing with IPv6
[    0.912370] kernel: In-situ OAM (IOAM) with IPv6
[    0.912375] kernel: mip6: Mobile IPv6
[    0.912379] kernel: NET: Registered PF_PACKET protocol family
[    0.912384] kernel: mpls_gso: MPLS GSO support
[    0.912388] kernel: x86/amd: Previous system reset reason [0x00080800]: software wrote 0x6 to reset control register 0xCF9
[    0.912393] kernel: microcode: Current revision: 0x0b600037
[    0.912397] kernel: microcode: Updated early from: 0x0b600032
[    0.912402] kernel: resctrl: L3 allocation detected
[    0.912406] kernel: resctrl: MB allocation detected
[    0.912411] kernel: resctrl: SMBA allocation detected
[    0.912416] kernel: resctrl: L3 monitoring detected
[    0.912420] kernel: IPI shorthand broadcast: enabled
[    0.912425] kernel: input: AT Translated Set 2 keyboard as /devices/platform/i8042/serio0/input/input0
[    0.912430] kernel: sched_clock: Marking stable (517047815, 413749)->(542539340, -25077776)
[    0.912434] kernel: registered taskstats version 1
[    0.912438] kernel: Loading compiled-in X.509 certificates
[    0.912443] kernel: Freeing initrd memory: 50148K
[    0.912450] kernel: Loaded X.509 cert 'Build time autogenerated kernel key: bc01c88f87f7c2e2c1e29bbb029099fb94b31874'
[    0.912454] kernel: Demotion targets for Node 0: null
[    0.912459] kernel: Key type .fscrypt registered
[    0.912463] kernel: Key type fscrypt-provisioning registered
[    0.912467] kernel: Key type encrypted registered
[    0.912472] kernel: AppArmor: AppArmor sha256 policy hashing enabled
[    0.912476] kernel: integrity: Loading X.509 certificate: UEFI:db
[    0.912481] kernel: integrity: Loaded X.509 cert 'HP Inc.: HP UEFI Secure Boot DB 2017: d9c01b50cfcae89d3b05345c163aa76e5dd589e7'
[    0.912485] kernel: integrity: Loading X.509 certificate: UEFI:db
[    0.912491] kernel: integrity: Loaded X.509 cert 'HP Inc.: HP UEFI Secure Boot DB 2024: 9031be8bd10636d7ed703b1ec5807354b05cd8ee'
[    0.912495] kernel: integrity: Loading X.509 certificate: UEFI:db
[    0.912500] kernel: integrity: Loaded X.509 cert 'Microsoft Corporation: Windows UEFI CA 2023: aefc5fbbbe055d8f8daa585473499417ab5a5272'
[    0.912504] kernel: integrity: Loading X.509 certificate: UEFI:db
[    0.912508] kernel: integrity: Loaded X.509 cert 'Microsoft Windows Production PCA 2011: a92902398e16c49778cd90f99e4f9ae17c55af53'
[    0.912512] kernel: integrity: Loading X.509 certificate: UEFI:db
[    0.912516] kernel: integrity: Loaded X.509 cert 'Microsoft UEFI CA 2023: 81aa6b3244c935bce0d6628af39827421e32497d'
[    0.912521] kernel: integrity: Loading X.509 certificate: UEFI:db
[    0.912525] kernel: integrity: Loaded X.509 cert 'Microsoft Corporation UEFI CA 2011: 13adbf4309bd82709c8cd54f316ed522988a1bd4'
[    0.912529] kernel: integrity: Loading X.509 certificate: UEFI:MokListRT (MOKvar table)
[    0.912535] kernel: integrity: Loaded X.509 cert 'Debian Secure Boot CA: 6ccece7e4c6c0d1f6149f3dd27dfcc5cbb419ea1'
[    0.912539] kernel: ima: Allocated hash algorithm: sha256
[    0.912544] kernel: audit: type=1807 audit(1767039727.676:2): action=measure func=KEXEC_KERNEL_CHECK res=1
[    0.912548] kernel: evm: Initialising EVM extended attributes:
[    0.912553] kernel: evm: security.selinux
[    0.912557] kernel: evm: security.SMACK64 (disabled)
[    0.912561] kernel: evm: security.SMACK64EXEC (disabled)
[    0.912566] kernel: audit: type=1807 audit(1767039727.676:3): action=measure func=MODULE_CHECK res=1
[    0.912570] kernel: evm: security.SMACK64TRANSMUTE (disabled)
[    0.912575] kernel: evm: security.SMACK64MMAP (disabled)
[    0.912580] kernel: evm: security.apparmor
[    0.912583] kernel: evm: security.ima
[    0.912588] kernel: evm: security.capability
[    0.912592] kernel: evm: HMAC attrs: 0x1
[    0.912597] kernel: RAS: Correctable Errors collector initialized.
[    0.912601] kernel: Lockdown: swapper/0: hibernation is restricted; see man kernel_lockdown.7
[    0.912606] kernel: clk: Disabling unused clocks
[    0.912612] kernel: PM: genpd: Disabling unused power domains
[    0.912618] kernel: Freeing unused decrypted memory: 2028K
[    0.912622] kernel: Freeing unused kernel image (initmem) memory: 4448K
[    0.912627] kernel: Write protecting the kernel read-only data: 32768k
[    0.912631] kernel: Freeing unused kernel image (text/rodata gap) memory: 768K
[    0.912636] kernel: Freeing unused kernel image (rodata/data gap) memory: 888K
[    0.912641] kernel: x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    0.912645] kernel: Run /init as init process
[    0.912649] kernel:   with arguments:
[    0.912654] kernel:     /init
[    0.912659] kernel:     splash
[    0.912663] kernel:   with environment:
[    0.912668] kernel:     HOME=/
[    0.912672] kernel:     TERM=linux
[    0.912713] kernel: Lockdown: systemd: /dev/mem,kmem,port is restricted; see man kernel_lockdown.7
[    0.912790] systemd[1]: Listening on systemd-udevd-kernel.socket - udev Kernel Socket.
[    0.912888] kernel: io scheduler bfq registered
[    0.912894] kernel: lp: driver loaded but no devices found
[    0.916070] kernel: i2c_dev: i2c /dev entries driver
[    0.924027] kernel: ppdev: user-space parallel port driver
[    0.980086] kernel: device-mapper: core: CONFIG_IMA_DISABLE_HTABLE is disabled. Duplicate IMA measurements will not be recorded in the IMA log.
[    0.980187] kernel: device-mapper: uevent: version 1.0.3
[    0.980205] kernel: device-mapper: ioctl: 4.50.0-ioctl (2025-04-28) initialised: dm-devel@lists.linux.dev
[    1.088027] kernel: raid6: avx512x4 gen() 45179 MB/s
[    1.156049] kernel: raid6: avx512x2 gen() 50367 MB/s
[    1.224024] kernel: raid6: avx512x1 gen() 46457 MB/s
[    1.292024] kernel: raid6: avx2x4   gen() 50499 MB/s
[    1.360024] kernel: raid6: avx2x2   gen() 50130 MB/s
[    1.428035] kernel: raid6: avx2x1   gen() 48264 MB/s
[    1.428056] kernel: raid6: using algorithm avx2x4 gen() 50499 MB/s
[    1.492024] kernel: tsc: Refined TSC clocksource calibration: 1996.247 MHz
[    1.492057] kernel: clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x398caa9ddcb, max_idle_ns: 881590739785 ns
[    1.492066] kernel: raid6: .... xor() 30230 MB/s, rmw enabled
[    1.492072] kernel: raid6: using avx512x2 recovery algorithm
[    1.492077] kernel: clocksource: Switched to clocksource tsc
[    1.504026] kernel: xor: automatically using best checksumming function   avx       
[    1.636022] kernel: Btrfs loaded, zoned=yes, fsverity=yes
[    1.832020] kernel: wmi_bus wmi_bus-PNP0C14:00: [Firmware Info]: DF4E63B6-3BBC-4858-9737-C74F82F821F3 has zero instances
[    1.832205] kernel: wmi_bus wmi_bus-PNP0C14:00: [Firmware Info]: 8F1F6436-9F42-42C8-BADC-0E9424F20C9A has zero instances
[    1.840010] kernel: ACPI: battery: Slot [BAT0] (battery present)
[    1.848046] kernel: hid: raw HID events driver (C) Jiri Kosina
[    1.848120] kernel: ccp 0000:c3:00.2: tee enabled
[    1.848281] kernel: ccp 0000:c3:00.2: psp: TSME enabled
[    1.848365] kernel: ccp 0000:c3:00.2: psp enabled
[    1.852009] kernel: sp5100_tco: SP5100/SB800 TCO WatchDog Timer Driver
[    1.852083] kernel: sp5100-tco sp5100-tco: Using 0xfeb00000 for watchdog MMIO address
[    1.852236] kernel: sp5100-tco sp5100-tco: initialized. heartbeat=60 sec (nowayout=0)
[    1.860113] kernel: Key type psk registered
[    1.868011] kernel: ACPI: bus type USB registered
[    1.868063] kernel: usbcore: registered new interface driver usbfs
[    1.868075] kernel: usbcore: registered new interface driver hub
[    1.868083] kernel: usbcore: registered new device driver usb
[    1.868092] kernel: ACPI: video: Video Device [VGA] (multi-head: yes  rom: no  post: no)
[    1.868102] kernel: input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08:00/device:17/LNXVIDEO:00/input/input1
[    1.876011] kernel: ACPI: bus type drm_connector registered
[    1.880015] kernel: pcie_mp2_amd 0000:c3:00.7: enabling device (0000 -> 0002)
[    1.880216] kernel: ACPI: bus type thunderbolt registered
[    1.892012] kernel: nvme 0000:c1:00.0: platform quirk: setting simple suspend
[    1.892206] kernel: nvme nvme0: pci function 0000:c1:00.0
[    1.896033] kernel: xhci_hcd 0000:c3:00.4: xHCI Host Controller
[    1.896238] kernel: xhci_hcd 0000:c3:00.4: new USB bus registered, assigned bus number 1
[    1.896387] kernel: xhci_hcd 0000:c3:00.4: hcc params 0x0118ffc5 hci version 0x120 quirks 0x0000000200000010
[    1.896474] kernel: xhci_hcd 0000:c3:00.4: xHCI Host Controller
[    1.896544] kernel: xhci_hcd 0000:c3:00.4: new USB bus registered, assigned bus number 2
[    1.896631] kernel: xhci_hcd 0000:c3:00.4: Host supports USB 3.1 Enhanced SuperSpeed
[    1.896706] kernel: usb usb1: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.18
[    1.896780] kernel: usb usb1: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.896850] kernel: usb usb1: Product: xHCI Host Controller
[    1.896905] kernel: usb usb1: Manufacturer: Linux 6.18-amd64 xhci-hcd
[    1.896962] kernel: usb usb1: SerialNumber: 0000:c3:00.4
[    1.897012] kernel: hub 1-0:1.0: USB hub found
[    1.897104] kernel: hub 1-0:1.0: 1 port detected
[    1.897171] kernel: usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
[    1.897245] kernel: usb usb2: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.18
[    1.897302] kernel: usb usb2: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.897356] kernel: usb usb2: Product: xHCI Host Controller
[    1.897407] kernel: usb usb2: Manufacturer: Linux 6.18-amd64 xhci-hcd
[    1.897463] kernel: usb usb2: SerialNumber: 0000:c3:00.4
[    1.897514] kernel: hub 2-0:1.0: USB hub found
[    1.897584] kernel: hub 2-0:1.0: 1 port detected
[    1.897648] kernel: xhci_hcd 0000:c5:00.0: xHCI Host Controller
[    1.897723] kernel: xhci_hcd 0000:c5:00.0: new USB bus registered, assigned bus number 3
[    1.897791] kernel: xhci_hcd 0000:c5:00.0: hcc params 0x0128ffc5 hci version 0x120 quirks 0x0000000200000010
[    1.900022] kernel: xhci_hcd 0000:c5:00.0: xHCI Host Controller
[    1.900219] kernel: xhci_hcd 0000:c5:00.0: new USB bus registered, assigned bus number 4
[    1.900349] kernel: xhci_hcd 0000:c5:00.0: Host supports USB 3.1 Enhanced SuperSpeed
[    1.900424] kernel: usb usb3: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.18
[    1.900492] kernel: usb usb3: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.900549] kernel: usb usb3: Product: xHCI Host Controller
[    1.900601] kernel: usb usb3: Manufacturer: Linux 6.18-amd64 xhci-hcd
[    1.900659] kernel: usb usb3: SerialNumber: 0000:c5:00.0
[    1.900712] kernel: hub 3-0:1.0: USB hub found
[    1.900784] kernel: hub 3-0:1.0: 5 ports detected
[    1.900854] kernel: usb usb4: We don't know the algorithms for LPM for this host, disabling LPM.
[    1.900938] kernel: usb usb4: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.18
[    1.901000] kernel: usb usb4: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.901054] kernel: usb usb4: Product: xHCI Host Controller
[    1.901104] kernel: usb usb4: Manufacturer: Linux 6.18-amd64 xhci-hcd
[    1.901154] kernel: usb usb4: SerialNumber: 0000:c5:00.0
[    1.901205] kernel: hub 4-0:1.0: USB hub found
[    1.901271] kernel: hub 4-0:1.0: 2 ports detected
[    1.901335] kernel: xhci_hcd 0000:c5:00.3: xHCI Host Controller
[    1.901407] kernel: xhci_hcd 0000:c5:00.3: new USB bus registered, assigned bus number 5
[    1.901475] kernel: xhci_hcd 0000:c5:00.3: hcc params 0x0118ffc5 hci version 0x120 quirks 0x0000000200000010
[    1.901539] kernel: xhci_hcd 0000:c5:00.3: xHCI Host Controller
[    1.901604] kernel: xhci_hcd 0000:c5:00.3: new USB bus registered, assigned bus number 6
[    1.901675] kernel: xhci_hcd 0000:c5:00.3: Host supports USB 3.1 Enhanced SuperSpeed
[    1.901740] kernel: usb usb5: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.18
[    1.901799] kernel: usb usb5: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.901850] kernel: usb usb5: Product: xHCI Host Controller
[    1.901901] kernel: usb usb5: Manufacturer: Linux 6.18-amd64 xhci-hcd
[    1.901959] kernel: usb usb5: SerialNumber: 0000:c5:00.3
[    1.902010] kernel: hub 5-0:1.0: USB hub found
[    1.902079] kernel: hub 5-0:1.0: 1 port detected
[    1.902145] kernel: usb usb6: We don't know the algorithms for LPM for this host, disabling LPM.
[    1.902219] kernel: usb usb6: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.18
[    1.902272] kernel: usb usb6: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.902327] kernel: usb usb6: Product: xHCI Host Controller
[    1.902379] kernel: usb usb6: Manufacturer: Linux 6.18-amd64 xhci-hcd
[    1.902427] kernel: usb usb6: SerialNumber: 0000:c5:00.3
[    1.902479] kernel: hub 6-0:1.0: USB hub found
[    1.902546] kernel: hub 6-0:1.0: 1 port detected
[    1.902613] kernel: xhci_hcd 0000:c5:00.4: xHCI Host Controller
[    1.902682] kernel: xhci_hcd 0000:c5:00.4: new USB bus registered, assigned bus number 7
[    1.902748] kernel: xhci_hcd 0000:c5:00.4: hcc params 0x0118ffc5 hci version 0x120 quirks 0x0000000200000010
[    1.902815] kernel: xhci_hcd 0000:c5:00.4: xHCI Host Controller
[    1.902883] kernel: xhci_hcd 0000:c5:00.4: new USB bus registered, assigned bus number 8
[    1.902949] kernel: xhci_hcd 0000:c5:00.4: Host supports USB 3.1 Enhanced SuperSpeed
[    1.903011] kernel: usb usb7: New USB device found, idVendor=1d6b, idProduct=0002, bcdDevice= 6.18
[    1.903066] kernel: usb usb7: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.903118] kernel: usb usb7: Product: xHCI Host Controller
[    1.903168] kernel: usb usb7: Manufacturer: Linux 6.18-amd64 xhci-hcd
[    1.903220] kernel: usb usb7: SerialNumber: 0000:c5:00.4
[    1.903270] kernel: hub 7-0:1.0: USB hub found
[    1.903335] kernel: hub 7-0:1.0: 1 port detected
[    1.904009] kernel: usb usb8: We don't know the algorithms for LPM for this host, disabling LPM.
[    1.904133] kernel: usb usb8: New USB device found, idVendor=1d6b, idProduct=0003, bcdDevice= 6.18
[    1.904197] kernel: usb usb8: New USB device strings: Mfr=3, Product=2, SerialNumber=1
[    1.904252] kernel: usb usb8: Product: xHCI Host Controller
[    1.904307] kernel: usb usb8: Manufacturer: Linux 6.18-amd64 xhci-hcd
[    1.904358] kernel: usb usb8: SerialNumber: 0000:c5:00.4
[    1.904413] kernel: hub 8-0:1.0: USB hub found
[    1.904484] kernel: hub 8-0:1.0: 1 port detected
[    1.924023] kernel: nvme nvme0: 16/0/0 default/read/poll queues
[    1.924291] kernel:  nvme0n1: p1 p2 p3
[    2.064036] kernel: input: SYNA312B:00 06CB:CFE2 Mouse as /devices/platform/AMDI0010:00/i2c-0/i2c-SYNA312B:00/0018:06CB:CFE2.0001/input/input2
[    2.064075] kernel: input: SYNA312B:00 06CB:CFE2 Touchpad as /devices/platform/AMDI0010:00/i2c-0/i2c-SYNA312B:00/0018:06CB:CFE2.0001/input/input3
[    2.064087] kernel: hid-generic 0018:06CB:CFE2.0001: input,hidraw0: I2C HID v1.00 Mouse [SYNA312B:00 06CB:CFE2] on i2c-SYNA312B:00
[    2.088022] kernel: amdxdna 0000:c4:00.1: enabling device (0000 -> 0002)
[    2.144032] kernel: input: SYNA312B:00 06CB:CFE2 Mouse as /devices/platform/AMDI0010:00/i2c-0/i2c-SYNA312B:00/0018:06CB:CFE2.0001/input/input5
[    2.144088] kernel: input: SYNA312B:00 06CB:CFE2 Touchpad as /devices/platform/AMDI0010:00/i2c-0/i2c-SYNA312B:00/0018:06CB:CFE2.0001/input/input6
[    2.144101] kernel: hid-multitouch 0018:06CB:CFE2.0001: input,hidraw0: I2C HID v1.00 Mouse [SYNA312B:00 06CB:CFE2] on i2c-SYNA312B:00
[    2.152037] kernel: usb 3-3: new high-speed USB device number 2 using xhci_hcd
[    2.152184] kernel: usb 1-1: new high-speed USB device number 2 using xhci_hcd
[    2.188035] kernel: [drm] Initialized amdxdna_accel_driver 0.1.0 for 0000:c4:00.1 on minor 0
[    2.288068] kernel: usb 3-3: New USB device found, idVendor=0e8d, idProduct=8c37, bcdDevice= 1.00
[    2.288348] kernel: usb 3-3: New USB device strings: Mfr=5, Product=6, SerialNumber=7
[    2.288482] kernel: usb 3-3: Product: Wireless_Device
[    2.288597] kernel: usb 3-3: Manufacturer: MediaTek Inc.
[    2.288704] kernel: usb 3-3: SerialNumber: 000000000
[    2.304029] kernel: usb 1-1: New USB device found, idVendor=30c9, idProduct=00e6, bcdDevice= 0.10
[    2.304228] kernel: usb 1-1: New USB device strings: Mfr=3, Product=1, SerialNumber=2
[    2.304357] kernel: usb 1-1: Product: HP 5MP Camera
[    2.304474] kernel: usb 1-1: Manufacturer: DTSUD0A8PLL4S7
[    2.304593] kernel: usb 1-1: SerialNumber: 200901010001
[    2.348036] kernel: hid-generic 0003:30C9:00E6.0002: hiddev0,hidraw1: USB HID v1.11 Device [DTSUD0A8PLL4S7 HP 5MP Camera] on usb-0000:c3:00.4-1/input4
[    2.348313] kernel: usbcore: registered new interface driver usbhid
[    2.348327] kernel: usbhid: USB HID core driver
[    2.360018] kernel: hid-sensor-hub 0003:30C9:00E6.0002: hiddev0,hidraw1: USB HID v1.11 Device [DTSUD0A8PLL4S7 HP 5MP Camera] on usb-0000:c3:00.4-1/input4
[    2.416030] kernel: usb 3-4: new full-speed USB device number 3 using xhci_hcd
[    2.584059] kernel: usb 3-4: New USB device found, idVendor=04f3, idProduct=0c9f, bcdDevice= 8.03
[    2.584321] kernel: usb 3-4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[    2.584450] kernel: usb 3-4: Product: ELAN:ARM-M4
[    2.584572] kernel: usb 3-4: Manufacturer: ELAN
[    2.708045] kernel: usb 3-5: new high-speed USB device number 4 using xhci_hcd
[    2.844056] kernel: usb 3-5: New USB device found, idVendor=05e3, idProduct=0610, bcdDevice=60.60
[    2.844262] kernel: usb 3-5: New USB device strings: Mfr=0, Product=1, SerialNumber=0
[    2.844381] kernel: usb 3-5: Product: USB2.0 Hub
[    2.892023] kernel: hub 3-5:1.0: USB hub found
[    2.892223] kernel: hub 3-5:1.0: 3 ports detected
[    3.592023] kernel: [drm] amdgpu kernel modesetting enabled.
[    3.592069] kernel: amdgpu: Virtual CRAT table created for CPU
[    3.592082] kernel: amdgpu: Topology: Add CPU node
[    3.596010] kernel: amdgpu 0000:c3:00.0: amdgpu: initializing kernel modesetting (IP DISCOVERY 0x1002:0x1114 0x103C:0x8E17 0xD2).
[    3.596261] kernel: amdgpu 0000:c3:00.0: amdgpu: register mmio base: 0xB4500000
[    3.596407] kernel: amdgpu 0000:c3:00.0: amdgpu: register mmio size: 524288
[    3.596541] kernel: amdgpu 0000:c3:00.0: amdgpu: detected ip block number 0 <common_v1_0_0> (soc21_common)
[    3.596670] kernel: amdgpu 0000:c3:00.0: amdgpu: detected ip block number 1 <gmc_v11_0_0> (gmc_v11_0)
[    3.596817] kernel: amdgpu 0000:c3:00.0: amdgpu: detected ip block number 2 <ih_v6_0_0> (ih_v6_1)
[    3.596979] kernel: amdgpu 0000:c3:00.0: amdgpu: detected ip block number 3 <psp_v13_0_0> (psp)
[    3.597062] kernel: amdgpu 0000:c3:00.0: amdgpu: detected ip block number 4 <smu_v14_0_0> (smu)
[    3.597133] kernel: amdgpu 0000:c3:00.0: amdgpu: detected ip block number 5 <dce_v1_0_0> (dm)
[    3.597199] kernel: amdgpu 0000:c3:00.0: amdgpu: detected ip block number 6 <gfx_v11_0_0> (gfx_v11_0)
[    3.597265] kernel: amdgpu 0000:c3:00.0: amdgpu: detected ip block number 7 <sdma_v6_0_0> (sdma_v6_0)
[    3.597331] kernel: amdgpu 0000:c3:00.0: amdgpu: detected ip block number 8 <vcn_v4_0_5> (vcn_v4_0_5)
[    3.597401] kernel: amdgpu 0000:c3:00.0: amdgpu: detected ip block number 9 <jpeg_v4_0_5> (jpeg_v4_0_5)
[    3.597466] kernel: amdgpu 0000:c3:00.0: amdgpu: detected ip block number 10 <mes_v11_0_0> (mes_v11_0)
[    3.597530] kernel: amdgpu 0000:c3:00.0: amdgpu: detected ip block number 11 <vpe_v6_1_0> (vpe_v6_1)
[    3.597600] kernel: amdgpu 0000:c3:00.0: amdgpu: Fetched VBIOS from VFCT
[    3.597664] kernel: amdgpu: ATOM BIOS: 113-STRIXEMU-001
[    3.597670] kernel: amdgpu 0000:c3:00.0: amdgpu: VPE: collaborate mode false
[    3.597734] kernel: Console: switching to colour dummy device 80x25
[    3.597739] kernel: amdgpu 0000:c3:00.0: amdgpu: Trusted Memory Zone (TMZ) feature disabled as experimental (default)
[    3.597804] kernel: amdgpu 0000:c3:00.0: amdgpu: vm size is 262144 GB, 4 levels, block size is 9-bit, fragment size is 9-bit
[    3.597871] kernel: amdgpu 0000:c3:00.0: amdgpu: VRAM: 512M 0x0000008000000000 - 0x000000801FFFFFFF (512M used)
[    3.597936] kernel: amdgpu 0000:c3:00.0: amdgpu: GART: 512M 0x00007FFF00000000 - 0x00007FFF1FFFFFFF
[    3.597998] kernel: [drm] Detected VRAM RAM=512M, BAR=512M
[    3.598004] kernel: [drm] RAM width 128bits DDR5
[    3.598009] kernel: amdgpu 0000:c3:00.0: amdgpu: amdgpu: 512M of VRAM memory ready
[    3.598073] kernel: amdgpu 0000:c3:00.0: amdgpu: amdgpu: 15683M of GTT memory ready.
[    3.598136] kernel: [drm] GART: num cpu pages 131072, num gpu pages 131072
[    3.598142] kernel: [drm] PCIE GART of 512M enabled (table at 0x000000801FB00000).
[    3.598147] kernel: amdgpu 0000:c3:00.0: amdgpu: [drm] Loading DMUB firmware via PSP: version=0x09003400
[    3.598212] kernel: amdgpu 0000:c3:00.0: amdgpu: [VCN instance 0] Found VCN firmware Version ENC: 1.24 DEC: 9 VEP: 0 Revision: 22
[    3.624026] kernel: amdgpu 0000:c3:00.0: amdgpu: reserve 0x1100000 from 0x801c000000 for PSP TMR
[    3.756022] kernel: amdgpu 0000:c3:00.0: amdgpu: RAS: optional ras ta ucode is not available
[    3.760042] kernel: amdgpu 0000:c3:00.0: amdgpu: RAP: optional rap ta ucode is not available
[    3.760384] kernel: amdgpu 0000:c3:00.0: amdgpu: SECUREDISPLAY: optional securedisplay ta ucode is not available
[    3.788021] kernel: amdgpu 0000:c3:00.0: amdgpu: SMU is initialized successfully!
[    3.788200] kernel: amdgpu 0000:c3:00.0: amdgpu: [drm] Display Core v3.2.351 initialized on DCN 3.5
[    3.788341] kernel: amdgpu 0000:c3:00.0: amdgpu: [drm] DP-HDMI FRL PCON supported
[    3.792050] kernel: amdgpu 0000:c3:00.0: amdgpu: [drm] DMUB hardware initialized: version=0x09003400
[    3.888097] kernel: amdgpu 0000:c3:00.0: amdgpu: [drm] Using ACPI provided EDID for eDP-1
[    3.900026] kernel: kfd kfd: amdgpu: Allocated 3969056 bytes on gart
[    3.900197] kernel: kfd kfd: amdgpu: Total number of KFD nodes to be created: 1
[    3.900260] kernel: amdgpu: Virtual CRAT table created for GPU
[    3.900266] kernel: amdgpu: Topology: Add dGPU node [0x1114:0x1002]
[    3.900280] kernel: kfd kfd: amdgpu: added device 1002:1114
[    3.900328] kernel: amdgpu 0000:c3:00.0: amdgpu: SE 1, SH per SE 2, CU per SH 4, active_cu_number 8
[    3.900407] kernel: amdgpu 0000:c3:00.0: amdgpu: ring gfx_0.0.0 uses VM inv eng 0 on hub 0
[    3.900476] kernel: amdgpu 0000:c3:00.0: amdgpu: ring comp_1.0.0 uses VM inv eng 1 on hub 0
[    3.900546] kernel: amdgpu 0000:c3:00.0: amdgpu: ring comp_1.1.0 uses VM inv eng 4 on hub 0
[    3.900611] kernel: amdgpu 0000:c3:00.0: amdgpu: ring comp_1.2.0 uses VM inv eng 6 on hub 0
[    3.900676] kernel: amdgpu 0000:c3:00.0: amdgpu: ring comp_1.3.0 uses VM inv eng 7 on hub 0
[    3.900742] kernel: amdgpu 0000:c3:00.0: amdgpu: ring comp_1.0.1 uses VM inv eng 8 on hub 0
[    3.900807] kernel: amdgpu 0000:c3:00.0: amdgpu: ring comp_1.1.1 uses VM inv eng 9 on hub 0
[    3.900873] kernel: amdgpu 0000:c3:00.0: amdgpu: ring comp_1.2.1 uses VM inv eng 10 on hub 0
[    3.900942] kernel: amdgpu 0000:c3:00.0: amdgpu: ring comp_1.3.1 uses VM inv eng 11 on hub 0
[    3.901075] kernel: amdgpu 0000:c3:00.0: amdgpu: ring sdma0 uses VM inv eng 12 on hub 0
[    3.901325] kernel: amdgpu 0000:c3:00.0: amdgpu: ring vcn_unified_0 uses VM inv eng 0 on hub 8
[    3.901513] kernel: amdgpu 0000:c3:00.0: amdgpu: ring jpeg_dec_0 uses VM inv eng 1 on hub 8
[    3.901681] kernel: amdgpu 0000:c3:00.0: amdgpu: ring mes_kiq_3.1.0 uses VM inv eng 13 on hub 0
[    3.901845] kernel: amdgpu 0000:c3:00.0: amdgpu: ring vpe uses VM inv eng 4 on hub 8
[    3.902007] kernel: amdgpu 0000:c3:00.0: amdgpu: Runtime PM not available
[    3.902131] kernel: amdgpu 0000:c3:00.0: [drm] Registered 4 planes with drm panic
[    3.902219] kernel: [drm] Initialized amdgpu 3.64.0 for 0000:c3:00.0 on minor 0
[    3.904047] kernel: fbcon: amdgpudrmfb (fb0) is primary device
[    3.904072] kernel: Console: switching to colour frame buffer device 160x50
[    3.904087] kernel: amdgpu 0000:c3:00.0: [drm] fb0: amdgpudrmfb frame buffer device
[    3.936020] kernel: [drm] pre_validate_dsc:1666 MST_DSC dsc precompute is not needed
[    7.096025] kernel: hid-sensor-hub 0020:1022:0001.0003: hidraw2: SENSOR HUB HID v0.00 Device [hid-amdsfh 1022:0001] on pcie_mp2_amd
[   12.076033] kernel: BTRFS: device fsid 158e40e5-7a47-422d-9742-681072369fa3 devid 1 transid 4785 /dev/mapper/ssd-root (254:2) scanned by mount (1447)
[   12.076108] kernel: BTRFS info (device dm-2): first mount of filesystem 158e40e5-7a47-422d-9742-681072369fa3
[   12.092020] kernel: BTRFS info (device dm-2): using crc32c (crc32c-lib) checksum algorithm
[   12.100032] kernel: BTRFS info (device dm-2): enabling ssd optimizations
[   12.100066] kernel: BTRFS info (device dm-2): turning on async discard
[   12.100081] kernel: BTRFS info (device dm-2): enabling free space tree
[   13.386552] kernel: Lockdown: systemd: /dev/mem,kmem,port is restricted; see man kernel_lockdown.7
[   13.386929] systemd[1]: Mounting sys-kernel-debug.mount - Kernel Debug File System...
[   13.386935] systemd[1]: Mounting sys-kernel-tracing.mount - Kernel Trace File System...
[   13.387104] systemd[1]: Mounted sys-kernel-debug.mount - Kernel Debug File System.
[   13.387109] systemd[1]: Mounted sys-kernel-tracing.mount - Kernel Trace File System.
[   13.387121] kernel: Adding 32796668k swap on /dev/mapper/ssd-swap_1.  Priority:-2 extents:1 across:32796668k SS
[   13.387172] kernel: BTRFS info (device dm-2 state M): turning on sync discard
[   13.387309] kernel: pstore: Using crash dump compression: deflate
[   13.392016] kernel: pstore: Registered efi_pstore as persistent store backend
[   13.608026] kernel: input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0C:00/input/input8
[   13.616032] kernel: ACPI: button: Power Button [PWRB]
[   13.624039] kernel: input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0E:00/input/input9
[   13.624121] kernel: ACPI: AC: AC Adapter [AC] (off-line)
[   13.624143] kernel: ACPI: button: Sleep Button [SLPB]
[   13.628013] kernel: input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0D:00/input/input10
[   13.628066] kernel: ACPI: button: Lid Switch [LID]
[   13.628089] kernel: input: Power Button as /devices/LNXSYSTM:00/LNXPWRBN:00/input/input11
[   13.628109] kernel: ACPI: button: Power Button [PWRF]
[   13.632024] kernel: Serial bus multi instantiate pseudo device driver CSC3554:00: Instantiated 3 I2C devices.
[   13.684013] kernel: piix4_smbus 0000:00:14.0: SMBus Host Controller at 0xb00, revision 0
[   13.684343] kernel: piix4_smbus 0000:00:14.0: Using register 0x02 for SMBus port selection
[   13.700029] kernel: piix4_smbus 0000:00:14.0: Auxiliary SMBus Host Controller at 0xb20
[   13.703760] kernel: i2c i2c-22: Successfully instantiated SPD at 0x50
[   13.706019] kernel: i2c i2c-22: Successfully instantiated SPD at 0x51
[   13.752015] kernel: input: PC Speaker as /devices/platform/pcspkr/input/input12
[   13.772017] kernel: input: PMF-TA output events as /devices/platform/AMDI0107:00/input/input13
[   13.772084] kernel: amd-pmf AMDI0107:00: registered PMF device successfully
[   13.773495] kernel: RAPL PMU: API unit is 2^-32 Joules, 2 fixed counters, 163840 ms ovfl timer
[   13.773518] kernel: RAPL PMU: hw unit of domain package 2^-16 Joules
[   13.773534] kernel: RAPL PMU: hw unit of domain core 2^-16 Joules
[   13.776176] kernel: cfg80211: Loading compiled-in X.509 certificates for regulatory database
[   13.776246] kernel: Loaded X.509 cert 'benh@debian.org: 577e021cb980e0e820821ba7b54b4961b8b4fadf'
[   13.776263] kernel: Loaded X.509 cert 'romain.perier@gmail.com: 3abbc6ec146e09d1b6016ab9d6cf71dd233f0328'
[   13.776287] kernel: Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[   13.776306] kernel: Loaded X.509 cert 'wens: 61c038651aabdcf94bd0ac7ff06c7248db18c600'
[   13.800052] kernel: hp_wmi: query 0x4 returned error 0x5
[   13.812031] kernel: mc: Linux media interface: v0.10
[   13.820078] kernel: input: HP WMI hotkeys as /devices/virtual/input/input14
[   13.828028] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: Cirrus Logic CS35L54 Rev B0 OTP4 fw:3.4.4 (patched=0)
[   13.848012] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: DSP system name: '103C8E17', amp name: 'AMP1'
[   13.852033] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: Reset GPIO busy, assume shared reset
[   13.860010] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: Cirrus Logic CS35L54 Rev B0 OTP4 fw:3.4.4 (patched=0)
[   13.876018] kernel: Bluetooth: Core ver 2.22
[   13.876098] kernel: NET: Registered PF_BLUETOOTH protocol family
[   13.876123] kernel: Bluetooth: HCI device and connection manager initialized
[   13.876139] kernel: Bluetooth: HCI socket layer initialized
[   13.876154] kernel: Bluetooth: L2CAP socket layer initialized
[   13.876174] kernel: Bluetooth: SCO socket layer initialized
[   13.880034] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: DSP system name: '103C8E17', amp name: 'AMP2'
[   13.916027] kernel: snd_acp_pci 0000:c3:00.5: enabling device (0000 -> 0002)
[   13.916415] kernel: platform acp_asoc_acp70.0: warning: No matching ASoC machine driver found
[   13.920009] kernel: videodev: Linux video capture interface: v2.00
[   13.940089] kernel: snd_hda_intel 0000:c3:00.1: enabling device (0000 -> 0002)
[   13.940418] kernel: snd_hda_intel 0000:c3:00.1: Handle vga_switcheroo audio client
[   13.940568] kernel: snd_hda_intel 0000:c3:00.6: enabling device (0000 -> 0002)
[   13.956025] kernel: kvm_amd: TSC scaling supported
[   13.956110] kernel: kvm_amd: Nested Virtualization enabled
[   13.956140] kernel: kvm_amd: Nested Paging enabled
[   13.956160] kernel: kvm_amd: LBR virtualization supported
[   13.956176] kernel: kvm_amd: AVIC enabled
[   13.956191] kernel: kvm_amd: x2AVIC enabled
[   13.956201] kernel: kvm_amd: Virtual VMLOAD VMSAVE supported
[   13.956216] kernel: kvm_amd: Virtual GIF supported
[   13.956226] kernel: kvm_amd: Virtual NMI enabled
[   13.980065] kernel: snd_hda_intel 0000:c3:00.1: bound 0000:c3:00.0 (ops amdgpu_dm_audio_component_bind_ops [amdgpu])
[   13.980495] kernel: input: HD-Audio Generic HDMI/DP,pcm=3 as /devices/pci0000:00/0000:00:08.1/0000:c3:00.1/sound/card0/input15
[   13.980558] kernel: input: HD-Audio Generic HDMI/DP,pcm=7 as /devices/pci0000:00/0000:00:08.1/0000:c3:00.1/sound/card0/input16
[   13.980589] kernel: input: HD-Audio Generic HDMI/DP,pcm=8 as /devices/pci0000:00/0000:00:08.1/0000:c3:00.1/sound/card0/input17
[   13.980611] kernel: input: HD-Audio Generic HDMI/DP,pcm=9 as /devices/pci0000:00/0000:00:08.1/0000:c3:00.1/sound/card0/input18
[   13.984017] kernel: usbcore: registered new interface driver btusb
[   13.988018] kernel: Bluetooth: hci0: HW/SW Version: 0x00000000, Build Time: 20251015213201
[   13.992009] kernel: MCE: In-kernel MCE decoding enabled.
[   14.008019] kernel: uvcvideo 1-1:1.0: Found UVC 1.50 device HP 5MP Camera (30c9:00e6)
[   14.016011] kernel: mt7925e 0000:c2:00.0: enabling device (0000 -> 0002)
[   14.020029] kernel: snd_hda_codec_alc269 hdaudioC1D0: ALC245: picked fixup  for PCI SSID 103c:8e17
[   14.020287] kernel: snd_hda_codec_alc269 hdaudioC1D0: Found 2 CSC3554 on i2c (-%s:00-cs35l54-hda.%d)
[   14.020393] kernel: snd_hda_codec_alc269 hdaudioC1D0: bound i2c-CSC3554:00-cs35l54-hda.0 (ops cs35l56_hda_comp_ops [snd_hda_scodec_cs35l56])
[   14.020477] kernel: snd_hda_codec_alc269 hdaudioC1D0: bound i2c-CSC3554:00-cs35l54-hda.1 (ops cs35l56_hda_comp_ops [snd_hda_scodec_cs35l56])
[   14.020556] kernel: snd_hda_codec_alc269 hdaudioC1D0: Component binding already created (SSID: 103c8e17)
[   14.020635] kernel: mt7925e 0000:c2:00.0: ASIC revision: 79250000
[   14.020759] kernel: snd_hda_codec_alc269 hdaudioC1D0: autoconfig for ALC245: line_outs=1 (0x17/0x0/0x0/0x0/0x0) type:speaker
[   14.020838] kernel: snd_hda_codec_alc269 hdaudioC1D0:    speaker_outs=0 (0x0/0x0/0x0/0x0/0x0)
[   14.020914] kernel: snd_hda_codec_alc269 hdaudioC1D0:    hp_outs=1 (0x21/0x0/0x0/0x0/0x0)
[   14.020997] kernel: snd_hda_codec_alc269 hdaudioC1D0:    mono: mono_out=0x0
[   14.021070] kernel: snd_hda_codec_alc269 hdaudioC1D0:    inputs:
[   14.021155] kernel: snd_hda_codec_alc269 hdaudioC1D0:      Internal Mic=0x12
[   14.021231] kernel: snd_hda_codec_alc269 hdaudioC1D0:      Mic=0x19
[   14.021308] kernel: uvcvideo 1-1:1.2: Found UVC 1.50 device HP 5MP Camera (30c9:00e6)
[   14.021428] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: firmware: failed to load cirrus/cs35l54-b0-dsp1-misc-103c8e17-amp1.wmfw (-2)
[   14.021527] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: firmware: failed to load cirrus/cs35l54-b0-dsp1-misc-103c8e17-amp2.wmfw (-2)
[   14.021688] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: firmware: failed to load cirrus/cs35l54-b0-dsp1-misc-103c8e17-amp2.wmfw (-2)
[   14.021762] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: firmware: failed to load cirrus/cs35l54-b0-dsp1-misc-103c8e17-amp2.wmfw (-2)
[   14.021840] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: firmware: failed to load cirrus/cs35l54-b0-dsp1-misc-103c8e17-amp1.wmfw (-2)
[   14.021925] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: firmware: failed to load cirrus/cs35l54-b0-dsp1-misc-103c8e17-amp1.wmfw (-2)
[   14.022002] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: DSP1: cirrus/cs35l54-b0-dsp1-misc-103c8e17.wmfw: format 3 timestamp 0x66ad5cf1
[   14.022084] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: DSP1: cirrus/cs35l54-b0-dsp1-misc-103c8e17.wmfw: Fri 02 Aug 2024 17:25:52 Central Daylight Time
[   14.022157] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: DSP1: cirrus/cs35l54-b0-dsp1-misc-103c8e17.wmfw: format 3 timestamp 0x66ad5cf1
[   14.022245] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: DSP1: cirrus/cs35l54-b0-dsp1-misc-103c8e17.wmfw: Fri 02 Aug 2024 17:25:52 Central Daylight Time
[   14.024014] kernel: usbcore: registered new interface driver uvcvideo
[   14.100066] kernel: mt7925e 0000:c2:00.0: HW/SW Version: 0x8a108a10, Build Time: 20251015212927a
[   14.132023] kernel: amd_atl: AMD Address Translation Library initialized
[   14.132151] kernel: intel_rapl_common: Found RAPL domain package
[   14.132174] kernel: intel_rapl_common: Found RAPL domain core
[   14.156019] kernel: input: HD-Audio Generic Mic as /devices/pci0000:00/0000:00:08.1/0000:c3:00.6/sound/card1/input19
[   14.156105] kernel: input: HD-Audio Generic Headphone as /devices/pci0000:00/0000:00:08.1/0000:c3:00.6/sound/card1/input20
[   14.348078] kernel: Bluetooth: hci0: Device setup in 356006 usecs
[   14.348223] kernel: Bluetooth: hci0: HCI Enhanced Setup Synchronous Connection command is advertised, but not supported.
[   14.396059] kernel: BTRFS: device fsid 65fd0daf-5008-472e-b82b-21497144d89a devid 1 transid 5718 /dev/mapper/ssd-home (254:3) scanned by mount (1884)
[   14.400033] kernel: BTRFS info (device dm-3): first mount of filesystem 65fd0daf-5008-472e-b82b-21497144d89a
[   14.400123] kernel: BTRFS info (device dm-3): using crc32c (crc32c-lib) checksum algorithm
[   14.420055] kernel: BTRFS info (device dm-3): enabling ssd optimizations
[   14.420118] kernel: BTRFS info (device dm-3): turning on sync discard
[   14.420142] kernel: BTRFS info (device dm-3): enabling free space tree
[   14.420168] kernel: BTRFS info (device dm-3): use zstd compression, level 1
[   14.440057] kernel: mt7925e 0000:c2:00.0: WM Firmware Version: ____000000, Build Time: 20251015213023
[   14.764140] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: DSP1: Firmware: 1a00d6 vendor: 0x2 v19.11.11, 41 algorithms
[   14.764639] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: DSP1: Firmware: 1a00d6 vendor: 0x2 v19.11.11, 41 algorithms
[   14.772013] kernel: SGI XFS with ACLs, security attributes, realtime, scrub, repair, quota, no debug enabled
[   14.780031] kernel: XFS (nvme0n1p2): Mounting V5 Filesystem 044cfc8e-c077-4745-8f60-0d733b2221af
[   14.788053] kernel: XFS (nvme0n1p2): Ending clean mount
[   14.792033] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: DSP1: cirrus/cs35l54-b0-dsp1-misc-103c8e17-amp1.bin: v19.11.11
[   14.792385] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: DSP1: misc: C:\tuning_bin\init\103C8E15_241108_V01_A0-init.bin
[   14.816027] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: DSP1: cirrus/cs35l54-b0-dsp1-misc-103c8e17-amp2.bin: v19.11.11
[   14.816240] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: DSP1: misc: C:\tuning_bin\init\103C8E15_241108_V01_A1-init.bin
[   14.924011] kernel: audit: type=1400 audit(1767039741.916:4): apparmor="STATUS" operation="profile_load" profile="unconfined" name="chromium" pid=1950 comm="apparmor_parser"
[   14.924044] kernel: audit: type=1400 audit(1767039741.916:5): apparmor="STATUS" operation="profile_load" profile="unconfined" name="ch-run" pid=1948 comm="apparmor_parser"
[   14.924059] kernel: audit: type=1400 audit(1767039741.916:6): apparmor="STATUS" operation="profile_load" profile="unconfined" name="Discord" pid=1938 comm="apparmor_parser"
[   14.924077] kernel: audit: type=1400 audit(1767039741.916:7): apparmor="STATUS" operation="profile_load" profile="unconfined" name="cam" pid=1946 comm="apparmor_parser"
[   14.924094] kernel: audit: type=1400 audit(1767039741.916:8): apparmor="STATUS" operation="profile_load" profile="unconfined" name="busybox" pid=1945 comm="apparmor_parser"
[   14.924116] kernel: audit: type=1400 audit(1767039741.916:9): apparmor="STATUS" operation="profile_load" profile="unconfined" name="vscode" pid=1952 comm="apparmor_parser"
[   14.924129] kernel: audit: type=1400 audit(1767039741.916:10): apparmor="STATUS" operation="profile_load" profile="unconfined" name="brave" pid=1943 comm="apparmor_parser"
[   14.924178] kernel: audit: type=1400 audit(1767039741.916:11): apparmor="STATUS" operation="profile_load" profile="unconfined" name="chrome" pid=1949 comm="apparmor_parser"
[   14.924208] kernel: audit: type=1400 audit(1767039741.916:12): apparmor="STATUS" operation="profile_load" profile="unconfined" name="QtWebEngineProcess" pid=1940 comm="apparmor_parser"
[   14.924226] kernel: audit: type=1400 audit(1767039741.916:13): apparmor="STATUS" operation="profile_load" profile="unconfined" name="crun" pid=1953 comm="apparmor_parser"
[   15.064163] kernel: mt7925e 0000:c2:00.0 wlp194s0: renamed from wlan0
[   15.192030] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: Calibration applied
[   15.192500] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: Calibration applied
[   15.192866] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: Tuning PID: 0x0, SID: 0x0, TID: 0x0
[   15.193069] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: Tuning PID: 0x0, SID: 0x0, TID: 0x0
[   15.544011] kernel: nvme nvme0: using unchecked data buffer
[   15.580072] kernel: Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[   15.580114] kernel: Bluetooth: BNEP filters: protocol multicast
[   15.580127] kernel: Bluetooth: BNEP socket layer initialized
[   15.584031] kernel: Bluetooth: MGMT ver 1.23
[   15.596010] kernel: NET: Registered PF_ALG protocol family
[   15.636015] kernel: block nvme0n1: No UUID available providing old NGUID
[   15.640016] kernel: Bluetooth: RFCOMM TTY layer initialized
[   15.640056] kernel: Bluetooth: RFCOMM socket layer initialized
[   15.640077] kernel: Bluetooth: RFCOMM ver 1.11
[   15.660023] kernel: NET: Registered PF_QIPCRTR protocol family
[   18.336506] kernel: wlp194s0: authenticate with 20:b8:2b:5b:01:de (local address=f0:68:e3:58:84:a6)
[   18.692049] kernel: wlp194s0: send auth to 20:b8:2b:5b:01:de (try 1/3)
[   18.696019] kernel: wlp194s0: authenticated
[   18.704110] kernel: wlp194s0: associate with 20:b8:2b:5b:01:de (try 1/3)
[   18.720476] kernel: wlp194s0: RX AssocResp from 20:b8:2b:5b:01:de (capab=0x1011 status=0 aid=9)
[   18.752041] kernel: wlp194s0: associated
[   18.916054] kernel: wlp194s0: Limiting TX power to 30 (30 - 0) dBm as advertised by 20:b8:2b:5b:01:de
[   27.588113] kernel: Lockdown: systemd-logind: hibernation is restricted; see man kernel_lockdown.7
[   27.652039] kernel: rfkill: input handler disabled
[   31.260045] kernel: usb 3-4: reset full-speed USB device number 3 using xhci_hcd
[   33.648124] kernel: rfkill: input handler enabled
[   34.800060] kernel: Lockdown: systemd-logind: hibernation is restricted; see man kernel_lockdown.7
[   34.952032] kernel: rfkill: input handler disabled
[   37.348055] kernel: SCSI subsystem initialized
[ 1055.196041] kernel: Lockdown: systemd-logind: hibernation is restricted; see man kernel_lockdown.7
[ 1100.532070] kernel: NOTICE: Automounting of tracing to debugfs is deprecated and will be removed in 2030
[ 2089.832049] kernel: usb 3-4: reset full-speed USB device number 3 using xhci_hcd
[ 2836.124042] kernel: usb 3-4: reset full-speed USB device number 3 using xhci_hcd
[ 3729.032029] kernel: warning: `ThreadPoolForeg' uses wireless extensions which will stop working for Wi-Fi 7 hardware; use nl80211
[ 4510.760067] kernel: show_signal_msg: 124 callbacks suppressed
[ 4510.760331] kernel: celluloid[13802]: segfault at 8 ip 00007fcea9384e11 sp 00007ffdd6204050 error 4 in libgtk-4.so.1.2000.3[184e11,7fcea92d9000+506000] likely on CPU 4 (core 2, socket 0)
[ 4510.760378] kernel: Code: 89 c7 41 56 49 89 ce 41 54 49 89 f4 55 48 89 d5 53 48 89 fb e8 40 f9 ff ff 48 85 db 0f 84 d7 00 00 00 48 8b 13 48 85 d2 74 05 <48> 3b 02 74 13 48 89 c6 48 89 df e8 ef b7 f5 ff 85 c0 0f 84 b7 00
[ 5196.216039] kernel: Lockdown: systemd-logind: hibernation is restricted; see man kernel_lockdown.7
[ 5199.720064] kernel: Lockdown: systemd-logind: hibernation is restricted; see man kernel_lockdown.7
[ 5199.724059] kernel: Lockdown: systemd-logind: hibernation is restricted; see man kernel_lockdown.7
[ 5199.772033] kernel: wlp194s0: deauthenticating from 20:b8:2b:5b:01:de by local choice (Reason: 3=DEAUTH_LEAVING)
[ 5200.808024] kernel: PM: suspend entry (s2idle)
[ 5200.884037] kernel: Filesystems sync: 0.076 seconds
[ 5202.432562] kernel: Freezing user space processes
[ 5202.433126] kernel: Freezing user space processes completed (elapsed 0.002 seconds)
[ 5202.433375] kernel: OOM killer disabled.
[ 5202.433433] kernel: Freezing remaining freezable tasks
[ 5202.433647] kernel: Freezing remaining freezable tasks completed (elapsed 0.000 seconds)
[ 5202.433669] kernel: printk: Suspending console(s) (use no_console_suspend to debug)
[ 5202.433686] kernel: queueing ieee80211 work while going to suspend
[ 5202.433711] kernel: amdgpu 0000:c3:00.0: amdgpu: Register(0) [regVPEC_QUEUE_RESET_REQ] failed to reach value 0x00000000 != 0x00000001n
[ 5202.434033] kernel: amdgpu 0000:c3:00.0: amdgpu: VPE queue reset failed
[ 5202.434219] kernel: ACPI: EC: interrupt blocked
[ 5202.434240] kernel: ACPI: EC: interrupt unblocked
[ 5202.434262] kernel: [drm] PCIE GART of 512M enabled (table at 0x000000801FB00000).
[ 5202.434282] kernel: amdgpu 0000:c3:00.0: amdgpu: SMU is resuming...
[ 5202.434439] kernel: amdgpu 0000:c3:00.0: amdgpu: SMU is resumed successfully!
[ 5202.434599] kernel: nvme nvme0: 16/0/0 default/read/poll queues
[ 5202.434733] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: firmware: failed to load cirrus/cs35l54-b0-dsp1-misc-103c8e17-amp1.wmfw (-2)
[ 5202.434901] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: firmware: failed to load cirrus/cs35l54-b0-dsp1-misc-103c8e17-amp1.wmfw (-2)
[ 5202.435024] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: firmware: failed to load cirrus/cs35l54-b0-dsp1-misc-103c8e17-amp1.wmfw (-2)
[ 5202.435167] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: firmware: failed to load cirrus/cs35l54-b0-dsp1-misc-103c8e17-amp2.wmfw (-2)
[ 5202.435319] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: firmware: failed to load cirrus/cs35l54-b0-dsp1-misc-103c8e17-amp2.wmfw (-2)
[ 5202.435446] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: firmware: failed to load cirrus/cs35l54-b0-dsp1-misc-103c8e17-amp2.wmfw (-2)
[ 5202.435570] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: DSP1: cirrus/cs35l54-b0-dsp1-misc-103c8e17.wmfw: format 3 timestamp 0x66ad5cf1
[ 5202.435703] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: DSP1: cirrus/cs35l54-b0-dsp1-misc-103c8e17.wmfw: Fri 02 Aug 2024 17:25:52 Central Daylight Time
[ 5202.435820] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: DSP1: cirrus/cs35l54-b0-dsp1-misc-103c8e17.wmfw: format 3 timestamp 0x66ad5cf1
[ 5202.435956] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: DSP1: cirrus/cs35l54-b0-dsp1-misc-103c8e17.wmfw: Fri 02 Aug 2024 17:25:52 Central Daylight Time
[ 5202.436106] kernel: amdgpu 0000:c3:00.0: amdgpu: ring gfx_0.0.0 uses VM inv eng 0 on hub 0
[ 5202.436255] kernel: amdgpu 0000:c3:00.0: amdgpu: ring comp_1.0.0 uses VM inv eng 1 on hub 0
[ 5202.436394] kernel: amdgpu 0000:c3:00.0: amdgpu: ring comp_1.1.0 uses VM inv eng 4 on hub 0
[ 5202.436533] kernel: amdgpu 0000:c3:00.0: amdgpu: ring comp_1.2.0 uses VM inv eng 6 on hub 0
[ 5202.436673] kernel: amdgpu 0000:c3:00.0: amdgpu: ring comp_1.3.0 uses VM inv eng 7 on hub 0
[ 5202.436809] kernel: amdgpu 0000:c3:00.0: amdgpu: ring comp_1.0.1 uses VM inv eng 8 on hub 0
[ 5202.436949] kernel: amdgpu 0000:c3:00.0: amdgpu: ring comp_1.1.1 uses VM inv eng 9 on hub 0
[ 5202.437083] kernel: amdgpu 0000:c3:00.0: amdgpu: ring comp_1.2.1 uses VM inv eng 10 on hub 0
[ 5202.437217] kernel: amdgpu 0000:c3:00.0: amdgpu: ring comp_1.3.1 uses VM inv eng 11 on hub 0
[ 5202.437645] kernel: amdgpu 0000:c3:00.0: amdgpu: ring sdma0 uses VM inv eng 12 on hub 0
[ 5202.437804] kernel: amdgpu 0000:c3:00.0: amdgpu: ring vcn_unified_0 uses VM inv eng 0 on hub 8
[ 5202.438000] kernel: amdgpu 0000:c3:00.0: amdgpu: ring jpeg_dec_0 uses VM inv eng 1 on hub 8
[ 5202.440949] kernel: amdgpu 0000:c3:00.0: amdgpu: ring mes_kiq_3.1.0 uses VM inv eng 13 on hub 0
[ 5202.441111] kernel: amdgpu 0000:c3:00.0: amdgpu: ring vpe uses VM inv eng 4 on hub 8
[ 5202.441252] kernel: OOM killer enabled.
[ 5202.441271] kernel: Restarting tasks: Starting
[ 5202.441288] kernel: Restarting tasks: Done
[ 5202.441304] kernel: efivarfs: resyncing variable state
[ 5202.441320] kernel: efivarfs: finished resyncing variable state
[ 5202.441334] kernel: random: crng reseeded on system resumption
[ 5202.441356] kernel: PM: suspend exit
[ 5203.032161] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: DSP1: Firmware: 1a00d6 vendor: 0x2 v19.11.11, 41 algorithms
[ 5203.032682] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: DSP1: Firmware: 1a00d6 vendor: 0x2 v19.11.11, 41 algorithms
[ 5203.044043] kernel: usb 3-4: reset full-speed USB device number 3 using xhci_hcd
[ 5203.060036] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: DSP1: cirrus/cs35l54-b0-dsp1-misc-103c8e17-amp1.bin: v19.11.11
[ 5203.060230] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: DSP1: misc: C:\tuning_bin\init\103C8E15_241108_V01_A0-init.bin
[ 5203.084036] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: DSP1: cirrus/cs35l54-b0-dsp1-misc-103c8e17-amp2.bin: v19.11.11
[ 5203.084222] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: DSP1: misc: C:\tuning_bin\init\103C8E15_241108_V01_A1-init.bin
[ 5203.460012] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: Calibration applied
[ 5203.460460] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: Tuning PID: 0x0, SID: 0x0, TID: 0x0
[ 5203.464056] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: Calibration applied
[ 5203.464236] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: Tuning PID: 0x0, SID: 0x0, TID: 0x0
[ 5205.164105] kernel: wlp194s0: authenticate with 20:b8:2b:5b:01:dd (local address=f0:68:e3:58:84:a6)
[ 5205.288037] kernel: wlp194s0: send auth to 20:b8:2b:5b:01:dd (try 1/3)
[ 5205.288094] kernel: wlp194s0: authenticated
[ 5205.296047] kernel: wlp194s0: associate with 20:b8:2b:5b:01:dd (try 1/3)
[ 5205.317442] kernel: wlp194s0: RX AssocResp from 20:b8:2b:5b:01:dd (capab=0x1411 status=0 aid=24)
[ 5205.364095] kernel: wlp194s0: associated
[ 5205.512049] kernel: wlp194s0: Limiting TX power to 20 (20 - 0) dBm as advertised by 20:b8:2b:5b:01:dd
[ 5215.172043] kernel: Lockdown: systemd-logind: hibernation is restricted; see man kernel_lockdown.7
[ 5217.472052] kernel: Lockdown: systemd-logind: hibernation is restricted; see man kernel_lockdown.7
[ 5217.476375] kernel: Lockdown: systemd-logind: hibernation is restricted; see man kernel_lockdown.7
[ 5217.524031] kernel: wlp194s0: deauthenticating from 20:b8:2b:5b:01:dd by local choice (Reason: 3=DEAUTH_LEAVING)
[ 5218.324055] kernel: PM: suspend entry (s2idle)
[ 5218.412018] kernel: Filesystems sync: 0.095 seconds
[ 5222.843739] kernel: Freezing user space processes
[ 5222.844484] kernel: Freezing user space processes completed (elapsed 0.002 seconds)
[ 5222.844743] kernel: OOM killer disabled.
[ 5222.844817] kernel: Freezing remaining freezable tasks
[ 5222.844857] kernel: Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
[ 5222.844907] kernel: printk: Suspending console(s) (use no_console_suspend to debug)
[ 5222.844958] kernel: queueing ieee80211 work while going to suspend
[ 5222.845001] kernel: amdgpu 0000:c3:00.0: amdgpu: Register(0) [regVPEC_QUEUE_RESET_REQ] failed to reach value 0x00000000 != 0x00000001n
[ 5222.845294] kernel: amdgpu 0000:c3:00.0: amdgpu: VPE queue reset failed
[ 5222.845490] kernel: ACPI: EC: interrupt blocked
[ 5222.845531] kernel: Reading current time from RTC took around 148 ms
[ 5222.845569] kernel: Reading current time from RTC took around 131 ms
[ 5222.845611] kernel: Reading current time from RTC took around 180 ms
[ 5222.845656] kernel: Reading current time from RTC took around 188 ms
[ 5222.845698] kernel: Reading current time from RTC took around 196 ms
[ 5222.845741] kernel: Reading current time from RTC took around 203 ms
[ 5222.845936] kernel: Reading current time from RTC took around 211 ms
[ 5222.845974] kernel: Reading current time from RTC took around 168 ms
[ 5222.845993] kernel: Reading current time from RTC took around 176 ms
[ 5222.846010] kernel: Reading current time from RTC took around 184 ms
[ 5222.846026] kernel: Reading current time from RTC took around 192 ms
[ 5222.846042] kernel: Reading current time from RTC took around 199 ms
[ 5222.846056] kernel: Reading current time from RTC took around 164 ms
[ 5222.846072] kernel: Reading current time from RTC took around 172 ms
[ 5222.846087] kernel: Reading current time from RTC took around 179 ms
[ 5222.846100] kernel: Reading current time from RTC took around 187 ms
[ 5222.846117] kernel: Reading current time from RTC took around 195 ms
[ 5222.846133] kernel: Reading current time from RTC took around 202 ms
[ 5222.846148] kernel: Reading current time from RTC took around 210 ms
[ 5222.846163] kernel: ACPI: EC: interrupt unblocked
[ 5222.846179] kernel: [drm] PCIE GART of 512M enabled (table at 0x000000801FB00000).
[ 5222.846190] kernel: amdgpu 0000:c3:00.0: amdgpu: SMU is resuming...
[ 5222.846351] kernel: amdgpu 0000:c3:00.0: amdgpu: SMU is resumed successfully!
[ 5222.846497] kernel: nvme nvme0: 16/0/0 default/read/poll queues
[ 5222.846631] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: firmware: failed to load cirrus/cs35l54-b0-dsp1-misc-103c8e17-amp1.wmfw (-2)
[ 5222.846781] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: firmware: failed to load cirrus/cs35l54-b0-dsp1-misc-103c8e17-amp1.wmfw (-2)
[ 5222.846902] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: firmware: failed to load cirrus/cs35l54-b0-dsp1-misc-103c8e17-amp1.wmfw (-2)
[ 5222.847020] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: DSP1: cirrus/cs35l54-b0-dsp1-misc-103c8e17.wmfw: format 3 timestamp 0x66ad5cf1
[ 5222.847139] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: DSP1: cirrus/cs35l54-b0-dsp1-misc-103c8e17.wmfw: Fri 02 Aug 2024 17:25:52 Central Daylight Time
[ 5222.847256] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: firmware: failed to load cirrus/cs35l54-b0-dsp1-misc-103c8e17-amp2.wmfw (-2)
[ 5222.847380] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: firmware: failed to load cirrus/cs35l54-b0-dsp1-misc-103c8e17-amp2.wmfw (-2)
[ 5222.847495] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: firmware: failed to load cirrus/cs35l54-b0-dsp1-misc-103c8e17-amp2.wmfw (-2)
[ 5222.847611] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: DSP1: cirrus/cs35l54-b0-dsp1-misc-103c8e17.wmfw: format 3 timestamp 0x66ad5cf1
[ 5222.848133] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: DSP1: cirrus/cs35l54-b0-dsp1-misc-103c8e17.wmfw: Fri 02 Aug 2024 17:25:52 Central Daylight Time
[ 5222.848350] kernel: amdgpu 0000:c3:00.0: amdgpu: ring gfx_0.0.0 uses VM inv eng 0 on hub 0
[ 5222.848522] kernel: amdgpu 0000:c3:00.0: amdgpu: ring comp_1.0.0 uses VM inv eng 1 on hub 0
[ 5222.848674] kernel: amdgpu 0000:c3:00.0: amdgpu: ring comp_1.1.0 uses VM inv eng 4 on hub 0
[ 5222.848813] kernel: amdgpu 0000:c3:00.0: amdgpu: ring comp_1.2.0 uses VM inv eng 6 on hub 0
[ 5222.848953] kernel: amdgpu 0000:c3:00.0: amdgpu: ring comp_1.3.0 uses VM inv eng 7 on hub 0
[ 5222.849093] kernel: amdgpu 0000:c3:00.0: amdgpu: ring comp_1.0.1 uses VM inv eng 8 on hub 0
[ 5222.849230] kernel: amdgpu 0000:c3:00.0: amdgpu: ring comp_1.1.1 uses VM inv eng 9 on hub 0
[ 5222.849364] kernel: amdgpu 0000:c3:00.0: amdgpu: ring comp_1.2.1 uses VM inv eng 10 on hub 0
[ 5222.849499] kernel: amdgpu 0000:c3:00.0: amdgpu: ring comp_1.3.1 uses VM inv eng 11 on hub 0
[ 5222.849634] kernel: amdgpu 0000:c3:00.0: amdgpu: ring sdma0 uses VM inv eng 12 on hub 0
[ 5222.849767] kernel: amdgpu 0000:c3:00.0: amdgpu: ring vcn_unified_0 uses VM inv eng 0 on hub 8
[ 5222.849905] kernel: amdgpu 0000:c3:00.0: amdgpu: ring jpeg_dec_0 uses VM inv eng 1 on hub 8
[ 5222.850039] kernel: amdgpu 0000:c3:00.0: amdgpu: ring mes_kiq_3.1.0 uses VM inv eng 13 on hub 0
[ 5222.850172] kernel: amdgpu 0000:c3:00.0: amdgpu: ring vpe uses VM inv eng 4 on hub 8
[ 5222.850312] kernel: usb 3-4: reset full-speed USB device number 3 using xhci_hcd
[ 5222.850515] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: DSP1: Firmware: 1a00d6 vendor: 0x2 v19.11.11, 41 algorithms
[ 5222.850650] kernel: OOM killer enabled.
[ 5222.850668] kernel: Restarting tasks: Starting
[ 5222.850679] kernel: Restarting tasks: Done
[ 5222.850691] kernel: efivarfs: resyncing variable state
[ 5222.850704] kernel: efivarfs: finished resyncing variable state
[ 5222.850715] kernel: random: crng reseeded on system resumption
[ 5222.850728] kernel: PM: suspend exit
[ 5222.850742] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: DSP1: cirrus/cs35l54-b0-dsp1-misc-103c8e17-amp1.bin: v19.11.11
[ 5222.850862] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: DSP1: misc: C:\tuning_bin\init\103C8E15_241108_V01_A0-init.bin
[ 5223.032056] kernel: audit: type=1400 audit(1767096891.143:138): apparmor="DENIED" operation="open" class="file" profile="/usr/sbin/cupsd" name="/etc/paperspecs" pid=17333 comm="cupsd" requested_mask="r" denied_mask="r" fsuid=0 ouid=0
[ 5223.036024] kernel: audit: type=1400 audit(1767096891.147:139): apparmor="DENIED" operation="capable" class="cap" profile="/usr/sbin/cupsd" pid=17333 comm="cupsd" capability=12  capname="net_admin"
[ 5223.200061] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: DSP1: Firmware: 1a00d6 vendor: 0x2 v19.11.11, 41 algorithms
[ 5223.228042] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: DSP1: cirrus/cs35l54-b0-dsp1-misc-103c8e17-amp2.bin: v19.11.11
[ 5223.228374] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: DSP1: misc: C:\tuning_bin\init\103C8E15_241108_V01_A1-init.bin
[ 5223.572124] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: Calibration applied
[ 5223.576030] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.0: Tuning PID: 0x0, SID: 0x0, TID: 0x0
[ 5223.576207] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: Calibration applied
[ 5223.580034] kernel: cs35l56-hda i2c-CSC3554:00-cs35l54-hda.1: Tuning PID: 0x0, SID: 0x0, TID: 0x0
[ 5225.572143] kernel: wlp194s0: authenticate with 20:b8:2b:5b:01:dd (local address=f0:68:e3:58:84:a6)
[ 5225.592029] kernel: wlp194s0: send auth to 20:b8:2b:5b:01:dd (try 1/3)
[ 5225.596012] kernel: wlp194s0: authenticated
[ 5225.596038] kernel: wlp194s0: associate with 20:b8:2b:5b:01:dd (try 1/3)
[ 5225.616010] kernel: wlp194s0: RX AssocResp from 20:b8:2b:5b:01:dd (capab=0x1411 status=0 aid=32)
[ 5225.652046] kernel: wlp194s0: associated
[ 5225.784040] kernel: wlp194s0: Limiting TX power to 20 (20 - 0) dBm as advertised by 20:b8:2b:5b:01:dd
[ 5243.508050] kernel: Lockdown: systemd-logind: hibernation is restricted; see man kernel_lockdown.7
[ 5245.372041] kernel: Lockdown: systemd-logind: hibernation is restricted; see man kernel_lockdown.7
[ 5253.836061] kernel: usb 3-4: USB disconnect, device number 3
[ 5253.960060] kernel: usb 3-4: new full-speed USB device number 5 using xhci_hcd
[ 5254.128038] kernel: usb 3-4: New USB device found, idVendor=04f3, idProduct=0c9f, bcdDevice= 8.03
[ 5254.128382] kernel: usb 3-4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[ 5254.128518] kernel: usb 3-4: Product: ELAN:ARM-M4
[ 5254.128634] kernel: usb 3-4: Manufacturer: ELAN
[ 5254.128744] kernel: usb 3-4: Device is not authorized for usage
[ 5254.132045] kernel: usb 3-4: authorized to connect
[ 5259.844069] kernel: usb 3-4: USB disconnect, device number 5
[ 5260.092265] kernel: usb 3-4: new full-speed USB device number 6 using xhci_hcd
[ 5260.260030] kernel: usb 3-4: New USB device found, idVendor=04f3, idProduct=0c9f, bcdDevice= 8.03
[ 5260.260343] kernel: usb 3-4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[ 5260.260484] kernel: usb 3-4: Product: ELAN:ARM-M4
[ 5260.260599] kernel: usb 3-4: Manufacturer: ELAN
[ 5260.260711] kernel: usb 3-4: Device is not authorized for usage
[ 5260.264025] kernel: usb 3-4: authorized to connect
[ 5265.864043] kernel: usb 3-4: USB disconnect, device number 6
[ 5265.988113] kernel: usb 3-4: new full-speed USB device number 7 using xhci_hcd
[ 5266.156039] kernel: usb 3-4: New USB device found, idVendor=04f3, idProduct=0c9f, bcdDevice= 8.03
[ 5266.156357] kernel: usb 3-4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[ 5266.156489] kernel: usb 3-4: Product: ELAN:ARM-M4
[ 5266.156606] kernel: usb 3-4: Manufacturer: ELAN
[ 5266.156714] kernel: usb 3-4: Device is not authorized for usage
[ 5266.160031] kernel: usb 3-4: authorized to connect
[ 5271.880036] kernel: usb 3-4: USB disconnect, device number 7
[ 5272.136191] kernel: usb 3-4: new full-speed USB device number 8 using xhci_hcd
[ 5272.304041] kernel: usb 3-4: New USB device found, idVendor=04f3, idProduct=0c9f, bcdDevice= 8.03
[ 5272.304371] kernel: usb 3-4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[ 5272.304511] kernel: usb 3-4: Product: ELAN:ARM-M4
[ 5272.304623] kernel: usb 3-4: Manufacturer: ELAN
[ 5272.304727] kernel: usb 3-4: Device is not authorized for usage
[ 5272.308026] kernel: usb 3-4: authorized to connect
[ 5277.916053] kernel: usb 3-4: USB disconnect, device number 8
[ 5278.036050] kernel: usb 3-4: new full-speed USB device number 9 using xhci_hcd
[ 5278.204026] kernel: usb 3-4: New USB device found, idVendor=04f3, idProduct=0c9f, bcdDevice= 8.03
[ 5278.204352] kernel: usb 3-4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[ 5278.204477] kernel: usb 3-4: Product: ELAN:ARM-M4
[ 5278.204597] kernel: usb 3-4: Manufacturer: ELAN
[ 5278.204712] kernel: usb 3-4: Device is not authorized for usage
[ 5278.208241] kernel: usb 3-4: authorized to connect
[ 5283.924061] kernel: usb 3-4: USB disconnect, device number 9
[ 5284.176132] kernel: usb 3-4: new full-speed USB device number 10 using xhci_hcd
[ 5284.344012] kernel: usb 3-4: New USB device found, idVendor=04f3, idProduct=0c9f, bcdDevice= 8.03
[ 5284.344491] kernel: usb 3-4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[ 5284.344809] kernel: usb 3-4: Product: ELAN:ARM-M4
[ 5284.344934] kernel: usb 3-4: Manufacturer: ELAN
[ 5284.345041] kernel: usb 3-4: Device is not authorized for usage
[ 5284.352027] kernel: usb 3-4: authorized to connect
[ 5289.952035] kernel: usb 3-4: USB disconnect, device number 10
[ 5290.072138] kernel: usb 3-4: new full-speed USB device number 11 using xhci_hcd
[ 5290.240029] kernel: usb 3-4: New USB device found, idVendor=04f3, idProduct=0c9f, bcdDevice= 8.03
[ 5290.240353] kernel: usb 3-4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[ 5290.240488] kernel: usb 3-4: Product: ELAN:ARM-M4
[ 5290.240612] kernel: usb 3-4: Manufacturer: ELAN
[ 5290.240722] kernel: usb 3-4: Device is not authorized for usage
[ 5290.244029] kernel: usb 3-4: authorized to connect
[ 5291.392279] kernel: usb 3-2: new full-speed USB device number 12 using xhci_hcd
[ 5291.552061] kernel: usb 3-2: New USB device found, idVendor=046d, idProduct=c08f, bcdDevice=45.01
[ 5291.552596] kernel: usb 3-2: New USB device strings: Mfr=1, Product=2, SerialNumber=3
[ 5291.553085] kernel: usb 3-2: Product: G403 HERO Gaming Mouse
[ 5291.553220] kernel: usb 3-2: Manufacturer: Logitech
[ 5291.553343] kernel: usb 3-2: SerialNumber: 086E39543931
[ 5291.553456] kernel: usb 3-2: Device is not authorized for usage
[ 5291.572075] kernel: input: Logitech G403 HERO Gaming Mouse as /devices/pci0000:00/0000:00:08.3/0000:c5:00.0/usb3/3-2/3-2:1.0/0003:046D:C08F.0004/input/input21
[ 5291.572238] kernel: hid-generic 0003:046D:C08F.0004: input,hidraw3: USB HID v1.11 Mouse [Logitech G403 HERO Gaming Mouse] on usb-0000:c5:00.0-2/input0
[ 5291.580074] kernel: input: Logitech G403 HERO Gaming Mouse Keyboard as /devices/pci0000:00/0000:00:08.3/0000:c5:00.0/usb3/3-2/3-2:1.1/0003:046D:C08F.0005/input/input22
[ 5291.636042] kernel: hid-generic 0003:046D:C08F.0005: input,hiddev1,hidraw4: USB HID v1.11 Keyboard [Logitech G403 HERO Gaming Mouse] on usb-0000:c5:00.0-2/input1
[ 5291.636410] kernel: usb 3-2: authorized to connect
[ 5295.840035] kernel: usb 3-4: USB disconnect, device number 11
[ 5296.140046] kernel: usb 3-4: new full-speed USB device number 13 using xhci_hcd
[ 5296.308036] kernel: usb 3-4: New USB device found, idVendor=04f3, idProduct=0c9f, bcdDevice= 8.03
[ 5296.308240] kernel: usb 3-4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[ 5296.308283] kernel: usb 3-4: Product: ELAN:ARM-M4
[ 5296.308537] kernel: usb 3-4: Manufacturer: ELAN
[ 5296.308664] kernel: usb 3-4: Device is not authorized for usage
[ 5296.316021] kernel: usb 3-4: authorized to connect
[ 5301.860051] kernel: usb 3-4: USB disconnect, device number 13
[ 5302.144295] kernel: usb 3-4: new full-speed USB device number 14 using xhci_hcd
[ 5302.312041] kernel: usb 3-4: New USB device found, idVendor=04f3, idProduct=0c9f, bcdDevice= 8.03
[ 5302.312485] kernel: usb 3-4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[ 5302.312671] kernel: usb 3-4: Product: ELAN:ARM-M4
[ 5302.312831] kernel: usb 3-4: Manufacturer: ELAN
[ 5302.312998] kernel: usb 3-4: Device is not authorized for usage
[ 5302.316030] kernel: usb 3-4: authorized to connect
[ 5307.876026] kernel: usb 3-4: USB disconnect, device number 14
[ 5308.160176] kernel: usb 3-4: new full-speed USB device number 15 using xhci_hcd
[ 5308.324104] kernel: usb 3-4: New USB device found, idVendor=04f3, idProduct=0c9f, bcdDevice= 8.03
[ 5308.324451] kernel: usb 3-4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[ 5308.324784] kernel: usb 3-4: Product: ELAN:ARM-M4
[ 5308.324914] kernel: usb 3-4: Manufacturer: ELAN
[ 5308.325035] kernel: usb 3-4: Device is not authorized for usage
[ 5308.332024] kernel: usb 3-4: authorized to connect
[ 5313.896060] kernel: usb 3-4: USB disconnect, device number 15
[ 5314.176292] kernel: usb 3-4: new full-speed USB device number 16 using xhci_hcd
[ 5314.344034] kernel: usb 3-4: New USB device found, idVendor=04f3, idProduct=0c9f, bcdDevice= 8.03
[ 5314.344434] kernel: usb 3-4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[ 5314.344588] kernel: usb 3-4: Product: ELAN:ARM-M4
[ 5314.344704] kernel: usb 3-4: Manufacturer: ELAN
[ 5314.344815] kernel: usb 3-4: Device is not authorized for usage
[ 5314.348028] kernel: usb 3-4: authorized to connect
[ 5319.916070] kernel: usb 3-4: USB disconnect, device number 16
[ 5320.196341] kernel: usb 3-4: new full-speed USB device number 17 using xhci_hcd
[ 5320.368037] kernel: usb 3-4: New USB device found, idVendor=04f3, idProduct=0c9f, bcdDevice= 8.03
[ 5320.368372] kernel: usb 3-4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
[ 5320.368485] kernel: usb 3-4: Product: ELAN:ARM-M4
[ 5320.368606] kernel: usb 3-4: Manufacturer: ELAN
[ 5320.368723] kernel: usb 3-4: Device is not authorized for usage
[ 5320.372015] kernel: usb 3-4: authorized to connect

--x9CtWmzuiv/fctnO--

