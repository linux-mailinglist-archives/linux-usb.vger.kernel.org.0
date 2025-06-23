Return-Path: <linux-usb+bounces-25014-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C759AE3DD3
	for <lists+linux-usb@lfdr.de>; Mon, 23 Jun 2025 13:23:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CB53018901E9
	for <lists+linux-usb@lfdr.de>; Mon, 23 Jun 2025 11:24:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D8C9241116;
	Mon, 23 Jun 2025 11:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HuvhxMw9"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7DB21F2BAD
	for <linux-usb@vger.kernel.org>; Mon, 23 Jun 2025 11:23:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750677813; cv=none; b=PIgRatXsue1LznoetVCTsgbcdaUXntNVj8UsCU8m5dBQRNeiFEMZgDeNCJW/4NowFUm2++g8XEpsuDwJY8fD09fpY06tEwO3Oo7r47BvMK8W1Ywk9pSlurgvVUVJiQEU9LGsM17NsIdVykcGSJf2ET/fLk91hhkhOXy3VgE7iLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750677813; c=relaxed/simple;
	bh=xysSu/OYzauJzM1hJ0hvMpD2LGAbxBuwFGgin61M0go=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NkR+qo/M0h40wrQd4r2ncn1gs0N+sj6voQMlZ/gGiFrIVWyL/xlXvpKFc18LbWYVUBWXzOh31A2CIc6zfbzKRaG/wzcpzkWVQRPZf1RT9N6vUXO7MRn+cES/3WSIAfkqDSMG7q5vru0Z487yB2b//c/07vLhCunKOLMVA1YmOXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HuvhxMw9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4C3FAC4CEF2
	for <linux-usb@vger.kernel.org>; Mon, 23 Jun 2025 11:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750677813;
	bh=xysSu/OYzauJzM1hJ0hvMpD2LGAbxBuwFGgin61M0go=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HuvhxMw9PR7Yr/+wYDWlA2+pueX/U+RzQU21TlMZ70wMaGWvgIDym/RDRCsSWDJLI
	 IqcZ02x9K4oVgJcRVVl3aRlfwM57/hYcWlljJ/Q71ANxShOiZvssIU1Mp2DPmhe7IQ
	 066A80hgT3IKnn2I+r8xL5VfBjD54F4UJ93LWRugpWoyxulpwuerhXPHELz3zIa74z
	 xRMzzX68ZxCAXpa1/QHY+CswHWjOKYFwr3v8E3QeupKVD8Jnmse1JA7NmGvGngJFGX
	 J7iPgVjbCvfx1tUg5Yi2HqTofwFQltbOV/CpzmnelFxcYndqp2F6H1HlrtdV/oDp3D
	 4bBWU9uBgj+Eg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3C46EC4160E; Mon, 23 Jun 2025 11:23:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220238] Blue Yeti microphone doesn't consistently work after
 unplugging and plugging back in or reboot.
Date: Mon, 23 Jun 2025 11:23:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: fewspotty@protonmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: IMPLEMENTED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220238-208809-maKH6Xoozm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220238-208809@https.bugzilla.kernel.org/>
References: <bug-220238-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

https://bugzilla.kernel.org/show_bug.cgi?id=3D220238

