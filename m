Return-Path: <linux-usb+bounces-12931-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD64946FA3
	for <lists+linux-usb@lfdr.de>; Sun,  4 Aug 2024 17:38:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8A43D2816F7
	for <lists+linux-usb@lfdr.de>; Sun,  4 Aug 2024 15:38:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E77A076048;
	Sun,  4 Aug 2024 15:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gtqf8nfU"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7126018040
	for <linux-usb@vger.kernel.org>; Sun,  4 Aug 2024 15:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722785920; cv=none; b=syVS/sVpwEuZHq328g8Tks1WQkz0EnzEiGkSaXNYKz5+eoMM7dCZLfkaYVo3abbX+Nvcq7htUNjMDB9xDrpVugbbwnWtYv0XT7ds3b38WZsKINjjA7e+kkxa18P8dhGKvUPBXy/xc4zhfB2+D1nNw2IyWchZCfEWyvcWZ/U1Fd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722785920; c=relaxed/simple;
	bh=DkBdNGzDl2Ycxkg4T5LWyT5QgA6z5DMfDlVQjq0Ef4U=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JzG+7nZ9877Yjg/9esuFGcdFsnP3akn2+GhyXE7h6MBi2/1hiFz/j494BFs6rzRkaiq3Ri8W4Kg3auY+01nZlvzMDw07Q2DwHfXWmKbQBJaxRl3HNMLbvahIUbSBr8VFHh96ZdhklP2MooMyQPfL0dzs1b54bNV+bBsypfYGtuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gtqf8nfU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D16FAC4AF0C
	for <linux-usb@vger.kernel.org>; Sun,  4 Aug 2024 15:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722785919;
	bh=DkBdNGzDl2Ycxkg4T5LWyT5QgA6z5DMfDlVQjq0Ef4U=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gtqf8nfUeZ0XMH8SvYDAaZQ2ypaVFa66KcFihdw0iouyr/fyN4WvNMbsjYQnW6OIs
	 5lKr1YIzeJjyceBACdqdghDxzixo8enMZwsOO4SkaVfrt6ShXJrn+hVvDIBy42/7ST
	 YL2mjjqB4cRcTBCtBJ8n4/rxiFd1UVim7fMV3XpjaSryPkTCrsPc7XtwQ5scS3iakK
	 HOP/Ro5uh0gk5F+rYCdLzUUS+Xb/aeAQZfPNhm8cUvc/fzpoSivBCHkvDHaUt7la0U
	 wNxpNi2SZwh472+WP7lcmLweJpJY45tLthscjyPGK4wQeMEPVAYgU4qbxbGQZqhLSm
	 rD32MesR+Ierw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BA09DC53B73; Sun,  4 Aug 2024 15:38:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Sun, 04 Aug 2024 15:38:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: com+bugzilla-kernel@c-henry.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219111-208809-ENWZCJrisU@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219111-208809@https.bugzilla.kernel.org/>
References: <bug-219111-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219111

--- Comment #18 from CH (com+bugzilla-kernel@c-henry.fr) ---
Ok, so I finally managed to correclty install and run the patched kernel an=
d it
appears your patch doesn't work. Here's the journalctl trace from when I pl=
ug
the mixer:

