Return-Path: <linux-usb+bounces-23698-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67557AA8E83
	for <lists+linux-usb@lfdr.de>; Mon,  5 May 2025 10:50:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C17D6173D92
	for <lists+linux-usb@lfdr.de>; Mon,  5 May 2025 08:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E434E1C8619;
	Mon,  5 May 2025 08:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZvOj2MMO"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 687D81F4161
	for <linux-usb@vger.kernel.org>; Mon,  5 May 2025 08:49:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746434995; cv=none; b=Kzp805VcNWe1Lopg2pEYFJhuSSJnNC94TrssC28t+ow5943QnmtgQFyixXQnFqpQnwpDunHTe8XJxsY6EArjkR/Qtg6xgPV1cNsOgkXBxIZmqzH0zKFNvmbfIUQSmug8/ip8l/wzKhDJ0XcpZ96KiDr2Qnksmv3u+3IoPT3oazU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746434995; c=relaxed/simple;
	bh=jqkbS14VZvrv7dRNIl/GbBZnKNvY7URavMxDea5ubVo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=M6GLIbl3xCa6UM7v+zWzlbHG8Evzk0R2aCbotnKrPLqUl4gL6elh+sv1keWUEPqsmeWFFJDsMSh5Im8WyD7yeNYx1DcKjHdZKR9O2+ZzCX77cuCiGFszwLjzbNagNKWNwtR4Uz3nmX6n9LIABClbyAj9tKsHuH/vLZnwGFAX9ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZvOj2MMO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2CD27C4CEE9
	for <linux-usb@vger.kernel.org>; Mon,  5 May 2025 08:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746434995;
	bh=jqkbS14VZvrv7dRNIl/GbBZnKNvY7URavMxDea5ubVo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZvOj2MMOCVHTnrlhsBUy6MtdEsPFduwlx0krkCGAKTNYI8PM+aT7lptu1zeNt6MIu
	 ljhLQmKwO0gCyY1ziZwA1I0yLNLfzjo7o6a89tKFsj63SzwMKxTQ/xyPSrCjGtr/4K
	 OfAGk/MLFMEjUHHSm/YhQ7g7I5h/Xm4q7B2skl3NJoEFPpn1X0W1NbbqFQ6ydmjyFE
	 LjHM4aLAnJxNQ9tFjwGxygi6ThEBG2YSHy28r0FZbYfAedMGXeJ68vfawoCmXT6qZN
	 9N1FMx5GMYRJQYHv2nd0DbQbpMeMq/47o++Z8vVBSAww1P9MYov2Ja3VA6EazMNkQ7
	 Isa/DdKsUTGrA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 23DF3C3279F; Mon,  5 May 2025 08:49:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Mon, 05 May 2025 08:49:54 +0000
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
Message-ID: <bug-220069-208809-u90VNEyM2V@https.bugzilla.kernel.org/>
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

--- Comment #36 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Restricting power management may reduce occurrences of this problem, maybe =
even
to nothing or almost nothing, because things are breaking while resuming a =
hub
from autosuspend. However, I don't think that power management is the root
cause or the only workload which could run into trouble, it's just the one
which happens often enough to be regularly running into trouble on your sys=
tem.

I see a few things being wrong or suspicious here.

1. The "average TRB length" properly of all Control Endpoint Contexts is se=
t to
zero, but it should be 8. This was recently reported as a violation of the =
xHCI
spec with no known impact. It is probably irrelevant, but who knows - this
should ideally be fixed for peace of mind. It can only be solved by a kernel
patch.

2. The webcam driver regularly generates a burts of transfer cancellations,
which is a known problem case. The command sequences and their completion
events look OK, but IME ASMedia and Promontory can still behave weird under
such conditions.

3. Sometimes when 8-3 hub resume happens some time after (or during) the we=
bcam
driver activity burst, it fails. And it fails weirdly: dmesg suggests that =
some
control transfer to confirm the resumed hub's status times out, and when a =
Stop
Endpoint command is issued to cancel the transfer, we suddenly get an event
informing about a Transaction Error instead, and the Endpoint Context may or
may not indicate that the control endpoint is halted (which it should be af=
ter
an error), and yet the Stop Command succeeds (which it shouldn't), and we m=
ay
get multiple "Stopped" events (we shouldn't) before the command's completion
event.

This is similar to misbehaviors I have been seeing due to problem #2 in the
past.

4. Then an odd sequence of Reset Device commands is issued, probably courte=
sy
of

2c31b05c63cf usb: hub: lack of clearing xHC resources

which landed in 6.13.7 and 6.14+. I wouldn't be surprised if there are some
spec violations in this commit, but I'm not sure if they would be harmful in
this case.

We probably shouldn't be issuing Reset Device for the child 8-3.4 hub here.
We don't need to (and probably shouldn't) be issuing Reset Device 8-3 twice.

5. Lastly, attempts to reset 8-3 are not improving the situation and the hub
driver tries to disable and enable the device slot, and address the device
again.

Hard to tell what's the outcome of this command, because it appears to gene=
rate
a mangled completion event ("unknown event type <number>"). However, the ev=
ent
does contain a pointer to this command. It is possible that the HC progress=
es
to the next command.

6. Very lastly, all unrelated transfers stop happening and a Stop Endpoint
command issued to the webcam endpoint either never is reached, or hangs the=
 HC
for good.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

