Return-Path: <linux-usb+bounces-23665-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 23675AA80F2
	for <lists+linux-usb@lfdr.de>; Sat,  3 May 2025 16:01:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 656817AAC6B
	for <lists+linux-usb@lfdr.de>; Sat,  3 May 2025 13:59:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A69583CC7;
	Sat,  3 May 2025 14:01:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UG2jcSaa"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22A1D517
	for <linux-usb@vger.kernel.org>; Sat,  3 May 2025 14:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746280859; cv=none; b=F4MdMRgNpnNFdHJVeVY5+WLolGNpyVz3RBjVzzuRDObhnW9P0v9bhKDWlS6SkwJiyrcb8uCc745oiQy8oQveYaGCvW60AYjtdfsirhufIji2jgobeFXowmCwS9hCR1/Qa3+xowmwdjRdSEtylb0+TIc1wAo1yfxsLoqQkV9J/pI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746280859; c=relaxed/simple;
	bh=uP/+oMORKs706t1e7ZYsw751fD5Ru9oydRuK1ldcDPA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pY1l3bSiXflu1INe6F18eoQn5rYyuUMEMi0R6IcVvXo0riFKIPwk0ukqwJk2n1N+NaEAJZEg5Zw7Yy1aBGydLgwUKLe9b+XrzYNbpJQNer7MQGFmi2q+0Kk9ATCgrGewgIu2NnNmnyG8KOJvWrledH//T2bP5nwjdDopCIraVlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UG2jcSaa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 32F4FC4CEE7
	for <linux-usb@vger.kernel.org>; Sat,  3 May 2025 14:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746280859;
	bh=uP/+oMORKs706t1e7ZYsw751fD5Ru9oydRuK1ldcDPA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UG2jcSaarOSdRaTUder7MEGV5v33/iSFZxnVsgN7HU/To8Q4X6jrd7/cIBPbXXue/
	 OssiqU3uBbGzY2SHzOcFNNTSq1uaHFpujqhQN4dXQRY7iuFiiMo4k2w8tz49BxB7dq
	 1VP3WvJ4hwYR+w4H7amT2+1WouxvVwb4E6+P3BfoN4y6IZICpo/9R3hwfn70pbCaiN
	 SEZFLXANNwouDWVit2W1rzexv+sOd3C01A4AzrR+htvLRhObvld2S/B1Ej8UjesG5s
	 9/MIRLLaFpt6wxY5TIUwf6uJh0rk/MROkFj9eD5pmwvQtCfBaKfTJ+ZmAbYNZUW/Pf
	 c/Op2XXxIUeAg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2492BC41614; Sat,  3 May 2025 14:00:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Sat, 03 May 2025 14:00:58 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cwunder@gnome.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220069-208809-ICmez4www9@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220069-208809@https.bugzilla.kernel.org/>
References: <bug-220069-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220069

--- Comment #27 from Claudio Wunder (cwunder@gnome.org) ---
Another crash happened; Same condition, idle.

