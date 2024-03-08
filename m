Return-Path: <linux-usb+bounces-7732-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 543D98765EF
	for <lists+linux-usb@lfdr.de>; Fri,  8 Mar 2024 15:04:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EA132811BA
	for <lists+linux-usb@lfdr.de>; Fri,  8 Mar 2024 14:04:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FF5F3FB80;
	Fri,  8 Mar 2024 14:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d4v2elPw"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 044664086A
	for <linux-usb@vger.kernel.org>; Fri,  8 Mar 2024 14:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709906678; cv=none; b=cLSBCyypwSNtoACx2T2xb1ZYZySScbElcazsIv1MGaD1+rhEIJzUMAqHqVXL6OuYKQVk7Xbjevu/8wczS0N4swTaEodRC46J53cGGd9tyQgY2NR5NqS6lySIzzZz7A0+Zo4Qsb0UwwXnVXfXOlCwnbAUaoMQsy2RF8WMKE0agho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709906678; c=relaxed/simple;
	bh=gf6i8cDQidksLDZJQEfsR2JezU6Lt7Garjdo7I3tknY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=sIzrnhtaGJG91gokdYSiHB40sqA5WKvAD3ZXM/tBzwJVWWc4EXMOAkv7tmfAizZKh+gZP+S+Pp7byk0hsa+Qzs+EsM40RGVQUx944fqx0s5DQrfSt653H2dmOLe/wjxvwuxsx16vSJwXo+Ik24sso1+VmIU8j0kYNhU/Fk7XIaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d4v2elPw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9FCD9C433F1
	for <linux-usb@vger.kernel.org>; Fri,  8 Mar 2024 14:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709906677;
	bh=gf6i8cDQidksLDZJQEfsR2JezU6Lt7Garjdo7I3tknY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=d4v2elPwWHuMDrVU7eBri0pyhPeOrgh0lx5OHhLZKv7+coxUE5k6kEkj70JnsMAOR
	 zXeimk+zL+K+Vocys8rK/LxWwg/ZtXZt6iLt56NKGjhLi0FgTc6TF3cBWogicMduIF
	 OFGvXMfAXRV5hfCvibUyVMkTXMkpP/jEz7Ml0ZkxyI04ITisojfMq1gCt/1zUGgBSk
	 xREStfLLNxEslrlKLXKNS6cJB81wBNoxCAsZI7GBipVnceNDsR8DbkRS0WgD6Vd71C
	 8nRR/42L/3TPhlqtnJyY2D+KbDj6vzsOgSIcm4x+iD2CzeSnzCj3assY8FkUH6KN3G
	 Pt8xNXuGrF9Zw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 87322C53BD0; Fri,  8 Mar 2024 14:04:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218544] not enough bandwidth, synaptics hi-res audio duplex
 audio
Date: Fri, 08 Mar 2024 14:04:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ibmalone@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218544-208809-0fwafq1eKm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218544-208809@https.bugzilla.kernel.org/>
References: <bug-218544-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218544

--- Comment #12 from Ian Malone (ibmalone@gmail.com) ---
Okay, I think we may have reached a dead end. Using wireplumber (creating r=
ules
in ~/.config/wireplumber/main.lua.d) it's possible to manipulate the audio
formats that pipewire will use for a device, so I can independently request=
 the
16 bit mode for the input and output streams. The bandwidth profiles for th=
ose
are as follows (wMaxPacketSize is for the in/out interface descriptor with =
the
corresponding bBitResolution as reported by lsusb -v):

in (48kHz)
16bit, expected wMaxpacket size 192bytes
bandwidth: 1-1.1 ep 81:   159 @  0.2+1 mask f004
uframes 125  34

24bit, expected wMaxPacketSize 288bytes
bandwidth: 1-1.1 ep 81:   234 @  0.2+1 mask f004
uframes 125 109

out (48kHz)
16bit, expected wMaxPacketSize 768bytes (?!)
bandwidth: 1-1.1 ep 01:   608 @  0.1+1 mask 003e
uframes 125 125 125 125 108

24bit, expected wMaxPacketSize 458bytes
bandwidth: 1-1.1 ep 01:   458 @  0.2+1 mask 003c
uframes 125 125 125  83

There's also the HID endpoint (unbinding doesn't seem to remove the bandwid=
th
usage) expected wMaxPacketSize 35bytes:
1-1.1 ep 84:    39 @  0.0+1 mask 1c01

The bandwidth to wMaxPacketSize ratio is approximately the same for all str=
eams
(1.2-1.3, 1.11 for the HID I guess slightly different overheads).

Following the rules that ehci-sched.c sets out, this can't be met:
max_tt_usecs[] =3D { 125, 125, 125, 125, 125, 125, 30, 0 };
and:
/* special case for isoc transfers larger than 125us:
 * the first and each subsequent fully used uframe
 * must be empty, so as to not illegally delay
 * already scheduled transactions
 */

The minimum bandwidth configuration is:
out(24b) 125 125 125  83
in (16b) 125  34
hid      39

And there is no way to block them such that 30 in microframe 7 isn't exceed=
ed.
125 125 125  83 125  34 39 0 etc.

Unless it's legal to schedule the hid into microframe 6 after the audio inp=
ut
as its final microframe is not fully used?


A final point of interest is 16bit output, wMaxPacketSize 768bytes. 24 bit
output has allowed frequencies 44.1kHz, 48kHz, 96kHz, 2 channels. 16 bit has
8kHz, 16kHz, 32kHz, 441.kHz, 48kHz, 96kHz. Input 24 and 16 bit have only 48=
kHz
and 44.1kHz, 2 channels.
wMaxPacketSize / (Max sampling frequency * sample bytes * channels )
in16b  192 / (48kHz * 2 * 2) =3D 1ms
in24b  288 / (48kHz * 3 * 2) =3D 1ms
out16b 768 / (96kHz * 2 * 2) =3D 2ms
out24b 576 / (96kHz * 3 * 2) =3D 1ms

Out 16 bit mode claims to accept 2ms packets (but still interval 1). I'm
wondering if this is just an error in the device reported capability (or ma=
ybe
it can buffer?). Do isochronous outputs have to use the full max packet siz=
e?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

