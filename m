Return-Path: <linux-usb+bounces-20682-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A157A3702D
	for <lists+linux-usb@lfdr.de>; Sat, 15 Feb 2025 19:41:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 59FA37A4137
	for <lists+linux-usb@lfdr.de>; Sat, 15 Feb 2025 18:40:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 317C91EA7DE;
	Sat, 15 Feb 2025 18:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qxK8l7qN"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9694E1DFD9C
	for <linux-usb@vger.kernel.org>; Sat, 15 Feb 2025 18:41:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739644866; cv=none; b=VrtM+aQuZwPEFyxTp2+OljvT3eRbBPX6BtD0NXp4JCOggaVYaxDTZyG58vx1Hvj2IigZbOQjyufR5VGjairzcumxE2OZWCwbKx6GM9TBQ6JQ5dzj5LcaRpD7xK6MxpNrLmZPyQPGjTK5Uh9bs5NfcJs43iTyTplJLeop1kYHljw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739644866; c=relaxed/simple;
	bh=WmQGneu34hAnK0FqZyRPQId0w+RBM5G0QRLPL9fobrk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z5mG1QfiKS3KPtGqt/K+6+GAnp4OnfA3p3aNZD+e1SuPswEOkyJbLekh7EGu2UvPniQU+mMXyqPiHx8vtKarWAn7kB0GGL3fI8/jtZTYNfkLZ/1qbkmGZZ80JN9a0CFa99ZG1RkcQfrprt0gWQesZ6zgSR5gmtthgZQgL8WmTCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qxK8l7qN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07399C4CEE6
	for <linux-usb@vger.kernel.org>; Sat, 15 Feb 2025 18:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739644866;
	bh=WmQGneu34hAnK0FqZyRPQId0w+RBM5G0QRLPL9fobrk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qxK8l7qNP2qYsj71rho2q3c6nwO9FTFcCyTbbAGKRR2m5XhaAYhrnXDq+GxJ1px3f
	 SX5W6S0gX2t1sPvQENjfzOUOniXFaqvlu+YeaUZyB0c3jxpghT0XSDceNq8il6jkfj
	 LjmqvAQe/KpP9kfQ/LnrnnqeVxBv8xg3UP7W/bYCHQ0olt1NBSIRGrCJV7/gwiknkO
	 ZkuE6q7AFeDctFNMT+VIVxfM5kaR1y6ISYmF3YT91Rnq8h1bJhSuXPlax14KzbdOAw
	 l0/LhU0nYLPRMSqmTZ00GYvQ0lKqMwTYGvhWxErP3d9M79mSJ0USz4OT7YOU0tZTMd
	 kG21Fnx0w4G5Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E8AEAC41614; Sat, 15 Feb 2025 18:41:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219773] External USB disk drive and SSD corruption while
 connected to USB 3 ports.
Date: Sat, 15 Feb 2025 18:41:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219773-208809-uIZySFw78L@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219773-208809@https.bugzilla.kernel.org/>
References: <bug-219773-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219773

--- Comment #10 from Alan Stern (stern@rowland.harvard.edu) ---
Sometimes intermittent errors are caused by a marginal or insufficient power
supply.  Maybe the USB-3 ports on your computer don't provide quite enough
power for the drive to work properly.

Does the SSD drive have its own power supply?  If it doesn't, have you tried
putting a powered USB hub between the computer and the drive?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

