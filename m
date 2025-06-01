Return-Path: <linux-usb+bounces-24409-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C632AC9E85
	for <lists+linux-usb@lfdr.de>; Sun,  1 Jun 2025 14:52:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6CB027A9A33
	for <lists+linux-usb@lfdr.de>; Sun,  1 Jun 2025 12:51:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 227DE1CB518;
	Sun,  1 Jun 2025 12:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pYhcm36W"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A26D299
	for <linux-usb@vger.kernel.org>; Sun,  1 Jun 2025 12:52:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748782341; cv=none; b=BpBbM5bS6kNDJBazOoLQ91XKlpNyHkBn0k/T3GYsmSqi5ISOm1BLl+IfErcGFvxMB2ReOgMKw5LHNek0Gz7liD+PQk8SOBKbqR3ZUUNyWJnMKaI8L2Jqyqf2ZrUlnvcqWYZxYFu45asY1xU0lWfbWUPmp8cS0ffcCspUHLrX5II=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748782341; c=relaxed/simple;
	bh=TSoJ0tU94vOB3heClaxPaWS8kPUOikT2q+DUMUYvu5s=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=h93YPI75Jhavkj5QKL9jFbAdqWse+Y01AeuulwjXc/iq5prpl/YCOn/UKaZlgHrTVzGJQ+W+svuuv35YUHVvOYZrD4bvLDRwZZ+yupdZqdGVxXuqEazKB14ToRTuKAEeu65m8aIUuk+gumBzAkR9FSDOmolpPu0X3uLlQkStgJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pYhcm36W; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5E039C4CEE7
	for <linux-usb@vger.kernel.org>; Sun,  1 Jun 2025 12:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748782341;
	bh=TSoJ0tU94vOB3heClaxPaWS8kPUOikT2q+DUMUYvu5s=;
	h=From:To:Subject:Date:From;
	b=pYhcm36W3aa5DJHoOXpr5h8xZolYkKEcgRu3Gyt0CzKkP2XZSjaJr+1wqK4rB8ZyV
	 nZy94Hlwx2dWwPk3gAg/3TlFMQ188IN2G5x8LNJnvLaGQp2vDKRieC+YN1nt3SU+PN
	 dzTXijDP729pQethcBK5oslhItvNi/I2cTOvtqFCPOKdwJIex3C0CoQCvIRE1+5pI7
	 KmwLzhCRs+fVTBVfnaLospzXt3GPjh6H+jqdj062FY6fYNubk1F9V9DJLbPIAlIAfX
	 XU0UaiGty2tO0fvEbkW2ZtQ+lUiGxdKaKpE5b9GFi/Gs6Q66VgZ+1oqpUkdFFQP/DI
	 PEuy2/28bM+fA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 49967C3279F; Sun,  1 Jun 2025 12:52:21 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjAxODFdIE5ldzogVXNlcnMgYWNyb3NzIGRpc3RyaWJ1?=
 =?UTF-8?B?dGlvbnMgc2VlIOKAnGNvbmZpZyBmYWlsZWQsIGh1YiBkb2VzbuKAmXQgaGF2?=
 =?UTF-8?B?ZSBhbnkgcG9ydHMhIChlcnIgLTE5KeKAnSBmcm9tIHhoY2lfaGNkIGF0IGJv?=
 =?UTF-8?B?b3Qu?=
Date: Sun, 01 Jun 2025 12:52:21 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: 6svcyk03@rokejulianlockhart.addy.io
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-220181-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220181

            Bug ID: 220181
           Summary: Users across distributions see =E2=80=9Cconfig failed, =
hub
                    doesn=E2=80=99t have any ports! (err -19)=E2=80=9D from=
 xhci_hcd at
                    boot.
           Product: Drivers
           Version: 2.5
          Hardware: AMD
                OS: Linux
            Status: NEW
          Severity: low
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: 6svcyk03@rokejulianlockhart.addy.io
        Regression: No

At boot, I see the undermentioned in red in `dmesg`:

> ~~~log
> config failed, hub doesn't have any ports! (err -19)
> ~~~

I've one entry for each boot in `journalctl`.

Using the first section of the error:

> ~~~YAML
> hub 12-0:1.0
> ~~~

...I believe that I've ascertained what the cause is. Using `lsusb -t`, I f=
ind:

> ~~~YAML
> /:  Bus 012.Port 001: Dev 001, Class=3Droot_hub, Driver=3Dxhci_hcd/0p, 50=
00M
> ~~~

`Driver=3Dxhci_hcd/0p` means it has 0 ports, which is invalid, hence the er=
ror.

I tried to `readlink /sys/class/usb_host/usb12` it to ascertain what the ca=
use
is, but that fails, because the device unsuccessfully enumerated. Consequen=
tly,
I used `readlink /sys/bus/usb/devices/usb12` to verify the device ID:

> ~~~log
> ../../../devices/pci0000:00/0000:00:08.3/0000:5a:00.0/usb12
> ~~~

When known, I used `5a:00.0` to locate the cause with `lspci -s 5a:00.0`:

> ~~~YAML
> 5a:00.0 USB controller: Advanced Micro Devices, Inc. [AMD] Raphael/Granit=
e Ridge USB 2.0 xHCI
> ~~~

It's the virtual "Advanced Micro Devices, Inc. [AMD] Raphael/Granite Ridge =
USB
2.0 xHCI" USB controller, not exposing any ports despite the driver purport=
edly
requiring it. However, there obviously aren't ports on a virtual device.

At
https://discussion.fedoraproject.org/t/what-does-config-failed-hub-doesnt-h=
ave-any-ports-err-19-mean/153954,
I cite corroborations from Kali Linux, Ubuntu, Debian and Fedora. However, =
I've
also received a personal e-mail from an interested party who claims to
reproduce this on openSUSE.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

