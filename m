Return-Path: <linux-usb+bounces-13304-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B1B94DE49
	for <lists+linux-usb@lfdr.de>; Sat, 10 Aug 2024 21:37:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9FF20B21B9E
	for <lists+linux-usb@lfdr.de>; Sat, 10 Aug 2024 19:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A89F813C8FE;
	Sat, 10 Aug 2024 19:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RsBxP5mu"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FBDB13B5A6
	for <linux-usb@vger.kernel.org>; Sat, 10 Aug 2024 19:37:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723318665; cv=none; b=PDHD+9wMgxAlDspT8H4ANNh3lbVXtmnJn0IICtfQfHLudR3/nxtNbA3RJyL5N1JFMSMdnO0yw63xu4nmO507Z+2x1M9oV/naSTMynIozba6LswSUwcflMZ1AHnutdyx8/4LvDvRWUSHRLuWTFG+ZD4P+O2Ghfq/HUjOQhxw0vtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723318665; c=relaxed/simple;
	bh=PPk+9CLgJn5nViTXeA6IYHL+4ItGe7WJTnP6XeSxNDA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bMt64AFHkh27aycwu/qWwxnTGdEuvrXPUltNL6YwOEziQvtBHFIC/k/N2ZTmyC8kTW4AzSHWmmYp1XRAnMP84MXntJWQSG7zAA9gcGH0hr7IwzQXrvr1w2/14HSOzHcPdaHojw6X4AdWsl+3VL5fh5dOBYRHMAbEdQfN519y5jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RsBxP5mu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 04B1FC4AF0D
	for <linux-usb@vger.kernel.org>; Sat, 10 Aug 2024 19:37:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723318665;
	bh=PPk+9CLgJn5nViTXeA6IYHL+4ItGe7WJTnP6XeSxNDA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=RsBxP5mu9VkAoLbVmcR+XZGjsakrhyQrohGwqucyEb83/Zg3SYIXlh2bhlfFDT2FI
	 u1LpZCrpEYHHjWG2R8/XhsFK606Esb2/pjMWA+5kCG3ozaIvSB3tBZ8ilaq1cFFU4I
	 Bul9DSTRDJNsc3SFRzusedMeASIeksbcYKI9cM0s/ERvhzVPDGex0k8xX2PCEG5q1Q
	 SgnNNXP9Yv0tsOCHcX77qrTUKqcoCKXQ4sbLYnJ7q5rFmcukUGbZw5d0S5DFylEcWD
	 go2QOEiPZkwtP5ed2aFXvtphdJ5vqefYosOYRC8y92dG7d1SSnICZkrGLwSqMc+/IJ
	 n67ut78AKM3MA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E21F7C53B50; Sat, 10 Aug 2024 19:37:44 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Sat, 10 Aug 2024 19:37:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219111-208809-UGQdzbhgLX@https.bugzilla.kernel.org/>
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

--- Comment #55 from Alan Stern (stern@rowland.harvard.edu) ---
The really important thing is bNumConfigurations.  If it is set to 1 then t=
he
device doesn't make config 2 available, but if it is set to 2 then the devi=
ce
does make config 2 available (even if the computer decides to use config 1).

The configuration descriptor includes four interfaces.  Interface 0 is the
audio control interface; it describes two USB terminals (one in, one out) a=
nd
two audio terminals (one in, one out).  It also says that the input termina=
ls
each have 2 channels (regular stereo).

Interfaces 1 and 2 are for audio streaming.  Interface 1 is the USB-out
connection; it runs at 48000 Hz with 24-bit samples, it can be synchronized=
 to
a clock on the device, and it can also operate in a vendor-specific way.=20
Interface 2 is the USB-in connection; it also runs at 48000 Hz with 24-bit
samples and it also has a vendor-specific alternate setting.

Interface 3 is for MIDI.  As far as I can see, you aren't using it.

The packet capture shows the computer issuing a few vendor-specific request=
s.=20
I have no way to know what they mean, but they involve getting data from the
device, not sending data to the device.  So they probably don't affect the =
way
the device operates.

The thing we really need to know is how the Windows driver tells the device=
 to
switch to configuration 2.  I haven't seen anything in the packet captures =
that
show how it does this.  (However, the most recent capture shows that at the
361-second mark, the computer deconfigures the device and the sets it back =
to
configuration 1.  I can't tell why that happened.)

Or maybe the Windows driver uses the vendor-specific alternate settings rat=
her
than the standard USB audio class settings.  The packet captures don't show=
 the
computer telling the device which alternate setting to use.  This must happ=
en,
because the default setting uses no bandwidth and transfers no audio data, =
but
it doesn't show up in the packet captures.  (It does show up in the usbmon
traces.)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

