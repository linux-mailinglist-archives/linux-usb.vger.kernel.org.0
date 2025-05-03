Return-Path: <linux-usb+bounces-23659-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E97AA7F5C
	for <lists+linux-usb@lfdr.de>; Sat,  3 May 2025 10:08:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5A2391BA2E88
	for <lists+linux-usb@lfdr.de>; Sat,  3 May 2025 08:08:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EF1F1AF0C9;
	Sat,  3 May 2025 08:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IpscRR7m"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839B31AB531
	for <linux-usb@vger.kernel.org>; Sat,  3 May 2025 08:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746259718; cv=none; b=LRvh20qElBYaJIBEb6O4bEoK8Q/Scf0khwpdst17g8ysW0dXMqADpkyCTjTKYGcv4tfWC4U8IFoVxNqgkCqpP8Dd3wZQ5Z9+rp05nXVNl9AR7CKHIG4Ui/N4L6hPruOH1QwxLvXlheMtWT5QE7wH604qV0+DjuoCG0f4nnSAQts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746259718; c=relaxed/simple;
	bh=vP3eDq14oOVz5Tgtc4wQUtIRW0gmTf3tGZej5eskVS4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZajuZsASmqhLyZg2ctiGGP5+9woXNMMheteOtyn6nfjechbo4rSpKso+CBv/uj7yboV+JMAboDuNYyDTDw8zh9daShKp1T6ATZ3UJ8/5wpJvM7fUam7NRBOKFji877O/ouX9glzzKopGha9Vfk0MGzmaGSgA1g+O6+g7zC33W/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IpscRR7m; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E69A7C4CEEB
	for <linux-usb@vger.kernel.org>; Sat,  3 May 2025 08:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746259717;
	bh=vP3eDq14oOVz5Tgtc4wQUtIRW0gmTf3tGZej5eskVS4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=IpscRR7mF2kNZLrAuuj/vdfLetuwi0tdNzyYKrSSf/Dat24sJQEyoRg0iY+4sPXgp
	 pewccD/0mDJNgJbc7csgwf6u9scNIsy/aH43AWIN2u7fIfUNLy0PyForKcCVcwd0i9
	 5FRlXcBlGwDoSLR6krHwAWb3UXtoDMdicdgsaFvBbJs5tc+wnbCH4IKde+qtoEJPyi
	 qHl3I6qbpvMGTNIRpAwkF5wg16MgrIu8cUwBa1ghqGp1KJOm60Hq8n3UMmx8x8hWmO
	 qYAOK6e0zkhWXldRvHLKb9dGJcHXqb211g1x49LIcH23BrX00oZxKsNkW7OtpcYdIS
	 Rfo3XHn0cSjJw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D69B2C41614; Sat,  3 May 2025 08:08:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Sat, 03 May 2025 08:08:37 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220069-208809-3mowzvjn49@https.bugzilla.kernel.org/>
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

--- Comment #24 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Great. By the way, did you suspend, reboot or unbind xhci_hcd after taking =
the
working system debugfs dumps and before it died? Unfortunately, the "dead" =
dump
is missing information about connected devices, because they got dropped af=
ter
"HC died".


Below are the final commands executed by the HC. Their cycle bits are all s=
et
("flags C") and there is no evidence of Stop Endpoint retries anywhere in t=
he
whole command ring dump, so this is not any of the known or obviously suspe=
cted
problems, but something new and weird.

Stop Ring Command: slot 19 sp 0 ep 3 flags C
Set TR Dequeue Pointer Command: deq 00000000ffead3c0 stream 0 slot 19 ep 3
flags C=20
Stop Ring Command: slot 19 sp 1 ep 1 flags C
Stop Ring Command: slot 19 sp 0 ep 3 flags C
Set TR Dequeue Pointer Command: deq 00000000ffead3d0 stream 0 slot 19 ep 3
flags C=20
Stop Ring Command: slot 19 sp 1 ep 1 flags C
Stop Ring Command: slot 6 sp 0 ep 5 flags C
Set TR Dequeue Pointer Command: deq 00000000fffddbc1 stream 0 slot 6 ep 5 f=
lags
C
Stop Ring Command: slot 6 sp 0 ep 5 flags C
Set TR Dequeue Pointer Command: deq 00000000fffddbd1 stream 0 slot 6 ep 5 f=
lags
C
Stop Ring Command: slot 6 sp 0 ep 5 flags C
Set TR Dequeue Pointer Command: deq 00000000fffddbe1 stream 0 slot 6 ep 5 f=
lags
C
Stop Ring Command: slot 6 sp 0 ep 5 flags C
Set TR Dequeue Pointer Command: deq 00000000fffddbf1 stream 0 slot 6 ep 5 f=
lags
C
Stop Ring Command: slot 6 sp 0 ep 5 flags C
Set TR Dequeue Pointer Command: deq 00000000fffddc01 stream 0 slot 6 ep 5 f=
lags
C
Stop Ring Command: slot 6 sp 0 ep 5 flags C
Set TR Dequeue Pointer Command: deq 00000000fffddc11 stream 0 slot 6 ep 5 f=
lags
C
Stop Ring Command: slot 19 sp 0 ep 1 flags C
Reset Device Command: slot 16 flags C
Reset Device Command: slot 19 flags C
Reset Device Command: slot 19 flags C
Address Device Command: ctx 00000000fff42000 slot 19 flags b:C
Disable Slot Command: slot 19 flags C
Enable Slot Command: flags C
Address Device Command: ctx 00000000fff42000 slot 20 flags b:C
Stop Ring Command: slot 6 sp 0 ep 5 flags C

Initially, we see the familiar pattern of canceling a pending transfer on s=
lot
19 ep 3 and stopping slot 19 ep 1 (the control endpoint) with "sp 1", which=
 is
a hint that the device will be suspended. This is probably the 8-3 hub agai=
n.

Then there is some action on slot 6 ep 5, which I don't understand because
information about devices is not available. In the earlier debugfs dump fro=
m a
working system slot 6 was the ASM107x hub, but endpoint id 5 was *not* enab=
led
on it, so that makes no sense.

Things begin to get unusual now: stop endpoint on slot 19 ep 1 with "sp 0",
then some devices are being reset. The last two commands fail to complete a=
nd
the HC hangs when the driver tries to abort them.

Looking at the event ring, the "unknown event type 4" actually points to the
Address Device command for slot 20, so maybe the HC completed this command =
(but
was already fubared enough to produce a corrupted event) and then got stuck=
 for
real on the final command for slot 6.

But it was already fubared at this point, so something went wrong with those
resets or it was the slot 6 ep 5 churn which broke it. That looks like
repeatedly canceling a pending transfer before it completes and then
resubmitting a similar transfer, and IME such pattern can break "ass media"=
 HCs
if they repeat fast enough... (no timestapms here, unfortunately).


Not entirely sure what to think about it yet, I will take a closer look at =
the
whole event ring later.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

