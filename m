Return-Path: <linux-usb+bounces-25015-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 182C7AE3DD6
	for <lists+linux-usb@lfdr.de>; Mon, 23 Jun 2025 13:24:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AEE7A188BD3F
	for <lists+linux-usb@lfdr.de>; Mon, 23 Jun 2025 11:25:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 571C323D2B8;
	Mon, 23 Jun 2025 11:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="enk2yaY3"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C600FAD2C
	for <linux-usb@vger.kernel.org>; Mon, 23 Jun 2025 11:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750677881; cv=none; b=i+3cAZQY5UXO54CMfCR/O75gfQe/jTtOpiBSQFbRjN+95tOVzAIQaQ0ueAXlSmM8uvyrcz3aZanMe4iy5cWm0LwwWIteu6SDEKOumHSdgWGDg5jOv2vKbbIITd7yAx0nd9C/OLquAISXV9bIdEGjcIBC0vCUZV9LNBB40K1QWsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750677881; c=relaxed/simple;
	bh=8FpLQjOQ547pvq/cXw5cbgdZFc11TBicNWsSbGk0Jys=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lj32Q0NqVyZZzsGs56v8MKmzD1zHcK7PUcVP+BE84jcgqHgnnCYDPPYYD135dLmJWc6dgpKt2Qght8teNs5GZgzVE5/7dBlakukyEICfMPs/fKJPyLoEoMmZaOIpfplIZGTObSTtlsn73vcg4XCnuKXnrPQ+vDrRhWYo+ruJl54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=enk2yaY3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 470C2C4CEF0
	for <linux-usb@vger.kernel.org>; Mon, 23 Jun 2025 11:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750677881;
	bh=8FpLQjOQ547pvq/cXw5cbgdZFc11TBicNWsSbGk0Jys=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=enk2yaY3FqUmtAanNQgm2buUmfO8ukb0h20wK9ND1p61itpsA+6KvouhLgO6rrD0V
	 RGnbY4AOhj6hq7JW0tmMejBzQyMKF/GP6kNAlduteshuCUFhWMcy97Wsl5eoyG6r0a
	 aU3Hw/ZtLjCElqE7HFSgM4JYUY9YILdEWh8nHd//bKR/PYT1DgyrxFqSxb3qPECDHg
	 lxcp4NPDwFTn3TO4SM0gqqZzZ01stdTiRs+J5qvBj5Z+oqB/3bfPSxntAVMYtDqiJb
	 TZp+ScOjU3YbMPQ2mWm+jAcYK2RVpDadThz25/59GmmgJJGfwW9T35nE6mW2H8ZUF1
	 IMJVIJMKs91FA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 40244C4160E; Mon, 23 Jun 2025 11:24:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220238] Blue Yeti microphone doesn't consistently work after
 unplugging and plugging back in or reboot.
Date: Mon, 23 Jun 2025 11:24:41 +0000
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
Message-ID: <bug-220238-208809-Qdmp2qb9JK@https.bugzilla.kernel.org/>
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

--- Comment #9 from Ryan Walker (fewspotty@protonmail.com) ---
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




dmesg without the USB-A hub. The Blue Yeti mic is plugged directly into a U=
SB-A
port and I unplugged and replugged a few times until it worked. It never wo=
rks
the first time I plug it in directly. It always takes 3 or more tries plugg=
ing
it in.


