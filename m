Return-Path: <linux-usb+bounces-10528-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E2E8CEAF2
	for <lists+linux-usb@lfdr.de>; Fri, 24 May 2024 22:39:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A330C1C2103D
	for <lists+linux-usb@lfdr.de>; Fri, 24 May 2024 20:39:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 783677350E;
	Fri, 24 May 2024 20:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f9/YTJkm"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEEC95D477
	for <linux-usb@vger.kernel.org>; Fri, 24 May 2024 20:39:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716583176; cv=none; b=SKLJxcSNqkdkbwZCD6B1BqZsWvLpELa9U4rFLI5zabxGsSoVo9Zym1h9Aoh01G8BmHfXOLZXevCP849gm9QDQdbSp5fGsOneJ9K3aamR68KGOdZKbcz1Z8ykwGt8dZHEn6gNDzICoDK0T9Q95obibN89WN2YkeDxKjf16B/KATc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716583176; c=relaxed/simple;
	bh=oMd77NARwiv2DwgNYOfLXcAtk/DB064o003rHzC6/Ls=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=l4vXdCt+kJqW3T5zJVFRfdido+Fc09faWO0Lf4XwOIUjBb1Ok4TC60Q8BHotJeUp3+QgTzavT+fnfLLXji1QOZxBLlEPCXQQKoecEOaymRQ1RZOhNbEnpp6Tjjsl6TCSsnglMENtKbnAKlTghrLUKRcO5FJygMQdjEDuUnF6t+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f9/YTJkm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65BBDC2BBFC
	for <linux-usb@vger.kernel.org>; Fri, 24 May 2024 20:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716583175;
	bh=oMd77NARwiv2DwgNYOfLXcAtk/DB064o003rHzC6/Ls=;
	h=From:To:Subject:Date:From;
	b=f9/YTJkm0pS529pGKW9U/jKPkox6pDya/syvKkj5o7x3nzGYBeBF1yQ7jtpTNaheC
	 oL/C1ixdfzAx4JEc0DjRIG98emkUC+y9UbBHHtjhVMxZy+p7hM1hbGhSG+X2LHCRFM
	 9q+0tlBXPKLK3ptav5le7fiVK9nXee25mJ91W25vSn/LoBUI6RE1T0ekfwH6QX7jex
	 QFlId+qnECHhxdeCGMC39NJQ7D88t75i2G65M8xvaTSz36Ba0L/n/aMd6k5+V9Af2O
	 2X5GOeiFQI0bM73nHPcYhoAguMzun0rzu22xWkSnNjgSLqp7ESmaKcT8yfDEmHkDAG
	 yt1Ms8JqdC+cQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 539B6C53B73; Fri, 24 May 2024 20:39:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218886] New: Steam is removing Steamdeck Controller on launch
 (usbhid)
Date: Fri, 24 May 2024 20:39:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: forum@docmax.my.to
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-218886-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218886

            Bug ID: 218886
           Summary: Steam is removing Steamdeck Controller on launch
                    (usbhid)
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: forum@docmax.my.to
        Regression: No

After booting there are 4 usbhid devices:

crw-rw-rw-+ 1 root root 241, 0 24. Mai 22:27 /dev/hidraw0
crw-rw-rw-+ 1 root root 241, 1 24. Mai 22:27 /dev/hidraw1
crw-rw-rw-+ 1 root root 241, 2 24. Mai 22:27 /dev/hidraw2
crw-rw-rw-+ 1 root root 241, 3 24. Mai 18:03 /dev/hidraw3

I found out that hidraw2 is the Steam Controller that Steam detects.
For some reason after starting Steam Steam removes hidraw2 (right after Ste=
am
startup window shows up).
I can fix it using echo "3-3:1.2" > /sys/bus/usb/drivers/usbhid/bind.

Of course this doesn't happen on original SteamOS.

I suspect usbhid has directly or indirectly something to do with it.
Also checked Steam logs and dmesg.

This is what i get on Steam launch on Steamdeck OLED (same on LED).

[Fr, 24. Mai 2024, 22:37:02] [drm] Failed to add display topology, DTM TA is
not initialized.
[Fr, 24. Mai 2024, 22:37:13] input: Microsoft X-Box 360 pad 0 as
/devices/virtual/input/input100
[Fr, 24. Mai 2024, 22:37:17] input: Valve Software Steam Controller as
/devices/pci0000:00/0000:00:08.1/0000:04:00.4/usb3/3-3/3-3:1.0/0003:28DE:12=
05.0028/input/input101
[Fr, 24. Mai 2024, 22:37:17] hid-steam 0003:28DE:1205.0028: input,hidraw0: =
USB
HID v1.10 Mouse [Valve Software Steam Controller] on usb-0000:04:00.4-3/inp=
ut0
[Fr, 24. Mai 2024, 22:37:17] input: Valve Software Steam Controller as
/devices/pci0000:00/0000:00:08.1/0000:04:00.4/usb3/3-3/3-3:1.1/0003:28DE:12=
05.0029/input/input102
[Fr, 24. Mai 2024, 22:37:17] hid-steam 0003:28DE:1205.0029: input,hidraw1: =
USB
HID v1.10 Keyboard [Valve Software Steam Controller] on
usb-0000:04:00.4-3/input1
[Fr, 24. Mai 2024, 22:37:17] input: Steam Deck as
/devices/pci0000:00/0000:00:08.1/0000:04:00.4/usb3/3-3/3-3:1.2/0003:28DE:12=
05.0026/input/input103
[Fr, 24. Mai 2024, 22:37:17] hid-steam 0003:28DE:1205.0026: Steam Controller
'FYZZ3490B8F1' disconnected
[Fr, 24. Mai 2024, 22:37:20] input: Valve Software Steam Controller as
/devices/pci0000:00/0000:00:08.1/0000:04:00.4/usb3/3-3/3-3:1.0/0003:28DE:12=
05.002A/input/input104
[Fr, 24. Mai 2024, 22:37:20] hid-steam 0003:28DE:1205.002A: input,hidraw0: =
USB
HID v1.10 Mouse [Valve Software Steam Controller] on usb-0000:04:00.4-3/inp=
ut0
[Fr, 24. Mai 2024, 22:37:20] input: Valve Software Steam Controller as
/devices/pci0000:00/0000:00:08.1/0000:04:00.4/usb3/3-3/3-3:1.1/0003:28DE:12=
05.002B/input/input105
[Fr, 24. Mai 2024, 22:37:20] hid-steam 0003:28DE:1205.002B: input,hidraw1: =
USB
HID v1.10 Keyboard [Valve Software Steam Controller] on
usb-0000:04:00.4-3/input1

Notice the "Steam Controller 'FYZZ3490B8F1' disconnected" message.
Also tried to blacklist hid_steam module.

Any help is really appreciated,
DocMAX

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