--- Comment #8 from Ryan Walker (fewspotty@protonmail.com) ---
(In reply to oneukum from comment #7)
> On 23.06.25 12:03, bugzilla-daemon@kernel.org wrote:
> > https://bugzilla.kernel.org/show_bug.cgi?id=3D220238
> >=20
> > --- Comment #6 from Ryan Walker (fewspotty@protonmail.com) ---
> > (In reply to Oliver Neukum from comment #3)
> >> It is good that you have found a work around. But you were right. This=
 is
> >> supposed to work.
> >>
> >> Could you please post dmesg of working and non-working cases?
> >=20
> > I emailed you the working state to you directly because it had a MAC
> address
> > in
> > it.
> >=20
>=20
> Hi,
>=20
> are you referring to SerialNumber?
> You could set it to XXX and indicate that you've done so for privacy reas=
ons
> in the public report.
>=20
>       Regards
>               Oliver


Working state (plugged into USB hub):

=E2=9D=AF sudo dmesg
[ 3214.932134] [UFW BLOCK] IN=3Denp5s0 OUT=3D
MAC=3DXX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX:XX SRC=3D192.168.1.254 DST=3D2=
24.0.0.1
LEN=3D36 TOS=3D0x00 PREC=3D0xC0 TTL=3D1 ID=3D36631 DF PROTO=3D2
[ 3221.407072] usb 1-8: USB disconnect, device number 44
[ 3221.407088] usb 1-8.3: USB disconnect, device number 45
[ 3221.407640] usb 1-8.4: cannot submit urb (err =3D -19)
[ 3221.411804] usb 1-8.4: cannot submit urb 0, error -19: no device
[ 3221.415127] usb 1-8.4: USB disconnect, device number 46
[ 3226.902448] usb 1-8: new high-speed USB device number 47 using xhci_hcd
[ 3227.026852] usb 1-8: New USB device found, idVendor=3D05e3, idProduct=3D=
0608,
bcdDevice=3D77.64
[ 3227.026866] usb 1-8: New USB device strings: Mfr=3D0, Product=3D1,
SerialNumber=3D0
[ 3227.026871] usb 1-8: Product: USB2.0 Hub
[ 3227.028627] hub 1-8:1.0: USB hub found
[ 3227.028887] hub 1-8:1.0: 4 ports detected
[ 3227.301471] usb 1-8.3: new full-speed USB device number 48 using xhci_hcd
[ 3227.375737] usb 1-8.3: New USB device found, idVendor=3D0b05, idProduct=
=3D190e,
bcdDevice=3D 2.00
[ 3227.375751] usb 1-8.3: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D3
[ 3227.375756] usb 1-8.3: Product: ASUS USB-BT500
[ 3227.375760] usb 1-8.3: Manufacturer: Realtek
[ 3227.375764] usb 1-8.3: SerialNumber: 00E04C239987
[ 3227.387660] Bluetooth: hci0: RTL: examining hci_ver=3D0a hci_rev=3D000b
lmp_ver=3D0a lmp_subver=3D8761
[ 3227.388677] Bluetooth: hci0: RTL: rom_version status=3D0 version=3D1
[ 3227.388691] Bluetooth: hci0: RTL: loading rtl_bt/rtl8761bu_fw.bin
[ 3227.389462] Bluetooth: hci0: RTL: loading rtl_bt/rtl8761bu_config.bin
[ 3227.389586] Bluetooth: hci0: RTL: cfg_sz 6, total sz 30210
[ 3227.449367] usb 1-8.4: new full-speed USB device number 49 using xhci_hcd
[ 3227.526584] usb 1-8.4: New USB device found, idVendor=3D046d, idProduct=
=3D0ab1,
bcdDevice=3D 4.0a
[ 3227.526600] usb 1-8.4: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D3
[ 3227.526605] usb 1-8.4: Product: Yeti Nano
[ 3227.526609] usb 1-8.4: Manufacturer: Blue Microphones
[ 3227.526612] usb 1-8.4: SerialNumber: 8832D12120041006
[ 3227.537606] Bluetooth: hci0: RTL: fw version 0xdfc6d922
[ 3227.604751] Bluetooth: MGMT ver 1.23
[ 3227.625515] input: Blue Microphones Yeti Nano Consumer Control as
/devices/pci0000:00/0000:00:14.0/usb1/1-8/1-8.4/1-8.4:1.3/0003:046D:0AB1.00=
20/input/input117
[ 3227.676525] input: Blue Microphones Yeti Nano as
/devices/pci0000:00/0000:00:14.0/usb1/1-8/1-8.4/1-8.4:1.3/0003:046D:0AB1.00=
20/input/input118
[ 3227.676580] hid-generic 0003:046D:0AB1.0020: input,hiddev99,hidraw8: USB=
 HID
v1.11 Device [Blue Microphones Yeti Nano] on usb-0000:00:14.0-8.4/input3

~
=E2=9D=AF

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