sudo dmesg[ 4759.516762] usb 1-8: 6:0: failed to get current value for ch 0
(-110)
[ 4763.088699] usb 1-8: 6:0: cannot get min/max values for control 2 (id 6)
[ 4763.108700] usb 1-8: 5:0: failed to get current value for ch 0 (-22)
[ 4763.148698] usb 1-8: 5:0: cannot get min/max values for control 2 (id 5)
[ 4763.149851] usbhid 1-8:1.3: can't add hid device: -71
[ 4763.149919] usbhid 1-8:1.3: probe with driver usbhid failed with error -=
71
[ 4763.149966] usb 1-8: USB disconnect, device number 50
[ 4765.038713] usb 1-8: new full-speed USB device number 51 using xhci_hcd
[ 4765.163423] usb 1-8: New USB device found, idVendor=3D046d, idProduct=3D=
0ab1,
bcdDevice=3D 4.0a
[ 4765.163436] usb 1-8: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D3
[ 4765.163439] usb 1-8: Product: Yeti Nano
[ 4765.163442] usb 1-8: Manufacturer: Blue Microphones
[ 4765.163445] usb 1-8: SerialNumber: 8832D12120041006
[ 4767.856621] usb 1-8: 1:1: cannot set freq 48000 to ep 0x1
[ 4767.859615] usb 1-8: 2:1: cannot set freq 48000 to ep 0x82
[ 4767.879616] usb 1-8: 6:0: failed to get current value for ch 0 (-22)
[ 4767.919637] usb 1-8: 6:0: cannot get min/max values for control 2 (id 6)
[ 4767.939614] usb 1-8: 5:0: failed to get current value for ch 0 (-22)
[ 4767.979614] usb 1-8: 5:0: cannot get min/max values for control 2 (id 5)
[ 4767.980733] usbhid 1-8:1.3: can't add hid device: -71
[ 4767.980848] usbhid 1-8:1.3: probe with driver usbhid failed with error -=
71
[ 4767.981031] usb 1-8: USB disconnect, device number 51
[ 4769.045676] usb 1-8: new full-speed USB device number 52 using xhci_hcd
[ 4769.170532] usb 1-8: New USB device found, idVendor=3D046d, idProduct=3D=
0ab1,
bcdDevice=3D 4.0a
[ 4769.170542] usb 1-8: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D3
[ 4769.170544] usb 1-8: Product: Yeti Nano
[ 4769.170547] usb 1-8: Manufacturer: Blue Microphones
[ 4769.170549] usb 1-8: SerialNumber: 8832D12120041006
[ 4770.241646] usb 1-8: 1:1: cannot set freq 48000 to ep 0x1
[ 4770.245590] usb 1-8: 2:1: cannot set freq 48000 to ep 0x82
[ 4770.265595] usb 1-8: 6:0: failed to get current value for ch 0 (-22)
[ 4770.305574] usb 1-8: 6:0: cannot get min/max values for control 2 (id 6)
[ 4770.325584] usb 1-8: 5:0: failed to get current value for ch 0 (-22)
[ 4770.365572] usb 1-8: 5:0: cannot get min/max values for control 2 (id 5)
[ 4770.366662] usbhid 1-8:1.3: can't add hid device: -71
[ 4770.366710] usbhid 1-8:1.3: probe with driver usbhid failed with error -=
71
[ 4770.366763] usb 1-8: USB disconnect, device number 52
[ 4780.470461] usb 1-8: new full-speed USB device number 53 using xhci_hcd
[ 4780.595225] usb 1-8: New USB device found, idVendor=3D046d, idProduct=3D=
0ab1,
bcdDevice=3D 4.0a
[ 4780.595240] usb 1-8: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D3
[ 4780.595245] usb 1-8: Product: Yeti Nano
[ 4780.595249] usb 1-8: Manufacturer: Blue Microphones
[ 4780.595253] usb 1-8: SerialNumber: 8832D12120041006
[ 4782.501428] usb 1-8: 1:1: cannot set freq 48000 to ep 0x1
[ 4782.504377] usb 1-8: 2:1: cannot set freq 48000 to ep 0x82
[ 4782.524372] usb 1-8: 6:0: failed to get current value for ch 0 (-22)
[ 4782.564364] usb 1-8: 6:0: cannot get min/max values for control 2 (id 6)
[ 4782.584473] usb 1-8: 5:0: failed to get current value for ch 0 (-22)
[ 4782.624438] usb 1-8: 5:0: cannot get min/max values for control 2 (id 5)
[ 4782.625659] usbhid 1-8:1.3: can't add hid device: -71
[ 4782.625709] usbhid 1-8:1.3: probe with driver usbhid failed with error -=
71
[ 4782.625746] usb 1-8: USB disconnect, device number 53
[ 4783.217486] usb 1-8: new full-speed USB device number 54 using xhci_hcd
[ 4783.342170] usb 1-8: New USB device found, idVendor=3D046d, idProduct=3D=
0ab1,
bcdDevice=3D 4.0a
[ 4783.342185] usb 1-8: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D3
[ 4783.342190] usb 1-8: Product: Yeti Nano
[ 4783.342194] usb 1-8: Manufacturer: Blue Microphones
[ 4783.342198] usb 1-8: SerialNumber: 8832D12120041006
[ 4783.988415] usb 1-8: 1:1: cannot set freq 48000 to ep 0x1
[ 4783.992172] usb 1-8: 2:1: cannot set freq 48000 to ep 0x82
[ 4784.012333] usb 1-8: 6:0: failed to get current value for ch 0 (-22)
[ 4784.054333] usb 1-8: 6:0: cannot get min/max values for control 2 (id 6)
[ 4784.074333] usb 1-8: 5:0: failed to get current value for ch 0 (-22)
[ 4784.114332] usb 1-8: 5:0: cannot get min/max values for control 2 (id 5)
[ 4784.115555] usbhid 1-8:1.3: can't add hid device: -71
[ 4784.115605] usbhid 1-8:1.3: probe with driver usbhid failed with error -=
71
[ 4784.115643] usb 1-8: USB disconnect, device number 54
[ 4784.627368] usb 1-8: new full-speed USB device number 55 using xhci_hcd
[ 4784.752357] usb 1-8: New USB device found, idVendor=3D046d, idProduct=3D=
0ab1,
bcdDevice=3D 4.0a
[ 4784.752375] usb 1-8: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D3
[ 4784.752384] usb 1-8: Product: Yeti Nano
[ 4784.752391] usb 1-8: Manufacturer: Blue Microphones
[ 4784.752397] usb 1-8: SerialNumber: 8832D12120041006
[ 4785.516321] usb 1-8: 1:1: cannot set freq 48000 to ep 0x1
[ 4785.519319] usb 1-8: 2:1: cannot set freq 48000 to ep 0x82
[ 4785.539308] usb 1-8: 6:0: failed to get current value for ch 0 (-22)
[ 4785.578316] usb 1-8: 6:0: cannot get min/max values for control 2 (id 6)
[ 4785.598424] usb 1-8: 5:0: failed to get current value for ch 0 (-22)
[ 4785.638307] usb 1-8: 5:0: cannot get min/max values for control 2 (id 5)
[ 4785.639440] usbhid 1-8:1.3: can't add hid device: -71
[ 4785.639455] usbhid 1-8:1.3: probe with driver usbhid failed with error -=
71
[ 4785.639499] usb 1-8: USB disconnect, device number 55
[ 4786.080400] usb 1-8: new full-speed USB device number 56 using xhci_hcd
[ 4786.205344] usb 1-8: New USB device found, idVendor=3D046d, idProduct=3D=
0ab1,
bcdDevice=3D 4.0a
[ 4786.205359] usb 1-8: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D3
[ 4786.205363] usb 1-8: Product: Yeti Nano
[ 4786.205367] usb 1-8: Manufacturer: Blue Microphones
[ 4786.205371] usb 1-8: SerialNumber: 8832D12120041006
[ 4786.302696] input: Blue Microphones Yeti Nano Consumer Control as
/devices/pci0000:00/0000:00:14.0/usb1/1-8/1-8:1.3/0003:046D:0AB1.0021/input=
/input122
[ 4786.354610] input: Blue Microphones Yeti Nano as
/devices/pci0000:00/0000:00:14.0/usb1/1-8/1-8:1.3/0003:046D:0AB1.0021/input=
/input123
[ 4786.354802] hid-generic 0003:046D:0AB1.0021: input,hiddev99,hidraw8: USB=
 HID
v1.11 Device [Blue Microphones Yeti Nano] on usb-0000:00:14.0-8/input3

~

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