ao=C3=BBt 04 17:32:42 localhost kernel: usb 1-2: new high-speed USB device =
number 7
using xhci_hcd
ao=C3=BBt 04 17:32:42 localhost kernel: usb 1-2: Patch applied
ao=C3=BBt 04 17:32:42 localhost kernel: usb 1-2: Skipped second reset
ao=C3=BBt 04 17:32:42 localhost kernel: usb 1-2: New USB device found,
idVendor=3D22f0, idProduct=3D0008, bcdDevice=3D 2.00
ao=C3=BBt 04 17:32:42 localhost kernel: usb 1-2: New USB device strings: Mf=
r=3D1,
Product=3D2, SerialNumber=3D3
ao=C3=BBt 04 17:32:42 localhost kernel: usb 1-2: Product: Xone:23C
ao=C3=BBt 04 17:32:42 localhost kernel: usb 1-2: Manufacturer: Allen&Heath
ao=C3=BBt 04 17:32:42 localhost kernel: usb 1-2: SerialNumber: no serial nu=
mber
ao=C3=BBt 04 17:32:42 localhost kernel: usb 1-2: 1:2 : UAC_AS_GENERAL descr=
iptor not
found
ao=C3=BBt 04 17:32:42 localhost kernel: usb 1-2: 2:2 : UAC_AS_GENERAL descr=
iptor not
found
ao=C3=BBt 04 17:32:42 localhost kernel: usb 1-2: Quirk or no altset; fallin=
g back to
MIDI 1.0
ao=C3=BBt 04 17:32:42 localhost mtp-probe[5421]: checking bus 1, device 7:
"/sys/devices/pci0000:00/0000:00:01.3/0000:01:00.0/usb1/1-2"
ao=C3=BBt 04 17:32:42 localhost mtp-probe[5421]: bus: 1, device: 7 was not =
an MTP
device
ao=C3=BBt 04 17:32:42 localhost (udev-worker)[5420]: 1-2:
/usr/lib/udev/rules.d/69-mixxx-usb-uaccess.rules:19 Failed to write
ATTR{/sys/devices/pci0000:00/0000:00:01.3/0000:01:00.0/usb1/1-2/bConfigurat=
ionValue},
ignoring: Invalid argument
ao=C3=BBt 04 17:32:42 localhost mtp-probe[5443]: checking bus 1, device 7:
"/sys/devices/pci0000:00/0000:00:01.3/0000:01:00.0/usb1/1-2"
ao=C3=BBt 04 17:32:42 localhost mtp-probe[5443]: bus: 1, device: 7 was not =
an MTP
device
ao=C3=BBt 04 17:32:42 localhost kded6[3384]: org.kde.pulseaudio: No object =
for name
"alsa_output.pci-0000_08_00.4.analog-stereo.monitor"
ao=C3=BBt 04 17:32:42 localhost plasmashell[3409]: org.kde.pulseaudio: No o=
bject for
name "alsa_output.pci-0000_08_00.4.analog-stereo.monitor"
ao=C3=BBt 04 17:32:42 localhost kded6[3384]: org.kde.pulseaudio: No object =
for name
"alsa_output.pci-0000_08_00.4.analog-stereo.monitor"
ao=C3=BBt 04 17:32:42 localhost plasmashell[3409]: org.kde.pulseaudio: No o=
bject for
name "alsa_output.pci-0000_08_00.4.analog-stereo.monitor"
ao=C3=BBt 04 17:32:42 localhost kded6[3384]: org.kde.pulseaudio: No object =
for name
"alsa_output.pci-0000_08_00.4.analog-stereo.monitor"
ao=C3=BBt 04 17:32:42 localhost kded6[3384]: org.kde.pulseaudio: No object =
for name
"alsa_output.pci-0000_08_00.4.analog-stereo.monitor"
ao=C3=BBt 04 17:32:42 localhost plasmashell[3409]: org.kde.pulseaudio: No o=
bject for
name "alsa_output.pci-0000_08_00.4.analog-stereo.monitor"
ao=C3=BBt 04 17:32:42 localhost plasmashell[3409]: org.kde.pulseaudio: No o=
bject for
name "alsa_output.pci-0000_08_00.4.analog-stereo.monitor"
ao=C3=BBt 04 17:32:42 localhost kded6[3384]: org.kde.pulseaudio: No object =
for name
"alsa_output.pci-0000_08_00.4.analog-stereo.monitor"
ao=C3=BBt 04 17:32:42 localhost plasmashell[3409]: org.kde.pulseaudio: No o=
bject for
name "alsa_output.pci-0000_08_00.4.analog-stereo.monitor"
ao=C3=BBt 04 17:32:42 localhost kded6[3384]: org.kde.pulseaudio: No object =
for name
"alsa_output.pci-0000_08_00.4.analog-stereo.monitor"
ao=C3=BBt 04 17:32:42 localhost plasmashell[3409]: org.kde.pulseaudio: No o=
bject for
name "alsa_output.pci-0000_08_00.4.analog-stereo.monitor"


You can see the *Patch applied* log which is a line I added to ensure I was
indeed running the patched kernel and the *Skipped second reset* line that
indicates the `if (maxp0 <=3D 18)` was skipped but udev still fails to appl=
y the
`bConfigurationValue` rule.

If you want to test another patch, I now know how to do.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