```
=E2=9D=AF lspci -nn | grep USB
03:00.2 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD/ATI] Navi =
31
USB [1002:7446]
0f:00.0 USB controller [0c03]: Intel Corporation Thunderbolt 4 NHI [Maple R=
idge
4C 2020] [8086:1137]
3b:00.0 USB controller [0c03]: Intel Corporation Thunderbolt 4 USB Controll=
er
[Maple Ridge 4C 2020] [8086:1138]
68:00.0 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] 600 Series
Chipset USB 3.2 Controller [1022:43f7] (rev 01)
6a:00.0 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD] 600 Series
Chipset USB 3.2 Controller [1022:43f7] (rev 01)
6c:00.3 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD]
Raphael/Granite Ridge USB 3.1 xHCI [1022:15b6]
6c:00.4 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD]
Raphael/Granite Ridge USB 3.1 xHCI [1022:15b7]
6d:00.0 USB controller [0c03]: Advanced Micro Devices, Inc. [AMD]
Raphael/Granite Ridge USB 2.0 xHCI [1022:15b8]
=E2=9D=AF lsusb
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 005 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 006 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 007 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 007 Device 002: ID 2109:4817 VIA Labs, Inc. USB2.0 Hub=20=20=20=20=20=
=20=20=20=20=20=20=20=20
Bus 007 Device 003: ID 2109:2817 VIA Labs, Inc. USB2.0 Hub=20=20=20=20=20=
=20=20=20=20=20=20=20=20
Bus 007 Device 004: ID 174c:2074 ASMedia Technology Inc. ASM1074 High-Speed=
 hub
Bus 007 Device 005: ID 1a40:0801 Terminus Technology Inc. USB 2.0 Hub
Bus 007 Device 006: ID 1e71:300e NZXT NZXT Kraken Base
Bus 007 Device 007: ID 046d:c548 Logitech, Inc. Logi Bolt Receiver
Bus 007 Device 008: ID 2109:8817 VIA Labs, Inc. USB Billboard Device=20=20=
=20
Bus 007 Device 009: ID 046d:c54d Logitech, Inc. USB Receiver
Bus 007 Device 010: ID 19f7:004e RODE Microphones R=C3=98DECaster Duo
Bus 007 Device 011: ID 0b05:18f3 ASUSTek Computer, Inc. AURA LED Controller
Bus 007 Device 012: ID 2e1a:4c03 Insta360 Insta360 Link 2C
Bus 007 Device 013: ID 31e3:1322 Wooting Wooting 60HE+
Bus 007 Device 014: ID 2109:2211 VIA Labs, Inc. USB2.0 Hub=20=20=20=20=20=
=20=20=20=20=20=20=20=20
Bus 007 Device 015: ID 2109:8884 VIA Labs, Inc. USB Billboard Device=20=20=
=20
Bus 007 Device 016: ID 0cf2:a201 ENE Technology, Inc. 6K7732
Bus 008 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 008 Device 002: ID 2109:3817 VIA Labs, Inc. USB3.0 Hub=20=20=20=20=20=
=20=20=20=20=20=20=20=20
Bus 008 Device 003: ID 2109:0817 VIA Labs, Inc. USB3.0 Hub=20=20=20=20=20=
=20=20=20=20=20=20=20=20
Bus 008 Device 004: ID 174c:3074 ASMedia Technology Inc. ASM1074 SuperSpeed=
 hub
Bus 008 Device 005: ID 2109:0211 VIA Labs, Inc. USB3.0 Hub=20=20=20=20=20=
=20=20=20=20=20=20=20=20
Bus 009 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 010 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 011 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 012 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 013 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 014 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
```

Interestingly enough, these last two crashes happened after a system update.

```
=E2=9D=AF rpm-ostree status
State: idle
Deployments:
=E2=97=8F ostree-image-signed:docker://ghcr.io/ublue-os/bazzite:stable
                   Digest:
sha256:91f041cd775526e8fe11089a1ca3433224cb9b5d1580c3ceb50973ec558f6dd9
                  Version: 42.20250430 (2025-05-01T19:32:10Z)
          LayeredPackages: android-tools
            LocalPackages: 1password-8.10.70-1.x86_64
sublime-text-4192-1.x86_64

  ostree-image-signed:docker://ghcr.io/ublue-os/bazzite:stable
                   Digest:
sha256:1a7ae28b95fde42b976cc9aa159219c0aaaa0611f7416f4b3b30284e292b0875
                  Version: 42.20250417 (2025-04-17T07:35:37Z)
          LayeredPackages: android-tools
            LocalPackages: 1password-8.10.70-1.x86_64
sublime-text-4192-1.x86_64
```

I'm on

```
=E2=9D=AF uname -r
6.14.4-103.bazzite.fc42.x86_64
```

Zip file:
https://gist.github.com/ovflowd/0b0aa5c748683eca33909dc3ed7c66f7#file-debug=
fs-03-05-2025-zip

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

