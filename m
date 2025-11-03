Return-Path: <linux-usb+bounces-30001-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id E9741C2B35E
	for <lists+linux-usb@lfdr.de>; Mon, 03 Nov 2025 12:01:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 55CDB4E9C37
	for <lists+linux-usb@lfdr.de>; Mon,  3 Nov 2025 11:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 052122FF64C;
	Mon,  3 Nov 2025 11:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=permerror (0-bit key) header.d=tty42.de header.i=@tty42.de header.b="SJyDBcT4";
	dkim=pass (2048-bit key) header.d=tty42.de header.i=@tty42.de header.b="HMOItOpV"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail.tty42.de (mail.tty42.de [94.130.190.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9930B2FD7A0
	for <linux-usb@vger.kernel.org>; Mon,  3 Nov 2025 11:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.130.190.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762167697; cv=pass; b=M19l4aLgAvFY5/nYR6BcTlc03DVYUhqYctF1gVTMO/oTza+OAkbL5PXhhJBtmHbJKCSdTKieHfL4tUEo20dRbALzSezUdGGvj7E2h5ejt5yKxJ/PJiVUzw6B8PEPBL6qk9+Z9VkMypzgMxVShi1+yM0Emto0S/N2BoM+Vp7v4YY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762167697; c=relaxed/simple;
	bh=5D0gm1pHsmUR7BJLO8pX3ftraQK2xlKHBs9gRJ2Q1eo=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hKNP1sayMs0nB9ZPdqyKlAmSQAwIlqQGI4QqNAT8+CK8neWLKlGBUEmEY/SSQy+WG/QZPtQravUnlbE++e8Hrdw9u+G7NwPTWEGrO1l6L99pI0NxW+GM/G2HsfvK3171VhQpQhXqc6iJEibW7frF7RwRggCHEVk6L7l4Cs60RiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tty42.de; spf=pass smtp.mailfrom=tty42.de; dkim=permerror (0-bit key) header.d=tty42.de header.i=@tty42.de header.b=SJyDBcT4; dkim=pass (2048-bit key) header.d=tty42.de header.i=@tty42.de header.b=HMOItOpV; arc=pass smtp.client-ip=94.130.190.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=tty42.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tty42.de
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=tty42.de;
	s=dkim; t=1762167669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ACi+i9caeJ2CplVykMw1ia1rhTJ1U6QCwspVApLlRv4=;
	b=SJyDBcT4E2hmz+cr/ycDZcnOmgyonoD6TMYoWCt5FQbmdoJ3tf4fAORTTdl0tZOASnvAqg
	X9K0i3jxkTrFptCQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tty42.de; s=rsa;
	t=1762167669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ACi+i9caeJ2CplVykMw1ia1rhTJ1U6QCwspVApLlRv4=;
	b=HMOItOpVaUNphtkicutrktK0nGR5GVcaySZgMcF2zHXQGvE98KFeICnb597/WkYxRVXxlV
	PAnL8dervINbkPVTLryWq8ytiEllfZrHjXPL6sTJw+q1pnKPb6N5XdJ4YPKCvjZCebRIiB
	nnfMiqn7yrOa/0TpvCIMWkLcmjXOB6PqoY6WmC9+DC0XPzfLiJ+RU5vt1+U/SXzDlOVtYn
	tLgZ035JA/hDdAW+K90r5+TIQyKWl2Dhs6OSrtZqReND2mJvpezJf9rgWxLHJHPaAX641z
	DhGdwDmAkBdUyxBGPVsAFDuUApB4UVtyiyZiEvUjKfpz63UE4NAtKwQvkji5xg==
ARC-Seal: i=1; s=rsa; d=tty42.de; t=1762167668; a=rsa-sha256; cv=none;
	b=z+NlgaIo4FKRvHnbFSDkM6N0UJIhMyav4Ukombv0tWoiFOUVRPEFf5rAid+0lYEHRK4FsO
	p1pH6+zmGYS7Dw2NtqbfUZ2fF5/TW3GXTcMyUVnNmDDm+eQjfcCVvemStkJ89JGMdpz7KI
	jB4b+LDZSP7wIiOjfFtbQmTTL0QLuB1wuhMHp4Ms6lKup60IG0eU9Ngmp2t2xDUB0/vKcV
	gIqUITDxvJSofv4Sa3z+Er7uZMTiAm4lXtzKHB9XoT3H1GNENZKBicZHyiY8jQyqgh0POA
	Ei2zNtMePPJlbVATM8lc6f1o1zPkzFBreFaJUk2tO7/EcfYUMkKw0eL8Y8cntA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=tty42.de;
	s=rsa; t=1762167668;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ACi+i9caeJ2CplVykMw1ia1rhTJ1U6QCwspVApLlRv4=;
	b=Cu4M8ZOZV3MVq3lPmUtNnb38hgTyHTiFmyDRFJ1FeAPHVEu+0B/qRuXSu+cZ1shXWUPhHh
	ngGMVPqxVxj2vkJ6Tmoot4PrIGvXI5ZnpPVPOJG5Ync9aWFxgnYvx0qU5xyhbVJZTxRWAY
	rB+Uq48dGlwGK5QfyPIlrxBX8ca7BsIRJ/SUmmr0tQIWW9k0/d3JLRnSKc/p0X9vrxNtYN
	agryWliFPS3XnSLTUSDav6LWm4ER+WLDeNWu9AzgkNUKlV3yRHywfsetvkNoJdpaT3I+Wu
	xVbjuMQAKNY5XBg0/iZlTJp/mem8ZTHNEbhzTKUkKJxoz1tFZ98PPczN/UprHw==
ARC-Authentication-Results: i=1;
	mail.tty42.de;
	auth=pass smtp.auth=frederik@tty42.de smtp.mailfrom=lists@tty42.de
Received: 
	by mail.tty42.de (OpenSMTPD) with ESMTPSA id 8add4217 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO);
	Mon, 3 Nov 2025 11:01:08 +0000 (UTC)
Date: Mon, 3 Nov 2025 12:01:06 +0100
From: Frederik Schwan <lists@tty42.de>
To: linux-usb@vger.kernel.org, Andreas Noever <andreas.noever@gmail.com>, 
	Michael Jamet <michael.jamet@intel.com>, Mika Westerberg <westeri@kernel.org>, 
	Yehezkel Bernat <YehezkelShB@gmail.com>, Imre Deak <imre.deak@intel.com>
Subject: Re: TB 5 Dock DP-Out non-functional
Message-ID: <lerwgbxoidxvfv3ajszi467rupujg465ukh3fcokihxpv2ikjr@rbke2a76anld>
Mail-Followup-To: linux-usb@vger.kernel.org, 
	Andreas Noever <andreas.noever@gmail.com>, Michael Jamet <michael.jamet@intel.com>, 
	Mika Westerberg <westeri@kernel.org>, Yehezkel Bernat <YehezkelShB@gmail.com>, 
	Imre Deak <imre.deak@intel.com>
References: <q7k73t5utfjrpuf45ynig72eojpixepjqccvsfaqt6rg4wptst@se6ekc2eg3sv>
 <20251103055659.GD2912318@black.igk.intel.com>
 <rnp5dzfud5feidxi2qx63cxezukyszuzpj7v5f5gyoqtys3uff@e72nlrudjzxb>
 <20251103102639.GE2912318@black.igk.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xzk6xrf376ixmd6p"
Content-Disposition: inline
In-Reply-To: <20251103102639.GE2912318@black.igk.intel.com>


--xzk6xrf376ixmd6p
Content-Type: multipart/mixed; protected-headers=v1;
	boundary="iw2z5iatikzpq2dr"
Content-Disposition: inline
Subject: Re: TB 5 Dock DP-Out non-functional
MIME-Version: 1.0


--iw2z5iatikzpq2dr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Mika,

On Mon, Nov 03, 2025 at 11:26:39AM +0100, Mika Westerberg wrote:
> Hi,
>=20
> On Mon, Nov 03, 2025 at 09:54:50AM +0100, Frederik Schwan wrote:
> > Hi Mika,
> >=20
> > On Mon, Nov 03, 2025 at 06:56:59AM +0100, Mika Westerberg wrote:
> > > On Sun, Nov 02, 2025 at 04:39:07PM +0100, Frederik Schwan wrote:
> > >> Setup:
> > >> TB 5 Host (Lenovo P1 Gen8)
> > >>   -> TB 4 Dock (0108:2031 reports as "ThinkPad Thunderbolt 4 Dock")
> > >>     -> USB Devices, two 3840x2160, LAN attached
> > >>   -> TB 5 Dock (0108:234d reports as "ThinkPad Thunderbolt 5 Smart D=
ock 7500 - 40BA")
> > >>     -> nothing but power supply
> > >=20
> > > You are saying that you have two docks connected like this:
> > >=20
> > >   Host -> TB 4 -> 2 Monitors
> > >     |
> > >     v
> > >    TB5 (nothing but power)
> > >    =20
> > > And with this the TB4 dock monitors don't work? But without the TB5 d=
ock
> > > they work fine?
> > >=20
> > > It would be good to have simplest possible case where this reproduces=
 then
> > > provide exact steps of that, like
> >=20
> > Sorry for the bad report. As a Arch Linux bugwrangler I should've known=
 how to report this in
> > a non-confusing way :/
> >=20
> > I added the TB4 Dock just to make sure that the only variable is the Do=
ck (to rule out DP cable, monitor etc.).
> > So here comes a minimal setup:
> >=20
> > To repro:
> > 1. Boot (Kernel 6.17.7-arch1-1)
> > 2. Connect TB5 Dock with power and 1 DP screen attached
>=20
> Okay this is much more clear :)
>=20
> > Expected behavior: DP screen comes up and shows output
> > Actual outcome: DP screen blinks for 2-3 tries and goes off again
> >=20
> > dmesg.log attached as well as the bandwidth script output.
>=20
> Thanks! Unfortunately the log is still truncated probably due to added
> debug. Can you add log_buf_len=3D2M or something like that to the kernel
> command line too so we can get the whole log.

Whole log attached.

> Regarding the script, that's odd too but it could be that you have more
> than one host router there (it is not clear from the truncated log). You
> need to build the tbtools binaries though.

I do package tbtools for Arch so these are available.

tblist gives me:
Domain 0 Route 0: 8087:7eb2 Intel Gen14
Domain 1 Route 0: 17ef:a583 Lenovo ThinkPad P1 Gen8 / T1g Gen8
Domain 1 Route 1: 0108:234d Lenovo ThinkPad Thunderbolt 5 Smart Dock 7500 -=
 40BA

tbadapters --domain 1 --route 1:
 1: Lane 0 (upstream)             CL0
 2: Lane 1                        CL0
 3: Lane 0                        CLd
 4: Lane 1                        CLd
 5: Lane 0                        CLd
 6: Lane 1                        CLd
 7: Lane 0                        CLd
 8: Lane 1                        CLd
 9: PCIe Up                       L1
10: PCIe Down                     Disabled
11: DisplayPort OUT               Disabled
12: DisplayPort OUT               Enabled
13: Not implemented
14: Not implemented
15: Not implemented
16: Not implemented
17: PCIe Down                     Disabled
18: PCIe Down                     Disabled
19: DisplayPort OUT               Disabled
20: USB 3 Up                      U0
21: USB 3 Down                    Disabled
22: USB 3 Down                    Disabled
23: USB 3 Down                    Disabled


Hope that is what you asked for :)

--iw2z5iatikzpq2dr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: attachment; filename="tb5.log"
Content-Transfer-Encoding: quoted-printable

[    0.000000] Linux version 6.17.7-arch1-1 (linux@archlinux) (gcc (GCC) 15=
=2E2.1 20250813, GNU ld (GNU Binutils) 2.45.0) #1 SMP PREEMPT_DYNAMIC Sun, =
02 Nov 2025 17:27:22 +0000
[    0.000000] Command line: systemd.unified_cgroup_hierarchy=3D1 kernel.un=
privileged_userns_clone=3D1 thunderbolt.dyndbg=3D+p drm.debug=3D0x10e log_b=
uf_len=3D32M rd.luks.uuid=3D"3fcd7043-2e72-42fb-84ef-a42a377fbebd" rd.luks.=
options=3Ddiscard,no-read-workqueue,no-write-workqueue,timeout=3D0 root=3DU=
UID=3D"4c822bc7-e8c9-4eaa-a480-99294e826ed1" rootflags=3Dx-systemd.device-t=
imeout=3D0 rw
[    0.000000] x86/tme: not enabled by BIOS
[    0.000000] x86/CPU: Model not found in latest microcode list
[    0.000000] x86/split lock detection: #AC: crashing the kernel on kernel=
 split_locks and warning on user-space split_locks
[    0.000000] BIOS-provided physical RAM map:
[    0.000000] BIOS-e820: [mem 0x0000000000000000-0x000000000009ffff] usable
[    0.000000] BIOS-e820: [mem 0x00000000000a0000-0x00000000000fffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000000100000-0x000000005b52efff] usable
[    0.000000] BIOS-e820: [mem 0x000000005b52f000-0x0000000062a2efff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000062a2f000-0x0000000063f2efff] ACPI =
NVS
[    0.000000] BIOS-e820: [mem 0x0000000063f2f000-0x0000000063ffefff] ACPI =
data
[    0.000000] BIOS-e820: [mem 0x0000000063fff000-0x0000000063ffffff] usable
[    0.000000] BIOS-e820: [mem 0x0000000064000000-0x00000000787fffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000c0000000-0x00000000cfffffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x00000000fed20000-0x00000000fed7ffff] reser=
ved
[    0.000000] BIOS-e820: [mem 0x0000000100000000-0x000000107fffffff] usable
[    0.000000] NX (Execute Disable) protection: active
[    0.000000] APIC: Static calls initialized
[    0.000000] efi: EFI v2.7 by Lenovo
[    0.000000] efi: ACPI=3D0x63ffe000 ACPI 2.0=3D0x63ffe014 SMBIOS=3D0x5ee3=
7000 SMBIOS 3.0=3D0x5ee2a000 TPMFinalLog=3D0x63f06000 MEMATTR=3D0x5353a018 =
ESRT=3D0x54846098 RNG=3D0x63ffcf18 INITRD=3D0x530b8598 TPMEventLog=3D0x63ff=
8018=20
[    0.000000] random: crng init done
[    0.000000] efi: Remove mem461: MMIO range=3D[0xc0000000-0xcfffffff] (25=
6MB) from e820 map
[    0.000000] e820: remove [mem 0xc0000000-0xcfffffff] reserved
[    0.000000] SMBIOS 3.8.0 present.
[    0.000000] DMI: LENOVO 21Q8CTO1WW/21Q8CTO1WW, BIOS N4EET19W (1.05 ) 09/=
12/2025
[    0.000000] DMI: Memory slots populated: 8/8
[    0.000000] tsc: Detected 3700.000 MHz processor
[    0.000000] tsc: Detected 3686.400 MHz TSC
[    0.000006] e820: update [mem 0x00000000-0x00000fff] usable =3D=3D> rese=
rved
[    0.000007] e820: remove [mem 0x000a0000-0x000fffff] usable
[    0.000010] last_pfn =3D 0x1080000 max_arch_pfn =3D 0x400000000
[    0.000013] MTRR map: 8 entries (3 fixed + 5 variable; max 23), built fr=
om 10 variable MTRRs
[    0.000014] x86/PAT: Configuration [0-7]: WB  WC  UC- UC  WB  WP  UC- WT=
 =20
[    0.000345] x2apic: enabled by BIOS, switching to x2apic ops
[    0.000346] last_pfn =3D 0x64000 max_arch_pfn =3D 0x400000000
[    0.003740] esrt: Reserving ESRT space from 0x0000000054846098 to 0x0000=
0000548461c0.
[    0.003747] e820: update [mem 0x54846000-0x54846fff] usable =3D=3D> rese=
rved
[    0.003767] Using GB pages for direct mapping
[    0.021626] printk: log buffer data + meta data: 33554432 + 117440512 =
=3D 150994944 bytes
[    0.021627] printk: early log buf free: 128072(97%)
[    0.021628] Secure boot enabled
[    0.021628] RAMDISK: [mem 0x3df16000-0x4624cfff]
[    0.021738] ACPI: Early table checksum verification disabled
[    0.021741] ACPI: RSDP 0x0000000063FFE014 000024 (v02 LENOVO)
[    0.021744] ACPI: XSDT 0x0000000063FFD228 0001A4 (v01 LENOVO TP-N4E   00=
010050 PTEC 00000002)
[    0.021748] ACPI: FACP 0x000000005ED4B000 000114 (v06 LENOVO TP-N4E   00=
010050 PTEC 00000002)
[    0.021751] ACPI: DSDT 0x000000005ECCD000 07A046 (v02 LENOVO ICL      00=
000002      01000013)
[    0.021752] ACPI: FACS 0x0000000063EE3000 000040
[    0.021753] ACPI: SSDT 0x000000005EE4C000 00012E (v02 LENOVO TxtSsdt  00=
001000 INTL 20210930)
[    0.021754] ACPI: SSDT 0x000000005EE4B000 00038C (v02 LENOVO Pmax_Dev 00=
000001 INTL 20210930)
[    0.021755] ACPI: SSDT 0x000000005EE4A000 000770 (v02 LENOVO Cpu0Ist  00=
003000 INTL 20210930)
[    0.021756] ACPI: SSDT 0x000000005EE49000 0005FB (v02 LENOVO Cpu0Hwp  00=
003000 INTL 20210930)
[    0.021757] ACPI: SSDT 0x000000005EE48000 0001AB (v02 LENOVO Cpu0Psd  00=
003000 INTL 20210930)
[    0.021758] ACPI: SSDT 0x000000005EE47000 000394 (v02 LENOVO Cpu0Cst  00=
003001 INTL 20210930)
[    0.021760] ACPI: SSDT 0x000000005EE45000 001BAF (v02 LENOVO ApIst    00=
003000 INTL 20210930)
[    0.021761] ACPI: SSDT 0x000000005EE43000 001620 (v02 LENOVO ApHwp    00=
003000 INTL 20210930)
[    0.021762] ACPI: SSDT 0x000000005EE41000 001349 (v02 LENOVO ApPsd    00=
003000 INTL 20210930)
[    0.021763] ACPI: SSDT 0x000000005EE40000 000FBB (v02 LENOVO ApCst    00=
003000 INTL 20210930)
[    0.021764] ACPI: SSDT 0x000000005EE3C000 003BC8 (v02 LENOVO CpuSsdt  00=
003000 INTL 20210930)
[    0.021765] ACPI: SSDT 0x000000005EE3B000 00059B (v02 LENOVO CtdpB    00=
001000 INTL 20210930)
[    0.021766] ACPI: DTPR 0x000000005EE38000 000088 (v01 LENOVO TP-N4E   00=
010050 PTEC 00000002)
[    0.021767] ACPI: SSDT 0x000000005EDA2000 0012A6 (v02 LENOVO PDatTabl 00=
001000 INTL 20210930)
[    0.021768] ACPI: SSDT 0x000000005ED5C000 000DD8 (v02 LENOVO DTbtSsdt 00=
001000 INTL 20210930)
[    0.021769] ACPI: SSDT 0x000000005ED5B000 00060E (v02 LENOVO Tpm2Tabl 00=
001000 INTL 20210930)
[    0.021770] ACPI: TPM2 0x000000005ED5A000 00004C (v04 LENOVO TP-N4E   00=
010050 PTEC 00000002)
[    0.021771] ACPI: SSDT 0x000000005ED57000 0026FB (v02 LENOVO IgfxSsdt 00=
003000 INTL 20210930)
[    0.021772] ACPI: SSDT 0x000000005ED4D000 009D1E (v02 LENOVO TcssSsdt 00=
001000 INTL 20210930)
[    0.021773] ACPI: ECDT 0x000000005ED4C000 000053 (v01 LENOVO TP-N4E   00=
010050 PTEC 00000002)
[    0.021774] ACPI: HPET 0x000000005ED4A000 000038 (v01 LENOVO TP-N4E   00=
010050 PTEC 00000002)
[    0.021775] ACPI: APIC 0x000000005ED49000 000358 (v05 LENOVO TP-N4E   00=
010050 PTEC 00000002)
[    0.021776] ACPI: MCFG 0x000000005ED48000 00003C (v01 LENOVO TP-N4E   00=
010050 PTEC 00000002)
[    0.021778] ACPI: SSDT 0x000000005ECC7000 005699 (v02 LENOVO ArlH_1BR 00=
001000 INTL 20210930)
[    0.021779] ACPI: SSDT 0x000000005ECC6000 0000F2 (v02 LENOVO PID0Ssdt 00=
000010 INTL 20210930)
[    0.021780] ACPI: SSDT 0x000000005ECC4000 00125C (v02 LENOVO ProjSsdt 00=
000010 INTL 20210930)
[    0.021781] ACPI: SSDT 0x000000005ECBF000 004354 (v02 LENOVO DptfTabl 00=
001000 INTL 20210930)
[    0.021782] ACPI: LPIT 0x000000005ECAB000 0000CC (v01 LENOVO TP-N4E   00=
010050 PTEC 00000002)
[    0.021783] ACPI: WSMT 0x000000005ECAA000 000028 (v01 LENOVO TP-N4E   00=
010050 PTEC 00000002)
[    0.021784] ACPI: SSDT 0x000000005ECA2000 007543 (v02 LENOVO TbtTypeC 00=
000000 INTL 20210930)
[    0.021785] ACPI: DBGP 0x000000005ECA1000 000034 (v01 LENOVO TP-N4E   00=
010050 PTEC 00000002)
[    0.021786] ACPI: DBG2 0x000000005ECA0000 000054 (v00 LENOVO TP-N4E   00=
010050 PTEC 00000002)
[    0.021787] ACPI: NHLT 0x000000005EC9F000 000960 (v00 LENOVO TP-N4E   00=
010050 PTEC 00000002)
[    0.021788] ACPI: POAT 0x000000005EC9E000 000055 (v03 LENOVO TP-N4E   00=
010050 PTEC 00000002)
[    0.021789] ACPI: SSDT 0x000000005EC88000 001016 (v02 LENOVO UsbCTabl 00=
001000 INTL 20210930)
[    0.021790] ACPI: BATB 0x000000005EE35000 00004A (v02 LENOVO TP-N4E   00=
010050 PTEC 00000002)
[    0.021792] ACPI: DMAR 0x000000005EE34000 000098 (v01 LENOVO TP-N4E   00=
010050 PTEC 00000002)
[    0.021793] ACPI: SSDT 0x000000005EE31000 00279D (v02 LENOVO NvOptTbl 00=
001000 INTL 20210930)
[    0.021794] ACPI: FPDT 0x000000005EE30000 000044 (v01 LENOVO TP-N4E   00=
010050 PTEC 00000002)
[    0.021795] ACPI: SSDT 0x000000005EE2F000 00012E (v02 LENOVO TxtSsdt  00=
001000 INTL 20210930)
[    0.021796] ACPI: SSDT 0x000000005EE2D000 0018C6 (v02 LENOVO SocGpe   00=
003000 INTL 20210930)
[    0.021797] ACPI: SSDT 0x000000005EE27000 0028D3 (v02 LENOVO SocCmn   00=
003000 INTL 20210930)
[    0.021798] ACPI: SDEV 0x000000005EE2C000 0000BC (v01 LENOVO TP-N4E   00=
010050 PTEC 00000002)
[    0.021799] ACPI: ASF! 0x000000005EE2B000 0000A0 (v32 LENOVO TP-N4E   00=
010050 PTEC 00000002)
[    0.021800] ACPI: PHAT 0x000000005EE26000 00076C (v01 LENOVO TP-N4E   00=
010050 PTEC 00000002)
[    0.021801] ACPI: BGRT 0x000000005EE25000 000038 (v01 LENOVO TP-N4E   00=
010050 PTEC 00000002)
[    0.021802] ACPI: UEFI 0x0000000062E75000 000076 (v01 LENOVO TP-N4E   00=
010050 PTEC 00000002)
[    0.021803] ACPI: Reserving FACP table memory at [mem 0x5ed4b000-0x5ed4b=
113]
[    0.021804] ACPI: Reserving DSDT table memory at [mem 0x5eccd000-0x5ed47=
045]
[    0.021804] ACPI: Reserving FACS table memory at [mem 0x63ee3000-0x63ee3=
03f]
[    0.021804] ACPI: Reserving SSDT table memory at [mem 0x5ee4c000-0x5ee4c=
12d]
[    0.021805] ACPI: Reserving SSDT table memory at [mem 0x5ee4b000-0x5ee4b=
38b]
[    0.021805] ACPI: Reserving SSDT table memory at [mem 0x5ee4a000-0x5ee4a=
76f]
[    0.021805] ACPI: Reserving SSDT table memory at [mem 0x5ee49000-0x5ee49=
5fa]
[    0.021805] ACPI: Reserving SSDT table memory at [mem 0x5ee48000-0x5ee48=
1aa]
[    0.021806] ACPI: Reserving SSDT table memory at [mem 0x5ee47000-0x5ee47=
393]
[    0.021806] ACPI: Reserving SSDT table memory at [mem 0x5ee45000-0x5ee46=
bae]
[    0.021806] ACPI: Reserving SSDT table memory at [mem 0x5ee43000-0x5ee44=
61f]
[    0.021806] ACPI: Reserving SSDT table memory at [mem 0x5ee41000-0x5ee42=
348]
[    0.021806] ACPI: Reserving SSDT table memory at [mem 0x5ee40000-0x5ee40=
fba]
[    0.021807] ACPI: Reserving SSDT table memory at [mem 0x5ee3c000-0x5ee3f=
bc7]
[    0.021807] ACPI: Reserving SSDT table memory at [mem 0x5ee3b000-0x5ee3b=
59a]
[    0.021807] ACPI: Reserving DTPR table memory at [mem 0x5ee38000-0x5ee38=
087]
[    0.021807] ACPI: Reserving SSDT table memory at [mem 0x5eda2000-0x5eda3=
2a5]
[    0.021808] ACPI: Reserving SSDT table memory at [mem 0x5ed5c000-0x5ed5c=
dd7]
[    0.021808] ACPI: Reserving SSDT table memory at [mem 0x5ed5b000-0x5ed5b=
60d]
[    0.021808] ACPI: Reserving TPM2 table memory at [mem 0x5ed5a000-0x5ed5a=
04b]
[    0.021808] ACPI: Reserving SSDT table memory at [mem 0x5ed57000-0x5ed59=
6fa]
[    0.021809] ACPI: Reserving SSDT table memory at [mem 0x5ed4d000-0x5ed56=
d1d]
[    0.021809] ACPI: Reserving ECDT table memory at [mem 0x5ed4c000-0x5ed4c=
052]
[    0.021809] ACPI: Reserving HPET table memory at [mem 0x5ed4a000-0x5ed4a=
037]
[    0.021809] ACPI: Reserving APIC table memory at [mem 0x5ed49000-0x5ed49=
357]
[    0.021809] ACPI: Reserving MCFG table memory at [mem 0x5ed48000-0x5ed48=
03b]
[    0.021810] ACPI: Reserving SSDT table memory at [mem 0x5ecc7000-0x5eccc=
698]
[    0.021810] ACPI: Reserving SSDT table memory at [mem 0x5ecc6000-0x5ecc6=
0f1]
[    0.021810] ACPI: Reserving SSDT table memory at [mem 0x5ecc4000-0x5ecc5=
25b]
[    0.021810] ACPI: Reserving SSDT table memory at [mem 0x5ecbf000-0x5ecc3=
353]
[    0.021811] ACPI: Reserving LPIT table memory at [mem 0x5ecab000-0x5ecab=
0cb]
[    0.021811] ACPI: Reserving WSMT table memory at [mem 0x5ecaa000-0x5ecaa=
027]
[    0.021811] ACPI: Reserving SSDT table memory at [mem 0x5eca2000-0x5eca9=
542]
[    0.021811] ACPI: Reserving DBGP table memory at [mem 0x5eca1000-0x5eca1=
033]
[    0.021812] ACPI: Reserving DBG2 table memory at [mem 0x5eca0000-0x5eca0=
053]
[    0.021812] ACPI: Reserving NHLT table memory at [mem 0x5ec9f000-0x5ec9f=
95f]
[    0.021812] ACPI: Reserving POAT table memory at [mem 0x5ec9e000-0x5ec9e=
054]
[    0.021812] ACPI: Reserving SSDT table memory at [mem 0x5ec88000-0x5ec89=
015]
[    0.021813] ACPI: Reserving BATB table memory at [mem 0x5ee35000-0x5ee35=
049]
[    0.021813] ACPI: Reserving DMAR table memory at [mem 0x5ee34000-0x5ee34=
097]
[    0.021813] ACPI: Reserving SSDT table memory at [mem 0x5ee31000-0x5ee33=
79c]
[    0.021813] ACPI: Reserving FPDT table memory at [mem 0x5ee30000-0x5ee30=
043]
[    0.021814] ACPI: Reserving SSDT table memory at [mem 0x5ee2f000-0x5ee2f=
12d]
[    0.021814] ACPI: Reserving SSDT table memory at [mem 0x5ee2d000-0x5ee2e=
8c5]
[    0.021814] ACPI: Reserving SSDT table memory at [mem 0x5ee27000-0x5ee29=
8d2]
[    0.021814] ACPI: Reserving SDEV table memory at [mem 0x5ee2c000-0x5ee2c=
0bb]
[    0.021815] ACPI: Reserving ASF! table memory at [mem 0x5ee2b000-0x5ee2b=
09f]
[    0.021815] ACPI: Reserving PHAT table memory at [mem 0x5ee26000-0x5ee26=
76b]
[    0.021815] ACPI: Reserving BGRT table memory at [mem 0x5ee25000-0x5ee25=
037]
[    0.021816] ACPI: Reserving UEFI table memory at [mem 0x62e75000-0x62e75=
075]
[    0.021851] APIC: Switched APIC routing to: cluster x2apic
[    0.022050] No NUMA configuration found
[    0.022050] Faking a node at [mem 0x0000000000000000-0x000000107fffffff]
[    0.022053] NODE_DATA(0) allocated [mem 0x1076fd52c0-0x1076ffffff]
[    0.022169] Zone ranges:
[    0.022170]   DMA      [mem 0x0000000000001000-0x0000000000ffffff]
[    0.022171]   DMA32    [mem 0x0000000001000000-0x00000000ffffffff]
[    0.022171]   Normal   [mem 0x0000000100000000-0x000000107fffffff]
[    0.022172]   Device   empty
[    0.022172] Movable zone start for each node
[    0.022173] Early memory node ranges
[    0.022173]   node   0: [mem 0x0000000000001000-0x000000000009ffff]
[    0.022174]   node   0: [mem 0x0000000000100000-0x000000005b52efff]
[    0.022174]   node   0: [mem 0x0000000063fff000-0x0000000063ffffff]
[    0.022175]   node   0: [mem 0x0000000100000000-0x000000107fffffff]
[    0.022177] Initmem setup node 0 [mem 0x0000000000001000-0x000000107ffff=
fff]
[    0.022180] On node 0, zone DMA: 1 pages in unavailable ranges
[    0.022197] On node 0, zone DMA: 96 pages in unavailable ranges
[    0.023925] On node 0, zone DMA32: 35536 pages in unavailable ranges
[    0.092608] On node 0, zone Normal: 16384 pages in unavailable ranges
[    0.093215] ACPI: PM-Timer IO Port: 0x1808
[    0.093220] ACPI: X2APIC_NMI (uid[0xffffffff] high level lint[0x1])
[    0.093253] IOAPIC[0]: apic_id 2, version 32, address 0xfec00000, GSI 0-=
119
[    0.093254] ACPI: INT_SRC_OVR (bus 0 bus_irq 0 global_irq 2 dfl dfl)
[    0.093256] ACPI: INT_SRC_OVR (bus 0 bus_irq 9 global_irq 9 high level)
[    0.093258] ACPI: Using ACPI (MADT) for SMP configuration information
[    0.093259] ACPI: HPET id: 0x8086a201 base: 0xfed00000
[    0.093268] e820: update [mem 0x4f533000-0x4f773fff] usable =3D=3D> rese=
rved
[    0.093273] TSC deadline timer available
[    0.093275] CPU topo: Max. logical packages:   1
[    0.093275] CPU topo: Max. logical dies:       1
[    0.093275] CPU topo: Max. dies per package:   1
[    0.093277] CPU topo: Max. threads per core:   1
[    0.093278] CPU topo: Num. cores per package:    16
[    0.093278] CPU topo: Num. threads per package:  16
[    0.093278] CPU topo: Allowing 16 present CPUs plus 0 hotplug CPUs
[    0.093285] PM: hibernation: Registered nosave memory: [mem 0x00000000-0=
x00000fff]
[    0.093285] PM: hibernation: Registered nosave memory: [mem 0x000a0000-0=
x000fffff]
[    0.093286] PM: hibernation: Registered nosave memory: [mem 0x4f533000-0=
x4f773fff]
[    0.093287] PM: hibernation: Registered nosave memory: [mem 0x54846000-0=
x54846fff]
[    0.093287] PM: hibernation: Registered nosave memory: [mem 0x5b52f000-0=
x63ffefff]
[    0.093288] PM: hibernation: Registered nosave memory: [mem 0x64000000-0=
xffffffff]
[    0.093288] [mem 0x78800000-0xfed1ffff] available for PCI devices
[    0.093289] Booting paravirtualized kernel on bare hardware
[    0.093291] clocksource: refined-jiffies: mask: 0xffffffff max_cycles: 0=
xffffffff, max_idle_ns: 1910969940391419 ns
[    0.096771] setup_percpu: NR_CPUS:8192 nr_cpumask_bits:16 nr_cpu_ids:16 =
nr_node_ids:1
[    0.097151] percpu: Embedded 62 pages/cpu s217088 r8192 d28672 u262144
[    0.097153] pcpu-alloc: s217088 r8192 d28672 u262144 alloc=3D1*2097152
[    0.097154] pcpu-alloc: [0] 00 01 02 03 04 05 06 07 [0] 08 09 10 11 12 1=
3 14 15=20
[    0.097163] Kernel command line: systemd.unified_cgroup_hierarchy=3D1 ke=
rnel.unprivileged_userns_clone=3D1 thunderbolt.dyndbg=3D+p drm.debug=3D0x10=
e log_buf_len=3D32M rd.luks.uuid=3D"3fcd7043-2e72-42fb-84ef-a42a377fbebd" r=
d.luks.options=3Ddiscard,no-read-workqueue,no-write-workqueue,timeout=3D0 r=
oot=3DUUID=3D"4c822bc7-e8c9-4eaa-a480-99294e826ed1" rootflags=3Dx-systemd.d=
evice-timeout=3D0 rw
[    0.101674] Dentry cache hash table entries: 8388608 (order: 14, 6710886=
4 bytes, linear)
[    0.103884] Inode-cache hash table entries: 4194304 (order: 13, 33554432=
 bytes, linear)
[    0.103986] software IO TLB: area num 16.
[    0.112916] Fallback order for Node 0: 0=20
[    0.112919] Built 1 zonelists, mobility grouping on.  Total pages: 16626=
895
[    0.112920] Policy zone: Normal
[    0.113092] mem auto-init: stack:all(zero), heap alloc:on, heap free:off
[    0.189829] SLUB: HWalign=3D64, Order=3D0-3, MinObjects=3D0, CPUs=3D16, =
Nodes=3D1
[    0.197213] ftrace: allocating 56529 entries in 224 pages
[    0.197214] ftrace: allocated 224 pages with 3 groups
[    0.197282] Dynamic Preempt: full
[    0.197328] rcu: Preemptible hierarchical RCU implementation.
[    0.197328] rcu: 	RCU restricting CPUs from NR_CPUS=3D8192 to nr_cpu_ids=
=3D16.
[    0.197329] rcu: 	RCU priority boosting: priority 1 delay 500 ms.
[    0.197330] 	Trampoline variant of Tasks RCU enabled.
[    0.197330] 	Rude variant of Tasks RCU enabled.
[    0.197330] 	Tracing variant of Tasks RCU enabled.
[    0.197331] rcu: RCU calculated value of scheduler-enlistment delay is 1=
00 jiffies.
[    0.197331] rcu: Adjusting geometry for rcu_fanout_leaf=3D16, nr_cpu_ids=
=3D16
[    0.197338] RCU Tasks: Setting shift to 4 and lim to 1 rcu_task_cb_adjus=
t=3D1 rcu_task_cpu_ids=3D16.
[    0.197339] RCU Tasks Rude: Setting shift to 4 and lim to 1 rcu_task_cb_=
adjust=3D1 rcu_task_cpu_ids=3D16.
[    0.197340] RCU Tasks Trace: Setting shift to 4 and lim to 1 rcu_task_cb=
_adjust=3D1 rcu_task_cpu_ids=3D16.
[    0.199580] NR_IRQS: 524544, nr_irqs: 2184, preallocated irqs: 16
[    0.199858] rcu: srcu_init: Setting srcu_struct sizes based on contentio=
n.
[    0.200105] kfence: initialized - using 2097152 bytes for 255 objects at=
 0x(____ptrval____)-0x(____ptrval____)
[    0.200133] Console: colour dummy device 80x25
[    0.200135] printk: legacy console [tty0] enabled
[    0.200164] ACPI: Core revision 20250404
[    0.200464] hpet: HPET dysfunctional in PC10. Force disabled.
[    0.200556] APIC: Switch to symmetric I/O mode setup
[    0.200557] DMAR: Host address width 42
[    0.200558] DMAR: DRHD base: 0x000000fc800000 flags: 0x0
[    0.200565] DMAR: dmar0: reg_base_addr fc800000 ver 7:0 cap c9de008cee69=
0462 ecap 12ca9a00f0ef5e
[    0.200567] DMAR: DRHD base: 0x000000fc801000 flags: 0x1
[    0.200570] DMAR: dmar1: reg_base_addr fc801000 ver 7:0 cap c9de008cee69=
0462 ecap 12ca9a00f0efde
[    0.200572] DMAR: SATC flags: 0x1
[    0.200573] DMAR-IR: IOAPIC id 2 under DRHD base  0xfc801000 IOMMU 1
[    0.200574] DMAR-IR: HPET id 0 under DRHD base 0xfc801000
[    0.200574] DMAR-IR: Queued invalidation will be enabled to support x2ap=
ic and Intr-remapping.
[    0.202128] DMAR-IR: Enabled IRQ remapping in x2apic mode
[    0.206032] clocksource: tsc-early: mask: 0xffffffffffffffff max_cycles:=
 0x6a464ae9873, max_idle_ns: 881590529744 ns
[    0.206037] Calibrating delay loop (skipped), value calculated using tim=
er frequency.. 7372.80 BogoMIPS (lpj=3D3686400)
[    0.206086] CPU0: Thermal monitoring enabled (TM1)
[    0.206088] x86/cpu: User Mode Instruction Prevention (UMIP) activated
[    0.206253] CET detected: Indirect Branch Tracking enabled
[    0.206254] Last level iTLB entries: 4KB 0, 2MB 0, 4MB 0
[    0.206254] Last level dTLB entries: 4KB 0, 2MB 0, 4MB 0, 1GB 0
[    0.206256] process: using mwait in idle threads
[    0.206258] mitigations: Enabled attack vectors: user_kernel, user_user,=
 guest_host, guest_guest, SMT mitigations: auto
[    0.206261] Speculative Store Bypass: Mitigation: Speculative Store Bypa=
ss disabled via prctl
[    0.206262] Spectre V2 : Mitigation: Enhanced / Automatic IBRS
[    0.206262] VMSCAPE: Mitigation: IBPB before exit to userspace
[    0.206263] Spectre V1 : Mitigation: usercopy/swapgs barriers and __user=
 pointer sanitization
[    0.206264] Spectre V2 : mitigation: Enabling conditional Indirect Branc=
h Prediction Barrier
[    0.206271] x86/fpu: Supporting XSAVE feature 0x001: 'x87 floating point=
 registers'
[    0.206272] x86/fpu: Supporting XSAVE feature 0x002: 'SSE registers'
[    0.206272] x86/fpu: Supporting XSAVE feature 0x004: 'AVX registers'
[    0.206272] x86/fpu: Supporting XSAVE feature 0x200: 'Protection Keys Us=
er registers'
[    0.206273] x86/fpu: Supporting XSAVE feature 0x800: 'Control-flow User =
registers'
[    0.206273] x86/fpu: Supporting XSAVE feature 0x1000: 'Control-flow Kern=
el registers (KVM only)'
[    0.206274] x86/fpu: xstate_offset[2]:  576, xstate_sizes[2]:  256
[    0.206274] x86/fpu: xstate_offset[9]:  832, xstate_sizes[9]:    8
[    0.206275] x86/fpu: xstate_offset[11]:  840, xstate_sizes[11]:   16
[    0.206275] x86/fpu: xstate_offset[12]:  856, xstate_sizes[12]:   24
[    0.206275] x86/fpu: Enabled xstate features 0x1a07, context size is 880=
 bytes, using 'compacted' format.
[    0.207035] Freeing SMP alternatives memory: 56K
[    0.207035] pid_max: default: 32768 minimum: 301
[    0.207035] LSM: initializing lsm=3Dcapability,landlock,lockdown,yama,bpf
[    0.207035] landlock: Up and running.
[    0.207035] Yama: becoming mindful.
[    0.207035] LSM support for eBPF active
[    0.207035] Mount-cache hash table entries: 131072 (order: 8, 1048576 by=
tes, linear)
[    0.207035] Mountpoint-cache hash table entries: 131072 (order: 8, 10485=
76 bytes, linear)
[    0.207035] smpboot: CPU0: Intel(R) Core(TM) Ultra 9 285H (family: 0x6, =
model: 0xc5, stepping: 0x2)
[    0.207035] Performance Events: XSAVE Architectural LBR, PEBS fmt5+-base=
line,  AnyThread deprecated, ArrowLake-H Hybrid events, 32-deep LBR, full-w=
idth counters, Intel PMU driver.
[    0.207035] core: cpu_core PMU driver:=20
[    0.207035] ... version:                5
[    0.207035] ... bit width:              48
[    0.207035] ... generic registers:      10
[    0.207035] ... value mask:             0000ffffffffffff
[    0.207035] ... max period:             00007fffffffffff
[    0.207035] ... fixed-purpose events:   4
[    0.207035] ... event mask:             0001000f000003ff
[    0.207035] signal: max sigframe size: 3632
[    0.207035] Estimated ratio of average max frequency by base frequency (=
times 1024): 1411
[    0.207035] rcu: Hierarchical SRCU implementation.
[    0.207035] rcu: 	Max phase no-delay instances is 400.
[    0.207035] Timer migration: 2 hierarchy levels; 8 children per group; 2=
 crossnode level
[    0.207035] NMI watchdog: Enabled. Permanently consumes one hw-PMU count=
er.
[    0.207068] smp: Bringing up secondary CPUs ...
[    0.207114] smpboot: x86: Booting SMP configuration:
[    0.207114] .... node  #0, CPUs:        #1  #2  #3  #4  #5  #6  #7  #8  =
#9 #10 #11 #12 #13 #14 #15
[    0.007013] core: cpu_atom PMU driver:=20
[    0.007013] ... version:                5
[    0.007013] ... bit width:              48
[    0.007013] ... generic registers:      8
[    0.007013] ... value mask:             0000ffffffffffff
[    0.007013] ... max period:             00007fffffffffff
[    0.007013] ... fixed-purpose events:   6
[    0.007013] ... event mask:             00000077000000ff
[    0.007013] core: cpu_lowpower PMU driver:=20
[    0.007013] ... version:                5
[    0.007013] ... bit width:              48
[    0.007013] ... generic registers:      8
[    0.007013] ... value mask:             0000ffffffffffff
[    0.007013] ... max period:             00007fffffffffff
[    0.007013] ... fixed-purpose events:   3
[    0.007013] ... event mask:             00000007000000ff
[    0.214198] smp: Brought up 1 node, 16 CPUs
[    0.214198] smpboot: Total of 16 processors activated (117964.80 BogoMIP=
S)
[    0.215151] Memory: 64924556K/66507580K available (20061K kernel code, 2=
946K rwdata, 16220K rodata, 4692K init, 4880K bss, 1553840K reserved, 0K cm=
a-reserved)
[    0.216674] devtmpfs: initialized
[    0.216674] x86/mm: Memory block size: 2048MB
[    0.217211] ACPI: PM: Registering ACPI NVS region [mem 0x62a2f000-0x63f2=
efff] (22020096 bytes)
[    0.217211] clocksource: jiffies: mask: 0xffffffff max_cycles: 0xfffffff=
f, max_idle_ns: 1911260446275000 ns
[    0.217211] posixtimers hash table entries: 8192 (order: 5, 131072 bytes=
, linear)
[    0.217211] futex hash table entries: 4096 (262144 bytes on 1 NUMA nodes=
, total 256 KiB, linear).
[    0.217211] pinctrl core: initialized pinctrl subsystem
[    0.217310] PM: RTC time: 10:44:01, date: 2025-11-03
[    0.218045] NET: Registered PF_NETLINK/PF_ROUTE protocol family
[    0.218463] DMA: preallocated 4096 KiB GFP_KERNEL pool for atomic alloca=
tions
[    0.218781] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA pool for atomi=
c allocations
[    0.219105] DMA: preallocated 4096 KiB GFP_KERNEL|GFP_DMA32 pool for ato=
mic allocations
[    0.219109] audit: initializing netlink subsys (disabled)
[    0.219129] audit: type=3D2000 audit(1762166641.013:1): state=3Dinitiali=
zed audit_enabled=3D0 res=3D1
[    0.219188] thermal_sys: Registered thermal governor 'fair_share'
[    0.219188] thermal_sys: Registered thermal governor 'bang_bang'
[    0.219189] thermal_sys: Registered thermal governor 'step_wise'
[    0.219190] thermal_sys: Registered thermal governor 'user_space'
[    0.219190] thermal_sys: Registered thermal governor 'power_allocator'
[    0.219199] cpuidle: using governor ladder
[    0.219201] cpuidle: using governor menu
[    0.219129] acpiphp: ACPI Hot Plug PCI Controller Driver version: 0.5
[    0.219445] PCI: ECAM [mem 0xc0000000-0xcfffffff] (base 0xc0000000) for =
domain 0000 [bus 00-ff]
[    0.219459] PCI: Using configuration type 1 for base access
[    0.219522] kprobes: kprobe jump-optimization is enabled. All kprobes ar=
e optimized if possible.
[    0.219522] HugeTLB: registered 1.00 GiB page size, pre-allocated 0 pages
[    0.219522] HugeTLB: 16380 KiB vmemmap can be freed for a 1.00 GiB page
[    0.219522] HugeTLB: registered 2.00 MiB page size, pre-allocated 0 pages
[    0.219522] HugeTLB: 28 KiB vmemmap can be freed for a 2.00 MiB page
[    0.220725] raid6: skipped pq benchmark and selected avx2x4
[    0.220728] raid6: using avx2x2 recovery algorithm
[    0.220778] ACPI: Added _OSI(Module Device)
[    0.220778] ACPI: Added _OSI(Processor Device)
[    0.220778] ACPI: Added _OSI(Processor Aggregator Device)
[    0.347323] ACPI: 27 ACPI AML tables successfully acquired and loaded
[    0.349131] ACPI: EC: EC started
[    0.349132] ACPI: EC: interrupt blocked
[    0.349994] ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
[    0.349995] ACPI: EC: Boot ECDT EC used to handle transactions
[    0.352240] ACPI: [Firmware Bug]: BIOS _OSI(Linux) query ignored
[    0.474768] ACPI: USB4 _OSC: OS supports USB3+ DisplayPort+ PCIe+ XDomai=
n+
[    0.474770] ACPI: USB4 _OSC: OS controls USB3+ DisplayPort+ PCIe+ XDomai=
n+
[    0.478200] ACPI: Interpreter enabled
[    0.478266] ACPI: PM: (supports S0 S4 S5)
[    0.478267] ACPI: Using IOAPIC for interrupt routing
[    0.479998] PCI: Using host bridge windows from ACPI; if necessary, use =
"pci=3Dnocrs" and report a bug
[    0.479999] PCI: Ignoring E820 reservations for host bridge windows
[    0.480682] ACPI: Enabled 16 GPEs in block 00 to 7F
[    0.480702] ACPI: Enabled 8 GPEs in block 80 to DF
[    0.483180] ACPI: \_SB_.PC00.LPCB.EC__.PUBS: New power resource
[    0.486038] ACPI: \_SB_.PC00.XHCI.RHUB.HS08.WWPR: New power resource
[    0.486462] ACPI: \_SB_.PC00.XHCI.RHUB.HS10.BTRT: New power resource
[    0.486587] ACPI: \_SB_.PC00.XHCI.RHUB.HS10.DBTR: New power resource
[    0.498716] ACPI: \_SB_.PC00.CNVW.WRST: New power resource
[    0.504296] ACPI: \_SB_.PC00.RP07.PXP_: New power resource
[    0.508638] ACPI: \_SB_.PC00.RP10.PXP_: New power resource
[    0.510761] ACPI: \_SB_.PC00.RP11.PXP_: New power resource
[    0.525860] ACPI: \_SB_.PC00.RP12.PG00: New power resource
[    0.547042] ACPI: \_SB_.PC00.TBT0: New power resource
[    0.547174] ACPI: \_SB_.PC00.TBT1: New power resource
[    0.547303] ACPI: \_SB_.PC00.D3C_: New power resource
[    0.574451] ACPI: \PIN_: New power resource
[    0.574467] ACPI: \PINP: New power resource
[    0.575002] ACPI: PCI Root Bridge [PC00] (domain 0000 [bus 00-fe])
[    0.575009] acpi PNP0A08:00: _OSC: OS supports [ExtendedConfig ASPM Cloc=
kPM Segments MSI EDR HPX-Type3]
[    0.576812] acpi PNP0A08:00: _OSC: OS now controls [PCIeHotplug SHPCHotp=
lug PME AER PCIeCapability LTR DPC]
[    0.580397] PCI host bridge to bus 0000:00
[    0.580401] pci_bus 0000:00: root bus resource [io  0x0000-0x0cf7 window]
[    0.580403] pci_bus 0000:00: root bus resource [io  0x0d00-0xffff window]
[    0.580405] pci_bus 0000:00: root bus resource [mem 0x000a0000-0x000bfff=
f window]
[    0.580406] pci_bus 0000:00: root bus resource [mem 0x80000000-0xbffffff=
f window]
[    0.580407] pci_bus 0000:00: root bus resource [mem 0x4000000000-0x3ffbf=
ffffff window]
[    0.580408] pci_bus 0000:00: root bus resource [bus 00-fe]
[    0.581658] pci 0000:00:00.0: [8086:7d06] type 00 class 0x060000 convent=
ional PCI endpoint
[    0.581802] pci 0000:00:01.0: [8086:7ecc] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.581822] pci 0000:00:01.0: PCI bridge to [bus 01]
[    0.581825] pci 0000:00:01.0:   bridge window [io  0x3000-0x3fff]
[    0.581828] pci 0000:00:01.0:   bridge window [mem 0x88000000-0x8bffffff]
[    0.581835] pci 0000:00:01.0:   bridge window [mem 0x4000000000-0x4201ff=
ffff 64bit pref]
[    0.581899] pci 0000:00:01.0: PME# supported from D0 D3hot D3cold
[    0.581937] pci 0000:00:01.0: PTM enabled (root), 4ns granularity
[    0.583128] pci 0000:00:02.0: [8086:7d51] type 00 class 0x030000 PCIe Ro=
ot Complex Integrated Endpoint
[    0.583155] pci 0000:00:02.0: BAR 0 [mem 0x5248000000-0x5248ffffff 64bit=
 pref]
[    0.583158] pci 0000:00:02.0: BAR 2 [mem 0x4210000000-0x421fffffff 64bit=
 pref]
[    0.583178] pci 0000:00:02.0: DMAR: Skip IOMMU disabling for graphics
[    0.583181] pci 0000:00:02.0: Video device with shadowed ROM at [mem 0x0=
00c0000-0x000dffff]
[    0.583217] pci 0000:00:02.0: PME# supported from D0 D3hot
[    0.583243] pci 0000:00:02.0: VF BAR 0 [mem 0x00000000-0x00ffffff 64bit =
pref]
[    0.583244] pci 0000:00:02.0: VF BAR 0 [mem 0x00000000-0x06ffffff 64bit =
pref]: contains BAR 0 for 7 VFs
[    0.583432] pci 0000:00:04.0: [8086:7d03] type 00 class 0x118000 convent=
ional PCI endpoint
[    0.583468] pci 0000:00:04.0: BAR 0 [mem 0x5249c80000-0x5249c9ffff 64bit]
[    0.583886] pci 0000:00:06.0: [8086:774d] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.583910] pci 0000:00:06.0: PCI bridge to [bus 04]
[    0.583918] pci 0000:00:06.0:   bridge window [mem 0x98c00000-0x98cfffff]
[    0.584004] pci 0000:00:06.0: PME# supported from D0 D3hot D3cold
[    0.584051] pci 0000:00:06.0: PTM enabled (root), 4ns granularity
[    0.585290] pci 0000:00:06.2: [8086:7ecb] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.585313] pci 0000:00:06.2: PCI bridge to [bus 88-d8]
[    0.585318] pci 0000:00:06.2:   bridge window [mem 0x80000000-0x87ffffff]
[    0.585327] pci 0000:00:06.2:   bridge window [mem 0x4220000000-0x521fef=
ffff 64bit pref]
[    0.585401] pci 0000:00:06.2: PME# supported from D0 D3hot D3cold
[    0.586650] pci 0000:00:07.0: [8086:7ec4] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.586674] pci 0000:00:07.0: PCI bridge to [bus 20-49]
[    0.586679] pci 0000:00:07.0:   bridge window [mem 0x8c000000-0x981fffff]
[    0.586688] pci 0000:00:07.0:   bridge window [mem 0x5220000000-0x523bff=
ffff 64bit pref]
[    0.586795] pci 0000:00:07.0: PME# supported from D0 D3hot D3cold
[    0.586829] pci 0000:00:07.0: PTM enabled (root), 4ns granularity
[    0.588121] pci 0000:00:08.0: [8086:774c] type 00 class 0x088000 convent=
ional PCI endpoint
[    0.588155] pci 0000:00:08.0: BAR 0 [mem 0x5249cd3000-0x5249cd3fff 64bit]
[    0.588264] pci 0000:00:0a.0: [8086:7d0d] type 00 class 0x118000 PCIe Ro=
ot Complex Integrated Endpoint
[    0.588284] pci 0000:00:0a.0: BAR 0 [mem 0x5249c40000-0x5249c7ffff 64bit]
[    0.588290] pci 0000:00:0a.0: enabling Extended Tags
[    0.588359] pci 0000:00:0b.0: [8086:7d1d] type 00 class 0x120000 PCIe Ro=
ot Complex Integrated Endpoint
[    0.588382] pci 0000:00:0b.0: BAR 0 [mem 0x5240000000-0x5247ffffff 64bit]
[    0.588385] pci 0000:00:0b.0: BAR 4 [mem 0x5249cd2000-0x5249cd2fff 64bit]
[    0.588487] pci 0000:00:0d.0: [8086:7ec0] type 00 class 0x0c0330 convent=
ional PCI endpoint
[    0.588518] pci 0000:00:0d.0: BAR 0 [mem 0x5249cb0000-0x5249cbffff 64bit]
[    0.588557] pci 0000:00:0d.0: PME# supported from D3hot D3cold
[    0.589643] pci 0000:00:0d.2: [8086:7ec2] type 00 class 0x0c0340 convent=
ional PCI endpoint
[    0.589675] pci 0000:00:0d.2: BAR 0 [mem 0x5249c00000-0x5249c3ffff 64bit]
[    0.589678] pci 0000:00:0d.2: BAR 2 [mem 0x5249cd1000-0x5249cd1fff 64bit]
[    0.589709] pci 0000:00:0d.2: supports D1 D2
[    0.589710] pci 0000:00:0d.2: PME# supported from D0 D1 D2 D3hot D3cold
[    0.589886] pci 0000:00:14.0: [8086:777d] type 00 class 0x0c0330 convent=
ional PCI endpoint
[    0.589919] pci 0000:00:14.0: BAR 0 [mem 0x5249ca0000-0x5249caffff 64bit]
[    0.589955] pci 0000:00:14.0: PME# supported from D3hot D3cold
[    0.591049] pci 0000:00:14.2: [8086:777f] type 00 class 0x050000 convent=
ional PCI endpoint
[    0.591091] pci 0000:00:14.2: BAR 0 [mem 0x5249cc8000-0x5249ccbfff 64bit]
[    0.591094] pci 0000:00:14.2: BAR 2 [mem 0x5249cd0000-0x5249cd0fff 64bit]
[    0.591188] pci 0000:00:14.3: [8086:7740] type 00 class 0x028000 PCIe Ro=
ot Complex Integrated Endpoint
[    0.591219] pci 0000:00:14.3: BAR 0 [mem 0x5249cc4000-0x5249cc7fff 64bit]
[    0.591230] pci 0000:00:14.3: enabling Extended Tags
[    0.591270] pci 0000:00:14.3: PME# supported from D0 D3hot D3cold
[    0.591538] pci 0000:00:15.0: [8086:7778] type 00 class 0x0c8000 convent=
ional PCI endpoint
[    0.591587] pci 0000:00:15.0: BAR 0 [mem 0x00000000-0x00000fff 64bit]
[    0.601381] pci 0000:00:16.0: [8086:7770] type 00 class 0x078000 convent=
ional PCI endpoint
[    0.601425] pci 0000:00:16.0: BAR 0 [mem 0x5249cce000-0x5249ccefff 64bit]
[    0.601472] pci 0000:00:16.0: PME# supported from D3hot
[    0.602838] pci 0000:00:19.0: [8086:7750] type 00 class 0x0c8000 convent=
ional PCI endpoint
[    0.602886] pci 0000:00:19.0: BAR 0 [mem 0x00000000-0x00000fff 64bit]
[    0.613378] pci 0000:00:1c.0: [8086:7738] type 01 class 0x060400 PCIe Ro=
ot Port
[    0.613398] pci 0000:00:1c.0: PCI bridge to [bus 0b]
[    0.613401] pci 0000:00:1c.0:   bridge window [io  0x2000-0x2fff]
[    0.613404] pci 0000:00:1c.0:   bridge window [mem 0x98200000-0x98bfffff]
[    0.613411] pci 0000:00:1c.0:   bridge window [mem 0x5249200000-0x5249bf=
ffff 64bit pref]
[    0.613467] pci 0000:00:1c.0: PME# supported from D0 D3hot D3cold
[    0.613496] pci 0000:00:1c.0: PTM enabled (root), 4ns granularity
[    0.614699] pci 0000:00:1f.0: [8086:7702] type 00 class 0x060100 convent=
ional PCI endpoint
[    0.615202] pci 0000:00:1f.3: [8086:7728] type 00 class 0x040100 convent=
ional PCI endpoint
[    0.615300] pci 0000:00:1f.3: BAR 0 [mem 0x5249cc0000-0x5249cc3fff 64bit]
[    0.615311] pci 0000:00:1f.3: BAR 4 [mem 0x5249000000-0x52491fffff 64bit]
[    0.615416] pci 0000:00:1f.3: PME# supported from D3hot D3cold
[    0.615562] pci 0000:00:1f.4: [8086:7722] type 00 class 0x0c0500 convent=
ional PCI endpoint
[    0.615605] pci 0000:00:1f.4: BAR 0 [mem 0x5249ccc000-0x5249ccc0ff 64bit]
[    0.615613] pci 0000:00:1f.4: BAR 4 [io  0xefa0-0xefbf]
[    0.615953] pci 0000:00:1f.5: [8086:7723] type 00 class 0x0c8000 convent=
ional PCI endpoint
[    0.616061] pci 0000:00:1f.5: BAR 0 [mem 0xfe010000-0xfe010fff]
[    0.616184] pci 0000:01:00.0: [10de:2d39] type 00 class 0x030000 PCIe Le=
gacy Endpoint
[    0.616218] pci 0000:01:00.0: BAR 0 [mem 0x88000000-0x8bffffff]
[    0.616220] pci 0000:01:00.0: BAR 1 [mem 0x4000000000-0x41ffffffff 64bit=
 pref]
[    0.616223] pci 0000:01:00.0: BAR 3 [mem 0x4200000000-0x4201ffffff 64bit=
 pref]
[    0.616225] pci 0000:01:00.0: BAR 5 [io  0x3000-0x307f]
[    0.616227] pci 0000:01:00.0: ROM [mem 0xfff80000-0xffffffff pref]
[    0.616258] pci 0000:01:00.0: Enabling HDA controller
[    0.616319] pci 0000:01:00.0: PME# supported from D0 D3hot
[    0.616428] pci 0000:01:00.0: 252.056 Gb/s available PCIe bandwidth, lim=
ited by 32.0 GT/s PCIe x8 link at 0000:00:01.0 (capable of 504.112 Gb/s wit=
h 32.0 GT/s PCIe x16 link)
[    0.616614] pci 0000:00:01.0: PCI bridge to [bus 01]
[    0.616930] pci 0000:04:00.0: [144d:a80a] type 00 class 0x010802 PCIe En=
dpoint
[    0.616970] pci 0000:04:00.0: BAR 0 [mem 0x98c00000-0x98c03fff 64bit]
[    0.617452] pci 0000:00:06.0: PCI bridge to [bus 04]
[    0.617519] pci 0000:88:00.0: [8086:5780] type 01 class 0x060400 PCIe Sw=
itch Upstream Port
[    0.617549] pci 0000:88:00.0: PCI bridge to [bus 89-d8]
[    0.617558] pci 0000:88:00.0:   bridge window [mem 0x80000000-0x87efffff]
[    0.617569] pci 0000:88:00.0:   bridge window [mem 0x4220000000-0x521fef=
ffff 64bit pref]
[    0.617582] pci 0000:88:00.0: enabling Extended Tags
[    0.617693] pci 0000:88:00.0: supports D1 D2
[    0.617694] pci 0000:88:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.617999] pci 0000:00:06.2: PCI bridge to [bus 88-d8]
[    0.618090] pci 0000:89:00.0: [8086:5780] type 01 class 0x060400 PCIe Sw=
itch Downstream Port
[    0.618119] pci 0000:89:00.0: PCI bridge to [bus 8a]
[    0.618138] pci 0000:89:00.0:   bridge window [mem 0x521fe00000-0x521fef=
ffff 64bit pref]
[    0.618153] pci 0000:89:00.0: enabling Extended Tags
[    0.618257] pci 0000:89:00.0: supports D1 D2
[    0.618258] pci 0000:89:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.618476] pci 0000:89:01.0: [8086:5780] type 01 class 0x060400 PCIe Sw=
itch Downstream Port
[    0.618505] pci 0000:89:01.0: PCI bridge to [bus 8b-b0]
[    0.618514] pci 0000:89:01.0:   bridge window [mem 0x84000000-0x87efffff]
[    0.618538] pci 0000:89:01.0: enabling Extended Tags
[    0.618649] pci 0000:89:01.0: supports D1 D2
[    0.618650] pci 0000:89:01.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.618865] pci 0000:89:02.0: [8086:5780] type 01 class 0x060400 PCIe Sw=
itch Downstream Port
[    0.618894] pci 0000:89:02.0: PCI bridge to [bus b1]
[    0.618903] pci 0000:89:02.0:   bridge window [mem 0x83f00000-0x83ffffff]
[    0.618927] pci 0000:89:02.0: enabling Extended Tags
[    0.619032] pci 0000:89:02.0: supports D1 D2
[    0.619033] pci 0000:89:02.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.619248] pci 0000:89:03.0: [8086:5780] type 01 class 0x060400 PCIe Sw=
itch Downstream Port
[    0.619277] pci 0000:89:03.0: PCI bridge to [bus b2-d8]
[    0.619286] pci 0000:89:03.0:   bridge window [mem 0x80000000-0x83efffff]
[    0.619311] pci 0000:89:03.0: enabling Extended Tags
[    0.619422] pci 0000:89:03.0: supports D1 D2
[    0.619423] pci 0000:89:03.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.619644] pci 0000:88:00.0: PCI bridge to [bus 89-d8]
[    0.619729] pci 0000:8a:00.0: [8086:5781] type 00 class 0x0c0340 PCIe En=
dpoint
[    0.619777] pci 0000:8a:00.0: BAR 0 [mem 0x521fe00000-0x521fe3ffff 64bit=
 pref]
[    0.619780] pci 0000:8a:00.0: BAR 2 [mem 0x521fe40000-0x521fe40fff 64bit=
 pref]
[    0.619792] pci 0000:8a:00.0: enabling Extended Tags
[    0.619881] pci 0000:8a:00.0: supports D1 D2
[    0.619882] pci 0000:8a:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[    0.620070] pci 0000:89:00.0: PCI bridge to [bus 8a]
[    0.620122] pci 0000:89:01.0: PCI bridge to [bus 8b-b0]
[    0.620209] pci 0000:b1:00.0: [8086:5782] type 00 class 0x0c0330 PCIe En=
dpoint
[    0.620256] pci 0000:b1:00.0: BAR 0 [mem 0x83f00000-0x83f0ffff 64bit]
[    0.620271] pci 0000:b1:00.0: enabling Extended Tags
[    0.620340] pci 0000:b1:00.0: PME# supported from D3hot D3cold
[    0.620470] pci 0000:89:02.0: PCI bridge to [bus b1]
[    0.620523] pci 0000:89:03.0: PCI bridge to [bus b2-d8]
[    0.620604] pci 0000:00:07.0: PCI bridge to [bus 20-49]
[    0.620667] pci 0000:0b:00.0: [10ec:5261] type 00 class 0xff0000 PCIe En=
dpoint
[    0.620720] pci 0000:0b:00.0: BAR 0 [mem 0x98200000-0x98200fff]
[    0.620815] pci 0000:0b:00.0: supports D1 D2
[    0.620816] pci 0000:0b:00.0: PME# supported from D1 D2 D3hot D3cold
[    0.620995] pci 0000:00:1c.0: PCI bridge to [bus 0b]
[    0.627032] ACPI: \_SB_.PEPD: Duplicate LPS0 _DSM functions (mask: 0x1)
[    0.793781] Low-power S0 idle used by default for system suspend
[    0.796627] ACPI: EC: interrupt unblocked
[    0.796629] ACPI: EC: event unblocked
[    0.796644] ACPI: EC: EC_CMD/EC_SC=3D0x66, EC_DATA=3D0x62
[    0.796645] ACPI: EC: GPE=3D0x6e
[    0.796646] ACPI: \_SB_.PC00.LPCB.EC__: Boot ECDT EC initialization comp=
lete
[    0.796648] ACPI: \_SB_.PC00.LPCB.EC__: EC: Used to handle transactions =
and events
[    0.796734] iommu: Default domain type: Translated
[    0.796734] iommu: DMA domain TLB invalidation policy: lazy mode
[    0.797094] SCSI subsystem initialized
[    0.797099] libata version 3.00 loaded.
[    0.797099] ACPI: bus type USB registered
[    0.797099] usbcore: registered new interface driver usbfs
[    0.797099] usbcore: registered new interface driver hub
[    0.797106] usbcore: registered new device driver usb
[    0.797140] EDAC MC: Ver: 3.0.0
[    0.797521] efivars: Registered efivars operations
[    0.797521] NetLabel: Initializing
[    0.797521] NetLabel:  domain hash size =3D 128
[    0.797521] NetLabel:  protocols =3D UNLABELED CIPSOv4 CALIPSO
[    0.797521] NetLabel:  unlabeled traffic allowed by default
[    0.797521] mctp: management component transport protocol core
[    0.797521] NET: Registered PF_MCTP protocol family
[    0.797521] PCI: Using ACPI for IRQ routing
[    0.807973] PCI: pci_cache_line_size set to 64 bytes
[    0.809097] pci 0000:00:1f.5: BAR 0 [mem 0xfe010000-0xfe010fff]: can't c=
laim; no compatible bridge window
[    0.809388] e820: reserve RAM buffer [mem 0x4f533000-0x4fffffff]
[    0.809390] e820: reserve RAM buffer [mem 0x54846000-0x57ffffff]
[    0.809391] e820: reserve RAM buffer [mem 0x5b52f000-0x5bffffff]
[    0.809414] pci 0000:00:02.0: vgaarb: setting as boot VGA device
[    0.809414] pci 0000:00:02.0: vgaarb: bridge control possible
[    0.809414] pci 0000:00:02.0: vgaarb: VGA device added: decodes=3Dio+mem=
,owns=3Dio+mem,locks=3Dnone
[    0.809414] pci 0000:01:00.0: vgaarb: bridge control possible
[    0.809414] pci 0000:01:00.0: vgaarb: VGA device added: decodes=3Dio+mem=
,owns=3Dnone,locks=3Dnone
[    0.809414] vgaarb: loaded
[    0.809414] Monitor-Mwait will be used to enter C-1 state
[    0.809414] Monitor-Mwait will be used to enter C-2 state
[    0.809414] Monitor-Mwait will be used to enter C-3 state
[    0.811152] clocksource: Switched to clocksource tsc-early
[    0.811283] VFS: Disk quotas dquot_6.6.0
[    0.811290] VFS: Dquot-cache hash table entries: 512 (order 0, 4096 byte=
s)
[    0.811975] pnp: PnP ACPI init
[    0.813921] system 00:00: [io  0x0680-0x069f] has been reserved
[    0.813925] system 00:00: [io  0x164e-0x164f] has been reserved
[    0.814061] system 00:01: [io  0x1854-0x1857] has been reserved
[    0.814172] system 00:04: [io  0x1800-0x189f] could not be reserved
[    0.814173] system 00:04: [io  0x0800-0x087f] has been reserved
[    0.814174] system 00:04: [io  0x0880-0x08ff] has been reserved
[    0.814175] system 00:04: [io  0x0900-0x097f] has been reserved
[    0.814176] system 00:04: [io  0x0980-0x09ff] has been reserved
[    0.814177] system 00:04: [io  0x0a00-0x0a7f] has been reserved
[    0.814178] system 00:04: [io  0x0a80-0x0aff] has been reserved
[    0.814179] system 00:04: [io  0x0b00-0x0b7f] has been reserved
[    0.814180] system 00:04: [io  0x0b80-0x0bff] has been reserved
[    0.814181] system 00:04: [io  0x15e0-0x15ef] has been reserved
[    0.814182] system 00:04: [io  0x1600-0x167f] could not be reserved
[    0.814183] system 00:04: [io  0x1640-0x165f] could not be reserved
[    0.814185] system 00:04: [mem 0xc0000000-0xcfffffff] has been reserved
[    0.814187] system 00:04: [mem 0xfed10000-0xfed13fff] has been reserved
[    0.814188] system 00:04: [mem 0xfed18000-0xfed18fff] has been reserved
[    0.814189] system 00:04: [mem 0xfed19000-0xfed19fff] has been reserved
[    0.814191] system 00:04: [mem 0xfeb00000-0xfebfffff] has been reserved
[    0.814193] system 00:04: [mem 0xfed20000-0xfed3ffff] has been reserved
[    0.814194] system 00:04: [mem 0xfed90000-0xfed93fff] has been reserved
[    0.815028] pnp 00:05: disabling [mem 0x00000000-0x00000fff] because it =
overlaps 0000:00:02.0 BAR 7 [mem 0x00000000-0x06ffffff 64bit pref]
[    0.815031] pnp 00:05: disabling [mem 0x00000000-0x00000fff] because it =
overlaps 0000:00:02.0 BAR 7 [mem 0x00000000-0x06ffffff 64bit pref]
[    0.815052] system 00:05: [mem 0xfedc0000-0xfedc7fff] has been reserved
[    0.815054] system 00:05: [mem 0xc0000000-0xcfffffff] has been reserved
[    0.815055] system 00:05: [mem 0xfed20000-0xfed7ffff] could not be reser=
ved
[    0.815056] system 00:05: [mem 0xfc800000-0xfc81ffff] could not be reser=
ved
[    0.815057] system 00:05: [mem 0xfed45000-0xfed8ffff] could not be reser=
ved
[    0.815058] system 00:05: [mem 0xfee00000-0xfeefffff] has been reserved
[    0.816221] system 00:06: [io  0xff00-0xfffe] has been reserved
[    0.816926] pnp 00:08: disabling [mem 0x000c0000-0x000c3fff] because it =
overlaps 0000:00:02.0 BAR 6 [mem 0x000c0000-0x000dffff]
[    0.816928] pnp 00:08: disabling [mem 0x000c8000-0x000cbfff] because it =
overlaps 0000:00:02.0 BAR 6 [mem 0x000c0000-0x000dffff]
[    0.816930] pnp 00:08: disabling [mem 0x000d0000-0x000d3fff] because it =
overlaps 0000:00:02.0 BAR 6 [mem 0x000c0000-0x000dffff]
[    0.816931] pnp 00:08: disabling [mem 0x000d8000-0x000dbfff] because it =
overlaps 0000:00:02.0 BAR 6 [mem 0x000c0000-0x000dffff]
[    0.816932] pnp 00:08: disabling [mem 0x00000000-0x0009ffff] because it =
overlaps 0000:00:02.0 BAR 7 [mem 0x00000000-0x06ffffff 64bit pref]
[    0.816934] pnp 00:08: disabling [mem 0x000c0000-0x000c3fff disabled] be=
cause it overlaps 0000:00:02.0 BAR 7 [mem 0x00000000-0x06ffffff 64bit pref]
[    0.816935] pnp 00:08: disabling [mem 0x000c8000-0x000cbfff disabled] be=
cause it overlaps 0000:00:02.0 BAR 7 [mem 0x00000000-0x06ffffff 64bit pref]
[    0.816936] pnp 00:08: disabling [mem 0x000d0000-0x000d3fff disabled] be=
cause it overlaps 0000:00:02.0 BAR 7 [mem 0x00000000-0x06ffffff 64bit pref]
[    0.816938] pnp 00:08: disabling [mem 0x000d8000-0x000dbfff disabled] be=
cause it overlaps 0000:00:02.0 BAR 7 [mem 0x00000000-0x06ffffff 64bit pref]
[    0.816939] pnp 00:08: disabling [mem 0x000e0000-0x000e3fff] because it =
overlaps 0000:00:02.0 BAR 7 [mem 0x00000000-0x06ffffff 64bit pref]
[    0.816940] pnp 00:08: disabling [mem 0x000e8000-0x000ebfff] because it =
overlaps 0000:00:02.0 BAR 7 [mem 0x00000000-0x06ffffff 64bit pref]
[    0.816941] pnp 00:08: disabling [mem 0x000f0000-0x000fffff] because it =
overlaps 0000:00:02.0 BAR 7 [mem 0x00000000-0x06ffffff 64bit pref]
[    0.816942] pnp 00:08: disabling [mem 0x00100000-0x7fffffff] because it =
overlaps 0000:00:02.0 BAR 7 [mem 0x00000000-0x06ffffff 64bit pref]
[    0.816961] system 00:08: [mem 0xfec00000-0xfed3ffff] could not be reser=
ved
[    0.816962] system 00:08: [mem 0xfed4c000-0xffffffff] could not be reser=
ved
[    0.817173] pnp: PnP ACPI: found 9 devices
[    0.822847] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, m=
ax_idle_ns: 2085701024 ns
[    0.822901] NET: Registered PF_INET protocol family
[    0.823126] IP idents hash table entries: 262144 (order: 9, 2097152 byte=
s, linear)
[    0.837489] tcp_listen_portaddr_hash hash table entries: 32768 (order: 7=
, 524288 bytes, linear)
[    0.837534] Table-perturb hash table entries: 65536 (order: 6, 262144 by=
tes, linear)
[    0.837948] TCP established hash table entries: 524288 (order: 10, 41943=
04 bytes, linear)
[    0.838421] TCP bind hash table entries: 65536 (order: 9, 2097152 bytes,=
 linear)
[    0.838509] TCP: Hash tables configured (established 524288 bind 65536)
[    0.838788] MPTCP token hash table entries: 65536 (order: 8, 1572864 byt=
es, linear)
[    0.839062] UDP hash table entries: 32768 (order: 9, 2097152 bytes, line=
ar)
[    0.839365] UDP-Lite hash table entries: 32768 (order: 9, 2097152 bytes,=
 linear)
[    0.839530] NET: Registered PF_UNIX/PF_LOCAL protocol family
[    0.839537] NET: Registered PF_XDP protocol family
[    0.839543] pci 0000:01:00.0: ROM [mem 0xfff80000-0xffffffff pref]: can'=
t claim; no compatible bridge window
[    0.839553] pci 0000:89:01.0: bridge window [io  0x1000-0x0fff] to [bus =
8b-b0] add_size 1000
[    0.839556] pci 0000:89:01.0: bridge window [mem 0x00100000-0x000fffff 6=
4bit pref] to [bus 8b-b0] add_size 200000 add_align 100000
[    0.839560] pci 0000:89:03.0: bridge window [io  0x1000-0x0fff] to [bus =
b2-d8] add_size 1000
[    0.839561] pci 0000:89:03.0: bridge window [mem 0x00100000-0x000fffff 6=
4bit pref] to [bus b2-d8] add_size 200000 add_align 100000
[    0.839563] pci 0000:88:00.0: bridge window [io  0x1000-0x0fff] to [bus =
89-d8] add_size 2000
[    0.839565] pci 0000:00:06.2: bridge window [io  0x1000-0x0fff] to [bus =
88-d8] add_size 2000
[    0.839567] pci 0000:00:07.0: bridge window [io  0x1000-0x0fff] to [bus =
20-49] add_size 1000
[    0.839581] pci 0000:00:02.0: VF BAR 0 [mem 0x4202000000-0x4208ffffff 64=
bit pref]: assigned
[    0.839587] pci 0000:00:06.2: bridge window [io  0x4000-0x5fff]: assigned
[    0.839589] pci 0000:00:07.0: bridge window [io  0x6000-0x6fff]: assigned
[    0.839591] pci 0000:00:15.0: BAR 0 [mem 0x4209000000-0x4209000fff 64bit=
]: assigned
[    0.839602] pci 0000:00:19.0: BAR 0 [mem 0x4209001000-0x4209001fff 64bit=
]: assigned
[    0.839616] pci 0000:00:1f.5: BAR 0 [mem 0x98d00000-0x98d00fff]: assigned
[    0.839628] pci 0000:01:00.0: ROM [mem size 0x00080000 pref]: can't assi=
gn; no space
[    0.839629] pci 0000:01:00.0: ROM [mem size 0x00080000 pref]: failed to =
assign
[    0.839631] pci 0000:00:01.0: PCI bridge to [bus 01]
[    0.839633] pci 0000:00:01.0:   bridge window [io  0x3000-0x3fff]
[    0.839637] pci 0000:00:01.0:   bridge window [mem 0x88000000-0x8bffffff]
[    0.839639] pci 0000:00:01.0:   bridge window [mem 0x4000000000-0x4201ff=
ffff 64bit pref]
[    0.839644] pci 0000:00:06.0: PCI bridge to [bus 04]
[    0.839686] pci 0000:00:06.0:   bridge window [mem 0x98c00000-0x98cfffff]
[    0.839695] pci 0000:88:00.0: bridge window [io  0x4000-0x5fff]: assigned
[    0.839697] pci 0000:89:01.0: bridge window [mem 0x4220000000-0x42201fff=
ff 64bit pref]: assigned
[    0.839699] pci 0000:89:03.0: bridge window [mem 0x4220200000-0x42203fff=
ff 64bit pref]: assigned
[    0.839700] pci 0000:89:01.0: bridge window [io  0x4000-0x4fff]: assigned
[    0.839701] pci 0000:89:03.0: bridge window [io  0x5000-0x5fff]: assigned
[    0.839702] pci 0000:89:00.0: PCI bridge to [bus 8a]
[    0.839709] pci 0000:89:00.0:   bridge window [mem 0x521fe00000-0x521fef=
ffff 64bit pref]
[    0.839715] pci 0000:89:01.0: PCI bridge to [bus 8b-b0]
[    0.839717] pci 0000:89:01.0:   bridge window [io  0x4000-0x4fff]
[    0.839721] pci 0000:89:01.0:   bridge window [mem 0x84000000-0x87efffff]
[    0.839725] pci 0000:89:01.0:   bridge window [mem 0x4220000000-0x42201f=
ffff 64bit pref]
[    0.839731] pci 0000:89:02.0: PCI bridge to [bus b1]
[    0.839735] pci 0000:89:02.0:   bridge window [mem 0x83f00000-0x83ffffff]
[    0.839744] pci 0000:89:03.0: PCI bridge to [bus b2-d8]
[    0.839746] pci 0000:89:03.0:   bridge window [io  0x5000-0x5fff]
[    0.839750] pci 0000:89:03.0:   bridge window [mem 0x80000000-0x83efffff]
[    0.839753] pci 0000:89:03.0:   bridge window [mem 0x4220200000-0x42203f=
ffff 64bit pref]
[    0.839759] pci 0000:88:00.0: PCI bridge to [bus 89-d8]
[    0.839761] pci 0000:88:00.0:   bridge window [io  0x4000-0x5fff]
[    0.839765] pci 0000:88:00.0:   bridge window [mem 0x80000000-0x87efffff]
[    0.839768] pci 0000:88:00.0:   bridge window [mem 0x4220000000-0x521fef=
ffff 64bit pref]
[    0.839774] pci 0000:00:06.2: PCI bridge to [bus 88-d8]
[    0.839776] pci 0000:00:06.2:   bridge window [io  0x4000-0x5fff]
[    0.839779] pci 0000:00:06.2:   bridge window [mem 0x80000000-0x87ffffff]
[    0.839782] pci 0000:00:06.2:   bridge window [mem 0x4220000000-0x521fef=
ffff 64bit pref]
[    0.839786] pci 0000:00:07.0: PCI bridge to [bus 20-49]
[    0.839788] pci 0000:00:07.0:   bridge window [io  0x6000-0x6fff]
[    0.839792] pci 0000:00:07.0:   bridge window [mem 0x8c000000-0x981fffff]
[    0.839794] pci 0000:00:07.0:   bridge window [mem 0x5220000000-0x523bff=
ffff 64bit pref]
[    0.839800] pci 0000:00:1c.0: PCI bridge to [bus 0b]
[    0.839801] pci 0000:00:1c.0:   bridge window [io  0x2000-0x2fff]
[    0.839804] pci 0000:00:1c.0:   bridge window [mem 0x98200000-0x98bfffff]
[    0.839807] pci 0000:00:1c.0:   bridge window [mem 0x5249200000-0x5249bf=
ffff 64bit pref]
[    0.839811] pci_bus 0000:00: Some PCI device resources are unassigned, t=
ry booting with pci=3Drealloc
[    0.839813] pci_bus 0000:00: resource 4 [io  0x0000-0x0cf7 window]
[    0.839814] pci_bus 0000:00: resource 5 [io  0x0d00-0xffff window]
[    0.839815] pci_bus 0000:00: resource 6 [mem 0x000a0000-0x000bffff windo=
w]
[    0.839816] pci_bus 0000:00: resource 7 [mem 0x80000000-0xbfffffff windo=
w]
[    0.839817] pci_bus 0000:00: resource 8 [mem 0x4000000000-0x3ffbfffffff =
window]
[    0.839818] pci_bus 0000:01: resource 0 [io  0x3000-0x3fff]
[    0.839819] pci_bus 0000:01: resource 1 [mem 0x88000000-0x8bffffff]
[    0.839820] pci_bus 0000:01: resource 2 [mem 0x4000000000-0x4201ffffff 6=
4bit pref]
[    0.839822] pci_bus 0000:04: resource 1 [mem 0x98c00000-0x98cfffff]
[    0.839823] pci_bus 0000:88: resource 0 [io  0x4000-0x5fff]
[    0.839824] pci_bus 0000:88: resource 1 [mem 0x80000000-0x87ffffff]
[    0.839824] pci_bus 0000:88: resource 2 [mem 0x4220000000-0x521fefffff 6=
4bit pref]
[    0.839826] pci_bus 0000:89: resource 0 [io  0x4000-0x5fff]
[    0.839826] pci_bus 0000:89: resource 1 [mem 0x80000000-0x87efffff]
[    0.839827] pci_bus 0000:89: resource 2 [mem 0x4220000000-0x521fefffff 6=
4bit pref]
[    0.839828] pci_bus 0000:8a: resource 2 [mem 0x521fe00000-0x521fefffff 6=
4bit pref]
[    0.839829] pci_bus 0000:8b: resource 0 [io  0x4000-0x4fff]
[    0.839830] pci_bus 0000:8b: resource 1 [mem 0x84000000-0x87efffff]
[    0.839831] pci_bus 0000:8b: resource 2 [mem 0x4220000000-0x42201fffff 6=
4bit pref]
[    0.839832] pci_bus 0000:b1: resource 1 [mem 0x83f00000-0x83ffffff]
[    0.839833] pci_bus 0000:b2: resource 0 [io  0x5000-0x5fff]
[    0.839834] pci_bus 0000:b2: resource 1 [mem 0x80000000-0x83efffff]
[    0.839835] pci_bus 0000:b2: resource 2 [mem 0x4220200000-0x42203fffff 6=
4bit pref]
[    0.839836] pci_bus 0000:20: resource 0 [io  0x6000-0x6fff]
[    0.839837] pci_bus 0000:20: resource 1 [mem 0x8c000000-0x981fffff]
[    0.839838] pci_bus 0000:20: resource 2 [mem 0x5220000000-0x523bffffff 6=
4bit pref]
[    0.839839] pci_bus 0000:0b: resource 0 [io  0x2000-0x2fff]
[    0.839840] pci_bus 0000:0b: resource 1 [mem 0x98200000-0x98bfffff]
[    0.839841] pci_bus 0000:0b: resource 2 [mem 0x5249200000-0x5249bfffff 6=
4bit pref]
[    0.840049] pci 0000:00:0d.0: enabling device (0000 -> 0002)
[    0.840877] pci 0000:b1:00.0: enabling device (0000 -> 0002)
[    0.840908] PCI: CLS 0 bytes, default 64
[    0.840944] DMAR: Intel-IOMMU force enabled due to platform opt in
[    0.840956] DMAR: No RMRR found
[    0.840956] DMAR: No ATSR found
[    0.840958] DMAR: dmar0: Using Queued invalidation
[    0.840961] DMAR: dmar1: Using Queued invalidation
[    0.841060] Trying to unpack rootfs image as initramfs...
[    0.841723] pci 0000:00:02.0: Adding to iommu group 0
[    0.841763] pci 0000:00:00.0: Adding to iommu group 1
[    0.841776] pci 0000:00:01.0: Adding to iommu group 2
[    0.841785] pci 0000:00:04.0: Adding to iommu group 3
[    0.841835] pci 0000:00:06.0: Adding to iommu group 4
[    0.841847] pci 0000:00:06.2: Adding to iommu group 5
[    0.841859] pci 0000:00:07.0: Adding to iommu group 6
[    0.841869] pci 0000:00:08.0: Adding to iommu group 7
[    0.841879] pci 0000:00:0a.0: Adding to iommu group 8
[    0.841891] pci 0000:00:0b.0: Adding to iommu group 9
[    0.841908] pci 0000:00:0d.0: Adding to iommu group 10
[    0.841918] pci 0000:00:0d.2: Adding to iommu group 10
[    0.841936] pci 0000:00:14.0: Adding to iommu group 11
[    0.841948] pci 0000:00:14.2: Adding to iommu group 11
[    0.841958] pci 0000:00:14.3: Adding to iommu group 12
[    0.841972] pci 0000:00:15.0: Adding to iommu group 13
[    0.841985] pci 0000:00:16.0: Adding to iommu group 14
[    0.842000] pci 0000:00:19.0: Adding to iommu group 15
[    0.842011] pci 0000:00:1c.0: Adding to iommu group 16
[    0.842038] pci 0000:00:1f.0: Adding to iommu group 17
[    0.842049] pci 0000:00:1f.3: Adding to iommu group 17
[    0.842060] pci 0000:00:1f.4: Adding to iommu group 17
[    0.842071] pci 0000:00:1f.5: Adding to iommu group 17
[    0.842084] pci 0000:01:00.0: Adding to iommu group 18
[    0.842135] pci 0000:04:00.0: Adding to iommu group 19
[    0.842149] pci 0000:88:00.0: Adding to iommu group 20
[    0.842163] pci 0000:89:00.0: Adding to iommu group 21
[    0.842175] pci 0000:89:01.0: Adding to iommu group 22
[    0.842186] pci 0000:89:02.0: Adding to iommu group 23
[    0.842197] pci 0000:89:03.0: Adding to iommu group 24
[    0.842213] pci 0000:8a:00.0: Adding to iommu group 25
[    0.842227] pci 0000:b1:00.0: Adding to iommu group 26
[    0.842239] pci 0000:0b:00.0: Adding to iommu group 27
[    0.842414] DMAR: Intel(R) Virtualization Technology for Directed I/O
[    0.842415] PCI-DMA: Using software bounce buffering for IO (SWIOTLB)
[    0.842416] software IO TLB: mapped [mem 0x000000004b533000-0x000000004f=
533000] (64MB)
[    0.842480] clocksource: tsc: mask: 0xffffffffffffffff max_cycles: 0x6a4=
64ae9873, max_idle_ns: 881590529744 ns
[    0.842656] clocksource: Switched to clocksource tsc
[    0.842677] platform rtc_cmos: registered platform RTC device (no PNP de=
vice found)
[    0.867152] Initialise system trusted keyrings
[    0.867166] Key type blacklist registered
[    0.867448] workingset: timestamp_bits=3D36 max_order=3D24 bucket_order=
=3D0
[    0.867660] fuse: init (API version 7.44)
[    0.867739] integrity: Platform Keyring initialized
[    0.867742] integrity: Machine keyring initialized
[    0.876112] xor: automatically using best checksumming function   avx   =
   =20
[    0.876115] Key type asymmetric registered
[    0.876116] Asymmetric key parser 'x509' registered
[    0.876139] Block layer SCSI generic (bsg) driver version 0.4 loaded (ma=
jor 245)
[    0.876472] io scheduler mq-deadline registered
[    0.876473] io scheduler kyber registered
[    0.876486] io scheduler bfq registered
[    0.879894] ledtrig-cpu: registered to indicate activity on CPUs
[    0.880217] pcieport 0000:00:01.0: PME: Signaling with IRQ 122
[    0.880613] pcieport 0000:00:01.0: AER: enabled with IRQ 122
[    0.880969] pcieport 0000:00:06.0: PME: Signaling with IRQ 123
[    0.881271] pcieport 0000:00:06.0: AER: enabled with IRQ 123
[    0.881471] pcieport 0000:00:06.2: PME: Signaling with IRQ 124
[    0.881777] pcieport 0000:00:06.2: AER: enabled with IRQ 124
[    0.881992] pcieport 0000:00:07.0: PME: Signaling with IRQ 125
[    0.882422] pcieport 0000:00:07.0: AER: enabled with IRQ 125
[    0.882449] pcieport 0000:00:07.0: pciehp: Slot #12 AttnBtn- PwrCtrl- MR=
L- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLAct=
Rep+
[    0.883025] pcieport 0000:00:1c.0: PME: Signaling with IRQ 126
[    0.883418] pcieport 0000:00:1c.0: AER: enabled with IRQ 126
[    0.883442] pcieport 0000:00:1c.0: pciehp: Slot #0 AttnBtn- PwrCtrl- MRL=
- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActR=
ep+
[    0.884053] pcieport 0000:89:01.0: pciehp: Slot #1 AttnBtn- PwrCtrl- MRL=
- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActR=
ep+
[    0.884473] pcieport 0000:89:03.0: pciehp: Slot #3 AttnBtn- PwrCtrl- MRL=
- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActR=
ep+
[    0.885606] ACPI: AC: AC Adapter [AC] (off-line)
[    0.885658] input: Sleep Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0=
C0E:00/input/input0
[    0.887110] ACPI: button: Sleep Button [SLPB]
[    0.887144] input: Lid Switch as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0C0=
D:00/input/input1
[    0.892111] ACPI: button: Lid Switch [LID]
[    0.892131] input: Power Button as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0=
C0C:00/input/input2
[    0.892145] ACPI: button: Power Button [PWRB]
[    0.918660] Freeing initrd memory: 134364K
[    0.924801] thermal LNXTHERM:00: registered as thermal_zone0
[    0.924805] ACPI: thermal: Thermal Zone [THM0] (52 C)
[    0.925080] Serial: 8250/16550 driver, 32 ports, IRQ sharing enabled
[    0.926502] hpet_acpi_add: no address or irqs in _CRS
[    0.926533] Non-volatile memory driver v1.3
[    0.926534] Linux agpgart interface v0.103
[    0.933276] tpm_tis STM0925:00: 2.0 TPM (device-id 0x3, rev-id 1)
[    0.992454] ACPI: battery: Slot [BAT0] (battery present)
[    1.028384] ACPI: bus type drm_connector registered
[    1.031031] xhci_hcd 0000:00:0d.0: xHCI Host Controller
[    1.031037] xhci_hcd 0000:00:0d.0: new USB bus registered, assigned bus =
number 1
[    1.032118] xhci_hcd 0000:00:0d.0: hcc params 0x20007fc1 hci version 0x1=
20 quirks 0x0000000200009810
[    1.032376] xhci_hcd 0000:00:0d.0: xHCI Host Controller
[    1.032378] xhci_hcd 0000:00:0d.0: new USB bus registered, assigned bus =
number 2
[    1.032380] xhci_hcd 0000:00:0d.0: Host supports USB 3.2 Enhanced SuperS=
peed
[    1.032418] usb usb1: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.17
[    1.032421] usb usb1: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.032422] usb usb1: Product: xHCI Host Controller
[    1.032423] usb usb1: Manufacturer: Linux 6.17.7-arch1-1 xhci-hcd
[    1.032424] usb usb1: SerialNumber: 0000:00:0d.0
[    1.032826] hub 1-0:1.0: USB hub found
[    1.032834] hub 1-0:1.0: 1 port detected
[    1.033193] usb usb2: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.17
[    1.033195] usb usb2: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.033196] usb usb2: Product: xHCI Host Controller
[    1.033197] usb usb2: Manufacturer: Linux 6.17.7-arch1-1 xhci-hcd
[    1.033198] usb usb2: SerialNumber: 0000:00:0d.0
[    1.033455] hub 2-0:1.0: USB hub found
[    1.033463] hub 2-0:1.0: 2 ports detected
[    1.035617] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    1.035620] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus =
number 3
[    1.036698] xhci_hcd 0000:00:14.0: hcc params 0x20007fc1 hci version 0x1=
20 quirks 0x0000000200009810
[    1.036942] xhci_hcd 0000:00:14.0: xHCI Host Controller
[    1.036944] xhci_hcd 0000:00:14.0: new USB bus registered, assigned bus =
number 4
[    1.036946] xhci_hcd 0000:00:14.0: Host supports USB 3.2 Enhanced SuperS=
peed
[    1.036968] usb usb3: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.17
[    1.036969] usb usb3: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.036971] usb usb3: Product: xHCI Host Controller
[    1.036971] usb usb3: Manufacturer: Linux 6.17.7-arch1-1 xhci-hcd
[    1.036972] usb usb3: SerialNumber: 0000:00:14.0
[    1.037107] hub 3-0:1.0: USB hub found
[    1.037121] hub 3-0:1.0: 12 ports detected
[    1.038643] usb usb4: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.17
[    1.038645] usb usb4: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.038646] usb usb4: Product: xHCI Host Controller
[    1.038647] usb usb4: Manufacturer: Linux 6.17.7-arch1-1 xhci-hcd
[    1.038648] usb usb4: SerialNumber: 0000:00:14.0
[    1.038770] hub 4-0:1.0: USB hub found
[    1.038777] hub 4-0:1.0: 2 ports detected
[    1.039076] xhci_hcd 0000:b1:00.0: xHCI Host Controller
[    1.039079] xhci_hcd 0000:b1:00.0: new USB bus registered, assigned bus =
number 5
[    1.040178] xhci_hcd 0000:b1:00.0: hcc params 0x20007fc1 hci version 0x1=
20 quirks 0x0000000200009810
[    1.040471] xhci_hcd 0000:b1:00.0: xHCI Host Controller
[    1.040473] xhci_hcd 0000:b1:00.0: new USB bus registered, assigned bus =
number 6
[    1.040474] xhci_hcd 0000:b1:00.0: Host supports USB 3.2 Enhanced SuperS=
peed
[    1.040499] usb usb5: New USB device found, idVendor=3D1d6b, idProduct=
=3D0002, bcdDevice=3D 6.17
[    1.040500] usb usb5: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.040501] usb usb5: Product: xHCI Host Controller
[    1.040502] usb usb5: Manufacturer: Linux 6.17.7-arch1-1 xhci-hcd
[    1.040502] usb usb5: SerialNumber: 0000:b1:00.0
[    1.040619] hub 5-0:1.0: USB hub found
[    1.040626] hub 5-0:1.0: 2 ports detected
[    1.041213] usb usb6: New USB device found, idVendor=3D1d6b, idProduct=
=3D0003, bcdDevice=3D 6.17
[    1.041214] usb usb6: New USB device strings: Mfr=3D3, Product=3D2, Seri=
alNumber=3D1
[    1.041215] usb usb6: Product: xHCI Host Controller
[    1.041216] usb usb6: Manufacturer: Linux 6.17.7-arch1-1 xhci-hcd
[    1.041217] usb usb6: SerialNumber: 0000:b1:00.0
[    1.041330] hub 6-0:1.0: USB hub found
[    1.041337] hub 6-0:1.0: 2 ports detected
[    1.042400] usbcore: registered new interface driver usbserial_generic
[    1.042404] usbserial: USB Serial support registered for generic
[    1.042437] i8042: PNP: PS/2 Controller [PNP0303:KBD,PNP0f13:MOU] at 0x6=
0,0x64 irq 1,12
[    1.044583] serio: i8042 KBD port at 0x60,0x64 irq 1
[    1.044615] serio: i8042 AUX port at 0x60,0x64 irq 12
[    1.044730] rtc_cmos rtc_cmos: RTC can wake from S4
[    1.045609] rtc_cmos rtc_cmos: registered as rtc0
[    1.045786] rtc_cmos rtc_cmos: setting system clock to 2025-11-03T10:44:=
01 UTC (1762166641)
[    1.045811] rtc_cmos rtc_cmos: alarms up to one month, y3k, 114 bytes nv=
ram
[    1.045901] input: AT Translated Set 2 keyboard as /devices/platform/i80=
42/serio0/input/input3
[    1.047149] intel_pstate: Intel P-state driver initializing
[    1.052503] Hybrid CPU capacity scaling enabled
[    1.052533] processor cpu0: EM: created perf domain
[    1.052550] processor cpu1: EM: created perf domain
[    1.052566] processor cpu2: EM: created perf domain
[    1.052583] processor cpu3: EM: created perf domain
[    1.052600] processor cpu4: EM: created perf domain
[    1.052614] processor cpu5: EM: created perf domain
[    1.052629] processor cpu6: EM: created perf domain
[    1.052644] processor cpu7: EM: created perf domain
[    1.052663] processor cpu8: EM: created perf domain
[    1.052681] processor cpu9: EM: created perf domain
[    1.052695] processor cpu10: EM: created perf domain
[    1.052709] processor cpu11: EM: created perf domain
[    1.052723] processor cpu12: EM: created perf domain
[    1.052736] processor cpu13: EM: created perf domain
[    1.052752] processor cpu14: EM: created perf domain
[    1.052766] processor cpu15: EM: created perf domain
[    1.053232] intel_pstate: HWP enabled
[    1.053452] simple-framebuffer simple-framebuffer.0: [drm:simpledrm_prob=
e] display mode=3D{"": 60 552960 3840 3840 3840 3840 2400 2400 2400 2400 0x=
40 0x0}
[    1.053459] simple-framebuffer simple-framebuffer.0: [drm:simpledrm_prob=
e] framebuffer format=3DXR24 little-endian (0x34325258), size=3D3840x2400, =
stride=3D15360 byte
[    1.053462] simple-framebuffer simple-framebuffer.0: [drm:simpledrm_prob=
e] using I/O memory framebuffer at [mem 0x70800000-0x72b27fff flags 0x200]
[    1.053484] simple-framebuffer simple-framebuffer.0: [drm:drm_sysfb_buil=
d_fourcc_list] adding native format XR24 little-endian (0x34325258)
[    1.053531] simple-framebuffer simple-framebuffer.0: [drm:drm_sysfs_conn=
ector_add] [CONNECTOR:37:Unknown-1] adding connector to sysfs
[    1.053544] simple-framebuffer simple-framebuffer.0: [drm:drm_sysfs_conn=
ector_hotplug_event] [CONNECTOR:37:Unknown-1] generating connector hotplug =
event
[    1.053549] simple-framebuffer simple-framebuffer.0: [drm] Registered 1 =
planes with drm panic
[    1.053550] [drm] Initialized simpledrm 1.0.0 for simple-framebuffer.0 o=
n minor 0
[    1.053557] simple-framebuffer simple-framebuffer.0: [drm:drm_client_mod=
eset_probe]=20
[    1.053561] simple-framebuffer simple-framebuffer.0: [drm:drm_helper_pro=
be_single_connector_modes] [CONNECTOR:37:Unknown-1]
[    1.053565] simple-framebuffer simple-framebuffer.0: [drm:drm_helper_pro=
be_single_connector_modes] [CONNECTOR:37:Unknown-1] status updated from unk=
nown to connected
[    1.053581] simple-framebuffer simple-framebuffer.0: [drm:drm_helper_pro=
be_single_connector_modes] [CONNECTOR:37:Unknown-1] probed modes:
[    1.053583] simple-framebuffer simple-framebuffer.0: [drm:drm_helper_pro=
be_single_connector_modes] Probed mode: "3840x2400": 60 552960 3840 3840 38=
40 3840 2400 2400 2400 2400 0x48 0x0
[    1.053586] simple-framebuffer simple-framebuffer.0: [drm:drm_client_mod=
eset_probe] [CONNECTOR:37:Unknown-1] enabled? yes
[    1.053589] simple-framebuffer simple-framebuffer.0: [drm:drm_client_mod=
eset_probe] Not using firmware configuration
[    1.053591] simple-framebuffer simple-framebuffer.0: [drm:drm_client_mod=
eset_probe] [CONNECTOR:37:Unknown-1] found preferred mode: 3840x2400
[    1.053593] simple-framebuffer simple-framebuffer.0: [drm:drm_client_mod=
eset_probe] picking CRTCs for 4096x4096 config
[    1.053596] simple-framebuffer simple-framebuffer.0: [drm:drm_client_mod=
eset_probe] [CRTC:35:crtc-0] desired mode 3840x2400 set (0,0)
[    1.053598] simple-framebuffer simple-framebuffer.0: [drm:__drm_fb_helpe=
r_initial_config_and_unlock] test CRTC 0 primary plane
[    1.053601] simple-framebuffer simple-framebuffer.0: [drm:drm_fbdev_shme=
m_driver_fbdev_probe] surface width(3840), height(2400) and bpp(32)
[    1.053622] simple-framebuffer simple-framebuffer.0: [drm:drm_mode_addfb=
2] [FB:38]
[    1.060598] fbcon: Deferring console take-over
[    1.060600] simple-framebuffer simple-framebuffer.0: [drm] fb0: simpledr=
mdrmfb frame buffer device
[    1.060970] hid: raw HID events driver (C) Jiri Kosina
[    1.060986] usbcore: registered new interface driver usbhid
[    1.060987] usbhid: USB HID core driver
[    1.061059] drop_monitor: Initializing network drop monitor service
[    1.061150] NET: Registered PF_INET6 protocol family
[    1.061393] Segment Routing with IPv6
[    1.061394] RPL Segment Routing with IPv6
[    1.061400] In-situ OAM (IOAM) with IPv6
[    1.061416] NET: Registered PF_PACKET protocol family
[    1.064751] ENERGY_PERF_BIAS: Set to 'normal', was 'performance'
[    1.066729] microcode: Current revision: 0x00000119
[    1.068837] IPI shorthand broadcast: enabled
[    1.069802] sched_clock: Marking stable (1063000616, 6013953)->(10956741=
29, -26659560)
[    1.070745] registered taskstats version 1
[    1.073310] Loading compiled-in X.509 certificates
[    1.077666] Loaded X.509 cert 'Build time autogenerated kernel key: 46d2=
61b4279a399a9dad440045a7c0163909f942'
[    1.078966] zswap: loaded using pool zstd/zsmalloc
[    1.079220] Demotion targets for Node 0: null
[    1.079356] Key type .fscrypt registered
[    1.079357] Key type fscrypt-provisioning registered
[    1.079931] Btrfs loaded, zoned=3Dyes, fsverity=3Dyes
[    1.079950] Key type big_key registered
[    1.082528] integrity: Loading X.509 certificate: UEFI:db
[    1.084243] integrity: Loaded X.509 cert 'Frederik Schwan mobile Signatu=
re Database key: 60ee44eb97998a479748a91b64298fb1af7ef90b'
[    1.084839] PM:   Magic number: 1:1:729
[    1.085578] RAS: Correctable Errors collector initialized.
[    1.088163] clk: Disabling unused clocks
[    1.088164] PM: genpd: Disabling unused power domains
[    1.090240] Freeing unused decrypted memory: 2028K
[    1.091515] Freeing unused kernel image (initmem) memory: 4692K
[    1.091530] Write protecting the kernel read-only data: 36864k
[    1.092033] Freeing unused kernel image (text/rodata gap) memory: 416K
[    1.092107] Freeing unused kernel image (rodata/data gap) memory: 164K
[    1.097523] x86/mm: Checked W+X mappings: passed, no W+X pages found.
[    1.097526] rodata_test: all tests were successful
[    1.097530] Run /init as init process
[    1.097531]   with arguments:
[    1.097532]     /init
[    1.097532]   with environment:
[    1.097533]     HOME=3D/
[    1.097533]     TERM=3Dlinux
[    1.243227] systemd[1]: Successfully made /usr/ read-only.
[    1.243394] systemd[1]: systemd 258.1-1-arch running in system mode (+PA=
M +AUDIT -SELINUX +APPARMOR -IMA +IPE +SMACK +SECCOMP +GCRYPT +GNUTLS +OPEN=
SSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETU=
P +LIBCRYPTSETUP_PLUGINS +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM=
2 +BZIP2 +LZ4 +XZ +ZLIB +ZSTD +BPF_FRAMEWORK +BTF +XKBCOMMON +UTMP -SYSVINI=
T +LIBARCHIVE)
[    1.243398] systemd[1]: Detected architecture x86-64.
[    1.243399] systemd[1]: Running in initrd.
[    1.243501] fbcon: Taking over console
[    1.245917] Console: switching to colour frame buffer device 240x75
[    1.251522] systemd[1]: Initializing machine ID from random generator.
[    1.279194] systemd[1]: Queued start job for default target Initrd Defau=
lt Target.
[    1.293137] systemd[1]: Created slice Slice /system/systemd-cryptsetup.
[    1.293245] systemd[1]: Started Dispatch Password Requests to Console Di=
rectory Watch.
[    1.293286] systemd[1]: Expecting device /dev/disk/by-uuid/3fcd7043-2e72=
-42fb-84ef-a42a377fbebd...
[    1.293320] systemd[1]: Expecting device /dev/disk/by-uuid/4c822bc7-e8c9=
-4eaa-a480-99294e826ed1...
[    1.293366] systemd[1]: Reached target Path Units.
[    1.293392] systemd[1]: Reached target Slice Units.
[    1.293420] systemd[1]: Reached target Swaps.
[    1.293448] systemd[1]: Reached target Timer Units.
[    1.293522] systemd[1]: Listening on Journal Socket (/dev/log).
[    1.293581] systemd[1]: Listening on Journal Sockets.
[    1.293638] systemd[1]: Listening on udev Control Socket.
[    1.293683] systemd[1]: Listening on udev Kernel Socket.
[    1.293710] systemd[1]: Reached target Socket Units.
[    1.294173] systemd[1]: Starting Create List of Static Device Nodes...
[    1.294553] systemd[1]: Starting Check battery level during early boot...
[    1.297335] systemd[1]: Starting Journal Service...
[    1.297743] systemd[1]: Starting Load Kernel Modules...
[    1.300657] systemd[1]: Starting TPM PCR Barrier (initrd)...
[    1.301002] systemd[1]: Starting Create Static Device Nodes in /dev...
[    1.301334] systemd[1]: Starting Coldplug All udev Devices...
[    1.301685] systemd[1]: Finished Create List of Static Device Nodes.
[    1.307617] systemd[1]: Finished Create Static Device Nodes in /dev.
[    1.307780] systemd[1]: Reached target Preparation for Local File System=
s.
[    1.307814] systemd[1]: Reached target Local File Systems.
[    1.308293] systemd[1]: Starting Rule-based Manager for Device Events an=
d Files...
[    1.308836] systemd[1]: Finished Load Kernel Modules.
[    1.311364] systemd-journald[203]: Collecting audit messages is disabled.
[    1.313679] systemd[1]: Finished Check battery level during early boot.
[    1.314106] systemd[1]: Started Display Boot-Time Emergency Messages In =
Full Screen.
[    1.321127] systemd[1]: Started Rule-based Manager for Device Events and=
 Files.
[    1.331529] systemd[1]: Finished TPM PCR Barrier (initrd).
[    1.354969] systemd[1]: Started Journal Service.
[    1.441968] intel_vsec 0000:00:0a.0: enabling device (0000 -> 0002)
[    1.449043] rtsx_pci 0000:0b:00.0: enabling device (0000 -> 0002)
[    1.452462] Key type psk registered
[    1.461880] nvme 0000:04:00.0: platform quirk: setting simple suspend
[    1.461959] nvme nvme0: pci function 0000:04:00.0
[    1.465146] thinkpad_acpi: ThinkPad ACPI Extras v0.26
[    1.465149] thinkpad_acpi: http://ibm-acpi.sf.net/
[    1.465150] thinkpad_acpi: ThinkPad BIOS N4EET19W (1.05 ), EC N4EHT18W
[    1.465150] thinkpad_acpi: Lenovo ThinkPad P1 Gen 8, model 21Q8CTO1WW
[    1.465349] thinkpad_acpi: radio switch found; radios are enabled
[    1.465640] thinkpad_acpi: This ThinkPad has standard ACPI backlight bri=
ghtness control, supported by the ACPI video driver
[    1.465641] thinkpad_acpi: Disabling thinkpad-acpi brightness events by =
default...
[    1.467297] thinkpad_acpi: rfkill switch tpacpi_bluetooth_sw: radio is u=
nblocked
[    1.474447] nvme nvme0: D3 entry latency set to 10 seconds
[    1.478054] nvme nvme0: 16/0/0 default/read/poll queues
[    1.483127]  nvme0n1: p1 p2
[    1.489718] thinkpad_acpi: secondary fan control detected & enabled
[    1.497964] thinkpad_acpi: battery 1 registered (start 40, stop 80, beha=
viours: 0xb)
[    1.497973] ACPI: battery: new hook: ThinkPad Battery Extension
[    1.526092] input: ThinkPad Extra Buttons as /devices/platform/thinkpad_=
acpi/input/input5
[    1.533290] device-mapper: uevent: version 1.0.3
[    1.533344] device-mapper: ioctl: 4.50.0-ioctl (2025-04-28) initialised:=
 dm-devel@lists.linux.dev
[    1.547023] usb 3-4: new full-speed USB device number 2 using xhci_hcd
[    1.670737] i915 0000:00:02.0: [drm] Found meteorlake (device ID 7d51) i=
ntegrated display version 14.00 stepping D0
[    1.672043] i915 0000:00:02.0: [drm:intel_gt_common_init_early [i915]] W=
OPCM: 2048K
[    1.672233] i915 0000:00:02.0: [drm:intel_uc_init_early [i915]] GT0: ena=
ble_guc=3D3 (guc:yes submission:yes huc:no slpc:yes)
[    1.672462] i915 0000:00:02.0: [drm:intel_display_driver_early_probe [i9=
15]] PCH not involved in display, using fake PCH type 1026 for south display
[    1.672689] i915 0000:00:02.0: [drm:intel_dmc_wl_init [i915]] Sanitized =
enable_dmc_wl value: 0 (disabled)
[    1.672917] i915 0000:00:02.0: [drm:intel_gt_probe_all [i915]] GT0: Sett=
ing up Primary GT
[    1.673110] i915 0000:00:02.0: [drm:intel_gt_probe_all [i915]] GT1: Sett=
ing up Standalone Media GT
[    1.673260] i915 0000:00:02.0: [drm:intel_gt_common_init_early [i915]] W=
OPCM: 2048K
[    1.673399] i915 0000:00:02.0: [drm:intel_uc_init_early [i915]] GT1: ena=
ble_guc=3D3 (guc:yes submission:yes huc:yes slpc:yes)
[    1.673688] i915 0000:00:02.0: [drm:intel_display_device_info_runtime_in=
it [i915]] rawclk rate: 38400 kHz
[    1.675012] i915 0000:00:02.0: [drm:intel_engines_init_mmio [i915]] GT0:=
 vdbox enable: 0000, instances: 0000
[    1.675185] i915 0000:00:02.0: [drm:intel_engines_init_mmio [i915]] GT0:=
 vebox enable: 0000, instances: 0000
[    1.676701] i915 0000:00:02.0: [drm:intel_engines_init_mmio [i915]] GT1:=
 vdbox enable: 0005, instances: 0005
[    1.676837] i915 0000:00:02.0: [drm:intel_engines_init_mmio [i915]] GT1:=
 vebox enable: 0001, instances: 0001
[    1.677414] i915 0000:00:02.0: [drm:ggtt_probe_common [i915]] Using dire=
ct GSM access
[    1.677935] i915 0000:00:02.0: [drm:i915_ggtt_probe_hw [i915]] GGTT size=
 =3D 4096M
[    1.678068] i915 0000:00:02.0: [drm:i915_ggtt_probe_hw [i915]] GMADR siz=
e =3D 0M
[    1.678173] i915 0000:00:02.0: [drm:i915_ggtt_probe_hw [i915]] DSM size =
=3D 0M
[    1.678275] i915 0000:00:02.0: [drm] VT-d active for gfx access
[    1.690537] Console: switching to colour dummy device 80x25
[    1.698580] simple-framebuffer simple-framebuffer.0: [drm:drm_mode_rmfb_=
work_fn] Removing [FB:38] from all active usage due to RMFB ioctl
[    1.698594] simple-framebuffer simple-framebuffer.0: [drm:drm_framebuffe=
r_remove] Disabling [PLANE:33:plane-0] because [FB:38] is removed
[    1.698605] simple-framebuffer simple-framebuffer.0: [drm:drm_framebuffe=
r_remove] Disabling [PLANE:33:plane-0] because [FB:38] is removed
[    1.698609] simple-framebuffer simple-framebuffer.0: [drm:drm_framebuffe=
r_remove] Disabling [CRTC:35:crtc-0] because [FB:38] is removed
[    1.700049] simple-framebuffer simple-framebuffer.0: [drm:drm_client_rel=
ease] fbdev
[    1.700079] simple-framebuffer simple-framebuffer.0: [drm:drm_sysfs_conn=
ector_remove] [CONNECTOR:37:Unknown-1] removing connector from sysfs
[    1.700203] i915 0000:00:02.0: vgaarb: deactivate vga console
[    1.700247] i915 0000:00:02.0: [drm] Using Transparent Hugepages
[    1.700251] i915 0000:00:02.0: [drm:i915_gem_stolen_lmem_setup [i915]] U=
sing direct DSM access
[    1.700471] i915 0000:00:02.0: [drm:i915_gem_init_stolen [i915]] GEN6_ST=
OLEN_RESERVED =3D 0x0000000078400947
[    1.701961] i915 0000:00:02.0: [drm:i915_gem_init_stolen [i915]] Memory =
reserved for graphics device: 131072K, usable: 126976K
[    1.702125] i915 0000:00:02.0: [drm:intel_memory_regions_hw_probe [i915]=
] Memory region(0): system: 63569 MiB [mem 0x00000000-0xf851bafff], io: n/a
[    1.702306] i915 0000:00:02.0: [drm:intel_memory_regions_hw_probe [i915]=
] Memory region(6): stolen-local: 124 MiB [mem 0x00800000-0x083fffff], io: =
124 MiB [mem 0x70800000-0x783fffff]
[    1.702538] i915 0000:00:02.0: [drm:intel_opregion_setup [i915]] graphic=
 opregion physical addr: 0x63ef5018
[    1.702805] i915 0000:00:02.0: [drm:intel_opregion_setup [i915]] ACPI Op=
Region version 3.0.0
[    1.703008] i915 0000:00:02.0: [drm:intel_opregion_setup [i915]] Public =
ACPI methods supported
[    1.703210] i915 0000:00:02.0: [drm:intel_opregion_setup [i915]] ASLE su=
pported
[    1.703392] i915 0000:00:02.0: [drm:intel_opregion_setup [i915]] ASLE ex=
tension supported
[    1.703568] i915 0000:00:02.0: [drm:intel_opregion_setup [i915]] Mailbox=
 #2 for backlight present
[    1.703746] i915 0000:00:02.0: [drm:intel_opregion_setup [i915]] Found v=
alid VBT in ACPI OpRegion (RVDA)
[    1.703916] i915 0000:00:02.0: [drm:intel_dram_detect [i915]] DRAM type:=
 LPDDR5
[    1.704071] i915 0000:00:02.0: [drm:intel_dram_detect [i915]] Num qgv po=
ints 4
[    1.704201] i915 0000:00:02.0: [drm:intel_dram_detect [i915]] DRAM chann=
els: 8
[    1.704321] i915 0000:00:02.0: [drm:intel_dram_detect [i915]] Watermark =
level 0 adjustment needed: yes
[    1.704438] i915 0000:00:02.0: [drm:icl_get_qgv_points.constprop.0 [i915=
]] QGV 0: DCLK=3D3200 tRP=3D64 tRDPRE=3D40 tRAS=3D136 tRCD=3D64 tRC=3D200
[    1.704670] i915 0000:00:02.0: [drm:icl_get_qgv_points.constprop.0 [i915=
]] QGV 1: DCLK=3D4800 tRP=3D88 tRDPRE=3D72 tRAS=3D208 tRCD=3D88 tRC=3D296
[    1.704887] i915 0000:00:02.0: [drm:icl_get_qgv_points.constprop.0 [i915=
]] QGV 2: DCLK=3D6400 tRP=3D120 tRDPRE=3D80 tRAS=3D16 tRCD=3D120 tRC=3D136
[    1.705103] i915 0000:00:02.0: [drm:icl_get_qgv_points.constprop.0 [i915=
]] QGV 3: DCLK=3D7467 tRP=3D136 tRDPRE=3D88 tRAS=3D64 tRCD=3D136 tRC=3D200
[    1.705301] i915 0000:00:02.0: [drm:tgl_get_bw_info.isra.0 [i915]] BW0 /=
 QGV 0: num_planes=3D0 deratedbw=3D28913 peakbw: 51200
[    1.705495] i915 0000:00:02.0: [drm:tgl_get_bw_info.isra.0 [i915]] BW0 /=
 QGV 1: num_planes=3D0 deratedbw=3D36260 peakbw: 76800
[    1.705685] i915 0000:00:02.0: [drm:tgl_get_bw_info.isra.0 [i915]] BW0 /=
 QGV 2: num_planes=3D0 deratedbw=3D38000 peakbw: 102400
[    1.705872] i915 0000:00:02.0: [drm:tgl_get_bw_info.isra.0 [i915]] BW0 /=
 QGV 3: num_planes=3D0 deratedbw=3D38000 peakbw: 119472
[    1.706058] i915 0000:00:02.0: [drm:tgl_get_bw_info.isra.0 [i915]] BW1 /=
 QGV 0: num_planes=3D0 deratedbw=3D35532 peakbw: 51200
[    1.706241] i915 0000:00:02.0: [drm:tgl_get_bw_info.isra.0 [i915]] BW1 /=
 QGV 1: num_planes=3D0 deratedbw=3D38000 peakbw: 76800
[    1.706420] i915 0000:00:02.0: [drm:tgl_get_bw_info.isra.0 [i915]] BW1 /=
 QGV 2: num_planes=3D0 deratedbw=3D38000 peakbw: 102400
[    1.706597] i915 0000:00:02.0: [drm:tgl_get_bw_info.isra.0 [i915]] BW1 /=
 QGV 3: num_planes=3D0 deratedbw=3D38000 peakbw: 119472
[    1.706774] i915 0000:00:02.0: [drm:tgl_get_bw_info.isra.0 [i915]] BW2 /=
 QGV 0: num_planes=3D0 deratedbw=3D38000 peakbw: 51200
[    1.706950] i915 0000:00:02.0: [drm:tgl_get_bw_info.isra.0 [i915]] BW2 /=
 QGV 1: num_planes=3D0 deratedbw=3D38000 peakbw: 76800
[    1.707192] i915 0000:00:02.0: [drm:tgl_get_bw_info.isra.0 [i915]] BW2 /=
 QGV 2: num_planes=3D0 deratedbw=3D38000 peakbw: 102400
[    1.707414] i915 0000:00:02.0: [drm:tgl_get_bw_info.isra.0 [i915]] BW2 /=
 QGV 3: num_planes=3D0 deratedbw=3D38000 peakbw: 119472
[    1.707599] i915 0000:00:02.0: [drm:tgl_get_bw_info.isra.0 [i915]] BW3 /=
 QGV 0: num_planes=3D0 deratedbw=3D38000 peakbw: 51200
[    1.707769] i915 0000:00:02.0: [drm:tgl_get_bw_info.isra.0 [i915]] BW3 /=
 QGV 1: num_planes=3D0 deratedbw=3D38000 peakbw: 76800
[    1.707939] i915 0000:00:02.0: [drm:tgl_get_bw_info.isra.0 [i915]] BW3 /=
 QGV 2: num_planes=3D0 deratedbw=3D38000 peakbw: 102400
[    1.708121] i915 0000:00:02.0: [drm:tgl_get_bw_info.isra.0 [i915]] BW3 /=
 QGV 3: num_planes=3D0 deratedbw=3D38000 peakbw: 119472
[    1.708291] i915 0000:00:02.0: [drm:tgl_get_bw_info.isra.0 [i915]] BW4 /=
 QGV 0: num_planes=3D0 deratedbw=3D38000 peakbw: 51200
[    1.708459] i915 0000:00:02.0: [drm:tgl_get_bw_info.isra.0 [i915]] BW4 /=
 QGV 1: num_planes=3D0 deratedbw=3D38000 peakbw: 76800
[    1.708627] i915 0000:00:02.0: [drm:tgl_get_bw_info.isra.0 [i915]] BW4 /=
 QGV 2: num_planes=3D0 deratedbw=3D38000 peakbw: 102400
[    1.708794] i915 0000:00:02.0: [drm:tgl_get_bw_info.isra.0 [i915]] BW4 /=
 QGV 3: num_planes=3D0 deratedbw=3D38000 peakbw: 119472
[    1.708960] i915 0000:00:02.0: [drm:tgl_get_bw_info.isra.0 [i915]] BW5 /=
 QGV 0: num_planes=3D0 deratedbw=3D38000 peakbw: 51200
[    1.709137] i915 0000:00:02.0: [drm:tgl_get_bw_info.isra.0 [i915]] BW5 /=
 QGV 1: num_planes=3D0 deratedbw=3D38000 peakbw: 76800
[    1.709303] i915 0000:00:02.0: [drm:tgl_get_bw_info.isra.0 [i915]] BW5 /=
 QGV 2: num_planes=3D0 deratedbw=3D38000 peakbw: 102400
[    1.709468] i915 0000:00:02.0: [drm:tgl_get_bw_info.isra.0 [i915]] BW5 /=
 QGV 3: num_planes=3D0 deratedbw=3D38000 peakbw: 119472
[    1.712193] i915 0000:00:02.0: [drm:intel_bios_init [i915]] Set default =
to SSC at 120000 kHz
[    1.712440] i915 0000:00:02.0: [drm:intel_bios_init [i915]] VBT signatur=
e "$VBT METEORLAKE     ", BDB version 261
[    1.712613] i915 0000:00:02.0: [drm:intel_bios_init [i915]] Found BDB bl=
ock 1 (size 10, min size 7)
[    1.712753] i915 0000:00:02.0: [drm:intel_bios_init [i915]] Found BDB bl=
ock 2 (size 405, min size 5)
[    1.712878] i915 0000:00:02.0: [drm:intel_bios_init [i915]] Found BDB bl=
ock 9 (size 100, min size 100)
[    1.712995] i915 0000:00:02.0: [drm:intel_bios_init [i915]] Found BDB bl=
ock 12 (size 19, min size 19)
[    1.713158] i915 0000:00:02.0: [drm:intel_bios_init [i915]] Found BDB bl=
ock 27 (size 850, min size 848)
[    1.713301] i915 0000:00:02.0: [drm:intel_bios_init [i915]] Found BDB bl=
ock 40 (size 34, min size 34)
[    1.713443] i915 0000:00:02.0: [drm:intel_bios_init [i915]] Generating L=
FP data table pointers
[    1.713580] i915 0000:00:02.0: [drm:intel_bios_init [i915]] Found BDB bl=
ock 41 (size 148, min size 148)
[    1.713714] i915 0000:00:02.0: [drm:intel_bios_init [i915]] Found BDB bl=
ock 42 (size 1366, min size 1366)
[    1.713824] i915 0000:00:02.0: [drm:intel_bios_init [i915]] Found BDB bl=
ock 43 (size 305, min size 305)
[    1.713931] i915 0000:00:02.0: [drm:intel_bios_init [i915]] Found BDB bl=
ock 44 (size 136, min size 136)
[    1.714039] i915 0000:00:02.0: [drm:intel_bios_init [i915]] Found BDB bl=
ock 52 (size 822, min size 822)
[    1.714148] i915 0000:00:02.0: [drm:intel_bios_init [i915]] Found BDB bl=
ock 56 (size 210, min size 210)
[    1.714253] i915 0000:00:02.0: [drm:intel_bios_init [i915]] BDB_GENERAL_=
FEATURES int_tv_support 0 int_crt_support 0 lvds_use_ssc 0 lvds_ssc_freq 12=
0000 display_clock_mode 1 fdi_rx_polarity_inverted 0
[    1.714359] i915 0000:00:02.0: [drm:intel_bios_init [i915]] crt_ddc_bus_=
pin: 2
[    1.714462] i915 0000:00:02.0: [drm:intel_bios_init [i915]] Expected chi=
ld device config size for VBT version 261 not known; assuming 40
[    1.714564] i915 0000:00:02.0: [drm:intel_bios_init [i915]] Found VBT ch=
ild device with type 0x1806
[    1.714667] i915 0000:00:02.0: [drm:intel_bios_init [i915]] Found VBT ch=
ild device with type 0x60d6
[    1.714768] i915 0000:00:02.0: [drm:intel_bios_init [i915]] Found VBT ch=
ild device with type 0x68c6
[    1.714871] i915 0000:00:02.0: [drm:intel_bios_init [i915]] Found VBT ch=
ild device with type 0x68c6
[    1.714973] i915 0000:00:02.0: [drm:intel_bios_init [i915]] Found VBT ch=
ild device with type 0x68c6
[    1.715087] i915 0000:00:02.0: [drm:intel_bios_init [i915]] Found VBT ch=
ild device with type 0x68c6
[    1.715187] i915 0000:00:02.0: [drm:intel_bios_init [i915]] Skipping SDV=
O device mapping
[    1.715285] i915 0000:00:02.0: [drm:intel_bios_init [i915]] Port A VBT i=
nfo: CRT:0 DVI:0 HDMI:0 DP:1 eDP:1 DSI:0 DP++:0 LSPCON:0 USB-Type-C:0 TBT:0=
 DSC:0
[    1.715385] i915 0000:00:02.0: [drm:intel_bios_init [i915]] Port B VBT i=
nfo: CRT:0 DVI:1 HDMI:1 DP:1 eDP:0 DSI:0 DP++:1 LSPCON:0 USB-Type-C:0 TBT:0=
 DSC:0
[    1.715492] i915 0000:00:02.0: [drm:intel_bios_init [i915]] Port B VBT H=
DMI max TMDS clock: 594000 kHz
[    1.715617] i915 0000:00:02.0: [drm:intel_bios_init [i915]] Port D VBT i=
nfo: CRT:0 DVI:0 HDMI:0 DP:1 eDP:0 DSI:0 DP++:0 LSPCON:0 USB-Type-C:1 TBT:1=
 DSC:0
[    1.715723] i915 0000:00:02.0: [drm:intel_bios_init [i915]] Port E VBT i=
nfo: CRT:0 DVI:0 HDMI:0 DP:1 eDP:0 DSI:0 DP++:0 LSPCON:0 USB-Type-C:1 TBT:1=
 DSC:0
[    1.715820] i915 0000:00:02.0: [drm:intel_bios_init [i915]] Port F VBT i=
nfo: CRT:0 DVI:0 HDMI:0 DP:1 eDP:0 DSI:0 DP++:0 LSPCON:0 USB-Type-C:0 TBT:0=
 DSC:0
[    1.715916] i915 0000:00:02.0: [drm:intel_bios_init [i915]] Port G VBT i=
nfo: CRT:0 DVI:0 HDMI:0 DP:1 eDP:0 DSI:0 DP++:0 LSPCON:0 USB-Type-C:0 TBT:0=
 DSC:0
[    1.716019] i915 0000:00:02.0: [drm:intel_power_domains_init [i915]] All=
owed DC state mask 4000000a
[    1.716230] i915 0000:00:02.0: [drm:gen9_set_dc_state.part.0 [i915]] Set=
ting DC state from 00 to 00
[    1.716440] i915 0000:00:02.0: [drm:intel_power_well_enable [i915]] enab=
ling PW_1
[    1.716641] i915 0000:00:02.0: [drm:intel_cdclk_init_hw [i915]] Current =
CDCLK 307200 kHz, VCO 614400 kHz, ref 38400 kHz, bypass 19200 kHz, voltage =
level 0
[    1.728197] i915 0000:00:02.0: [drm:gen9_dbuf_slices_update [i915]] Upda=
ting dbuf slices to 0xf
[    1.728510] i915 0000:00:02.0: [drm:icl_display_core_init [i915]] Unknow=
n memory configuration; disabling address buddy logic.
[    1.728697] i915 0000:00:02.0: [drm:intel_power_well_enable [i915]] enab=
ling always-on
[    1.728861] i915 0000:00:02.0: [drm:intel_power_well_enable [i915]] enab=
ling DC_off
[    1.729010] i915 0000:00:02.0: [drm:gen9_set_dc_state.part.0 [i915]] Set=
ting DC state from 00 to 00
[    1.729190] i915 0000:00:02.0: [drm:intel_power_well_enable [i915]] enab=
ling PW_2
[    1.729331] i915 0000:00:02.0: vgaarb: VGA decodes changed: olddecodes=
=3Dio+mem,decodes=3Dnone:owns=3Dio+mem
[    1.729336] i915 0000:00:02.0: [drm:intel_power_well_enable [i915]] enab=
ling PW_A
[    1.729467] i915 0000:00:02.0: [drm:intel_power_well_enable [i915]] enab=
ling PW_B
[    1.729598] i915 0000:00:02.0: [drm:intel_power_well_enable [i915]] enab=
ling PW_C
[    1.729720] i915 0000:00:02.0: [drm:intel_power_well_enable [i915]] enab=
ling PW_D
[    1.729932] i915 0000:00:02.0: [drm:intel_dmc_init [i915]] Loading i915/=
mtl_dmc.bin
[    1.730426] i915 0000:00:02.0: [drm:dmc_load_work_fn [i915]] DMC 0:
[    1.730623] i915 0000:00:02.0: [drm:dmc_load_work_fn [i915]]  mmio[0]: 0=
x8f074 =3D 0x86fc0
[    1.730777] i915 0000:00:02.0: [drm:dmc_load_work_fn [i915]]  mmio[1]: 0=
x8f034 =3D 0xc003b400 (EVT_CTL)
[    1.730917] i915 0000:00:02.0: [drm:dmc_load_work_fn [i915]]  mmio[2]: 0=
x8f004 =3D 0x42c0408 (EVT_HTP)
[    1.731058] i915 0000:00:02.0: [drm:dmc_load_work_fn [i915]]  mmio[3]: 0=
x8f038 =3D 0xc003b200 (EVT_CTL)
[    1.731184] i915 0000:00:02.0: [drm:dmc_load_work_fn [i915]]  mmio[4]: 0=
x8f008 =3D 0x534052f4 (EVT_HTP)
[    1.731313] i915 0000:00:02.0: [drm:dmc_load_work_fn [i915]] DMC 1:
[    1.731328] i915 0000:00:02.0: [drm:intel_fbc_init [i915]] Sanitized ena=
ble_fbc value: 1
[    1.731436] i915 0000:00:02.0: [drm:dmc_load_work_fn [i915]]  mmio[0]: 0=
x5f074 =3D 0x96fc0
[    1.731555] i915 0000:00:02.0: [drm:dmc_load_work_fn [i915]]  mmio[1]: 0=
x5f034 =3D 0xc003df00 (EVT_CTL) (disabling)
[    1.731673] i915 0000:00:02.0: [drm:dmc_load_work_fn [i915]]  mmio[2]: 0=
x5f004 =3D 0x212c20f4 (EVT_HTP)
[    1.731797] i915 0000:00:02.0: [drm:dmc_load_work_fn [i915]]  mmio[3]: 0=
x5f038 =3D 0xc003e000 (EVT_CTL) (disabling)
[    1.731806] i915 0000:00:02.0: [drm:skl_wm_init [i915]] SAGV supported: =
yes, original SAGV block time: 10 us
[    1.731919] i915 0000:00:02.0: [drm:dmc_load_work_fn [i915]]  mmio[4]: 0=
x5f008 =3D 0x222021e8 (EVT_HTP)
[    1.732040] i915 0000:00:02.0: [drm:dmc_load_work_fn [i915]]  mmio[5]: 0=
x5f03c =3D 0xc0032c00 (EVT_CTL) (disabling)
[    1.732011] i915 0000:00:02.0: [drm:intel_print_wm_latency [i915]] Gen9 =
Plane WM0 latency 7 (7.0 usec)
[    1.732153] i915 0000:00:02.0: [drm:dmc_load_work_fn [i915]]  mmio[6]: 0=
x5f00c =3D 0x23f422dc (EVT_HTP)
[    1.732206] i915 0000:00:02.0: [drm:intel_print_wm_latency [i915]] Gen9 =
Plane WM1 latency 88 (88.0 usec)
[    1.732263] i915 0000:00:02.0: [drm:dmc_load_work_fn [i915]]  mmio[7]: 0=
x5f040 =3D 0xc0033100 (EVT_CTL) (disabling)
[    1.732371] i915 0000:00:02.0: [drm:dmc_load_work_fn [i915]]  mmio[8]: 0=
x5f010 =3D 0x26ec26c0 (EVT_HTP)
[    1.732358] i915 0000:00:02.0: [drm:intel_print_wm_latency [i915]] Gen9 =
Plane WM2 latency 89 (89.0 usec)
[    1.732478] i915 0000:00:02.0: [drm:dmc_load_work_fn [i915]] DMC 2:
[    1.732495] i915 0000:00:02.0: [drm:intel_print_wm_latency [i915]] Gen9 =
Plane WM3 latency 99 (99.0 usec)
[    1.732585] i915 0000:00:02.0: [drm:dmc_load_work_fn [i915]]  mmio[0]: 0=
x5f474 =3D 0x9efc0
[    1.732651] i915 0000:00:02.0: [drm:intel_print_wm_latency [i915]] Gen9 =
Plane WM4 latency 100 (100.0 usec)
[    1.732698] i915 0000:00:02.0: [drm:dmc_load_work_fn [i915]]  mmio[1]: 0=
x5f434 =3D 0xc003df00 (EVT_CTL) (disabling)
[    1.732792] i915 0000:00:02.0: [drm:intel_print_wm_latency [i915]] Gen9 =
Plane WM5 latency 154 (154.0 usec)
[    1.732808] i915 0000:00:02.0: [drm:dmc_load_work_fn [i915]]  mmio[2]: 0=
x5f404 =3D 0xa618a5e0 (EVT_HTP)
[    1.732914] i915 0000:00:02.0: [drm:dmc_load_work_fn [i915]]  mmio[3]: 0=
x5f438 =3D 0xc003e000 (EVT_CTL) (disabling)
[    1.733041] i915 0000:00:02.0: [drm:dmc_load_work_fn [i915]]  mmio[4]: 0=
x5f408 =3D 0xa70ca6d4 (EVT_HTP)
[    1.733177] i915 0000:00:02.0: [drm:dmc_load_work_fn [i915]]  mmio[5]: 0=
x5f43c =3D 0xc0032c00 (EVT_CTL) (disabling)
[    1.733147] i915 0000:00:02.0: [drm:intel_display_driver_probe_nogem [i9=
15]] 4 display pipes available.
[    1.733311] i915 0000:00:02.0: [drm:dmc_load_work_fn [i915]]  mmio[6]: 0=
x5f40c =3D 0xa8e0a7c8 (EVT_HTP)
[    1.733431] i915 0000:00:02.0: [drm:dmc_load_work_fn [i915]]  mmio[7]: 0=
x5f440 =3D 0xc0033100 (EVT_CTL) (disabling)
[    1.733535] i915 0000:00:02.0: [drm:dmc_load_work_fn [i915]]  mmio[8]: 0=
x5f410 =3D 0xabd8abac (EVT_HTP)
[    1.733641] i915 0000:00:02.0: [drm:dmc_load_work_fn [i915]] DMC 3:
[    1.733744] i915 0000:00:02.0: [drm:dmc_load_work_fn [i915]]  mmio[0]: 0=
x5f874 =3D 0x53fc0
[    1.733849] i915 0000:00:02.0: [drm:dmc_load_work_fn [i915]]  mmio[1]: 0=
x5f83c =3D 0xc0032c00 (EVT_CTL) (disabling)
[    1.733951] i915 0000:00:02.0: [drm:dmc_load_work_fn [i915]]  mmio[2]: 0=
x5f80c =3D 0x24a02388 (EVT_HTP)
[    1.733912] i915 0000:00:02.0: [drm:intel_cdclk_read_hw [i915]] Current =
CDCLK 307200 kHz, VCO 614400 kHz, ref 38400 kHz, bypass 19200 kHz, voltage =
level 0
[    1.734066] i915 0000:00:02.0: [drm:dmc_load_work_fn [i915]]  mmio[3]: 0=
x5f840 =3D 0xc0033100 (EVT_CTL) (disabling)
[    1.734172] i915 0000:00:02.0: [drm:dmc_load_work_fn [i915]]  mmio[4]: 0=
x5f810 =3D 0x2798276c (EVT_HTP)
[    1.734152] i915 0000:00:02.0: [drm:intel_update_max_cdclk [i915]] Max C=
D clock rate: 652800 kHz
[    1.734280] i915 0000:00:02.0: [drm:dmc_load_work_fn [i915]] DMC 4:
[    1.734409] i915 0000:00:02.0: [drm:dmc_load_work_fn [i915]]  mmio[0]: 0=
x5fc74 =3D 0x5afc0
[    1.734368] i915 0000:00:02.0: [drm:intel_display_driver_probe_nogem [i9=
15]] Max dotclock rate: 1305600 kHz
[    1.734512] i915 0000:00:02.0: [drm:dmc_load_work_fn [i915]]  mmio[1]: 0=
x5fc3c =3D 0xc0032c00 (EVT_CTL) (disabling)
[    1.734612] i915 0000:00:02.0: [drm:dmc_load_work_fn [i915]]  mmio[2]: 0=
x5fc0c =3D 0x94a09388 (EVT_HTP)
[    1.734593] i915 0000:00:02.0: [drm:intel_dp_aux_ch [i915]] [ENCODER:261=
:DDI A/PHY A] Using AUX CH A (VBT)
[    1.734713] i915 0000:00:02.0: [drm:dmc_load_work_fn [i915]]  mmio[3]: 0=
x5fc40 =3D 0xc0033100 (EVT_CTL) (disabling)
[    1.734814] i915 0000:00:02.0: [drm:dmc_load_work_fn [i915]]  mmio[4]: 0=
x5fc10 =3D 0x9798976c (EVT_HTP)
[    1.734795] i915 0000:00:02.0: [drm:intel_dp_init_connector [i915]] Addi=
ng eDP connector on [ENCODER:261:DDI A/PHY A]
[    1.734986] i915 0000:00:02.0: [drm:intel_bios_init_panel [i915]] Panel =
type (VBT): 255
[    1.735217] i915 0000:00:02.0: [drm:intel_bios_init_panel [i915]] Select=
ed panel type (fallback): -1
[    1.735427] i915 0000:00:02.0: [drm:intel_pps_init [i915]] [ENCODER:261:=
DDI A/PHY A] initial power sequencer: PPS 0
[    1.735630] i915 0000:00:02.0: [drm:intel_pps_dump_state [i915]] bios po=
wer_up 1 backlight_on 1 backlight_off 1 power_down 500 power_cycle 5000
[    1.735805] i915 0000:00:02.0: [drm:intel_pps_dump_state [i915]] spec po=
wer_up 2100 backlight_on 500 backlight_off 500 power_down 5000 power_cycle =
5100
[    1.735975] i915 0000:00:02.0: [drm:pps_init_delays [i915]] panel power =
up delay 1, power down delay 50, power cycle delay 500
[    1.736148] i915 0000:00:02.0: [drm:pps_init_delays [i915]] backlight on=
 delay 1, off delay 1
[    1.736354] i915 0000:00:02.0: [drm:pps_init_registers [i915]] panel pow=
er sequencer register settings: PP_ON 0x10001, PP_OFF 0x1f40001, PP_DIV 0x60
[    1.736561] i915 0000:00:02.0: [drm:intel_power_well_enable [i915]] enab=
ling AUX_A
[    1.740170] i915 0000:00:02.0: [drm:intel_pps_vdd_on_unlocked [i915]] [E=
NCODER:261:DDI A/PHY A] PPS 0 turning VDD on
[    1.740418] i915 0000:00:02.0: [drm:intel_pps_vdd_on_unlocked [i915]] [E=
NCODER:261:DDI A/PHY A] PPS 0 PP_STATUS: 0x80000008 PP_CONTROL: 0x0000006f
[    1.742937] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x0002e AUX -> (ret=3D  1) 03
[    1.743365] i915 0000:00:02.0: [drm] Finished loading DMC firmware i915/=
mtl_dmc.bin (v2.23)
[    1.743697] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x00000 AUX -> (ret=3D 15) 14 1e c4 c1 00 00 01 c0 02=
 00 02 00 00 0b 80
[    1.744034] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x02200 AUX -> (ret=3D 15) 14 1e c4 c1 00 00 01 c0 02=
 00 02 00 00 0b 80
[    1.744048] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX A/DDI A/PHY A: DPCD: 14 1e c4 c1 00 00 01 c0 02 00 02 00 00 0b =
80
[    1.744429] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x00400 AUX -> (ret=3D 12) 38 ec 11 00 00 00 00 00 00=
 00 00 00
[    1.744443] i915 0000:00:02.0: [drm:drm_dp_dump_desc [drm_display_helper=
]] AUX A/DDI A/PHY A: DP sink: OUI 38-ec-11 dev-ID  HW-rev 0.0 SW-rev 0.0 q=
uirks 0x0000
[    1.744656] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x02210 AUX -> (ret=3D  1) 08
[    1.744863] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x00700 AUX -> (ret=3D  5) 05 8b 87 04 1e
[    1.744872] i915 0000:00:02.0: [drm:intel_dp_init_connector [i915]] eDP =
DPCD: 05 8b 87 04 1e
[    1.745248] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x00300 AUX -> (ret=3D  3) 00 aa 01
[    1.745452] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x00070 AUX -> (ret=3D  2) 03 3a
[    1.745818] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x000b0 AUX -> (ret=3D  7) 00 00 00 00 00 00 00
[    1.745828] i915 0000:00:02.0: [drm:intel_psr_init_dpcd [i915]] eDP pane=
l supports PSR version 3
[    1.746227] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x02009 AUX -> (ret=3D  1) 01
[    1.746238] i915 0000:00:02.0: [drm:intel_psr_init_dpcd [i915]] PSR2 sup=
ported
[    1.746607] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x00072 AUX -> (ret=3D  2) 00 0f
[    1.746810] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x00074 AUX -> (ret=3D  1) 04
[    1.747176] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x00010 AUX -> (ret=3D 16) a4 1f 30 2a 76 2f bc 34 48=
 3f 60 54 78 69 34 9e
[    1.747548] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x00060 AUX -> (ret=3D 16) 00 11 00 76 0b 01 01 80 00=
 01 06 66 08 00 00 00
[    1.747558] i915 0000:00:02.0: [drm:intel_dp_init_connector [i915]] DSC =
DPCD: 00 11 00 76 0b 01 01 80 00 01 06 66 08 00 00 00
[    1.755943] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:262:eDP-1] Supported Monitor Refresh rate range is 40 Hz - 60 Hz
[    1.755950] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:262:eDP-1] Assigning EDID-1.4 digital sink color depth as 10 bpc.
[    1.755953] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:262:eDP-1] ELD monitor=20
[    1.755956] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:262:eDP-1] ELD size 20, SAD count 0
[    1.755989] i915 0000:00:02.0: [drm:intel_bios_init_panel [i915]] Panel =
type (VBT): 255
[    1.756297] i915 0000:00:02.0: [drm:pnpid_get_panel_type [i915]] EDID ma=
nufacturer name: AUO, product code: 11941, serial number: 0, week/year of m=
anufacture: 28/2022
[    1.756532] i915 0000:00:02.0: [drm:pnpid_get_panel_type [i915]] EDID ra=
w product id: 06 af a5 2e 00 00 00 00 1c 20
[    1.756743] i915 0000:00:02.0: [drm:intel_bios_init_panel [i915]] Panel =
type (fallback): 0
[    1.756935] i915 0000:00:02.0: [drm:intel_bios_init_panel [i915]] Select=
ed panel type (fallback): 0
[    1.757132] i915 0000:00:02.0: [drm:intel_bios_init_panel [i915]] DRRS s=
upported mode is seamless
[    1.757319] i915 0000:00:02.0: [drm:intel_bios_init_panel [i915]] Found =
panel mode in BIOS VBT legacy lfp table: "640x480": 63 25180 640 648 744 78=
4 480 482 484 509 0x8 0xa
[    1.757504] i915 0000:00:02.0: [drm:intel_bios_init_panel [i915]] VBT in=
itial LVDS value 300
[    1.757690] i915 0000:00:02.0: [drm:intel_bios_init_panel [i915]] Panel =
manufacturer name: LEN, product code: 16719, serial number: 0, year of manu=
facture: 2024
[    1.757876] i915 0000:00:02.0: [drm:intel_bios_init_panel [i915]] Panel =
name: LFP_OLED
[    1.758063] i915 0000:00:02.0: [drm:intel_bios_init_panel [i915]] Seamle=
ss DRRS min refresh rate: 0 Hz
[    1.758248] i915 0000:00:02.0: [drm:intel_bios_init_panel [i915]] VBT ba=
cklight PWM modulation frequency 990 Hz, active high, min brightness 3, lev=
el 70, controller 0
[    1.758431] i915 0000:00:02.0: [drm:intel_panel_add_edid_fixed_modes [i9=
15]] [CONNECTOR:262:eDP-1] using preferred EDID fixed mode: "3840x2400": 60=
 605000 3840 3888 3920 4000 2400 2403 2408 2520 0x48 0xa
[    1.758766] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x007a4 AUX -> (ret=3D  1) 00
[    1.758773] i915 0000:00:02.0: [drm:intel_dp_wait_source_oui [i915]] [CO=
NNECTOR:262:eDP-1] Performing OUI wait (0 ms)
[    1.759188] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x00340 AUX -> (ret=3D  4) 01 d7 00 00
[    1.759194] i915 0000:00:02.0: [drm:intel_dp_aux_init_backlight_funcs [i=
915]] [CONNECTOR:262:eDP-1] Detected Intel HDR backlight interface version 1
[    1.759277] i915 0000:00:02.0: [drm:intel_dp_aux_init_backlight_funcs [i=
915]] [CONNECTOR:262:eDP-1] Using Intel proprietary eDP backlight controls
[    1.759352] i915 0000:00:02.0: [drm:intel_panel_init [i915]] [CONNECTOR:=
262:eDP-1] DRRS type: none
[    1.759432] i915 0000:00:02.0: [drm:intel_dp_aux_hdr_setup_backlight [i9=
15]] [CONNECTOR:262:eDP-1] SDR backlight is controlled through PWM
[    1.759523] i915 0000:00:02.0: [drm:cnp_setup_backlight [i915]] [CONNECT=
OR:262:eDP-1] Using native PCH PWM for backlight control (controller=3D0)
[    1.759809] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX A/DDI A/PHY A: 0x0034a AUX <- (ret=3D  4) 00 00 20 03
[    1.759816] i915 0000:00:02.0: [drm:intel_dp_aux_hdr_setup_backlight [i9=
15]] [CONNECTOR:262:eDP-1] Using AUX HDR interface for backlight control (r=
ange 0..800)
[    1.760075] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x00344 AUX -> (ret=3D  1) 00
[    1.760092] i915 0000:00:02.0: [drm:intel_backlight_setup [i915]] [CONNE=
CTOR:262:eDP-1] backlight initialized, enabled, brightness 213/800
[    1.760187] i915 0000:00:02.0: [drm:intel_pps_dump_state [i915]] bios po=
wer_up 1 backlight_on 1 backlight_off 1 power_down 500 power_cycle 5000
[    1.760266] i915 0000:00:02.0: [drm:intel_pps_dump_state [i915]] vbt pow=
er_up 2000 backlight_on 500 backlight_off 2000 power_down 500 power_cycle 5=
000
[    1.760339] i915 0000:00:02.0: [drm:intel_pps_dump_state [i915]] spec po=
wer_up 2100 backlight_on 500 backlight_off 500 power_down 5000 power_cycle =
5100
[    1.760410] i915 0000:00:02.0: [drm:pps_init_delays [i915]] panel power =
up delay 200, power down delay 50, power cycle delay 500
[    1.760478] i915 0000:00:02.0: [drm:pps_init_delays [i915]] backlight on=
 delay 50, off delay 200
[    1.760594] i915 0000:00:02.0: [drm:pps_init_registers [i915]] panel pow=
er sequencer register settings: PP_ON 0x7d00001, PP_OFF 0x1f40001, PP_DIV 0=
x60
[    1.760685] i915 0000:00:02.0: [drm:intel_dp_aux_ch [i915]] [ENCODER:270=
:DDI B/PHY B] Using AUX CH B (VBT)
[    1.760762] i915 0000:00:02.0: [drm:intel_dp_init_connector [i915]] Addi=
ng DP connector on [ENCODER:270:DDI B/PHY B]
[    1.760847] i915 0000:00:02.0: [drm:intel_hdmi_init_connector [i915]] Ad=
ding HDMI connector on [ENCODER:270:DDI B/PHY B]
[    1.760920] i915 0000:00:02.0: [drm:intel_hdmi_init_connector [i915]] [E=
NCODER:270:DDI B/PHY B] Using DDC pin 0x2 (VBT)
[    1.760995] i915 0000:00:02.0: [drm:intel_dp_aux_ch [i915]] [ENCODER:288=
:DDI TC1/PHY TC1] Using AUX CH USBC1 (VBT)
[    1.761097] i915 0000:00:02.0: [drm:tc_phy_get_current_mode [i915]] Port=
 D/TC#1: PHY mode: tbt-alt (ready: yes, owned: no, HPD: disconnected)
[    1.761220] i915 0000:00:02.0: [drm:intel_dp_init_connector [i915]] Addi=
ng DP connector on [ENCODER:288:DDI TC1/PHY TC1]
[    1.761297] i915 0000:00:02.0: [drm:intel_dp_aux_ch [i915]] [ENCODER:297=
:DDI TC2/PHY TC2] Using AUX CH USBC2 (VBT)
[    1.761390] i915 0000:00:02.0: [drm:tc_phy_get_current_mode [i915]] Port=
 E/TC#2: PHY mode: tbt-alt (ready: yes, owned: no, HPD: disconnected)
[    1.761511] i915 0000:00:02.0: [drm:intel_dp_init_connector [i915]] Addi=
ng DP connector on [ENCODER:297:DDI TC2/PHY TC2]
[    1.761582] i915 0000:00:02.0: [drm:intel_dp_aux_ch [i915]] [ENCODER:306=
:DDI TC3/PHY TC3] Using AUX CH USBC3 (VBT)
[    1.761674] i915 0000:00:02.0: [drm:tc_phy_get_current_mode [i915]] Port=
 F/TC#3: PHY mode: disconnected (ready: yes, owned: no, HPD: disconnected)
[    1.761828] i915 0000:00:02.0: [drm:intel_tc_port_update_mode [i915]] Po=
rt F/TC#3: TC port mode reset (disconnected -> legacy)
[    1.761922] i915 0000:00:02.0: [drm:intel_dp_init_connector [i915]] Addi=
ng DP connector on [ENCODER:306:DDI TC3/PHY TC3]
[    1.762010] i915 0000:00:02.0: [drm:intel_dp_aux_ch [i915]] [ENCODER:315=
:DDI TC4/PHY TC4] Using AUX CH USBC4 (VBT)
[    1.762118] i915 0000:00:02.0: [drm:tc_phy_get_current_mode [i915]] Port=
 G/TC#4: PHY mode: disconnected (ready: yes, owned: no, HPD: disconnected)
[    1.762250] i915 0000:00:02.0: [drm:intel_tc_port_update_mode [i915]] Po=
rt G/TC#4: TC port mode reset (disconnected -> legacy)
[    1.762318] i915 0000:00:02.0: [drm:intel_dp_init_connector [i915]] Addi=
ng DP connector on [ENCODER:315:DDI TC4/PHY TC4]
[    1.762436] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [CRTC:88:pipe A] hw state readout: enabled
[    1.762526] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [CRTC:145:pipe B] hw state readout: disabled
[    1.762613] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [CRTC:202:pipe C] hw state readout: disabled
[    1.762698] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [CRTC:259:pipe D] hw state readout: disabled
[    1.762771] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:33:plane 1A] hw state readout: enabled, pipe A
[    1.762846] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:43:plane 2A] hw state readout: disabled, pipe A
[    1.762919] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:53:plane 3A] hw state readout: disabled, pipe A
[    1.762991] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:63:plane 4A] hw state readout: disabled, pipe A
[    1.763067] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:73:plane 5A] hw state readout: disabled, pipe A
[    1.763138] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:83:cursor A] hw state readout: disabled, pipe A
[    1.763209] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:90:plane 1B] hw state readout: disabled, pipe B
[    1.763279] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:100:plane 2B] hw state readout: disabled, pipe B
[    1.763349] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:110:plane 3B] hw state readout: disabled, pipe B
[    1.763419] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:120:plane 4B] hw state readout: disabled, pipe B
[    1.763489] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:130:plane 5B] hw state readout: disabled, pipe B
[    1.763554] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:140:cursor B] hw state readout: disabled, pipe B
[    1.763616] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:147:plane 1C] hw state readout: disabled, pipe C
[    1.763674] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:157:plane 2C] hw state readout: disabled, pipe C
[    1.763729] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:167:plane 3C] hw state readout: disabled, pipe C
[    1.763781] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:177:plane 4C] hw state readout: disabled, pipe C
[    1.763833] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:187:plane 5C] hw state readout: disabled, pipe C
[    1.763884] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:197:cursor C] hw state readout: disabled, pipe C
[    1.763934] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:204:plane 1D] hw state readout: disabled, pipe D
[    1.763983] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:214:plane 2D] hw state readout: disabled, pipe D
[    1.764040] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:224:plane 3D] hw state readout: disabled, pipe D
[    1.764089] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:234:plane 4D] hw state readout: disabled, pipe D
[    1.764134] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:244:plane 5D] hw state readout: disabled, pipe D
[    1.764179] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:254:cursor D] hw state readout: disabled, pipe D
[    1.764437] i915 0000:00:02.0: [drm:intel_edp_fixup_vbt_bpp [i915]] pipe=
 has 24 bpp for eDP panel, overriding BIOS-provided max 18 bpp
[    1.764518] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [ENCODER:261:DDI A/PHY A] hw state readout: enabled, pipe A
[    1.764564] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [ENCODER:270:DDI B/PHY B] hw state readout: disabled, pipe A
[    1.764607] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [ENCODER:272:DP-MST A] hw state readout: disabled, pipe A
[    1.764650] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [ENCODER:273:DP-MST B] hw state readout: disabled, pipe B
[    1.764692] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [ENCODER:274:DP-MST C] hw state readout: disabled, pipe C
[    1.764733] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [ENCODER:275:DP-MST D] hw state readout: disabled, pipe D
[    1.764774] i915 0000:00:02.0: [drm:intel_tc_port_sanitize_mode [i915]] =
Port D/TC#1: sanitize mode (disconnected)
[    1.764842] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [ENCODER:288:DDI TC1/PHY TC1] hw state readout: disabled, pipe A
[    1.764885] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [ENCODER:290:DP-MST A] hw state readout: disabled, pipe A
[    1.764924] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [ENCODER:291:DP-MST B] hw state readout: disabled, pipe B
[    1.764963] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [ENCODER:292:DP-MST C] hw state readout: disabled, pipe C
[    1.765004] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [ENCODER:293:DP-MST D] hw state readout: disabled, pipe D
[    1.765057] i915 0000:00:02.0: [drm:intel_tc_port_sanitize_mode [i915]] =
Port E/TC#2: sanitize mode (disconnected)
[    1.765131] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [ENCODER:297:DDI TC2/PHY TC2] hw state readout: disabled, pipe A
[    1.765176] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [ENCODER:299:DP-MST A] hw state readout: disabled, pipe A
[    1.765219] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [ENCODER:300:DP-MST B] hw state readout: disabled, pipe B
[    1.765262] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [ENCODER:301:DP-MST C] hw state readout: disabled, pipe C
[    1.765303] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [ENCODER:302:DP-MST D] hw state readout: disabled, pipe D
[    1.765361] i915 0000:00:02.0: [drm:intel_tc_port_sanitize_mode [i915]] =
Port F/TC#3: sanitize mode (disconnected)
[    1.765436] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [ENCODER:306:DDI TC3/PHY TC3] hw state readout: disabled, pipe A
[    1.765490] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [ENCODER:308:DP-MST A] hw state readout: disabled, pipe A
[    1.765534] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [ENCODER:309:DP-MST B] hw state readout: disabled, pipe B
[    1.765575] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [ENCODER:310:DP-MST C] hw state readout: disabled, pipe C
[    1.765615] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [ENCODER:311:DP-MST D] hw state readout: disabled, pipe D
[    1.765671] i915 0000:00:02.0: [drm:intel_tc_port_sanitize_mode [i915]] =
Port G/TC#4: sanitize mode (disconnected)
[    1.765740] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [ENCODER:315:DDI TC4/PHY TC4] hw state readout: disabled, pipe A
[    1.765797] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [ENCODER:317:DP-MST A] hw state readout: disabled, pipe A
[    1.765845] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [ENCODER:318:DP-MST B] hw state readout: disabled, pipe B
[    1.765890] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [ENCODER:319:DP-MST C] hw state readout: disabled, pipe C
[    1.765932] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [ENCODER:320:DP-MST D] hw state readout: disabled, pipe D
[    1.765980] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [CONNECTOR:262:eDP-1] hw state readout: enabled
[    1.766023] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [CONNECTOR:271:DP-1] hw state readout: disabled
[    1.766063] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [CONNECTOR:283:HDMI-A-1] hw state readout: disabled
[    1.766102] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [CONNECTOR:289:DP-2] hw state readout: disabled
[    1.766141] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [CONNECTOR:298:DP-3] hw state readout: disabled
[    1.766180] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [CONNECTOR:307:DP-4] hw state readout: disabled
[    1.766220] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [CONNECTOR:316:DP-5] hw state readout: disabled
[    1.766258] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:33:plane 1A] min_cdclk 303258 kHz
[    1.766296] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:43:plane 2A] min_cdclk 0 kHz
[    1.766333] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:53:plane 3A] min_cdclk 0 kHz
[    1.766369] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:63:plane 4A] min_cdclk 0 kHz
[    1.766406] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:73:plane 5A] min_cdclk 0 kHz
[    1.766443] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:83:cursor A] min_cdclk 0 kHz
[    1.766480] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:90:plane 1B] min_cdclk 0 kHz
[    1.766516] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:100:plane 2B] min_cdclk 0 kHz
[    1.766553] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:110:plane 3B] min_cdclk 0 kHz
[    1.766589] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:120:plane 4B] min_cdclk 0 kHz
[    1.766626] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:130:plane 5B] min_cdclk 0 kHz
[    1.766662] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:140:cursor B] min_cdclk 0 kHz
[    1.766699] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:147:plane 1C] min_cdclk 0 kHz
[    1.766735] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:157:plane 2C] min_cdclk 0 kHz
[    1.766772] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:167:plane 3C] min_cdclk 0 kHz
[    1.766809] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:177:plane 4C] min_cdclk 0 kHz
[    1.766845] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:187:plane 5C] min_cdclk 0 kHz
[    1.766881] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:197:cursor C] min_cdclk 0 kHz
[    1.766918] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:204:plane 1D] min_cdclk 0 kHz
[    1.766954] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:214:plane 2D] min_cdclk 0 kHz
[    1.766991] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:224:plane 3D] min_cdclk 0 kHz
[    1.767033] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:234:plane 4D] min_cdclk 0 kHz
[    1.767069] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:244:plane 5D] min_cdclk 0 kHz
[    1.767106] i915 0000:00:02.0: [drm:intel_modeset_setup_hw_state [i915]]=
 [PLANE:254:cursor D] min_cdclk 0 kHz
[    1.767207] i915 0000:00:02.0: [drm:skl_wm_get_hw_state [i915]] [CRTC:88=
:pipe A] dbuf slices 0x3, ddb (0 - 2048), active pipes 0x1, mbus joined: no
[    1.767283] i915 0000:00:02.0: [drm:skl_wm_get_hw_state [i915]] [CRTC:14=
5:pipe B] dbuf slices 0x0, ddb (0 - 0), active pipes 0x1, mbus joined: no
[    1.767356] i915 0000:00:02.0: [drm:skl_wm_get_hw_state [i915]] [CRTC:20=
2:pipe C] dbuf slices 0x0, ddb (0 - 0), active pipes 0x1, mbus joined: no
[    1.767421] i915 0000:00:02.0: [drm:skl_wm_get_hw_state [i915]] [CRTC:25=
9:pipe D] dbuf slices 0x0, ddb (0 - 0), active pipes 0x1, mbus joined: no
[    1.767481] i915 0000:00:02.0: [drm:intel_bw_update_hw_state [i915]] pip=
e A data rate 2426064 num active planes 1
[    1.767575] i915 0000:00:02.0: [drm:intel_bw_update_hw_state [i915]] pip=
e B data rate 0 num active planes 0
[    1.767665] i915 0000:00:02.0: [drm:intel_bw_update_hw_state [i915]] pip=
e C data rate 0 num active planes 0
[    1.767754] i915 0000:00:02.0: [drm:intel_bw_update_hw_state [i915]] pip=
e D data rate 0 num active planes 0
[    1.767849] i915 0000:00:02.0: [drm:intel_cmtg_sanitize [i915]] CMTG rea=
dout: CMTG A: enabled, CMTG B: n/a, Transcoder A secondary: yes, Transcoder=
 B secondary: no
[    1.767970] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [CRTC:=
88:pipe A] enable: yes [setup_hw_state]
[    1.768064] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] active=
: yes, output_types: EDP (0x100), output format: RGB, sink format: RGB
[    1.768151] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] cpu_tr=
anscoder: A, pipe bpp: 24, dithering: 0
[    1.768236] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] MST ma=
ster transcoder: <invalid>
[    1.768320] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] port s=
ync: master transcoder: <invalid>, slave transcoder bitmask =3D 0x0
[    1.768403] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] joiner=
: no, pipes: 0x0
[    1.768485] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] splitt=
er: disabled, link count 0, overlap 0
[    1.768567] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] dp m_n=
: lanes: 4; data_m: 7066424, data_n: 8388608, link_m: 588868, link_n: 52428=
8, tu: 64
[    1.768649] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] dp m2_=
n2: lanes: 4; data_m: 0, data_n: 0, link_m: 0, link_n: 0, tu: 0
[    1.768731] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] fec: d=
isabled, enhanced framing: enabled
[    1.768812] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] sdp sp=
lit: disabled
[    1.768893] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] psr: d=
isabled, selective update: disabled, panel replay: disabled, selective fetc=
h: disabled
[    1.768972] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] minimu=
m HBlank: 0
[    1.769050] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] audio:=
 0, infoframes: 0, infoframes enabled: 0x0
[    1.769122] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] scanli=
ne offset: 1
[    1.769191] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] vblank=
 delay: 1, framestart delay: 1, MSA timing delay: 0
[    1.769257] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] vrr: y=
es, fixed rr: yes, vmin: 2520, vmax: 2520, flipline: 2520, pipeline full: 0=
, guardband: 119 vsync start: 117, vsync end: 111
[    1.769322] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] vrr: v=
min vblank: 2401, vmax vblank: 2401, vmin vtotal: 2520, vmax vtotal: 2520
[    1.769385] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] reques=
ted mode: "3840x2400": 60 606516 3840 3888 3920 4000 2400 2403 2408 2520 0x=
40 0xa
[    1.769448] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] adjust=
ed mode: "3840x2400": 60 606516 3840 3888 3920 4000 2400 2403 2408 2520 0x4=
0 0xa
[    1.769510] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] crtc t=
imings: clock=3D606516, hd=3D3840 hb=3D3840-4000 hs=3D3888-3920 ht=3D4000, =
vd=3D2400 vb=3D2401-2520 vs=3D2403-2408 vt=3D2520, flags=3D0xa
[    1.769571] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] pipe m=
ode: "3840x2400": 60 606516 3840 3888 3920 4000 2400 2403 2408 2520 0x40 0xa
[    1.769630] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] crtc t=
imings: clock=3D606516, hd=3D3840 hb=3D3840-4000 hs=3D3888-3920 ht=3D4000, =
vd=3D2400 vb=3D2401-2520 vs=3D2403-2408 vt=3D2520, flags=3D0xa
[    1.769689] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] port c=
lock: 540000, pipe src: 3840x2400+0+0, pixel rate 606516
[    1.769748] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] lineti=
me: 53, ips linetime: 0
[    1.769805] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] num_sc=
alers: 2, scaler_users: 0x0, scaler_id: -1, scaling_filter: 0
[    1.769862] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] pch pf=
it: 0x0+0+0, disabled, force thru: no
[    1.769919] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] ips: 0=
, double wide: 0, drrs: 0
[    1.769975] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] dpll_h=
w_state: dpll: 0x0, dpll_md: 0xf42110, fp0: 0xa2000f8, fp1: 0x1011029
[    1.770035] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] csc_mo=
de: 0x20000000 gamma_mode: 0x20000000 gamma_enable: 0 csc_enable: 0
[    1.770098] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] pre cs=
c lut: 0 entries, post csc lut: 0 entries
[    1.770161] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] output=
 csc: pre offsets: 0x0000 0x0000 0x0000
[    1.770221] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] output=
 csc: coefficients: 0x0000 0x0000 0x0000
[    1.770278] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] output=
 csc: coefficients: 0x0000 0x0000 0x0000
[    1.770333] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] output=
 csc: coefficients: 0x0000 0x0000 0x0000
[    1.770386] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] output=
 csc: post offsets: 0x0000 0x0000 0x0000
[    1.770439] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] pipe c=
sc: pre offsets: 0x0000 0x0000 0x0000
[    1.770491] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] pipe c=
sc: coefficients: 0x0000 0x0000 0x0000
[    1.770543] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] pipe c=
sc: coefficients: 0x0000 0x0000 0x0000
[    1.770594] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] pipe c=
sc: coefficients: 0x0000 0x0000 0x0000
[    1.770647] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] pipe c=
sc: post offsets: 0x0000 0x0000 0x0000
[    1.770702] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [CRTC:=
145:pipe B] enable: no [setup_hw_state]
[    1.770755] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [CRTC:=
202:pipe C] enable: no [setup_hw_state]
[    1.770806] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [CRTC:=
259:pipe D] enable: no [setup_hw_state]
[    1.770886] i915 0000:00:02.0: [drm:skl_get_initial_plane_config [i915]]=
 [CRTC:88:pipe A][PLANE:33:plane 1A] with fb: size=3D3840x2400@32, offset=
=3Dfdc00000, pitch 15360, size 0x2328000
[    1.770972] i915 0000:00:02.0: [drm:intel_initial_plane_config [i915]] U=
sing dma_addr=3D0x0000000000800000, based on initial plane programming
[    1.771065] i915 0000:00:02.0: [drm:_i915_gem_object_stolen_init [i915]]=
 creating preallocated stolen object: stolen_offset=3D0x0000000000000000, s=
ize=3D0x0000000002328000
[    1.771161] i915 0000:00:02.0: [drm:intel_initial_plane_config [i915]] I=
nitial plane fb bound to 0x0 in the ggtt (original 0xfdc00000)
[    1.787659] i915 0000:00:02.0: [drm:intel_wopcm_init [i915]] GuC WOPCM i=
s already locked [2048K, 832K)
[    1.791692] i915 0000:00:02.0: [drm:intel_wopcm_init [i915]] GuC WOPCM i=
s already locked [1040K, 832K)
[    1.791796] i915 0000:00:02.0: [drm:i915_init_ggtt [i915]] clearing unus=
ed GTT space: [2328000, fee00000]
[    1.791866] i915 0000:00:02.0: [drm:i915_gem_init [i915]] No clock gatin=
g settings or workarounds applied.
[    1.791954] i915 0000:00:02.0: [drm:debug_dump_steering [i915]] MCR Stee=
ring: L3BANK steering: group=3D0x0, instance=3D0x0
[    1.792031] i915 0000:00:02.0: [drm:debug_dump_steering [i915]] MCR Stee=
ring: DSS steering: group=3D0x0, instance=3D0x0
[    1.792100] i915 0000:00:02.0: [drm:debug_dump_steering [i915]] MCR Stee=
ring: INSTANCE 0 steering: group=3D0x0, instance=3D0x0
[    1.792165] i915 0000:00:02.0: [drm:wa_init_finish [i915]] GT0: Initiali=
zed 5 GT workarounds on global
[    1.793364] i915 0000:00:02.0: [drm:wa_init_finish [i915]] GT0: Initiali=
zed 6 engine workarounds on rcs'0
[    1.793428] i915 0000:00:02.0: [drm:wa_init_finish [i915]] GT0: Initiali=
zed 2 whitelist workarounds on rcs'0
[    1.793489] i915 0000:00:02.0: [drm:wa_init_finish [i915]] GT0: Initiali=
zed 7 context workarounds on rcs'0
[    1.793568] i915 0000:00:02.0: [drm:wa_init_finish [i915]] GT0: Initiali=
zed 1 engine workarounds on bcs'0
[    1.793618] i915 0000:00:02.0: [drm:wa_init_finish [i915]] GT0: Initiali=
zed 2 context workarounds on bcs'0
[    1.793679] i915 0000:00:02.0: [drm:wa_init_finish [i915]] GT0: Initiali=
zed 5 engine workarounds on ccs'0
[    1.793724] i915 0000:00:02.0: [drm:wa_init_finish [i915]] GT0: Initiali=
zed 1 context workarounds on ccs'0
[    1.793908] i915 0000:00:02.0: [drm:intel_guc_log_create [i915]] GT0: GU=
C: guc_log_level=3D1 (enabled, verbose:no, verbosity:0)
[    1.794001] i915 0000:00:02.0: [drm:intel_guc_capture_init [i915]] GT0: =
GUC: capture found 24 ext-regs.
[    1.794106] i915 0000:00:02.0: [drm:intel_guc_ads_create [i915]] GT0: GU=
C: Used 4 KB for temporary ADS regset
[    1.795813] i915 0000:00:02.0: [drm:intel_guc_init [i915]] GT0: GUC: par=
am[ 0] =3D 0x23293d7
[    1.795896] i915 0000:00:02.0: [drm:intel_guc_init [i915]] GT0: GUC: par=
am[ 1] =3D 0x410800
[    1.795974] i915 0000:00:02.0: [drm:intel_guc_init [i915]] GT0: GUC: par=
am[ 2] =3D 0x4
[    1.796056] i915 0000:00:02.0: [drm:intel_guc_init [i915]] GT0: GUC: par=
am[ 3] =3D 0x40
[    1.796130] i915 0000:00:02.0: [drm:intel_guc_init [i915]] GT0: GUC: par=
am[ 4] =3D 0x4878
[    1.796206] i915 0000:00:02.0: [drm:intel_guc_init [i915]] GT0: GUC: par=
am[ 5] =3D 0x7d510003
[    1.796282] i915 0000:00:02.0: [drm:intel_guc_init [i915]] GT0: GUC: par=
am[ 6] =3D 0x0
[    1.796357] i915 0000:00:02.0: [drm:intel_guc_init [i915]] GT0: GUC: par=
am[ 7] =3D 0x0
[    1.796432] i915 0000:00:02.0: [drm:intel_guc_init [i915]] GT0: GUC: par=
am[ 8] =3D 0x0
[    1.796506] i915 0000:00:02.0: [drm:intel_guc_init [i915]] GT0: GUC: par=
am[ 9] =3D 0x0
[    1.796578] i915 0000:00:02.0: [drm:intel_guc_init [i915]] GT0: GUC: par=
am[10] =3D 0x0
[    1.796650] i915 0000:00:02.0: [drm:intel_guc_init [i915]] GT0: GUC: par=
am[11] =3D 0x0
[    1.796723] i915 0000:00:02.0: [drm:intel_guc_init [i915]] GT0: GUC: par=
am[12] =3D 0x0
[    1.796795] i915 0000:00:02.0: [drm:intel_guc_init [i915]] GT0: GUC: par=
am[13] =3D 0x0
[    1.797553] i915 0000:00:02.0: [drm] GT0: GuC firmware i915/mtl_guc_70.b=
in version 70.49.4
[    1.812198] i915 0000:00:02.0: [drm:intel_guc_fw_upload [i915]] GT0: GUC=
: init took 12ms, freq =3D 1200MHz -> 1400MHz vs 2350MHz, status =3D 0x8002=
F034, count =3D 0, ret =3D 0
[    1.812684] i915 0000:00:02.0: [drm:guc_enable_communication [i915]] GT0=
: GUC: communication enabled
[    1.815782] i915 0000:00:02.0: [drm] GT0: GUC: submission enabled
[    1.815784] i915 0000:00:02.0: [drm] GT0: GUC: SLPC enabled
[    1.816009] i915 0000:00:02.0: [drm] GT0: GUC: RC enabled
[    1.816452] i915 0000:00:02.0: [drm:__guc_action_get_hwconfig [i915]] GT=
0: GUC: Querying HW config table: size =3D 0, offset =3D 0x00000000
[    1.816775] i915 0000:00:02.0: [drm:__guc_action_get_hwconfig [i915]] GT=
0: GUC: Querying HW config table: size =3D 752, offset =3D 0x02C6F000
[    1.818148] i915 0000:00:02.0: [drm:debug_dump_steering [i915]] MCR Stee=
ring: OADDRM steering: group=3D0x0, instance=3D0x0
[    1.818302] i915 0000:00:02.0: [drm:wa_init_finish [i915]] GT1: Initiali=
zed 5 GT workarounds on global
[    1.818773] i915 0000:00:02.0: [drm:wa_init_finish [i915]] GT1: Initiali=
zed 1 engine workarounds on vcs'0
[    1.818882] i915 0000:00:02.0: [drm:wa_init_finish [i915]] GT1: Initiali=
zed 1 context workarounds on vcs'0
[    1.819101] i915 0000:00:02.0: [drm:wa_init_finish [i915]] GT1: Initiali=
zed 1 engine workarounds on vcs'2
[    1.819199] i915 0000:00:02.0: [drm:wa_init_finish [i915]] GT1: Initiali=
zed 1 context workarounds on vcs'2
[    1.819402] i915 0000:00:02.0: [drm:wa_init_finish [i915]] GT1: Initiali=
zed 1 engine workarounds on vecs'0
[    1.819508] i915 0000:00:02.0: [drm:wa_init_finish [i915]] GT1: Initiali=
zed 1 context workarounds on vecs'0
[    1.819729] i915 0000:00:02.0: [drm:wa_init_finish [i915]] GT1: Initiali=
zed 1 engine workarounds on other'6
[    1.819812] i915 0000:00:02.0: [drm:wa_init_finish [i915]] GT1: Initiali=
zed 1 context workarounds on other'6
[    1.820305] i915 0000:00:02.0: [drm:intel_guc_log_create [i915]] GT1: GU=
C: guc_log_level=3D1 (enabled, verbose:no, verbosity:0)
[    1.820478] i915 0000:00:02.0: [drm:intel_guc_capture_init [i915]] GT1: =
GUC: capture found 24 ext-regs.
[    1.820658] i915 0000:00:02.0: [drm:intel_guc_ads_create [i915]] GT1: GU=
C: Used 4 KB for temporary ADS regset
[    1.823801] i915 0000:00:02.0: [drm:intel_guc_init [i915]] GT1: GUC: par=
am[ 0] =3D 0x2c703d7
[    1.823936] i915 0000:00:02.0: [drm:intel_guc_init [i915]] GT1: GUC: par=
am[ 1] =3D 0x400000
[    1.824074] i915 0000:00:02.0: [drm:intel_guc_init [i915]] GT1: GUC: par=
am[ 2] =3D 0x4
[    1.824195] i915 0000:00:02.0: [drm:intel_guc_init [i915]] GT1: GUC: par=
am[ 3] =3D 0x40
[    1.824315] i915 0000:00:02.0: [drm:intel_guc_init [i915]] GT1: GUC: par=
am[ 4] =3D 0x5b06
[    1.824432] i915 0000:00:02.0: [drm:intel_guc_init [i915]] GT1: GUC: par=
am[ 5] =3D 0x7d510003
[    1.824548] i915 0000:00:02.0: [drm:intel_guc_init [i915]] GT1: GUC: par=
am[ 6] =3D 0x0
[    1.824658] i915 0000:00:02.0: [drm:intel_guc_init [i915]] GT1: GUC: par=
am[ 7] =3D 0x0
[    1.824764] i915 0000:00:02.0: [drm:intel_guc_init [i915]] GT1: GUC: par=
am[ 8] =3D 0x0
[    1.824871] i915 0000:00:02.0: [drm:intel_guc_init [i915]] GT1: GUC: par=
am[ 9] =3D 0x0
[    1.824977] i915 0000:00:02.0: [drm:intel_guc_init [i915]] GT1: GUC: par=
am[10] =3D 0x0
[    1.825094] i915 0000:00:02.0: [drm:intel_guc_init [i915]] GT1: GUC: par=
am[11] =3D 0x0
[    1.825201] i915 0000:00:02.0: [drm:intel_guc_init [i915]] GT1: GUC: par=
am[12] =3D 0x0
[    1.825297] i915 0000:00:02.0: [drm:intel_guc_init [i915]] GT1: GUC: par=
am[13] =3D 0x0
[    1.825388] i915 0000:00:02.0: [drm:intel_huc_init [i915]] GT1: HuC: loa=
ded by GSC =3D no
[    1.828141] i915 0000:00:02.0: [drm] GT1: GuC firmware i915/mtl_guc_70.b=
in version 70.49.4
[    1.828143] i915 0000:00:02.0: [drm] GT1: HuC firmware i915/mtl_huc_gsc.=
bin version 8.5.4
[    1.844197] i915 0000:00:02.0: [drm:intel_guc_fw_upload [i915]] GT1: GUC=
: init took 14ms, freq =3D 1100MHz -> 1150MHz vs 1300MHz, status =3D 0x8002=
F034, count =3D 0, ret =3D 0
[    1.844492] i915 0000:00:02.0: [drm:guc_enable_communication [i915]] GT1=
: GUC: communication enabled
[    1.853317] i915 0000:00:02.0: [drm:intel_huc_wait_for_auth_complete [i9=
15]] GT1: HuC: auth took 8ms, freq =3D 1150MHz -> 1050MHz vs 1300MHz, statu=
s =3D 0x0000C1DC, count =3D 0, ret =3D 0
[    1.853562] i915 0000:00:02.0: [drm] GT1: HuC: authenticated for clear m=
edia
[    1.854679] i915 0000:00:02.0: [drm] GT1: GUC: submission enabled
[    1.854681] i915 0000:00:02.0: [drm] GT1: GUC: SLPC enabled
[    1.854795] i915 0000:00:02.0: [drm] GT1: GUC: RC enabled
[    1.854887] i915 0000:00:02.0: [drm:__guc_action_get_hwconfig [i915]] GT=
1: GUC: Querying HW config table: size =3D 0, offset =3D 0x00000000
[    1.855891] i915 0000:00:02.0: [drm:__guc_action_get_hwconfig [i915]] GT=
1: GUC: Querying HW config table: size =3D 752, offset =3D 0x039B3000
[    1.857773] i915 0000:00:02.0: [drm:intel_engines_driver_register [i915]=
] renamed rcs'0 to rcs0
[    1.857944] i915 0000:00:02.0: [drm:intel_engines_driver_register [i915]=
] renamed bcs'0 to bcs0
[    1.858102] i915 0000:00:02.0: [drm:intel_engines_driver_register [i915]=
] renamed vcs'0 to vcs0
[    1.858232] i915 0000:00:02.0: [drm:intel_engines_driver_register [i915]=
] renamed vcs'2 to vcs1
[    1.858354] i915 0000:00:02.0: [drm:intel_engines_driver_register [i915]=
] renamed vecs'0 to vecs0
[    1.858470] i915 0000:00:02.0: [drm:intel_engines_driver_register [i915]=
] renamed ccs'0 to ccs0
[    1.858584] i915 0000:00:02.0: [drm:intel_engines_driver_register [i915]=
] renamed other'6 to other0
[    1.860155] i915 0000:00:02.0: [drm] Protected Xe Path (PXP) protected c=
ontent support initialized
[    1.860596] i915 0000:00:02.0: [drm:intel_flipq_init [i915]] [CRTC:88:pi=
pe A] FQ 0: start 0x90008
[    1.860832] i915 0000:00:02.0: [drm:intel_flipq_init [i915]] [CRTC:88:pi=
pe A] FQ 1: start 0x90108
[    1.861063] i915 0000:00:02.0: [drm:intel_flipq_init [i915]] [CRTC:88:pi=
pe A] FQ 2: start 0x90208
[    1.861284] i915 0000:00:02.0: [drm:intel_flipq_init [i915]] [CRTC:88:pi=
pe A] FQ 3: start 0x90308
[    1.861502] i915 0000:00:02.0: [drm:intel_flipq_init [i915]] [CRTC:88:pi=
pe A] FQ 4: start 0x903c8
[    1.861715] i915 0000:00:02.0: [drm:intel_flipq_init [i915]] [CRTC:145:p=
ipe B] FQ 0: start 0x98008
[    1.861927] i915 0000:00:02.0: [drm:intel_flipq_init [i915]] [CRTC:145:p=
ipe B] FQ 1: start 0x98108
[    1.862148] i915 0000:00:02.0: [drm:intel_flipq_init [i915]] [CRTC:145:p=
ipe B] FQ 2: start 0x98208
[    1.862358] i915 0000:00:02.0: [drm:intel_flipq_init [i915]] [CRTC:145:p=
ipe B] FQ 3: start 0x98308
[    1.862564] i915 0000:00:02.0: [drm:intel_flipq_init [i915]] [CRTC:145:p=
ipe B] FQ 4: start 0x983c8
[    1.862770] i915 0000:00:02.0: [drm:intel_flipq_init [i915]] [CRTC:202:p=
ipe C] FQ 0: start 0x52008
[    1.862962] i915 0000:00:02.0: [drm:intel_flipq_init [i915]] [CRTC:202:p=
ipe C] FQ 1: start 0x52108
[    1.863150] i915 0000:00:02.0: [drm:intel_flipq_init [i915]] [CRTC:202:p=
ipe C] FQ 2: start 0x52208
[    1.863320] i915 0000:00:02.0: [drm:intel_flipq_init [i915]] [CRTC:202:p=
ipe C] FQ 3: start 0x52308
[    1.863482] i915 0000:00:02.0: [drm:intel_flipq_init [i915]] [CRTC:202:p=
ipe C] FQ 4: start 0x523c8
[    1.863638] i915 0000:00:02.0: [drm:intel_flipq_init [i915]] [CRTC:259:p=
ipe D] FQ 0: start 0x59008
[    1.863789] i915 0000:00:02.0: [drm:intel_flipq_init [i915]] [CRTC:259:p=
ipe D] FQ 1: start 0x59108
[    1.863937] i915 0000:00:02.0: [drm:intel_flipq_init [i915]] [CRTC:259:p=
ipe D] FQ 2: start 0x59208
[    1.864088] i915 0000:00:02.0: [drm:intel_flipq_init [i915]] [CRTC:259:p=
ipe D] FQ 3: start 0x59308
[    1.864227] i915 0000:00:02.0: [drm:intel_flipq_init [i915]] [CRTC:259:p=
ipe D] FQ 4: start 0x593c8
[    1.864406] i915 0000:00:02.0: [drm:skl_compute_wm [i915]] Enabled dbuf =
slices 0xf -> 0xf (total dbuf slices 0xf), mbus joined? no->yes
[    1.864609] i915 0000:00:02.0: [drm:skl_compute_wm [i915]] [CRTC:88:pipe=
 A] dbuf slices 0x3 -> 0xf, ddb (0 - 2048) -> (0 - 4096), active pipes 0x1 =
-> 0x1
[    1.864810] i915 0000:00:02.0: [drm:skl_compute_wm [i915]] [PLANE:33:pla=
ne 1A] ddb (   0 - 2048) -> (   0 - 4014), size 2048 -> 4014
[    1.865001] i915 0000:00:02.0: [drm:skl_compute_wm [i915]] [PLANE:83:cur=
sor A] ddb (   0 -    0) -> (4014 - 4096), size    0 ->   82
[    1.865207] i915 0000:00:02.0: [drm:skl_print_plane_changes [i915]] [PLA=
NE:33:plane 1A]   level *wm0, wm1, wm2, wm3, wm4, wm5, wm6, wm7, twm,*swm, =
stwm -> *wm0,*wm1,*wm2,*wm3,*wm4,*wm5, wm6, wm7, twm,*swm, stwm
[    1.865392] i915 0000:00:02.0: [drm:skl_print_plane_changes [i915]] [PLA=
NE:33:plane 1A]   lines    1,   1,   1,   1,   1,   1,   0,   0,   1,   3, =
   1 ->    2,  14,  14,  16,  16,  24,   0,   0,   0,   3,    0
[    1.865577] i915 0000:00:02.0: [drm:skl_print_plane_changes [i915]] [PLA=
NE:33:plane 1A]  blocks   32,  32,  32,  32,  32,  32,   0,   0,   7,  94, =
   7 ->   63, 435, 435, 497, 497, 745,   0,   0,   0,  94,    0
[    1.865760] i915 0000:00:02.0: [drm:skl_print_plane_changes [i915]] [PLA=
NE:33:plane 1A] min_ddb    0,   0,   0,   0,   0,   0,   0,   0,   0,   0, =
   0 ->   71, 480, 480, 548, 548, 821,   0,   0,   0, 105,    0
[    1.865954] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [CRTC:=
145:pipe B] enable: no [fastset]
[    1.866190] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [CRTC:=
202:pipe C] enable: no [fastset]
[    1.866403] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [CRTC:=
259:pipe D] enable: no [fastset]
[    1.868970] i915 0000:00:02.0: [drm:intel_fbc_update [i915]] reserved 76=
185600 bytes of contiguous stolen space for FBC, limit: 1
[    1.869178] i915 0000:00:02.0: [drm:intel_fbc_update [i915]] Enabling FB=
C on [PLANE:33:plane 1A]
[    1.869370] i915 0000:00:02.0: [drm:intel_dbuf_mbus_join_update [i915]] =
Changing mbus joined: no -> yes (pipe: A)
[    1.869562] i915 0000:00:02.0: [drm:intel_dbuf_mdclk_cdclk_ratio_update =
[i915]] Updating dbuf ratio to 4 (mbus joined: yes)
[    1.885484] i915 0000:00:02.0: [drm:intel_modeset_verify_crtc [i915]] [C=
RTC:145:pipe B]
[    1.885744] i915 0000:00:02.0: [drm:intel_modeset_verify_crtc [i915]] [C=
RTC:202:pipe C]
[    1.885937] i915 0000:00:02.0: [drm:intel_modeset_verify_crtc [i915]] [C=
RTC:259:pipe D]
[    1.887607] i915 0000:00:02.0: [drm:drm_sysfs_connector_add] [CONNECTOR:=
262:eDP-1] adding connector to sysfs
[    1.887808] i915 0000:00:02.0: [drm:intel_backlight_device_register [i91=
5]] [CONNECTOR:262:eDP-1] backlight device intel_backlight registered
[    1.888043] i915 0000:00:02.0: [drm:intel_panel_register [i915]] [CONNEC=
TOR:262:eDP-1] Registered panel device 'card1-eDP-1', has fwnode: yes
[    1.888231] i915 0000:00:02.0: [drm:intel_panel_register [i915]] [CONNEC=
TOR:262:eDP-1] Panel prepare
[    1.888405] i915 0000:00:02.0: [drm:intel_dp_connector_register [i915]] =
registering AUX A/DDI A/PHY A bus for card1-eDP-1
[    1.888847] i915 0000:00:02.0: [drm:drm_sysfs_connector_hotplug_event] [=
CONNECTOR:262:eDP-1] generating connector hotplug event
[    1.888858] i915 0000:00:02.0: [drm:drm_sysfs_connector_add] [CONNECTOR:=
271:DP-1] adding connector to sysfs
[    1.888905] i915 0000:00:02.0: [drm:intel_dp_connector_register [i915]] =
registering AUX B/DDI B/PHY B bus for card1-DP-1
[    1.889512] i915 0000:00:02.0: [drm:drm_sysfs_connector_hotplug_event] [=
CONNECTOR:271:DP-1] generating connector hotplug event
[    1.889519] i915 0000:00:02.0: [drm:drm_sysfs_connector_add] [CONNECTOR:=
283:HDMI-A-1] adding connector to sysfs
[    1.889568] i915 0000:00:02.0: [drm:drm_sysfs_connector_hotplug_event] [=
CONNECTOR:283:HDMI-A-1] generating connector hotplug event
[    1.889573] i915 0000:00:02.0: [drm:drm_sysfs_connector_add] [CONNECTOR:=
289:DP-2] adding connector to sysfs
[    1.889621] i915 0000:00:02.0: [drm:intel_dp_connector_register [i915]] =
registering AUX USBC1/DDI TC1/PHY TC1 bus for card1-DP-2
[    1.889994] i915 0000:00:02.0: [drm:drm_sysfs_connector_hotplug_event] [=
CONNECTOR:289:DP-2] generating connector hotplug event
[    1.890000] i915 0000:00:02.0: [drm:drm_sysfs_connector_add] [CONNECTOR:=
298:DP-3] adding connector to sysfs
[    1.890043] i915 0000:00:02.0: [drm:intel_dp_connector_register [i915]] =
registering AUX USBC2/DDI TC2/PHY TC2 bus for card1-DP-3
[    1.890596] i915 0000:00:02.0: [drm:drm_sysfs_connector_hotplug_event] [=
CONNECTOR:298:DP-3] generating connector hotplug event
[    1.890603] i915 0000:00:02.0: [drm:drm_sysfs_connector_add] [CONNECTOR:=
307:DP-4] adding connector to sysfs
[    1.890653] i915 0000:00:02.0: [drm:intel_dp_connector_register [i915]] =
registering AUX USBC3/DDI TC3/PHY TC3 bus for card1-DP-4
[    1.890822] i915 0000:00:02.0: [drm:drm_sysfs_connector_hotplug_event] [=
CONNECTOR:307:DP-4] generating connector hotplug event
[    1.890828] i915 0000:00:02.0: [drm:drm_sysfs_connector_add] [CONNECTOR:=
316:DP-5] adding connector to sysfs
[    1.890864] i915 0000:00:02.0: [drm:intel_dp_connector_register [i915]] =
registering AUX USBC4/DDI TC4/PHY TC4 bus for card1-DP-5
[    1.891413] i915 0000:00:02.0: [drm:drm_sysfs_connector_hotplug_event] [=
CONNECTOR:316:DP-5] generating connector hotplug event
[    1.891420] i915 0000:00:02.0: [drm] Registered 4 planes with drm panic
[    1.891421] [drm] Initialized i915 1.6.0 for 0000:00:02.0 on minor 1
[    1.891610] i915 0000:00:02.0: [drm:intel_opregion_resume [i915]] 7 outp=
uts detected
[    1.894817] ACPI: video: Video Device [GFX0] (multi-head: yes  rom: no  =
post: no)
[    1.895116] input: Video Bus as /devices/LNXSYSTM:00/LNXSYBUS:00/PNP0A08=
:00/LNXVIDEO:00/input/input6
[    1.895848] i915 0000:00:02.0: [drm:intel_audio_init [i915]] use AUD_FRE=
Q_CNTRL of 0x8010 (init value 0x8010)
[    1.896122] i915 0000:00:02.0: [drm:intel_display_driver_register [i915]=
] aud_ts_cdclk set to M=3D60, N=3D768
[    1.896430] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:2=
71:DP-1]
[    1.896703] i915 0000:00:02.0: [drm:intel_fbdev_setup [i915]] found poss=
ible fb from [PLANE:33:plane 1A]
[    1.896986] i915 0000:00:02.0: [drm:intel_fbdev_setup [i915]] [CRTC:145:=
pipe B] not active, skipping
[    1.897206] i915 0000:00:02.0: [drm:intel_fbdev_setup [i915]] [CRTC:202:=
pipe C] not active, skipping
[    1.897387] i915 0000:00:02.0: [drm:intel_fbdev_setup [i915]] [CRTC:259:=
pipe D] not active, skipping
[    1.897565] i915 0000:00:02.0: [drm:intel_fbdev_setup [i915]] checking [=
PLANE:33:plane 1A] for BIOS fb
[    1.897734] i915 0000:00:02.0: [drm:intel_fbdev_setup [i915]] [CRTC:88:p=
ipe A] area: 3840x2400, bpp: 32, size: 36864000
[    1.897903] i915 0000:00:02.0: [drm:intel_fbdev_setup [i915]] fb big eno=
ugh [PLANE:33:plane 1A] (36864000 >=3D 36864000)
[    1.898066] i915 0000:00:02.0: [drm:intel_fbdev_setup [i915]] [CRTC:145:=
pipe B] not active, skipping
[    1.898225] i915 0000:00:02.0: [drm:intel_fbdev_setup [i915]] [CRTC:202:=
pipe C] not active, skipping
[    1.898381] i915 0000:00:02.0: [drm:intel_fbdev_setup [i915]] [CRTC:259:=
pipe D] not active, skipping
[    1.898570] i915 0000:00:02.0: [drm:intel_fbdev_setup [i915]] using BIOS=
 fb for initial console
[    1.898736] i915 0000:00:02.0: [drm:i915_gem_open [i915]]=20
[    1.899035] i915 0000:00:02.0: [drm:drm_client_modeset_probe]=20
[    1.901045] i915 0000:00:02.0: [drm:intel_hotplug_detect_connector [i915=
]] [CONNECTOR:271:DP-1] status updated from unknown to disconnected (epoch =
counter 0->1)
[    1.901256] i915 0000:00:02.0: [drm:intel_hdmi_detect [i915]] [CONNECTOR=
:283:HDMI-A-1]
[    1.906401] i915 0000:00:02.0: [drm:intel_hotplug_detect_connector [i915=
]] [CONNECTOR:283:HDMI-A-1] status updated from unknown to disconnected (ep=
och counter 0->1)
[    1.906602] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:2=
89:DP-2]
[    1.906822] i915 0000:00:02.0: [drm:intel_tc_port_update_mode [i915]] Po=
rt D/TC#1: TC port mode reset (disconnected -> tbt-alt)
[    1.907034] i915 0000:00:02.0: [drm:intel_hotplug_detect_connector [i915=
]] [CONNECTOR:289:DP-2] status updated from unknown to disconnected (epoch =
counter 0->1)
[    1.907229] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:2=
98:DP-3]
[    1.907437] i915 0000:00:02.0: [drm:intel_tc_port_update_mode [i915]] Po=
rt E/TC#2: TC port mode reset (disconnected -> tbt-alt)
[    1.907643] i915 0000:00:02.0: [drm:intel_hotplug_detect_connector [i915=
]] [CONNECTOR:298:DP-3] status updated from unknown to disconnected (epoch =
counter 0->1)
[    1.907831] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:3=
07:DP-4]
[    1.908061] i915 0000:00:02.0: [drm:intel_tc_port_update_mode [i915]] Po=
rt F/TC#3: TC port mode reset (disconnected -> legacy)
[    1.913222] i915 0000:00:02.0: [drm:intel_hotplug_detect_connector [i915=
]] [CONNECTOR:307:DP-4] status updated from unknown to disconnected (epoch =
counter 0->1)
[    1.913408] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:3=
16:DP-5]
[    1.913629] i915 0000:00:02.0: [drm:intel_tc_port_update_mode [i915]] Po=
rt G/TC#4: TC port mode reset (disconnected -> legacy)
[    1.918118] i915 0000:00:02.0: [drm:intel_hotplug_detect_connector [i915=
]] [CONNECTOR:316:DP-5] status updated from unknown to disconnected (epoch =
counter 0->1)
[    1.918304] i915 0000:00:02.0: [drm:drm_sysfs_hotplug_event] generating =
hotplug event
[    1.918315] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:262:eDP-1]
[    1.918320] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:2=
62:eDP-1]
[    1.918862] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x00060 AUX -> (ret=3D 16) 00 11 00 76 0b 01 01 80 00=
 01 06 66 08 00 00 00
[    1.918882] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] DSC DPCD: 00=
 11 00 76 0b 01 01 80 00 01 06 66 08 00 00 00
[    1.919247] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x02214 AUX -> (ret=3D  1) 00
[    1.919266] i915 0000:00:02.0: [drm:intel_dp_print_rates [i915]] source =
rates: 162000, 216000, 243000, 270000, 324000, 432000, 540000, 675000, 8100=
00
[    1.919442] i915 0000:00:02.0: [drm:intel_dp_print_rates [i915]] sink ra=
tes: 162000, 216000, 243000, 270000, 324000, 432000, 540000, 810000
[    1.919640] i915 0000:00:02.0: [drm:intel_dp_print_rates [i915]] common =
rates: 162000, 216000, 243000, 270000, 324000, 432000, 540000, 810000
[    1.919793] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:262:eDP-1] Supported Monitor Refresh rate range is 40 Hz - 60 Hz
[    1.919798] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:262:eDP-1] Assigning EDID-1.4 digital sink color depth as 10 bpc.
[    1.919801] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:262:eDP-1] ELD monitor=20
[    1.919803] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:262:eDP-1] ELD size 20, SAD count 0
[    1.919809] i915 0000:00:02.0: [drm:intel_dp_set_edid [i915]] [CONNECTOR=
:262:eDP-1] VRR capable: yes
[    1.919955] i915 0000:00:02.0: [drm:intel_dp_set_edid [i915]] [CONNECTOR=
:262:eDP-1] DFP max bpc 0, max dotclock 0, TMDS clock 0-0, PCON Max FRL BW =
0Gbps
[    1.920105] i915 0000:00:02.0: [drm:intel_dp_set_edid [i915]] [CONNECTOR=
:262:eDP-1] RGB->YcbCr conversion? no, YCbCr 4:2:0 allowed? yes, YCbCr 4:4:=
4->4:2:0 conversion? no
[    1.920431] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x03000 AUX -> (ret=3D  1) 00
[    1.920637] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x00201 AUX -> (ret=3D  1) 00
[    1.920650] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:262:eDP-1] status updated from unknown to connected
[    1.920703] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:262:eDP-1] probed modes:
[    1.920709] i915 0000:00:02.0: [drm:drm_sysfs_hotplug_event] generating =
hotplug event
[    1.920718] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "3840x2400": 60 605000 3840 3888 3920 4000 2400 2403 2408=
 2520 0x48 0xa
[    1.920724] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:271:DP-1]
[    1.920727] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:2=
71:DP-1]
[    1.925105] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:271:DP-1] disconnected
[    1.925109] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:283:HDMI-A-1]
[    1.925112] i915 0000:00:02.0: [drm:intel_hdmi_detect [i915]] [CONNECTOR=
:283:HDMI-A-1]
[    1.930108] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:283:HDMI-A-1] disconnected
[    1.930112] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:289:DP-2]
[    1.930115] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:2=
89:DP-2]
[    1.930299] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:289:DP-2] disconnected
[    1.930302] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:298:DP-3]
[    1.930305] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:2=
98:DP-3]
[    1.930483] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:298:DP-3] disconnected
[    1.930486] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:307:DP-4]
[    1.930489] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:3=
07:DP-4]
[    1.935119] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:307:DP-4] disconnected
[    1.935123] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:316:DP-5]
[    1.935126] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:3=
16:DP-5]
[    1.940068] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:316:DP-5] disconnected
[    1.940072] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:262:eDP-1] enabled? yes
[    1.940076] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:271:DP-1] enabled? no
[    1.940079] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:283:HDMI-A-1] enabled? no
[    1.940082] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:289:DP-2] enabled? no
[    1.940084] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:298:DP-3] enabled? no
[    1.940087] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:307:DP-4] enabled? no
[    1.940090] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:316:DP-5] enabled? no
[    1.940094] i915 0000:00:02.0: [drm:drm_client_modeset_probe] Not using =
firmware configuration
[    1.940098] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:262:eDP-1] found preferred mode: 3840x2400
[    1.940101] i915 0000:00:02.0: [drm:drm_client_modeset_probe] picking CR=
TCs for 16384x16384 config
[    1.940105] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CRTC:88:p=
ipe A] desired mode 3840x2400 set (0,0)
[    1.940109] i915 0000:00:02.0: [drm:__drm_fb_helper_initial_config_and_u=
nlock] test CRTC 0 primary plane
[    1.940113] i915 0000:00:02.0: [drm:intel_fbdev_driver_fbdev_probe [i915=
]] re-using BIOS fb
[    1.940357] i915 0000:00:02.0: [drm:intel_fbdev_driver_fbdev_probe [i915=
]] allocated 3840x2400 fb: 0x00000000
[    1.940646] fbcon: i915drmfb (fb0) is primary device
[    1.940737] i915 0000:00:02.0: [drm:intel_atomic_check [i915]] [CONNECTO=
R:262:eDP-1] Limiting display bpp to 30 (EDID bpp 30, max requested bpp 36,=
 max platform bpp 36)
[    1.941003] i915 0000:00:02.0: [drm:intel_dp_compute_config_limits [i915=
]] [ENCODER:261:DDI A/PHY A][CRTC:88:pipe A] DP link limits: pixel clock 60=
5000 kHz DSC off max lanes 4 max rate 810000 max pipe_bpp 30 max link_bpp 3=
0.0000
[    1.941190] i915 0000:00:02.0: [drm:intel_dp_compute_link_config [i915]]=
 DP lane count 4 clock 810000 bpp input 30 compressed 0.0000 link rate requ=
ired 2268750 available 3240000
[    1.941364] i915 0000:00:02.0: [drm:intel_atomic_check [i915]] [CRTC:88:=
pipe A] hw max bpp: 30, pipe bpp: 30, dithering: 0
[    1.941589] i915 0000:00:02.0: [drm:intel_ddi_compute_config_late [i915]=
] [ENCODER:261:DDI A/PHY A] [CRTC:88:pipe A]
[    1.941757] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:88:pipe A] fastset requirement not met in dp_m_n (expected tu 64 data 7=
066424/8388608 link 588868/524288, found tu 64, data 5873967/8388608 link 3=
91597/524288)
[    1.941988] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:88:pipe A] fastset requirement not met in dpll_hw_state.cx0pll C10
[    1.942221] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] ex=
pected:
[    1.942428] i915 0000:00:02.0: [drm:intel_cx0pll_dump_hw_state [i915]] c=
10pll_hw_state: fracen: yes,=20
[    1.942609] i915 0000:00:02.0: [drm:intel_cx0pll_dump_hw_state [i915]] q=
uot: 40960, rem: 0, den: 1,
[    1.942828] usb 3-4: New USB device found, idVendor=3D1050, idProduct=3D=
0406, bcdDevice=3D 5.71
[    1.942830] usb 3-4: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D0
[    1.942831] usb 3-4: Product: YubiKey FIDO+CCID
[    1.942832] usb 3-4: Manufacturer: Yubico
[    1.942772] i915 0000:00:02.0: [drm:intel_cx0pll_dump_hw_state [i915]] m=
ultiplier: 140, tx_clk_div: 0.
[    1.942936] i915 0000:00:02.0: [drm:intel_cx0pll_dump_hw_state [i915]] c=
10pll_rawhw_state:
[    1.943131] i915 0000:00:02.0: [drm:intel_cx0pll_dump_hw_state [i915]] t=
x: 0x10, cmn: 0x21
[    1.943290] i915 0000:00:02.0: [drm:intel_cx0pll_dump_hw_state [i915]] p=
ll[0] =3D 0xf4, pll[1] =3D 0x0, pll[2] =3D 0xf8, pll[3] =3D 0x0
[    1.943442] i915 0000:00:02.0: [drm:intel_cx0pll_dump_hw_state [i915]] p=
ll[4] =3D 0x20, pll[5] =3D 0xa, pll[6] =3D 0x29, pll[7] =3D 0x10
[    1.943584] i915 0000:00:02.0: [drm:intel_cx0pll_dump_hw_state [i915]] p=
ll[8] =3D 0x1, pll[9] =3D 0x1, pll[10] =3D 0x0, pll[11] =3D 0x0
[    1.943729] i915 0000:00:02.0: [drm:intel_cx0pll_dump_hw_state [i915]] p=
ll[12] =3D 0xa0, pll[13] =3D 0x0, pll[14] =3D 0x0, pll[15] =3D 0x0
[    1.943853] i915 0000:00:02.0: [drm:intel_cx0pll_dump_hw_state [i915]] p=
ll[16] =3D 0x84, pll[17] =3D 0x4f, pll[18] =3D 0xe5, pll[19] =3D 0x23
[    1.943979] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] fo=
und:
[    1.944186] i915 0000:00:02.0: [drm:intel_cx0pll_dump_hw_state [i915]] c=
10pll_hw_state: fracen: yes,=20
[    1.944315] i915 0000:00:02.0: [drm:intel_cx0pll_dump_hw_state [i915]] q=
uot: 61440, rem: 0, den: 1,
[    1.944421] i915 0000:00:02.0: [drm:intel_cx0pll_dump_hw_state [i915]] m=
ultiplier: 210, tx_clk_div: 0.
[    1.944528] i915 0000:00:02.0: [drm:intel_cx0pll_dump_hw_state [i915]] c=
10pll_rawhw_state:
[    1.944622] i915 0000:00:02.0: [drm:intel_cx0pll_dump_hw_state [i915]] t=
x: 0x10, cmn: 0x21
[    1.944728] i915 0000:00:02.0: [drm:intel_cx0pll_dump_hw_state [i915]] p=
ll[0] =3D 0x34, pll[1] =3D 0x0, pll[2] =3D 0x84, pll[3] =3D 0x1
[    1.944828] i915 0000:00:02.0: [drm:intel_cx0pll_dump_hw_state [i915]] p=
ll[4] =3D 0x0, pll[5] =3D 0x0, pll[6] =3D 0x0, pll[7] =3D 0x0
[    1.944932] i915 0000:00:02.0: [drm:intel_cx0pll_dump_hw_state [i915]] p=
ll[8] =3D 0x0, pll[9] =3D 0x1, pll[10] =3D 0x0, pll[11] =3D 0x0
[    1.945018] i915 0000:00:02.0: [drm:intel_cx0pll_dump_hw_state [i915]] p=
ll[12] =3D 0xf0, pll[13] =3D 0x0, pll[14] =3D 0x0, pll[15] =3D 0x0
[    1.945106] i915 0000:00:02.0: [drm:intel_cx0pll_dump_hw_state [i915]] p=
ll[16] =3D 0x84, pll[17] =3D 0xf, pll[18] =3D 0xe5, pll[19] =3D 0x23
[    1.945187] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:88:pipe A] fastset requirement not met in pipe_bpp (expected 24, found =
30)
[    1.945369] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:88:pipe A] fastset requirement not met in hw.pipe_mode.crtc_clock (expe=
cted 606516, found 604999)
[    1.945538] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:88:pipe A] fastset requirement not met in hw.adjusted_mode.crtc_clock (=
expected 606516, found 604999)
[    1.945670] hid-generic 0003:1050:0406.0001: hiddev96,hidraw0: USB HID v=
1.10 Device [Yubico YubiKey FIDO+CCID] on usb-0000:00:14.0-4/input0
[    1.945701] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:88:pipe A] fastset requirement not met in port_clock (expected 540000, =
found 810000)
[    1.945871] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:88:pipe A] fastset requirement not met in min_voltage_level (expected 0=
, found 1)
[    1.946035] i915 0000:00:02.0: [drm:intel_atomic_check [i915]] [CRTC:88:=
pipe A] fastset requirement not met, forcing full modeset
[    1.946210] i915 0000:00:02.0: [drm:skl_print_plane_changes [i915]] [PLA=
NE:33:plane 1A]   level *wm0,*wm1,*wm2,*wm3,*wm4,*wm5, wm6, wm7, twm,*swm, =
stwm -> *wm0,*wm1,*wm2,*wm3,*wm4,*wm5, wm6, wm7,*twm,*swm,*stwm
[    1.946342] i915 0000:00:02.0: [drm:skl_print_plane_changes [i915]] [PLA=
NE:33:plane 1A]   lines    2,  14,  14,  16,  16,  24,   0,   0,   0,   3, =
   0 ->    2,  14,  14,  15,  16,  24,   0,   0,   0,   3,    0
[    1.946484] i915 0000:00:02.0: [drm:skl_print_plane_changes [i915]] [PLA=
NE:33:plane 1A]  blocks   63, 435, 435, 497, 497, 745,   0,   0,   0,  94, =
   0 ->   63, 435, 435, 466, 497, 745,   0,   0,  77,  94,  108
[    1.946633] i915 0000:00:02.0: [drm:skl_print_plane_changes [i915]] [PLA=
NE:33:plane 1A] min_ddb   71, 480, 480, 548, 548, 821,   0,   0,   0, 105, =
   0 ->   71, 480, 480, 514, 548, 821,   0,   0,  78, 105,  109
[    1.946772] i915 0000:00:02.0: [drm:skl_print_plane_changes [i915]] [PLA=
NE:43:plane 2A]   level  wm0, wm1, wm2, wm3, wm4, wm5, wm6, wm7, twm, swm, =
stwm ->  wm0, wm1, wm2, wm3, wm4, wm5, wm6, wm7, twm, swm, stwm
[    1.946882] i915 0000:00:02.0: [drm:skl_print_plane_changes [i915]] [PLA=
NE:43:plane 2A]   lines    1,   1,   1,   1,   1,   1,   0,   0,   1,   1, =
   1 ->    0,   0,   0,   0,   0,   0,   0,   0,   0,   0,    0
[    1.946986] i915 0000:00:02.0: [drm:skl_print_plane_changes [i915]] [PLA=
NE:43:plane 2A]  blocks    7,   7,   7,   7,   7,   7,   0,   0,   7,   7, =
   7 ->    0,   0,   0,   0,   0,   0,   0,   0,   0,   0,    0
[    1.947094] i915 0000:00:02.0: [drm:skl_print_plane_changes [i915]] [PLA=
NE:43:plane 2A] min_ddb    0,   0,   0,   0,   0,   0,   0,   0,   0,   0, =
   0 ->    0,   0,   0,   0,   0,   0,   0,   0,   0,   0,    0
[    1.947190] i915 0000:00:02.0: [drm:skl_print_plane_changes [i915]] [PLA=
NE:53:plane 3A]   level  wm0, wm1, wm2, wm3, wm4, wm5, wm6, wm7, twm, swm, =
stwm ->  wm0, wm1, wm2, wm3, wm4, wm5, wm6, wm7, twm, swm, stwm
[    1.947281] i915 0000:00:02.0: [drm:skl_print_plane_changes [i915]] [PLA=
NE:53:plane 3A]   lines    1,   1,   1,   1,   1,   1,   0,   0,   1,   1, =
   1 ->    0,   0,   0,   0,   0,   0,   0,   0,   0,   0,    0
[    1.947369] i915 0000:00:02.0: [drm:skl_print_plane_changes [i915]] [PLA=
NE:53:plane 3A]  blocks    7,   7,   7,   7,   7,   7,   0,   0,   7,   7, =
   7 ->    0,   0,   0,   0,   0,   0,   0,   0,   0,   0,    0
[    1.947454] i915 0000:00:02.0: [drm:skl_print_plane_changes [i915]] [PLA=
NE:53:plane 3A] min_ddb    0,   0,   0,   0,   0,   0,   0,   0,   0,   0, =
   0 ->    0,   0,   0,   0,   0,   0,   0,   0,   0,   0,    0
[    1.947536] i915 0000:00:02.0: [drm:skl_print_plane_changes [i915]] [PLA=
NE:63:plane 4A]   level  wm0, wm1, wm2, wm3, wm4, wm5, wm6, wm7, twm, swm, =
stwm ->  wm0, wm1, wm2, wm3, wm4, wm5, wm6, wm7, twm, swm, stwm
[    1.947607] i915 0000:00:02.0: [drm:skl_print_plane_changes [i915]] [PLA=
NE:63:plane 4A]   lines    1,   1,   1,   1,   1,   1,   0,   0,   1,   1, =
   1 ->    0,   0,   0,   0,   0,   0,   0,   0,   0,   0,    0
[    1.947677] i915 0000:00:02.0: [drm:skl_print_plane_changes [i915]] [PLA=
NE:63:plane 4A]  blocks    7,   7,   7,   7,   7,   7,   0,   0,   7,   7, =
   7 ->    0,   0,   0,   0,   0,   0,   0,   0,   0,   0,    0
[    1.947745] i915 0000:00:02.0: [drm:skl_print_plane_changes [i915]] [PLA=
NE:63:plane 4A] min_ddb    0,   0,   0,   0,   0,   0,   0,   0,   0,   0, =
   0 ->    0,   0,   0,   0,   0,   0,   0,   0,   0,   0,    0
[    1.947812] i915 0000:00:02.0: [drm:skl_print_plane_changes [i915]] [PLA=
NE:73:plane 5A]   level  wm0, wm1, wm2, wm3, wm4, wm5, wm6, wm7, twm, swm, =
stwm ->  wm0, wm1, wm2, wm3, wm4, wm5, wm6, wm7, twm, swm, stwm
[    1.947879] i915 0000:00:02.0: [drm:skl_print_plane_changes [i915]] [PLA=
NE:73:plane 5A]   lines    1,   1,   1,   1,   1,   1,   0,   0,   1,   1, =
   1 ->    0,   0,   0,   0,   0,   0,   0,   0,   0,   0,    0
[    1.947946] i915 0000:00:02.0: [drm:skl_print_plane_changes [i915]] [PLA=
NE:73:plane 5A]  blocks    7,   7,   7,   7,   7,   7,   0,   0,   7,   7, =
   7 ->    0,   0,   0,   0,   0,   0,   0,   0,   0,   0,    0
[    1.948016] i915 0000:00:02.0: [drm:skl_print_plane_changes [i915]] [PLA=
NE:73:plane 5A] min_ddb    0,   0,   0,   0,   0,   0,   0,   0,   0,   0, =
   0 ->    0,   0,   0,   0,   0,   0,   0,   0,   0,   0,    0
[    1.948088] i915 0000:00:02.0: [drm:skl_print_plane_changes [i915]] [PLA=
NE:83:cursor A]   level  wm0, wm1, wm2, wm3, wm4, wm5, wm6, wm7, twm, swm, =
stwm ->  wm0, wm1, wm2, wm3, wm4, wm5, wm6, wm7, twm, swm, stwm
[    1.948156] i915 0000:00:02.0: [drm:skl_print_plane_changes [i915]] [PLA=
NE:83:cursor A]   lines    1,   1,   1,   1,   1,   1,   0,   0,   1,   1, =
   1 ->    0,   0,   0,   0,   0,   0,   0,   0,   0,   0,    0
[    1.948223] i915 0000:00:02.0: [drm:skl_print_plane_changes [i915]] [PLA=
NE:83:cursor A]  blocks    7,   7,   7,   7,   7,   7,   0,   0,   7,   7, =
   7 ->    0,   0,   0,   0,   0,   0,   0,   0,   0,   0,    0
[    1.948289] i915 0000:00:02.0: [drm:skl_print_plane_changes [i915]] [PLA=
NE:83:cursor A] min_ddb    0,   0,   0,   0,   0,   0,   0,   0,   0,   0, =
   0 ->    0,   0,   0,   0,   0,   0,   0,   0,   0,   0,    0
[    1.948357] i915 0000:00:02.0: [drm:intel_bw_atomic_check [i915]] [CRTC:=
88:pipe A] data rate 2419996 num active planes 1
[    1.948497] i915 0000:00:02.0: [drm:intel_bw_atomic_check [i915]] QGV po=
int 0: max bw 28913 required 2541 qgv_peak_bw: 51200
[    1.948622] i915 0000:00:02.0: [drm:intel_bw_atomic_check [i915]] QGV po=
int 1: max bw 36260 required 2541 qgv_peak_bw: 51200
[    1.948744] i915 0000:00:02.0: [drm:intel_bw_atomic_check [i915]] QGV po=
int 2: max bw 38000 required 2541 qgv_peak_bw: 51200
[    1.948865] i915 0000:00:02.0: [drm:intel_bw_atomic_check [i915]] QGV po=
int 3: max bw 38000 required 2541 qgv_peak_bw: 51200
[    1.948984] i915 0000:00:02.0: [drm:intel_bw_atomic_check [i915]] Matchi=
ng peaks QGV bw: 51200 for required data rate: 2541
[    1.949112] i915 0000:00:02.0: [drm:intel_modeset_calc_cdclk [i915]] New=
 cdclk calculated to be logical 307200 kHz, actual 307200 kHz
[    1.949231] i915 0000:00:02.0: [drm:intel_modeset_calc_cdclk [i915]] New=
 voltage level calculated to be logical 1, actual 1
[    1.949353] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [CRTC:=
88:pipe A] enable: yes [modeset]
[    1.949466] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] active=
: yes, output_types: EDP (0x100), output format: RGB, sink format: RGB
[    1.949577] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] cpu_tr=
anscoder: A, pipe bpp: 30, dithering: 0
[    1.949689] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] MST ma=
ster transcoder: <invalid>
[    1.949796] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] port s=
ync: master transcoder: <invalid>, slave transcoder bitmask =3D 0x0
[    1.949898] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] joiner=
: no, pipes: 0x0
[    1.949997] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] splitt=
er: disabled, link count 0, overlap 0
[    1.950103] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] dp m_n=
: lanes: 4; data_m: 5873967, data_n: 8388608, link_m: 391597, link_n: 52428=
8, tu: 64
[    1.950199] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] dp m2_=
n2: lanes: 4; data_m: 0, data_n: 0, link_m: 0, link_n: 0, tu: 0
[    1.950292] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] fec: d=
isabled, enhanced framing: enabled
[    1.950383] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] sdp sp=
lit: disabled
[    1.950472] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] psr: e=
nabled, selective update: enabled, panel replay: disabled, selective fetch:=
 enabled
[    1.950561] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] minimu=
m HBlank: 0
[    1.950643] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] audio:=
 0, infoframes: 0, infoframes enabled: 0x4
[    1.950722] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] DP SDP=
: VSC, revision 4, length 14
[    1.950801] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]]     pi=
xelformat: RGB
[    1.950879] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]]     co=
lorimetry: sRGB
[    1.950956] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]]     bp=
c: 0
[    1.951033] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]]     dy=
namic range: VESA range
[    1.951108] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]]     co=
ntent type: Not defined
[    1.951183] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] scanli=
ne offset: 1
[    1.951258] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] vblank=
 delay: 1, framestart delay: 1, MSA timing delay: 0
[    1.951332] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] vrr: n=
o, fixed rr: yes, vmin: 2520, vmax: 2520, flipline: 2520, pipeline full: 0,=
 guardband: 119 vsync start: 117, vsync end: 112
[    1.951406] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] vrr: v=
min vblank: 2401, vmax vblank: 2401, vmin vtotal: 2520, vmax vtotal: 2520
[    1.951485] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] reques=
ted mode: "3840x2400": 60 605000 3840 3888 3920 4000 2400 2403 2408 2520 0x=
48 0xa
[    1.951566] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] adjust=
ed mode: "3840x2400": 60 605000 3840 3888 3920 4000 2400 2403 2408 2520 0x4=
8 0xa
[    1.951637] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] crtc t=
imings: clock=3D604999, hd=3D3840 hb=3D3840-4000 hs=3D3888-3920 ht=3D4000, =
vd=3D2400 vb=3D2401-2520 vs=3D2403-2408 vt=3D2520, flags=3D0xa
[    1.951704] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] pipe m=
ode: "3840x2400": 60 604999 3840 3888 3920 4000 2400 2403 2408 2520 0x40 0xa
[    1.951768] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] crtc t=
imings: clock=3D604999, hd=3D3840 hb=3D3840-4000 hs=3D3888-3920 ht=3D4000, =
vd=3D2400 vb=3D2401-2520 vs=3D2403-2408 vt=3D2520, flags=3D0xa
[    1.951830] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] port c=
lock: 810000, pipe src: 3840x2400+0+0, pixel rate 604999
[    1.951890] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] lineti=
me: 53, ips linetime: 0
[    1.951948] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] num_sc=
alers: 2, scaler_users: 0x0, scaler_id: -1, scaling_filter: 0
[    1.952007] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] pch pf=
it: 0x0+0+0, disabled, force thru: no
[    1.952071] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] ips: 0=
, double wide: 0, drrs: 0
[    1.952128] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] dpll_h=
w_state: dpll: 0xc5c10, dpll_md: 0x342110, fp0: 0x184, fp1: 0x1000000
[    1.952185] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] csc_mo=
de: 0x0 gamma_mode: 0x0 gamma_enable: 0 csc_enable: 0
[    1.952240] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] pre cs=
c lut: 0 entries, post csc lut: 0 entries
[    1.952295] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] output=
 csc: pre offsets: 0x0000 0x0000 0x0000
[    1.952355] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] output=
 csc: coefficients: 0x0000 0x0000 0x0000
[    1.952416] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] output=
 csc: coefficients: 0x0000 0x0000 0x0000
[    1.952475] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] output=
 csc: coefficients: 0x0000 0x0000 0x0000
[    1.952533] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] output=
 csc: post offsets: 0x0000 0x0000 0x0000
[    1.952589] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] pipe c=
sc: pre offsets: 0x0000 0x0000 0x0000
[    1.952643] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] pipe c=
sc: coefficients: 0x0000 0x0000 0x0000
[    1.952696] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] pipe c=
sc: coefficients: 0x0000 0x0000 0x0000
[    1.952749] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] pipe c=
sc: coefficients: 0x0000 0x0000 0x0000
[    1.952801] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] pipe c=
sc: post offsets: 0x0000 0x0000 0x0000
[    1.952851] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [PLANE=
:33:plane 1A] fb: [FB:325] 3840x2400 format =3D XR24 little-endian (0x34325=
258) modifier =3D 0x0, visible: yes
[    1.952902] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] 	rotat=
ion: 0x1, scaler: -1, scaling_filter: 0
[    1.952952] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] 	src: =
3840.000000x2400.000000+0.000000+0.000000 dst: 3840x2400+0+0
[    1.953003] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [PLANE=
:43:plane 2A] fb: [NOFB], visible: no
[    1.953062] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [PLANE=
:53:plane 3A] fb: [NOFB], visible: no
[    1.953117] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [PLANE=
:63:plane 4A] fb: [NOFB], visible: no
[    1.953168] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [PLANE=
:73:plane 5A] fb: [NOFB], visible: no
[    1.953216] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [PLANE=
:83:cursor A] fb: [NOFB], visible: no
[    1.985477] i915 0000:00:02.0: [drm:intel_edp_backlight_off [i915]]=20
[    2.001635] i915 0000:00:02.0: [drm] GT1: Loaded GSC firmware i915/mtl_g=
sc_1.bin (cv1.0, r102.1.15.1926, svn 1)
[    2.021834] i915 0000:00:02.0: [drm:intel_huc_wait_for_auth_complete [i9=
15]] GT1: HuC: auth took 0ms, freq =3D 1300MHz -> 1300MHz vs 1300MHz, statu=
s =3D 0x00116C68, count =3D 0, ret =3D 0
[    2.021946] i915 0000:00:02.0: [drm] GT1: HuC: authenticated for all wor=
kloads
[    2.057075] usb 3-7: new full-speed USB device number 3 using xhci_hcd
[    2.182099] usb 3-7: New USB device found, idVendor=3D06cb, idProduct=3D=
00f9, bcdDevice=3D 0.00
[    2.182101] usb 3-7: New USB device strings: Mfr=3D0, Product=3D0, Seria=
lNumber=3D1
[    2.182102] usb 3-7: SerialNumber: 5fc0eae4eaa2
[    2.190194] i915 0000:00:02.0: [drm:intel_backlight_set_pwm_level [i915]=
] [CONNECTOR:262:eDP-1] set backlight PWM =3D 0
[    2.190649] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX A/DDI A/PHY A: 0x00107 AUX <- (ret=3D  1) 00
[    2.190678] i915 0000:00:02.0: [drm:intel_disable_transcoder [i915]] dis=
abling pipe A
[    2.203294] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX A/DDI A/PHY A: 0x00600 AUX <- (ret=3D  1) 02
[    2.203342] i915 0000:00:02.0: [drm:intel_pps_off_unlocked [i915]] [ENCO=
DER:261:DDI A/PHY A] PPS 0 turn panel power off
[    2.203613] i915 0000:00:02.0: [drm:intel_pps_off_unlocked [i915]] [ENCO=
DER:261:DDI A/PHY A] PPS 0 wait for panel power off time
[    2.203795] i915 0000:00:02.0: [drm:wait_panel_status [i915]] [ENCODER:2=
61:DDI A/PHY A] PPS 0 mask: 0xb0000000 value: 0x00000000 PP_STATUS: 0xa0000=
002 PP_CONTROL: 0x00000060
[    2.203921] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x00010000, dig 0x00000089, pins 0x00000010, long 0x000000=
00
[    2.204028] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:261:DDI A/PHY A] - short
[    2.254086] i915 0000:00:02.0: [drm:intel_pps_off_unlocked [i915]] Wait =
complete
[    2.254325] i915 0000:00:02.0: [drm:intel_power_well_disable [i915]] dis=
abling AUX_A
[    2.254590] i915 0000:00:02.0: [drm:__intel_fbc_disable [i915]] Disablin=
g FBC on [PLANE:33:plane 1A]
[    2.254696] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] ignoring =
short hpd on eDP [ENCODER:261:DDI A/PHY A]
[    2.254808] i915 0000:00:02.0: [drm:intel_pmdemand_program_params [i915]=
] initiate pmdemand request values: (0xffff1072 0x13432a72)
[    2.255199] i915 0000:00:02.0: [drm:intel_set_cdclk [i915]] Pre changing=
 CDCLK to 307200 kHz, VCO 614400 kHz, ref 38400 kHz, bypass 19200 kHz, volt=
age level 1
[    2.255456] i915 0000:00:02.0: [drm:intel_set_cdclk [i915]] aud_ts_cdclk=
 set to M=3D60, N=3D768
[    2.255642] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:261:DDI A/PHY A]
[    2.255855] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:270:DDI B/PHY B]
[    2.256045] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:272:DP-MST A]
[    2.256203] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:273:DP-MST B]
[    2.256350] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:274:DP-MST C]
[    2.256390] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x00010000, dig 0x0000008a, pins 0x00000010, long 0x000000=
10
[    2.256497] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:261:DDI A/PHY A] - long
[    2.256485] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:275:DP-MST D]
[    2.256577] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] Receiv=
ed HPD interrupt on PIN 4 - cnt: 10
[    2.256613] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:288:DDI TC1/PHY TC1]
[    2.256739] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:290:DP-MST A]
[    2.256711] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] ignoring =
long hpd on eDP [ENCODER:261:DDI A/PHY A]
[    2.256864] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:291:DP-MST B]
[    2.256978] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:292:DP-MST C]
[    2.257098] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:293:DP-MST D]
[    2.257200] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:297:DDI TC2/PHY TC2]
[    2.257320] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:299:DP-MST A]
[    2.257451] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:300:DP-MST B]
[    2.257578] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:301:DP-MST C]
[    2.257685] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:302:DP-MST D]
[    2.257784] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:306:DDI TC3/PHY TC3]
[    2.257883] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:308:DP-MST A]
[    2.257980] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:309:DP-MST B]
[    2.258089] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:310:DP-MST C]
[    2.258186] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:311:DP-MST D]
[    2.258284] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:315:DDI TC4/PHY TC4]
[    2.258382] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:317:DP-MST A]
[    2.258478] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:318:DP-MST B]
[    2.258574] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:319:DP-MST C]
[    2.258670] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:320:DP-MST D]
[    2.258782] i915 0000:00:02.0: [drm:intel_power_well_enable [i915]] enab=
ling AUX_A
[    2.260135] i915 0000:00:02.0: [drm:intel_pps_on_unlocked [i915]] [ENCOD=
ER:261:DDI A/PHY A] PPS 0 turn panel power on
[    2.260370] i915 0000:00:02.0: [drm:wait_panel_power_cycle [i915]] [ENCO=
DER:261:DDI A/PHY A] PPS 0 wait for panel power cycle (494 ms remaining)
[    2.294076] usb 3-9: new high-speed USB device number 4 using xhci_hcd
[    2.425858] usb 3-9: New USB device found, idVendor=3D30c9, idProduct=3D=
00f3, bcdDevice=3D10.16
[    2.425859] usb 3-9: New USB device strings: Mfr=3D3, Product=3D1, Seria=
lNumber=3D2
[    2.425860] usb 3-9: Product: Integrated Camera
[    2.425861] usb 3-9: Manufacturer: 8SSC21K64646V1SR57T347E
[    2.425861] usb 3-9: SerialNumber: 0001
[    2.436686] hid-generic 0003:30C9:00F3.0002: hiddev97,hidraw1: USB HID v=
1.11 Device [8SSC21K64646V1SR57T347E Integrated Camera] on usb-0000:00:14.0=
-9/input4
[    2.549017] usb 3-10: new full-speed USB device number 5 using xhci_hcd
[    2.673638] usb 3-10: New USB device found, idVendor=3D8087, idProduct=
=3D0037, bcdDevice=3D 0.00
[    2.673640] usb 3-10: New USB device strings: Mfr=3D0, Product=3D0, Seri=
alNumber=3D0
[    2.689344] hid-sensor-hub 0003:30C9:00F3.0002: hiddev97,hidraw1: USB HI=
D v1.11 Device [8SSC21K64646V1SR57T347E Integrated Camera] on usb-0000:00:1=
4.0-9/input4
[    2.758116] i915 0000:00:02.0: [drm:wait_panel_status [i915]] [ENCODER:2=
61:DDI A/PHY A] PPS 0 mask: 0xb800000f value: 0x00000000 PP_STATUS: 0x08000=
001 PP_CONTROL: 0x00000060
[    2.787095] i915 0000:00:02.0: [drm:intel_pps_on_unlocked [i915]] Wait c=
omplete
[    2.787340] i915 0000:00:02.0: [drm:intel_pps_on_unlocked [i915]] [ENCOD=
ER:261:DDI A/PHY A] PPS 0 wait for panel power on
[    2.787532] i915 0000:00:02.0: [drm:wait_panel_status [i915]] [ENCODER:2=
61:DDI A/PHY A] PPS 0 mask: 0xb000000f value: 0x80000008 PP_STATUS: 0x90000=
00a PP_CONTROL: 0x00000063
[    2.824351] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x00010000, dig 0x0000008a, pins 0x00000010, long 0x000000=
10
[    2.824461] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:261:DDI A/PHY A] - long
[    2.824539] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] Receiv=
ed HPD interrupt on PIN 4 - cnt: 20
[    2.824781] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] ignoring =
long hpd on eDP [ENCODER:261:DDI A/PHY A]
[    2.988076] i915 0000:00:02.0: [drm:intel_pps_on_unlocked [i915]] Wait c=
omplete
[    2.988962] i915 0000:00:02.0: [drm:intel_pps_vdd_on_unlocked [i915]] [E=
NCODER:261:DDI A/PHY A] PPS 0 turning VDD on
[    2.989200] i915 0000:00:02.0: [drm:intel_pps_vdd_on_unlocked [i915]] [E=
NCODER:261:DDI A/PHY A] PPS 0 PP_STATUS: 0x80000008 PP_CONTROL: 0x0000006b
[    2.989535] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x00300 AUX -> (ret=3D  3) 00 04 4b
[    2.989759] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX A/DDI A/PHY A: 0x00300 AUX <- (ret=3D  3) 00 aa 01
[    2.989967] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX A/DDI A/PHY A: 0x00600 AUX <- (ret=3D  1) 01
[    2.990067] i915 0000:00:02.0: [drm:intel_tc_port_update_mode [i915]] Po=
rt G/TC#4: TC port mode reset (legacy -> disconnected)
[    2.990182] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0xf0005 AUX -> (ret=3D  1) 00
[    2.990215] i915 0000:00:02.0: [drm:intel_tc_port_update_mode [i915]] Po=
rt E/TC#2: TC port mode reset (tbt-alt -> disconnected)
[    2.990251] i915 0000:00:02.0: [drm:intel_tc_port_update_mode [i915]] Po=
rt F/TC#3: TC port mode reset (legacy -> disconnected)
[    2.990299] i915 0000:00:02.0: [drm:intel_tc_port_update_mode [i915]] Po=
rt D/TC#1: TC port mode reset (tbt-alt -> disconnected)
[    2.990579] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x00000 AUX -> (ret=3D 15) 14 1e c4 c1 00 00 01 c0 02=
 00 02 00 00 0b 80
[    2.990956] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x02200 AUX -> (ret=3D 15) 14 1e c4 c1 00 00 01 c0 02=
 00 02 00 00 0b 80
[    2.990965] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX A/DDI A/PHY A: DPCD: 14 1e c4 c1 00 00 01 c0 02 00 02 00 00 0b =
80
[    2.991335] i915 0000:00:02.0: [drm:intel_dp_start_link_train [i915]] [C=
ONNECTOR:262:eDP-1][ENCODER:261:DDI A/PHY A][DPRX] Reloading eDP link rates
[    2.991871] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x00010 AUX -> (ret=3D 16) a4 1f 30 2a 76 2f bc 34 48=
 3f 60 54 78 69 34 9e
[    2.991883] i915 0000:00:02.0: [drm:intel_dp_start_link_train [i915]] [C=
ONNECTOR:262:eDP-1][ENCODER:261:DDI A/PHY A][DPRX] Using LINK_RATE_SET valu=
e 07
[    2.992236] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX A/DDI A/PHY A: 0x00107 AUX <- (ret=3D  2) 80 01
[    2.992451] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX A/DDI A/PHY A: 0x00101 AUX <- (ret=3D  1) 84
[    2.992656] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX A/DDI A/PHY A: 0x00115 AUX <- (ret=3D  1) 07
[    2.992669] i915 0000:00:02.0: [drm:intel_dp_set_signal_levels [i915]] [=
CONNECTOR:262:eDP-1][ENCODER:261:DDI A/PHY A][DPRX] 8b/10b, lanes: 4, vswin=
g levels: 0/0/0/0, pre-emphasis levels: 0/0/0/0
[    2.993078] i915 0000:00:02.0: [drm:intel_dp_program_link_training_patte=
rn [i915]] [CONNECTOR:262:eDP-1][ENCODER:261:DDI A/PHY A][DPRX] Using DP tr=
aining pattern TPS1
[    2.993420] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX A/DDI A/PHY A: 0x00102 AUX <- (ret=3D  5) 21 00 00 00 00
[    2.993919] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x00202 AUX -> (ret=3D  6) 11 11 80 00 00 00
[    2.993928] i915 0000:00:02.0: [drm:intel_dp_link_train_phy [i915]] [CON=
NECTOR:262:eDP-1][ENCODER:261:DDI A/PHY A][DPRX] Clock recovery OK
[    2.994071] i915 0000:00:02.0: [drm:intel_dp_program_link_training_patte=
rn [i915]] [CONNECTOR:262:eDP-1][ENCODER:261:DDI A/PHY A][DPRX] Using DP tr=
aining pattern TPS4
[    2.994400] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX A/DDI A/PHY A: 0x00102 AUX <- (ret=3D  5) 07 00 00 00 00
[    2.995280] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x00202 AUX -> (ret=3D  6) 77 77 81 00 00 00
[    2.995290] i915 0000:00:02.0: [drm:intel_dp_link_train_phy [i915]] [CON=
NECTOR:262:eDP-1][ENCODER:261:DDI A/PHY A][DPRX] Channel EQ done. DP Traini=
ng successful
[    2.995418] i915 0000:00:02.0: [drm:intel_dp_link_train_phy [i915]] [CON=
NECTOR:262:eDP-1][ENCODER:261:DDI A/PHY A][DPRX] Link Training passed at li=
nk rate =3D 810000, lane count =3D 4
[    2.995813] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX A/DDI A/PHY A: 0x00102 AUX <- (ret=3D  1) 00
[    2.995850] i915 0000:00:02.0: [drm:intel_enable_transcoder [i915]] enab=
ling pipe A
[    2.996105] i915 0000:00:02.0: [drm:intel_edp_backlight_on [i915]]=20
[    2.996272] i915 0000:00:02.0: [drm:intel_backlight_enable [i915]] pipe A
[    2.996464] i915 0000:00:02.0: [drm:intel_dp_wait_source_oui [i915]] [CO=
NNECTOR:262:eDP-1] Performing OUI wait (0 ms)
[    2.996818] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x00344 AUX -> (ret=3D  1) 00
[    2.996861] i915 0000:00:02.0: [drm:intel_backlight_set_pwm_level [i915]=
] [CONNECTOR:262:eDP-1] set backlight PWM =3D 10662
[    2.997280] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX A/DDI A/PHY A: 0x00344 AUX <- (ret=3D  1) 80
[    3.046260] i915 0000:00:02.0: [drm:intel_psr_post_plane_update [i915]] =
Enabling PSR2
[    3.046697] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX A/DDI A/PHY A: 0x00116 AUX <- (ret=3D  1) 03
[    3.046913] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX A/DDI A/PHY A: 0x00170 AUX <- (ret=3D  1) 60
[    3.047121] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX A/DDI A/PHY A: 0x00170 AUX <- (ret=3D  1) 61
[    3.047328] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX A/DDI A/PHY A: 0x00600 AUX <- (ret=3D  1) 01
[    3.047420] i915 0000:00:02.0: [drm:verify_connector_state [i915]] [CONN=
ECTOR:262:eDP-1]
[    3.047629] i915 0000:00:02.0: [drm:intel_modeset_verify_crtc [i915]] [C=
RTC:88:pipe A]
[    3.048084] i915 0000:00:02.0: [drm:intel_edp_fixup_vbt_bpp [i915]] pipe=
 has 30 bpp for eDP panel, overriding BIOS-provided max 24 bpp
[    3.048551] i915 0000:00:02.0: [drm:intel_pmdemand_program_params [i915]=
] initiate pmdemand request values: (0x2001071 0x13432a72)
[    3.048918] Console: switching to colour frame buffer device 240x75
[    3.067296] i915 0000:00:02.0: [drm] fb0: i915drmfb frame buffer device
[    3.075320] i915 0000:00:02.0: [drm:drm_fb_helper_hotplug_event]=20
[    3.075329] i915 0000:00:02.0: [drm:drm_client_modeset_probe]=20
[    3.075337] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:262:eDP-1]
[    3.075241] i915 0000:00:02.0: [drm:intel_display_driver_register [i915]=
] i915 display info: display version: 14
[    3.075343] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:2=
62:eDP-1]
[    3.075531] i915 0000:00:02.0: [drm:intel_display_driver_register [i915]=
] i915 display info: display stepping: D0
[    3.075719] i915 0000:00:02.0: [drm:intel_display_driver_register [i915]=
] i915 display info: cursor_needs_physical: no
[    3.075949] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x00060 AUX -> (ret=3D 16) 00 11 00 76 0b 01 01 80 00=
 01 06 66 08 00 00 00
[    3.075883] i915 0000:00:02.0: [drm:intel_display_driver_register [i915]=
] i915 display info: has_cdclk_crawl: yes
[    3.075968] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] DSC DPCD: 00=
 11 00 76 0b 01 01 80 00 01 06 66 08 00 00 00
[    3.076047] i915 0000:00:02.0: [drm:intel_display_driver_register [i915]=
] i915 display info: has_cdclk_squash: yes
[    3.076192] i915 0000:00:02.0: [drm:intel_display_driver_register [i915]=
] i915 display info: has_ddi: yes
[    3.076345] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x02214 AUX -> (ret=3D  1) 00
[    3.076331] i915 0000:00:02.0: [drm:intel_display_driver_register [i915]=
] i915 display info: has_dp_mst: yes
[    3.076361] i915 0000:00:02.0: [drm:intel_dp_print_rates [i915]] source =
rates: 162000, 216000, 243000, 270000, 324000, 432000, 540000, 675000, 8100=
00
[    3.076464] i915 0000:00:02.0: [drm:intel_display_driver_register [i915]=
] i915 display info: has_dsb: yes
[    3.076526] i915 0000:00:02.0: [drm:intel_dp_print_rates [i915]] sink ra=
tes: 162000, 216000, 243000, 270000, 324000, 432000, 540000, 810000
[    3.076592] i915 0000:00:02.0: [drm:intel_display_driver_register [i915]=
] i915 display info: has_fpga_dbg: yes
[    3.076700] i915 0000:00:02.0: [drm:intel_dp_print_rates [i915]] common =
rates: 162000, 216000, 243000, 270000, 324000, 432000, 540000, 810000
[    3.076715] i915 0000:00:02.0: [drm:intel_display_driver_register [i915]=
] i915 display info: has_gmch: no
[    3.076842] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:262:eDP-1] Supported Monitor Refresh rate range is 40 Hz - 60 Hz
[    3.076849] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:262:eDP-1] Assigning EDID-1.4 digital sink color depth as 10 bpc.
[    3.076852] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:262:eDP-1] ELD monitor=20
[    3.076854] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:262:eDP-1] ELD size 20, SAD count 0
[    3.076835] i915 0000:00:02.0: [drm:intel_display_driver_register [i915]=
] i915 display info: has_hotplug: yes
[    3.076859] i915 0000:00:02.0: [drm:intel_dp_set_edid [i915]] [CONNECTOR=
:262:eDP-1] VRR capable: yes
[    3.076953] i915 0000:00:02.0: [drm:intel_display_driver_register [i915]=
] i915 display info: has_hti: no
[    3.076986] i915 0000:00:02.0: [drm:intel_dp_set_edid [i915]] [CONNECTOR=
:262:eDP-1] DFP max bpc 0, max dotclock 0, TMDS clock 0-0, PCON Max FRL BW =
0Gbps
[    3.077087] i915 0000:00:02.0: [drm:intel_display_driver_register [i915]=
] i915 display info: has_ipc: yes
[    3.077119] i915 0000:00:02.0: [drm:intel_dp_set_edid [i915]] [CONNECTOR=
:262:eDP-1] RGB->YcbCr conversion? no, YCbCr 4:2:0 allowed? yes, YCbCr 4:4:=
4->4:2:0 conversion? no
[    3.077213] i915 0000:00:02.0: [drm:intel_display_driver_register [i915]=
] i915 display info: has_overlay: no
[    3.077333] i915 0000:00:02.0: [drm:intel_display_driver_register [i915]=
] i915 display info: has_psr: yes
[    3.077431] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x03000 AUX -> (ret=3D  1) 00
[    3.077446] i915 0000:00:02.0: [drm:intel_display_driver_register [i915]=
] i915 display info: has_psr_hw_tracking: no
[    3.077556] i915 0000:00:02.0: [drm:intel_display_driver_register [i915]=
] i915 display info: overlay_needs_physical: no
[    3.077639] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x00201 AUX -> (ret=3D  1) 00
[    3.077699] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:262:eDP-1] probed modes:
[    3.077704] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "3840x2400": 60 605000 3840 3888 3920 4000 2400 2403 2408=
 2520 0x48 0xa
[    3.077710] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:271:DP-1]
[    3.077664] i915 0000:00:02.0: [drm:intel_display_driver_register [i915]=
] i915 display info: supports_tv: no
[    3.077713] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:2=
71:DP-1]
[    3.077767] i915 0000:00:02.0: [drm:intel_display_driver_register [i915]=
] i915 display info: has_hdcp: yes
[    3.077871] i915 0000:00:02.0: [drm:intel_display_driver_register [i915]=
] i915 display info: has_dmc: yes
[    3.077977] i915 0000:00:02.0: [drm:intel_display_driver_register [i915]=
] i915 display info: has_dsc: yes
[    3.078098] i915 0000:00:02.0: [drm:intel_display_driver_register [i915]=
] i915 display info: rawclk rate: 38400 kHz
[    3.078286] [drm:intel_dsm_detect.isra.0 [i915]] no _DSM method for inte=
l device
[    3.078532] [drm:intel_dsm_detect.isra.0 [i915]] no _DSM method for inte=
l device
[    3.078733] i915 0000:00:02.0: [drm:intel_power_well_disable [i915]] dis=
abling PW_D
[    3.078941] i915 0000:00:02.0: [drm:intel_power_well_disable [i915]] dis=
abling PW_C
[    3.079157] i915 0000:00:02.0: [drm:intel_power_well_disable [i915]] dis=
abling PW_B
[    3.079351] i915 0000:00:02.0: [drm:intel_power_well_disable [i915]] dis=
abling PW_2
[    3.079549] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: pciid=3D0x7d51 rev=3D0x03 platform=3DMETEORLAKE (subplatform=3D0x1) gen=
=3D12
[    3.079696] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: graphics version: 12.74
[    3.079833] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: media version: 13
[    3.079961] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: graphics stepping: B0
[    3.080096] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: media stepping: C0
[    3.080215] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: gt: 0
[    3.080331] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: memory-regions: 0x41
[    3.080444] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: page-sizes: 0x211000
[    3.080555] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: platform: METEORLAKE
[    3.080664] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: ppgtt-size: 48
[    3.080770] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: ppgtt-type: 2
[    3.080876] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: dma_mask_size: 46
[    3.080979] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: is_mobile: no
[    3.081093] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: require_force_probe: no
[    3.081195] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: is_dgfx: no
[    3.081293] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: has_64bit_reloc: yes
[    3.081393] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: has_64k_pages: no
[    3.081491] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: gpu_reset_clobbers_display: no
[    3.081588] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: has_reset_engine: yes
[    3.081685] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: has_3d_pipeline: yes
[    3.081782] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: has_flat_ccs: no
[    3.081879] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: has_global_mocs: yes
[    3.082018] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:271:DP-1] disconnected
[    3.082022] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:283:HDMI-A-1]
[    3.081978] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: has_gmd_id: yes
[    3.082026] i915 0000:00:02.0: [drm:intel_hdmi_detect [i915]] [CONNECTOR=
:283:HDMI-A-1]
[    3.082089] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: has_gt_uc: yes
[    3.082187] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: has_heci_pxp: no
[    3.082284] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: has_heci_gscfi: no
[    3.082380] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: has_guc_deprivilege: yes
[    3.082477] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: has_guc_tlb_invalidation: yes
[    3.082572] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: has_l3_ccs_read: no
[    3.082668] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: has_l3_dpf: no
[    3.082766] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: has_llc: no
[    3.082869] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: has_logical_ring_contexts: yes
[    3.082969] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: has_logical_ring_elsq: yes
[    3.083081] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: has_media_ratio_mode: no
[    3.083180] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: has_mslice_steering: no
[    3.083277] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: has_oa_bpc_reporting: yes
[    3.083373] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: has_oa_slice_contrib_limits: yes
[    3.083488] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: has_oam: yes
[    3.083599] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: has_one_eu_per_fuse_bit: no
[    3.083693] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: has_pxp: yes
[    3.083788] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: has_rc6: yes
[    3.083883] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: has_rc6p: no
[    3.083977] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: has_rps: yes
[    3.084086] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: has_runtime_pm: yes
[    3.084183] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: has_snoop: yes
[    3.084277] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: has_coherent_ggtt: no
[    3.084371] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: tuning_thread_rr_after_dep: no
[    3.084466] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: unfenced_needs_alignment: no
[    3.084561] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: hws_needs_physical: no
[    3.084655] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: has_pooled_eu: no
[    3.084748] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: iommu: enabled
[    3.084843] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: available engines: 400003
[    3.084938] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: subslice total: 8
[    3.085037] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: geometry dss mask=3D00000000,000000ff
[    3.085132] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: compute dss mask=3D00000000,000000ff
[    3.085226] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: EU total: 128
[    3.085320] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: EU per subslice: 16
[    3.085414] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: has slice power gating: no
[    3.085508] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: has subslice power gating: no
[    3.085602] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: has EU power gating: no
[    3.085696] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: available engines: 4041400
[    3.085790] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: subslice total: 8
[    3.085884] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: geometry dss mask=3D00000000,0000ff00
[    3.085978] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: compute dss mask=3D00000000,0000ff00
[    3.086086] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: EU total: 128
[    3.086180] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: EU per subslice: 16
[    3.086274] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: has slice power gating: no
[    3.086367] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: has subslice power gating: no
[    3.086460] i915 0000:00:02.0: [drm:i915_driver_probe [i915]] device inf=
o: has EU power gating: no
[    3.087020] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:283:HDMI-A-1] disconnected
[    3.087024] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:289:DP-2]
[    3.087027] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:2=
89:DP-2]
[    3.087244] i915 0000:00:02.0: [drm:intel_tc_port_update_mode [i915]] Po=
rt D/TC#1: TC port mode reset (disconnected -> tbt-alt)
[    3.087437] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:289:DP-2] disconnected
[    3.087441] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:298:DP-3]
[    3.087444] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:2=
98:DP-3]
[    3.087613] i915 0000:00:02.0: [drm:intel_tc_port_update_mode [i915]] Po=
rt E/TC#2: TC port mode reset (disconnected -> tbt-alt)
[    3.087817] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:298:DP-3] disconnected
[    3.087822] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:307:DP-4]
[    3.087825] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:3=
07:DP-4]
[    3.088007] i915 0000:00:02.0: [drm:intel_tc_port_update_mode [i915]] Po=
rt F/TC#3: TC port mode reset (disconnected -> legacy)
[    3.093055] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:307:DP-4] disconnected
[    3.093059] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:316:DP-5]
[    3.093062] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:3=
16:DP-5]
[    3.093274] i915 0000:00:02.0: [drm:intel_tc_port_update_mode [i915]] Po=
rt G/TC#4: TC port mode reset (disconnected -> legacy)
[    3.098064] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:316:DP-5] disconnected
[    3.098070] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:262:eDP-1] enabled? yes
[    3.098075] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:271:DP-1] enabled? no
[    3.098078] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:283:HDMI-A-1] enabled? no
[    3.098081] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:289:DP-2] enabled? no
[    3.098084] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:298:DP-3] enabled? no
[    3.098086] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:307:DP-4] enabled? no
[    3.098089] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:316:DP-5] enabled? no
[    3.098094] i915 0000:00:02.0: [drm:drm_client_modeset_probe] Not using =
firmware configuration
[    3.098098] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:262:eDP-1] found preferred mode: 3840x2400
[    3.098101] i915 0000:00:02.0: [drm:drm_client_modeset_probe] picking CR=
TCs for 3840x2400 config
[    3.098106] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CRTC:88:p=
ipe A] desired mode 3840x2400 set (0,0)
[    3.113328] i915 0000:00:02.0: [drm:drm_client_hotplug] fbdev: ret=3D0
[    3.113342] i915 0000:00:02.0: [drm:drm_fb_helper_hotplug_event]=20
[    3.113346] i915 0000:00:02.0: [drm:drm_client_modeset_probe]=20
[    3.113352] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:262:eDP-1]
[    3.113356] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:2=
62:eDP-1]
[    3.113928] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x00060 AUX -> (ret=3D 16) 00 11 00 76 0b 01 01 80 00=
 01 06 66 08 00 00 00
[    3.113947] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] DSC DPCD: 00=
 11 00 76 0b 01 01 80 00 01 06 66 08 00 00 00
[    3.114299] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x02214 AUX -> (ret=3D  1) 00
[    3.114313] i915 0000:00:02.0: [drm:intel_dp_print_rates [i915]] source =
rates: 162000, 216000, 243000, 270000, 324000, 432000, 540000, 675000, 8100=
00
[    3.114450] i915 0000:00:02.0: [drm:intel_dp_print_rates [i915]] sink ra=
tes: 162000, 216000, 243000, 270000, 324000, 432000, 540000, 810000
[    3.114609] i915 0000:00:02.0: [drm:intel_dp_print_rates [i915]] common =
rates: 162000, 216000, 243000, 270000, 324000, 432000, 540000, 810000
[    3.114775] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:262:eDP-1] Supported Monitor Refresh rate range is 40 Hz - 60 Hz
[    3.114781] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:262:eDP-1] Assigning EDID-1.4 digital sink color depth as 10 bpc.
[    3.114784] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:262:eDP-1] ELD monitor=20
[    3.114787] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:262:eDP-1] ELD size 20, SAD count 0
[    3.114793] i915 0000:00:02.0: [drm:intel_dp_set_edid [i915]] [CONNECTOR=
:262:eDP-1] VRR capable: yes
[    3.114950] i915 0000:00:02.0: [drm:intel_dp_set_edid [i915]] [CONNECTOR=
:262:eDP-1] DFP max bpc 0, max dotclock 0, TMDS clock 0-0, PCON Max FRL BW =
0Gbps
[    3.115122] i915 0000:00:02.0: [drm:intel_dp_set_edid [i915]] [CONNECTOR=
:262:eDP-1] RGB->YcbCr conversion? no, YCbCr 4:2:0 allowed? yes, YCbCr 4:4:=
4->4:2:0 conversion? no
[    3.115451] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x03000 AUX -> (ret=3D  1) 00
[    3.115658] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x00201 AUX -> (ret=3D  1) 00
[    3.115716] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:262:eDP-1] probed modes:
[    3.115720] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "3840x2400": 60 605000 3840 3888 3920 4000 2400 2403 2408=
 2520 0x48 0xa
[    3.115725] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:271:DP-1]
[    3.115729] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:2=
71:DP-1]
[    3.120026] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:271:DP-1] disconnected
[    3.120031] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:283:HDMI-A-1]
[    3.120034] i915 0000:00:02.0: [drm:intel_hdmi_detect [i915]] [CONNECTOR=
:283:HDMI-A-1]
[    3.125017] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:283:HDMI-A-1] disconnected
[    3.125021] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:289:DP-2]
[    3.125024] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:2=
89:DP-2]
[    3.125203] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:289:DP-2] disconnected
[    3.125207] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:298:DP-3]
[    3.125211] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:2=
98:DP-3]
[    3.125396] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:298:DP-3] disconnected
[    3.125401] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:307:DP-4]
[    3.125404] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:3=
07:DP-4]
[    3.130018] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:307:DP-4] disconnected
[    3.130022] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:316:DP-5]
[    3.130025] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:3=
16:DP-5]
[    3.135019] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:316:DP-5] disconnected
[    3.135025] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:262:eDP-1] enabled? yes
[    3.135029] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:271:DP-1] enabled? no
[    3.135031] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:283:HDMI-A-1] enabled? no
[    3.135034] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:289:DP-2] enabled? no
[    3.135037] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:298:DP-3] enabled? no
[    3.135040] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:307:DP-4] enabled? no
[    3.135042] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:316:DP-5] enabled? no
[    3.135049] i915 0000:00:02.0: [drm:drm_client_modeset_probe] Not using =
firmware configuration
[    3.135052] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:262:eDP-1] found preferred mode: 3840x2400
[    3.135056] i915 0000:00:02.0: [drm:drm_client_modeset_probe] picking CR=
TCs for 3840x2400 config
[    3.135060] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CRTC:88:p=
ipe A] desired mode 3840x2400 set (0,0)
[    3.146135] i915 0000:00:02.0: [drm:drm_client_hotplug] fbdev: ret=3D0
[    4.142098] i915 0000:00:02.0: [drm:intel_tc_port_update_mode [i915]] Po=
rt G/TC#4: TC port mode reset (legacy -> disconnected)
[    4.142151] i915 0000:00:02.0: [drm:intel_tc_port_update_mode [i915]] Po=
rt F/TC#3: TC port mode reset (legacy -> disconnected)
[    4.142238] i915 0000:00:02.0: [drm:intel_tc_port_update_mode [i915]] Po=
rt D/TC#1: TC port mode reset (tbt-alt -> disconnected)
[    4.142198] i915 0000:00:02.0: [drm:intel_tc_port_update_mode [i915]] Po=
rt E/TC#2: TC port mode reset (tbt-alt -> disconnected)
[    5.678032] i915 0000:00:02.0: [drm:intel_pps_vdd_off_sync_unlocked [i91=
5]] [ENCODER:261:DDI A/PHY A] PPS 0 turning VDD off
[    5.678139] i915 0000:00:02.0: [drm:intel_pps_vdd_off_sync_unlocked [i91=
5]] [ENCODER:261:DDI A/PHY A] PPS 0 PP_STATUS: 0x80000008 PP_CONTROL: 0x000=
00067
[    5.678201] i915 0000:00:02.0: [drm:intel_power_well_disable [i915]] dis=
abling DC_off
[    5.678299] i915 0000:00:02.0: [drm:skl_enable_dc6 [i915]] Enabling DC6
[    5.678386] i915 0000:00:02.0: [drm:gen9_set_dc_state.part.0 [i915]] Set=
ting DC state from 00 to 02
[    8.501061] Key type trusted registered
[    8.504088] Key type encrypted registered
[    8.570964] BTRFS: device fsid 4c822bc7-e8c9-4eaa-a480-99294e826ed1 devi=
d 1 transid 1384401 /dev/mapper/luks-3fcd7043-2e72-42fb-84ef-a42a377fbebd (=
253:0) scanned by mount (454)
[    8.571461] BTRFS info (device dm-0): first mount of filesystem 4c822bc7=
-e8c9-4eaa-a480-99294e826ed1
[    8.571466] BTRFS info (device dm-0): using crc32c (crc32c-lib) checksum=
 algorithm
[    8.697557] BTRFS info (device dm-0): enabling ssd optimizations
[    8.697561] BTRFS info (device dm-0): turning on async discard
[    8.697561] BTRFS info (device dm-0): enabling free space tree
[    8.816737] systemd-journald[203]: Received SIGTERM from PID 1 (systemd).
[    8.885945] systemd[1]: systemd 258.1-1-arch running in system mode (+PA=
M +AUDIT -SELINUX +APPARMOR -IMA +IPE +SMACK +SECCOMP +GCRYPT +GNUTLS +OPEN=
SSL +ACL +BLKID +CURL +ELFUTILS +FIDO2 +IDN2 -IDN +IPTC +KMOD +LIBCRYPTSETU=
P +LIBCRYPTSETUP_PLUGINS +LIBFDISK +PCRE2 +PWQUALITY +P11KIT +QRENCODE +TPM=
2 +BZIP2 +LZ4 +XZ +ZLIB +ZSTD +BPF_FRAMEWORK +BTF +XKBCOMMON +UTMP -SYSVINI=
T +LIBARCHIVE)
[    8.885953] systemd[1]: Detected architecture x86-64.
[    8.887828] systemd[1]: Hostname set to <frigg>.
[    8.968429] systemd[1]: bpf-restrict-fs: LSM BPF program attached
[    9.108489] systemd[1]: initrd-switch-root.service: Deactivated successf=
ully.
[    9.108579] systemd[1]: Stopped Switch Root.
[    9.109661] systemd[1]: systemd-journald.service: Scheduled restart job,=
 restart counter is at 1.
[    9.109866] systemd[1]: Created slice Virtual Machine and Container Slic=
e.
[    9.110575] systemd[1]: Created slice Slice /system/dirmngr.
[    9.111227] systemd[1]: Created slice Slice /system/getty.
[    9.112221] systemd[1]: Created slice Slice /system/gpg-agent.
[    9.113196] systemd[1]: Created slice Slice /system/gpg-agent-browser.
[    9.114158] systemd[1]: Created slice Slice /system/gpg-agent-extra.
[    9.115132] systemd[1]: Created slice Slice /system/gpg-agent-ssh.
[    9.116021] systemd[1]: Created slice Slice /system/keyboxd.
[    9.116585] systemd[1]: Created slice Slice /system/modprobe.
[    9.117135] systemd[1]: Created slice Slice /system/syncthing.
[    9.117640] systemd[1]: Created slice User and Session Slice.
[    9.118061] systemd[1]: Started Dispatch Password Requests to Console Di=
rectory Watch.
[    9.118798] systemd[1]: Started Forward Password Requests to Wall Direct=
ory Watch.
[    9.119574] systemd[1]: Set up automount Arbitrary Executable File Forma=
ts File System Automount Point.
[    9.120042] systemd[1]: Expecting device /dev/disk/by-uuid/BAF2-8DB7...
[    9.120511] systemd[1]: Reached target Local Encrypted Volumes.
[    9.121004] systemd[1]: Reached target Image Downloads.
[    9.121502] systemd[1]: Stopped target Switch Root.
[    9.121989] systemd[1]: Stopped target Initrd File Systems.
[    9.122477] systemd[1]: Stopped target Initrd Root File System.
[    9.122966] systemd[1]: Reached target Local Integrity Protected Volumes.
[    9.123534] systemd[1]: Reached target Path Units.
[    9.124027] systemd[1]: Reached target Remote File Systems.
[    9.124499] systemd[1]: Reached target Slice Units.
[    9.124960] systemd[1]: Reached target Swaps.
[    9.125423] systemd[1]: Reached target Local Verity Protected Volumes.
[    9.125868] systemd[1]: Reached target libvirt guests shutdown target.
[    9.126563] systemd[1]: Listening on Device-mapper event daemon FIFOs.
[    9.127384] systemd[1]: Listening on LVM2 poll daemon socket.
[    9.128507] systemd[1]: Listening on Query the User Interactively for a =
Password.
[    9.129421] systemd[1]: Listening on Process Core Dump Socket.
[    9.133127] systemd[1]: Listening on Credential Encryption/Decryption.
[    9.134470] systemd[1]: Listening on Factory Reset Management.
[    9.135388] systemd[1]: Listening on Network Service Varlink Socket.
[    9.136275] systemd[1]: Listening on Network Service Netlink Socket.
[    9.142663] systemd[1]: Listening on TPM PCR Measurements.
[    9.143742] systemd[1]: Listening on Make TPM PCR Policy.
[    9.144184] systemd[1]: Listening on Resolve Monitor Varlink Socket.
[    9.144611] systemd[1]: Listening on Resolve Service Varlink Socket.
[    9.145046] systemd[1]: Listening on udev Control Socket.
[    9.145476] systemd[1]: Listening on udev Varlink Socket.
[    9.146850] systemd[1]: Mounting Huge Pages File System...
[    9.148281] systemd[1]: Mounting POSIX Message Queue File System...
[    9.149428] systemd[1]: Mounting Kernel Debug File System...
[    9.168309] systemd[1]: Mounting Kernel Trace File System...
[    9.169480] systemd[1]: Mounting Temporary Directory /tmp...
[    9.171452] systemd[1]: Starting Create List of Static Device Nodes...
[    9.173575] systemd[1]: Starting Monitoring of LVM2 mirrors, snapshots e=
tc. using dmeventd or progress polling...
[    9.174537] systemd[1]: Load Kernel Module configfs was skipped because =
of an unmet condition check (ConditionKernelModuleLoaded=3D!configfs).
[    9.175145] systemd[1]: Mounting Kernel Configuration File System...
[    9.176849] systemd[1]: Load Kernel Module dm_mod was skipped because of=
 an unmet condition check (ConditionKernelModuleLoaded=3D!dm_mod).
[    9.176890] systemd[1]: Load Kernel Module drm was skipped because of an=
 unmet condition check (ConditionKernelModuleLoaded=3D!drm).
[    9.176916] systemd[1]: Load Kernel Module fuse was skipped because of a=
n unmet condition check (ConditionKernelModuleLoaded=3D!fuse).
[    9.177682] systemd[1]: Mounting FUSE Control File System...
[    9.179647] systemd[1]: Starting Load Kernel Module loop...
[    9.180934] systemd[1]: systemd-cryptsetup@luks\x2d3fcd7043\x2d2e72\x2d4=
2fb\x2d84ef\x2da42a377fbebd.service: Deactivated successfully.
[    9.180956] systemd[1]: Stopped systemd-cryptsetup@luks\x2d3fcd7043\x2d2=
e72\x2d42fb\x2d84ef\x2da42a377fbebd.service.
[    9.181839] systemd[1]: systemd-cryptsetup@luks\x2d3fcd7043\x2d2e72\x2d4=
2fb\x2d84ef\x2da42a377fbebd.service: Consumed 5.892s CPU time, 1G memory pe=
ak.
[    9.182010] systemd[1]: systemd-fsck-root.service: Deactivated successfu=
lly.
[    9.182049] systemd[1]: Stopped File System Check on Root Device.
[    9.183058] systemd[1]: Clear Stale Hibernate Storage Info was skipped b=
ecause of an unmet condition check (ConditionPathExists=3D/sys/firmware/efi=
/efivars/HibernateLocation-8cf2644b-4b0b-428f-9387-6d876050dc67).
[    9.184435] systemd[1]: Starting Load Kernel Modules...
[    9.186493] systemd[1]: Starting TPM PCR Machine ID Measurement...
[    9.188403] systemd[1]: Starting Remount Root and Kernel File Systems...
[    9.190002] loop: module loaded
[    9.190807] systemd[1]: Starting Early TPM SRK Setup...
[    9.195818] systemd[1]: Starting Load udev Rules from Credentials...
[    9.198118] systemd[1]: Starting Coldplug All udev Devices...
[    9.202867] systemd[1]: Mounted Huge Pages File System.
[    9.204198] systemd[1]: Mounted POSIX Message Queue File System.
[    9.205624] systemd[1]: Mounted Kernel Debug File System.
[    9.207101] systemd[1]: Mounted Kernel Trace File System.
[    9.207253] i2c_dev: i2c /dev entries driver
[    9.208161] systemd[1]: Mounted Temporary Directory /tmp.
[    9.209160] systemd[1]: Finished Create List of Static Device Nodes.
[    9.210025] systemd[1]: Mounted Kernel Configuration File System.
[    9.211391] systemd[1]: Mounted FUSE Control File System.
[    9.212376] systemd[1]: modprobe@loop.service: Deactivated successfully.
[    9.212470] systemd[1]: Finished Load Kernel Module loop.
[    9.213583] systemd[1]: Finished Load udev Rules from Credentials.
[    9.215256] systemd[1]: Starting Create Static Device Nodes in /dev grac=
efully...
[    9.227792] systemd[1]: Finished Monitoring of LVM2 mirrors, snapshots e=
tc. using dmeventd or progress polling.
[    9.233905] systemd[1]: Finished Create Static Device Nodes in /dev grac=
efully.
[    9.235888] systemd[1]: Finished TPM PCR Machine ID Measurement.
[    9.251636] systemd[1]: Finished Early TPM SRK Setup.
[    9.253221] systemd[1]: Repartition Root Disk was skipped because no tri=
gger condition checks were met.
[    9.281488] nvidia: loading out-of-tree module taints kernel.
[    9.281506] nvidia: module verification failed: signature and/or require=
d key missing - tainting kernel
[    9.346147] nvidia-nvlink: Nvlink Core is being initialized, major devic=
e number 234

[    9.349835] systemd[1]: Finished Coldplug All udev Devices.
[    9.350953] nvidia 0000:01:00.0: enabling device (0000 -> 0003)
[    9.351319] nvidia 0000:01:00.0: vgaarb: VGA decodes changed: olddecodes=
=3Dio+mem,decodes=3Dnone:owns=3Dnone
[    9.362730] NVRM: loading NVIDIA UNIX Open Kernel Module for x86_64  580=
=2E95.05  Release Build  (root@frigg) =20
[    9.441246] BTRFS info (device dm-0 state M): force zstd compression, le=
vel 3
[    9.442609] systemd[1]: Finished Remount Root and Kernel File Systems.
[    9.446446] systemd[1]: Rebuild Hardware Database was skipped because of=
 an unmet condition check (ConditionNeedsUpdate=3D/etc).
[    9.447962] systemd[1]: Starting Load/Save OS Random Seed...
[    9.448812] systemd[1]: Create System Users was skipped because no trigg=
er condition checks were met.
[    9.477506] systemd[1]: Starting Network Time Synchronization...
[    9.477797] Asymmetric key parser 'pkcs8' registered
[    9.479615] systemd[1]: Starting Create Static Device Nodes in /dev...
[    9.481502] systemd[1]: Starting TPM SRK Setup...
[    9.482859] systemd[1]: Finished Load Kernel Modules.
[    9.484733] systemd[1]: Starting Apply Kernel Variables...
[    9.494979] systemd[1]: Finished Load/Save OS Random Seed.
[    9.498208] systemd[1]: Finished Create Static Device Nodes in /dev.
[    9.499519] systemd[1]: Reached target Preparation for Local File System=
s.
[    9.500366] systemd[1]: Entropy Daemon based on the HAVEGE algorithm was=
 skipped because of an unmet condition check (ConditionVersion=3D<5.6).
[    9.501939] systemd[1]: Starting Journal Service...
[    9.504100] systemd[1]: Starting Rule-based Manager for Device Events an=
d Files...
[    9.505360] systemd[1]: Finished Apply Kernel Variables.
[    9.507864] systemd[1]: Starting Network Name Resolution...
[    9.512858] systemd-journald[564]: Collecting audit messages is disabled.
[    9.514533] systemd[1]: Started Network Time Synchronization.
[    9.515558] systemd[1]: Reached target System Time Set.
[    9.518045] systemd[1]: Started Journal Service.
[    9.529056] systemd-journald[564]: Received client request to flush runt=
ime journal.
[    9.653988] intel_pmc_ssram_telemetry 0000:00:14.2: enabling device (000=
0 -> 0002)
[    9.702963] resource: resource sanity check: requesting [mem 0x00000000f=
edc0000-0x00000000fedcffff], which spans more than pnp 00:05 [mem 0xfedc000=
0-0xfedc7fff]
[    9.702969] caller igen6_probe+0x155/0x81c [igen6_edac] mapping multiple=
 BARs
[    9.703062] EDAC MC0: Giving out device to module igen6_edac controller =
Intel_client_SoC MC#0: DEV 0000:00:00.0 (INTERRUPT)
[    9.703132] EDAC MC1: Giving out device to module igen6_edac controller =
Intel_client_SoC MC#1: DEV 0000:00:00.0 (INTERRUPT)
[    9.703176] EDAC igen6: v2.5.1
[    9.722578] intel_vpu 0000:00:0b.0: enabling device (0000 -> 0002)
[    9.733880] intel_vpu 0000:00:0b.0: [drm] Firmware: intel/vpu/vpu_37xx_v=
1.bin, version: 20250925*MTL_CLIENT_SILICON-NVR+NN-deployment*2485cfeafeed5=
91eaa9a320bfae2407c1b83b29f*2485cfeafeed591eaa9a320bfae2407c1b83b29f*2485cf=
eafee
[    9.733890] intel_vpu 0000:00:0b.0: [drm] Scheduler mode: HW
[    9.742451] pci 0000:00:08.0: Setting to D3hot
[    9.743026] ACPI: bus type thunderbolt registered
[    9.743740] thunderbolt 0000:00:0d.2: total paths: 12
[    9.743746] thunderbolt 0000:00:0d.2: IOMMU DMA protection is enabled
[    9.749551] intel-lpss 0000:00:15.0: enabling device (0000 -> 0002)
[    9.749739] cfg80211: Loading compiled-in X.509 certificates for regulat=
ory database
[    9.749848] Loaded X.509 cert 'sforshee: 00b28ddf47aef9cea7'
[    9.749931] Loaded X.509 cert 'wens: 61c038651aabdcf94bd0ac7ff06c7248db1=
8c600'
[    9.754051] intel_pmc_core INT33A1:00: Assuming a default substate order=
 for this platform
[    9.754062] intel_pmc_core INT33A1:00: pmc_core: couldn't get DMU telem =
endpoint -6
[    9.754145] idma64 idma64.0: Found Intel integrated DMA 64-bit
[    9.754788] intel_pmc_core INT33A1:00:  initialized
[    9.765991] intel-lpss 0000:00:19.0: enabling device (0000 -> 0002)
[    9.766169] thunderbolt 0000:00:0d.2: allocating TX ring 0 of size 10
[    9.766190] thunderbolt 0000:00:0d.2: allocating RX ring 0 of size 10
[    9.766203] thunderbolt 0000:00:0d.2: control channel created
[    9.766205] thunderbolt 0000:00:0d.2: using software connection manager
[    9.779771] thunderbolt 0000:00:0d.2: created link from 0000:00:07.0
[    9.779838] thunderbolt 0000:00:0d.2: NHI initialized, starting thunderb=
olt
[    9.779840] thunderbolt 0000:00:0d.2: control channel starting...
[    9.779841] thunderbolt 0000:00:0d.2: starting TX ring 0
[    9.779846] thunderbolt 0000:00:0d.2: enabling interrupt at register 0x3=
8200 bit 0 (0x0 -> 0x1)
[    9.779847] thunderbolt 0000:00:0d.2: starting RX ring 0
[    9.779851] thunderbolt 0000:00:0d.2: enabling interrupt at register 0x3=
8200 bit 12 (0x1 -> 0x1001)
[    9.779854] thunderbolt 0000:00:0d.2: security level set to user
[    9.785982] thunderbolt 0000:00:0d.2: current switch config:
[    9.785998] thunderbolt 0000:00:0d.2:  USB4 Switch: 8087:7ec2 (Revision:=
 2, TB Version: 32)
[    9.786000] thunderbolt 0000:00:0d.2:   Max Port Number: 13
[    9.786001] thunderbolt 0000:00:0d.2:   Config:
[    9.786001] thunderbolt 0000:00:0d.2:    Upstream Port Number: 7 Depth: =
0 Route String: 0x0 Enabled: 1, PlugEventsDelay: 254ms
[    9.786003] thunderbolt 0000:00:0d.2:    unknown1: 0x0 unknown4: 0x0
[    9.790501] thunderbolt 0000:00:0d.2: initializing Switch at 0x0 (depth:=
 0, up port: 7)
[    9.792008] thunderbolt 0000:00:0d.2: 0: credit allocation parameters:
[    9.792019] thunderbolt 0000:00:0d.2: 0:  USB3: 32
[    9.792021] thunderbolt 0000:00:0d.2: 0:  DP AUX: 1
[    9.792023] thunderbolt 0000:00:0d.2: 0:  DP main: 0
[    9.792024] thunderbolt 0000:00:0d.2: 0:  PCIe: 64
[    9.792026] thunderbolt 0000:00:0d.2: 0:  DMA: 14
[    9.794437] thunderbolt 0000:00:0d.2: 0: DROM version: 3
[    9.794755] thunderbolt 0000:00:0d.2: 0: uid: 0x2d25d6f08087cbfc
[    9.796429] thunderbolt 0000:00:0d.2:  Port 1: 8087:15ea (Revision: 0, T=
B Version: 1, Type: Port (0x1))
[    9.796435] thunderbolt 0000:00:0d.2:   Max hop id (in/out): 19/19
[    9.796438] thunderbolt 0000:00:0d.2:   Max counters: 16
[    9.796440] thunderbolt 0000:00:0d.2:   NFC Credits: 0x83c00000
[    9.796442] thunderbolt 0000:00:0d.2:   Credits (total/control): 60/2
[    9.798267] thunderbolt 0000:00:0d.2:  Port 2: 8087:15ea (Revision: 0, T=
B Version: 1, Type: Port (0x1))
[    9.798275] thunderbolt 0000:00:0d.2:   Max hop id (in/out): 19/19
[    9.798277] thunderbolt 0000:00:0d.2:   Max counters: 16
[    9.798279] thunderbolt 0000:00:0d.2:   NFC Credits: 0x83c00000
[    9.798280] thunderbolt 0000:00:0d.2:   Credits (total/control): 60/2
[    9.800179] thunderbolt 0000:00:0d.2:  Port 3: 8087:15ea (Revision: 0, T=
B Version: 1, Type: Port (0x1))
[    9.800183] thunderbolt 0000:00:0d.2:   Max hop id (in/out): 19/19
[    9.800184] thunderbolt 0000:00:0d.2:   Max counters: 16
[    9.800185] thunderbolt 0000:00:0d.2:   NFC Credits: 0x83c00000
[    9.800186] thunderbolt 0000:00:0d.2:   Credits (total/control): 60/2
[    9.802012] thunderbolt 0000:00:0d.2:  Port 4: 8087:15ea (Revision: 0, T=
B Version: 1, Type: Port (0x1))
[    9.802021] thunderbolt 0000:00:0d.2:   Max hop id (in/out): 19/19
[    9.802022] thunderbolt 0000:00:0d.2:   Max counters: 16
[    9.802023] thunderbolt 0000:00:0d.2:   NFC Credits: 0x83c00000
[    9.802024] thunderbolt 0000:00:0d.2:   Credits (total/control): 60/2
[    9.802344] thunderbolt 0000:00:0d.2:  Port 5: 8087:15ea (Revision: 0, T=
B Version: 1, Type: DP/HDMI (0xe0101))
[    9.802346] thunderbolt 0000:00:0d.2:   Max hop id (in/out): 9/9
[    9.802347] thunderbolt 0000:00:0d.2:   Max counters: 2
[    9.802348] thunderbolt 0000:00:0d.2:   NFC Credits: 0x100000d
[    9.802348] thunderbolt 0000:00:0d.2:   Credits (total/control): 16/0
[    9.802677] thunderbolt 0000:00:0d.2:  Port 6: 8087:15ea (Revision: 0, T=
B Version: 1, Type: DP/HDMI (0xe0101))
[    9.802681] thunderbolt 0000:00:0d.2:   Max hop id (in/out): 9/9
[    9.802683] thunderbolt 0000:00:0d.2:   Max counters: 2
[    9.802683] thunderbolt 0000:00:0d.2:   NFC Credits: 0x100000d
[    9.802684] thunderbolt 0000:00:0d.2:   Credits (total/control): 16/0
[    9.803679] thunderbolt 0000:00:0d.2:  Port 7: 8086:15ea (Revision: 0, T=
B Version: 1, Type: NHI (0x2))
[    9.803681] thunderbolt 0000:00:0d.2:   Max hop id (in/out): 11/11
[    9.803681] thunderbolt 0000:00:0d.2:   Max counters: 16
[    9.803682] thunderbolt 0000:00:0d.2:   NFC Credits: 0x1c00000
[    9.803683] thunderbolt 0000:00:0d.2:   Credits (total/control): 28/0
[    9.804043] thunderbolt 0000:00:0d.2:  Port 8: 8087:15ea (Revision: 0, T=
B Version: 1, Type: PCIe (0x100101))
[    9.804044] thunderbolt 0000:00:0d.2:   Max hop id (in/out): 8/8
[    9.804045] thunderbolt 0000:00:0d.2:   Max counters: 2
[    9.804045] thunderbolt 0000:00:0d.2:   NFC Credits: 0x800000
[    9.804046] thunderbolt 0000:00:0d.2:   Credits (total/control): 8/0
[    9.804171] mc: Linux media interface: v0.10
[    9.804347] thunderbolt 0000:00:0d.2:  Port 9: 8087:15ea (Revision: 0, T=
B Version: 1, Type: PCIe (0x100101))
[    9.804349] thunderbolt 0000:00:0d.2:   Max hop id (in/out): 8/8
[    9.804349] thunderbolt 0000:00:0d.2:   Max counters: 2
[    9.804350] thunderbolt 0000:00:0d.2:   NFC Credits: 0x800000
[    9.804350] thunderbolt 0000:00:0d.2:   Credits (total/control): 8/0
[    9.804514] thunderbolt 0000:00:0d.2:  Port 10: not implemented
[    9.804681] thunderbolt 0000:00:0d.2:  Port 11: not implemented
[    9.805022] thunderbolt 0000:00:0d.2:  Port 12: 8087:0 (Revision: 0, TB =
Version: 1, Type: USB (0x200101))
[    9.805024] thunderbolt 0000:00:0d.2:   Max hop id (in/out): 8/8
[    9.805025] thunderbolt 0000:00:0d.2:   Max counters: 2
[    9.805026] thunderbolt 0000:00:0d.2:   NFC Credits: 0x800000
[    9.805027] thunderbolt 0000:00:0d.2:   Credits (total/control): 8/0
[    9.805349] thunderbolt 0000:00:0d.2:  Port 13: 8087:0 (Revision: 0, TB =
Version: 1, Type: USB (0x200101))
[    9.805350] thunderbolt 0000:00:0d.2:   Max hop id (in/out): 8/8
[    9.805351] thunderbolt 0000:00:0d.2:   Max counters: 2
[    9.805351] thunderbolt 0000:00:0d.2:   NFC Credits: 0x800000
[    9.805352] thunderbolt 0000:00:0d.2:   Credits (total/control): 8/0
[    9.805354] thunderbolt 0000:00:0d.2: 0: running quirk_usb3_maximum_band=
width [thunderbolt]
[    9.805382] thunderbolt 0000:00:0d.2: 0:12: USB3 maximum bandwidth limit=
ed to 16376 Mb/s
[    9.805383] thunderbolt 0000:00:0d.2: 0:13: USB3 maximum bandwidth limit=
ed to 16376 Mb/s
[    9.805384] thunderbolt 0000:00:0d.2: 0: linked ports 1 <-> 2
[    9.805385] thunderbolt 0000:00:0d.2: 0: linked ports 3 <-> 4
[    9.808724] nvidia-modeset: Loading NVIDIA UNIX Open Kernel Mode Setting=
 Driver for x86_64  580.95.05  Release Build  (root@frigg) =20
[    9.809819] i915 0000:00:02.0: [drm:intel_backlight_device_update_status=
 [i915]] updating intel_backlight, brightness=3D360/800
[    9.809971] i915 0000:00:02.0: [drm:intel_panel_actually_set_backlight [=
i915]] [CONNECTOR:262:eDP-1] set backlight level =3D 360
[    9.810060] i915 0000:00:02.0: [drm:intel_backlight_set_pwm_level [i915]=
] [CONNECTOR:262:eDP-1] set backlight PWM =3D 17705
[    9.814701] thunderbolt 0000:00:0d.2: 0: TMU: supports uni-directional m=
ode
[    9.814869] thunderbolt 0000:00:0d.2: 0: TMU: current mode: off
[    9.817644] thunderbolt 0000:00:0d.2: 0: TMU: mode change off -> uni-dir=
ectional, LowRes requested
[    9.818608] thunderbolt 0000:00:0d.2: 0: TMU: mode set to: uni-direction=
al, LowRes
[    9.819133] thunderbolt 0000:00:0d.2: 0: resetting
[    9.825483] Bluetooth: Core ver 2.22
[    9.825516] NET: Registered PF_BLUETOOTH protocol family
[    9.825517] Bluetooth: HCI device and connection manager initialized
[    9.825522] Bluetooth: HCI socket layer initialized
[    9.825524] Bluetooth: L2CAP socket layer initialized
[    9.825528] Bluetooth: SCO socket layer initialized
[    9.856615] thunderbolt 0000:00:0d.2: 0:5: DP IN resource available
[    9.857449] thunderbolt 0000:00:0d.2: 0:6: DP IN resource available
[    9.857922] thunderbolt 0000:8a:00.0: total paths: 12
[    9.857931] thunderbolt 0000:8a:00.0: IOMMU DMA protection is enabled
[    9.912467] input: SNSL002D:00 2C2F:002D Mouse as /devices/pci0000:00/00=
00:00:15.0/i2c_designware.0/i2c-15/i2c-SNSL002D:00/0018:2C2F:002D.0003/inpu=
t/input8
[    9.912585] input: SNSL002D:00 2C2F:002D Touchpad as /devices/pci0000:00=
/0000:00:15.0/i2c_designware.0/i2c-15/i2c-SNSL002D:00/0018:2C2F:002D.0003/i=
nput/input9
[    9.912678] hid-generic 0018:2C2F:002D.0003: input,hidraw2: I2C HID v1.0=
0 Mouse [SNSL002D:00 2C2F:002D] on i2c-SNSL002D:00
[    9.918603] [drm] Initialized intel_vpu 1.0.0 for 0000:00:0b.0 on minor 0
[    9.929331] i801_smbus 0000:00:1f.4: SPD Write Disable is set
[    9.929369] i801_smbus 0000:00:1f.4: SMBus using PCI interrupt
[    9.929385] [drm] [nvidia-drm] [GPU ID 0x00000100] Loading driver
[    9.934640] i2c i2c-17: Successfully instantiated SPD at 0x50
[    9.939994] videodev: Linux video capture interface: v2.00
[    9.940097] iwlwifi 0000:00:14.3: enabling device (0000 -> 0002)
[    9.940937] RAPL PMU: API unit is 2^-32 Joules, 4 fixed counters, 655360=
 ms ovfl timer
[    9.940953] RAPL PMU: hw unit of domain pp0-core 2^-14 Joules
[    9.940954] RAPL PMU: hw unit of domain package 2^-14 Joules
[    9.940955] RAPL PMU: hw unit of domain pp1-gpu 2^-14 Joules
[    9.940955] RAPL PMU: hw unit of domain psys 2^-14 Joules
[    9.958026] thunderbolt 0000:8a:00.0: host router reset successful
[    9.962156] thunderbolt 0000:8a:00.0: allocating TX ring 0 of size 10
[    9.962181] thunderbolt 0000:8a:00.0: allocating RX ring 0 of size 10
[    9.962203] thunderbolt 0000:8a:00.0: control channel created
[    9.962204] thunderbolt 0000:8a:00.0: using software connection manager
[    9.967369] iwlwifi 0000:00:14.3: Detected crf-id 0x2001910, cnv-id 0x80=
930 wfpm id 0x80005b20
[    9.967381] iwlwifi 0000:00:14.3: PCI dev 7740/00e0, rev=3D0x461, rfid=
=3D0x20112200
[    9.967383] iwlwifi 0000:00:14.3: Detected Intel(R) Wi-Fi 7 BE201 320MHz
[    9.969050] iwlwifi 0000:00:14.3: Direct firmware load for iwlwifi-bz-b0=
-fm-c0-102.ucode failed with error -2
[    9.974854] iwlwifi 0000:00:14.3: loaded firmware version 101.6ef20b19.0=
 bz-b0-fm-c0-101.ucode op_mode iwlmld
[    9.978303] thunderbolt 0000:8a:00.0: created link from 0000:89:01.0
[    9.985787] proc_thermal_pci 0000:00:04.0: enabling device (0000 -> 0002)
[    9.985825] intel_rapl_msr: PL4 support detected.
[    9.985862] iTCO_vendor_support: vendor-support=3D0
[    9.985932] pps_core: LinuxPPS API ver. 1 registered
[    9.985934] pps_core: Software ver. 5.3.6 - Copyright 2005-2007 Rodolfo =
Giometti <giometti@linux.it>
[    9.985938] intel_rapl_common: Found RAPL domain package
[    9.985941] intel_rapl_common: Found RAPL domain core
[    9.985942] intel_rapl_common: Found RAPL domain uncore
[    9.985944] intel_rapl_common: Found RAPL domain psys
[    9.986368] intel_rapl_common: Found RAPL domain package
[    9.986401] usbcore: registered new interface driver btusb
[    9.986485] i915 0000:00:02.0: [drm:i915_gsc_proxy_component_bind [i915]=
] GT1: GSC proxy mei component bound
[    9.986637] mei_gsc_proxy 0000:00:16.0-0f73db04-97ab-4125-b893-e904ad0d5=
464: bound 0000:00:02.0 (ops i915_gsc_proxy_component_ops [i915])
[    9.989275] PTP clock support registered
[    9.989509] spd5118 17-0050: DDR5 temperature sensor: vendor 0x06:0x32 r=
evision 1.6
[    9.990349] Bluetooth: hci0: Device revision is 0
[    9.990352] Bluetooth: hci0: Secure boot is enabled
[    9.990353] Bluetooth: hci0: OTP lock is disabled
[    9.990354] Bluetooth: hci0: API lock is enabled
[    9.990354] Bluetooth: hci0: Debug lock is disabled
[    9.990355] Bluetooth: hci0: Minimum firmware build 1 week 10 2014
[    9.990356] Bluetooth: hci0: Bootloader timestamp 2022.18 buildtype 1 bu=
ild 16362
[    9.991186] thunderbolt 0000:8a:00.0: created link from 0000:89:03.0
[    9.991934] Bluetooth: hci0: DSM reset method type: 0x00
[    9.992646] iTCO_wdt iTCO_wdt: Found a Intel PCH TCO device (Version=3D6=
, TCOBASE=3D0x0400)
[    9.992743] iTCO_wdt iTCO_wdt: initialized. heartbeat=3D30 sec (nowayout=
=3D0)
[    9.998605] usb 3-9: Found UVC 1.50 device Integrated Camera (30c9:00f3)
[   10.002821] Bluetooth: hci0: Found device firmware: intel/ibt-0093-0291.=
sfi
[   10.002852] Bluetooth: hci0: Boot Address: 0x100800
[   10.002854] Bluetooth: hci0: Firmware Version: 78-34.25
[   10.006919] usb 3-9: Found UVC 1.50 device Integrated Camera (30c9:00f3)
[   10.009606] usbcore: registered new interface driver uvcvideo
[   10.014373] thunderbolt 0000:8a:00.0: NHI initialized, starting thunderb=
olt
[   10.014378] thunderbolt 0000:8a:00.0: control channel starting...
[   10.014381] thunderbolt 0000:8a:00.0: starting TX ring 0
[   10.014388] thunderbolt 0000:8a:00.0: enabling interrupt at register 0x3=
8200 bit 0 (0x0 -> 0x1)
[   10.014390] thunderbolt 0000:8a:00.0: starting RX ring 0
[   10.014396] thunderbolt 0000:8a:00.0: enabling interrupt at register 0x3=
8200 bit 12 (0x1 -> 0x1001)
[   10.014401] thunderbolt 0000:8a:00.0: security level set to user
[   10.014581] thunderbolt 0000:8a:00.0: current switch config:
[   10.014583] thunderbolt 0000:8a:00.0:  USB4 Switch: 8087:5781 (Revision:=
 132, TB Version: 64)
[   10.014585] thunderbolt 0000:8a:00.0:   Max Port Number: 23
[   10.014585] thunderbolt 0000:8a:00.0:   Config:
[   10.014586] thunderbolt 0000:8a:00.0:    Upstream Port Number: 15 Depth:=
 0 Route String: 0x0 Enabled: 0, PlugEventsDelay: 10ms
[   10.014587] thunderbolt 0000:8a:00.0:    unknown1: 0x0 unknown4: 0x0
[   10.018135] thunderbolt 0000:8a:00.0: initializing Switch at 0x0 (depth:=
 0, up port: 15)
[   10.019285] thunderbolt 0000:8a:00.0: 0: credit allocation parameters:
[   10.019286] thunderbolt 0000:8a:00.0: 0:  USB3: 20
[   10.019287] thunderbolt 0000:8a:00.0: 0:  DP AUX: 1
[   10.019288] thunderbolt 0000:8a:00.0: 0:  DP main: 6
[   10.019289] thunderbolt 0000:8a:00.0: 0:  PCIe: 80
[   10.019289] thunderbolt 0000:8a:00.0: 0:  DMA: 40
[   10.021716] thunderbolt 0000:8a:00.0: 0: DROM version: 3
[   10.022357] thunderbolt 0000:8a:00.0: 0: uid: 0x80da4c000000e7d5
[   10.023637] thunderbolt 0000:8a:00.0:  Port 1: 0:5780 (Revision: 0, TB V=
ersion: 1, Type: Port (0x1))
[   10.023639] thunderbolt 0000:8a:00.0:   Max hop id (in/out): 31/31
[   10.023640] thunderbolt 0000:8a:00.0:   Max counters: 4
[   10.023640] thunderbolt 0000:8a:00.0:   NFC Credits: 0x8a000000
[   10.023641] thunderbolt 0000:8a:00.0:   Credits (total/control): 160/2
[   10.023786] input: SNSL002D:00 2C2F:002D Mouse as /devices/pci0000:00/00=
00:00:15.0/i2c_designware.0/i2c-15/i2c-SNSL002D:00/0018:2C2F:002D.0003/inpu=
t/input11
[   10.024113] input: SNSL002D:00 2C2F:002D Touchpad as /devices/pci0000:00=
/0000:00:15.0/i2c_designware.0/i2c-15/i2c-SNSL002D:00/0018:2C2F:002D.0003/i=
nput/input12
[   10.024989] hid-multitouch 0018:2C2F:002D.0003: input,hidraw2: I2C HID v=
1.00 Mouse [SNSL002D:00 2C2F:002D] on i2c-SNSL002D:00
[   10.025045] thunderbolt 0000:8a:00.0:  Port 2: 0:5780 (Revision: 0, TB V=
ersion: 1, Type: Port (0x1))
[   10.025051] thunderbolt 0000:8a:00.0:   Max hop id (in/out): 31/31
[   10.025052] thunderbolt 0000:8a:00.0:   Max counters: 0
[   10.025053] thunderbolt 0000:8a:00.0:   NFC Credits: 0x8a000000
[   10.025054] thunderbolt 0000:8a:00.0:   Credits (total/control): 160/2
[   10.026323] thunderbolt 0000:8a:00.0:  Port 3: 0:5780 (Revision: 0, TB V=
ersion: 1, Type: Port (0x1))
[   10.026325] thunderbolt 0000:8a:00.0:   Max hop id (in/out): 31/31
[   10.026326] thunderbolt 0000:8a:00.0:   Max counters: 4
[   10.026326] thunderbolt 0000:8a:00.0:   NFC Credits: 0x8a000000
[   10.026327] thunderbolt 0000:8a:00.0:   Credits (total/control): 160/2
[   10.027732] thunderbolt 0000:8a:00.0:  Port 4: 0:5780 (Revision: 0, TB V=
ersion: 1, Type: Port (0x1))
[   10.027734] thunderbolt 0000:8a:00.0:   Max hop id (in/out): 31/31
[   10.027734] thunderbolt 0000:8a:00.0:   Max counters: 0
[   10.027735] thunderbolt 0000:8a:00.0:   NFC Credits: 0x8a000000
[   10.027736] thunderbolt 0000:8a:00.0:   Credits (total/control): 160/2
[   10.029015] thunderbolt 0000:8a:00.0: acking hot plug event on 0:13
[   10.029025] thunderbolt 0000:8a:00.0:  Port 5: 0:5780 (Revision: 0, TB V=
ersion: 1, Type: Inactive (0x0))
[   10.029026] thunderbolt 0000:8a:00.0:   Max hop id (in/out): 31/31
[   10.029027] thunderbolt 0000:8a:00.0:   Max counters: 4
[   10.029027] thunderbolt 0000:8a:00.0:   NFC Credits: 0x8a000000
[   10.029028] thunderbolt 0000:8a:00.0:   Credits (total/control): 160/0
[   10.029139] thunderbolt 0000:8a:00.0: acking hot plug event on 0:14
[   10.029267] thunderbolt 0000:8a:00.0: acking hot plug event on 0:16
[   10.029780] thunderbolt 0000:8a:00.0:  Port 6: 0:5780 (Revision: 0, TB V=
ersion: 1, Type: Inactive (0x0))
[   10.029781] thunderbolt 0000:8a:00.0:   Max hop id (in/out): 31/31
[   10.029781] thunderbolt 0000:8a:00.0:   Max counters: 0
[   10.029782] thunderbolt 0000:8a:00.0:   NFC Credits: 0x8a000000
[   10.029782] thunderbolt 0000:8a:00.0:   Credits (total/control): 160/0
[   10.031061] thunderbolt 0000:8a:00.0:  Port 7: 0:5780 (Revision: 0, TB V=
ersion: 1, Type: Inactive (0x0))
[   10.031062] thunderbolt 0000:8a:00.0:   Max hop id (in/out): 31/31
[   10.031062] thunderbolt 0000:8a:00.0:   Max counters: 4
[   10.031063] thunderbolt 0000:8a:00.0:   NFC Credits: 0x8a000000
[   10.031063] thunderbolt 0000:8a:00.0:   Credits (total/control): 160/0
[   10.031828] thunderbolt 0000:8a:00.0:  Port 8: 0:5780 (Revision: 0, TB V=
ersion: 1, Type: Inactive (0x0))
[   10.031829] thunderbolt 0000:8a:00.0:   Max hop id (in/out): 31/31
[   10.031829] thunderbolt 0000:8a:00.0:   Max counters: 0
[   10.031830] thunderbolt 0000:8a:00.0:   NFC Credits: 0x8a000000
[   10.031830] thunderbolt 0000:8a:00.0:   Credits (total/control): 160/0
[   10.032091] thunderbolt 0000:8a:00.0:  Port 9: 0:5780 (Revision: 0, TB V=
ersion: 1, Type: PCIe (0x100101))
[   10.032094] thunderbolt 0000:8a:00.0:   Max hop id (in/out): 8/8
[   10.032094] thunderbolt 0000:8a:00.0:   Max counters: 2
[   10.032095] thunderbolt 0000:8a:00.0:   NFC Credits: 0x40800000
[   10.032095] thunderbolt 0000:8a:00.0:   Credits (total/control): 8/0
[   10.032341] thunderbolt 0000:8a:00.0:  Port 10: 0:5780 (Revision: 0, TB =
Version: 1, Type: PCIe (0x100101))
[   10.032342] thunderbolt 0000:8a:00.0:   Max hop id (in/out): 8/8
[   10.032343] thunderbolt 0000:8a:00.0:   Max counters: 2
[   10.032343] thunderbolt 0000:8a:00.0:   NFC Credits: 0x40800000
[   10.032344] thunderbolt 0000:8a:00.0:   Credits (total/control): 8/0
[   10.032854] thunderbolt 0000:8a:00.0:  Port 11: 0:5780 (Revision: 0, TB =
Version: 1, Type: DP/HDMI (0xe0102))
[   10.032855] thunderbolt 0000:8a:00.0:   Max hop id (in/out): 9/9
[   10.032856] thunderbolt 0000:8a:00.0:   Max counters: 2
[   10.032856] thunderbolt 0000:8a:00.0:   NFC Credits: 0x800000
[   10.032857] thunderbolt 0000:8a:00.0:   Credits (total/control): 8/0
[   10.033367] thunderbolt 0000:8a:00.0:  Port 12: 0:5780 (Revision: 0, TB =
Version: 1, Type: DP/HDMI (0xe0102))
[   10.033368] thunderbolt 0000:8a:00.0:   Max hop id (in/out): 9/9
[   10.033368] thunderbolt 0000:8a:00.0:   Max counters: 2
[   10.033368] thunderbolt 0000:8a:00.0:   NFC Credits: 0x800000
[   10.033369] thunderbolt 0000:8a:00.0:   Credits (total/control): 8/0
[   10.033621] thunderbolt 0000:8a:00.0:  Port 13: 0:5780 (Revision: 0, TB =
Version: 1, Type: DP/HDMI (0xe0101))
[   10.033621] thunderbolt 0000:8a:00.0:   Max hop id (in/out): 9/9
[   10.033622] thunderbolt 0000:8a:00.0:   Max counters: 2
[   10.033622] thunderbolt 0000:8a:00.0:   NFC Credits: 0x100000d
[   10.033623] thunderbolt 0000:8a:00.0:   Credits (total/control): 16/0
[   10.033877] thunderbolt 0000:8a:00.0:  Port 14: 0:5780 (Revision: 0, TB =
Version: 1, Type: DP/HDMI (0xe0101))
[   10.033878] thunderbolt 0000:8a:00.0:   Max hop id (in/out): 9/9
[   10.033878] thunderbolt 0000:8a:00.0:   Max counters: 2
[   10.033879] thunderbolt 0000:8a:00.0:   NFC Credits: 0x100000d
[   10.033879] thunderbolt 0000:8a:00.0:   Credits (total/control): 16/0
[   10.034647] thunderbolt 0000:8a:00.0:  Port 15: 0:5780 (Revision: 0, TB =
Version: 1, Type: NHI (0x2))
[   10.034648] thunderbolt 0000:8a:00.0:   Max hop id (in/out): 11/11
[   10.034649] thunderbolt 0000:8a:00.0:   Max counters: 4
[   10.034649] thunderbolt 0000:8a:00.0:   NFC Credits: 0x41c00000
[   10.034650] thunderbolt 0000:8a:00.0:   Credits (total/control): 28/0
[   10.034650] thunderbolt 0000:8a:00.0: 0:16: disabled by eeprom
[   10.034901] thunderbolt 0000:8a:00.0:  Port 17: 0:5780 (Revision: 0, TB =
Version: 1, Type: Inactive (0x0))
[   10.034902] thunderbolt 0000:8a:00.0:   Max hop id (in/out): 8/8
[   10.034902] thunderbolt 0000:8a:00.0:   Max counters: 2
[   10.034903] thunderbolt 0000:8a:00.0:   NFC Credits: 0x40800000
[   10.034903] thunderbolt 0000:8a:00.0:   Credits (total/control): 8/0
[   10.035482] thunderbolt 0000:8a:00.0:  Port 18: 0:5780 (Revision: 0, TB =
Version: 1, Type: Inactive (0x0))
[   10.035487] thunderbolt 0000:8a:00.0:   Max hop id (in/out): 8/8
[   10.035488] thunderbolt 0000:8a:00.0:   Max counters: 2
[   10.035489] thunderbolt 0000:8a:00.0:   NFC Credits: 0x40800000
[   10.035490] thunderbolt 0000:8a:00.0:   Credits (total/control): 8/0
[   10.035900] thunderbolt 0000:8a:00.0:  Port 19: 0:5780 (Revision: 0, TB =
Version: 1, Type: DP/HDMI (0xe0102))
[   10.035906] thunderbolt 0000:8a:00.0:   Max hop id (in/out): 9/9
[   10.035907] thunderbolt 0000:8a:00.0:   Max counters: 2
[   10.035909] thunderbolt 0000:8a:00.0:   NFC Credits: 0x800000
[   10.035910] thunderbolt 0000:8a:00.0:   Credits (total/control): 8/0
[   10.038025] thunderbolt 0000:8a:00.0:  Port 20: 0:5780 (Revision: 0, TB =
Version: 1, Type: Inactive (0x0))
[   10.038028] thunderbolt 0000:8a:00.0:   Max hop id (in/out): 8/8
[   10.038029] thunderbolt 0000:8a:00.0:   Max counters: 1
[   10.038030] thunderbolt 0000:8a:00.0:   NFC Credits: 0x800000
[   10.038030] thunderbolt 0000:8a:00.0:   Credits (total/control): 8/0
[   10.038179] thunderbolt 0000:8a:00.0:  Port 21: 0:5780 (Revision: 0, TB =
Version: 1, Type: USB (0x200101))
[   10.038181] thunderbolt 0000:8a:00.0:   Max hop id (in/out): 8/8
[   10.038182] thunderbolt 0000:8a:00.0:   Max counters: 1
[   10.038183] thunderbolt 0000:8a:00.0:   NFC Credits: 0x800000
[   10.038183] thunderbolt 0000:8a:00.0:   Credits (total/control): 8/0
[   10.038434] thunderbolt 0000:8a:00.0:  Port 22: 0:5780 (Revision: 0, TB =
Version: 1, Type: USB (0x200101))
[   10.038436] thunderbolt 0000:8a:00.0:   Max hop id (in/out): 8/8
[   10.038436] thunderbolt 0000:8a:00.0:   Max counters: 1
[   10.038437] thunderbolt 0000:8a:00.0:   NFC Credits: 0x800000
[   10.038438] thunderbolt 0000:8a:00.0:   Credits (total/control): 8/0
[   10.038691] thunderbolt 0000:8a:00.0:  Port 23: 0:5780 (Revision: 0, TB =
Version: 1, Type: Inactive (0x0))
[   10.038692] thunderbolt 0000:8a:00.0:   Max hop id (in/out): 8/8
[   10.038693] thunderbolt 0000:8a:00.0:   Max counters: 1
[   10.038693] thunderbolt 0000:8a:00.0:   NFC Credits: 0x800000
[   10.038694] thunderbolt 0000:8a:00.0:   Credits (total/control): 8/0
[   10.038696] thunderbolt 0000:8a:00.0: 0: running quirk_usb3_maximum_band=
width [thunderbolt]
[   10.038729] thunderbolt 0000:8a:00.0: 0:21: USB3 maximum bandwidth limit=
ed to 16376 Mb/s
[   10.038731] thunderbolt 0000:8a:00.0: 0:22: USB3 maximum bandwidth limit=
ed to 16376 Mb/s
[   10.038732] thunderbolt 0000:8a:00.0: 0: running quirk_block_rpm_in_redr=
ive [thunderbolt]
[   10.038745] thunderbolt 0000:8a:00.0: 0: preventing runtime PM in DP red=
rive mode
[   10.038746] thunderbolt 0000:8a:00.0: 0: linked ports 1 <-> 2
[   10.038747] thunderbolt 0000:8a:00.0: 0: linked ports 3 <-> 4
[   10.045749] mousedev: PS/2 mouse device common for all mice
[   10.049775] thunderbolt 0000:8a:00.0: 0: TMU: supports uni-directional m=
ode
[   10.049779] thunderbolt 0000:8a:00.0: 0: TMU: supports enhanced uni-dire=
ctional mode
[   10.049901] thunderbolt 0000:8a:00.0: 0: TMU: current mode: off
[   10.054288] thunderbolt 0000:8a:00.0: 0: NVM version 62.2
[   10.054404] thunderbolt 0000:8a:00.0: 0: TMU: mode change off -> uni-dir=
ectional, LowRes requested
[   10.054802] thunderbolt 0000:8a:00.0: 0: TMU: mode set to: uni-direction=
al, LowRes
[   10.055700] thunderbolt 0000:8a:00.0: 0:13: DP IN resource available
[   10.056429] thunderbolt 0000:8a:00.0: 0:14: DP IN resource available
[   10.063069] psmouse serio1: trackpoint: Elan TrackPoint firmware: 0x00, =
buttons: 3/3
[   10.077549] input: TPPS/2 Elan TrackPoint as /devices/platform/i8042/ser=
io1/input/input7
[   10.141869] FAT-fs (nvme0n1p1): Volume was not properly unmounted. Some =
data may be corrupt. Please run fsck.
[   10.170396] sof-audio-pci-intel-mtl 0000:00:1f.3: SoundWire enabled on C=
annonLake+ platform, using SOF driver
[   10.170417] sof-audio-pci-intel-mtl 0000:00:1f.3: enabling device (0004 =
-> 0006)
[   10.171850] sof-audio-pci-intel-mtl 0000:00:1f.3: DSP detected with PCI =
class/subclass/prog-if 0x040100
[   10.171923] sof-audio-pci-intel-mtl 0000:00:1f.3: bound 0000:00:02.0 (op=
s intel_audio_component_bind_ops [i915])
[   10.172073] i915 0000:00:02.0: [drm:intel_power_well_enable [i915]] enab=
ling DC_off
[   10.172168] i915 0000:00:02.0: [drm:gen9_set_dc_state.part.0 [i915]] Set=
ting DC state from 02 to 00
[   10.172271] i915 0000:00:02.0: [drm:intel_power_well_enable [i915]] enab=
ling PW_2
[   10.172360] i915 0000:00:02.0: [drm:intel_audio_component_get_power [i91=
5]] restored AUD_FREQ_CNTRL to 0x8010
[   10.181953] sof-audio-pci-intel-mtl 0000:00:1f.3: use msi interrupt mode
[   10.198480] acpi device:32: find_sdca_function: SDCA function UAJ (type =
6) at 0x3
[   10.202185] acpi device:33: find_sdca_function: SDCA function HID (type =
10) at 0x4
[   10.203702] acpi device:2e: find_sdca_function: SDCA function SmartAmp (=
type 1) at 0x1
[   10.209127] acpi device:30: find_sdca_function: SDCA function SmartAmp (=
type 1) at 0x1
[   10.221589] sof-audio-pci-intel-mtl 0000:00:1f.3: hda codecs found, mask=
 4
[   10.221594] sof-audio-pci-intel-mtl 0000:00:1f.3: NHLT device BT(0) dete=
cted, ssp_mask 0x4
[   10.221595] sof-audio-pci-intel-mtl 0000:00:1f.3: BT link detected in NH=
LT tables: 0x4
[   10.221597] sof-audio-pci-intel-mtl 0000:00:1f.3: DMICs detected in NHLT=
 tables: 2
[   10.221775] sof-audio-pci-intel-mtl 0000:00:1f.3: SOF firmware and/or to=
pology file not found.
[   10.222529] sof-audio-pci-intel-mtl 0000:00:1f.3: Supported default prof=
iles
[   10.222529] sof-audio-pci-intel-mtl 0000:00:1f.3: - ipc type 1 (Requeste=
d):
[   10.222530] sof-audio-pci-intel-mtl 0000:00:1f.3:  Firmware file: intel/=
sof-ipc4/arl/sof-arl.ri
[   10.222531] sof-audio-pci-intel-mtl 0000:00:1f.3:  Topology file: intel/=
sof-ace-tplg/sof-arl-cs42l43-l2-cs35l56-l3-2ch.tplg
[   10.222531] sof-audio-pci-intel-mtl 0000:00:1f.3: Check if you have 'sof=
-firmware' package installed.
[   10.222532] sof-audio-pci-intel-mtl 0000:00:1f.3: Optionally it can be m=
anually downloaded from:
[   10.222532] sof-audio-pci-intel-mtl 0000:00:1f.3:    https://github.com/=
thesofproject/sof-bin/
[   10.224500] i915 0000:00:02.0: [drm:intel_power_well_disable [i915]] dis=
abling PW_2
[   10.224669] i915 0000:00:02.0: [drm:intel_power_well_disable [i915]] dis=
abling DC_off
[   10.224760] i915 0000:00:02.0: [drm:skl_enable_dc6 [i915]] Enabling DC6
[   10.224840] i915 0000:00:02.0: [drm:gen9_set_dc_state.part.0 [i915]] Set=
ting DC state from 00 to 02
[   10.224974] sof-audio-pci-intel-mtl 0000:00:1f.3: error: sof_probe_work =
failed err: -2
[   10.357920] typec port0: bound usb3-port1 (ops connector_ops)
[   10.357930] typec port0: bound usb6-port1 (ops connector_ops)
[   10.357933] typec port0: bound usb4_port1 (ops connector_ops [thunderbol=
t])
[   10.425185] i915 0000:00:02.0: [drm:gsc_work [i915]] GT1: GSC Proxy init=
ialized
[   10.434233] iwlwifi 0000:00:14.3: Detected RF FM, rfid=3D0x20112200
[   10.472007] Bluetooth: BNEP (Ethernet Emulation) ver 1.3
[   10.472010] Bluetooth: BNEP filters: protocol multicast
[   10.472020] Bluetooth: BNEP socket layer initialized
[   10.480779] nvidia 0000:01:00.0: Enabling HDA controller
[   10.541048] iwlwifi 0000:00:14.3: base HW address: 38:18:68:f2:88:89
[   10.672916] NVRM: testIfDsmSubFunctionEnabled: GPS ACPI DSM called befor=
e _acpiDsmSupportedFuncCacheInit subfunction =3D 11.
[   10.803966] NET: Registered PF_ALG protocol family
[   10.894628] typec port1: bound usb3-port3 (ops connector_ops)
[   10.894645] typec port1: bound usb6-port2 (ops connector_ops)
[   10.894650] typec port1: bound usb4_port3 (ops connector_ops [thunderbol=
t])
[   10.970361] ------------[ cut here ]------------
[   10.970373] WARNING: CPU: 15 PID: 974 at net/wireless/nl80211.c:9458 nl8=
0211_get_reg_do+0x1e4/0x210 [cfg80211]
[   10.970610] Modules linked in: ccm algif_aead des3_ede_x86_64 des_generi=
c libdes algif_skcipher cmac md4 algif_hash af_alg nft_limit nft_ct nf_conn=
track nf_defrag_ipv6 nf_defrag_ipv4 bnep nf_tables snd_soc_cs35l56_sdw snd_=
soc_cs35l56 snd_soc_cs35l56_shared snd_soc_cs_amp_lib cs42l43_sdw snd_soc_w=
m_adsp snd_hda_codec_intelhdmi regmap_sdw cs_dsp cs42l43 snd_soc_dmic snd_h=
da_intel snd_sof_pci_intel_mtl snd_sof_intel_hda_generic soundwire_intel sn=
d_sof_intel_hda_sdw_bpt snd_sof_intel_hda_common vfat snd_soc_hdac_hda snd_=
sof_intel_hda_mlink fat snd_sof_intel_hda snd_hda_codec_hdmi soundwire_cade=
nce snd_sof_pci snd_sof_xtensa_dsp snd_sof snd_sof_utils ucsi_acpi snd_hda_=
ext_core typec_ucsi snd_hda_codec typec roles snd_hda_core snd_intel_dspcfg=
 joydev iwlmld snd_intel_sdw_acpi intel_uncore_frequency snd_soc_acpi_intel=
_match mousedev intel_uncore_frequency_common snd_soc_acpi_intel_sdca_quirk=
s x86_pkg_temp_thermal soundwire_generic_allocation intel_powerclamp mac802=
11 coretemp snd_soc_acpi snd_hwdep soundwire_bus uvcvideo
[   10.970730]  kvm_intel iTCO_wdt snd_soc_sdca libarc4 videobuf2_vmalloc i=
ntel_pmc_bxt uvc ptp pps_core processor_thermal_device_pci hid_multitouch i=
TCO_vendor_support spd5118 mei_wdt mei_gsc_proxy snd_soc_core intel_rapl_ms=
r videobuf2_memops btusb processor_thermal_device kvm videobuf2_v4l2 btrtl =
snd_compress processor_thermal_wt_hint hid_sensor_prox ac97_bus btintel irq=
bypass videobuf2_common snd_pcm_dmaengine platform_temperature_control hid_=
sensor_trigger btbcm rapl think_lmi(+) industrialio_triggered_buffer proces=
sor_thermal_rfim videodev snd_pcm btmtk iwlwifi lenovo_wmi_other i2c_i801 k=
fifo_buf processor_thermal_rapl intel_cstate nvidia_drm(OE+) lenovo_wmi_hel=
pers hid_sensor_iio_common industrialio bluetooth intel_uncore mc lenovo_wm=
i_capdata01 firmware_attributes_class psmouse wmi_bmof snd_timer intel_rapl=
_common intel_lpss_pci i2c_smbus processor_thermal_wt_req mei_me crc8 proce=
ssor_thermal_power_floor nvidia_modeset(OE) i2c_mux intel_lpss intel_pmc_co=
re cfg80211 thunderbolt idma64 intel_vpu mei igen6_edac
[   10.970857]  processor_thermal_mbox int3403_thermal i2c_hid_acpi int340x=
_thermal_zone i2c_hid pmt_telemetry pmt_discovery int3400_thermal pmt_class=
 acpi_tad acpi_pad pinctrl_meteorlake acpi_thermal_rel intel_pmc_ssram_tele=
metry mac_hid tcp_bbr sch_fq pkcs8_key_parser nvidia_uvm(OE) nvidia(OE) i2c=
_dev sg crypto_user loop nfnetlink ip_tables x_tables dm_crypt encrypted_ke=
ys trusted asn1_encoder tee xe drm_ttm_helper drm_suballoc_helper gpu_sched=
 drm_gpuvm drm_exec drm_gpusvm_helper hid_sensor_hub dm_mod i915 rtsx_pci_s=
dmmc mmc_core i2c_algo_bit thinkpad_acpi nvme drm_buddy sparse_keymap polyv=
al_clmulni nvme_core ttm platform_profile ghash_clmulni_intel intel_gtt snd=
 aesni_intel nvme_keyring drm_display_helper soundcore nvme_auth rtsx_pci r=
fkill video cec intel_vsec wmi serio_raw
[   10.970991] CPU: 15 UID: 0 PID: 974 Comm: iwd Tainted: G           OE   =
    6.17.7-arch1-1 #1 PREEMPT(full)  487c2a7c3ba80b17aa21e17ff916d191154be3=
8f
[   10.971005] Tainted: [O]=3DOOT_MODULE, [E]=3DUNSIGNED_MODULE
[   10.971009] Hardware name: LENOVO 21Q8CTO1WW/21Q8CTO1WW, BIOS N4EET19W (=
1.05 ) 09/12/2025
[   10.971077] RIP: 0010:nl80211_get_reg_do+0x1e4/0x210 [cfg80211]
[   10.971255] Code: 4c 24 0c ba 04 00 00 00 be 9a 00 00 00 48 89 df c7 44 =
24 0c 01 00 00 00 e8 b9 65 12 f2 85 c0 0f 84 4f ff ff ff e9 18 ff ff ff <0f=
> 0b bd ea ff ff ff e9 11 ff ff ff 89 c5 e9 0f ff ff ff bd 97 ff
[   10.971262] RSP: 0018:ffffd2a64552ba18 EFLAGS: 00010202
[   10.971270] RAX: 0000000000000000 RBX: ffff8c474300ea00 RCX: 00000000000=
00000
[   10.971275] RDX: ffff8c479149b600 RSI: 0000000000000000 RDI: ffff8c474b7=
203c0
[   10.971278] RBP: ffffd2a64552ba78 R08: 0000000000000000 R09: ffff8c479a3=
1e014
[   10.971281] R10: 0000000000000000 R11: ffffffffc2996c50 R12: ffff8c479a3=
1e014
[   10.971284] R13: ffff8c474300ee00 R14: ffff8c474b7203c0 R15: 00000000000=
00001
[   10.971288] FS:  00007f449ca2bb80(0000) GS:ffff8c56c06c9000(0000) knlGS:=
0000000000000000
[   10.971296] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[   10.971300] CR2: 00007f449c721a78 CR3: 000000013d478005 CR4: 0000000000f=
72ef0
[   10.971304] PKRU: 55555554
[   10.971309] Call Trace:
[   10.971319]  <TASK>
[   10.971328]  genl_family_rcv_msg_doit+0xfc/0x160
[   10.971357]  genl_rcv_msg+0x1aa/0x2b0
[   10.971369]  ? __pfx_nl80211_pre_doit+0x10/0x10 [cfg80211 d71eaeaaa17265=
0e214ab70e2c0af3149cb28e90]
[   10.971541]  ? __pfx_nl80211_get_reg_do+0x10/0x10 [cfg80211 d71eaeaaa172=
650e214ab70e2c0af3149cb28e90]
[   10.971701]  ? __pfx_nl80211_post_doit+0x10/0x10 [cfg80211 d71eaeaaa1726=
50e214ab70e2c0af3149cb28e90]
[   10.971862]  ? __pfx_genl_rcv_msg+0x10/0x10
[   10.971871]  netlink_rcv_skb+0x59/0x110
[   10.971882]  genl_rcv+0x28/0x40
[   10.971891]  netlink_unicast+0x285/0x3c0
[   10.971899]  ? __alloc_skb+0xdb/0x1a0
[   10.971911]  netlink_sendmsg+0x20d/0x430
[   10.971920]  __sys_sendto+0x1f2/0x200
[   10.971935]  __x64_sys_sendto+0x24/0x30
[   10.971943]  do_syscall_64+0x81/0x970
[   10.971954]  ? __x64_sys_epoll_ctl+0x6f/0xa0
[   10.971967]  ? do_syscall_64+0x81/0x970
[   10.971973]  ? do_syscall_64+0x81/0x970
[   10.971977]  ? do_syscall_64+0x81/0x970
[   10.971982]  ? do_syscall_64+0x81/0x970
[   10.971987]  ? exc_page_fault+0x7e/0x1a0
[   10.971995]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   10.972005] RIP: 0033:0x7f449c8931ce
[   10.972126] Code: 4d 89 d8 e8 64 be 00 00 4c 8b 5d f8 41 8b 93 08 03 00 =
00 59 5e 48 83 f8 fc 74 11 c9 c3 0f 1f 80 00 00 00 00 48 8b 45 10 0f 05 <c9=
> c3 83 e2 39 83 fa 08 75 e7 e8 13 ff ff ff 0f 1f 00 f3 0f 1e fa
[   10.972131] RSP: 002b:00007fffbc619450 EFLAGS: 00000202 ORIG_RAX: 000000=
000000002c
[   10.972138] RAX: ffffffffffffffda RBX: 000055b1598de470 RCX: 00007f449c8=
931ce
[   10.972141] RDX: 000000000000001c RSI: 000055b1598f84e0 RDI: 00000000000=
00004
[   10.972145] RBP: 00007fffbc619460 R08: 0000000000000000 R09: 00000000000=
00000
[   10.972148] R10: 0000000000000000 R11: 0000000000000202 R12: 000055b1598=
f84e0
[   10.972151] R13: 000055b1598e9550 R14: 0000000000000001 R15: 00000000000=
00000
[   10.972157]  </TASK>
[   10.972160] ---[ end trace 0000000000000000 ]---
[   11.551497] wireguard: WireGuard 1.0.0 loaded. See www.wireguard.com for=
 information.
[   11.551501] wireguard: Copyright (C) 2015-2019 Jason A. Donenfeld <Jason=
@zx2c4.com>. All Rights Reserved.
[   11.744948] bridge: filtering via arp/ip/ip6tables is no longer availabl=
e by default. Update your scripts to load br_netfilter if you need this.
[   11.923382] u32 classifier
[   11.923387]     Performance counters on
[   11.923388]     input device check on
[   11.923388]     Actions configured
[   12.409908] Bluetooth: hci0: Waiting for firmware download to complete
[   12.410318] Bluetooth: hci0: Firmware loaded in 2351065 usecs
[   12.410367] Bluetooth: hci0: Waiting for device to boot
[   12.461447] Bluetooth: hci0: Device booted in 49901 usecs
[   12.463925] Bluetooth: hci0: dsbr: enable: 0x01 value: 0x0f
[   12.465875] Bluetooth: hci0: Found Intel DDC parameters: intel/ibt-0093-=
0291.ddc
[   12.466332] Bluetooth: hci0: Applying Intel DDC parameters completed
[   12.469370] Bluetooth: hci0: Firmware timestamp 2025.34 buildtype 1 buil=
d 91726
[   12.469376] Bluetooth: hci0: Firmware SHA1: 0x0c02c49d
[   12.473348] Bluetooth: hci0: Fseq status: Success (0x00)
[   12.473354] Bluetooth: hci0: Fseq executed: 00.00.04.197
[   12.473356] Bluetooth: hci0: Fseq BT Top: 00.00.04.197
[   12.583866] Bluetooth: MGMT ver 1.23
[   12.974704] i915 0000:00:02.0: [drm:intel_power_well_enable [i915]] enab=
ling DC_off
[   12.975261] i915 0000:00:02.0: [drm:gen9_set_dc_state.part.0 [i915]] Set=
ting DC state from 02 to 00
[   13.010252] i915 0000:00:02.0: [drm:intel_power_well_disable [i915]] dis=
abling DC_off
[   13.010437] i915 0000:00:02.0: [drm:skl_enable_dc6 [i915]] Enabling DC6
[   13.010541] i915 0000:00:02.0: [drm:gen9_set_dc_state.part.0 [i915]] Set=
ting DC state from 00 to 02
[   13.255403] nvidia-modeset: WARNING: GPU:0: Correcting number of heads f=
or current head configuration (0x00)
[   13.257298] [drm] Initialized nvidia-drm 0.0.0 for 0000:01:00.0 on minor=
 0
[   13.257337] nvidia 0000:01:00.0: [drm:drm_client_modeset_probe]=20
[   13.257351] nvidia 0000:01:00.0: [drm] No compatible format found
[   13.257353] nvidia 0000:01:00.0: [drm] Cannot find any crtc or sizes
[   16.761580] wlan0: authenticate with d0:21:f9:3f:08:56 (local address=3D=
06:dd:0a:b7:c7:a8)
[   16.762037] wlan0: send auth to d0:21:f9:3f:08:56 (try 1/3)
[   16.770256] wlan0: d0:21:f9:3f:08:56 denied authentication (status 77)
[   16.823728] wlan0: authenticate with d0:21:f9:3f:08:56 (local address=3D=
06:dd:0a:b7:c7:a8)
[   16.824179] wlan0: send auth to d0:21:f9:3f:08:56 (try 1/3)
[   16.858789] wlan0: authenticate with d0:21:f9:3f:08:56 (local address=3D=
06:dd:0a:b7:c7:a8)
[   16.858801] wlan0: send auth to d0:21:f9:3f:08:56 (try 1/3)
[   16.881470] wlan0: authenticated
[   16.882021] wlan0: associate with d0:21:f9:3f:08:56 (try 1/3)
[   16.899688] wlan0: RX AssocResp from d0:21:f9:3f:08:56 (capab=3D0x1111 s=
tatus=3D0 aid=3D4)
[   16.901633] wlan0: associated
[   16.998523] wlan0: Limiting TX power to 23 (23 - 0) dBm as advertised by=
 d0:21:f9:3f:08:56
[   28.567029] thunderbolt 0000:00:0d.2: 0: suspending switch
[   28.567037] thunderbolt 0000:00:0d.2: 0: enabling wakeup: 0x3f
[   28.568695] thunderbolt 0000:00:0d.2: stopping RX ring 0
[   28.568700] thunderbolt 0000:00:0d.2: disabling interrupt at register 0x=
38200 bit 12 (0x1001 -> 0x1)
[   28.568710] thunderbolt 0000:00:0d.2: stopping TX ring 0
[   28.568713] thunderbolt 0000:00:0d.2: disabling interrupt at register 0x=
38200 bit 0 (0x1 -> 0x0)
[   28.568717] thunderbolt 0000:00:0d.2: control channel stopped
[   28.804479] thunderbolt 0000:8a:00.0: 0: suspending switch
[   28.804488] thunderbolt 0000:8a:00.0: 0: enabling wakeup: 0x3f
[   28.805747] thunderbolt 0000:8a:00.0: stopping RX ring 0
[   28.805779] thunderbolt 0000:8a:00.0: disabling interrupt at register 0x=
38200 bit 12 (0x1001 -> 0x1)
[   28.805803] thunderbolt 0000:8a:00.0: stopping TX ring 0
[   28.805810] thunderbolt 0000:8a:00.0: disabling interrupt at register 0x=
38200 bit 0 (0x1 -> 0x0)
[   28.805821] thunderbolt 0000:8a:00.0: control channel stopped
[   50.262119] usb 3-1: new high-speed USB device number 6 using xhci_hcd
[   50.386338] usb 3-1: New USB device found, idVendor=3D17ef, idProduct=3D=
3114, bcdDevice=3D 1.01
[   50.386350] usb 3-1: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D0
[   50.386352] usb 3-1: Product: Lenovo Dock - USB2.0 Hub
[   50.386355] usb 3-1: Manufacturer: Lenovo
[   50.387509] hub 3-1:1.0: USB hub found
[   50.387549] hub 3-1:1.0: 5 ports detected
[   50.430760] thunderbolt 0000:8a:00.0: control channel starting...
[   50.430770] thunderbolt 0000:8a:00.0: starting TX ring 0
[   50.430781] thunderbolt 0000:8a:00.0: enabling interrupt at register 0x3=
8200 bit 0 (0x0 -> 0x1)
[   50.430785] thunderbolt 0000:8a:00.0: starting RX ring 0
[   50.430792] thunderbolt 0000:8a:00.0: enabling interrupt at register 0x3=
8200 bit 12 (0x1 -> 0x1001)
[   50.430802] thunderbolt 0000:8a:00.0: 0: resuming switch
[   50.430804] thunderbolt 0000:8a:00.0: restoring Switch at 0x0 (depth: 0,=
 up port: 15)
[   50.431776] thunderbolt 0000:8a:00.0: 0: disabling wakeup
[   50.436916] thunderbolt 0000:8a:00.0: acking hot plug event on 0:13
[   50.437041] thunderbolt 0000:8a:00.0: acking hot plug event on 0:14
[   50.437186] thunderbolt 0000:8a:00.0: acking hot plug event on 0:16
[   50.441582] thunderbolt 0000:8a:00.0: 0: TMU: supports uni-directional m=
ode
[   50.441586] thunderbolt 0000:8a:00.0: 0: TMU: supports enhanced uni-dire=
ctional mode
[   50.441730] thunderbolt 0000:8a:00.0: 0: TMU: current mode: off
[   50.441734] thunderbolt 0000:8a:00.0: 0: TMU: mode change off -> bi-dire=
ctional, HiFi requested
[   50.442240] thunderbolt 0000:8a:00.0: 0: TMU: mode set to: bi-directiona=
l, HiFi
[   50.443947] thunderbolt 0000:8a:00.0: 0:13: DP IN resource available aft=
er hotplug
[   50.443954] thunderbolt 0000:8a:00.0: looking for DP IN <-> DP OUT pairs:
[   50.444153] thunderbolt 0000:8a:00.0: 0:13: DP IN available
[   50.444159] thunderbolt 0000:8a:00.0: 0:13: no suitable DP OUT adapter a=
vailable, not tunneling
[   50.444192] thunderbolt 0000:8a:00.0: 0:14: DP IN resource available aft=
er hotplug
[   50.444195] thunderbolt 0000:8a:00.0: looking for DP IN <-> DP OUT pairs:
[   50.444393] thunderbolt 0000:8a:00.0: 0:13: DP IN available
[   50.444399] thunderbolt 0000:8a:00.0: 0:13: no suitable DP OUT adapter a=
vailable, not tunneling
[   50.444560] thunderbolt 0000:8a:00.0: 0:14: DP IN available
[   50.444566] thunderbolt 0000:8a:00.0: 0:14: no suitable DP OUT adapter a=
vailable, not tunneling
[   50.455849] thunderbolt 0000:8a:00.0: acking hot plug event on 0:1
[   50.455971] thunderbolt 0000:8a:00.0: 0:1: hotplug: scanning
[   50.456041] thunderbolt 0000:8a:00.0: 0:1: is connected, link is up (sta=
te: 2)
[   50.456695] thunderbolt 0000:8a:00.0: current switch config:
[   50.456700] thunderbolt 0000:8a:00.0:  USB4 Switch: 8087:5786 (Revision:=
 133, TB Version: 64)
[   50.456703] thunderbolt 0000:8a:00.0:   Max Port Number: 23
[   50.456705] thunderbolt 0000:8a:00.0:   Config:
[   50.456706] thunderbolt 0000:8a:00.0:    Upstream Port Number: 1 Depth: =
0 Route String: 0x0 Enabled: 0, PlugEventsDelay: 10ms
[   50.456708] thunderbolt 0000:8a:00.0:    unknown1: 0x0 unknown4: 0x0
[   50.460023] thunderbolt 0000:8a:00.0: initializing Switch at 0x1 (depth:=
 1, up port: 1)
[   50.460421] thunderbolt 0000:8a:00.0: 1: link: USB4
[   50.460426] thunderbolt 0000:8a:00.0: 1: TBT3 support: yes, xHCI: yes
[   50.461680] thunderbolt 0000:8a:00.0: 1: credit allocation parameters:
[   50.461682] thunderbolt 0000:8a:00.0: 1:  USB3: 20
[   50.461683] thunderbolt 0000:8a:00.0: 1:  DP AUX: 1
[   50.461685] thunderbolt 0000:8a:00.0: 1:  DP main: 6
[   50.461686] thunderbolt 0000:8a:00.0: 1:  PCIe: 76
[   50.461687] thunderbolt 0000:8a:00.0: 1:  unknown credit allocation inde=
x 0x0, skipping
[   50.465650] thunderbolt 0000:8a:00.0: 1: DROM version: 1
[   50.467586] thunderbolt 0000:8a:00.0: 1: uid: 0xb86a7700808714c4
[   50.468864] thunderbolt 0000:8a:00.0:  Port 1: 0:5780 (Revision: 0, TB V=
ersion: 1, Type: Port (0x1))
[   50.468867] thunderbolt 0000:8a:00.0:   Max hop id (in/out): 31/31
[   50.468869] thunderbolt 0000:8a:00.0:   Max counters: 4
[   50.468871] thunderbolt 0000:8a:00.0:   NFC Credits: 0x4a000000
[   50.468872] thunderbolt 0000:8a:00.0:   Credits (total/control): 160/2
[   50.470043] thunderbolt 0000:8a:00.0:  Port 2: 0:5780 (Revision: 0, TB V=
ersion: 1, Type: Port (0x1))
[   50.470052] thunderbolt 0000:8a:00.0:   Max hop id (in/out): 31/31
[   50.470055] thunderbolt 0000:8a:00.0:   Max counters: 0
[   50.470056] thunderbolt 0000:8a:00.0:   NFC Credits: 0xca000000
[   50.470058] thunderbolt 0000:8a:00.0:   Credits (total/control): 160/2
[   50.471541] thunderbolt 0000:8a:00.0: acking hot plug event on 1:16
[   50.471556] thunderbolt 0000:8a:00.0:  Port 3: 0:5780 (Revision: 0, TB V=
ersion: 1, Type: Port (0x1))
[   50.471563] thunderbolt 0000:8a:00.0:   Max hop id (in/out): 31/31
[   50.471565] thunderbolt 0000:8a:00.0:   Max counters: 4
[   50.471566] thunderbolt 0000:8a:00.0:   NFC Credits: 0x8a000000
[   50.471567] thunderbolt 0000:8a:00.0:   Credits (total/control): 160/2
[   50.472789] thunderbolt 0000:8a:00.0:  Port 4: 0:5780 (Revision: 0, TB V=
ersion: 1, Type: Port (0x1))
[   50.472798] thunderbolt 0000:8a:00.0:   Max hop id (in/out): 31/31
[   50.472801] thunderbolt 0000:8a:00.0:   Max counters: 0
[   50.472803] thunderbolt 0000:8a:00.0:   NFC Credits: 0x8a000000
[   50.472805] thunderbolt 0000:8a:00.0:   Credits (total/control): 160/2
[   50.474148] thunderbolt 0000:8a:00.0:  Port 5: 0:5780 (Revision: 0, TB V=
ersion: 1, Type: Port (0x1))
[   50.474154] thunderbolt 0000:8a:00.0:   Max hop id (in/out): 31/31
[   50.474157] thunderbolt 0000:8a:00.0:   Max counters: 4
[   50.474158] thunderbolt 0000:8a:00.0:   NFC Credits: 0x8a000000
[   50.474159] thunderbolt 0000:8a:00.0:   Credits (total/control): 160/2
[   50.475214] thunderbolt 0000:8a:00.0:  Port 6: 0:5780 (Revision: 0, TB V=
ersion: 1, Type: Port (0x1))
[   50.475216] thunderbolt 0000:8a:00.0:   Max hop id (in/out): 31/31
[   50.475218] thunderbolt 0000:8a:00.0:   Max counters: 0
[   50.475219] thunderbolt 0000:8a:00.0:   NFC Credits: 0x8a000000
[   50.475220] thunderbolt 0000:8a:00.0:   Credits (total/control): 160/2
[   50.476509] thunderbolt 0000:8a:00.0:  Port 7: 0:5780 (Revision: 0, TB V=
ersion: 1, Type: Port (0x1))
[   50.476511] thunderbolt 0000:8a:00.0:   Max hop id (in/out): 31/31
[   50.476512] thunderbolt 0000:8a:00.0:   Max counters: 4
[   50.476513] thunderbolt 0000:8a:00.0:   NFC Credits: 0x8a000000
[   50.476514] thunderbolt 0000:8a:00.0:   Credits (total/control): 160/2
[   50.477646] thunderbolt 0000:8a:00.0:  Port 8: 0:5780 (Revision: 0, TB V=
ersion: 1, Type: Port (0x1))
[   50.477647] thunderbolt 0000:8a:00.0:   Max hop id (in/out): 31/31
[   50.477648] thunderbolt 0000:8a:00.0:   Max counters: 0
[   50.477649] thunderbolt 0000:8a:00.0:   NFC Credits: 0x8a000000
[   50.477650] thunderbolt 0000:8a:00.0:   Credits (total/control): 160/2
[   50.477917] thunderbolt 0000:8a:00.0:  Port 9: 0:5780 (Revision: 0, TB V=
ersion: 1, Type: PCIe (0x100102))
[   50.477919] thunderbolt 0000:8a:00.0:   Max hop id (in/out): 8/8
[   50.477920] thunderbolt 0000:8a:00.0:   Max counters: 2
[   50.477921] thunderbolt 0000:8a:00.0:   NFC Credits: 0x40800000
[   50.477922] thunderbolt 0000:8a:00.0:   Credits (total/control): 8/0
[   50.478173] thunderbolt 0000:8a:00.0:  Port 10: 0:5780 (Revision: 0, TB =
Version: 1, Type: PCIe (0x100101))
[   50.478176] thunderbolt 0000:8a:00.0:   Max hop id (in/out): 8/8
[   50.478177] thunderbolt 0000:8a:00.0:   Max counters: 2
[   50.478178] thunderbolt 0000:8a:00.0:   NFC Credits: 0x40800000
[   50.478178] thunderbolt 0000:8a:00.0:   Credits (total/control): 8/0
[   50.478685] thunderbolt 0000:8a:00.0:  Port 11: 0:5780 (Revision: 0, TB =
Version: 1, Type: DP/HDMI (0xe0102))
[   50.478687] thunderbolt 0000:8a:00.0:   Max hop id (in/out): 9/9
[   50.478688] thunderbolt 0000:8a:00.0:   Max counters: 2
[   50.478689] thunderbolt 0000:8a:00.0:   NFC Credits: 0x800000
[   50.478690] thunderbolt 0000:8a:00.0:   Credits (total/control): 8/0
[   50.479197] thunderbolt 0000:8a:00.0:  Port 12: 0:5780 (Revision: 0, TB =
Version: 1, Type: DP/HDMI (0xe0102))
[   50.479198] thunderbolt 0000:8a:00.0:   Max hop id (in/out): 9/9
[   50.479199] thunderbolt 0000:8a:00.0:   Max counters: 2
[   50.479200] thunderbolt 0000:8a:00.0:   NFC Credits: 0x800000
[   50.479201] thunderbolt 0000:8a:00.0:   Credits (total/control): 8/0
[   50.479202] thunderbolt 0000:8a:00.0: 1:13: disabled by eeprom
[   50.479204] thunderbolt 0000:8a:00.0: 1:14: disabled by eeprom
[   50.479310] thunderbolt 0000:8a:00.0:  Port 15: not implemented
[   50.479312] thunderbolt 0000:8a:00.0: 1:16: disabled by eeprom
[   50.479565] thunderbolt 0000:8a:00.0:  Port 17: 0:5780 (Revision: 0, TB =
Version: 1, Type: PCIe (0x100101))
[   50.479567] thunderbolt 0000:8a:00.0:   Max hop id (in/out): 8/8
[   50.479568] thunderbolt 0000:8a:00.0:   Max counters: 2
[   50.479569] thunderbolt 0000:8a:00.0:   NFC Credits: 0x40800000
[   50.479570] thunderbolt 0000:8a:00.0:   Credits (total/control): 8/0
[   50.479837] thunderbolt 0000:8a:00.0:  Port 18: 0:5780 (Revision: 0, TB =
Version: 1, Type: PCIe (0x100101))
[   50.479839] thunderbolt 0000:8a:00.0:   Max hop id (in/out): 8/8
[   50.479840] thunderbolt 0000:8a:00.0:   Max counters: 2
[   50.479841] thunderbolt 0000:8a:00.0:   NFC Credits: 0x40800000
[   50.479841] thunderbolt 0000:8a:00.0:   Credits (total/control): 8/0
[   50.480349] thunderbolt 0000:8a:00.0:  Port 19: 0:5780 (Revision: 0, TB =
Version: 1, Type: DP/HDMI (0xe0102))
[   50.480350] thunderbolt 0000:8a:00.0:   Max hop id (in/out): 9/9
[   50.480351] thunderbolt 0000:8a:00.0:   Max counters: 2
[   50.480352] thunderbolt 0000:8a:00.0:   NFC Credits: 0x800000
[   50.480353] thunderbolt 0000:8a:00.0:   Credits (total/control): 8/0
[   50.480605] thunderbolt 0000:8a:00.0:  Port 20: 0:5780 (Revision: 0, TB =
Version: 1, Type: USB (0x200102))
[   50.480606] thunderbolt 0000:8a:00.0:   Max hop id (in/out): 8/8
[   50.480607] thunderbolt 0000:8a:00.0:   Max counters: 1
[   50.480608] thunderbolt 0000:8a:00.0:   NFC Credits: 0x800000
[   50.480609] thunderbolt 0000:8a:00.0:   Credits (total/control): 8/0
[   50.480861] thunderbolt 0000:8a:00.0:  Port 21: 0:5780 (Revision: 0, TB =
Version: 1, Type: USB (0x200101))
[   50.480862] thunderbolt 0000:8a:00.0:   Max hop id (in/out): 8/8
[   50.480863] thunderbolt 0000:8a:00.0:   Max counters: 1
[   50.480864] thunderbolt 0000:8a:00.0:   NFC Credits: 0x800000
[   50.480865] thunderbolt 0000:8a:00.0:   Credits (total/control): 8/0
[   50.481121] thunderbolt 0000:8a:00.0:  Port 22: 0:5780 (Revision: 0, TB =
Version: 1, Type: USB (0x200101))
[   50.481123] thunderbolt 0000:8a:00.0:   Max hop id (in/out): 8/8
[   50.481124] thunderbolt 0000:8a:00.0:   Max counters: 1
[   50.481125] thunderbolt 0000:8a:00.0:   NFC Credits: 0x800000
[   50.481126] thunderbolt 0000:8a:00.0:   Credits (total/control): 8/0
[   50.481372] thunderbolt 0000:8a:00.0:  Port 23: 0:5780 (Revision: 0, TB =
Version: 1, Type: USB (0x200101))
[   50.481374] thunderbolt 0000:8a:00.0:   Max hop id (in/out): 8/8
[   50.481375] thunderbolt 0000:8a:00.0:   Max counters: 1
[   50.481376] thunderbolt 0000:8a:00.0:   NFC Credits: 0x800000
[   50.481377] thunderbolt 0000:8a:00.0:   Credits (total/control): 8/0
[   50.481378] thunderbolt 0000:8a:00.0: 1: running quirk_usb3_maximum_band=
width [thunderbolt]
[   50.481422] thunderbolt 0000:8a:00.0: 1:21: USB3 maximum bandwidth limit=
ed to 16376 Mb/s
[   50.481423] thunderbolt 0000:8a:00.0: 1:22: USB3 maximum bandwidth limit=
ed to 16376 Mb/s
[   50.481424] thunderbolt 0000:8a:00.0: 1:23: USB3 maximum bandwidth limit=
ed to 16376 Mb/s
[   50.481629] thunderbolt 0000:8a:00.0: 1: current link speed 40.0 Gb/s
[   50.481630] thunderbolt 0000:8a:00.0: 1: current link width symmetric, d=
ual lanes
[   50.482014] thunderbolt 0000:8a:00.0: 0:1: total credits changed 160 -> =
160
[   50.482125] thunderbolt 0000:8a:00.0: 0:2: total credits changed 160 -> =
160
[   50.482269] thunderbolt 0000:8a:00.0: 1: preferred link width symmetric,=
 dual lanes
[   50.483038] thunderbolt 0000:8a:00.0: 1: CLx: current mode: disabled
[   50.490956] thunderbolt 0000:8a:00.0: 1: TMU: supports uni-directional m=
ode
[   50.490962] thunderbolt 0000:8a:00.0: 1: TMU: supports enhanced uni-dire=
ctional mode
[   50.491278] thunderbolt 0000:8a:00.0: 1: TMU: current mode: off
[   50.493924] thunderbolt 1-1: new device found, vendor=3D0x108 device=3D0=
x234d
[   50.493929] thunderbolt 1-1: Lenovo ThinkPad Thunderbolt 5 Smart Dock 75=
00 - 40BA
[   50.496213] thunderbolt 0000:8a:00.0: 1: NVM version 62.2
[   50.498653] thunderbolt 0000:8a:00.0: 0:1: reading NVM authentication st=
atus of retimers
[   50.538560] thinkpad_acpi: undocked from hotplug port replicator
[   50.609977] thunderbolt 0000:8a:00.0: acking hot plug event on 1:12
[   50.703100] thunderbolt 0000:8a:00.0: 0:1: disabling sideband transactio=
ns
[   50.806187] thunderbolt 0000:8a:00.0: 1:1: CLx: CL0s/CL1/CL2 supported
[   50.806198] thunderbolt 0000:8a:00.0: 0:1: CLx: CL0s/CL1/CL2 supported
[   50.806761] thunderbolt 0000:8a:00.0: 1: CLx: CL0s/CL1/CL2 enabled
[   50.806768] thunderbolt 0000:8a:00.0: 1: TMU: mode change off -> enhance=
d uni-directional, MedRes requested
[   50.806867] thunderbolt 0000:8a:00.0: 0: TMU: local_time[0]=3D0x37300000
[   50.806870] thunderbolt 0000:8a:00.0: 0: TMU: local_time[1]=3D0x00002bdc
[   50.806871] thunderbolt 0000:8a:00.0: 0: TMU: local_time[2]=3D0x00100000
[   50.807855] thunderbolt 0000:8a:00.0: 1: TMU: updated local time to 0x2b=
dc3730
[   50.811180] thunderbolt 0000:8a:00.0: 1: TMU: mode set to: enhanced uni-=
directional, MedRes
[   50.813884] thunderbolt 0000:8a:00.0: 1:1: reading NVM authentication st=
atus of retimers
[   50.920175] usb 3-1.2: new high-speed USB device number 7 using xhci_hcd
[   51.017172] usb 3-1.2: New USB device found, idVendor=3D17ef, idProduct=
=3D3111, bcdDevice=3D 2.a3
[   51.017189] usb 3-1.2: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D0
[   51.017195] usb 3-1.2: Product: Lenovo Dock - USB2 Hub1
[   51.017199] usb 3-1.2: Manufacturer: Lenovo                =20
[   51.018717] thunderbolt 0000:8a:00.0: 1:1: disabling sideband transactio=
ns
[   51.019223] hub 3-1.2:1.0: USB hub found
[   51.020144] hub 3-1.2:1.0: 4 ports detected
[   51.103185] usb 3-1.4: new full-speed USB device number 8 using xhci_hcd
[   51.120556] thunderbolt 0000:8a:00.0: 0:1: link maximum bandwidth 72000/=
72000 Mb/s
[   51.120682] thunderbolt 0000:8a:00.0: 0:1: reserving 1500/1500 Mb/s for =
PCIe
[   51.121065] thunderbolt 0000:8a:00.0: 1:1: link maximum bandwidth 72000/=
72000 Mb/s
[   51.121191] thunderbolt 0000:8a:00.0: 1:1: reserving 1500/1500 Mb/s for =
PCIe
[   51.121197] thunderbolt 0000:8a:00.0: 1:20: available bandwidth for new =
USB3 tunnel 70500/70500 Mb/s
[   51.121446] thunderbolt 0000:8a:00.0: 1:20: maximum required bandwidth f=
or USB3 tunnel 14738 Mb/s
[   51.122306] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): activating
[   51.122311] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): allocating i=
nitial bandwidth 14738/14738 Mb/s
[   51.123021] thunderbolt 0000:8a:00.0: 0:21: scaled bandwidth 3599/3599, =
scale 0
[   51.123633] thunderbolt 0000:8a:00.0: activating USB3 Down path from 0:2=
1 to 1:20
[   51.123761] thunderbolt 0000:8a:00.0: 1:1: Writing hop 1
[   51.123765] thunderbolt 0000:8a:00.0: 1:1:  In HopID: 8 =3D> Out port: 2=
0 Out HopID: 8
[   51.123770] thunderbolt 0000:8a:00.0: 1:1:   Weight: 2 Priority: 3 Credi=
ts: 20 Drop: 0 PM: 0
[   51.123775] thunderbolt 0000:8a:00.0: 1:1:    Counter enabled: 0 Counter=
 index: 2047
[   51.123779] thunderbolt 0000:8a:00.0: 1:1:   Flow Control (In/Eg): 1/0 S=
hared Buffer (In/Eg): 0/0
[   51.123783] thunderbolt 0000:8a:00.0: 1:1:   Unknown1: 0x0 Unknown2: 0x0=
 Unknown3: 0x0
[   51.124035] thunderbolt 0000:8a:00.0: 0:21: Writing hop 0
[   51.124039] thunderbolt 0000:8a:00.0: 0:21:  In HopID: 8 =3D> Out port: =
1 Out HopID: 8
[   51.124043] thunderbolt 0000:8a:00.0: 0:21:   Weight: 2 Priority: 3 Cred=
its: 7 Drop: 0 PM: 0
[   51.124047] thunderbolt 0000:8a:00.0: 0:21:    Counter enabled: 0 Counte=
r index: 2047
[   51.124051] thunderbolt 0000:8a:00.0: 0:21:   Flow Control (In/Eg): 1/1 =
Shared Buffer (In/Eg): 0/0
[   51.124055] thunderbolt 0000:8a:00.0: 0:21:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[   51.124146] thunderbolt 0000:8a:00.0: USB3 Down path activation complete
[   51.124149] thunderbolt 0000:8a:00.0: activating USB3 Up path from 1:20 =
to 0:21
[   51.124291] thunderbolt 0000:8a:00.0: 0:1: Writing hop 1
[   51.124294] thunderbolt 0000:8a:00.0: 0:1:  In HopID: 8 =3D> Out port: 2=
1 Out HopID: 8
[   51.124298] thunderbolt 0000:8a:00.0: 0:1:   Weight: 2 Priority: 3 Credi=
ts: 20 Drop: 0 PM: 0
[   51.124302] thunderbolt 0000:8a:00.0: 0:1:    Counter enabled: 0 Counter=
 index: 2047
[   51.124305] thunderbolt 0000:8a:00.0: 0:1:   Flow Control (In/Eg): 1/0 S=
hared Buffer (In/Eg): 0/0
[   51.124308] thunderbolt 0000:8a:00.0: 0:1:   Unknown1: 0x0 Unknown2: 0x0=
 Unknown3: 0x0
[   51.126858] thunderbolt 0000:8a:00.0: 1:20: Writing hop 0
[   51.126862] thunderbolt 0000:8a:00.0: 1:20:  In HopID: 8 =3D> Out port: =
1 Out HopID: 8
[   51.126866] thunderbolt 0000:8a:00.0: 1:20:   Weight: 2 Priority: 3 Cred=
its: 7 Drop: 0 PM: 0
[   51.126870] thunderbolt 0000:8a:00.0: 1:20:    Counter enabled: 0 Counte=
r index: 2047
[   51.126873] thunderbolt 0000:8a:00.0: 1:20:   Flow Control (In/Eg): 1/1 =
Shared Buffer (In/Eg): 0/0
[   51.126876] thunderbolt 0000:8a:00.0: 1:20:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[   51.126955] thunderbolt 0000:8a:00.0: USB3 Up path activation complete
[   51.127338] thunderbolt 0000:8a:00.0: 1:3: is unplugged (state: 7)
[   51.127465] thunderbolt 0000:8a:00.0: 1:5: is unplugged (state: 7)
[   51.127594] thunderbolt 0000:8a:00.0: 1:7: is unplugged (state: 7)
[   51.127977] thunderbolt 0000:8a:00.0: 1:12: DP adapter HPD set, queuing =
hotplug
[   51.128248] thunderbolt 0000:8a:00.0: 0:9 <-> 1:9 (PCI): activating
[   51.128254] thunderbolt 0000:8a:00.0: activating PCIe Down path from 0:9=
 to 1:9
[   51.128365] thunderbolt 0000:8a:00.0: 1:1: Writing hop 1
[   51.128367] thunderbolt 0000:8a:00.0: 1:1:  In HopID: 9 =3D> Out port: 9=
 Out HopID: 8
[   51.128369] thunderbolt 0000:8a:00.0: 1:1:   Weight: 1 Priority: 3 Credi=
ts: 76 Drop: 0 PM: 0
[   51.128371] thunderbolt 0000:8a:00.0: 1:1:    Counter enabled: 0 Counter=
 index: 2047
[   51.128373] thunderbolt 0000:8a:00.0: 1:1:   Flow Control (In/Eg): 1/0 S=
hared Buffer (In/Eg): 0/0
[   51.128375] thunderbolt 0000:8a:00.0: 1:1:   Unknown1: 0x0 Unknown2: 0x0=
 Unknown3: 0x0
[   51.128620] thunderbolt 0000:8a:00.0: 0:9: Writing hop 0
[   51.128622] thunderbolt 0000:8a:00.0: 0:9:  In HopID: 8 =3D> Out port: 1=
 Out HopID: 9
[   51.128623] thunderbolt 0000:8a:00.0: 0:9:   Weight: 1 Priority: 3 Credi=
ts: 7 Drop: 0 PM: 0
[   51.128625] thunderbolt 0000:8a:00.0: 0:9:    Counter enabled: 0 Counter=
 index: 2047
[   51.128627] thunderbolt 0000:8a:00.0: 0:9:   Flow Control (In/Eg): 1/1 S=
hared Buffer (In/Eg): 0/0
[   51.128629] thunderbolt 0000:8a:00.0: 0:9:   Unknown1: 0x0 Unknown2: 0x0=
 Unknown3: 0x0
[   51.128754] thunderbolt 0000:8a:00.0: PCIe Down path activation complete
[   51.128759] thunderbolt 0000:8a:00.0: activating PCIe Up path from 1:9 t=
o 0:9
[   51.128873] thunderbolt 0000:8a:00.0: 0:1: Writing hop 1
[   51.128874] thunderbolt 0000:8a:00.0: 0:1:  In HopID: 9 =3D> Out port: 9=
 Out HopID: 8
[   51.128876] thunderbolt 0000:8a:00.0: 0:1:   Weight: 1 Priority: 3 Credi=
ts: 80 Drop: 0 PM: 0
[   51.128878] thunderbolt 0000:8a:00.0: 0:1:    Counter enabled: 0 Counter=
 index: 2047
[   51.128880] thunderbolt 0000:8a:00.0: 0:1:   Flow Control (In/Eg): 1/0 S=
hared Buffer (In/Eg): 0/0
[   51.128882] thunderbolt 0000:8a:00.0: 0:1:   Unknown1: 0x0 Unknown2: 0x0=
 Unknown3: 0x0
[   51.129422] thunderbolt 0000:8a:00.0: 1:9: Writing hop 0
[   51.129423] thunderbolt 0000:8a:00.0: 1:9:  In HopID: 8 =3D> Out port: 1=
 Out HopID: 9
[   51.129425] thunderbolt 0000:8a:00.0: 1:9:   Weight: 1 Priority: 3 Credi=
ts: 7 Drop: 0 PM: 0
[   51.129426] thunderbolt 0000:8a:00.0: 1:9:    Counter enabled: 0 Counter=
 index: 2047
[   51.129428] thunderbolt 0000:8a:00.0: 1:9:   Flow Control (In/Eg): 1/1 S=
hared Buffer (In/Eg): 0/0
[   51.129429] thunderbolt 0000:8a:00.0: 1:9:   Unknown1: 0x0 Unknown2: 0x0=
 Unknown3: 0x0
[   51.129572] thunderbolt 0000:8a:00.0: PCIe Up path activation complete
[   51.131659] thunderbolt 0000:8a:00.0: 0:9 <-> 1:9 (PCI): extended encaps=
ulation enabled
[   51.132035] thunderbolt 0000:8a:00.0: 1:12: DP OUT resource available af=
ter hotplug
[   51.132042] thunderbolt 0000:8a:00.0: looking for DP IN <-> DP OUT pairs:
[   51.132156] thunderbolt 0000:8a:00.0: 0:13: DP IN available
[   51.132300] thunderbolt 0000:8a:00.0: 1:12: DP OUT available
[   51.144802] pcieport 0000:00:06.2: PME: Spurious native interrupt!
[   51.144813] pcieport 0000:89:01.0: pciehp: Slot(1): Card present
[   51.144818] pcieport 0000:89:01.0: pciehp: Slot(1): Link Up
[   51.150607] thunderbolt 0000:8a:00.0: 0: allocated DP resource for port =
13
[   51.150611] thunderbolt 0000:8a:00.0: 0:13: attached to bandwidth group 1
[   51.151392] thunderbolt 0000:8a:00.0: 0:21: scaled bandwidth 220/220, sc=
ale 0
[   51.152036] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): decreased ba=
ndwidth allocation to 900/900 Mb/s
[   51.153367] thunderbolt 0000:8a:00.0: 0:1: link maximum bandwidth 36000/=
108000 Mb/s
[   51.153480] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): consumed ban=
dwidth 3000/3000 Mb/s
[   51.153624] thunderbolt 0000:8a:00.0: 0:1: reserving 1500/1500 Mb/s for =
PCIe
[   51.153991] thunderbolt 0000:8a:00.0: 1:1: link maximum bandwidth 36000/=
108000 Mb/s
[   51.154135] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): consumed ban=
dwidth 3000/3000 Mb/s
[   51.154247] thunderbolt 0000:8a:00.0: 1:1: reserving 1500/1500 Mb/s for =
PCIe
[   51.154249] thunderbolt 0000:8a:00.0: available bandwidth for new DP tun=
nel 31500/103500 Mb/s
[   51.154256] thunderbolt 0000:8a:00.0: 0:13 <-> 1:12 (DP): activating
[   51.157366] thunderbolt 0000:8a:00.0: 0:13 <-> 1:12 (DP): DP IN maximum =
supported bandwidth 8100 Mb/s x4 =3D 25920 Mb/s
[   51.157369] thunderbolt 0000:8a:00.0: 0:13 <-> 1:12 (DP): DP OUT maximum=
 supported bandwidth 8100 Mb/s x4 =3D 25920 Mb/s
[   51.157617] thunderbolt 0000:8a:00.0: 0:13 <-> 1:12 (DP): bandwidth allo=
cation mode supported
[   51.158645] thunderbolt 0000:8a:00.0: 0:13 <-> 1:12 (DP): non-reduced ba=
ndwidth 8100 Mb/s x4 =3D 25920 Mb/s
[   51.158902] thunderbolt 0000:8a:00.0: 0:13 <-> 1:12 (DP): maximum bandwi=
dth through allocation mode 20000 Mb/s x4 =3D 77575 Mb/s
[   51.158904] thunderbolt 0000:8a:00.0: 0:13 <-> 1:12 (DP): granularity 50=
0 Mb/s
[   51.159170] thunderbolt 0000:8a:00.0: 0:13 <-> 1:12 (DP): estimated band=
width 103500 Mb/s
[   51.162609] thunderbolt 0000:8a:00.0: 0:13 <-> 1:12 (DP): bandwidth allo=
cation mode enabled
[   51.162612] thunderbolt 0000:8a:00.0: activating Video path from 0:13 to=
 1:12
[   51.162614] thunderbolt 0000:8a:00.0: 1:1: adding 6 NFC credits to 0
[   51.162867] thunderbolt 0000:8a:00.0: 1:1: Writing hop 1
[   51.162869] thunderbolt 0000:8a:00.0: 1:1:  In HopID: 10 =3D> Out port: =
12 Out HopID: 9
[   51.162871] thunderbolt 0000:8a:00.0: 1:1:   Weight: 1 Priority: 1 Credi=
ts: 0 Drop: 0 PM: 0
[   51.162872] thunderbolt 0000:8a:00.0: 1:1:    Counter enabled: 0 Counter=
 index: 2047
[   51.162874] thunderbolt 0000:8a:00.0: 1:1:   Flow Control (In/Eg): 0/0 S=
hared Buffer (In/Eg): 0/0
[   51.162876] thunderbolt 0000:8a:00.0: 1:1:   Unknown1: 0x0 Unknown2: 0x0=
 Unknown3: 0x0
[   51.163124] thunderbolt 0000:8a:00.0: 0:13: Writing hop 0
[   51.163126] thunderbolt 0000:8a:00.0: 0:13:  In HopID: 9 =3D> Out port: =
1 Out HopID: 10
[   51.163128] thunderbolt 0000:8a:00.0: 0:13:   Weight: 1 Priority: 1 Cred=
its: 0 Drop: 0 PM: 0
[   51.163130] thunderbolt 0000:8a:00.0: 0:13:    Counter enabled: 0 Counte=
r index: 2047
[   51.163131] thunderbolt 0000:8a:00.0: 0:13:   Flow Control (In/Eg): 0/0 =
Shared Buffer (In/Eg): 0/0
[   51.163133] thunderbolt 0000:8a:00.0: 0:13:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[   51.163230] thunderbolt 0000:8a:00.0: Video path activation complete
[   51.163232] thunderbolt 0000:8a:00.0: activating AUX TX path from 0:13 t=
o 1:12
[   51.163379] thunderbolt 0000:8a:00.0: 1:1: Writing hop 1
[   51.163381] thunderbolt 0000:8a:00.0: 1:1:  In HopID: 11 =3D> Out port: =
12 Out HopID: 8
[   51.163383] thunderbolt 0000:8a:00.0: 1:1:   Weight: 1 Priority: 2 Credi=
ts: 1 Drop: 0 PM: 0
[   51.163384] thunderbolt 0000:8a:00.0: 1:1:    Counter enabled: 0 Counter=
 index: 2047
[   51.163386] thunderbolt 0000:8a:00.0: 1:1:   Flow Control (In/Eg): 1/0 S=
hared Buffer (In/Eg): 0/0
[   51.163387] thunderbolt 0000:8a:00.0: 1:1:   Unknown1: 0x0 Unknown2: 0x0=
 Unknown3: 0x0
[   51.163634] thunderbolt 0000:8a:00.0: 0:13: Writing hop 0
[   51.163636] thunderbolt 0000:8a:00.0: 0:13:  In HopID: 8 =3D> Out port: =
1 Out HopID: 11
[   51.163637] thunderbolt 0000:8a:00.0: 0:13:   Weight: 1 Priority: 2 Cred=
its: 1 Drop: 0 PM: 0
[   51.163639] thunderbolt 0000:8a:00.0: 0:13:    Counter enabled: 0 Counte=
r index: 2047
[   51.163640] thunderbolt 0000:8a:00.0: 0:13:   Flow Control (In/Eg): 1/1 =
Shared Buffer (In/Eg): 0/0
[   51.163641] thunderbolt 0000:8a:00.0: 0:13:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[   51.163744] thunderbolt 0000:8a:00.0: AUX TX path activation complete
[   51.163746] thunderbolt 0000:8a:00.0: activating AUX RX path from 1:12 t=
o 0:13
[   51.163891] thunderbolt 0000:8a:00.0: 0:1: Writing hop 1
[   51.163892] thunderbolt 0000:8a:00.0: 0:1:  In HopID: 10 =3D> Out port: =
13 Out HopID: 8
[   51.163894] thunderbolt 0000:8a:00.0: 0:1:   Weight: 1 Priority: 2 Credi=
ts: 1 Drop: 0 PM: 0
[   51.163895] thunderbolt 0000:8a:00.0: 0:1:    Counter enabled: 0 Counter=
 index: 2047
[   51.163897] thunderbolt 0000:8a:00.0: 0:1:   Flow Control (In/Eg): 1/0 S=
hared Buffer (In/Eg): 0/0
[   51.163898] thunderbolt 0000:8a:00.0: 0:1:   Unknown1: 0x0 Unknown2: 0x0=
 Unknown3: 0x0
[   51.164145] thunderbolt 0000:8a:00.0: 1:12: Writing hop 0
[   51.164147] thunderbolt 0000:8a:00.0: 1:12:  In HopID: 8 =3D> Out port: =
1 Out HopID: 10
[   51.164148] thunderbolt 0000:8a:00.0: 1:12:   Weight: 1 Priority: 2 Cred=
its: 1 Drop: 0 PM: 0
[   51.164150] thunderbolt 0000:8a:00.0: 1:12:    Counter enabled: 0 Counte=
r index: 2047
[   51.164151] thunderbolt 0000:8a:00.0: 1:12:   Flow Control (In/Eg): 1/1 =
Shared Buffer (In/Eg): 0/0
[   51.164152] thunderbolt 0000:8a:00.0: 1:12:   Unknown1: 0x0 Unknown2: 0x=
0 Unknown3: 0x0
[   51.164256] thunderbolt 0000:8a:00.0: AUX RX path activation complete
[   51.165185] thunderbolt 0000:8a:00.0: 0:14: DP IN available
[   51.165298] thunderbolt 0000:8a:00.0: 1:12: DP OUT in use
[   51.165300] thunderbolt 0000:8a:00.0: 0:14: no suitable DP OUT adapter a=
vailable, not tunneling
[   51.167599] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008a88, pins 0x00000800, long 0x000008=
00
[   51.168705] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - long
[   51.168920] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] Receiv=
ed HPD interrupt on PIN 11 - cnt: 10
[   51.169136] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] got hpd i=
rq on [ENCODER:306:DDI TC3/PHY TC3] - long
[   51.172729] i915 0000:00:02.0: [drm:intel_tc_port_update_mode [i915]] Po=
rt F/TC#3: TC port mode reset (disconnected -> legacy)
[   51.172919] i915 0000:00:02.0: [drm:intel_power_well_enable [i915]] enab=
ling DC_off
[   51.173075] i915 0000:00:02.0: [drm:gen9_set_dc_state.part.0 [i915]] Set=
ting DC state from 02 to 00
[   51.173221] i915 0000:00:02.0: [drm:intel_power_well_enable [i915]] enab=
ling AUX_TC3
[   51.175392] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0xf0000 AUX -> (ret=3D  1) 20
[   51.175827] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.177212] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00000 AUX -> (ret=3D 15) 12 14 c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.177673] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.178214] thunderbolt 0000:8a:00.0: 0:13 <-> 1:12 (DP): DPRX capabilit=
ies read completed
[   51.178380] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02200 AUX -> (ret=3D 15) 14 1e c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.178389] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: Base DPCD: 12 14 c4 81 01 1d 01 c4 6a 3f=
 04 00 00 00 84
[   51.178400] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: DPCD: 14 1e c4 81 01 1d 01 c4 6a 3f 04 0=
0 00 00 84
[   51.178415] i915 0000:00:02.0: [drm:i915_hotplug_work_func [i915]] runni=
ng encoder hotplug functions
[   51.178579] thunderbolt 0000:8a:00.0: 0:13 <-> 1:12 (DP): consumed bandw=
idth 0/25920 Mb/s
[   51.178582] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): reclaiming u=
nused bandwidth
[   51.178554] i915 0000:00:02.0: [drm:i915_hotplug_work_func [i915]] Conne=
ctor DP-4 (pin 11) received hotplug event. (retry 0)
[   51.178681] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:3=
07:DP-4]
[   51.181323] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0xf0000 AUX -> (ret=3D  1) 20
[   51.181466] thunderbolt 0000:8a:00.0: 0:1: link maximum bandwidth 72000/=
72000 Mb/s
[   51.181594] thunderbolt 0000:8a:00.0: 0:1: reserving 1500/1500 Mb/s for =
PCIe
[   51.181770] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.181980] thunderbolt 0000:8a:00.0: 0:13 <-> 1:12 (DP): consumed bandw=
idth 0/25920 Mb/s
[   51.182361] thunderbolt 0000:8a:00.0: 1:1: link maximum bandwidth 72000/=
72000 Mb/s
[   51.182489] thunderbolt 0000:8a:00.0: 1:1: reserving 1500/1500 Mb/s for =
PCIe
[   51.182508] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00000 AUX -> (ret=3D 15) 12 14 c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.182874] thunderbolt 0000:8a:00.0: 0:13 <-> 1:12 (DP): consumed bandw=
idth 0/25920 Mb/s
[   51.182876] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): available ba=
ndwidth 70500/44580 Mb/s
[   51.182917] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.183900] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02200 AUX -> (ret=3D 15) 14 1e c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.183908] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: Base DPCD: 12 14 c4 81 01 1d 01 c4 6a 3f=
 04 00 00 00 84
[   51.183918] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: DPCD: 14 1e c4 81 01 1d 01 c4 6a 3f 04 0=
0 00 00 84
[   51.184165] thunderbolt 0000:8a:00.0: 0:21: scaled bandwidth 3599/3599, =
scale 0
[   51.185930] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.186221] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): increased ba=
ndwidth allocation to 14738/14738 Mb/s
[   51.186226] thunderbolt 0000:8a:00.0: bandwidth consumption changed, re-=
calculating estimated bandwidth
[   51.186227] thunderbolt 0000:8a:00.0: re-calculating bandwidth estimatio=
n for group 1
[   51.186350] thunderbolt 0000:8a:00.0: bandwidth estimation for group 1 d=
one
[   51.186352] thunderbolt 0000:8a:00.0: bandwidth re-calculation done
[   51.186670] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xf0000 AUX -> (ret=3D  8) 20 1e 80 55 04 00 =
01 03
[   51.186679] i915 0000:00:02.0: [drm:intel_dp_init_lttpr_and_dprx_caps [i=
915]] [CONNECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][DPRX] LTTPR common =
capabilities: 20 1e 80 55 04 00 01 03
[   51.187206] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0xf0003 AUX <- (ret=3D  1) 55
[   51.187637] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0xf0003 AUX <- (ret=3D  1) aa
[   51.188047] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.188479] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xf0020 AUX -> (ret=3D  3) 04 03 00
[   51.188487] i915 0000:00:02.0: [drm:intel_dp_init_lttpr_and_dprx_caps [i=
915]] [CONNECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][LTTPR 1] PHY capabi=
lities: 04 03 00
[   51.189030] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.189790] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xf003d AUX -> (ret=3D 12) 98 4f ee 42 52 00 =
00 00 00 b1 04 09
[   51.189798] i915 0000:00:02.0: [drm:drm_dp_dump_desc [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: LTTPR 1: OUI 98-4f-ee dev-ID BR HW-rev 11.1 S=
W-rev 4.9 quirks 0x0000
[   51.190201] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.190963] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00000 AUX -> (ret=3D 15) 12 14 c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.191410] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.192684] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02200 AUX -> (ret=3D 15) 14 1e c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.192693] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: Base DPCD: 12 14 c4 81 01 1d 01 c4 6a 3f=
 04 00 00 00 84
[   51.192701] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: DPCD: 14 1e c4 81 01 1d 01 c4 6a 3f 04 0=
0 00 00 84
[   51.192743] usb 3-1.4: New USB device found, idVendor=3D17ef, idProduct=
=3D310d, bcdDevice=3D10.07
[   51.192758] usb 3-1.4: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D3
[   51.192765] usb 3-1.4: Product: Lenovo ThinkPad Thunderbolt 5 Smart Dock=
 7500 - 40BA DMC
[   51.192770] usb 3-1.4: Manufacturer: Lenovo
[   51.192774] usb 3-1.4: SerialNumber: 1S40BAYH00034Y
[   51.193137] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.193895] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00500 AUX -> (ret=3D 12) 90 cc 24 53 59 4e =
41 93 22 10 09 03
[   51.193903] i915 0000:00:02.0: [drm:drm_dp_dump_desc [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: DP branch: OUI 90-cc-24 dev-ID SYNA\223" HW-r=
ev 1.0 SW-rev 9.3 quirks 0x0028
[   51.194328] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.194743] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02210 AUX -> (ret=3D  1) fa
[   51.195160] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.195681] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00200 AUX -> (ret=3D  1) 01
[   51.196900] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.197663] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00080 AUX -> (ret=3D 16) 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00
[   51.197671] i915 0000:00:02.0: [drm:drm_dp_read_downstream_info [drm_dis=
play_helper]] AUX USBC3/DDI TC3/PHY TC3: DPCD DFP: 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00
[   51.198362] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.198788] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00021 AUX -> (ret=3D  1) 21
[   51.198795] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [ENCODER:306=
:DDI TC3/PHY TC3] MST support: port: yes, sink: MST, modparam: yes -> enabl=
e: MST
[   51.199339] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.199770] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00300 AUX -> (ret=3D  3) 00 10 fa
[   51.200196] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00300 AUX <- (ret=3D  3) 00 aa 01
[   51.200611] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.203109] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0000 AUX -> (ret=3D 12) 98 4f ee 42 52 00 =
00 00 00 b1 04 09
[   51.204338] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.204769] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe000d AUX -> (ret=3D  3) c1 0d 01
[   51.205190] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.205351] usbhid 3-1.4:1.2: couldn't find an input interrupt endpoint
[   51.205938] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0020 AUX -> (ret=3D  5) 80 01 01 cf 00
[   51.212526] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.212950] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0028 AUX -> (ret=3D  2) 1e 04
[   51.213747] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.215764] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0030 AUX -> (ret=3D  1) 00
[   51.215775] i915 0000:00:02.0: [drm:drm_dp_tunnel_detect [drm_display_he=
lper]] [DPTUN 1:1:13][AUX USBC3/DDI TC3/PHY TC3] OUI:98-4f-ee DevID:BR Rev-=
HW:11.1 SW:4.9 PR-Sup:yes BWA-Sup:yes BWA-En:no
[   51.216083] hid-generic 0003:17EF:310D.0004: hiddev98,hidraw3: USB HID v=
1.11 Device [Lenovo Lenovo ThinkPad Thunderbolt 5 Smart Dock 7500 - 40BA DM=
C] on usb-0000:00:14.0-1.4/input3
[   51.216190] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.216593] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0030 AUX -> (ret=3D  1) 00
[   51.216793] thunderbolt 0000:8a:00.0: acking DP_BW (0x20) notification o=
n 0
[   51.216803] thunderbolt 0000:8a:00.0: 0:13: handling bandwidth allocatio=
n request, retry 0
[   51.217022] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0xe0030 AUX <- (ret=3D  1) c0
[   51.217156] thunderbolt 0000:8a:00.0: 0:13: DPTX enabled bandwidth alloc=
ation mode, updating estimated bandwidth
[   51.217160] thunderbolt 0000:8a:00.0: bandwidth consumption changed, re-=
calculating estimated bandwidth
[   51.217162] thunderbolt 0000:8a:00.0: re-calculating bandwidth estimatio=
n for group 1
[   51.217439] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.218331] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0000 AUX -> (ret=3D 12) 98 4f ee 42 52 00 =
00 00 00 b1 04 09
[   51.218359] thunderbolt 0000:8a:00.0: 0:21: scaled bandwidth 220/220, sc=
ale 0
[   51.219687] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): decreased ba=
ndwidth allocation to 900/900 Mb/s
[   51.219989] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.220325] thunderbolt 0000:8a:00.0: 0:1: link maximum bandwidth 36000/=
108000 Mb/s
[   51.220435] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): consumed ban=
dwidth 3000/3000 Mb/s
[   51.220443] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe000d AUX -> (ret=3D  3) c1 0d 01
[   51.220582] thunderbolt 0000:8a:00.0: 0:1: reserving 1500/1500 Mb/s for =
PCIe
[   51.220879] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.220949] thunderbolt 0000:8a:00.0: 1:1: link maximum bandwidth 36000/=
108000 Mb/s
[   51.221095] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): consumed ban=
dwidth 3000/3000 Mb/s
[   51.221204] thunderbolt 0000:8a:00.0: 1:1: reserving 1500/1500 Mb/s for =
PCIe
[   51.221205] thunderbolt 0000:8a:00.0: 0:13 <-> 1:12 (DP): re-calculated =
estimated bandwidth 103500 (+ 0 reserved) =3D 103500 Mb/s
[   51.221606] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): reclaiming u=
nused bandwidth
[   51.221611] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0020 AUX -> (ret=3D  5) 80 01 01 cf 00
[   51.222054] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.222246] thunderbolt 0000:8a:00.0: 0:1: link maximum bandwidth 72000/=
72000 Mb/s
[   51.222374] thunderbolt 0000:8a:00.0: 0:1: reserving 1500/1500 Mb/s for =
PCIe
[   51.222489] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0028 AUX -> (ret=3D  2) 1e 04
[   51.222758] thunderbolt 0000:8a:00.0: 0:13 <-> 1:12 (DP): consumed bandw=
idth 0/25920 Mb/s
[   51.222931] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.223123] thunderbolt 0000:8a:00.0: 1:1: link maximum bandwidth 72000/=
72000 Mb/s
[   51.223271] thunderbolt 0000:8a:00.0: 1:1: reserving 1500/1500 Mb/s for =
PCIe
[   51.223369] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0030 AUX -> (ret=3D  1) c0
[   51.223378] i915 0000:00:02.0: [drm:update_group_available_bw [drm_displ=
ay_helper]] [DPTUN 1:1:13][AUX USBC3/DDI TC3/PHY TC3] Updated group availab=
le BW: -1->103500
[   51.223389] i915 0000:00:02.0: [drm:drm_dp_tunnel_enable_bw_alloc [drm_d=
isplay_helper]] [DPTUN 1:1:13][AUX USBC3/DDI TC3/PHY TC3] Enabling BW alloc=
 mode: DPRX:8100x4 Group alloc:0/103500 Mb/s (Ok)
[   51.223654] thunderbolt 0000:8a:00.0: 0:13 <-> 1:12 (DP): consumed bandw=
idth 0/25920 Mb/s
[   51.223656] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): available ba=
ndwidth 70500/44580 Mb/s
[   51.223828] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX <- (ret=3D  1) 03
[   51.224019] thunderbolt 0000:8a:00.0: acking DP_BW (0x20) notification o=
n 0
[   51.224258] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0xe0031 AUX <- (ret=3D  1) 00
[   51.224680] thunderbolt 0000:8a:00.0: 0:21: scaled bandwidth 3599/3599, =
scale 0
[   51.224696] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.225116] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.225319] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): increased ba=
ndwidth allocation to 14738/14738 Mb/s
[   51.225321] thunderbolt 0000:8a:00.0: bandwidth estimation for group 1 d=
one
[   51.225322] thunderbolt 0000:8a:00.0: bandwidth re-calculation done
[   51.225325] thunderbolt 0000:8a:00.0: 0:13: handling bandwidth allocatio=
n request, retry 0
[   51.225702] thunderbolt 0000:8a:00.0: 0:13: requested bandwidth 0 Mb/s
[   51.226215] thunderbolt 0000:8a:00.0: 0:13 <-> 1:12 (DP): bandwidth allo=
cated currently 0/25920 Mb/s
[   51.226599] thunderbolt 0000:8a:00.0: 0:13 <-> 1:12 (DP): corrected band=
width request 0/0 Mb/s
[   51.230274] thunderbolt 0000:8a:00.0: 0:13 <-> 1:12 (DP): bandwidth allo=
cation changed to 0/0 Mb/s
[   51.230279] thunderbolt 0000:8a:00.0: bandwidth consumption changed, re-=
calculating estimated bandwidth
[   51.230280] thunderbolt 0000:8a:00.0: re-calculating bandwidth estimatio=
n for group 1
[   51.230297] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.230558] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.231566] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] got hpd i=
rq on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.231698] thunderbolt 0000:8a:00.0: 0:21: scaled bandwidth 220/220, sc=
ale 0
[   51.232201] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0xf0000 AUX -> (ret=3D  1) 20
[   51.232337] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): decreased ba=
ndwidth allocation to 900/900 Mb/s
[   51.232644] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.232977] thunderbolt 0000:8a:00.0: 0:1: link maximum bandwidth 36000/=
108000 Mb/s
[   51.233087] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): consumed ban=
dwidth 3000/3000 Mb/s
[   51.233233] thunderbolt 0000:8a:00.0: 0:1: reserving 1500/1500 Mb/s for =
PCIe
[   51.233369] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00000 AUX -> (ret=3D 15) 12 14 c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.233618] thunderbolt 0000:8a:00.0: 1:1: link maximum bandwidth 36000/=
108000 Mb/s
[   51.234505] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): consumed ban=
dwidth 3000/3000 Mb/s
[   51.234534] thunderbolt 0000:8a:00.0: 1:1: reserving 1500/1500 Mb/s for =
PCIe
[   51.234536] thunderbolt 0000:8a:00.0: 0:13 <-> 1:12 (DP): re-calculated =
estimated bandwidth 103500 (+ 0 reserved) =3D 103500 Mb/s
[   51.234550] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.234934] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): reclaiming u=
nused bandwidth
[   51.235315] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02200 AUX -> (ret=3D 15) 14 1e c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.235332] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: Base DPCD: 12 14 c4 81 01 1d 01 c4 6a 3f=
 04 00 00 00 84
[   51.235353] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: DPCD: 14 1e c4 81 01 1d 01 c4 6a 3f 04 0=
0 00 00 84
[   51.235575] thunderbolt 0000:8a:00.0: 0:1: link maximum bandwidth 72000/=
72000 Mb/s
[   51.235686] thunderbolt 0000:8a:00.0: 0:1: reserving 1500/1500 Mb/s for =
PCIe
[   51.235814] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.237058] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xf0000 AUX -> (ret=3D  8) 20 1e 80 aa 04 00 =
01 03
[   51.237080] i915 0000:00:02.0: [drm:intel_dp_init_lttpr_and_dprx_caps [i=
915]] [CONNECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][DPRX] LTTPR common =
capabilities: 20 1e 80 aa 04 00 01 03
[   51.237710] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0xf0003 AUX <- (ret=3D  1) 55
[   51.238140] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0xf0003 AUX <- (ret=3D  1) aa
[   51.238566] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.238997] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xf0020 AUX -> (ret=3D  3) 04 03 00
[   51.239044] thunderbolt 0000:8a:00.0: 0:13 <-> 1:12 (DP): consumed bandw=
idth 0/0 Mb/s
[   51.239020] i915 0000:00:02.0: [drm:intel_dp_init_lttpr_and_dprx_caps [i=
915]] [CONNECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][LTTPR 1] PHY capabi=
lities: 04 03 00
[   51.239444] thunderbolt 0000:8a:00.0: 1:1: link maximum bandwidth 72000/=
72000 Mb/s
[   51.241485] thunderbolt 0000:8a:00.0: 1:1: reserving 1500/1500 Mb/s for =
PCIe
[   51.241520] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.242152] thunderbolt 0000:8a:00.0: 0:13 <-> 1:12 (DP): consumed bandw=
idth 0/0 Mb/s
[   51.242153] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): available ba=
ndwidth 70500/70500 Mb/s
[   51.243073] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xf003d AUX -> (ret=3D 12) 98 4f ee 42 52 00 =
00 00 00 b1 04 09
[   51.243091] i915 0000:00:02.0: [drm:drm_dp_dump_desc [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: LTTPR 1: OUI 98-4f-ee dev-ID BR HW-rev 11.1 S=
W-rev 4.9 quirks 0x0000
[   51.243537] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.243854] thunderbolt 0000:8a:00.0: 0:21: scaled bandwidth 3599/3599, =
scale 0
[   51.244300] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00000 AUX -> (ret=3D 15) 12 14 c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.244495] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): increased ba=
ndwidth allocation to 14738/14738 Mb/s
[   51.244496] thunderbolt 0000:8a:00.0: bandwidth estimation for group 1 d=
one
[   51.244498] thunderbolt 0000:8a:00.0: bandwidth re-calculation done
[   51.244727] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.245476] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02200 AUX -> (ret=3D 15) 14 1e c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.245492] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: Base DPCD: 12 14 c4 81 01 1d 01 c4 6a 3f=
 04 00 00 00 84
[   51.245514] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: DPCD: 14 1e c4 81 01 1d 01 c4 6a 3f 04 0=
0 00 00 84
[   51.246762] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.249373] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00500 AUX -> (ret=3D 12) 90 cc 24 53 59 4e =
41 93 22 10 09 03
[   51.249391] i915 0000:00:02.0: [drm:drm_dp_dump_desc [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: DP branch: OUI 90-cc-24 dev-ID SYNA\223" HW-r=
ev 1.0 SW-rev 9.3 quirks 0x0028
[   51.249801] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.250216] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02210 AUX -> (ret=3D  1) fa
[   51.250645] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.251030] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00200 AUX -> (ret=3D  1) 01
[   51.251470] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.253963] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00080 AUX -> (ret=3D 16) 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00
[   51.253981] i915 0000:00:02.0: [drm:drm_dp_read_downstream_info [drm_dis=
play_helper]] AUX USBC3/DDI TC3/PHY TC3: DPCD DFP: 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00
[   51.254413] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.254849] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00201 AUX -> (ret=3D  1) 00
[   51.255280] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.255421] pcieport 0000:00:06.2: PME: Spurious native interrupt!
[   51.255726] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.256150] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.256599] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 12
[   51.257036] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX <- (ret=3D  1) 20
[   51.257467] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.257900] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.258330] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 12
[   51.258765] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x0200b AUX -> (ret=3D  1) 00
[   51.259187] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX <- (ret=3D  1) 03
[   51.259197] i915 0000:00:02.0: [drm:drm_dp_tunnel_alloc_bw [drm_display_=
helper]] [DPTUN 1:1:13][AUX USBC3/DDI TC3/PHY TC3] Allocating 0/26000 Mb/s =
for tunnel: Group alloc:0/103500 Mb/s (Ok)
[   51.259636] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.260053] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.260490] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.260928] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0023 AUX -> (ret=3D  1) cf
[   51.261343] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.261776] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00070 AUX -> (ret=3D  2) 00 00
[   51.262584] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.263917] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x000b0 AUX -> (ret=3D  7) 07 1c 00 00 00 00 =
00
[   51.263925] i915 0000:00:02.0: [drm:intel_psr_init_dpcd [i915]] Panel re=
play selective_update is supported by panel
[   51.264512] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.264933] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x000b1 AUX -> (ret=3D  1) 1c
[   51.265355] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.268023] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00060 AUX -> (ret=3D 16) 03 21 00 14 0b 04 =
03 c0 01 17 0e e2 08 00 00 00
[   51.268031] i915 0000:00:02.0: [drm:intel_dp_get_dsc_sink_cap [i915]] DS=
C DPCD: 03 21 00 14 0b 04 03 c0 01 17 0e e2 08 00 00 00
[   51.269350] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.269768] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00090 AUX -> (ret=3D  1) ff
[   51.269776] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] FEC CAPABILI=
TY: ff
[   51.270274] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.270677] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02214 AUX -> (ret=3D  1) 03
[   51.271135] pci 0000:8b:00.0: [8086:5786] type 01 class 0x060400 PCIe Sw=
itch Upstream Port
[   51.271194] pci 0000:8b:00.0: PCI bridge to [bus 00]
[   51.271210] pci 0000:8b:00.0:   bridge window [io  0x0000-0x0fff]
[   51.271217] pci 0000:8b:00.0:   bridge window [mem 0x00000000-0x000fffff]
[   51.271239] pci 0000:8b:00.0:   bridge window [mem 0x00000000-0x000fffff=
 64bit pref]
[   51.271265] pci 0000:8b:00.0: enabling Extended Tags
[   51.271356] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00107 AUX <- (ret=3D  2) 00 01
[   51.272252] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00100 AUX <- (ret=3D  2) 1e 84
[   51.272582] pci 0000:8b:00.0: supports D1 D2
[   51.272585] pci 0000:8b:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[   51.272719] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.273111] pci 0000:8b:00.0: Adding to iommu group 28
[   51.273478] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00000 AUX -> (ret=3D 15) 12 14 c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.276298] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.276369] pci 0000:8b:00.0: bridge configuration invalid ([bus 00-00])=
, reconfiguring
[   51.276552] pci 0000:8c:00.0: [8086:5786] type 01 class 0x060400 PCIe Sw=
itch Downstream Port
[   51.276606] pci 0000:8c:00.0: PCI bridge to [bus 00]
[   51.276619] pci 0000:8c:00.0:   bridge window [io  0x0000-0x0fff]
[   51.276625] pci 0000:8c:00.0:   bridge window [mem 0x00000000-0x000fffff]
[   51.276646] pci 0000:8c:00.0:   bridge window [mem 0x00000000-0x000fffff=
 64bit pref]
[   51.276674] pci 0000:8c:00.0: enabling Extended Tags
[   51.276963] pci 0000:8c:00.0: supports D1 D2
[   51.276964] pci 0000:8c:00.0: PME# supported from D0 D1 D2 D3hot D3cold
[   51.277036] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02200 AUX -> (ret=3D 15) 14 1e c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.277043] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: Base DPCD: 12 14 c4 81 01 1d 01 c4 6a 3f=
 04 00 00 00 84
[   51.277054] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: DPCD: 14 1e c4 81 01 1d 01 c4 6a 3f 04 0=
0 00 00 84
[   51.277063] i915 0000:00:02.0: [drm:drm_dp_mst_topology_mgr_set_mst [drm=
_display_helper]] mstb 00000000e6773186 (2)
[   51.277409] pci 0000:8c:00.0: Adding to iommu group 29
[   51.277635] pci 0000:8c:01.0: [8086:5786] type 01 class 0x060400 PCIe Sw=
itch Downstream Port
[   51.277688] pci 0000:8c:01.0: PCI bridge to [bus 00]
[   51.277701] pci 0000:8c:01.0:   bridge window [io  0x0000-0x0fff]
[   51.277707] pci 0000:8c:01.0:   bridge window [mem 0x00000000-0x000fffff]
[   51.277728] pci 0000:8c:01.0:   bridge window [mem 0x00000000-0x000fffff=
 64bit pref]
[   51.277756] pci 0000:8c:01.0: enabling Extended Tags
[   51.277818] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00111 AUX <- (ret=3D  1) 07
[   51.277999] pci 0000:8c:01.0: supports D1 D2
[   51.278000] pci 0000:8c:01.0: PME# supported from D0 D1 D2 D3hot D3cold
[   51.278237] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x002c0 AUX <- (ret=3D  1) 01
[   51.278761] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x001c0 AUX <- (ret=3D  3) 00 00 3f
[   51.278814] pci 0000:8c:01.0: Adding to iommu group 30
[   51.279013] pci 0000:8c:02.0: [8086:5786] type 01 class 0x060400 PCIe Sw=
itch Downstream Port
[   51.279067] pci 0000:8c:02.0: PCI bridge to [bus 00]
[   51.279080] pci 0000:8c:02.0:   bridge window [io  0x0000-0x0fff]
[   51.279086] pci 0000:8c:02.0:   bridge window [mem 0x00000000-0x000fffff]
[   51.279107] pci 0000:8c:02.0:   bridge window [mem 0x00000000-0x000fffff=
 64bit pref]
[   51.279134] pci 0000:8c:02.0: enabling Extended Tags
[   51.280748] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX -> (ret=3D  1) 00
[   51.281001] pci 0000:8c:02.0: supports D1 D2
[   51.281003] pci 0000:8c:02.0: PME# supported from D0 D1 D2 D3hot D3cold
[   51.281189] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x002c0 AUX -> (ret=3D  1) 01
[   51.281196] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 00000000e6773186 (1)
[   51.281206] i915 0000:00:02.0: [drm:intel_dp_print_rates [i915]] source =
rates: 162000, 216000, 243000, 270000, 324000, 432000, 540000, 675000, 8100=
00, 1000000, 2000000
[   51.281348] pci 0000:8c:02.0: Adding to iommu group 31
[   51.281305] i915 0000:00:02.0: [drm:intel_dp_print_rates [i915]] sink ra=
tes: 162000, 270000, 540000, 810000
[   51.281400] i915 0000:00:02.0: [drm:intel_dp_print_rates [i915]] common =
rates: 162000, 270000, 540000, 810000
[   51.281497] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 00000000e6773186 (2)
[   51.281507] i915 0000:00:02.0: [drm:drm_dp_mst_link_probe_work [drm_disp=
lay_helper]] Clearing payload ID table
[   51.281519] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] txmsg cur_offset=3D0 cur_len=3D1 seqno=3D0 state=3DQUEUED p=
ath_msg=3D1 dst=3D00
[   51.281528] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 	type=3DCLEAR_PAYLOAD_ID_TABLE contents:
[   51.281535] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 		???
[   51.281538] pci 0000:8c:03.0: [8086:5786] type 01 class 0x060400 PCIe Sw=
itch Downstream Port
[   51.281617] pci 0000:8c:03.0: PCI bridge to [bus 00]
[   51.281630] pci 0000:8c:03.0:   bridge window [io  0x0000-0x0fff]
[   51.281636] pci 0000:8c:03.0:   bridge window [mem 0x00000000-0x000fffff]
[   51.281657] pci 0000:8c:03.0:   bridge window [mem 0x00000000-0x000fffff=
 64bit pref]
[   51.281684] pci 0000:8c:03.0: enabling Extended Tags
[   51.281904] pci 0000:8c:03.0: supports D1 D2
[   51.281905] pci 0000:8c:03.0: PME# supported from D0 D1 D2 D3hot D3cold
[   51.282246] pci 0000:8c:03.0: Adding to iommu group 32
[   51.282281] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x01000 AUX <- (ret=3D  5) 16 c2 cf 14 ac
[   51.282446] pci 0000:8b:00.0: PCI bridge to [bus 8c-b0]
[   51.282473] pci 0000:8c:00.0: bridge configuration invalid ([bus 00-00])=
, reconfiguring
[   51.282488] pci 0000:8c:01.0: bridge configuration invalid ([bus 00-00])=
, reconfiguring
[   51.282503] pci 0000:8c:02.0: bridge configuration invalid ([bus 00-00])=
, reconfiguring
[   51.282517] pci 0000:8c:03.0: bridge configuration invalid ([bus 00-00])=
, reconfiguring
[   51.282645] pci 0000:8c:00.0: PCI bridge to [bus 8d-b0]
[   51.282670] pci_bus 0000:8d: busn_res: [bus 8d-b0] end is updated to 8d
[   51.283257] pci 0000:8c:01.0: PCI bridge to [bus 8e-b0]
[   51.283282] pci_bus 0000:8e: busn_res: [bus 8e-b0] end is updated to 99
[   51.283390] pci 0000:8c:02.0: PCI bridge to [bus 9a-b0]
[   51.283414] pci_bus 0000:9a: busn_res: [bus 9a-b0] end is updated to a5
[   51.283519] pci 0000:8c:03.0: PCI bridge to [bus a6-b0]
[   51.283543] pci_bus 0000:a6: busn_res: [bus a6-b0] end is updated to b0
[   51.283552] pci_bus 0000:8c: busn_res: [bus 8c-b0] end is updated to b0
[   51.283567] pci 0000:8c:01.0: bridge window [mem 0x00100000-0x001fffff 6=
4bit pref] to [bus 8e-99] add_size 100000 add_align 100000
[   51.283571] pci 0000:8c:01.0: bridge window [mem 0x00100000-0x001fffff] =
to [bus 8e-99] add_size 100000 add_align 100000
[   51.283573] pci 0000:8c:02.0: bridge window [mem 0x00100000-0x001fffff 6=
4bit pref] to [bus 9a-a5] add_size 100000 add_align 100000
[   51.283576] pci 0000:8c:02.0: bridge window [mem 0x00100000-0x001fffff] =
to [bus 9a-a5] add_size 100000 add_align 100000
[   51.283578] pci 0000:8c:03.0: bridge window [mem 0x00100000-0x001fffff 6=
4bit pref] to [bus a6-b0] add_size 100000 add_align 100000
[   51.283580] pci 0000:8c:03.0: bridge window [mem 0x00100000-0x001fffff] =
to [bus a6-b0] add_size 100000 add_align 100000
[   51.283585] pcieport 0000:89:01.0: Assigned bridge window [mem 0x4220000=
000-0x42201fffff 64bit pref] to [bus 8b-b0] cannot fit 0x400000 required fo=
r 0000:8b:00.0 bridging to [bus 8c-b0]
[   51.283589] pci 0000:8b:00.0: bridge window [mem 0x00000000-0x000fffff 6=
4bit pref] to [bus 8c-b0] requires relaxed alignment rules
[   51.283591] pcieport 0000:89:01.0: Assigned bridge window [mem 0x4220000=
000-0x42201fffff 64bit pref] to [bus 8b-b0] cannot fit 0x700000 required fo=
r 0000:8b:00.0 bridging to [bus 8c-b0]
[   51.283594] pci 0000:8b:00.0: bridge window [mem 0x00000000-0x000fffff 6=
4bit pref] to [bus 8c-b0] requires relaxed alignment rules
[   51.283595] pci 0000:8b:00.0: bridge window [mem 0x00100000-0x004fffff 6=
4bit pref] to [bus 8c-b0] add_size 300000 add_align 100000
[   51.283599] pci 0000:8b:00.0: bridge window [mem 0x00100000-0x004fffff] =
to [bus 8c-b0] add_size 300000 add_align 100000
[   51.283611] pci 0000:8b:00.0: bridge window [mem 0x84000000-0x87efffff]:=
 assigned
[   51.283615] pci 0000:8b:00.0: bridge window [mem size 0x00700000 64bit p=
ref]: can't assign; no space
[   51.283617] pci 0000:8b:00.0: bridge window [mem size 0x00700000 64bit p=
ref]: failed to assign
[   51.283620] pci 0000:8b:00.0: bridge window [io  size 0x4000]: can't ass=
ign; no space
[   51.283622] pci 0000:8b:00.0: bridge window [io  size 0x4000]: failed to=
 assign
[   51.283624] pci 0000:8b:00.0: bridge window [mem 0x84000000-0x87efffff]:=
 assigned
[   51.283627] pci 0000:8b:00.0: bridge window [mem size 0x00400000 64bit p=
ref]: can't assign; no space
[   51.283628] pci 0000:8b:00.0: bridge window [mem size 0x00400000 64bit p=
ref]: failed to assign
[   51.283630] pci 0000:8b:00.0: bridge window [io  size 0x4000]: can't ass=
ign; no space
[   51.283631] pci 0000:8b:00.0: bridge window [io  size 0x4000]: failed to=
 assign
[   51.283637] pci 0000:8c:00.0: bridge window [mem 0x84000000-0x840fffff]:=
 assigned
[   51.283639] pci 0000:8c:00.0: bridge window [mem 0x84100000-0x841fffff 6=
4bit pref]: assigned
[   51.283641] pci 0000:8c:01.0: bridge window [mem 0x84200000-0x855fffff]:=
 assigned
[   51.283642] pci 0000:8c:01.0: bridge window [mem 0x85600000-0x856fffff 6=
4bit pref]: assigned
[   51.283644] pci 0000:8c:02.0: bridge window [mem 0x85700000-0x86afffff]:=
 assigned
[   51.283646] pci 0000:8c:02.0: bridge window [mem 0x86b00000-0x86bfffff 6=
4bit pref]: assigned
[   51.283647] pci 0000:8c:03.0: bridge window [mem size 0x01400000]: can't=
 assign; no space
[   51.283649] pci 0000:8c:03.0: bridge window [mem size 0x01400000]: faile=
d to assign
[   51.283651] pci 0000:8c:03.0: bridge window [mem 0x86c00000-0x86cfffff 6=
4bit pref]: assigned
[   51.283653] pci 0000:8c:00.0: bridge window [io  size 0x1000]: can't ass=
ign; no space
[   51.283654] pci 0000:8c:00.0: bridge window [io  size 0x1000]: failed to=
 assign
[   51.283656] pci 0000:8c:01.0: bridge window [io  size 0x1000]: can't ass=
ign; no space
[   51.283657] pci 0000:8c:01.0: bridge window [io  size 0x1000]: failed to=
 assign
[   51.283658] pci 0000:8c:02.0: bridge window [io  size 0x1000]: can't ass=
ign; no space
[   51.283660] pci 0000:8c:02.0: bridge window [io  size 0x1000]: failed to=
 assign
[   51.283661] pci 0000:8c:03.0: bridge window [io  size 0x1000]: can't ass=
ign; no space
[   51.283662] pci 0000:8c:03.0: bridge window [io  size 0x1000]: failed to=
 assign
[   51.283664] pci 0000:8c:00.0: bridge window [mem 0x84000000-0x840fffff]:=
 assigned
[   51.283666] pci 0000:8c:00.0: bridge window [mem 0x84100000-0x841fffff 6=
4bit pref]: assigned
[   51.283668] pci 0000:8c:01.0: bridge window [mem 0x84200000-0x855fffff]:=
 assigned
[   51.283670] pci 0000:8c:01.0: bridge window [mem 0x85600000-0x856fffff 6=
4bit pref]: assigned
[   51.283671] pci 0000:8c:02.0: bridge window [mem 0x85700000-0x86afffff]:=
 assigned
[   51.283673] pci 0000:8c:02.0: bridge window [mem 0x86b00000-0x86bfffff 6=
4bit pref]: assigned
[   51.283675] pci 0000:8c:03.0: bridge window [mem size 0x01400000]: can't=
 assign; no space
[   51.283676] pci 0000:8c:03.0: bridge window [mem size 0x01400000]: faile=
d to assign
[   51.283678] pci 0000:8c:03.0: bridge window [mem 0x86c00000-0x86cfffff 6=
4bit pref]: assigned
[   51.283679] pci 0000:8c:00.0: bridge window [io  size 0x1000]: can't ass=
ign; no space
[   51.283681] pci 0000:8c:00.0: bridge window [io  size 0x1000]: failed to=
 assign
[   51.283682] pci 0000:8c:01.0: bridge window [io  size 0x1000]: can't ass=
ign; no space
[   51.283684] pci 0000:8c:01.0: bridge window [io  size 0x1000]: failed to=
 assign
[   51.283685] pci 0000:8c:02.0: bridge window [io  size 0x1000]: can't ass=
ign; no space
[   51.283686] pci 0000:8c:02.0: bridge window [io  size 0x1000]: failed to=
 assign
[   51.283688] pci 0000:8c:03.0: bridge window [io  size 0x1000]: can't ass=
ign; no space
[   51.283689] pci 0000:8c:03.0: bridge window [io  size 0x1000]: failed to=
 assign
[   51.283691] pci 0000:8c:00.0: PCI bridge to [bus 8d]
[   51.283720] pci 0000:8c:00.0:   bridge window [mem 0x84000000-0x840fffff]
[   51.283726] pci 0000:8c:00.0:   bridge window [mem 0x84100000-0x841fffff=
 64bit pref]
[   51.283737] pci 0000:8c:01.0: PCI bridge to [bus 8e-99]
[   51.283745] pci 0000:8c:01.0:   bridge window [mem 0x84200000-0x855fffff]
[   51.283751] pci 0000:8c:01.0:   bridge window [mem 0x85600000-0x856fffff=
 64bit pref]
[   51.283762] pci 0000:8c:02.0: PCI bridge to [bus 9a-a5]
[   51.283770] pci 0000:8c:02.0:   bridge window [mem 0x85700000-0x86afffff]
[   51.283776] pci 0000:8c:02.0:   bridge window [mem 0x86b00000-0x86bfffff=
 64bit pref]
[   51.283787] pci 0000:8c:03.0: PCI bridge to [bus a6-b0]
[   51.283800] pci 0000:8c:03.0:   bridge window [mem 0x86c00000-0x86cfffff=
 64bit pref]
[   51.283810] pci 0000:8b:00.0: PCI bridge to [bus 8c-b0]
[   51.283818] pci 0000:8b:00.0:   bridge window [mem 0x84000000-0x87efffff]
[   51.283833] pcieport 0000:89:01.0: PCI bridge to [bus 8b-b0]
[   51.283836] pcieport 0000:89:01.0:   bridge window [io  0x4000-0x4fff]
[   51.283842] pcieport 0000:89:01.0:   bridge window [mem 0x84000000-0x87e=
fffff]
[   51.283847] pcieport 0000:89:01.0:   bridge window [mem 0x4220000000-0x4=
2201fffff 64bit pref]
[   51.283854] PCI: No. 2 try to assign unassigned res
[   51.283856] pci 0000:8c:00.0: resource 14 [mem 0x84000000-0x840fffff] re=
leased
[   51.283859] pci 0000:8c:00.0: PCI bridge to [bus 8d]
[   51.283865] pci 0000:8c:01.0: resource 14 [mem 0x84200000-0x855fffff] re=
leased
[   51.283866] pci 0000:8c:01.0: PCI bridge to [bus 8e-99]
[   51.283872] pci 0000:8c:02.0: resource 14 [mem 0x85700000-0x86afffff] re=
leased
[   51.283874] pci 0000:8c:02.0: PCI bridge to [bus 9a-a5]
[   51.283879] release child resource [mem 0x84100000-0x841fffff 64bit pref]
[   51.283881] release child resource [mem 0x85600000-0x856fffff 64bit pref]
[   51.283882] release child resource [mem 0x86b00000-0x86bfffff 64bit pref]
[   51.283883] release child resource [mem 0x86c00000-0x86cfffff 64bit pref]
[   51.283885] pci 0000:8b:00.0: resource 14 [mem 0x84000000-0x87efffff] re=
leased
[   51.283886] pci 0000:8b:00.0: PCI bridge to [bus 8c-b0]
[   51.283892] pcieport 0000:89:01.0: resource 13 [io  0x4000-0x4fff] relea=
sed
[   51.283894] pcieport 0000:89:01.0: PCI bridge to [bus 8b-b0]
[   51.283901] pcieport 0000:89:01.0: resource 15 [mem 0x4220000000-0x42201=
fffff 64bit pref] released
[   51.283903] pcieport 0000:89:01.0: PCI bridge to [bus 8b-b0]
[   51.283914] pci 0000:8c:01.0: bridge window [mem 0x00100000-0x001fffff 6=
4bit pref] to [bus 8e-99] add_size 100000 add_align 100000
[   51.283917] pci 0000:8c:02.0: bridge window [mem 0x00100000-0x001fffff 6=
4bit pref] to [bus 9a-a5] add_size 100000 add_align 100000
[   51.283919] pci 0000:8c:03.0: bridge window [mem 0x00100000-0x001fffff 6=
4bit pref] to [bus a6-b0] add_size 100000 add_align 100000
[   51.283923] pci 0000:8b:00.0: bridge window [mem 0x00100000-0x004fffff 6=
4bit pref] to [bus 8c-b0] add_size 300000 add_align 100000
[   51.283926] pcieport 0000:89:01.0: bridge window [mem 0x00100000-0x004ff=
fff 64bit pref] to [bus 8b-b0] add_size 300000 add_align 100000
[   51.283931] pcieport 0000:89:01.0: bridge window [mem 0x4220400000-0x422=
0afffff 64bit pref]: assigned
[   51.283933] pcieport 0000:89:01.0: bridge window [io  size 0x4000]: can'=
t assign; no space
[   51.283935] pcieport 0000:89:01.0: bridge window [io  size 0x4000]: fail=
ed to assign
[   51.283936] pcieport 0000:89:01.0: bridge window [io  size 0x4000]: can'=
t assign; no space
[   51.283938] pcieport 0000:89:01.0: bridge window [io  size 0x4000]: fail=
ed to assign
[   51.283940] pci 0000:8b:00.0: bridge window [mem 0x84000000-0x87efffff]:=
 assigned
[   51.283942] pci 0000:8b:00.0: bridge window [mem 0x4220400000-0x42207fff=
ff 64bit pref]: assigned
[   51.283943] pci 0000:8b:00.0: bridge window [io  size 0x4000]: can't ass=
ign; no space
[   51.283945] pci 0000:8b:00.0: bridge window [io  size 0x4000]: failed to=
 assign
[   51.283946] pci 0000:8b:00.0: bridge window [io  size 0x4000]: can't ass=
ign; no space
[   51.283948] pci 0000:8b:00.0: bridge window [io  size 0x4000]: failed to=
 assign
[   51.283951] pci 0000:8c:00.0: bridge window [mem 0x84000000-0x840fffff]:=
 assigned
[   51.283953] pci 0000:8c:00.0: bridge window [mem 0x4220400000-0x42204fff=
ff 64bit pref]: assigned
[   51.283954] pci 0000:8c:01.0: bridge window [mem 0x84100000-0x854fffff]:=
 assigned
[   51.283956] pci 0000:8c:01.0: bridge window [mem 0x4220500000-0x42205fff=
ff 64bit pref]: assigned
[   51.283958] pci 0000:8c:02.0: bridge window [mem 0x85500000-0x868fffff]:=
 assigned
[   51.283959] pci 0000:8c:02.0: bridge window [mem 0x4220600000-0x42206fff=
ff 64bit pref]: assigned
[   51.283961] pci 0000:8c:03.0: bridge window [mem 0x86900000-0x87cfffff]:=
 assigned
[   51.283962] pci 0000:8c:03.0: bridge window [mem 0x4220700000-0x42207fff=
ff 64bit pref]: assigned
[   51.283964] pci 0000:8c:00.0: bridge window [io  size 0x1000]: can't ass=
ign; no space
[   51.283965] pci 0000:8c:00.0: bridge window [io  size 0x1000]: failed to=
 assign
[   51.283967] pci 0000:8c:01.0: bridge window [io  size 0x1000]: can't ass=
ign; no space
[   51.283968] pci 0000:8c:01.0: bridge window [io  size 0x1000]: failed to=
 assign
[   51.283970] pci 0000:8c:02.0: bridge window [io  size 0x1000]: can't ass=
ign; no space
[   51.283971] pci 0000:8c:02.0: bridge window [io  size 0x1000]: failed to=
 assign
[   51.283972] pci 0000:8c:03.0: bridge window [io  size 0x1000]: can't ass=
ign; no space
[   51.283974] pci 0000:8c:03.0: bridge window [io  size 0x1000]: failed to=
 assign
[   51.283976] pci 0000:8c:00.0: bridge window [io  size 0x1000]: can't ass=
ign; no space
[   51.283977] pci 0000:8c:00.0: bridge window [io  size 0x1000]: failed to=
 assign
[   51.283978] pci 0000:8c:01.0: bridge window [io  size 0x1000]: can't ass=
ign; no space
[   51.283980] pci 0000:8c:01.0: bridge window [io  size 0x1000]: failed to=
 assign
[   51.283981] pci 0000:8c:02.0: bridge window [io  size 0x1000]: can't ass=
ign; no space
[   51.283982] pci 0000:8c:02.0: bridge window [io  size 0x1000]: failed to=
 assign
[   51.283984] pci 0000:8c:03.0: bridge window [io  size 0x1000]: can't ass=
ign; no space
[   51.283985] pci 0000:8c:03.0: bridge window [io  size 0x1000]: failed to=
 assign
[   51.283986] pci 0000:8c:00.0: PCI bridge to [bus 8d]
[   51.283997] pci 0000:8c:00.0:   bridge window [mem 0x84000000-0x840fffff]
[   51.284003] pci 0000:8c:00.0:   bridge window [mem 0x4220400000-0x42204f=
ffff 64bit pref]
[   51.284024] pci 0000:8c:01.0: PCI bridge to [bus 8e-99]
[   51.284032] pci 0000:8c:01.0:   bridge window [mem 0x84100000-0x854fffff]
[   51.284038] pci 0000:8c:01.0:   bridge window [mem 0x4220500000-0x42205f=
ffff 64bit pref]
[   51.284049] pci 0000:8c:02.0: PCI bridge to [bus 9a-a5]
[   51.284057] pci 0000:8c:02.0:   bridge window [mem 0x85500000-0x868fffff]
[   51.284063] pci 0000:8c:02.0:   bridge window [mem 0x4220600000-0x42206f=
ffff 64bit pref]
[   51.284074] pci 0000:8c:03.0: PCI bridge to [bus a6-b0]
[   51.284082] pci 0000:8c:03.0:   bridge window [mem 0x86900000-0x87cfffff]
[   51.284087] pci 0000:8c:03.0:   bridge window [mem 0x4220700000-0x42207f=
ffff 64bit pref]
[   51.284098] pci 0000:8b:00.0: PCI bridge to [bus 8c-b0]
[   51.284106] pci 0000:8b:00.0:   bridge window [mem 0x84000000-0x87efffff]
[   51.284112] pci 0000:8b:00.0:   bridge window [mem 0x4220400000-0x42207f=
ffff 64bit pref]
[   51.284123] pcieport 0000:89:01.0: PCI bridge to [bus 8b-b0]
[   51.284129] pcieport 0000:89:01.0:   bridge window [mem 0x84000000-0x87e=
fffff]
[   51.284133] pcieport 0000:89:01.0:   bridge window [mem 0x4220400000-0x4=
220afffff 64bit pref]
[   51.284175] pcieport 0000:8b:00.0: enabling device (0000 -> 0002)
[   51.284550] pcieport 0000:8c:00.0: enabling device (0000 -> 0002)
[   51.285113] pcieport 0000:8c:01.0: enabling device (0000 -> 0002)
[   51.285375] pcieport 0000:8c:01.0: pciehp: Slot #1 AttnBtn- PwrCtrl- MRL=
- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActR=
ep+
[   51.285764] pcieport 0000:8c:02.0: enabling device (0000 -> 0002)
[   51.285921] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.286057] pcieport 0000:8c:02.0: pciehp: Slot #2 AttnBtn- PwrCtrl- MRL=
- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActR=
ep+
[   51.286168] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.286330] pcieport 0000:8c:03.0: enabling device (0000 -> 0002)
[   51.286394] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] got hpd i=
rq on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.286649] pcieport 0000:8c:03.0: pciehp: Slot #3 AttnBtn- PwrCtrl- MRL=
- AttnInd- PwrInd- HotPlug+ Surprise+ Interlock- NoCompl+ IbPresDis- LLActR=
ep+
[   51.287003] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.287446] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.287455] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   51.288329] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 10 c3 c6 14 00 9c =
00 00 00 00 00 00 00 00 00 00
[   51.288340] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 00000000e6773186 (3)
[   51.288353] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 00000000e6773186 (2)
[   51.288447] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] txmsg cur_offset=3D0 cur_len=3D1 seqno=3D0 state=3DQUEUED p=
ath_msg=3D0 dst=3D00
[   51.288457] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 	type=3DLINK_ADDRESS
[   51.288896] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   51.289571] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x01000 AUX <- (ret=3D  5) 10 02 cb 01 d5
[   51.290058] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.290520] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.290541] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   51.291198] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.291920] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.292132] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.292291] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   51.292769] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.293224] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.293241] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   51.294704] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 10 2d 8c 01 00 00 =
00 00 00 00 00 00 00 00 00 00
[   51.294724] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 00000000e6773186 (3)
[   51.294689] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.294892] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.295506] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01410 AUX -> (ret=3D 16) 00 00 00 00 05 90 =
c0 01 00 00 00 00 00 00 00 00
[   51.296285] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01420 AUX -> (ret=3D 16) 00 00 00 00 00 00 =
00 00 00 00 00 02 00 00 00 c1
[   51.296304] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 00000000e6773186 (2)
[   51.296781] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   51.297200] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.297671] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.297688] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   51.298297] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.298924] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.299127] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.299280] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   51.299766] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.300198] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.300214] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   51.301077] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 10 2d 07 00 00 00 =
00 00 00 00 00 00 00 00 00 00
[   51.301095] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 00000000e6773186 (3)
[   51.301671] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.301874] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.302363] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01410 AUX -> (ret=3D 16) 00 00 00 23 c0 14 =
00 00 00 00 00 00 00 00 00 00
[   51.303068] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01420 AUX -> (ret=3D 16) 00 00 00 00 00 00 =
00 04 00 00 00 00 00 00 00 09
[   51.303087] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 00000000e6773186 (2)
[   51.303553] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   51.304015] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.304465] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.304482] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   51.305066] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.305516] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   51.305945] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.306148] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.306287] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.306764] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.306780] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   51.307710] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 10 0d 46 00 00 00 =
00 00 00 00 00 00 00 00 00 00
[   51.307728] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 00000000e6773186 (3)
[   51.307752] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 00000000e6773186 (2)
[   51.307843] i915 0000:00:02.0: [drm:drm_dp_send_link_address [drm_displa=
y_helper]] link address reply: 5
[   51.307867] i915 0000:00:02.0: [drm:drm_dp_send_link_address [drm_displa=
y_helper]] port 0: input 1, pdt: 1, pn: 0, dpcd_rev: 00, mcs: 1, ddps: 1, l=
dps 0, sdp 0/0
[   51.307881] i915 0000:00:02.0: [drm:drm_dp_send_link_address [drm_displa=
y_helper]] port 1: input 0, pdt: 0, pn: 1, dpcd_rev: 00, mcs: 0, ddps: 0, l=
dps 0, sdp 0/0
[   51.307892] i915 0000:00:02.0: [drm:drm_dp_send_link_address [drm_displa=
y_helper]] port 2: input 0, pdt: 0, pn: 2, dpcd_rev: 00, mcs: 0, ddps: 0, l=
dps 0, sdp 0/0
[   51.307901] i915 0000:00:02.0: [drm:drm_dp_send_link_address [drm_displa=
y_helper]] port 3: input 0, pdt: 2, pn: 3, dpcd_rev: 14, mcs: 1, ddps: 1, l=
dps 0, sdp 0/0
[   51.307911] i915 0000:00:02.0: [drm:drm_dp_send_link_address [drm_displa=
y_helper]] port 4: input 0, pdt: 0, pn: 4, dpcd_rev: 00, mcs: 0, ddps: 0, l=
dps 0, sdp 0/0
[   51.308232] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   51.308680] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.308882] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.309363] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00030 AUX <- (ret=3D 16) 69 38 02 b1 6f 49=
 3e 40 85 f5 ee 85 bb 03 9b 9d
[   51.309378] i915 0000:00:02.0: [drm:drm_dp_mst_add_port [drm_display_hel=
per]] mstb 00000000e6773186 (2)
[   51.309390] i915 0000:00:02.0: [drm:drm_dp_send_link_address [drm_displa=
y_helper]] port 0000000013286e8e (2)
[   51.309399] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_port [drm_di=
splay_helper]] port 0000000013286e8e (1)
[   51.309407] i915 0000:00:02.0: [drm:drm_dp_mst_add_port [drm_display_hel=
per]] mstb 00000000e6773186 (3)
[   51.309414] i915 0000:00:02.0: [drm:drm_dp_send_link_address [drm_displa=
y_helper]] port 000000003f2314f0 (2)
[   51.309423] i915 0000:00:02.0: [drm:mst_topology_add_connector [i915]] p=
ort 000000003f2314f0 (2)
[   51.309810] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.310570] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00500 AUX -> (ret=3D 12) 90 cc 24 53 59 4e =
41 93 22 10 09 03
[   51.310583] i915 0000:00:02.0: [drm:drm_dp_dump_desc [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: DP branch: OUI 90-cc-24 dev-ID SYNA\223" HW-r=
ev 1.0 SW-rev 9.3 quirks 0x0028
[   51.311024] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.311041] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   51.311443] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00060 AUX -> (ret=3D  1) 03
[   51.311876] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.312628] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00000 AUX -> (ret=3D 15) 12 14 c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.313026] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   51.313821] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02200 AUX -> (ret=3D 15) 14 1e c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.313829] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: Base DPCD: 12 14 c4 81 01 1d 01 c4 6a 3f=
 04 00 00 00 84
[   51.313840] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: DPCD: 14 1e c4 81 01 1d 01 c4 6a 3f 04 0=
0 00 00 84
[   51.314266] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.315029] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00000 AUX -> (ret=3D 15) 12 14 c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.315454] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.315470] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 00
[   51.315626] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] got hpd i=
rq on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.316213] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02200 AUX -> (ret=3D 15) 14 1e c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.316223] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: Base DPCD: 12 14 c4 81 01 1d 01 c4 6a 3f=
 04 00 00 00 84
[   51.316230] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: DPCD: 14 1e c4 81 01 1d 01 c4 6a 3f 04 0=
0 00 00 84
[   51.316653] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.317370] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00060 AUX -> (ret=3D 16) 03 21 00 14 0b 04 =
03 c0 01 17 0e e2 08 00 00 00
[   51.317378] i915 0000:00:02.0: [drm:intel_dp_get_dsc_sink_cap [i915]] DS=
C DPCD: 03 21 00 14 0b 04 03 c0 01 17 0e e2 08 00 00 00
[   51.317798] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.317814] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 00
[   51.318211] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00090 AUX -> (ret=3D  1) ff
[   51.318220] i915 0000:00:02.0: [drm:mst_topology_add_connector [i915]] F=
EC CAPABILITY: ff
[   51.319038] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00000 AUX -> (ret=3D 15) 12 14 c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.319802] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02200 AUX -> (ret=3D 15) 14 1e c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.319809] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: Base DPCD: 12 14 c4 81 01 1d 01 c4 6a 3f=
 04 00 00 00 84
[   51.319818] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: DPCD: 14 1e c4 81 01 1d 01 c4 6a 3f 04 0=
0 00 00 84
[   51.320579] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00500 AUX -> (ret=3D 12) 90 cc 24 53 59 4e =
41 93 22 10 09 03
[   51.320586] i915 0000:00:02.0: [drm:drm_dp_dump_desc [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: DP branch: OUI 90-cc-24 dev-ID SYNA\223" HW-r=
ev 1.0 SW-rev 9.3 quirks 0x0028
[   51.320596] i915 0000:00:02.0: [drm:mst_topology_add_connector [i915]] [=
CONNECTOR:324:DP-6] DSC HBLANK expansion quirk detected
[   51.320701] i915 0000:00:02.0: [drm:drm_sysfs_connector_add] [CONNECTOR:=
324:DP-6] adding connector to sysfs
[   51.320775] i915 0000:00:02.0: [drm:drm_dp_mst_connector_late_register [=
drm_display_helper]] registering DPMST remote bus for card1-DP-6
[   51.320855] i915 0000:00:02.0: [drm:drm_sysfs_connector_hotplug_event] [=
CONNECTOR:324:DP-6] generating connector hotplug event
[   51.320863] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_port [drm_di=
splay_helper]] port 000000003f2314f0 (1)
[   51.320873] i915 0000:00:02.0: [drm:drm_dp_mst_add_port [drm_display_hel=
per]] mstb 00000000e6773186 (4)
[   51.320881] i915 0000:00:02.0: [drm:drm_dp_send_link_address [drm_displa=
y_helper]] port 00000000301cacad (2)
[   51.320890] i915 0000:00:02.0: [drm:mst_topology_add_connector [i915]] p=
ort 00000000301cacad (2)
[   51.321761] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00500 AUX -> (ret=3D 12) 90 cc 24 53 59 4e =
41 93 22 10 09 03
[   51.321770] i915 0000:00:02.0: [drm:drm_dp_dump_desc [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: DP branch: OUI 90-cc-24 dev-ID SYNA\223" HW-r=
ev 1.0 SW-rev 9.3 quirks 0x0028
[   51.322214] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00060 AUX -> (ret=3D  1) 03
[   51.322977] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00000 AUX -> (ret=3D 15) 12 14 c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.323768] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02200 AUX -> (ret=3D 15) 14 1e c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.323776] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: Base DPCD: 12 14 c4 81 01 1d 01 c4 6a 3f=
 04 00 00 00 84
[   51.323785] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: DPCD: 14 1e c4 81 01 1d 01 c4 6a 3f 04 0=
0 00 00 84
[   51.324536] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00000 AUX -> (ret=3D 15) 12 14 c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.325289] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02200 AUX -> (ret=3D 15) 14 1e c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.325296] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: Base DPCD: 12 14 c4 81 01 1d 01 c4 6a 3f=
 04 00 00 00 84
[   51.325304] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: DPCD: 14 1e c4 81 01 1d 01 c4 6a 3f 04 0=
0 00 00 84
[   51.326039] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00060 AUX -> (ret=3D 16) 03 21 00 14 0b 04 =
03 c0 01 17 0e e2 08 00 00 00
[   51.326046] i915 0000:00:02.0: [drm:intel_dp_get_dsc_sink_cap [i915]] DS=
C DPCD: 03 21 00 14 0b 04 03 c0 01 17 0e e2 08 00 00 00
[   51.326597] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00090 AUX -> (ret=3D  1) ff
[   51.326606] i915 0000:00:02.0: [drm:mst_topology_add_connector [i915]] F=
EC CAPABILITY: ff
[   51.327452] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00000 AUX -> (ret=3D 15) 12 14 c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.328210] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02200 AUX -> (ret=3D 15) 14 1e c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.328218] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: Base DPCD: 12 14 c4 81 01 1d 01 c4 6a 3f=
 04 00 00 00 84
[   51.328226] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: DPCD: 14 1e c4 81 01 1d 01 c4 6a 3f 04 0=
0 00 00 84
[   51.328979] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00500 AUX -> (ret=3D 12) 90 cc 24 53 59 4e =
41 93 22 10 09 03
[   51.328987] i915 0000:00:02.0: [drm:drm_dp_dump_desc [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: DP branch: OUI 90-cc-24 dev-ID SYNA\223" HW-r=
ev 1.0 SW-rev 9.3 quirks 0x0028
[   51.328997] i915 0000:00:02.0: [drm:mst_topology_add_connector [i915]] [=
CONNECTOR:328:DP-7] DSC HBLANK expansion quirk detected
[   51.329109] i915 0000:00:02.0: [drm:drm_sysfs_connector_add] [CONNECTOR:=
328:DP-7] adding connector to sysfs
[   51.329153] i915 0000:00:02.0: [drm:drm_dp_mst_connector_late_register [=
drm_display_helper]] registering DPMST remote bus for card1-DP-7
[   51.329226] i915 0000:00:02.0: [drm:drm_sysfs_connector_hotplug_event] [=
CONNECTOR:328:DP-7] generating connector hotplug event
[   51.329234] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_port [drm_di=
splay_helper]] port 00000000301cacad (1)
[   51.329246] i915 0000:00:02.0: [drm:drm_dp_mst_add_port [drm_display_hel=
per]] mstb 00000000e6773186 (5)
[   51.329254] i915 0000:00:02.0: [drm:drm_dp_send_link_address [drm_displa=
y_helper]] port 00000000b206c260 (2)
[   51.329265] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] txmsg cur_offset=3D0 cur_len=3D2 seqno=3D0 state=3DQUEUED p=
ath_msg=3D1 dst=3D00
[   51.329275] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 	type=3DENUM_PATH_RESOURCES contents:
[   51.329283] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 		port=3D3
[   51.330029] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x01000 AUX <- (ret=3D  6) 10 43 c7 10 30 46
[   51.331922] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.332213] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.332445] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] got hpd i=
rq on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.333363] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.333775] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.333795] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   51.334812] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 10 47 c0 10 31 0a =
00 0a 00 a9 00 00 00 00 00 00
[   51.334841] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 00000000e6773186 (3)
[   51.334871] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 00000000e6773186 (2)
[   51.334876] i915 0000:00:02.0: [drm:drm_dp_send_enum_path_resources [drm=
_display_helper]] enum path resources 3: 2560 2560
[   51.334892] i915 0000:00:02.0: [drm:drm_dp_port_set_pdt [drm_display_hel=
per]] port 00000000b206c260 (2)
[   51.334905] i915 0000:00:02.0: [drm:mst_topology_add_connector [i915]] p=
ort 00000000b206c260 (3)
[   51.335343] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   51.336032] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00500 AUX -> (ret=3D 12) 90 cc 24 53 59 4e =
41 93 22 10 09 03
[   51.336046] i915 0000:00:02.0: [drm:drm_dp_dump_desc [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: DP branch: OUI 90-cc-24 dev-ID SYNA\223" HW-r=
ev 1.0 SW-rev 9.3 quirks 0x0028
[   51.336502] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.336915] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00060 AUX -> (ret=3D  1) 03
[   51.337343] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.337363] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   51.338040] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00000 AUX -> (ret=3D 15) 12 14 c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.338803] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02200 AUX -> (ret=3D 15) 14 1e c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.338817] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: Base DPCD: 12 14 c4 81 01 1d 01 c4 6a 3f=
 04 00 00 00 84
[   51.338828] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: DPCD: 14 1e c4 81 01 1d 01 c4 6a 3f 04 0=
0 00 00 84
[   51.339597] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00000 AUX -> (ret=3D 15) 12 14 c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.340023] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.340766] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02200 AUX -> (ret=3D 15) 14 1e c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.340777] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: Base DPCD: 12 14 c4 81 01 1d 01 c4 6a 3f=
 04 00 00 00 84
[   51.340785] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: DPCD: 14 1e c4 81 01 1d 01 c4 6a 3f 04 0=
0 00 00 84
[   51.341202] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   51.341973] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00060 AUX -> (ret=3D 16) 03 21 00 14 0b 04 =
03 c0 01 17 0e e2 08 00 00 00
[   51.341984] i915 0000:00:02.0: [drm:intel_dp_get_dsc_sink_cap [i915]] DS=
C DPCD: 03 21 00 14 0b 04 03 c0 01 17 0e e2 08 00 00 00
[   51.342437] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.342884] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00090 AUX -> (ret=3D  1) ff
[   51.342893] i915 0000:00:02.0: [drm:mst_topology_add_connector [i915]] F=
EC CAPABILITY: ff
[   51.343292] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.343309] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 00
[   51.344039] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00000 AUX -> (ret=3D 15) 12 14 c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.344799] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02200 AUX -> (ret=3D 15) 14 1e c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.344807] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: Base DPCD: 12 14 c4 81 01 1d 01 c4 6a 3f=
 04 00 00 00 84
[   51.344816] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: DPCD: 14 1e c4 81 01 1d 01 c4 6a 3f 04 0=
0 00 00 84
[   51.345567] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00500 AUX -> (ret=3D 12) 90 cc 24 53 59 4e =
41 93 22 10 09 03
[   51.345576] i915 0000:00:02.0: [drm:drm_dp_dump_desc [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: DP branch: OUI 90-cc-24 dev-ID SYNA\223" HW-r=
ev 1.0 SW-rev 9.3 quirks 0x0028
[   51.345587] i915 0000:00:02.0: [drm:mst_topology_add_connector [i915]] [=
CONNECTOR:330:DP-8] DSC HBLANK expansion quirk detected
[   51.345697] i915 0000:00:02.0: [drm:drm_sysfs_connector_add] [CONNECTOR:=
330:DP-8] adding connector to sysfs
[   51.345799] i915 0000:00:02.0: [drm:drm_dp_mst_connector_late_register [=
drm_display_helper]] registering DPMST remote bus for card1-DP-8
[   51.345907] i915 0000:00:02.0: [drm:drm_sysfs_connector_hotplug_event] [=
CONNECTOR:330:DP-8] generating connector hotplug event
[   51.345919] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] txmsg cur_offset=3D0 cur_len=3D1 seqno=3D0 state=3DQUEUED p=
ath_msg=3D0 dst=3D00:03
[   51.345932] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 	type=3DLINK_ADDRESS
[   51.346707] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x01000 AUX <- (ret=3D  6) 21 30 02 c4 01 d5
[   51.348921] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.349145] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.349365] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] got hpd i=
rq on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.349987] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.350444] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.350461] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   51.351363] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 29 c2 01 00 =
00 00 00 00 00 00 00 00 00 00
[   51.351382] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000029fe17b5 (2)
[   51.352095] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01410 AUX -> (ret=3D 16) 00 00 00 00 00 02 =
90 c0 33 40 14 00 00 00 00 00
[   51.352866] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01420 AUX -> (ret=3D 13) 00 00 00 00 00 00 =
00 00 00 00 00 11 23
[   51.352887] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000029fe17b5 (1)
[   51.352999] i915 0000:00:02.0: [drm:drm_dp_send_link_address [drm_displa=
y_helper]] link address reply: 2
[   51.353032] i915 0000:00:02.0: [drm:drm_dp_send_link_address [drm_displa=
y_helper]] port 0: input 1, pdt: 1, pn: 0, dpcd_rev: 00, mcs: 1, ddps: 1, l=
dps 0, sdp 0/0
[   51.353045] i915 0000:00:02.0: [drm:drm_dp_send_link_address [drm_displa=
y_helper]] port 1: input 0, pdt: 3, pn: 3, dpcd_rev: 14, mcs: 0, ddps: 1, l=
dps 0, sdp 1/1
[   51.353058] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 00000000e6773186 (3)
[   51.353073] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] txmsg cur_offset=3D0 cur_len=3D15 seqno=3D0 state=3DQUEUED =
path_msg=3D0 dst=3D00
[   51.353082] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 	type=3DREMOTE_DPCD_WRITE contents:
[   51.353090] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 		port=3D3 addr=3D00030 len=3D16: 61 ce c8 d4 d4 0b a0 47 8=
0 c1 7c 84 d5 41 67 95
[   51.353362] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   51.354037] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x01000 AUX <- (ret=3D 16) 10 16 c3 21 30 00=
 30 10 61 ce c8 d4 d4 0b a0 47
[   51.354789] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x01010 AUX <- (ret=3D  9) 80 c1 7c 84 d5 41=
 67 95 a6
[   51.355266] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.355703] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.355720] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   51.356326] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.356926] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.357136] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.357279] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   51.357770] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.358213] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.358229] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   51.359083] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 10 03 ce 21 03 14 =
00 00 00 00 00 00 00 00 00 00
[   51.359101] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 00000000e6773186 (4)
[   51.359124] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 00000000e6773186 (3)
[   51.359196] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 00000000e6773186 (2)
[   51.359222] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] DPMST: 0x00030 AUX <- (ret=3D 16) 61 ce c8 d4 d4 0b a0 47 80 c1 7c 84 d=
5 41 67 95
[   51.359237] i915 0000:00:02.0: [drm:drm_dp_mst_add_port [drm_display_hel=
per]] mstb 0000000029fe17b5 (2)
[   51.359247] i915 0000:00:02.0: [drm:drm_dp_send_link_address [drm_displa=
y_helper]] port 000000007c40bb1c (2)
[   51.359258] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_port [drm_di=
splay_helper]] port 000000007c40bb1c (1)
[   51.359266] i915 0000:00:02.0: [drm:drm_dp_mst_add_port [drm_display_hel=
per]] mstb 0000000029fe17b5 (3)
[   51.359274] i915 0000:00:02.0: [drm:drm_dp_send_link_address [drm_displa=
y_helper]] port 000000007aaabdfc (2)
[   51.359283] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] txmsg cur_offset=3D0 cur_len=3D2 seqno=3D0 state=3DQUEUED p=
ath_msg=3D1 dst=3D00:03
[   51.359292] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 	type=3DENUM_PATH_RESOURCES contents:
[   51.359301] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 		port=3D3
[   51.359673] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.359876] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.360027] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   51.360845] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x01000 AUX <- (ret=3D  7) 21 30 43 c8 10 30=
 46
[   51.361330] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.361776] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.361793] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   51.362403] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.362945] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.363138] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.363280] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   51.363772] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.364207] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.364222] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   51.365070] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 47 c5 10 30 =
0a 00 0a 00 1f 00 00 00 00 00
[   51.365088] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000029fe17b5 (2)
[   51.365109] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000029fe17b5 (1)
[   51.365219] i915 0000:00:02.0: [drm:drm_dp_send_enum_path_resources [drm=
_display_helper]] enum path resources 3: 2560 2560
[   51.365525] i915 0000:00:02.0: [drm:mst_topology_add_connector [i915]] p=
ort 000000007aaabdfc (2)
[   51.365664] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000029fe17b5 (2)
[   51.365680] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] txmsg cur_offset=3D0 cur_len=3D5 seqno=3D0 state=3DQUEUED p=
ath_msg=3D0 dst=3D00:03
[   51.365692] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 	type=3DREMOTE_DPCD_READ contents:
[   51.365701] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 		port=3D3 dpcd_addr=3D00060 len=3D1
[   51.365674] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.365862] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.366022] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   51.366829] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x01000 AUX <- (ret=3D 10) 21 30 06 c3 20 30=
 00 60 01 eb
[   51.367301] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.367739] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.367754] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   51.368338] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.368932] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.369110] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.369282] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   51.369795] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.370205] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.370220] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   51.371057] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 05 c6 20 03 =
01 00 d2 00 00 00 00 00 00 00
[   51.371073] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000029fe17b5 (3)
[   51.371093] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000029fe17b5 (2)
[   51.371201] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000029fe17b5 (1)
[   51.371226] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] DPMST: 0x00060 AUX -> (ret=3D  1) 00
[   51.371240] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000029fe17b5 (2)
[   51.371252] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] txmsg cur_offset=3D0 cur_len=3D5 seqno=3D0 state=3DQUEUED p=
ath_msg=3D0 dst=3D00:03
[   51.371265] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 	type=3DREMOTE_DPCD_READ contents:
[   51.371273] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 		port=3D3 dpcd_addr=3D00090 len=3D1
[   51.371691] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.371868] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.372024] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   51.372833] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x01000 AUX <- (ret=3D 10) 21 30 06 c3 20 30=
 00 90 01 fa
[   51.373315] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.373753] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.373767] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   51.374336] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.374927] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.375095] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.375279] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   51.375775] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.376210] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.376223] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   51.377049] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 05 c6 20 03 =
01 00 d2 00 00 00 00 00 00 00
[   51.377063] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000029fe17b5 (3)
[   51.377081] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000029fe17b5 (2)
[   51.377217] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000029fe17b5 (1)
[   51.377242] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] DPMST: 0x00090 AUX -> (ret=3D  1) 00
[   51.377256] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 00000000e6773186 (3)
[   51.377268] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] txmsg cur_offset=3D0 cur_len=3D5 seqno=3D0 state=3DQUEUED p=
ath_msg=3D0 dst=3D00
[   51.377280] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 	type=3DREMOTE_DPCD_READ contents:
[   51.377288] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 		port=3D3 dpcd_addr=3D00060 len=3D1
[   51.377652] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.377814] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.378027] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   51.378827] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x01000 AUX <- (ret=3D  9) 10 06 cc 20 30 00=
 60 01 eb
[   51.379307] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.379743] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.379755] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   51.380312] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.380919] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.381064] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.381303] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   51.381751] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.382188] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.382199] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   51.383035] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 10 05 c3 20 03 01 =
03 78 00 00 00 00 00 00 00 00
[   51.383048] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 00000000e6773186 (4)
[   51.383065] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 00000000e6773186 (3)
[   51.383219] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 00000000e6773186 (2)
[   51.383243] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] DPMST: 0x00060 AUX -> (ret=3D  1) 03
[   51.383256] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 00000000e6773186 (3)
[   51.383268] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] txmsg cur_offset=3D0 cur_len=3D5 seqno=3D0 state=3DQUEUED p=
ath_msg=3D0 dst=3D00
[   51.383281] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 	type=3DREMOTE_DPCD_READ contents:
[   51.383289] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 		port=3D3 dpcd_addr=3D00000 len=3D15
[   51.383672] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.383818] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.384025] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   51.384817] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x01000 AUX <- (ret=3D  9) 10 06 cc 20 30 00=
 00 0f 49
[   51.385267] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.385691] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.385703] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   51.386197] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.386934] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.387067] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.387315] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   51.387756] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.388166] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.388178] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   51.389022] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 10 13 c1 20 03 0f =
12 14 c4 81 01 1d 03 c4 6a 3f
[   51.389034] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 00000000e6773186 (4)
[   51.389697] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.389832] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.390351] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01410 AUX -> (ret=3D  6) 04 00 00 00 84 dc
[   51.390364] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 00000000e6773186 (3)
[   51.390528] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 00000000e6773186 (2)
[   51.390552] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] DPMST: 0x00000 AUX -> (ret=3D 15) 12 14 c4 81 01 1d 03 c4 6a 3f 04 00 00=
 00 84
[   51.390569] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 00000000e6773186 (3)
[   51.390582] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] txmsg cur_offset=3D0 cur_len=3D5 seqno=3D0 state=3DQUEUED p=
ath_msg=3D0 dst=3D00
[   51.390594] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 	type=3DREMOTE_DPCD_READ contents:
[   51.390602] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 		port=3D3 dpcd_addr=3D02200 len=3D15
[   51.390835] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   51.391598] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x01000 AUX <- (ret=3D  9) 10 06 cc 20 30 22=
 00 0f a8
[   51.392160] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.392599] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.392611] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   51.393175] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.393899] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.394025] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.394309] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   51.394764] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.395190] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.395200] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   51.396029] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 10 13 c1 20 03 0f =
14 1e c4 81 01 1d 03 c4 6a 3f
[   51.396041] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 00000000e6773186 (4)
[   51.396678] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.396800] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.397018] usb 3-1.3: new full-speed USB device number 9 using xhci_hcd
[   51.397353] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01410 AUX -> (ret=3D  6) 04 00 00 00 84 f8
[   51.397366] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 00000000e6773186 (3)
[   51.397524] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 00000000e6773186 (2)
[   51.397549] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] DPMST: 0x02200 AUX -> (ret=3D 15) 14 1e c4 81 01 1d 03 c4 6a 3f 04 00 00=
 00 84
[   51.397566] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] DPMST: Base DPCD: 12 14 c4 81 01 1d 03 c4 6a 3f 04 00 00 00 84
[   51.397578] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] DPMST: DPCD: 14 1e c4 81 01 1d 03 c4 6a 3f 04 00 00 00 84
[   51.397586] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 00000000e6773186 (3)
[   51.397598] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] txmsg cur_offset=3D0 cur_len=3D5 seqno=3D0 state=3DQUEUED p=
ath_msg=3D0 dst=3D00
[   51.397610] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 	type=3DREMOTE_DPCD_READ contents:
[   51.397618] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 		port=3D3 dpcd_addr=3D00060 len=3D16
[   51.397799] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   51.398570] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x01000 AUX <- (ret=3D  9) 10 06 cc 20 30 00=
 60 10 6c
[   51.399358] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.399819] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.399831] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   51.400397] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.400955] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.401077] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.401342] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   51.401798] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.402205] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.402215] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   51.403030] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 10 14 c9 20 03 10 =
03 21 00 14 0b 04 03 00 00 17
[   51.403041] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 00000000e6773186 (4)
[   51.403676] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.403797] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.404352] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01410 AUX -> (ret=3D  7) 0e e2 08 00 00 00 =
4e
[   51.404364] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 00000000e6773186 (3)
[   51.404374] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 00000000e6773186 (3)
[   51.404393] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] DPMST: 0x00060 AUX -> (ret=3D 16) 03 21 00 14 0b 04 03 00 00 17 0e e2 08=
 00 00 00
[   51.404406] i915 0000:00:02.0: [drm:intel_dp_get_dsc_sink_cap [i915]] DS=
C DPCD: 03 21 00 14 0b 04 03 00 00 17 0e e2 08 00 00 00
[   51.404530] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 00000000e6773186 (3)
[   51.404542] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] txmsg cur_offset=3D0 cur_len=3D5 seqno=3D0 state=3DQUEUED p=
ath_msg=3D0 dst=3D00
[   51.404554] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 	type=3DREMOTE_DPCD_READ contents:
[   51.404562] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 		port=3D3 dpcd_addr=3D00090 len=3D1
[   51.404828] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   51.405598] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x01000 AUX <- (ret=3D  9) 10 06 cc 20 30 00=
 90 01 fa
[   51.406161] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.406602] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.406614] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   51.407162] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.407924] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.408045] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.408307] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   51.408752] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.409174] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.409184] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   51.410036] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 10 05 c3 20 03 01 =
ff 2b 00 00 00 00 00 00 00 00
[   51.410047] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 00000000e6773186 (4)
[   51.410063] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 00000000e6773186 (3)
[   51.410178] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 00000000e6773186 (2)
[   51.410202] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] DPMST: 0x00090 AUX -> (ret=3D  1) ff
[   51.410214] i915 0000:00:02.0: [drm:mst_topology_add_connector [i915]] F=
EC CAPABILITY: ff
[   51.410336] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 00000000e6773186 (3)
[   51.410349] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] txmsg cur_offset=3D0 cur_len=3D5 seqno=3D0 state=3DQUEUED p=
ath_msg=3D0 dst=3D00
[   51.410360] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 	type=3DREMOTE_DPCD_READ contents:
[   51.410368] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 		port=3D3 dpcd_addr=3D00000 len=3D15
[   51.410686] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.410806] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.411357] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   51.412024] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x01000 AUX <- (ret=3D  9) 10 06 cc 20 30 00=
 00 0f 49
[   51.412635] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.413045] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.413057] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 20
[   51.413935] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.414054] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.414612] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 10 13 c1 20 03 0f =
12 14 c4 81 01 1d 03 c4 6a 3f
[   51.414624] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 00000000e6773186 (4)
[   51.415351] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01410 AUX -> (ret=3D  6) 04 00 00 00 84 dc
[   51.415363] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 00000000e6773186 (3)
[   51.415527] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 00000000e6773186 (2)
[   51.415552] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] DPMST: 0x00000 AUX -> (ret=3D 15) 12 14 c4 81 01 1d 03 c4 6a 3f 04 00 00=
 00 84
[   51.415569] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 00000000e6773186 (3)
[   51.415581] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] txmsg cur_offset=3D0 cur_len=3D5 seqno=3D0 state=3DQUEUED p=
ath_msg=3D0 dst=3D00
[   51.415593] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 	type=3DREMOTE_DPCD_READ contents:
[   51.415601] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 		port=3D3 dpcd_addr=3D02200 len=3D15
[   51.415817] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.416580] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x01000 AUX <- (ret=3D  9) 10 06 cc 20 30 22=
 00 0f a8
[   51.417174] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 20
[   51.417628] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.418035] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.418046] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   51.418942] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.419062] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.419613] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 10 13 c1 20 03 0f =
14 1e c4 81 01 1d 03 c4 6a 3f
[   51.419625] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 00000000e6773186 (4)
[   51.420352] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01410 AUX -> (ret=3D  6) 04 00 00 00 84 f8
[   51.420364] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 00000000e6773186 (3)
[   51.420392] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 00000000e6773186 (2)
[   51.420411] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] DPMST: 0x02200 AUX -> (ret=3D 15) 14 1e c4 81 01 1d 03 c4 6a 3f 04 00 00=
 00 84
[   51.420424] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] DPMST: Base DPCD: 12 14 c4 81 01 1d 03 c4 6a 3f 04 00 00 00 84
[   51.420436] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] DPMST: DPCD: 14 1e c4 81 01 1d 03 c4 6a 3f 04 00 00 00 84
[   51.420443] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 00000000e6773186 (3)
[   51.420455] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] txmsg cur_offset=3D0 cur_len=3D5 seqno=3D0 state=3DQUEUED p=
ath_msg=3D0 dst=3D00
[   51.420466] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 	type=3DREMOTE_DPCD_READ contents:
[   51.420475] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 		port=3D3 dpcd_addr=3D00500 len=3D12
[   51.420836] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   51.421647] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.421767] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.422356] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x01000 AUX <- (ret=3D  9) 10 06 cc 20 30 05=
 00 0c 13
[   51.422967] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.423408] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.423421] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   51.423976] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.424430] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   51.424936] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.425056] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.425276] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.425722] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.425732] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   51.426578] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 10 10 ce 20 03 0c =
90 cc 24 53 59 4e 41 93 22 10
[   51.426590] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 00000000e6773186 (4)
[   51.427031] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01410 AUX -> (ret=3D  3) 09 03 96
[   51.427043] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 00000000e6773186 (3)
[   51.427204] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 00000000e6773186 (2)
[   51.427228] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] DPMST: 0x00500 AUX -> (ret=3D 12) 90 cc 24 53 59 4e 41 93 22 10 09 03
[   51.427242] i915 0000:00:02.0: [drm:drm_dp_dump_desc [drm_display_helper=
]] DPMST: DP branch: OUI 90-cc-24 dev-ID SYNA\223" HW-rev 1.0 SW-rev 9.3 qu=
irks 0x0028
[   51.427253] i915 0000:00:02.0: [drm:mst_topology_add_connector [i915]] [=
CONNECTOR:332:DP-9] DSC HBLANK expansion quirk detected
[   51.427382] i915 0000:00:02.0: [drm:drm_sysfs_connector_add] [CONNECTOR:=
332:DP-9] adding connector to sysfs
[   51.427458] i915 0000:00:02.0: [drm:drm_dp_mst_connector_late_register [=
drm_display_helper]] registering DPMST remote bus for card1-DP-9
[   51.427535] i915 0000:00:02.0: [drm:drm_sysfs_connector_hotplug_event] [=
CONNECTOR:332:DP-9] generating connector hotplug event
[   51.427543] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_port [drm_di=
splay_helper]] port 000000007aaabdfc (1)
[   51.427554] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_port [drm_di=
splay_helper]] port 00000000b206c260 (1)
[   51.427565] i915 0000:00:02.0: [drm:drm_dp_mst_add_port [drm_display_hel=
per]] mstb 00000000e6773186 (6)
[   51.427573] i915 0000:00:02.0: [drm:drm_dp_send_link_address [drm_displa=
y_helper]] port 00000000b77874b4 (2)
[   51.427584] i915 0000:00:02.0: [drm:mst_topology_add_connector [i915]] p=
ort 00000000b77874b4 (2)
[   51.427672] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.427792] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.428052] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   51.428815] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00500 AUX -> (ret=3D 12) 90 cc 24 53 59 4e =
41 93 22 10 09 03
[   51.428827] i915 0000:00:02.0: [drm:drm_dp_dump_desc [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: DP branch: OUI 90-cc-24 dev-ID SYNA\223" HW-r=
ev 1.0 SW-rev 9.3 quirks 0x0028
[   51.429261] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.429705] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00060 AUX -> (ret=3D  1) 03
[   51.430127] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.430137] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   51.430881] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00000 AUX -> (ret=3D 15) 12 14 c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.431287] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.432035] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02200 AUX -> (ret=3D 15) 14 1e c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.432042] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: Base DPCD: 12 14 c4 81 01 1d 01 c4 6a 3f=
 04 00 00 00 84
[   51.432053] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: DPCD: 14 1e c4 81 01 1d 01 c4 6a 3f 04 0=
0 00 00 84
[   51.432816] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00000 AUX -> (ret=3D 15) 12 14 c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.433367] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   51.434072] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02200 AUX -> (ret=3D 15) 14 1e c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.434080] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: Base DPCD: 12 14 c4 81 01 1d 01 c4 6a 3f=
 04 00 00 00 84
[   51.434087] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: DPCD: 14 1e c4 81 01 1d 01 c4 6a 3f 04 0=
0 00 00 84
[   51.434848] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00060 AUX -> (ret=3D 16) 03 21 00 14 0b 04 =
03 c0 01 17 0e e2 08 00 00 00
[   51.434856] i915 0000:00:02.0: [drm:intel_dp_get_dsc_sink_cap [i915]] DS=
C DPCD: 03 21 00 14 0b 04 03 c0 01 17 0e e2 08 00 00 00
[   51.435450] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.435886] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00090 AUX -> (ret=3D  1) ff
[   51.435895] i915 0000:00:02.0: [drm:mst_topology_add_connector [i915]] F=
EC CAPABILITY: ff
[   51.436291] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.436304] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 00
[   51.436426] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] got hpd i=
rq on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.437037] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00000 AUX -> (ret=3D 15) 12 14 c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.437800] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02200 AUX -> (ret=3D 15) 14 1e c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.437807] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: Base DPCD: 12 14 c4 81 01 1d 01 c4 6a 3f=
 04 00 00 00 84
[   51.437815] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: DPCD: 14 1e c4 81 01 1d 01 c4 6a 3f 04 0=
0 00 00 84
[   51.438372] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.439033] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00500 AUX -> (ret=3D 12) 90 cc 24 53 59 4e =
41 93 22 10 09 03
[   51.439041] i915 0000:00:02.0: [drm:drm_dp_dump_desc [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: DP branch: OUI 90-cc-24 dev-ID SYNA\223" HW-r=
ev 1.0 SW-rev 9.3 quirks 0x0028
[   51.439050] i915 0000:00:02.0: [drm:mst_topology_add_connector [i915]] [=
CONNECTOR:334:DP-10] DSC HBLANK expansion quirk detected
[   51.439151] i915 0000:00:02.0: [drm:drm_sysfs_connector_add] [CONNECTOR:=
334:DP-10] adding connector to sysfs
[   51.439176] i915 0000:00:02.0: [drm:drm_dp_mst_connector_late_register [=
drm_display_helper]] registering DPMST remote bus for card1-DP-10
[   51.439232] i915 0000:00:02.0: [drm:drm_sysfs_connector_hotplug_event] [=
CONNECTOR:334:DP-10] generating connector hotplug event
[   51.439237] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_port [drm_di=
splay_helper]] port 00000000b77874b4 (1)
[   51.439246] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 00000000e6773186 (1)
[   51.439254] i915 0000:00:02.0: [drm:drm_sysfs_hotplug_event] generating =
hotplug event
[   51.439262] i915 0000:00:02.0: [drm:drm_fb_helper_hotplug_event]=20
[   51.439266] i915 0000:00:02.0: [drm:drm_client_modeset_probe]=20
[   51.439276] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:262:eDP-1]
[   51.439283] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:2=
62:eDP-1]
[   51.439452] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.439426] i915 0000:00:02.0: [drm:intel_pps_vdd_on_unlocked [i915]] [E=
NCODER:261:DDI A/PHY A] PPS 0 turning VDD on
[   51.439464] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 00
[   51.439563] i915 0000:00:02.0: [drm:intel_pps_vdd_on_unlocked [i915]] [E=
NCODER:261:DDI A/PHY A] PPS 0 PP_STATUS: 0x80000008 PP_CONTROL: 0x0000006f
[   51.440023] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x00060 AUX -> (ret=3D 16) 00 11 00 76 0b 01 01 80 00=
 01 06 66 08 00 00 00
[   51.440031] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] DSC DPCD: 00=
 11 00 76 0b 01 01 80 00 01 06 66 08 00 00 00
[   51.440342] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x02214 AUX -> (ret=3D  1) 00
[   51.440352] i915 0000:00:02.0: [drm:intel_dp_print_rates [i915]] source =
rates: 162000, 216000, 243000, 270000, 324000, 432000, 540000, 675000, 8100=
00
[   51.440455] i915 0000:00:02.0: [drm:intel_dp_print_rates [i915]] sink ra=
tes: 162000, 216000, 243000, 270000, 324000, 432000, 540000, 810000
[   51.440556] i915 0000:00:02.0: [drm:intel_dp_print_rates [i915]] common =
rates: 162000, 216000, 243000, 270000, 324000, 432000, 540000, 810000
[   51.440660] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:262:eDP-1] Supported Monitor Refresh rate range is 40 Hz - 60 Hz
[   51.440667] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:262:eDP-1] Assigning EDID-1.4 digital sink color depth as 10 bpc.
[   51.440669] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:262:eDP-1] ELD monitor=20
[   51.440671] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:262:eDP-1] ELD size 20, SAD count 0
[   51.440676] i915 0000:00:02.0: [drm:intel_dp_set_edid [i915]] [CONNECTOR=
:262:eDP-1] VRR capable: yes
[   51.440774] i915 0000:00:02.0: [drm:intel_dp_set_edid [i915]] [CONNECTOR=
:262:eDP-1] DFP max bpc 0, max dotclock 0, TMDS clock 0-0, PCON Max FRL BW =
0Gbps
[   51.440871] i915 0000:00:02.0: [drm:intel_dp_set_edid [i915]] [CONNECTOR=
:262:eDP-1] RGB->YcbCr conversion? no, YCbCr 4:2:0 allowed? yes, YCbCr 4:4:=
4->4:2:0 conversion? no
[   51.441189] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x03000 AUX -> (ret=3D  1) 00
[   51.441415] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x00201 AUX -> (ret=3D  1) 00
[   51.441471] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:262:eDP-1] probed modes:
[   51.441475] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "3840x2400": 60 605000 3840 3888 3920 4000 2400 2403 2408=
 2520 0x48 0xa
[   51.441479] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:271:DP-1]
[   51.441483] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:2=
71:DP-1]
[   51.446056] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:271:DP-1] disconnected
[   51.446061] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:283:HDMI-A-1]
[   51.446065] i915 0000:00:02.0: [drm:intel_hdmi_detect [i915]] [CONNECTOR=
:283:HDMI-A-1]
[   51.451102] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:283:HDMI-A-1] disconnected
[   51.451106] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:289:DP-2]
[   51.451110] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:2=
89:DP-2]
[   51.451261] i915 0000:00:02.0: [drm:intel_power_well_disable [i915]] dis=
abling AUX_TC3
[   51.451490] i915 0000:00:02.0: [drm:intel_tc_port_update_mode [i915]] Po=
rt D/TC#1: TC port mode reset (disconnected -> tbt-alt)
[   51.451636] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:289:DP-2] disconnected
[   51.451639] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:298:DP-3]
[   51.451642] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:2=
98:DP-3]
[   51.451781] i915 0000:00:02.0: [drm:intel_tc_port_update_mode [i915]] Po=
rt E/TC#2: TC port mode reset (disconnected -> tbt-alt)
[   51.451919] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:298:DP-3] disconnected
[   51.451922] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:307:DP-4]
[   51.451924] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:3=
07:DP-4]
[   51.452108] i915 0000:00:02.0: [drm:intel_power_well_enable [i915]] enab=
ling AUX_TC3
[   51.453377] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0xf0000 AUX -> (ret=3D  1) 20
[   51.454061] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00000 AUX -> (ret=3D 15) 12 14 c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.454820] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02200 AUX -> (ret=3D 15) 14 1e c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.454829] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: Base DPCD: 12 14 c4 81 01 1d 01 c4 6a 3f=
 04 00 00 00 84
[   51.454840] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: DPCD: 14 1e c4 81 01 1d 01 c4 6a 3f 04 0=
0 00 00 84
[   51.455593] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xf0000 AUX -> (ret=3D  8) 20 1e 80 aa 04 00 =
01 03
[   51.455602] i915 0000:00:02.0: [drm:intel_dp_init_lttpr_and_dprx_caps [i=
915]] [CONNECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][DPRX] LTTPR common =
capabilities: 20 1e 80 aa 04 00 01 03
[   51.456152] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0xf0003 AUX <- (ret=3D  1) 55
[   51.456582] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0xf0003 AUX <- (ret=3D  1) aa
[   51.457039] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xf0020 AUX -> (ret=3D  3) 04 03 00
[   51.457047] i915 0000:00:02.0: [drm:intel_dp_init_lttpr_and_dprx_caps [i=
915]] [CONNECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][LTTPR 1] PHY capabi=
lities: 04 03 00
[   51.457924] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xf003d AUX -> (ret=3D 12) 98 4f ee 42 52 00 =
00 00 00 b1 04 09
[   51.457934] i915 0000:00:02.0: [drm:drm_dp_dump_desc [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: LTTPR 1: OUI 98-4f-ee dev-ID BR HW-rev 11.1 S=
W-rev 4.9 quirks 0x0000
[   51.458702] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00000 AUX -> (ret=3D 15) 12 14 c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.459465] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02200 AUX -> (ret=3D 15) 14 1e c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.459473] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: Base DPCD: 12 14 c4 81 01 1d 01 c4 6a 3f=
 04 00 00 00 84
[   51.459483] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: DPCD: 14 1e c4 81 01 1d 01 c4 6a 3f 04 0=
0 00 00 84
[   51.460244] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00500 AUX -> (ret=3D 12) 90 cc 24 53 59 4e =
41 93 22 10 09 03
[   51.460252] i915 0000:00:02.0: [drm:drm_dp_dump_desc [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: DP branch: OUI 90-cc-24 dev-ID SYNA\223" HW-r=
ev 1.0 SW-rev 9.3 quirks 0x0028
[   51.460708] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02210 AUX -> (ret=3D  1) fa
[   51.461139] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00200 AUX -> (ret=3D  1) 01
[   51.461904] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00080 AUX -> (ret=3D 16) 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00
[   51.461911] i915 0000:00:02.0: [drm:drm_dp_read_downstream_info [drm_dis=
play_helper]] AUX USBC3/DDI TC3/PHY TC3: DPCD DFP: 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00
[   51.462345] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00021 AUX -> (ret=3D  1) 21
[   51.462353] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [ENCODER:306=
:DDI TC3/PHY TC3] MST support: port: yes, sink: MST, modparam: yes -> enabl=
e: MST
[   51.462895] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00111 AUX -> (ret=3D  1) 07
[   51.463330] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.463767] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0023 AUX -> (ret=3D  1) cf
[   51.464201] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00070 AUX -> (ret=3D  2) 00 00
[   51.464955] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x000b0 AUX -> (ret=3D  7) 07 1c 00 00 00 00 =
00
[   51.464963] i915 0000:00:02.0: [drm:intel_psr_init_dpcd [i915]] Panel re=
play selective_update is supported by panel
[   51.465572] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x000b1 AUX -> (ret=3D  1) 1c
[   51.466338] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00060 AUX -> (ret=3D 16) 03 21 00 14 0b 04 =
03 c0 01 17 0e e2 08 00 00 00
[   51.466346] i915 0000:00:02.0: [drm:intel_dp_get_dsc_sink_cap [i915]] DS=
C DPCD: 03 21 00 14 0b 04 03 c0 01 17 0e e2 08 00 00 00
[   51.466907] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00090 AUX -> (ret=3D  1) ff
[   51.466914] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] FEC CAPABILI=
TY: ff
[   51.467435] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02214 AUX -> (ret=3D  1) 03
[   51.467445] i915 0000:00:02.0: [drm:intel_dp_print_rates [i915]] source =
rates: 162000, 216000, 243000, 270000, 324000, 432000, 540000, 675000, 8100=
00, 1000000, 2000000
[   51.467547] i915 0000:00:02.0: [drm:intel_dp_print_rates [i915]] sink ra=
tes: 162000, 270000, 540000, 810000
[   51.467644] i915 0000:00:02.0: [drm:intel_dp_print_rates [i915]] common =
rates: 162000, 270000, 540000, 810000
[   51.467742] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:307:DP-4] disconnected
[   51.467746] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:316:DP-5]
[   51.467749] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:3=
16:DP-5]
[   51.467883] i915 0000:00:02.0: [drm:intel_power_well_disable [i915]] dis=
abling AUX_TC3
[   51.468120] i915 0000:00:02.0: [drm:intel_tc_port_update_mode [i915]] Po=
rt G/TC#4: TC port mode reset (disconnected -> legacy)
[   51.473010] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:316:DP-5] disconnected
[   51.473014] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:324:DP-6]
[   51.473018] i915 0000:00:02.0: [drm:drm_dp_mst_topology_get_port_validat=
ed [drm_display_helper]] port 000000003f2314f0 (2)
[   51.473033] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_port [drm_di=
splay_helper]] port 000000003f2314f0 (1)
[   51.473042] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:324:DP-6] status updated from unknown to disconnected
[   51.473047] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:324:DP-6] disconnected
[   51.473049] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:328:DP-7]
[   51.473052] i915 0000:00:02.0: [drm:drm_dp_mst_topology_get_port_validat=
ed [drm_display_helper]] port 00000000301cacad (2)
[   51.473061] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_port [drm_di=
splay_helper]] port 00000000301cacad (1)
[   51.473069] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:328:DP-7] status updated from unknown to disconnected
[   51.473072] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:328:DP-7] disconnected
[   51.473075] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:330:DP-8]
[   51.473077] i915 0000:00:02.0: [drm:drm_dp_mst_topology_get_port_validat=
ed [drm_display_helper]] port 00000000b206c260 (2)
[   51.473085] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_port [drm_di=
splay_helper]] port 00000000b206c260 (1)
[   51.473094] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:330:DP-8] status updated from unknown to disconnected
[   51.473098] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:330:DP-8] disconnected
[   51.473101] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:332:DP-9]
[   51.473103] i915 0000:00:02.0: [drm:drm_dp_mst_topology_get_port_validat=
ed [drm_display_helper]] port 000000007aaabdfc (2)
[   51.473113] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_port [drm_di=
splay_helper]] port 000000007aaabdfc (1)
[   51.473122] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:332:DP-9] status updated from unknown to connected
[   51.473125] i915 0000:00:02.0: [drm:drm_dp_mst_topology_get_port_validat=
ed [drm_display_helper]] port 000000007aaabdfc (2)
[   51.473136] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000029fe17b5 (2)
[   51.473149] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] txmsg cur_offset=3D0 cur_len=3D8 seqno=3D0 state=3DQUEUED p=
ath_msg=3D0 dst=3D00:03
[   51.473163] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 	type=3DREMOTE_I2C_READ contents:
[   51.473173] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 		port=3D3 num_tx=3D1 id=3D80 size=3D1:
[   51.473182] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 			0: id=3D080 size=3D001 no_stop_bit=3D0 tx_delay=3D000: 00
[   51.473252] i915 0000:00:02.0: [drm:intel_power_well_enable [i915]] enab=
ling AUX_TC3
[   51.473416] i915 0000:00:02.0: [drm:drm_sysfs_hotplug_event] generating =
hotplug event
[   51.476723] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x01000 AUX <- (ret=3D 13) 21 30 09 c5 22 31=
 50 01 00 10 50 01 66
[   51.478917] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.479188] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.479414] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] got hpd i=
rq on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.480354] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.480827] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.480845] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   51.481796] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 05 c6 22 03 =
01 00 58 00 00 00 00 00 00 00
[   51.481817] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000029fe17b5 (3)
[   51.481845] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000029fe17b5 (2)
[   51.481849] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000029fe17b5 (2)
[   51.481865] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000029fe17b5 (3)
[   51.481876] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] txmsg cur_offset=3D0 cur_len=3D8 seqno=3D0 state=3DQUEUED p=
ath_msg=3D0 dst=3D00:03
[   51.481885] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 	type=3DREMOTE_I2C_READ contents:
[   51.481893] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 		port=3D3 num_tx=3D1 id=3D80 size=3D128:
[   51.481901] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 			0: id=3D080 size=3D001 no_stop_bit=3D0 tx_delay=3D000: 00
[   51.482284] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   51.483027] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x01000 AUX <- (ret=3D 13) 21 30 09 c5 22 31=
 50 01 00 10 50 80 5c
[   51.483643] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.484031] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.484052] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 20
[   51.484940] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.485152] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.485620] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 2c 8c 22 03 =
80 00 ff ff ff ff ff ff 00 15
[   51.485640] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000029fe17b5 (3)
[   51.486360] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01410 AUX -> (ret=3D 16) c3 28 33 e1 96 ca =
01 31 21 01 04 a5 3c 22 78 fa
[   51.487044] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01420 AUX -> (ret=3D 16) d1 15 a9 54 4f a6 =
26 0d 50 54 a1 08 00 81 80 80
[   51.487062] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000029fe17b5 (2)
[   51.487505] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.487954] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 20
[   51.488390] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.488822] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.488839] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 00
[   51.489022] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] got hpd i=
rq on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.489924] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.490166] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.490276] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.490713] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.490730] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   51.491619] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 2c 07 a9 40 =
d1 00 b3 00 81 00 a9 c0 81 c0
[   51.491636] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000029fe17b5 (3)
[   51.492377] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01410 AUX -> (ret=3D 16) 01 01 4d d0 00 a0 =
f0 70 3e 80 30 20 35 00 55 50
[   51.492762] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.493005] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.493362] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01420 AUX -> (ret=3D 16) 21 00 00 1a 00 00 =
00 ff 00 33 30 30 35 34 31 9a
[   51.493380] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000029fe17b5 (2)
[   51.493829] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   51.494261] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.494686] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.494702] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   51.495083] usb 6-1: new SuperSpeed Plus Gen 2x2 USB device number 2 usi=
ng xhci_hcd
[   51.495279] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.496001] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.496253] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   51.496243] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.496703] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.497118] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.497135] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   51.498032] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 2c 07 31 33 =
0a 20 20 20 20 00 00 00 fd 00
[   51.498050] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000029fe17b5 (3)
[   51.498771] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.499014] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.499335] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01410 AUX -> (ret=3D 16) 1d 3d 1f 86 36 01 =
0a 20 20 20 20 20 20 00 00 00
[   51.500033] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01420 AUX -> (ret=3D 16) fc 00 45 56 32 37 =
34 30 58 0a 20 20 20 20 20 63
[   51.500050] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000029fe17b5 (2)
[   51.500499] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   51.500942] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.501373] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.501389] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   51.501685] usb 3-1.3: New USB device found, idVendor=3D17ef, idProduct=
=3D3115, bcdDevice=3D 0.51
[   51.501691] usb 3-1.3: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D3
[   51.501693] usb 3-1.3: Product: Lenovo Dock - USB Audio
[   51.501696] usb 3-1.3: Manufacturer: Lenovo
[   51.501697] usb 3-1.3: SerialNumber: 000000000000
[   51.501961] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.502409] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   51.502927] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.503145] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.503293] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.503724] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.503740] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   51.504652] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 03 40 01 14 =
a7 00 00 00 00 00 00 00 00 00
[   51.504670] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000029fe17b5 (3)
[   51.504695] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000029fe17b5 (2)
[   51.504701] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000029fe17b5 (2)
[   51.504719] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000029fe17b5 (2)
[   51.504732] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] txmsg cur_offset=3D0 cur_len=3D8 seqno=3D0 state=3DQUEUED p=
ath_msg=3D0 dst=3D00:03
[   51.504744] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 	type=3DREMOTE_I2C_READ contents:
[   51.504754] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 		port=3D3 num_tx=3D1 id=3D80 size=3D128:
[   51.504762] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 			0: id=3D080 size=3D001 no_stop_bit=3D0 tx_delay=3D000: 80
[   51.505151] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   51.505649] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.505856] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.506497] usb 6-1: New USB device found, idVendor=3D8087, idProduct=3D=
5787, bcdDevice=3D 0.00
[   51.506503] usb 6-1: New USB device strings: Mfr=3D1, Product=3D2, Seria=
lNumber=3D0
[   51.506504] usb 6-1: Product: USB3 HUB
[   51.506505] usb 6-1: Manufacturer: Intel Corporation
[   51.507040] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x01000 AUX <- (ret=3D 13) 21 30 09 c5 22 31=
 50 01 80 10 50 80 07
[   51.507501] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.507932] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.507988] hub 6-1:1.0: USB hub found
[   51.508058] hub 6-1:1.0: 4 ports detected
[   51.507950] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   51.508941] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.509147] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.509294] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.509761] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   51.510192] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.510615] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.510631] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   51.511538] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 2c 8c 22 03 =
80 02 03 13 f1 46 10 22 04 03
[   51.511557] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000029fe17b5 (3)
[   51.511923] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.512118] input: Lenovo Lenovo Dock - USB Audio Consumer Control as /d=
evices/pci0000:00/0000:00:14.0/usb3/3-1/3-1.3/3-1.3:1.3/0003:17EF:3115.0005=
/input/input15
[   51.512141] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.512624] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01410 AUX -> (ret=3D 16) 02 01 23 09 7f 07 =
83 01 00 00 02 3a 80 18 71 38
[   51.513375] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01420 AUX -> (ret=3D 16) 2d 40 58 2c 45 00 =
55 50 21 00 00 1e a3 66 00 a7
[   51.513394] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000029fe17b5 (2)
[   51.513853] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   51.514311] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.514733] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.514749] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   51.515371] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.515924] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.516128] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.516307] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   51.516796] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.517220] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.517236] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   51.518084] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 2c 07 a0 f0 =
70 1f 80 30 20 35 00 55 50 21
[   51.518103] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000029fe17b5 (3)
[   51.518768] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.519016] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.519336] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01410 AUX -> (ret=3D 16) 00 00 1a 56 5e 00 =
a0 a0 a0 29 50 30 20 35 00 55
[   51.520049] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01420 AUX -> (ret=3D 16) 50 21 00 00 1a 00 =
00 00 00 00 00 00 00 00 00 92
[   51.520079] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000029fe17b5 (2)
[   51.520528] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   51.520960] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.521387] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.521405] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   51.522037] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.522490] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   51.522984] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.523269] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.523240] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.523712] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.523729] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   51.524669] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 2c 07 00 00 =
00 00 00 00 00 00 00 00 00 00
[   51.524689] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000029fe17b5 (3)
[   51.525467] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01410 AUX -> (ret=3D 16) 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00
[   51.525689] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.525903] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.526370] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01420 AUX -> (ret=3D 16) 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00
[   51.526388] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000029fe17b5 (2)
[   51.526849] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   51.527300] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.527720] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.527737] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   51.528338] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.528994] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.529291] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   51.529241] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.529738] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.530168] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.530185] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   51.531086] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 03 40 00 29 =
58 00 00 00 00 00 00 00 00 00
[   51.531105] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000029fe17b5 (3)
[   51.531129] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000029fe17b5 (2)
[   51.531135] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000029fe17b5 (2)
[   51.531155] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_port [drm_di=
splay_helper]] port 000000007aaabdfc (1)
[   51.531168] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:332:DP-9] Assigning EDID-1.4 digital sink color depth as 8 bpc.
[   51.531175] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:332:DP-9] ELD monitor EV2740X
[   51.531177] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:332:DP-9] ELD size 32, SAD count 1
[   51.531312] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 47 for 64 timeslots total bw 25920000 pixel clock 5=
48463
[   51.531457] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 169 for 64 timeslots total bw 25920000 pixel clock =
152736
[   51.531575] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 95 for 64 timeslots total bw 25920000 pixel clock 2=
70246
[   51.531684] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 104 for 64 timeslots total bw 25920000 pixel clock =
248389
[   51.531791] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 233 for 64 timeslots total bw 25920000 pixel clock =
111081
[   51.531742] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.531897] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 155 for 64 timeslots total bw 25920000 pixel clock =
166621
[   51.532000] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   51.531998] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 130 for 64 timeslots total bw 25920000 pixel clock =
198763
[   51.531982] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.532109] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 172 for 64 timeslots total bw 25920000 pixel clock =
150422
[   51.532210] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 301 for 64 timeslots total bw 25920000 pixel clock =
85882
[   51.532313] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 233 for 64 timeslots total bw 25920000 pixel clock =
111081
[   51.532452] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.532416] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 339 for 64 timeslots total bw 25920000 pixel clock =
76368
[   51.532534] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 630 for 64 timeslots total bw 25920000 pixel clock =
41141
[   51.532633] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 1001 for 64 timeslots total bw 25920000 pixel clock=
 25893
[   51.532725] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 889 for 64 timeslots total bw 25920000 pixel clock =
29127
[   51.532817] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 387 for 64 timeslots total bw 25920000 pixel clock =
66854
[   51.532895] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.532902] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 169 for 64 timeslots total bw 25920000 pixel clock =
152736
[   51.532911] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   51.532992] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 339 for 64 timeslots total bw 25920000 pixel clock =
76368
[   51.533092] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 339 for 64 timeslots total bw 25920000 pixel clock =
76368
[   51.533177] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 933 for 64 timeslots total bw 25920000 pixel clock =
27770
[   51.533258] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 933 for 64 timeslots total bw 25920000 pixel clock =
27770
[   51.533339] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 1001 for 64 timeslots total bw 25920000 pixel clock=
 25893
[   51.533420] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 169 for 64 timeslots total bw 25920000 pixel clock =
152584
[   51.533499] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 339 for 64 timeslots total bw 25920000 pixel clock =
76292
[   51.533538] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.533583] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 1000 for 64 timeslots total bw 25920000 pixel clock=
 25918
[   51.533668] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 339 for 64 timeslots total bw 25920000 pixel clock =
76292
[   51.533749] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 932 for 64 timeslots total bw 25920000 pixel clock =
27798
[   51.533830] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 932 for 64 timeslots total bw 25920000 pixel clock =
27798
[   51.533914] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:332:DP-9] probed modes:
[   51.533921] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "3840x2160": 60 533250 3840 3888 3920 4000 2160 2163 2168=
 2222 0x48 0x9
[   51.533925] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "3840x2160": 30 262750 3840 3888 3920 4000 2160 2163 2168=
 2191 0x40 0x9
[   51.533928] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "2560x1440": 60 241500 2560 2608 2640 2720 1440 1443 1448=
 1481 0x40 0x9
[   51.533931] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1920x1200": 60 193250 1920 2056 2256 2592 1200 1203 1209=
 1245 0x40 0x6
[   51.533934] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1920x1080": 60 148500 1920 2008 2052 2200 1080 1084 1089=
 1125 0x40 0x5
[   51.533937] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1920x1080": 60 148500 1920 2008 2052 2200 1080 1084 1089=
 1125 0x40 0x5
[   51.533940] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1920x1080": 60 148352 1920 2008 2052 2200 1080 1084 1089=
 1125 0x40 0x5
[   51.533943] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1920x1080": 30 74250 1920 2008 2052 2200 1080 1084 1089 =
1125 0x40 0x5
[   51.533945] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1920x1080": 30 74176 1920 2008 2052 2200 1080 1084 1089 =
1125 0x40 0x5
[   51.533948] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1600x1200": 60 162000 1600 1664 1856 2160 1200 1201 1204=
 1250 0x40 0x5
[   51.533951] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1680x1050": 60 146250 1680 1784 1960 2240 1050 1053 1059=
 1089 0x40 0x6
[   51.533954] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1600x900": 60 108000 1600 1624 1704 1800 900 901 904 100=
0 0x40 0x5
[   51.533957] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1280x1024": 60 108000 1280 1328 1440 1688 1024 1025 1028=
 1066 0x40 0x5
[   51.533960] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1280x800": 60 83500 1280 1352 1480 1680 800 803 809 831 =
0x40 0x6
[   51.533963] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1280x720": 60 74250 1280 1390 1430 1650 720 725 730 750 =
0x40 0x5
[   51.533966] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1280x720": 60 74250 1280 1390 1430 1650 720 725 730 750 =
0x40 0x5
[   51.533969] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1280x720": 60 74176 1280 1390 1430 1650 720 725 730 750 =
0x40 0x5
[   51.533971] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1024x768": 60 65000 1024 1048 1184 1344 768 771 777 806 =
0x40 0xa
[   51.533974] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "800x600": 60 40000 800 840 968 1056 600 601 605 628 0x40=
 0x5
[   51.533977] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "720x480": 60 27027 720 736 798 858 480 489 495 525 0x40 =
0xa
[   51.533980] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "720x480": 60 27027 720 736 798 858 480 489 495 525 0x40 =
0xa
[   51.533983] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "720x480": 60 27000 720 736 798 858 480 489 495 525 0x40 =
0xa
[   51.533985] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "720x480": 60 27000 720 736 798 858 480 489 495 525 0x40 =
0xa
[   51.533988] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "640x480": 60 25200 640 656 752 800 480 490 492 525 0x40 =
0xa
[   51.533982] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   51.533991] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "640x480": 60 25175 640 656 752 800 480 490 492 525 0x40 =
0xa
[   51.533994] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "640x480": 60 25175 640 656 752 800 480 490 492 525 0x40 =
0xa
[   51.533997] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "720x400": 70 28320 720 738 846 900 400 412 414 449 0x40 =
0x6
[   51.534001] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:334:DP-10]
[   51.534011] i915 0000:00:02.0: [drm:drm_dp_mst_topology_get_port_validat=
ed [drm_display_helper]] port 00000000b77874b4 (2)
[   51.534024] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_port [drm_di=
splay_helper]] port 00000000b77874b4 (1)
[   51.534034] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:334:DP-10] status updated from unknown to disconnected
[   51.534037] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:334:DP-10] disconnected
[   51.534040] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:262:eDP-1] enabled? yes
[   51.534045] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:271:DP-1] enabled? no
[   51.534048] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:283:HDMI-A-1] enabled? no
[   51.534051] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:289:DP-2] enabled? no
[   51.534053] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:298:DP-3] enabled? no
[   51.534055] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:307:DP-4] enabled? no
[   51.534058] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:316:DP-5] enabled? no
[   51.534060] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:324:DP-6] enabled? no
[   51.534062] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:328:DP-7] enabled? no
[   51.534064] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:330:DP-8] enabled? no
[   51.534066] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:332:DP-9] enabled? yes
[   51.534068] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:334:DP-10] enabled? no
[   51.534080] i915 0000:00:02.0: [drm:drm_client_modeset_probe] Not using =
firmware configuration
[   51.534084] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:262:eDP-1] found preferred mode: 3840x2400
[   51.534087] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:332:DP-9] found preferred mode: 3840x2160
[   51.534089] i915 0000:00:02.0: [drm:drm_client_modeset_probe] picking CR=
TCs for 3840x2400 config
[   51.534095] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CRTC:88:p=
ipe A] desired mode 3840x2400 set (0,0)
[   51.534098] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CRTC:145:=
pipe B] desired mode 3840x2160 set (0,0)
[   51.534161] i915 0000:00:02.0: [drm:intel_atomic_check [i915]] [CONNECTO=
R:332:DP-9] Limiting display bpp to 24 (EDID bpp 24, max requested bpp 36, =
max platform bpp 36)
[   51.534306] i915 0000:00:02.0: [drm:intel_dp_compute_config_limits [i915=
]] [ENCODER:306:DDI TC3/PHY TC3][CRTC:145:pipe B] DP link limits: pixel clo=
ck 533250 kHz DSC off max lanes 4 max rate 810000 max pipe_bpp 24 max link_=
bpp 24.0000
[   51.534424] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.534411] i915 0000:00:02.0: [drm:adjust_limits_for_dsc_hblank_expansi=
on_quirk [i915]] [CRTC:145:pipe B][CONNECTOR:332:DP-9] DSC needed by hblank=
 expansion quirk
[   51.534508] i915 0000:00:02.0: [drm:mst_stream_compute_config [i915]] Tr=
y DSC (fallback=3Dno, joiner=3Dno, force=3Dno)
[   51.534602] i915 0000:00:02.0: [drm:intel_dp_compute_config_limits [i915=
]] [ENCODER:306:DDI TC3/PHY TC3][CRTC:145:pipe B] DP link limits: pixel clo=
ck 533250 kHz DSC on max lanes 4 max rate 810000 max pipe_bpp 24 max link_b=
pp 24.0000
[   51.534696] i915 0000:00:02.0: [drm:mst_stream_compute_config [i915]] Tr=
ying to find VCPI slots in DSC mode
[   51.534785] i915 0000:00:02.0: [drm:mst_stream_compute_config [i915]] DS=
C Source supported min bpp 24 max bpp 24
[   51.534847] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.534873] i915 0000:00:02.0: [drm:mst_stream_compute_config [i915]] DS=
C Sink supported min bpp 24 max bpp 36
[   51.534863] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 00
[   51.534964] i915 0000:00:02.0: [drm:mst_stream_compute_config [i915]] DS=
C Sink supported compressed min bpp 8.0000 compressed max bpp 24.0000
[   51.535066] [drm:intel_dp_mtp_tu_compute_config [i915]] 8b/10b encoding =
format on mst_state 0x000000006ce17f53
[   51.535067] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] got hpd i=
rq on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.535154] i915 0000:00:02.0: [drm:intel_dp_mtp_tu_compute_config [i915=
]] Looking for slots in range min bpp 8.0000 max bpp 23.0000
[   51.535239] i915 0000:00:02.0: [drm:intel_dp_mtp_tu_compute_config [i915=
]] Trying bpp 23.0000
[   51.535325] i915 0000:00:02.0: [drm:drm_dp_atomic_find_time_slots [drm_d=
isplay_helper]] port 000000007aaabdfc (3)
[   51.535336] i915 0000:00:02.0: [drm:intel_dp_mtp_tu_compute_config [i915=
]] Got 32 slots for pipe bpp 23.0000 dsc 1
[   51.535423] i915 0000:00:02.0: [drm:intel_dp_dsc_compute_config [i915]] =
DP DSC computed with Input Bpp =3D 24 Compressed Bpp =3D 23.0000 Slice Coun=
t =3D 2
[   51.535524] i915 0000:00:02.0: [drm:intel_dp_tunnel_atomic_compute_strea=
m_bw [i915]] [DPTUN 1:1:13][CONNECTOR:332:DP-9][ENCODER:306:DDI TC3/PHY TC3=
][CRTC:145:pipe B] Stream 1 required BW 12265 Mb/s
[   51.535605] i915 0000:00:02.0: [drm:drm_dp_tunnel_atomic_set_stream_bw [=
drm_display_helper]] [DPTUN 1:1:13][AUX USBC3/DDI TC3/PHY TC3] Setting 1226=
5 Mb/s for stream 1
[   51.535624] i915 0000:00:02.0: [drm:intel_atomic_check [i915]] [CRTC:145=
:pipe B] hw max bpp: 24, pipe bpp: 24, dithering: 0
[   51.535691] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.535766] i915 0000:00:02.0: [drm:drm_dp_tunnel_atomic_check_stream_bw=
s [drm_display_helper]] [DPTUN 1:1:13][AUX USBC3/DDI TC3/PHY TC3] Required =
12265/26000 Mb/s total for tunnel.
[   51.535778] i915 0000:00:02.0: [drm:drm_dp_tunnel_atomic_check_stream_bw=
s [drm_display_helper]] [DPTUN 1:1:*] Required 12500/103500 Mb/s total for =
tunnel group.
[   51.535788] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in hw.enable (expected no, foun=
d yes)
[   51.535925] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in hw.active (expected no, foun=
d yes)
[   51.536110] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.536059] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in cpu_transcoder (expected -1,=
 found 1)
[   51.536126] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 00
[   51.536182] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in mst_master_transcoder (expec=
ted -1, found 1)
[   51.536321] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in lane_count (expected 0, foun=
d 4)
[   51.536444] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in dp_m_n (expected tu 0 data 0=
/0 link 0/0, found tu 32, data 4082541/8388608 link 345156/524288)
[   51.536562] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in output_types (expected 0x000=
00000, found 0x00000800)
[   51.536677] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in framestart_delay (expected 0=
, found 1)
[   51.536792] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in hw.pipe_mode.crtc_hdisplay (=
expected 0, found 3840)
[   51.536905] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in hw.pipe_mode.crtc_htotal (ex=
pected 0, found 4000)
[   51.537023] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in hw.pipe_mode.crtc_hblank_sta=
rt (expected 0, found 3840)
[   51.537135] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in hw.pipe_mode.crtc_hblank_end=
 (expected 0, found 4000)
[   51.537248] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in hw.pipe_mode.crtc_hsync_star=
t (expected 0, found 3888)
[   51.537361] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in hw.pipe_mode.crtc_hsync_end =
(expected 0, found 3920)
[   51.537473] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in hw.pipe_mode.crtc_vdisplay (=
expected 0, found 2160)
[   51.537585] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in hw.pipe_mode.crtc_vblank_sta=
rt (expected 0, found 2161)
[   51.537700] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in hw.pipe_mode.crtc_vsync_star=
t (expected 0, found 2163)
[   51.537814] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in hw.pipe_mode.crtc_vsync_end =
(expected 0, found 2168)
[   51.537928] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in hw.pipe_mode.crtc_vtotal (ex=
pected 0, found 2222)
[   51.538045] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in hw.pipe_mode.crtc_vblank_end=
 (expected 0, found 2222)
[   51.538157] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in hw.adjusted_mode.crtc_hdispl=
ay (expected 0, found 3840)
[   51.538268] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in hw.adjusted_mode.crtc_htotal=
 (expected 0, found 4000)
[   51.538379] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in hw.adjusted_mode.crtc_hblank=
_start (expected 0, found 3840)
[   51.538489] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in hw.adjusted_mode.crtc_hblank=
_end (expected 0, found 4000)
[   51.538599] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in hw.adjusted_mode.crtc_hsync_=
start (expected 0, found 3888)
[   51.538708] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in hw.adjusted_mode.crtc_hsync_=
end (expected 0, found 3920)
[   51.538816] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in hw.adjusted_mode.crtc_vdispl=
ay (expected 0, found 2160)
[   51.538925] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in hw.adjusted_mode.crtc_vblank=
_start (expected 0, found 2161)
[   51.539038] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in hw.adjusted_mode.crtc_vsync_=
start (expected 0, found 2163)
[   51.539146] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in hw.adjusted_mode.crtc_vsync_=
end (expected 0, found 2168)
[   51.539254] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in hw.adjusted_mode.crtc_vtotal=
 (expected 0, found 2222)
[   51.539368] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in hw.adjusted_mode.crtc_vblank=
_end (expected 0, found 2222)
[   51.539478] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in pixel_multiplier (expected 0=
, found 1)
[   51.539602] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in hw.adjusted_mode.flags (1) (=
expected 0, found 1)
[   51.539732] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in hw.adjusted_mode.flags (8) (=
expected 0, found 8)
[   51.539840] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in fec_enable (expected no, fou=
nd yes)
[   51.539947] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in dpll_hw_state.cx0pll C20
[   51.540061] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] ex=
pected:
[   51.540168] i915 0000:00:02.0: [drm:intel_cx0pll_dump_hw_state [i915]] c=
20pll_hw_state:
[   51.540281] i915 0000:00:02.0: [drm:intel_cx0pll_dump_hw_state [i915]] t=
x[0] =3D 0x0000, tx[1] =3D 0x0000, tx[2] =3D 0x0000
[   51.540391] i915 0000:00:02.0: [drm:intel_cx0pll_dump_hw_state [i915]] c=
mn[0] =3D 0x0000, cmn[1] =3D 0x0000, cmn[2] =3D 0x0000, cmn[3] =3D 0x0000
[   51.540497] i915 0000:00:02.0: [drm:intel_cx0pll_dump_hw_state [i915]] m=
plla[0] =3D 0x0000
[   51.540602] i915 0000:00:02.0: [drm:intel_cx0pll_dump_hw_state [i915]] m=
plla[1] =3D 0x0000
[   51.540705] i915 0000:00:02.0: [drm:intel_cx0pll_dump_hw_state [i915]] m=
plla[2] =3D 0x0000
[   51.540806] i915 0000:00:02.0: [drm:intel_cx0pll_dump_hw_state [i915]] m=
plla[3] =3D 0x0000
[   51.540905] i915 0000:00:02.0: [drm:intel_cx0pll_dump_hw_state [i915]] m=
plla[4] =3D 0x0000
[   51.541002] i915 0000:00:02.0: [drm:intel_cx0pll_dump_hw_state [i915]] m=
plla[5] =3D 0x0000
[   51.541111] i915 0000:00:02.0: [drm:intel_cx0pll_dump_hw_state [i915]] m=
plla[6] =3D 0x0000
[   51.541206] i915 0000:00:02.0: [drm:intel_cx0pll_dump_hw_state [i915]] m=
plla[7] =3D 0x0000
[   51.541299] i915 0000:00:02.0: [drm:intel_cx0pll_dump_hw_state [i915]] m=
plla[8] =3D 0x0000
[   51.541391] i915 0000:00:02.0: [drm:intel_cx0pll_dump_hw_state [i915]] m=
plla[9] =3D 0x0000
[   51.541483] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] fo=
und:
[   51.541618] i915 0000:00:02.0: [drm:intel_cx0pll_dump_hw_state [i915]] c=
20pll_hw_state:
[   51.541719] i915 0000:00:02.0: [drm:intel_cx0pll_dump_hw_state [i915]] t=
x[0] =3D 0xbe88, tx[1] =3D 0x4800, tx[2] =3D 0x0000
[   51.541818] i915 0000:00:02.0: [drm:intel_cx0pll_dump_hw_state [i915]] c=
mn[0] =3D 0x0500, cmn[1] =3D 0x0005, cmn[2] =3D 0x0000, cmn[3] =3D 0x0000
[   51.541912] i915 0000:00:02.0: [drm:intel_cx0pll_dump_hw_state [i915]] m=
pllb[0] =3D 0x10d2
[   51.542013] i915 0000:00:02.0: [drm:intel_cx0pll_dump_hw_state [i915]] m=
pllb[1] =3D 0x2108
[   51.542106] i915 0000:00:02.0: [drm:intel_cx0pll_dump_hw_state [i915]] m=
pllb[2] =3D 0x8d98
[   51.542199] i915 0000:00:02.0: [drm:intel_cx0pll_dump_hw_state [i915]] m=
pllb[3] =3D 0xbfc1
[   51.542291] i915 0000:00:02.0: [drm:intel_cx0pll_dump_hw_state [i915]] m=
pllb[4] =3D 0x7166
[   51.542386] i915 0000:00:02.0: [drm:intel_cx0pll_dump_hw_state [i915]] m=
pllb[5] =3D 0x5f42
[   51.542477] i915 0000:00:02.0: [drm:intel_cx0pll_dump_hw_state [i915]] m=
pllb[6] =3D 0x2000
[   51.542569] i915 0000:00:02.0: [drm:intel_cx0pll_dump_hw_state [i915]] m=
pllb[7] =3D 0x0001
[   51.542662] i915 0000:00:02.0: [drm:intel_cx0pll_dump_hw_state [i915]] m=
pllb[8] =3D 0x7800
[   51.542755] i915 0000:00:02.0: [drm:intel_cx0pll_dump_hw_state [i915]] m=
pllb[9] =3D 0x0000
[   51.542850] i915 0000:00:02.0: [drm:intel_cx0pll_dump_hw_state [i915]] m=
pllb[10] =3D 0x0000
[   51.542960] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in pipe_bpp (expected 0, found =
24)
[   51.543130] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in hw.pipe_mode.crtc_clock (exp=
ected 0, found 533250)
[   51.543281] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in hw.adjusted_mode.crtc_clock =
(expected 0, found 533250)
[   51.543406] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in port_clock (expected 0, foun=
d 810000)
[   51.543527] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in min_voltage_level (expected =
0, found 1)
[   51.543644] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in dsc.config.block_pred_enable=
 (expected no, found yes)
[   51.543758] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in dsc.config.convert_rgb (expe=
cted no, found yes)
[   51.543871] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in dsc.config.line_buf_depth (e=
xpected 0, found 13)
[   51.543984] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in dsc.config.bits_per_componen=
t (expected 0, found 8)
[   51.544103] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in dsc.config.pic_width (expect=
ed 0, found 3840)
[   51.544213] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in dsc.config.pic_height (expec=
ted 0, found 2160)
[   51.544321] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in dsc.config.slice_width (expe=
cted 0, found 1920)
[   51.544429] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in dsc.config.slice_height (exp=
ected 0, found 108)
[   51.544535] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in dsc.config.initial_dec_delay=
 (expected 0, found 351)
[   51.544647] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in dsc.config.initial_xmit_dela=
y (expected 0, found 179)
[   51.544756] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in dsc.config.scale_decrement_i=
nterval (expected 0, found 320)
[   51.544864] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in dsc.config.scale_increment_i=
nterval (expected 0, found 5090)
[   51.544969] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in dsc.config.initial_scale_val=
ue (expected 0, found 10)
[   51.545081] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in dsc.config.first_line_bpg_of=
fset (expected 0, found 3)
[   51.545186] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in dsc.config.flatness_min_qp (=
expected 0, found 3)
[   51.545288] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in dsc.config.flatness_max_qp (=
expected 0, found 12)
[   51.545390] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in dsc.config.slice_bpg_offset =
(expected 0, found 190)
[   51.545491] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in dsc.config.nfl_bpg_offset (e=
xpected 0, found 58)
[   51.545592] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in dsc.config.initial_offset (e=
xpected 0, found 2048)
[   51.545693] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in dsc.config.final_offset (exp=
ected 0, found 4315)
[   51.545798] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in dsc.config.rc_model_size (ex=
pected 0, found 8192)
[   51.545905] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in dsc.config.rc_quant_incr_lim=
it0 (expected 0, found 11)
[   51.546012] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in dsc.config.rc_quant_incr_lim=
it1 (expected 0, found 11)
[   51.546111] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in dsc.config.slice_chunk_size =
(expected 0, found 5520)
[   51.546209] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in dsc.compression_enable (expe=
cted no, found yes)
[   51.546318] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in dsc.num_streams (expected 0,=
 found 2)
[   51.546436] i915 0000:00:02.0: [drm:intel_pipe_config_compare [i915]] [C=
RTC:145:pipe B] fastset requirement not met in dsc.compressed_bpp_x16 (expe=
cted 0, found 368)
[   51.546536] i915 0000:00:02.0: [drm:intel_atomic_check [i915]] [CRTC:145=
:pipe B] fastset requirement not met, forcing full modeset
[   51.546674] i915 0000:00:02.0: [drm:skl_compute_wm [i915]] Enabled dbuf =
slices 0xf -> 0xf (total dbuf slices 0xf), mbus joined? yes->no
[   51.546788] i915 0000:00:02.0: [drm:skl_compute_wm [i915]] [CRTC:88:pipe=
 A] dbuf slices 0xf -> 0x3, ddb (0 - 4096) -> (0 - 2048), active pipes 0x1 =
-> 0x3
[   51.546896] i915 0000:00:02.0: [drm:skl_compute_wm [i915]] [CRTC:145:pip=
e B] dbuf slices 0x0 -> 0xc, ddb (0 - 0) -> (0 - 2048), active pipes 0x1 ->=
 0x3
[   51.547008] i915 0000:00:02.0: [drm:skl_compute_wm [i915]] [PLANE:33:pla=
ne 1A] ddb (   0 - 4014) -> (   0 - 1966), size 4014 -> 1966
[   51.547113] i915 0000:00:02.0: [drm:skl_compute_wm [i915]] [PLANE:83:cur=
sor A] ddb (4014 - 4096) -> (1966 - 2048), size   82 ->   82
[   51.547215] i915 0000:00:02.0: [drm:skl_compute_wm [i915]] [PLANE:90:pla=
ne 1B] ddb (   0 -    0) -> (   0 - 1976), size    0 -> 1976
[   51.547316] i915 0000:00:02.0: [drm:skl_compute_wm [i915]] [PLANE:140:cu=
rsor B] ddb (   0 -    0) -> (1976 - 2048), size    0 ->   72
[   51.547437] i915 0000:00:02.0: [drm:skl_print_plane_changes [i915]] [PLA=
NE:90:plane 1B]   level  wm0, wm1, wm2, wm3, wm4, wm5, wm6, wm7, twm, swm, =
stwm -> *wm0,*wm1,*wm2,*wm3,*wm4,*wm5, wm6, wm7,*twm,*swm,*stwm
[   51.547553] i915 0000:00:02.0: [drm:skl_print_plane_changes [i915]] [PLA=
NE:90:plane 1B]   lines    0,   0,   0,   0,   0,   0,   0,   0,   0,   0, =
   0 ->    1,  12,  12,  14,  14,  21,   0,   0,   0,   3,    0
[   51.547650] i915 0000:00:02.0: [drm:skl_print_plane_changes [i915]] [PLA=
NE:90:plane 1B]  blocks    0,   0,   0,   0,   0,   0,   0,   0,   0,   0, =
   0 ->   32, 373, 373, 435, 435, 652,   0,   0,  46,  94,  108
[   51.547743] i915 0000:00:02.0: [drm:skl_print_plane_changes [i915]] [PLA=
NE:90:plane 1B] min_ddb    0,   0,   0,   0,   0,   0,   0,   0,   0,   0, =
   0 ->   37, 412, 412, 480, 480, 719,   0,   0,  47, 105,  109
[   51.547840] i915 0000:00:02.0: [drm:intel_bw_atomic_check [i915]] [CRTC:=
145:pipe B] data rate 2133000 num active planes 1
[   51.547964] i915 0000:00:02.0: [drm:intel_bw_atomic_check [i915]] QGV po=
int 0: max bw 28913 required 4781 qgv_peak_bw: 51200
[   51.548087] i915 0000:00:02.0: [drm:intel_bw_atomic_check [i915]] QGV po=
int 1: max bw 36260 required 4781 qgv_peak_bw: 51200
[   51.548200] i915 0000:00:02.0: [drm:intel_bw_atomic_check [i915]] QGV po=
int 2: max bw 38000 required 4781 qgv_peak_bw: 51200
[   51.548316] i915 0000:00:02.0: [drm:intel_bw_atomic_check [i915]] QGV po=
int 3: max bw 38000 required 4781 qgv_peak_bw: 51200
[   51.548425] i915 0000:00:02.0: [drm:intel_bw_atomic_check [i915]] Matchi=
ng peaks QGV bw: 51200 for required data rate: 4781
[   51.548534] i915 0000:00:02.0: [drm:intel_plane_calc_min_cdclk [i915]] [=
PLANE:90:plane 1B] min cdclk (266625 kHz) > [CRTC:145:pipe B] min cdclk (0 =
kHz)
[   51.548676] i915 0000:00:02.0: [drm:intel_bw_calc_min_cdclk [i915]] new =
bandwidth min cdclk (75625 kHz) > old min cdclk (47266 kHz)
[   51.548817] i915 0000:00:02.0: [drm:intel_modeset_calc_cdclk [i915]] New=
 cdclk calculated to be logical 307200 kHz, actual 307200 kHz
[   51.548932] i915 0000:00:02.0: [drm:intel_modeset_calc_cdclk [i915]] New=
 voltage level calculated to be logical 1, actual 1
[   51.549058] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [CRTC:=
145:pipe B] enable: yes [modeset]
[   51.549176] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] active=
: yes, output_types: DP_MST (0x800), output format: RGB, sink format: RGB
[   51.549291] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] cpu_tr=
anscoder: B, pipe bpp: 24, dithering: 0
[   51.549404] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] MST ma=
ster transcoder: B
[   51.549515] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] port s=
ync: master transcoder: <invalid>, slave transcoder bitmask =3D 0x0
[   51.549626] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] joiner=
: no, pipes: 0x0
[   51.549748] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] splitt=
er: disabled, link count 0, overlap 0
[   51.549866] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] dp m_n=
: lanes: 4; data_m: 4082541, data_n: 8388608, link_m: 345156, link_n: 52428=
8, tu: 32
[   51.549970] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] dp m2_=
n2: lanes: 4; data_m: 0, data_n: 0, link_m: 0, link_n: 0, tu: 0
[   51.550081] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] fec: e=
nabled, enhanced framing: disabled
[   51.550187] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] sdp sp=
lit: disabled
[   51.550290] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] psr: d=
isabled, selective update: enabled, panel replay: enabled, selective fetch:=
 enabled
[   51.550393] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] minimu=
m HBlank: 0
[   51.550496] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] audio:=
 1, infoframes: 0, infoframes enabled: 0x0
[   51.550599] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] ELD: 1=
0 00 07 00 67 14 00 01 00 00 00 00 00 00 00 00
[   51.550707] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] ELD: 1=
5 c3 28 33 45 56 32 37 34 30 58 09 7f 07 00 00
[   51.550813] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] scanli=
ne offset: 1
[   51.550919] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] vblank=
 delay: 1, framestart delay: 1, MSA timing delay: 0
[   51.551026] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] vrr: n=
o, fixed rr: yes, vmin: 2222, vmax: 2222, flipline: 2222, pipeline full: 0,=
 guardband: 61 vsync start: 59, vsync end: 54
[   51.551143] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] vrr: v=
min vblank: 2161, vmax vblank: 2161, vmin vtotal: 2222, vmax vtotal: 2222
[   51.551247] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] reques=
ted mode: "3840x2160": 60 533250 3840 3888 3920 4000 2160 2163 2168 2222 0x=
48 0x9
[   51.551351] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] adjust=
ed mode: "3840x2160": 60 533250 3840 3888 3920 4000 2160 2163 2168 2222 0x4=
8 0x9
[   51.551452] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] crtc t=
imings: clock=3D533250, hd=3D3840 hb=3D3840-4000 hs=3D3888-3920 ht=3D4000, =
vd=3D2160 vb=3D2161-2222 vs=3D2163-2168 vt=3D2222, flags=3D0x9
[   51.551554] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] pipe m=
ode: "3840x2160": 60 533250 3840 3888 3920 4000 2160 2163 2168 2222 0x40 0x9
[   51.551650] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] crtc t=
imings: clock=3D533250, hd=3D3840 hb=3D3840-4000 hs=3D3888-3920 ht=3D4000, =
vd=3D2160 vb=3D2161-2222 vs=3D2163-2168 vt=3D2222, flags=3D0x9
[   51.551746] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] port c=
lock: 810000, pipe src: 3840x2160+0+0, pixel rate 533250
[   51.551844] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] lineti=
me: 61, ips linetime: 0
[   51.551943] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] num_sc=
alers: 2, scaler_users: 0x0, scaler_id: -1, scaling_filter: 0
[   51.552072] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] pch pf=
it: 0x0+0+0, disabled, force thru: no
[   51.552192] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] ips: 0=
, double wide: 0, drrs: 0
[   51.552293] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] dpll_h=
w_state: dpll: 0xc5c10, dpll_md: 0x4800be88, fp0: 0x5000000, fp1: 0x5
[   51.552387] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] csc_mo=
de: 0x0 gamma_mode: 0x0 gamma_enable: 0 csc_enable: 0
[   51.552479] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] pre cs=
c lut: 0 entries, post csc lut: 0 entries
[   51.552571] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] output=
 csc: pre offsets: 0x0000 0x0000 0x0000
[   51.552666] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] output=
 csc: coefficients: 0x0000 0x0000 0x0000
[   51.552761] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] output=
 csc: coefficients: 0x0000 0x0000 0x0000
[   51.552858] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] output=
 csc: coefficients: 0x0000 0x0000 0x0000
[   51.552954] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] output=
 csc: post offsets: 0x0000 0x0000 0x0000
[   51.553054] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] pipe c=
sc: pre offsets: 0x0000 0x0000 0x0000
[   51.553148] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] pipe c=
sc: coefficients: 0x0000 0x0000 0x0000
[   51.553255] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] pipe c=
sc: coefficients: 0x0000 0x0000 0x0000
[   51.553365] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] pipe c=
sc: coefficients: 0x0000 0x0000 0x0000
[   51.553471] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] pipe c=
sc: post offsets: 0x0000 0x0000 0x0000
[   51.553558] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] dsc-ds=
s: compressed-bpp:23.0000, slice-count: 2, num_streams: 2
[   51.553645] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] dsc-cf=
g: version: 1.2, picture: w=3D3840, h=3D2160, slice: count=3D0, w=3D1920, h=
=3D108, size=3D5520
[   51.553735] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] dsc-cf=
g: mode: block-pred=3Dyes, vbr=3Dno, rgb=3Dyes, simple-422=3Dno, native-422=
=3Dno, native-420=3Dno
[   51.553825] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] dsc-cf=
g: color-depth: uncompressed-bpc=3D8, compressed-bpp=3D23.0000 line-buf-bpp=
=3D13
[   51.553913] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] dsc-cf=
g: rc-model: size=3D8192, bits=3D12190, mux-word-size: 48, initial-delays: =
xmit=3D179, dec=3D351
[   51.554001] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] dsc-cf=
g: offsets: initial=3D2048, final=3D4315, slice-bpg=3D190
[   51.554098] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] dsc-cf=
g: line-bpg-offsets: first=3D3, non-first=3D58, second=3D0, non-second=3D0,=
 second-adj=3D0
[   51.554191] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] dsc-cf=
g: rc-tgt-offsets: low=3D0, high=3D0, rc-edge-factor: 0, rc-quant-incr-limi=
ts: [0]=3D11, [1]=3D11
[   51.554284] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] dsc-cf=
g: initial-scale: 10, scale-intervals: increment=3D5090, decrement=3D320
[   51.554370] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] dsc-cf=
g: flatness: min-qp=3D3, max-qp=3D12
[   51.554454] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] dsc-cf=
g: rc-level:         0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13,=
 14
[   51.554538] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] dsc-cf=
g: rc-buf-thresh:   14, 28, 42, 56, 70, 84, 98,105,112,119,121,123,125,126
[   51.554622] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] dsc-cf=
g: rc-min-qp:        0,  0,  0,  0,  1,  1,  2,  2,  2,  3,  4,  4,  5,  7,=
  8
[   51.554707] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] dsc-cf=
g: rc-max-qp:        0,  1,  2,  3,  3,  4,  4,  5,  5,  6,  6,  7,  7,  8,=
  9
[   51.554792] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] dsc-cf=
g: rc-bpg-offset:   10,  8,  6,  4,  2,  0, 62, 60, 58, 56, 54, 54, 52, 52,=
 52
[   51.554876] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [PLANE=
:90:plane 1B] fb: [FB:325] 3840x2400 format =3D XR24 little-endian (0x34325=
258) modifier =3D 0x0, visible: yes
[   51.554964] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] 	rotat=
ion: 0x1, scaler: -1, scaling_filter: 0
[   51.555060] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] 	src: =
3840.000000x2160.000000+0.000000+0.000000 dst: 3840x2160+0+0
[   51.555150] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [PLANE=
:100:plane 2B] fb: [NOFB], visible: no
[   51.555237] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [PLANE=
:110:plane 3B] fb: [NOFB], visible: no
[   51.555322] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [PLANE=
:120:plane 4B] fb: [NOFB], visible: no
[   51.555406] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [PLANE=
:130:plane 5B] fb: [NOFB], visible: no
[   51.555488] i915 0000:00:02.0: [drm:intel_crtc_state_dump [i915]] [PLANE=
:140:cursor B] fb: [NOFB], visible: no
[   51.555594] i915 0000:00:02.0: [drm:intel_power_well_enable [i915]] enab=
ling PW_2
[   51.555742] i915 0000:00:02.0: [drm:intel_power_well_enable [i915]] enab=
ling PW_B
[   51.556310] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX <- (ret=3D  1) 03
[   51.556534] thunderbolt 0000:8a:00.0: acking DP_BW (0x20) notification o=
n 0
[   51.556557] thunderbolt 0000:8a:00.0: 0:13: handling bandwidth allocatio=
n request, retry 0
[   51.556733] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0xe0031 AUX <- (ret=3D  1) 19
[   51.556883] thunderbolt 0000:8a:00.0: 0:13: requested bandwidth 12500 Mb=
/s
[   51.557170] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.558258] thunderbolt 0000:8a:00.0: 0:13 <-> 1:12 (DP): bandwidth allo=
cated currently 0/0 Mb/s
[   51.558596] thunderbolt 0000:8a:00.0: 0:13 <-> 1:12 (DP): corrected band=
width request 0/12500 Mb/s
[   51.559432] ACPI BIOS Error (bug): AE_AML_PACKAGE_LIMIT, Index (0x000000=
011) is beyond end of object (length 0x0) (20250404/exoparg2-393)
[   51.559556] thunderbolt 0000:8a:00.0: 0:21: scaled bandwidth 220/220, sc=
ale 0
[   51.561038] ACPI Error: Aborting method \_SB.PC00.LPCB.EC.BRNS due to pr=
evious error (AE_AML_PACKAGE_LIMIT) (20250404/psparse-529)
[   51.561594] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): decreased ba=
ndwidth allocation to 900/900 Mb/s
[   51.562716] ACPI Error: Aborting method \_SB.PC00.LPCB.EC._Q26 due to pr=
evious error (AE_AML_PACKAGE_LIMIT) (20250404/psparse-529)
[   51.563199] thunderbolt 0000:8a:00.0: 0:1: link maximum bandwidth 36000/=
108000 Mb/s
[   51.564324] input: Lenovo Lenovo Dock - USB Audio as /devices/pci0000:00=
/0000:00:14.0/usb3/3-1/3-1.3/3-1.3:1.3/0003:17EF:3115.0005/input/input16
[   51.564406] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): consumed ban=
dwidth 3000/3000 Mb/s
[   51.564490] thunderbolt 0000:8a:00.0: 0:1: reserving 1500/1500 Mb/s for =
PCIe
[   51.564551] hid-generic 0003:17EF:3115.0005: input,hiddev99,hidraw4: USB=
 HID v1.11 Device [Lenovo Lenovo Dock - USB Audio] on usb-0000:00:14.0-1.3/=
input3
[   51.566062] thunderbolt 0000:8a:00.0: 1:1: link maximum bandwidth 36000/=
108000 Mb/s
[   51.566185] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): consumed ban=
dwidth 3000/3000 Mb/s
[   51.566310] thunderbolt 0000:8a:00.0: 1:1: reserving 1500/1500 Mb/s for =
PCIe
[   51.566314] thunderbolt 0000:8a:00.0: 0:13 <-> 1:12 (DP): bandwidth avai=
lable for allocation 31500/103500 (+ 0 reserved) Mb/s
[   51.568024] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): reclaiming u=
nused bandwidth
[   51.568085] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.568386] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.568624] thunderbolt 0000:8a:00.0: 0:1: link maximum bandwidth 72000/=
72000 Mb/s
[   51.568619] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] got hpd i=
rq on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.568736] thunderbolt 0000:8a:00.0: 0:1: reserving 1500/1500 Mb/s for =
PCIe
[   51.569251] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.569526] thunderbolt 0000:8a:00.0: 0:13 <-> 1:12 (DP): consumed bandw=
idth 0/12500 Mb/s
[   51.569721] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.569755] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   51.569933] thunderbolt 0000:8a:00.0: 1:1: link maximum bandwidth 72000/=
72000 Mb/s
[   51.570050] thunderbolt 0000:8a:00.0: 1:1: reserving 1500/1500 Mb/s for =
PCIe
[   51.570497] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 12
[   51.570824] thunderbolt 0000:8a:00.0: 0:13 <-> 1:12 (DP): consumed bandw=
idth 0/12500 Mb/s
[   51.570826] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): available ba=
ndwidth 70500/58000 Mb/s
[   51.570957] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   51.571377] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 12
[   51.571814] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.571839] thunderbolt 0000:8a:00.0: 0:21: scaled bandwidth 3599/3599, =
scale 0
[   51.572234] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX <- (ret=3D  1) 03
[   51.572246] i915 0000:00:02.0: [drm:drm_dp_tunnel_alloc_bw [drm_display_=
helper]] [DPTUN 1:1:13][AUX USBC3/DDI TC3/PHY TC3] Allocating 12500/26000 M=
b/s for tunnel: Group alloc:12500/103500 Mb/s (Ok)
[   51.572281] i915 0000:00:02.0: [drm:intel_pmdemand_program_params [i915]=
] initiate pmdemand request values: (0x20010b1 0x13432a72)
[   51.572495] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): increased ba=
ndwidth allocation to 14738/14738 Mb/s
[   51.572497] thunderbolt 0000:8a:00.0: 0:13 <-> 1:12 (DP): bandwidth allo=
cation changed to 0/12500 Mb/s
[   51.572499] thunderbolt 0000:8a:00.0: bandwidth consumption changed, re-=
calculating estimated bandwidth
[   51.572500] thunderbolt 0000:8a:00.0: re-calculating bandwidth estimatio=
n for group 1
[   51.572507] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:261:DDI A/PHY A]
[   51.572683] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.572640] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:270:DDI B/PHY B]
[   51.572758] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:272:DP-MST A]
[   51.572705] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 00
[   51.572874] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:273:DP-MST B]
[   51.573027] usb 3-1.2.1: new high-speed USB device number 10 using xhci_=
hcd
[   51.572985] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:274:DP-MST C]
[   51.573105] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:275:DP-MST D]
[   51.573215] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:288:DDI TC1/PHY TC1]
[   51.573368] thunderbolt 0000:8a:00.0: 0:21: scaled bandwidth 220/220, sc=
ale 0
[   51.573324] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:290:DP-MST A]
[   51.573430] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:291:DP-MST B]
[   51.573540] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:292:DP-MST C]
[   51.573656] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:293:DP-MST D]
[   51.573762] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:297:DDI TC2/PHY TC2]
[   51.573867] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:299:DP-MST A]
[   51.573971] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:300:DP-MST B]
[   51.574026] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): decreased ba=
ndwidth allocation to 900/900 Mb/s
[   51.574090] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:301:DP-MST C]
[   51.574198] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:302:DP-MST D]
[   51.574239] i915 0000:00:02.0: [drm:intel_power_well_disable [i915]] dis=
abling AUX_TC3
[   51.574304] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:306:DDI TC3/PHY TC3]
[   51.574408] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:308:DP-MST A]
[   51.574510] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:309:DP-MST B]
[   51.574647] thunderbolt 0000:8a:00.0: 0:1: link maximum bandwidth 36000/=
108000 Mb/s
[   51.574610] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:310:DP-MST C]
[   51.574710] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:311:DP-MST D]
[   51.574793] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): consumed ban=
dwidth 3000/3000 Mb/s
[   51.574809] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:315:DDI TC4/PHY TC4]
[   51.574903] thunderbolt 0000:8a:00.0: 0:1: reserving 1500/1500 Mb/s for =
PCIe
[   51.574908] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:317:DP-MST A]
[   51.575008] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:318:DP-MST B]
[   51.575105] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:319:DP-MST C]
[   51.575206] i915 0000:00:02.0: [drm:intel_modeset_verify_disabled [i915]=
] [ENCODER:320:DP-MST D]
[   51.575305] thunderbolt 0000:8a:00.0: 1:1: link maximum bandwidth 36000/=
108000 Mb/s
[   51.575306] i915 0000:00:02.0: [drm:verify_connector_state [i915]] [CONN=
ECTOR:324:DP-6]
[   51.575414] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): consumed ban=
dwidth 3000/3000 Mb/s
[   51.575406] i915 0000:00:02.0: [drm:verify_connector_state [i915]] [CONN=
ECTOR:328:DP-7]
[   51.575506] i915 0000:00:02.0: [drm:verify_connector_state [i915]] [CONN=
ECTOR:330:DP-8]
[   51.575561] thunderbolt 0000:8a:00.0: 1:1: reserving 1500/1500 Mb/s for =
PCIe
[   51.575563] thunderbolt 0000:8a:00.0: 0:13 <-> 1:12 (DP): re-calculated =
estimated bandwidth 103500 (+ 0 reserved) =3D 103500 Mb/s
[   51.575606] i915 0000:00:02.0: [drm:verify_connector_state [i915]] [CONN=
ECTOR:334:DP-10]
[   51.575945] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): reclaiming u=
nused bandwidth
[   51.576585] thunderbolt 0000:8a:00.0: 0:1: link maximum bandwidth 72000/=
72000 Mb/s
[   51.576695] thunderbolt 0000:8a:00.0: 0:1: reserving 1500/1500 Mb/s for =
PCIe
[   51.577463] thunderbolt 0000:8a:00.0: 0:13 <-> 1:12 (DP): consumed bandw=
idth 0/12500 Mb/s
[   51.577866] thunderbolt 0000:8a:00.0: 1:1: link maximum bandwidth 72000/=
72000 Mb/s
[   51.577978] thunderbolt 0000:8a:00.0: 1:1: reserving 1500/1500 Mb/s for =
PCIe
[   51.577898] i915 0000:00:02.0: [drm:intel_dbuf_mdclk_cdclk_ratio_update =
[i915]] Updating dbuf ratio to 2 (mbus joined: no)
[   51.578072] i915 0000:00:02.0: [drm:intel_dbuf_mbus_join_update [i915]] =
Changing mbus joined: yes -> no (pipe: A)
[   51.578743] thunderbolt 0000:8a:00.0: 0:13 <-> 1:12 (DP): consumed bandw=
idth 0/12500 Mb/s
[   51.578745] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): available ba=
ndwidth 70500/58000 Mb/s
[   51.579768] thunderbolt 0000:8a:00.0: 0:21: scaled bandwidth 3599/3599, =
scale 0
[   51.580426] thunderbolt 0000:8a:00.0: 0:21 <-> 1:20 (USB3): increased ba=
ndwidth allocation to 14738/14738 Mb/s
[   51.580428] thunderbolt 0000:8a:00.0: bandwidth estimation for group 1 d=
one
[   51.580430] thunderbolt 0000:8a:00.0: bandwidth re-calculation done
[   51.594557] i915 0000:00:02.0: [drm:mst_stream_pre_enable [i915]] active=
 MST streams 0 -> 1
[   51.594790] i915 0000:00:02.0: [drm:intel_power_well_enable [i915]] enab=
ling AUX_TC3
[   51.596464] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00600 AUX <- (ret=3D  1) 01
[   51.596494] i915 0000:00:02.0: [drm:drm_dp_mst_topology_get_port_validat=
ed [drm_display_helper]] port 000000007aaabdfc (2)
[   51.596517] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] txmsg cur_offset=3D0 cur_len=3D2 seqno=3D0 state=3DQUEUED p=
ath_msg=3D1 dst=3D00:03
[   51.596533] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 	type=3DPOWER_UP_PHY contents:
[   51.596544] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 		port=3D3
[   51.597287] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x01000 AUX <- (ret=3D  7) 21 30 43 c8 24 30=
 6f
[   51.599919] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.600176] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.600474] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] got hpd i=
rq on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.601081] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.601499] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.601510] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   51.602368] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 43 c2 24 30 =
6f 00 00 00 00 00 00 00 00 00
[   51.602381] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000029fe17b5 (2)
[   51.602400] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000029fe17b5 (1)
[   51.602501] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_port [drm_di=
splay_helper]] port 000000007aaabdfc (1)
[   51.602534] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 00000000e6773186 (2)
[   51.602552] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] txmsg cur_offset=3D0 cur_len=3D5 seqno=3D0 state=3DQUEUED p=
ath_msg=3D0 dst=3D00
[   51.602568] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 	type=3DREMOTE_DPCD_READ contents:
[   51.602579] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 		port=3D3 dpcd_addr=3D00160 len=3D1
[   51.602840] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   51.603592] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x01000 AUX <- (ret=3D  9) 10 06 cc 20 30 01=
 60 01 68
[   51.604051] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.604483] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.604495] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   51.605047] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.605471] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   51.605940] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.606187] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.606293] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.606726] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.606736] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   51.607620] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 10 05 c3 20 03 01 =
00 d2 00 00 00 00 00 00 00 00
[   51.607633] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 00000000e6773186 (3)
[   51.607651] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 00000000e6773186 (2)
[   51.607759] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 00000000e6773186 (1)
[   51.607788] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] DPMST: 0x00160 AUX -> (ret=3D  1) 00
[   51.607805] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 00000000e6773186 (2)
[   51.607820] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] txmsg cur_offset=3D0 cur_len=3D6 seqno=3D0 state=3DQUEUED p=
ath_msg=3D0 dst=3D00
[   51.607835] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 	type=3DREMOTE_DPCD_WRITE contents:
[   51.607845] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 		port=3D3 addr=3D00160 len=3D1: 01
[   51.608357] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   51.608675] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.608908] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.609352] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x01000 AUX <- (ret=3D 10) 10 07 c9 21 30 01=
 60 01 01 5d
[   51.609966] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.610405] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.610418] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   51.610993] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.611415] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   51.611931] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.612172] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.612282] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.612726] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.612736] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   51.613668] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 10 03 ce 21 03 14 =
00 00 00 00 00 00 00 00 00 00
[   51.613682] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 00000000e6773186 (3)
[   51.613700] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 00000000e6773186 (2)
[   51.613818] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 00000000e6773186 (1)
[   51.613850] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] DPMST: 0x00160 AUX <- (ret=3D  1) 01
[   51.614139] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   51.614712] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.614953] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.615352] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.615757] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x001b0 AUX <- (ret=3D  1) 01
[   51.616176] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.616207] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   51.616825] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.617262] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   51.617679] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.618372] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.618389] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 00
[   51.618570] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] got hpd i=
rq on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.619142] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.619559] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.619588] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 00
[   51.639726] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xf0005 AUX -> (ret=3D  1) 00
[   51.640168] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x03050 AUX <- (ret=3D  1) 00
[   51.640582] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x03051 AUX <- (ret=3D  1) 00
[   51.641000] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x03052 AUX -> (ret=3D  1) 00
[   51.641424] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x03052 AUX <- (ret=3D  1) 00
[   51.641848] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00120 AUX <- (ret=3D  1) 01
[   51.642614] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00280 AUX <- (ret=3D  1) 03
[   51.643030] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0xf0000 AUX -> (ret=3D  1) 20
[   51.643781] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00000 AUX -> (ret=3D 15) 12 14 c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.644532] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02200 AUX -> (ret=3D 15) 14 1e c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.644541] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: Base DPCD: 12 14 c4 81 01 1d 01 c4 6a 3f=
 04 00 00 00 84
[   51.644557] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: DPCD: 14 1e c4 81 01 1d 01 c4 6a 3f 04 0=
0 00 00 84
[   51.645297] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xf0000 AUX -> (ret=3D  8) 20 1e 80 aa 04 00 =
01 03
[   51.645308] i915 0000:00:02.0: [drm:intel_dp_init_lttpr_and_dprx_caps [i=
915]] [CONNECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][DPRX] LTTPR common =
capabilities: 20 1e 80 aa 04 00 01 03
[   51.645905] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0xf0003 AUX <- (ret=3D  1) 55
[   51.646318] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0xf0003 AUX <- (ret=3D  1) aa
[   51.646738] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xf0020 AUX -> (ret=3D  3) 04 03 00
[   51.646747] i915 0000:00:02.0: [drm:intel_dp_init_lttpr_and_dprx_caps [i=
915]] [CONNECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][LTTPR 1] PHY capabi=
lities: 04 03 00
[   51.647613] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xf003d AUX -> (ret=3D 12) 98 4f ee 42 52 00 =
00 00 00 b1 04 09
[   51.647624] i915 0000:00:02.0: [drm:drm_dp_dump_desc [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: LTTPR 1: OUI 98-4f-ee dev-ID BR HW-rev 11.1 S=
W-rev 4.9 quirks 0x0000
[   51.648360] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00000 AUX -> (ret=3D 15) 12 14 c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.649025] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02200 AUX -> (ret=3D 15) 14 1e c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.649034] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: Base DPCD: 12 14 c4 81 01 1d 01 c4 6a 3f=
 04 00 00 00 84
[   51.649046] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: DPCD: 14 1e c4 81 01 1d 01 c4 6a 3f 04 0=
0 00 00 84
[   51.649495] i915 0000:00:02.0: [drm:intel_dp_start_link_train [i915]] [C=
ONNECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][DPRX] Using LINK_BW_SET val=
ue 1e
[   51.650032] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00107 AUX <- (ret=3D  2) 00 01
[   51.650764] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00100 AUX <- (ret=3D  2) 1e 04
[   51.650776] i915 0000:00:02.0: [drm:intel_dp_set_signal_levels [i915]] [=
CONNECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][LTTPR 1] 8b/10b, lanes: 4,=
 vswing levels: 0/0/0/0, pre-emphasis levels: 0/0/0/0
[   51.651174] i915 0000:00:02.0: [drm:intel_dp_program_link_training_patte=
rn [i915]] [CONNECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][LTTPR 1] Using=
 DP training pattern TPS1
[   51.651732] usb 3-1.2.1: New USB device found, idVendor=3D17ef, idProduc=
t=3D3116, bcdDevice=3D 4.40
[   51.651739] usb 3-1.2.1: New USB device strings: Mfr=3D1, Product=3D2, S=
erialNumber=3D3
[   51.651742] usb 3-1.2.1: Product: VMM9322
[   51.651744] usb 3-1.2.1: Manufacturer: LENOVO
[   51.651746] usb 3-1.2.1: SerialNumber: 000000000000
[   51.651995] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0xf0010 AUX <- (ret=3D  5) 21 00 00 00 00
[   51.652854] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xf0030 AUX -> (ret=3D  5) 00 00 80 33 33
[   51.652864] i915 0000:00:02.0: [drm:intel_dp_get_adjust_train [i915]] [C=
ONNECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][LTTPR 1] 8b/10b, lanes: 4, =
vswing request: 3/3/3/3, pre-emphasis request: 0/0/0/0
[   51.652974] i915 0000:00:02.0: [drm:intel_dp_set_signal_levels [i915]] [=
CONNECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][LTTPR 1] 8b/10b, lanes: 4,=
 vswing levels: 3(max)/3(max)/3(max)/3(max), pre-emphasis levels: 0/0/0/0
[   51.653278] hid-generic 0003:17EF:3116.0006: hiddev100,hidraw5: USB HID =
v1.01 Device [LENOVO VMM9322] on usb-0000:00:14.0-1.2.1/input0
[   51.653840] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0xf0011 AUX <- (ret=3D  4) 07 07 07 07
[   51.654721] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xf0030 AUX -> (ret=3D  5) 11 11 80 33 33
[   51.654734] i915 0000:00:02.0: [drm:intel_dp_link_train_phy [i915]] [CON=
NECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][LTTPR 1] Clock recovery OK
[   51.655236] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xf0020 AUX -> (ret=3D  1) 04
[   51.655246] i915 0000:00:02.0: [drm:intel_dp_program_link_training_patte=
rn [i915]] [CONNECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][LTTPR 1] Using=
 DP training pattern TPS4
[   51.656027] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0xf0010 AUX <- (ret=3D  5) 07 07 07 07 07
[   51.673773] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xf0030 AUX -> (ret=3D  5) 11 11 00 33 33
[   51.673804] i915 0000:00:02.0: [drm:intel_dp_get_adjust_train [i915]] [C=
ONNECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][LTTPR 1] 8b/10b, lanes: 4, =
vswing request: 3/3/3/3, pre-emphasis request: 0/0/0/0
[   51.674000] i915 0000:00:02.0: [drm:intel_dp_set_signal_levels [i915]] [=
CONNECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][LTTPR 1] 8b/10b, lanes: 4,=
 vswing levels: 3(max)/3(max)/3(max)/3(max), pre-emphasis levels: 0/0/0/0
[   51.674845] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0xf0011 AUX <- (ret=3D  4) 07 07 07 07
[   51.691780] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xf0030 AUX -> (ret=3D  5) 77 77 81 33 33
[   51.691808] i915 0000:00:02.0: [drm:intel_dp_link_train_phy [i915]] [CON=
NECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][LTTPR 1] Channel EQ done. DP =
Training successful
[   51.691984] i915 0000:00:02.0: [drm:intel_dp_link_train_phy [i915]] [CON=
NECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][LTTPR 1] Link Training passed=
 at link rate =3D 810000, lane count =3D 4
[   51.692551] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0xf0010 AUX <- (ret=3D  1) 00
[   51.692569] i915 0000:00:02.0: [drm:intel_dp_set_signal_levels [i915]] [=
CONNECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][DPRX] 8b/10b, lanes: 4, vs=
wing levels: 0/0/0/0, pre-emphasis levels: 0/0/0/0
[   51.692697] i915 0000:00:02.0: [drm:intel_dp_program_link_training_patte=
rn [i915]] [CONNECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][DPRX] Using DP=
 training pattern TPS1
[   51.694025] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX <- (ret=3D  5) 21 00 00 00 00
[   51.702016] i915 0000:00:02.0: [drm:intel_power_well_disable [i915]] dis=
abling AUX_TC3
[   51.702205] i915 0000:00:02.0: [drm:intel_power_well_enable [i915]] enab=
ling AUX_TC3
[   51.703731] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00202 AUX -> (ret=3D  6) 00 11 00 00 11 11
[   51.703743] i915 0000:00:02.0: [drm:intel_dp_get_adjust_train [i915]] [C=
ONNECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][DPRX] 8b/10b, lanes: 4, vsw=
ing request: 1/1/1/1, pre-emphasis request: 0/0/0/0
[   51.703821] i915 0000:00:02.0: [drm:intel_dp_set_signal_levels [i915]] [=
CONNECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][DPRX] 8b/10b, lanes: 4, vs=
wing levels: 1/1/1/1, pre-emphasis levels: 0/0/0/0
[   51.704614] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00103 AUX <- (ret=3D  4) 01 01 01 01
[   51.705483] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00202 AUX -> (ret=3D  6) 11 11 00 00 11 11
[   51.705491] i915 0000:00:02.0: [drm:intel_dp_link_train_phy [i915]] [CON=
NECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][DPRX] Clock recovery OK
[   51.705566] i915 0000:00:02.0: [drm:intel_dp_program_link_training_patte=
rn [i915]] [CONNECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][DPRX] Using DP=
 training pattern TPS4
[   51.706360] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX <- (ret=3D  5) 07 01 01 01 01
[   51.723772] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00202 AUX -> (ret=3D  6) 77 77 81 00 11 11
[   51.723802] i915 0000:00:02.0: [drm:intel_dp_link_train_phy [i915]] [CON=
NECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][DPRX] Channel EQ done. DP Tra=
ining successful
[   51.724014] i915 0000:00:02.0: [drm:intel_dp_link_train_phy [i915]] [CON=
NECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][DPRX] Link Training passed at=
 link rate =3D 810000, lane count =3D 4
[   51.725220] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x00102 AUX <- (ret=3D  1) 00
[   51.725243] i915 0000:00:02.0: [drm:drm_dp_mst_topology_get_port_validat=
ed [drm_display_helper]] port 000000007aaabdfc (2)
[   51.725654] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x002c0 AUX <- (ret=3D  1) 01
[   51.726351] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x001c0 AUX <- (ret=3D  3) 01 01 20
[   51.726750] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x002c0 AUX -> (ret=3D  1) 01
[   51.726761] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_port [drm_di=
splay_helper]] port 000000007aaabdfc (1)
[   51.727404] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x002c0 AUX -> (ret=3D  1) 03
[   51.727810] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00280 AUX -> (ret=3D  1) 05
[   51.727819] i915 0000:00:02.0: [drm:drm_dp_mst_topology_get_port_validat=
ed [drm_display_helper]] port 000000007aaabdfc (2)
[   51.727831] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000029fe17b5 (2)
[   51.727847] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] txmsg cur_offset=3D0 cur_len=3D6 seqno=3D0 state=3DQUEUED p=
ath_msg=3D1 dst=3D00:03
[   51.727861] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 	type=3DALLOCATE_PAYLOAD contents:
[   51.727872] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 		port=3D3 vcpi=3D1 pbn=3D1920 sdp_streams=3D1 00
[   51.728610] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x01000 AUX <- (ret=3D 11) 21 30 47 cf 11 31=
 01 07 80 00 6f
[   51.730914] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.731096] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.731189] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] got hpd i=
rq on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.731819] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.732241] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.732261] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   51.733036] usbcore: registered new interface driver snd-usb-audio
[   51.733059] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 46 c0 11 30 =
01 07 80 2f 00 00 00 00 00 00
[   51.733079] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000029fe17b5 (3)
[   51.733107] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000029fe17b5 (2)
[   51.733119] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000029fe17b5 (2)
[   51.733163] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_port [drm_di=
splay_helper]] port 000000007aaabdfc (1)
[   51.733183] i915 0000:00:02.0: [drm:intel_enable_transcoder [i915]] enab=
ling pipe B
[   51.733590] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   51.734008] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.734021] usb 3-1.2.3: new high-speed USB device number 11 using xhci_=
hcd
[   51.734418] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.734435] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   51.734987] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.735410] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   51.735830] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.736234] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.736251] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 00
[   51.750177] i915 0000:00:02.0: [drm:intel_audio_codec_enable [i915]] [CO=
NNECTOR:332:DP-9][ENCODER:309:DP-MST B] Enable audio codec on [CRTC:145:pip=
e B], 32 bytes ELD
[   51.766843] i915 0000:00:02.0: [drm:intel_psr_post_plane_update [i915]] =
Enabling Panel Replay
[   51.767472] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x001b0 AUX <- (ret=3D  1) 7b
[   51.767896] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x001b1 AUX <- (ret=3D  1) 02
[   51.768012] i915 0000:00:02.0: [drm:verify_connector_state [i915]] [CONN=
ECTOR:332:DP-9]
[   51.768187] i915 0000:00:02.0: [drm:intel_modeset_verify_crtc [i915]] [C=
RTC:145:pipe B]
[   51.770002] i915 0000:00:02.0: [drm:intel_read_dp_sdp [i915]] Failed to =
unpack DP VSC SDP
[   51.771789] i915 0000:00:02.0: [drm:drm_client_hotplug] fbdev: ret=3D0
[   51.771806] i915 0000:00:02.0: [drm:drm_fb_helper_hotplug_event]=20
[   51.771811] i915 0000:00:02.0: [drm:drm_client_modeset_probe]=20
[   51.771821] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:262:eDP-1]
[   51.771828] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:2=
62:eDP-1]
[   51.772361] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x00060 AUX -> (ret=3D 16) 00 11 00 76 0b 01 01 80 00=
 01 06 66 08 00 00 00
[   51.772377] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] DSC DPCD: 00=
 11 00 76 0b 01 01 80 00 01 06 66 08 00 00 00
[   51.772718] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x02214 AUX -> (ret=3D  1) 00
[   51.772736] i915 0000:00:02.0: [drm:intel_dp_print_rates [i915]] source =
rates: 162000, 216000, 243000, 270000, 324000, 432000, 540000, 675000, 8100=
00
[   51.772907] i915 0000:00:02.0: [drm:intel_dp_print_rates [i915]] sink ra=
tes: 162000, 216000, 243000, 270000, 324000, 432000, 540000, 810000
[   51.773041] i915 0000:00:02.0: [drm:intel_dp_print_rates [i915]] common =
rates: 162000, 216000, 243000, 270000, 324000, 432000, 540000, 810000
[   51.773176] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:262:eDP-1] Supported Monitor Refresh rate range is 40 Hz - 60 Hz
[   51.773184] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:262:eDP-1] Assigning EDID-1.4 digital sink color depth as 10 bpc.
[   51.773187] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:262:eDP-1] ELD monitor=20
[   51.773190] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:262:eDP-1] ELD size 20, SAD count 0
[   51.773196] i915 0000:00:02.0: [drm:intel_dp_set_edid [i915]] [CONNECTOR=
:262:eDP-1] VRR capable: yes
[   51.773324] i915 0000:00:02.0: [drm:intel_dp_set_edid [i915]] [CONNECTOR=
:262:eDP-1] DFP max bpc 0, max dotclock 0, TMDS clock 0-0, PCON Max FRL BW =
0Gbps
[   51.773450] i915 0000:00:02.0: [drm:intel_dp_set_edid [i915]] [CONNECTOR=
:262:eDP-1] RGB->YcbCr conversion? no, YCbCr 4:2:0 allowed? yes, YCbCr 4:4:=
4->4:2:0 conversion? no
[   51.773781] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x03000 AUX -> (ret=3D  1) 00
[   51.774001] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x00201 AUX -> (ret=3D  1) 00
[   51.774069] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:262:eDP-1] probed modes:
[   51.774074] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "3840x2400": 60 605000 3840 3888 3920 4000 2400 2403 2408=
 2520 0x48 0xa
[   51.774080] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:271:DP-1]
[   51.774084] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:2=
71:DP-1]
[   51.779050] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:271:DP-1] disconnected
[   51.779057] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:283:HDMI-A-1]
[   51.779061] i915 0000:00:02.0: [drm:intel_hdmi_detect [i915]] [CONNECTOR=
:283:HDMI-A-1]
[   51.781441] usb 6-1.4: new SuperSpeed Plus Gen 2x1 USB device number 3 u=
sing xhci_hcd
[   51.784051] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:283:HDMI-A-1] disconnected
[   51.784056] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:289:DP-2]
[   51.784060] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:2=
89:DP-2]
[   51.784265] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:289:DP-2] disconnected
[   51.784269] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:298:DP-3]
[   51.784272] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:2=
98:DP-3]
[   51.784439] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:298:DP-3] disconnected
[   51.784442] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:307:DP-4]
[   51.784445] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:3=
07:DP-4]
[   51.784990] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0xf0000 AUX -> (ret=3D  1) 20
[   51.785751] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00000 AUX -> (ret=3D 15) 12 14 c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.786510] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02200 AUX -> (ret=3D 15) 14 1e c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.786524] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: Base DPCD: 12 14 c4 81 01 1d 01 c4 6a 3f=
 04 00 00 00 84
[   51.786539] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: DPCD: 14 1e c4 81 01 1d 01 c4 6a 3f 04 0=
0 00 00 84
[   51.787282] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xf0000 AUX -> (ret=3D  8) 20 1e 80 aa 04 00 =
01 03
[   51.787295] i915 0000:00:02.0: [drm:intel_dp_init_lttpr_and_dprx_caps [i=
915]] [CONNECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][DPRX] LTTPR common =
capabilities: 20 1e 80 aa 04 00 01 03
[   51.787863] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xf0020 AUX -> (ret=3D  3) 04 03 00
[   51.787876] i915 0000:00:02.0: [drm:intel_dp_init_lttpr_and_dprx_caps [i=
915]] [CONNECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][LTTPR 1] PHY capabi=
lities: 04 03 00
[   51.788729] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xf003d AUX -> (ret=3D 12) 98 4f ee 42 52 00 =
00 00 00 b1 04 09
[   51.788740] i915 0000:00:02.0: [drm:drm_dp_dump_desc [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: LTTPR 1: OUI 98-4f-ee dev-ID BR HW-rev 11.1 S=
W-rev 4.9 quirks 0x0000
[   51.789484] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00000 AUX -> (ret=3D 15) 12 14 c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.790229] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02200 AUX -> (ret=3D 15) 14 1e c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.790239] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: Base DPCD: 12 14 c4 81 01 1d 01 c4 6a 3f=
 04 00 00 00 84
[   51.790250] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: DPCD: 14 1e c4 81 01 1d 01 c4 6a 3f 04 0=
0 00 00 84
[   51.790990] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00500 AUX -> (ret=3D 12) 90 cc 24 53 59 4e =
41 93 22 10 09 03
[   51.791009] i915 0000:00:02.0: [drm:drm_dp_dump_desc [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: DP branch: OUI 90-cc-24 dev-ID SYNA\223" HW-r=
ev 1.0 SW-rev 9.3 quirks 0x0028
[   51.791421] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02210 AUX -> (ret=3D  1) fa
[   51.791834] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00200 AUX -> (ret=3D  1) 01
[   51.792580] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00080 AUX -> (ret=3D 16) 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00
[   51.792590] i915 0000:00:02.0: [drm:drm_dp_read_downstream_info [drm_dis=
play_helper]] AUX USBC3/DDI TC3/PHY TC3: DPCD DFP: 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00
[   51.792997] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00021 AUX -> (ret=3D  1) 21
[   51.793013] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [ENCODER:306=
:DDI TC3/PHY TC3] MST support: port: yes, sink: MST, modparam: yes -> enabl=
e: MST
[   51.793558] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00111 AUX -> (ret=3D  1) 07
[   51.793965] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.794373] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0023 AUX -> (ret=3D  1) cf
[   51.794797] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00070 AUX -> (ret=3D  2) 00 00
[   51.795529] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x000b0 AUX -> (ret=3D  7) 07 1c 00 00 00 00 =
00
[   51.795539] i915 0000:00:02.0: [drm:intel_psr_init_dpcd [i915]] Panel re=
play selective_update is supported by panel
[   51.796358] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x000b1 AUX -> (ret=3D  1) 1c
[   51.797041] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00060 AUX -> (ret=3D 16) 03 21 00 14 0b 04 =
03 c0 01 17 0e e2 08 00 00 00
[   51.797052] i915 0000:00:02.0: [drm:intel_dp_get_dsc_sink_cap [i915]] DS=
C DPCD: 03 21 00 14 0b 04 03 c0 01 17 0e e2 08 00 00 00
[   51.797568] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00090 AUX -> (ret=3D  1) ff
[   51.797578] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] FEC CAPABILI=
TY: ff
[   51.798353] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02214 AUX -> (ret=3D  1) 03
[   51.798365] i915 0000:00:02.0: [drm:intel_dp_print_rates [i915]] source =
rates: 162000, 216000, 243000, 270000, 324000, 432000, 540000, 675000, 8100=
00, 1000000, 2000000
[   51.798490] i915 0000:00:02.0: [drm:intel_dp_print_rates [i915]] sink ra=
tes: 162000, 270000, 540000, 810000
[   51.798590] i915 0000:00:02.0: [drm:intel_dp_print_rates [i915]] common =
rates: 162000, 270000, 540000, 810000
[   51.798687] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:307:DP-4] disconnected
[   51.798691] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:316:DP-5]
[   51.798693] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:3=
16:DP-5]
[   51.799984] usb 6-1.4: New USB device found, idVendor=3D17ef, idProduct=
=3D3110, bcdDevice=3D 2.a3
[   51.799995] usb 6-1.4: New USB device strings: Mfr=3D1, Product=3D2, Ser=
ialNumber=3D0
[   51.799999] usb 6-1.4: Product: Lenovo Dock - USB3 Hub1
[   51.800002] usb 6-1.4: Manufacturer: Lenovo                =20
[   51.803021] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:316:DP-5] disconnected
[   51.803032] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:324:DP-6]
[   51.803038] i915 0000:00:02.0: [drm:drm_dp_mst_topology_get_port_validat=
ed [drm_display_helper]] port 000000003f2314f0 (2)
[   51.803058] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_port [drm_di=
splay_helper]] port 000000003f2314f0 (1)
[   51.803068] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:324:DP-6] disconnected
[   51.803071] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:328:DP-7]
[   51.803074] i915 0000:00:02.0: [drm:drm_dp_mst_topology_get_port_validat=
ed [drm_display_helper]] port 00000000301cacad (2)
[   51.803082] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_port [drm_di=
splay_helper]] port 00000000301cacad (1)
[   51.803089] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:328:DP-7] disconnected
[   51.803092] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:330:DP-8]
[   51.803095] i915 0000:00:02.0: [drm:drm_dp_mst_topology_get_port_validat=
ed [drm_display_helper]] port 00000000b206c260 (2)
[   51.803101] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_port [drm_di=
splay_helper]] port 00000000b206c260 (1)
[   51.803108] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:330:DP-8] disconnected
[   51.803110] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:332:DP-9]
[   51.803116] i915 0000:00:02.0: [drm:drm_dp_mst_topology_get_port_validat=
ed [drm_display_helper]] port 000000007aaabdfc (2)
[   51.803124] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_port [drm_di=
splay_helper]] port 000000007aaabdfc (1)
[   51.803130] i915 0000:00:02.0: [drm:drm_dp_mst_topology_get_port_validat=
ed [drm_display_helper]] port 000000007aaabdfc (2)
[   51.803139] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000029fe17b5 (2)
[   51.803150] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] txmsg cur_offset=3D0 cur_len=3D8 seqno=3D0 state=3DQUEUED p=
ath_msg=3D0 dst=3D00:03
[   51.803162] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 	type=3DREMOTE_I2C_READ contents:
[   51.803170] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 		port=3D3 num_tx=3D1 id=3D80 size=3D1:
[   51.803177] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 			0: id=3D080 size=3D001 no_stop_bit=3D0 tx_delay=3D000: 00
[   51.803300] hub 6-1.4:1.0: USB hub found
[   51.803919] hub 6-1.4:1.0: 4 ports detected
[   51.803917] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x01000 AUX <- (ret=3D 13) 21 30 09 c5 22 31=
 50 01 00 10 50 01 66
[   51.805910] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.806035] i915 0000:00:02.0: [drm:intel_power_well_disable [i915]] dis=
abling AUX_TC3
[   51.806271] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.807019] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] got hpd i=
rq on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.807255] i915 0000:00:02.0: [drm:intel_power_well_enable [i915]] enab=
ling AUX_TC3
[   51.809036] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.809449] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.809466] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   51.810364] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 05 c6 22 03 =
01 00 58 00 00 00 00 00 00 00
[   51.810387] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000029fe17b5 (3)
[   51.810407] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000029fe17b5 (2)
[   51.810410] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000029fe17b5 (2)
[   51.810422] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000029fe17b5 (2)
[   51.810427] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] txmsg cur_offset=3D0 cur_len=3D8 seqno=3D0 state=3DQUEUED p=
ath_msg=3D0 dst=3D00:03
[   51.810432] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 	type=3DREMOTE_I2C_READ contents:
[   51.810436] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 		port=3D3 num_tx=3D1 id=3D80 size=3D128:
[   51.810439] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 			0: id=3D080 size=3D001 no_stop_bit=3D0 tx_delay=3D000: 00
[   51.810848] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   51.811569] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x01000 AUX <- (ret=3D 13) 21 30 09 c5 22 31=
 50 01 00 10 50 80 5c
[   51.811991] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.812413] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.812427] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   51.813002] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.813448] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   51.813906] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.814284] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.814216] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.814684] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.814695] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   51.815557] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 2c 8c 22 03 =
80 00 ff ff ff ff ff ff 00 15
[   51.815590] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000029fe17b5 (3)
[   51.816352] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01410 AUX -> (ret=3D 16) c3 28 33 e1 96 ca =
01 31 21 01 04 a5 3c 22 78 fa
[   51.816670] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.816939] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.817369] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01420 AUX -> (ret=3D 16) d1 15 a9 54 4f a6 =
26 0d 50 54 a1 08 00 81 80 80
[   51.817391] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000029fe17b5 (2)
[   51.817810] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   51.818529] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.818954] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.818982] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   51.819728] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.820177] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   51.820910] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.821285] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.821251] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.821693] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.821705] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   51.822595] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 2c 07 a9 40 =
d1 00 b3 00 81 00 a9 c0 81 c0
[   51.822613] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000029fe17b5 (3)
[   51.823364] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01410 AUX -> (ret=3D 16) 01 01 4d d0 00 a0 =
f0 70 3e 80 30 20 35 00 55 50
[   51.823693] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.823962] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.824368] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01420 AUX -> (ret=3D 16) 21 00 00 1a 00 00 =
00 ff 00 33 30 30 35 34 31 9a
[   51.824383] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000029fe17b5 (2)
[   51.824810] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   51.825522] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.825923] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.825935] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   51.826477] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.826941] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.827180] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.827300] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   51.827773] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.828172] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.828183] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   51.829034] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 2c 07 31 33 =
0a 20 20 20 20 00 00 00 fd 00
[   51.829049] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000029fe17b5 (3)
[   51.829706] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.829927] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.830363] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01410 AUX -> (ret=3D 16) 1d 3d 1f 86 36 01 =
0a 20 20 20 20 20 20 00 00 00
[   51.831028] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01420 AUX -> (ret=3D 16) fc 00 45 56 32 37 =
34 30 58 0a 20 20 20 20 20 63
[   51.831041] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000029fe17b5 (2)
[   51.831200] usb 3-1.2.3: New USB device found, idVendor=3D17ef, idProduc=
t=3D3113, bcdDevice=3D 2.b3
[   51.831207] usb 3-1.2.3: New USB device strings: Mfr=3D1, Product=3D2, S=
erialNumber=3D0
[   51.831208] usb 3-1.2.3: Product: Lenovo Dock - USB2 Hub2
[   51.831210] usb 3-1.2.3: Manufacturer: Lenovo                =20
[   51.831457] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   51.831873] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.832295] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.832324] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   51.832531] hub 3-1.2.3:1.0: USB hub found
[   51.832927] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.833353] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   51.833853] hub 3-1.2.3:1.0: 4 ports detected
[   51.833942] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.834140] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.834329] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.834747] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.834759] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   51.835690] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 03 40 01 14 =
a7 00 00 00 00 00 00 00 00 00
[   51.835728] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000029fe17b5 (3)
[   51.835755] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000029fe17b5 (2)
[   51.835894] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000029fe17b5 (1)
[   51.835936] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000029fe17b5 (2)
[   51.835944] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] txmsg cur_offset=3D0 cur_len=3D8 seqno=3D0 state=3DQUEUED p=
ath_msg=3D0 dst=3D00:03
[   51.835950] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 	type=3DREMOTE_I2C_READ contents:
[   51.835954] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 		port=3D3 num_tx=3D1 id=3D80 size=3D128:
[   51.835958] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 			0: id=3D080 size=3D001 no_stop_bit=3D0 tx_delay=3D000: 80
[   51.836205] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   51.836681] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.836874] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.837356] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x01000 AUX <- (ret=3D 13) 21 30 09 c5 22 31=
 50 01 80 10 50 80 07
[   51.837788] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.838188] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.838201] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   51.838837] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.839255] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   51.839975] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.840183] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.840325] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.840729] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.840741] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   51.841639] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 2c 8c 22 03 =
80 02 03 13 f1 46 10 22 04 03
[   51.841653] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000029fe17b5 (3)
[   51.842363] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01410 AUX -> (ret=3D 16) 02 01 23 09 7f 07 =
83 01 00 00 02 3a 80 18 71 38
[   51.842684] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.842895] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.843364] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01420 AUX -> (ret=3D 16) 2d 40 58 2c 45 00 =
55 50 21 00 00 1e a3 66 00 a7
[   51.843377] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000029fe17b5 (2)
[   51.843801] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   51.844201] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.844622] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.844633] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   51.845194] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.845948] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.846193] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.846305] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   51.846743] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.847147] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.847158] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   51.848027] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 2c 07 a0 f0 =
70 1f 80 30 20 35 00 55 50 21
[   51.848042] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000029fe17b5 (3)
[   51.848690] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.848915] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.849367] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01410 AUX -> (ret=3D 16) 00 00 1a 56 5e 00 =
a0 a0 a0 29 50 30 20 35 00 55
[   51.850029] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01420 AUX -> (ret=3D 16) 50 21 00 00 1a 00 =
00 00 00 00 00 00 00 00 00 92
[   51.850042] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000029fe17b5 (2)
[   51.850460] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   51.850876] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.851280] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.851293] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   51.851880] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.852295] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   51.852941] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.853179] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.853304] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.853740] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.853759] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   51.854679] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 2c 07 00 00 =
00 00 00 00 00 00 00 00 00 00
[   51.854700] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000029fe17b5 (3)
[   51.855448] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01410 AUX -> (ret=3D 16) 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00
[   51.856683] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01420 AUX -> (ret=3D 16) 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00
[   51.856698] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000029fe17b5 (2)
[   51.857114] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   51.857533] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.857936] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.857948] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   51.858473] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.858889] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   51.859304] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.859706] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.859718] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 00
[   51.859849] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] got hpd i=
rq on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.860394] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.860812] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.860825] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 00
[   51.882909] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.883170] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.883383] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] got hpd i=
rq on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.884385] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.884825] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.884857] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   51.885690] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.885939] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.886395] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 03 40 00 29 =
58 00 00 00 00 00 00 00 00 00
[   51.886425] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000029fe17b5 (3)
[   51.886440] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000029fe17b5 (2)
[   51.886541] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000029fe17b5 (1)
[   51.886572] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_port [drm_di=
splay_helper]] port 000000007aaabdfc (1)
[   51.886590] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:332:DP-9] Assigning EDID-1.4 digital sink color depth as 8 bpc.
[   51.886599] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:332:DP-9] ELD monitor EV2740X
[   51.886602] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:332:DP-9] ELD size 32, SAD count 1
[   51.886868] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   51.886786] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 47 for 64 timeslots total bw 25920000 pixel clock 5=
48463
[   51.886983] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 95 for 64 timeslots total bw 25920000 pixel clock 2=
70246
[   51.887158] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 104 for 64 timeslots total bw 25920000 pixel clock =
248389
[   51.887306] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.887297] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 130 for 64 timeslots total bw 25920000 pixel clock =
198763
[   51.887424] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 169 for 64 timeslots total bw 25920000 pixel clock =
152736
[   51.887570] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 169 for 64 timeslots total bw 25920000 pixel clock =
152736
[   51.887708] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.887713] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   51.887720] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 169 for 64 timeslots total bw 25920000 pixel clock =
152584
[   51.887852] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 339 for 64 timeslots total bw 25920000 pixel clock =
76368
[   51.887970] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 339 for 64 timeslots total bw 25920000 pixel clock =
76292
[   51.888106] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 155 for 64 timeslots total bw 25920000 pixel clock =
166621
[   51.888187] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.888227] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 172 for 64 timeslots total bw 25920000 pixel clock =
150422
[   51.888346] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 233 for 64 timeslots total bw 25920000 pixel clock =
111081
[   51.888464] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 233 for 64 timeslots total bw 25920000 pixel clock =
111081
[   51.888599] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   51.888582] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 301 for 64 timeslots total bw 25920000 pixel clock =
85882
[   51.888692] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 339 for 64 timeslots total bw 25920000 pixel clock =
76368
[   51.888801] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 339 for 64 timeslots total bw 25920000 pixel clock =
76368
[   51.888913] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 339 for 64 timeslots total bw 25920000 pixel clock =
76292
[   51.889030] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.889034] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 387 for 64 timeslots total bw 25920000 pixel clock =
66854
[   51.889153] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 630 for 64 timeslots total bw 25920000 pixel clock =
41141
[   51.889260] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 932 for 64 timeslots total bw 25920000 pixel clock =
27798
[   51.889367] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 932 for 64 timeslots total bw 25920000 pixel clock =
27798
[   51.889429] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.889432] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 00
[   51.889490] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] got hpd i=
rq on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.889474] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 933 for 64 timeslots total bw 25920000 pixel clock =
27770
[   51.889581] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 933 for 64 timeslots total bw 25920000 pixel clock =
27770
[   51.889690] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 1000 for 64 timeslots total bw 25920000 pixel clock=
 25918
[   51.889794] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 1001 for 64 timeslots total bw 25920000 pixel clock=
 25893
[   51.889900] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 1001 for 64 timeslots total bw 25920000 pixel clock=
 25893
[   51.889959] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.890018] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 889 for 64 timeslots total bw 25920000 pixel clock =
29127
[   51.890126] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:332:DP-9] probed modes:
[   51.890134] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "3840x2160": 60 533250 3840 3888 3920 4000 2160 2163 2168=
 2222 0x48 0x9
[   51.890139] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "3840x2160": 30 262750 3840 3888 3920 4000 2160 2163 2168=
 2191 0x40 0x9
[   51.890143] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "2560x1440": 60 241500 2560 2608 2640 2720 1440 1443 1448=
 1481 0x40 0x9
[   51.890147] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1920x1200": 60 193250 1920 2056 2256 2592 1200 1203 1209=
 1245 0x40 0x6
[   51.890151] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1920x1080": 60 148500 1920 2008 2052 2200 1080 1084 1089=
 1125 0x40 0x5
[   51.890154] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1920x1080": 60 148500 1920 2008 2052 2200 1080 1084 1089=
 1125 0x40 0x5
[   51.890158] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1920x1080": 60 148352 1920 2008 2052 2200 1080 1084 1089=
 1125 0x40 0x5
[   51.890162] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1920x1080": 30 74250 1920 2008 2052 2200 1080 1084 1089 =
1125 0x40 0x5
[   51.890165] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1920x1080": 30 74176 1920 2008 2052 2200 1080 1084 1089 =
1125 0x40 0x5
[   51.890169] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1600x1200": 60 162000 1600 1664 1856 2160 1200 1201 1204=
 1250 0x40 0x5
[   51.890173] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1680x1050": 60 146250 1680 1784 1960 2240 1050 1053 1059=
 1089 0x40 0x6
[   51.890176] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1600x900": 60 108000 1600 1624 1704 1800 900 901 904 100=
0 0x40 0x5
[   51.890180] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1280x1024": 60 108000 1280 1328 1440 1688 1024 1025 1028=
 1066 0x40 0x5
[   51.890184] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1280x800": 60 83500 1280 1352 1480 1680 800 803 809 831 =
0x40 0x6
[   51.890188] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1280x720": 60 74250 1280 1390 1430 1650 720 725 730 750 =
0x40 0x5
[   51.890192] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1280x720": 60 74250 1280 1390 1430 1650 720 725 730 750 =
0x40 0x5
[   51.890196] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1280x720": 60 74176 1280 1390 1430 1650 720 725 730 750 =
0x40 0x5
[   51.890199] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1024x768": 60 65000 1024 1048 1184 1344 768 771 777 806 =
0x40 0xa
[   51.890203] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "800x600": 60 40000 800 840 968 1056 600 601 605 628 0x40=
 0x5
[   51.890207] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "720x480": 60 27027 720 736 798 858 480 489 495 525 0x40 =
0xa
[   51.890211] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "720x480": 60 27027 720 736 798 858 480 489 495 525 0x40 =
0xa
[   51.890214] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "720x480": 60 27000 720 736 798 858 480 489 495 525 0x40 =
0xa
[   51.890218] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "720x480": 60 27000 720 736 798 858 480 489 495 525 0x40 =
0xa
[   51.890222] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "640x480": 60 25200 640 656 752 800 480 490 492 525 0x40 =
0xa
[   51.890225] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "640x480": 60 25175 640 656 752 800 480 490 492 525 0x40 =
0xa
[   51.890229] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "640x480": 60 25175 640 656 752 800 480 490 492 525 0x40 =
0xa
[   51.890233] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "720x400": 70 28320 720 738 846 900 400 412 414 449 0x40 =
0x6
[   51.890238] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:334:DP-10]
[   51.890246] i915 0000:00:02.0: [drm:drm_dp_mst_topology_get_port_validat=
ed [drm_display_helper]] port 00000000b77874b4 (2)
[   51.890262] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_port [drm_di=
splay_helper]] port 00000000b77874b4 (1)
[   51.890275] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:334:DP-10] disconnected
[   51.890279] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:262:eDP-1] enabled? yes
[   51.890285] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:271:DP-1] enabled? no
[   51.890289] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:283:HDMI-A-1] enabled? no
[   51.890292] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:289:DP-2] enabled? no
[   51.890295] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:298:DP-3] enabled? no
[   51.890298] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:307:DP-4] enabled? no
[   51.890301] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:316:DP-5] enabled? no
[   51.890304] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:324:DP-6] enabled? no
[   51.890307] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:328:DP-7] enabled? no
[   51.890310] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:330:DP-8] enabled? no
[   51.890313] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:332:DP-9] enabled? yes
[   51.890315] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:334:DP-10] enabled? no
[   51.890329] i915 0000:00:02.0: [drm:drm_client_modeset_probe] Not using =
firmware configuration
[   51.890333] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:262:eDP-1] found preferred mode: 3840x2400
[   51.890337] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:332:DP-9] found preferred mode: 3840x2160
[   51.890340] i915 0000:00:02.0: [drm:drm_client_modeset_probe] picking CR=
TCs for 3840x2400 config
[   51.890347] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CRTC:88:p=
ipe A] desired mode 3840x2400 set (0,0)
[   51.890351] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CRTC:145:=
pipe B] desired mode 3840x2160 set (0,0)
[   51.890372] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.890375] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 00
[   51.907345] i915 0000:00:02.0: [drm:drm_client_hotplug] fbdev: ret=3D0
[   51.907360] i915 0000:00:02.0: [drm:drm_sysfs_hotplug_event] generating =
hotplug event
[   51.907393] i915 0000:00:02.0: [drm:drm_fb_helper_hotplug_event]=20
[   51.907397] i915 0000:00:02.0: [drm:drm_client_modeset_probe]=20
[   51.907402] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:262:eDP-1]
[   51.907408] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:2=
62:eDP-1]
[   51.907998] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x00060 AUX -> (ret=3D 16) 00 11 00 76 0b 01 01 80 00=
 01 06 66 08 00 00 00
[   51.908030] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] DSC DPCD: 00=
 11 00 76 0b 01 01 80 00 01 06 66 08 00 00 00
[   51.908424] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x02214 AUX -> (ret=3D  1) 00
[   51.908440] i915 0000:00:02.0: [drm:intel_dp_print_rates [i915]] source =
rates: 162000, 216000, 243000, 270000, 324000, 432000, 540000, 675000, 8100=
00
[   51.908629] i915 0000:00:02.0: [drm:intel_dp_print_rates [i915]] sink ra=
tes: 162000, 216000, 243000, 270000, 324000, 432000, 540000, 810000
[   51.908806] i915 0000:00:02.0: [drm:intel_dp_print_rates [i915]] common =
rates: 162000, 216000, 243000, 270000, 324000, 432000, 540000, 810000
[   51.908954] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:262:eDP-1] Supported Monitor Refresh rate range is 40 Hz - 60 Hz
[   51.908959] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:262:eDP-1] Assigning EDID-1.4 digital sink color depth as 10 bpc.
[   51.908962] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:262:eDP-1] ELD monitor=20
[   51.908964] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:262:eDP-1] ELD size 20, SAD count 0
[   51.908970] i915 0000:00:02.0: [drm:intel_dp_set_edid [i915]] [CONNECTOR=
:262:eDP-1] VRR capable: yes
[   51.909114] i915 0000:00:02.0: [drm:intel_dp_set_edid [i915]] [CONNECTOR=
:262:eDP-1] DFP max bpc 0, max dotclock 0, TMDS clock 0-0, PCON Max FRL BW =
0Gbps
[   51.909241] i915 0000:00:02.0: [drm:intel_dp_set_edid [i915]] [CONNECTOR=
:262:eDP-1] RGB->YcbCr conversion? no, YCbCr 4:2:0 allowed? yes, YCbCr 4:4:=
4->4:2:0 conversion? no
[   51.909597] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x03000 AUX -> (ret=3D  1) 00
[   51.909812] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX A/DDI A/PHY A: 0x00201 AUX -> (ret=3D  1) 00
[   51.909880] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:262:eDP-1] probed modes:
[   51.909885] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "3840x2400": 60 605000 3840 3888 3920 4000 2400 2403 2408=
 2520 0x48 0xa
[   51.909891] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:271:DP-1]
[   51.909896] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:2=
71:DP-1]
[   51.911027] i915 0000:00:02.0: [drm:intel_power_well_disable [i915]] dis=
abling AUX_TC3
[   51.915011] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:271:DP-1] disconnected
[   51.915017] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:283:HDMI-A-1]
[   51.915022] i915 0000:00:02.0: [drm:intel_hdmi_detect [i915]] [CONNECTOR=
:283:HDMI-A-1]
[   51.920011] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:283:HDMI-A-1] disconnected
[   51.920016] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:289:DP-2]
[   51.920019] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:2=
89:DP-2]
[   51.920221] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:289:DP-2] disconnected
[   51.920226] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:298:DP-3]
[   51.920230] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:2=
98:DP-3]
[   51.920414] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:298:DP-3] disconnected
[   51.920418] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:307:DP-4]
[   51.920421] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:3=
07:DP-4]
[   51.920580] i915 0000:00:02.0: [drm:intel_power_well_enable [i915]] enab=
ling AUX_TC3
[   51.922355] i915 0000:00:02.0: [drm:drm_dp_dpcd_probe [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0xf0000 AUX -> (ret=3D  1) 20
[   51.923047] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00000 AUX -> (ret=3D 15) 12 14 c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.923796] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02200 AUX -> (ret=3D 15) 14 1e c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.923807] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: Base DPCD: 12 14 c4 81 01 1d 01 c4 6a 3f=
 04 00 00 00 84
[   51.923821] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: DPCD: 14 1e c4 81 01 1d 01 c4 6a 3f 04 0=
0 00 00 84
[   51.924578] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xf0000 AUX -> (ret=3D  8) 20 1e 80 aa 04 00 =
01 03
[   51.924590] i915 0000:00:02.0: [drm:intel_dp_init_lttpr_and_dprx_caps [i=
915]] [CONNECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][DPRX] LTTPR common =
capabilities: 20 1e 80 aa 04 00 01 03
[   51.925170] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xf0020 AUX -> (ret=3D  3) 04 03 00
[   51.925182] i915 0000:00:02.0: [drm:intel_dp_init_lttpr_and_dprx_caps [i=
915]] [CONNECTOR:307:DP-4][ENCODER:306:DDI TC3/PHY TC3][LTTPR 1] PHY capabi=
lities: 04 03 00
[   51.926031] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xf003d AUX -> (ret=3D 12) 98 4f ee 42 52 00 =
00 00 00 b1 04 09
[   51.926043] i915 0000:00:02.0: [drm:drm_dp_dump_desc [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: LTTPR 1: OUI 98-4f-ee dev-ID BR HW-rev 11.1 S=
W-rev 4.9 quirks 0x0000
[   51.926802] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00000 AUX -> (ret=3D 15) 12 14 c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.927531] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02200 AUX -> (ret=3D 15) 14 1e c4 81 01 1d =
01 c4 6a 3f 04 00 00 00 84
[   51.927541] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: Base DPCD: 12 14 c4 81 01 1d 01 c4 6a 3f=
 04 00 00 00 84
[   51.927552] i915 0000:00:02.0: [drm:drm_dp_read_dpcd_caps [drm_display_h=
elper]] AUX USBC3/DDI TC3/PHY TC3: DPCD: 14 1e c4 81 01 1d 01 c4 6a 3f 04 0=
0 00 00 84
[   51.928297] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00500 AUX -> (ret=3D 12) 90 cc 24 53 59 4e =
41 93 22 10 09 03
[   51.928308] i915 0000:00:02.0: [drm:drm_dp_dump_desc [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: DP branch: OUI 90-cc-24 dev-ID SYNA\223" HW-r=
ev 1.0 SW-rev 9.3 quirks 0x0028
[   51.928731] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02210 AUX -> (ret=3D  1) fa
[   51.929149] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00200 AUX -> (ret=3D  1) 01
[   51.929894] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00080 AUX -> (ret=3D 16) 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00
[   51.929905] i915 0000:00:02.0: [drm:drm_dp_read_downstream_info [drm_dis=
play_helper]] AUX USBC3/DDI TC3/PHY TC3: DPCD DFP: 00 00 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00
[   51.930332] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00021 AUX -> (ret=3D  1) 21
[   51.930343] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [ENCODER:306=
:DDI TC3/PHY TC3] MST support: port: yes, sink: MST, modparam: yes -> enabl=
e: MST
[   51.930871] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00111 AUX -> (ret=3D  1) 07
[   51.931290] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.931694] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0023 AUX -> (ret=3D  1) cf
[   51.932355] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00070 AUX -> (ret=3D  2) 00 00
[   51.933033] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x000b0 AUX -> (ret=3D  7) 07 1c 00 00 00 00 =
00
[   51.933041] i915 0000:00:02.0: [drm:intel_psr_init_dpcd [i915]] Panel re=
play selective_update is supported by panel
[   51.933589] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x000b1 AUX -> (ret=3D  1) 1c
[   51.934328] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00060 AUX -> (ret=3D 16) 03 21 00 14 0b 04 =
03 c0 01 17 0e e2 08 00 00 00
[   51.934335] i915 0000:00:02.0: [drm:intel_dp_get_dsc_sink_cap [i915]] DS=
C DPCD: 03 21 00 14 0b 04 03 c0 01 17 0e e2 08 00 00 00
[   51.934840] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00090 AUX -> (ret=3D  1) ff
[   51.934847] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] FEC CAPABILI=
TY: ff
[   51.935331] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02214 AUX -> (ret=3D  1) 03
[   51.935340] i915 0000:00:02.0: [drm:intel_dp_print_rates [i915]] source =
rates: 162000, 216000, 243000, 270000, 324000, 432000, 540000, 675000, 8100=
00, 1000000, 2000000
[   51.935425] i915 0000:00:02.0: [drm:intel_dp_print_rates [i915]] sink ra=
tes: 162000, 270000, 540000, 810000
[   51.935508] i915 0000:00:02.0: [drm:intel_dp_print_rates [i915]] common =
rates: 162000, 270000, 540000, 810000
[   51.935588] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:307:DP-4] disconnected
[   51.935591] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:316:DP-5]
[   51.935593] i915 0000:00:02.0: [drm:intel_dp_detect [i915]] [CONNECTOR:3=
16:DP-5]
[   51.940045] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:316:DP-5] disconnected
[   51.940048] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:324:DP-6]
[   51.940052] i915 0000:00:02.0: [drm:drm_dp_mst_topology_get_port_validat=
ed [drm_display_helper]] port 000000003f2314f0 (2)
[   51.940064] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_port [drm_di=
splay_helper]] port 000000003f2314f0 (1)
[   51.940071] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:324:DP-6] disconnected
[   51.940073] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:328:DP-7]
[   51.940075] i915 0000:00:02.0: [drm:drm_dp_mst_topology_get_port_validat=
ed [drm_display_helper]] port 00000000301cacad (2)
[   51.940081] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_port [drm_di=
splay_helper]] port 00000000301cacad (1)
[   51.940087] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:328:DP-7] disconnected
[   51.940089] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:330:DP-8]
[   51.940091] i915 0000:00:02.0: [drm:drm_dp_mst_topology_get_port_validat=
ed [drm_display_helper]] port 00000000b206c260 (2)
[   51.940096] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_port [drm_di=
splay_helper]] port 00000000b206c260 (1)
[   51.940101] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:330:DP-8] disconnected
[   51.940103] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:332:DP-9]
[   51.940106] i915 0000:00:02.0: [drm:drm_dp_mst_topology_get_port_validat=
ed [drm_display_helper]] port 000000007aaabdfc (2)
[   51.940111] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_port [drm_di=
splay_helper]] port 000000007aaabdfc (1)
[   51.940117] i915 0000:00:02.0: [drm:drm_dp_mst_topology_get_port_validat=
ed [drm_display_helper]] port 000000007aaabdfc (2)
[   51.940126] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000029fe17b5 (2)
[   51.940136] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] txmsg cur_offset=3D0 cur_len=3D8 seqno=3D0 state=3DQUEUED p=
ath_msg=3D0 dst=3D00:03
[   51.940146] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 	type=3DREMOTE_I2C_READ contents:
[   51.940153] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 		port=3D3 num_tx=3D1 id=3D80 size=3D1:
[   51.940160] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 			0: id=3D080 size=3D001 no_stop_bit=3D0 tx_delay=3D000: 00
[   51.940911] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x01000 AUX <- (ret=3D 13) 21 30 09 c5 22 31=
 50 01 00 10 50 01 66
[   51.942920] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.943301] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.943785] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] got hpd i=
rq on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.944394] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.944820] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.944832] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   51.945722] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 05 c6 22 03 =
01 00 58 00 00 00 00 00 00 00
[   51.945736] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000029fe17b5 (3)
[   51.945753] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000029fe17b5 (2)
[   51.945868] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000029fe17b5 (1)
[   51.945895] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000029fe17b5 (2)
[   51.945911] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] txmsg cur_offset=3D0 cur_len=3D8 seqno=3D0 state=3DQUEUED p=
ath_msg=3D0 dst=3D00:03
[   51.945926] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 	type=3DREMOTE_I2C_READ contents:
[   51.945934] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 		port=3D3 num_tx=3D1 id=3D80 size=3D128:
[   51.945941] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 			0: id=3D080 size=3D001 no_stop_bit=3D0 tx_delay=3D000: 00
[   51.946204] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   51.946949] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x01000 AUX <- (ret=3D 13) 21 30 09 c5 22 31=
 50 01 00 10 50 80 5c
[   51.947398] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.947811] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.947821] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   51.948388] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.948937] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.949286] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   51.949411] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.949713] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.950126] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.950135] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   51.951008] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 2c 8c 22 03 =
80 00 ff ff ff ff ff ff 00 15
[   51.951017] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000029fe17b5 (3)
[   51.951694] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.952368] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01410 AUX -> (ret=3D 16) c3 28 33 e1 96 ca =
01 31 21 01 04 a5 3c 22 78 fa
[   51.952165] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.953045] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01420 AUX -> (ret=3D 16) d1 15 a9 54 4f a6 =
26 0d 50 54 a1 08 00 81 80 80
[   51.953054] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000029fe17b5 (2)
[   51.953472] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   51.953906] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.954330] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.954337] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   51.954861] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.955290] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   51.955935] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.956280] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.956408] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.956697] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.956702] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   51.957533] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 2c 07 a9 40 =
d1 00 b3 00 81 00 a9 c0 81 c0
[   51.957540] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000029fe17b5 (3)
[   51.958277] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01410 AUX -> (ret=3D 16) 01 01 4d d0 00 a0 =
f0 70 3e 80 30 20 35 00 55 50
[   51.958678] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.959361] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01420 AUX -> (ret=3D 16) 21 00 00 1a 00 00 =
00 ff 00 33 30 30 35 34 31 9a
[   51.959367] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000029fe17b5 (2)
[   51.959148] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.959783] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   51.960214] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.960628] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.960632] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   51.961356] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.961929] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.962282] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   51.962403] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.962693] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.963107] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.963111] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   51.963882] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 2c 07 31 33 =
0a 20 20 20 20 00 00 00 fd 00
[   51.963886] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000029fe17b5 (3)
[   51.964692] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.965355] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01410 AUX -> (ret=3D 16) 1d 3d 1f 86 36 01 =
0a 20 20 20 20 20 20 00 00 00
[   51.965167] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.966027] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01420 AUX -> (ret=3D 16) fc 00 45 56 32 37 =
34 30 58 0a 20 20 20 20 20 63
[   51.966032] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000029fe17b5 (2)
[   51.966445] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   51.966882] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.967283] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.967286] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   51.967732] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.968130] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   51.968942] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.969613] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.969413] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.970024] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.970028] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   51.970800] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 03 40 01 14 =
a7 00 00 00 00 00 00 00 00 00
[   51.970804] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000029fe17b5 (3)
[   51.970808] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000029fe17b5 (2)
[   51.970963] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000029fe17b5 (1)
[   51.970991] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000029fe17b5 (2)
[   51.971012] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] txmsg cur_offset=3D0 cur_len=3D8 seqno=3D0 state=3DQUEUED p=
ath_msg=3D0 dst=3D00:03
[   51.971019] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 	type=3DREMOTE_I2C_READ contents:
[   51.971024] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 		port=3D3 num_tx=3D1 id=3D80 size=3D128:
[   51.971028] i915 0000:00:02.0: [drm:drm_dp_queue_down_tx [drm_display_he=
lper]] [dp_mst] 			0: id=3D080 size=3D001 no_stop_bit=3D0 tx_delay=3D000: 80
[   51.971193] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   51.971689] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.972353] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x01000 AUX <- (ret=3D 13) 21 30 09 c5 22 31=
 50 01 80 10 50 80 07
[   51.972161] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.972943] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.973354] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.973358] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   51.973820] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.974519] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   51.974934] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.975283] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.975405] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.975691] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.975695] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   51.976478] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 2c 8c 22 03 =
80 02 03 13 f1 46 10 22 04 03
[   51.976483] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000029fe17b5 (3)
[   51.977219] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01410 AUX -> (ret=3D 16) 02 01 23 09 7f 07 =
83 01 00 00 02 3a 80 18 71 38
[   51.977678] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.978359] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01420 AUX -> (ret=3D 16) 2d 40 58 2c 45 00 =
55 50 21 00 00 1e a3 66 00 a7
[   51.978364] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000029fe17b5 (2)
[   51.978150] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.978781] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   51.979176] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.979608] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.979612] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   51.980051] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.980455] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   51.980937] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.981284] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.981407] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.981697] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.981701] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   51.982484] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 2c 07 a0 f0 =
70 1f 80 30 20 35 00 55 50 21
[   51.982488] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000029fe17b5 (3)
[   51.983223] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01410 AUX -> (ret=3D 16) 00 00 1a 56 5e 00 =
a0 a0 a0 29 50 30 20 35 00 55
[   51.983671] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.984087] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.984363] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01420 AUX -> (ret=3D 16) 50 21 00 00 1a 00 =
00 00 00 00 00 00 00 00 00 92
[   51.984367] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000029fe17b5 (2)
[   51.984793] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   51.985193] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.985622] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.985626] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   51.986055] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.986479] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   51.986955] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.987317] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.987365] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.987725] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.987728] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   51.988510] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 2c 07 00 00 =
00 00 00 00 00 00 00 00 00 00
[   51.988515] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000029fe17b5 (3)
[   51.989244] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01410 AUX -> (ret=3D 16) 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00
[   51.989691] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.990101] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.990355] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01420 AUX -> (ret=3D 16) 00 00 00 00 00 00 =
00 00 00 00 00 00 00 00 00 00
[   51.990359] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000029fe17b5 (2)
[   51.990788] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   51.991226] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.991640] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.991644] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   51.992358] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.992933] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.993286] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   51.993345] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.993695] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 10 00
[   51.994352] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.994356] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 10 00 00
[   51.995076] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x01400 AUX -> (ret=3D 16) 20 30 03 40 00 29 =
58 00 00 00 00 00 00 00 00 00
[   51.995080] i915 0000:00:02.0: [drm:drm_dp_mst_topology_try_get_mstb [dr=
m_display_helper]] mstb 0000000029fe17b5 (3)
[   51.995085] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000029fe17b5 (2)
[   51.995089] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_mstb [drm_di=
splay_helper]] mstb 0000000029fe17b5 (2)
[   51.995099] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_port [drm_di=
splay_helper]] port 000000007aaabdfc (1)
[   51.995106] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:332:DP-9] Assigning EDID-1.4 digital sink color depth as 8 bpc.
[   51.995110] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:332:DP-9] ELD monitor EV2740X
[   51.995110] i915 0000:00:02.0: [drm:update_display_info.part.0] [CONNECT=
OR:332:DP-9] ELD size 32, SAD count 1
[   51.995174] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 47 for 64 timeslots total bw 25920000 pixel clock 5=
48463
[   51.995239] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 95 for 64 timeslots total bw 25920000 pixel clock 2=
70246
[   51.995292] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 104 for 64 timeslots total bw 25920000 pixel clock =
248389
[   51.995341] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 130 for 64 timeslots total bw 25920000 pixel clock =
198763
[   51.995387] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 169 for 64 timeslots total bw 25920000 pixel clock =
152736
[   51.995431] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 169 for 64 timeslots total bw 25920000 pixel clock =
152736
[   51.995473] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 169 for 64 timeslots total bw 25920000 pixel clock =
152584
[   51.995517] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 339 for 64 timeslots total bw 25920000 pixel clock =
76368
[   51.995559] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 339 for 64 timeslots total bw 25920000 pixel clock =
76292
[   51.995602] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 155 for 64 timeslots total bw 25920000 pixel clock =
166621
[   51.995644] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 172 for 64 timeslots total bw 25920000 pixel clock =
150422
[   51.995686] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 233 for 64 timeslots total bw 25920000 pixel clock =
111081
[   51.995728] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 233 for 64 timeslots total bw 25920000 pixel clock =
111081
[   51.995771] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 301 for 64 timeslots total bw 25920000 pixel clock =
85882
[   51.995815] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 339 for 64 timeslots total bw 25920000 pixel clock =
76368
[   51.995686] i915 0000:00:02.0: [drm:icp_irq_handler [i915]] hotplug even=
t received, stat 0x04000000, dig 0x00008988, pins 0x00000800, long 0x000000=
00
[   51.995859] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 339 for 64 timeslots total bw 25920000 pixel clock =
76368
[   51.995900] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 339 for 64 timeslots total bw 25920000 pixel clock =
76292
[   51.995941] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 387 for 64 timeslots total bw 25920000 pixel clock =
66854
[   51.995982] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 630 for 64 timeslots total bw 25920000 pixel clock =
41141
[   51.996021] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 10 00 00
[   51.996026] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 932 for 64 timeslots total bw 25920000 pixel clock =
27798
[   51.996067] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 932 for 64 timeslots total bw 25920000 pixel clock =
27798
[   51.996107] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 933 for 64 timeslots total bw 25920000 pixel clock =
27770
[   51.996146] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 933 for 64 timeslots total bw 25920000 pixel clock =
27770
[   51.996185] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 1000 for 64 timeslots total bw 25920000 pixel clock=
 25918
[   51.996052] i915 0000:00:02.0: [drm:intel_hpd_irq_handler [i915]] digita=
l hpd on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.996223] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 1001 for 64 timeslots total bw 25920000 pixel clock=
 25893
[   51.996260] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 1001 for 64 timeslots total bw 25920000 pixel clock=
 25893
[   51.996300] i915 0000:00:02.0: [drm:intel_dp_dsc_get_max_compressed_bpp =
[i915]] Max link bpp is 889 for 64 timeslots total bw 25920000 pixel clock =
29127
[   51.996339] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:332:DP-9] probed modes:
[   51.996342] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "3840x2160": 60 533250 3840 3888 3920 4000 2160 2163 2168=
 2222 0x48 0x9
[   51.996344] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "3840x2160": 30 262750 3840 3888 3920 4000 2160 2163 2168=
 2191 0x40 0x9
[   51.996345] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "2560x1440": 60 241500 2560 2608 2640 2720 1440 1443 1448=
 1481 0x40 0x9
[   51.996347] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1920x1200": 60 193250 1920 2056 2256 2592 1200 1203 1209=
 1245 0x40 0x6
[   51.996348] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1920x1080": 60 148500 1920 2008 2052 2200 1080 1084 1089=
 1125 0x40 0x5
[   51.996349] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1920x1080": 60 148500 1920 2008 2052 2200 1080 1084 1089=
 1125 0x40 0x5
[   51.996350] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1920x1080": 60 148352 1920 2008 2052 2200 1080 1084 1089=
 1125 0x40 0x5
[   51.996352] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1920x1080": 30 74250 1920 2008 2052 2200 1080 1084 1089 =
1125 0x40 0x5
[   51.996353] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1920x1080": 30 74176 1920 2008 2052 2200 1080 1084 1089 =
1125 0x40 0x5
[   51.996354] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1600x1200": 60 162000 1600 1664 1856 2160 1200 1201 1204=
 1250 0x40 0x5
[   51.996355] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1680x1050": 60 146250 1680 1784 1960 2240 1050 1053 1059=
 1089 0x40 0x6
[   51.996356] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1600x900": 60 108000 1600 1624 1704 1800 900 901 904 100=
0 0x40 0x5
[   51.996358] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1280x1024": 60 108000 1280 1328 1440 1688 1024 1025 1028=
 1066 0x40 0x5
[   51.996359] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1280x800": 60 83500 1280 1352 1480 1680 800 803 809 831 =
0x40 0x6
[   51.996360] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1280x720": 60 74250 1280 1390 1430 1650 720 725 730 750 =
0x40 0x5
[   51.996362] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1280x720": 60 74250 1280 1390 1430 1650 720 725 730 750 =
0x40 0x5
[   51.996363] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1280x720": 60 74176 1280 1390 1430 1650 720 725 730 750 =
0x40 0x5
[   51.996364] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "1024x768": 60 65000 1024 1048 1184 1344 768 771 777 806 =
0x40 0xa
[   51.996365] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "800x600": 60 40000 800 840 968 1056 600 601 605 628 0x40=
 0x5
[   51.996366] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "720x480": 60 27027 720 736 798 858 480 489 495 525 0x40 =
0xa
[   51.996368] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "720x480": 60 27027 720 736 798 858 480 489 495 525 0x40 =
0xa
[   51.996369] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "720x480": 60 27000 720 736 798 858 480 489 495 525 0x40 =
0xa
[   51.996370] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "720x480": 60 27000 720 736 798 858 480 489 495 525 0x40 =
0xa
[   51.996371] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "640x480": 60 25200 640 656 752 800 480 490 492 525 0x40 =
0xa
[   51.996372] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "640x480": 60 25175 640 656 752 800 480 490 492 525 0x40 =
0xa
[   51.996374] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "640x480": 60 25175 640 656 752 800 480 490 492 525 0x40 =
0xa
[   51.996375] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] Probed mode: "720x400": 70 28320 720 738 846 900 400 412 414 449 0x40 =
0x6
[   51.996377] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:334:DP-10]
[   51.996380] i915 0000:00:02.0: [drm:drm_dp_mst_topology_get_port_validat=
ed [drm_display_helper]] port 00000000b77874b4 (2)
[   51.996385] i915 0000:00:02.0: [drm:drm_dp_mst_topology_put_port [drm_di=
splay_helper]] port 00000000b77874b4 (1)
[   51.996390] i915 0000:00:02.0: [drm:drm_helper_probe_single_connector_mo=
des] [CONNECTOR:334:DP-10] disconnected
[   51.996391] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:262:eDP-1] enabled? yes
[   51.996394] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:271:DP-1] enabled? no
[   51.996395] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:283:HDMI-A-1] enabled? no
[   51.996396] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:289:DP-2] enabled? no
[   51.996397] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:298:DP-3] enabled? no
[   51.996398] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:307:DP-4] enabled? no
[   51.996399] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:316:DP-5] enabled? no
[   51.996401] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:324:DP-6] enabled? no
[   51.996401] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:328:DP-7] enabled? no
[   51.996403] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:330:DP-8] enabled? no
[   51.996404] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:332:DP-9] enabled? yes
[   51.996405] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:334:DP-10] enabled? no
[   51.996409] i915 0000:00:02.0: [drm:drm_client_modeset_probe] Not using =
firmware configuration
[   51.996410] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:262:eDP-1] found preferred mode: 3840x2400
[   51.996412] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CONNECTOR=
:332:DP-9] found preferred mode: 3840x2160
[   51.996413] i915 0000:00:02.0: [drm:drm_client_modeset_probe] picking CR=
TCs for 3840x2400 config
[   51.996415] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CRTC:88:p=
ipe A] desired mode 3840x2400 set (0,0)
[   51.996417] i915 0000:00:02.0: [drm:drm_client_modeset_probe] [CRTC:145:=
pipe B] desired mode 3840x2160 set (0,0)
[   51.996423] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.996867] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 20
[   51.996871] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 20
[   51.997293] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0xe0025 AUX -> (ret=3D  1) 10
[   51.997712] i915 0000:00:02.0: [drm:drm_dp_dpcd_write [drm_display_helpe=
r]] AUX USBC3/DDI TC3/PHY TC3: 0x02003 AUX <- (ret=3D  3) 00 00 20
[   51.998147] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.998552] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.998556] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 00
[   51.998599] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] got hpd i=
rq on [ENCODER:306:DDI TC3/PHY TC3] - short
[   51.999017] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02002 AUX -> (ret=3D  3) 01 00 00
[   51.999452] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x02005 AUX -> (ret=3D  1) 00
[   51.999455] i915 0000:00:02.0: [drm:intel_dp_hpd_pulse [i915]] DPRX ESI:=
 01 00 00 00
[   52.006260] nvidia 0000:01:00.0: Enabling HDA controller
[   52.007348] i915 0000:00:02.0: [drm:drm_client_hotplug] fbdev: ret=3D0
[   52.022017] i915 0000:00:02.0: [drm:intel_power_well_disable [i915]] dis=
abling AUX_TC3
[   52.345459] usb 6-1.4.3: new SuperSpeed Plus Gen 2x1 USB device number 4=
 using xhci_hcd
[   52.364360] usb 6-1.4.3: New USB device found, idVendor=3D17ef, idProduc=
t=3D3112, bcdDevice=3D 2.b3
[   52.364369] usb 6-1.4.3: New USB device strings: Mfr=3D1, Product=3D2, S=
erialNumber=3D0
[   52.364372] usb 6-1.4.3: Product: Lenovo Dock - USB3 Hub2
[   52.364375] usb 6-1.4.3: Manufacturer: Lenovo                =20
[   52.366390] hub 6-1.4.3:1.0: USB hub found
[   52.366934] hub 6-1.4.3:1.0: 4 ports detected
[   52.440236] usb 6-1.4.4: new SuperSpeed USB device number 5 using xhci_h=
cd
[   52.453257] usb 6-1.4.4: New USB device found, idVendor=3D0bda, idProduc=
t=3D8156, bcdDevice=3D31.21
[   52.453264] usb 6-1.4.4: New USB device strings: Mfr=3D1, Product=3D2, S=
erialNumber=3D6
[   52.453267] usb 6-1.4.4: Product: USB 10/100/1G/2.5G LAN
[   52.453269] usb 6-1.4.4: Manufacturer: Realtek
[   52.453271] usb 6-1.4.4: SerialNumber: 1213001E4E
[   52.554189] usbcore: registered new device driver r8152-cfgselector
[   52.623467] r8152-cfgselector 6-1.4.4: reset SuperSpeed USB device numbe=
r 5 using xhci_hcd
[   52.694309] r8152 6-1.4.4:1.0 eth0: v1.12.13
[   52.694352] usbcore: registered new interface driver r8152
[   52.716845] usbcore: registered new interface driver cdc_ether
[   52.722347] usbcore: registered new interface driver cdc_ncm
[   52.725868] usbcore: registered new interface driver cdc_wdm
[   52.735602] usbcore: registered new interface driver cdc_mbim
[   52.829815] r8152 6-1.4.4:1.0 enp177s0u1u4u4: renamed from eth0
[   52.975130] i915 0000:00:02.0: [drm:intel_tc_port_update_mode [i915]] Po=
rt G/TC#4: TC port mode reset (legacy -> disconnected)
[   52.975159] i915 0000:00:02.0: [drm:intel_tc_port_update_mode [i915]] Po=
rt E/TC#2: TC port mode reset (tbt-alt -> disconnected)
[   52.975170] i915 0000:00:02.0: [drm:intel_tc_port_update_mode [i915]] Po=
rt D/TC#1: TC port mode reset (tbt-alt -> disconnected)
[   53.742080] i915 0000:00:02.0: [drm:intel_power_well_enable [i915]] enab=
ling AUX_TC3
[   53.743723] i915 0000:00:02.0: [drm:drm_dp_dpcd_read [drm_display_helper=
]] AUX USBC3/DDI TC3/PHY TC3: 0x00202 AUX -> (ret=3D  6) 77 77 01 00 11 11
[   53.846076] i915 0000:00:02.0: [drm:intel_power_well_disable [i915]] dis=
abling AUX_TC3
[   54.445941] i915 0000:00:02.0: [drm:intel_pps_vdd_off_sync_unlocked [i91=
5]] [ENCODER:261:DDI A/PHY A] PPS 0 turning VDD off
[   54.446179] i915 0000:00:02.0: [drm:intel_pps_vdd_off_sync_unlocked [i91=
5]] [ENCODER:261:DDI A/PHY A] PPS 0 PP_STATUS: 0x80000008 PP_CONTROL: 0x000=
00067
[   61.612229] ucsi_acpi USBC000:00: ucsi_handle_connector_change: GET_CONN=
ECTOR_STATUS failed (-110)

--iw2z5iatikzpq2dr--

--xzk6xrf376ixmd6p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iNUEABYKAH0WIQQFx3danouXdAf+COadTFqhVCbaCgUCaQiLal8UgAAAAAAuAChp
c3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9yc2VtYW4ubmV0MDVD
Nzc3NUE5RThCOTc3NDA3RkUwOEU2OUQ0QzVBQTE1NDI2REEwQQAKCRCdTFqhVCba
CvXaAP40SO8aPDnTEqk5s5ogogHD5P328t6CsDASZEmtmFwAcgD/XO7c/fPbBF59
ILhF98Cy/17NGL03pQPD05g2ukrf/A8=
=Bwpr
-----END PGP SIGNATURE-----

--xzk6xrf376ixmd6p--

