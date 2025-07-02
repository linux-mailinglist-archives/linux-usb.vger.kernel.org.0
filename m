Return-Path: <linux-usb+bounces-25418-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C34AF60AD
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jul 2025 20:01:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D46255245FC
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jul 2025 18:01:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF13E309A6C;
	Wed,  2 Jul 2025 18:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="onoiAjC/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 459EE2E7BA1
	for <linux-usb@vger.kernel.org>; Wed,  2 Jul 2025 18:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751479265; cv=none; b=fz7BZ0xtlO/A6EUfQF85qxQ/8fb4m+JAcZBTTqfXXd2ivb9wl92ilc3PXn8lc2IvRI7I0opeeekf9g6hbNijxnItB2M1EKuiFflTbWcNV2uGCT5VUnklVWnjF2UHIzefviF3HfUJVa9gcTD6+g07Jjr7oLeY9lai+b2hnCjxzCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751479265; c=relaxed/simple;
	bh=gB6KkQPl+jJAiWtOimy/N+yzhGtIOQAROEyeZlLZmiQ=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=GL27frc5HHi1F9SmwY/veOX0VNV0OwrHOHLRfw602XEIol2dKGDIbCJnMJ7NKks66BnZQgljFCxpKDKopteVhXE39DJ95AJ/Z5NJb3PsUfo4AKksYRG1T+s9fj+QyTbwDISr4f0zdSoY4pmpNInwNoLY5S3SrZVIqR3AIq58bbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=onoiAjC/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BF712C4CEE7
	for <linux-usb@vger.kernel.org>; Wed,  2 Jul 2025 18:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751479264;
	bh=gB6KkQPl+jJAiWtOimy/N+yzhGtIOQAROEyeZlLZmiQ=;
	h=From:To:Subject:Date:From;
	b=onoiAjC/A7Yjt9Sd7bfTWucyu/aY7i7twgGHtoenmprgdNbUc+kscIcFO5KrQDBZH
	 lLGsIaJwB/cpD1pBdeYXDW52hlw7CyJxpB2AgovfPpTG09zJ47ipTSHF8NsVfRDmE5
	 Dcir3mXvUhYY2e5fjzqdysTYyoN7cujnEjYfFovbRtSnmZgutKEmj8zSM4xwff6paD
	 eA/M1BXQwKs7Dz2w2WA/RG+pxyipodmzoN1uvwgy/fN6IHTC1DMynDpbyTVahhoit5
	 bOimzydFxDwa0XrOPOFWthRsSO4WAhWVPJ5ruVMPr4e9BsUdQtHNcO8Ctkd0Zgyh8D
	 KnEiJUCoGfjow==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B0F05C433E1; Wed,  2 Jul 2025 18:01:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220307] New: USB cannot submit urb disconnecting sound card
Date: Wed, 02 Jul 2025 18:01:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: targz@rambler.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 cf_regression
Message-ID: <bug-220307-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220307

            Bug ID: 220307
           Summary: USB cannot submit urb disconnecting sound card
           Product: Drivers
           Version: 2.5
          Hardware: All
                OS: Linux
            Status: NEW
          Severity: normal
          Priority: P3
         Component: USB
          Assignee: drivers_usb@kernel-bugs.kernel.org
          Reporter: targz@rambler.ru
        Regression: No

Just got an error that looks like that in dmesg. Not sure what made it such,
just using sound card with Pipewire on 192000 Hz, 53 samples quantization. =
This
leads to about 0,275 ms delay while preparation of node to play sound takes
about 0,250 ms when VLC starts playing a video. Pw-top reports about 0,3 ms
delay in Busy field if that matters. With 64 samples there was no issues wi=
th
preparing the node to start playing and had no conflict with hardware using
standard Arch kernel 6.15-4-arch2-1. So seems this is a USB bug when sound =
card
drops off and gets up stopping playback of sound while video goes further.

[  321.031944] usb 1-9: USB disconnect, device number 4
[  321.032030] xhci_hcd 0000:00:14.0: Event dma 0x000000015a8ee570 for ep 5
status 1 not part of TD at 000000015a8ee580 - 000000015a8ee580
[  321.032032] xhci_hcd 0000:00:14.0: Ring seg 0 dma 0x000000015a8ee000
[  321.032033] xhci_hcd 0000:00:14.0: Ring seg 1 dma 0x000000015a8ef000
[  321.032037] usb 1-9: cannot submit urb (err =3D -19)
[  321.274920] usb 1-9: new high-speed USB device number 11 using xhci_hcd
[  321.779252] usb 1-9: New USB device found, idVendor=3D0d8c, idProduct=3D=
0268,
bcdDevice=3D 2.03
[  321.779256] usb 1-9: New USB device strings: Mfr=3D1, Product=3D2,
SerialNumber=3D0
[  321.779256] usb 1-9: Product: BOMGE USB Audio Device
[  321.779257] usb 1-9: Manufacturer: C-Media Electronics Inc.
[  322.551132] input: C-Media Electronics Inc. BOMGE USB Audio Device as
/devices/pci0000:00/0000:00:14.0/usb1/1-9/1-9:1.3/0003:0D8C:0268.000C/input=
/input29
[  322.602843] hid-generic 0003:0D8C:0268.000C: input,hidraw2: USB HID v1.11
Device [C-Media Electronics Inc. BOMGE USB Audio Device] on
usb-0000:00:14.0-9/input3
[  422.601815] /proc/cgroups lists only v1 controllers, use cgroup.controll=
ers
of root cgroup for v2 info

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

