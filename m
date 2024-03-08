Return-Path: <linux-usb+bounces-7734-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 40378876740
	for <lists+linux-usb@lfdr.de>; Fri,  8 Mar 2024 16:22:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7067D1C216E2
	for <lists+linux-usb@lfdr.de>; Fri,  8 Mar 2024 15:22:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6355E1DDF5;
	Fri,  8 Mar 2024 15:22:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xnfvhyw/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E10D615C0
	for <linux-usb@vger.kernel.org>; Fri,  8 Mar 2024 15:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709911352; cv=none; b=OhEF4mCOpI//jnAM8m7GJB8t8y7wiav8rxCuZyTGDu6qGM7oKBzesjgh+ajciMLKmKCKfeB0+r3Q4UNvMIQK5QnaAwQ9hZNNSgDXOWl/0brosCKcEqwIX3GdWdDyVfw6LlOfBJZXSoL/BusgpsmmZThg7ObVARjRIQhzY1o/L0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709911352; c=relaxed/simple;
	bh=D38+EVcxlSI4kCHrlWMhaJpSRNt8DgrYnENS8zk/QGk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uElBcxVX+bOMv/ud7QwH2/0VuOC8bVGixUoWs2r0b84g4G/csKuiMQugBxjjYyfosgC6W7lnhNjmDrabKTHsBdhO8E+snjKGIZAbxhyGLOyT2LI+RMg/sBQt0cs2Mm3OfoNOvq9t+lTKNQpRmrFbT7kK2VpQZRFPAH6tafZORWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xnfvhyw/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 76BBFC433C7
	for <linux-usb@vger.kernel.org>; Fri,  8 Mar 2024 15:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709911351;
	bh=D38+EVcxlSI4kCHrlWMhaJpSRNt8DgrYnENS8zk/QGk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Xnfvhyw//E58icFnwgdmdlGLU0aH1de8HMENmzzDfSLgpdagr2eFtug2Bbata/nrB
	 t+KqpS1xoDbh2TO31FuY0S7e6p0dBiajo8mttvQ9YphBO1R5pFAbW05nmfxB/nKYwJ
	 FC9XmUpdq5vhKwp7XQgF2B12g7sgO8w0RG6OfMcSW6H19IYXHgk5wYWzEngJGklts/
	 Vyb5rFN+xzlknxaXHduY7N3aokUebEFo/cRffGTgDGomwUy5Ex7EiGVurzBzfO8rvn
	 cR8NdTP39ScpkE3Ohw42XbAIXLAPhQvItjFyHcVsjtAPqCHCfAzJkELubP3Xm/Cihm
	 6LQcTBBT0Xs+g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5DCC1C53BD0; Fri,  8 Mar 2024 15:22:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218544] not enough bandwidth, synaptics hi-res audio duplex
 audio
Date: Fri, 08 Mar 2024 15:22:31 +0000
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
Message-ID: <bug-218544-208809-E1beGuKm0f@https.bugzilla.kernel.org/>
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

--- Comment #13 from Alan Stern (stern@rowland.harvard.edu) ---
This raises an obvious question: What is the point of supporting 96 kHz
operation on the output channel but only going up to 48 kHz on the input
channel?  That's weird.

That maxpacket value for the output channel does look very strange.  To sup=
port
96 kHz operation, 16-bits should use 384 bytes and 24-bits should use 576.=
=20
(You wrote 458 but that was obviously a typo, copying the number in the line
below.)  The 768 value just seems wrong.

I don't believe the device does 2-ms buffering.  And no, isochronous packet=
s do
not have to use the full maxpacket size, but there's no reason to set the
maxpacket size larger than necessary.  I bet that 768 really ought to be 38=
4,
and it's a mistake in the device's firmware.

I don't understand why unbinding fails to remove the HID's endpoint bandwid=
th
usage.  That might be a bug.

While I haven't looked at the details of microframe scheduling in a long ti=
me,
I don't think it would be valid to schedule the interrupt endpoint to start=
 in
microframe 6.  Certainly if it were valid, it would require the use of FSTN
nodes, which the driver does not support.

Given that the device will require the entire 96 kHz output bandwidth even =
when
it's running at only 48 kHz, scheduling is bound to be difficult or impossi=
ble.
 Things would be easier if there were separate alternate settings for 48 kHz
and 96 kHz operation.

Part of the scheduling problem arises because it's generally better to put =
the
isochronous packets in the earlier microframes and the interrupt packets af=
ter
them.  However, the driver schedules each endpoint for the earliest feasible
position, and apparently the interrupt endpoint gets started first.  That's=
 why
it ends up in its non-optimal position at the beginning of the frame.

In theory it's possible to change the 16-bit output maxpacket value in the
kernel, setting it to 384.  I don't know that this would be a good idea in
general, but you could try it for your own use.  It's not clear that you wo=
uld
want to spend the time and effort to do this, however.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

