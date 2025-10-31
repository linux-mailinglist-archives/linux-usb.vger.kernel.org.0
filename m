Return-Path: <linux-usb+bounces-29946-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 12E04C24E5C
	for <lists+linux-usb@lfdr.de>; Fri, 31 Oct 2025 13:00:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id F17F24F2876
	for <lists+linux-usb@lfdr.de>; Fri, 31 Oct 2025 12:00:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14B481C28E;
	Fri, 31 Oct 2025 12:00:21 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from mx3.univ-lehavre.fr (mx3.univ-lehavre.fr [193.48.167.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B9F11B142D
	for <linux-usb@vger.kernel.org>; Fri, 31 Oct 2025 12:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.48.167.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761912020; cv=none; b=Y1mw7hVPFkZ/MvyK0t3ONBM0nmaeqcG/f8NqnEuZaGBdmLhD4gO/kZseMJNWpkXu0EXSiwP5K28H+6ygchaQ4w5ym1cBjhmGXRSNZ45whnDvJzJQmO4K0n+q17/8F2qTmtnIptU9y+bcrmadpAIvuURv497ppsAzz9zvezcXPeM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761912020; c=relaxed/simple;
	bh=+rEfbmHAIPV11bkMgrYqA5bthvRGbKK4TRHXZadmwf8=;
	h=From:Content-Type:In-Reply-To:References:Date:Cc:To:MIME-Version:
	 Message-ID:Subject; b=K2l1cwdlTUS9MneB/Fmxo3PQ7c3QbM8i2PHsydGXi81JV6gSradzMTxgIx0NCWsffAJ0MxBvlQDZI5YkqaGS/v+nwaFKtX8sZ088DCtT5Fi/aNyuXNdFeOlieuxqGai8V2tkyU2nxdCJc+emDxdV26/HPXM9hXDJIslI/5lw4Tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=univ-lehavre.fr; spf=pass smtp.mailfrom=univ-lehavre.fr; arc=none smtp.client-ip=193.48.167.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=univ-lehavre.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=univ-lehavre.fr
Received: from mx3.univ-lehavre.fr (localhost [127.0.0.1])
	by mx3.univ-lehavre.fr (Postfix) with ESMTP id BA2A99C0ADE;
	Fri, 31 Oct 2025 13:00:13 +0100 (CET)
Authentication-Results: smtp.univ-lehavre.fr; dkim=none; dkim-atps=neutral
Received: from sogo5.univ-lehavre.fr (sogo5.univ-lehavre.fr [193.52.167.134])
	by mx3.univ-lehavre.fr (Postfix) with ESMTP id 7D9C59C034D;
	Fri, 31 Oct 2025 13:00:13 +0100 (CET)
From: "Yanis Srairi" <yanis.srairi@univ-lehavre.fr>
Content-Type: multipart/mixed; boundary="----=_=-_OpenGroupware_org_NGMime-924-1761912013.413979-24------"
In-Reply-To: <20251031113108.GA2912318@black.igk.intel.com>
X-Forward: 127.0.0.1
References: <45a965a4-3b40-b808-5fde-0c9d78c8f492@univ-lehavre.fr>
 <20251031105946.GZ2912318@black.igk.intel.com>
 <926b30e9-00da-c404-53fd-2f7fb4731d5a@univ-lehavre.fr> <20251031113108.GA2912318@black.igk.intel.com>
Date: Fri, 31 Oct 2025 13:00:13 +0100
Cc: linux-usb@vger.kernel.org, andreas.noever@gmail.com, westeri@kernel.org, YehezkelShB@gmail.com
To: "Mika Westerberg" <mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Message-ID: <45db8612-b893-9909-6ffb-9aee4256e471@univ-lehavre.fr>
Subject: =?utf-8?q?Re=3A?= [BUG] Dell Thunderbolt 4 dock not enumerated on cold boot 
 - Intel Core Ultra 7 255H
User-Agent: SOGoMail 5.12.4
X-AV-Checked: ClamAV using ClamSMTP

------=_=-_OpenGroupware_org_NGMime-924-1761912013.413979-24------
Content-Type: multipart/alternative; boundary="----=_=-_OpenGroupware_org_NGMime-924-1761912013.413664-23------"

------=_=-_OpenGroupware_org_NGMime-924-1761912013.413664-23------
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Length: 2799


Hi,
Le Vendredi, Octobre 31, 2025 12:31 CET, Mika Westerberg <mika.westerbe=
rg@linux.intel.com> a =C3=A9crit:
Hi,

On Fri, Oct 31, 2025 at 12:13:58PM +0100, Yanis Srairi wrote:
> Thank you for the quick response!
>=C2=A0
> I've completed the debugging steps:
> 1. Added thunderbolt.dyndbg=3D+p to kernel command line
> 2. Powered off completely
> 3. Connected the dock while powered off
> 4. Booted the system
>=C2=A0
> Attached is the full dmesg output (dmesg.out). As expected, the perip=
herals
> (screen/keyboard/mouse/ethernet) did not work after boot until I unpl=
ugged and
> replugged the dock.
>=C2=A0
> Let me know if you need any additional information.

Thanks for the log. I looks like the USB4 link is not even up which sou=
nds
more like a Power Delivery issue (on the host side) to me. Can you stil=
l
run few more checks?

First after your step 4 above, run this:

https://github.com/intel/tbtools/wiki/Useful-Commands#dump-status-of-al=
l-adapters

and attach the output. Then also run these commands:

# tbdump -r 0 -a 1 -N 1 -vv PORT=5FCS=5F18
# tbdump -r 0 -a 3 -N 1 -vv PORT=5FCS=5F18

and send me that output too. This tells us if the host router sees the =
link
at all. If not then there are few options. One is the cable itself may =
be
bad but Dell docks typically have good cables attached that you even ca=
nnot
change. The other thing is to check if there is firmware upgrade availa=
ble
for the system (e.g the one that contains BIOS and the other integrated
firmwares). This should also contain the PD controller firmwares.

Then one option is to reset the BIOS settings back to defaults just to =
be
sure. From your log the BIOS CM did not create PCIe tunnels so that wou=
ld
indicate that the BIOS itself cannot see the link coming up.

BTW, once it works when you plug the dock runtime, do you see it in

# tblist

output? (tblist is also part of tbtools [1]).

[1] https://github.com/intel/tbtools
=C2=A0
I've completed the additional diagnostics:
1. All firmware is up to date (checked with fwupd):
=C2=A0 - System Firmware=C2=A0
=C2=A0 - USB4 controller
=C2=A0 - PD=C2=A0
=C2=A0 - Dell dock package
2. I've performed a cold boot and collected the requested debug info
=C2=A0 (attached files):
=C2=A0 - tbadapters.txt
=C2=A0 - port1-cs18.txt
=C2=A0 - port3-cs18.txt
3. After hotplug (unplug/replug), the dock works correctly and is
=C2=A0 visible in tblist output (tblist-after-hotplug.txt)
Additional information: The laptop (Dell Pro Max 16), the Dell
Thunderbolt 4 Dock, and the monitor are all brand new.
Regarding BIOS reset: I can try resetting BIOS to defaults if you think
it would help, but I'd prefer to avoid it if the debug info gives you
enough information. Let me know if you want me to try this.
Let me know if you need anything else.

------=_=-_OpenGroupware_org_NGMime-924-1761912013.413664-23------
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Content-Length: 3289

<html><p>Hi,</p><p>Le Vendredi, Octobre 31, 2025 12:31 CET, Mika Wester=
berg &lt;mika.westerberg@linux.intel.com&gt; a =C3=A9crit:</p><blockquo=
te type=3D"cite" cite=3D"20251031113108.GA2912318@black.igk.intel.com">=
<p>Hi,<br><br>On Fri, Oct 31, 2025 at 12:13:58PM +0100, Yanis Srairi wr=
ote:<br>&gt; Thank you for the quick response!<br>&gt;&nbsp;<br>&gt; I'=
ve completed the debugging steps:<br>&gt; 1. Added thunderbolt.dyndbg=3D=
+p to kernel command line<br>&gt; 2. Powered off completely<br>&gt; 3. =
Connected the dock while powered off<br>&gt; 4. Booted the system<br>&g=
t;&nbsp;<br>&gt; Attached is the full dmesg output (dmesg.out). As expe=
cted, the peripherals<br>&gt; (screen/keyboard/mouse/ethernet) did not =
work after boot until I unplugged and<br>&gt; replugged the dock.<br>&g=
t;&nbsp;<br>&gt; Let me know if you need any additional information.<br=
><br>Thanks for the log. I looks like the USB4 link is not even up whic=
h sounds<br>more like a Power Delivery issue (on the host side) to me. =
Can you still<br>run few more checks?<br><br>First after your step 4 ab=
ove, run this:<br><br>https://github.com/intel/tbtools/wiki/Useful-Comm=
ands#dump-status-of-all-adapters<br><br>and attach the output. Then als=
o run these commands:<br><br># tbdump -r 0 -a 1 -N 1 -vv PORT=5FCS=5F18=
<br># tbdump -r 0 -a 3 -N 1 -vv PORT=5FCS=5F18<br><br>and send me that =
output too. This tells us if the host router sees the link<br>at all. I=
f not then there are few options. One is the cable itself may be<br>bad=
 but Dell docks typically have good cables attached that you even canno=
t<br>change. The other thing is to check if there is firmware upgrade a=
vailable<br>for the system (e.g the one that contains BIOS and the othe=
r integrated<br>firmwares). This should also contain the PD controller =
firmwares.<br><br>Then one option is to reset the BIOS settings back to=
 defaults just to be<br>sure. From your log the BIOS CM did not create =
PCIe tunnels so that would<br>indicate that the BIOS itself cannot see =
the link coming up.<br><br>BTW, once it works when you plug the dock ru=
ntime, do you see it in<br><br># tblist<br><br>output? (tblist is also =
part of tbtools [1]).<br><br>[1] https://github.com/intel/tbtools<br>&n=
bsp;</p></blockquote><p>I've completed the additional diagnostics:</p><=
p>1. All firmware is up to date (checked with fwupd):<br>&nbsp; - Syste=
m Firmware&nbsp;<br>&nbsp; - USB4 controller<br>&nbsp; - PD&nbsp;<br>&n=
bsp; - Dell dock package</p><p>2. I've performed a cold boot and collec=
ted the requested debug info<br>&nbsp; (attached files):</p><p>&nbsp; -=
 tbadapters.txt<br>&nbsp; - port1-cs18.txt<br>&nbsp; - port3-cs18.txt</=
p><p>3. After hotplug (unplug/replug), the dock works correctly and is<=
br>&nbsp; visible in tblist output (tblist-after-hotplug.txt)</p><p>Add=
itional information: The laptop (Dell Pro Max 16), the Dell<br>Thunderb=
olt 4 Dock, and the monitor are all brand new.</p><p>Regarding BIOS res=
et: I can try resetting BIOS to defaults if you think<br>it would help,=
 but I'd prefer to avoid it if the debug info gives you<br>enough infor=
mation. Let me know if you want me to try this.</p><p>Let me know if yo=
u need anything else.</p></html>

------=_=-_OpenGroupware_org_NGMime-924-1761912013.413664-23--------

------=_=-_OpenGroupware_org_NGMime-924-1761912013.413979-24------
Content-Type: text/plain
Content-Disposition: attachment; filename="port1-cs18.txt"
Content-Transfer-Encoding: quoted-printable
Content-Length: 841

0x00ae 0x00000410 0b00000000 00000000 00000100 00010000 .... PORT=5FCS=5F=
18    =20
  [00:07]       0x10 Cable USB4 Version
  [08:08]        0x0 Bonding Enabled (BE)
  [09:09]        0x0 TBT3-Compatible Mode (TCM)
  [10:10]        0x1 CLx Protocol Support (CPS)
  [11:11]        0x0 RS-FEC Enabled (Gen 2) (RE2)
  [12:12]        0x0 RS-FEC Enabled (Gen 3) (RE3)
  [13:13]        0x0 Router Detected (RD)
  [16:16]        0x0 Wake on Connect Status
  [17:17]        0x0 Wake on Disconnect Status
  [18:18]        0x0 Wake on USB4 Wake Status
  [19:19]        0x0 Wake on Inter-Domain Status
  [20:20]        0x0 Cable Gen 3 Support (CG3)
  [21:21]        0x0 Cable Gen 4 Support (CG4)
  [22:22]        0x0 Cable Asymmetric Support (CSA)
  [23:23]        0x0 Cable CLx Support (CSC)
  [24:24]        0x0 AsymmetricTransitionInProgress (TIP)


------=_=-_OpenGroupware_org_NGMime-924-1761912013.413979-24------
Content-Type: text/plain
Content-Disposition: attachment; filename="port3-cs18.txt"
Content-Transfer-Encoding: quoted-printable
Content-Length: 841

0x00ae 0x00000410 0b00000000 00000000 00000100 00010000 .... PORT=5FCS=5F=
18    =20
  [00:07]       0x10 Cable USB4 Version
  [08:08]        0x0 Bonding Enabled (BE)
  [09:09]        0x0 TBT3-Compatible Mode (TCM)
  [10:10]        0x1 CLx Protocol Support (CPS)
  [11:11]        0x0 RS-FEC Enabled (Gen 2) (RE2)
  [12:12]        0x0 RS-FEC Enabled (Gen 3) (RE3)
  [13:13]        0x0 Router Detected (RD)
  [16:16]        0x0 Wake on Connect Status
  [17:17]        0x0 Wake on Disconnect Status
  [18:18]        0x0 Wake on USB4 Wake Status
  [19:19]        0x0 Wake on Inter-Domain Status
  [20:20]        0x0 Cable Gen 3 Support (CG3)
  [21:21]        0x0 Cable Gen 4 Support (CG4)
  [22:22]        0x0 Cable Asymmetric Support (CSA)
  [23:23]        0x0 Cable CLx Support (CSC)
  [24:24]        0x0 AsymmetricTransitionInProgress (TIP)


------=_=-_OpenGroupware_org_NGMime-924-1761912013.413979-24------
Content-Type: text/plain
Content-Disposition: attachment; filename="tbadapters.txt"
Content-Transfer-Encoding: quoted-printable
Content-Length: 557

 1: Lane 0                        CLd      =20
 2: Lane 1                        CLd      =20
 3: Lane 0                        CLd      =20
 4: Lane 1                        CLd      =20
 5: DisplayPort IN                Disabled =20
 6: DisplayPort IN                Disabled =20
 7: Host Interface (upstream)     Enabled  =20
 8: PCIe Down                     Disabled =20
 9: PCIe Down                     Disabled =20
10: Not implemented
11: Not implemented
12: USB 3 Down                    Disabled =20
13: USB 3 Down                    Disabled =20


------=_=-_OpenGroupware_org_NGMime-924-1761912013.413979-24------
Content-Type: text/plain
Content-Disposition: attachment; filename="tblist-after-hotplug.txt"
Content-Transfer-Encoding: quoted-printable
Content-Length: 97

Domain 0 Route 0: 8087:7eb2 Intel Gen14
Domain 0 Route 1: 00d4:b0a1 Dell Dell Thunderbolt 4 Dock


------=_=-_OpenGroupware_org_NGMime-924-1761912013.413979-24--------


