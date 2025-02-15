Return-Path: <linux-usb+bounces-20685-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7375EA37083
	for <lists+linux-usb@lfdr.de>; Sat, 15 Feb 2025 21:08:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AD1593B09EC
	for <lists+linux-usb@lfdr.de>; Sat, 15 Feb 2025 20:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A914018950A;
	Sat, 15 Feb 2025 20:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G69JsNx5"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C184A29
	for <linux-usb@vger.kernel.org>; Sat, 15 Feb 2025 20:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739650099; cv=none; b=BpxKLA06rlb3nT+LXhynjgqWgbX3LXrihax9/AUxluY5T2bYZJp4Mj/5N5WH+0DsvtI5C1cnBqwNZfP1ElIzKMMMPhUAhX1Okwpk0tNJNajC1kqG5Qg/bDNLMfL2TqTFnpjkNV3KwHeqFyltQ5ONDZRLu4tAxBAm22A96TExmno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739650099; c=relaxed/simple;
	bh=TfjH9v6N5clRh/VR498Ou/bixbn2oWhaO11YNn6UajI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=l/xXK9RqqZbxWXB551fCnFgl8s2kcbInEgANxPo3Htf9DlAV5u0t9xABJGVwQ0a/4cxHL1dcW1JjBkC6dsiyXaarjP1Ps5FMmdU1RdAbt4rTHdgrwXlvgRBbETjh97A8NUA8vopGZp7nh4lrFr1YlHJkRoZdDZ7ZohFlrmnndSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G69JsNx5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 93656C4CEE6
	for <linux-usb@vger.kernel.org>; Sat, 15 Feb 2025 20:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739650098;
	bh=TfjH9v6N5clRh/VR498Ou/bixbn2oWhaO11YNn6UajI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=G69JsNx52j9lYE4UxWuIz/Xl1J4LqHDN2E6sdDAL6xDsfFX3YVFtDEyDN0KHf91N1
	 hs/roTtt67nQ/RMTFReG1tAPEGdnVxjRL1HmKJNl1omvqcKhMjsZyQbmIpwSb0lHKP
	 celxZWlF84ygVSSmwaqifupP31NpJOJRm2JIONwGtxh3XdR77tQjUD1YBZapw1hB1u
	 X8bsIPFE2mPRWvXfLQdu+opA6zYTX9vYyHRsHqZzM5HoJuCAFelZ6DKro+oZ3nu752
	 7ZXre0k/rTSRtA/rBQqHinQja/XOBtw1NXBCJjVyjoM9iTi9uxas4fNecbrUrZEYSu
	 d03lHz1JwXRgA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8647AC41614; Sat, 15 Feb 2025 20:08:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219773] External USB disk drive and SSD corruption while
 connected to USB 3 ports.
Date: Sat, 15 Feb 2025 20:08:18 +0000
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
Message-ID: <bug-219773-208809-xaCWwhuKsX@https.bugzilla.kernel.org/>
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

--- Comment #12 from Alan Stern (stern@rowland.harvard.edu) ---
The age doesn't matter.

When you say the SSD was powered by the motherboard, do you mean there was a
separate connection to the motherboard (not part of the USB cable) providing
power for the drive?  Or do you mean that the drive received its power over=
 the
USB cable, which was plugged into the motherboard?

Even if you don't own a powered USB hub, you may be able to borrow one or b=
uy
one cheaply.  (There are some available on Amazon for under $15.)

I admit there's a good chance that this is not the explanation for your
problems.  But it might be.  It would explain why the drive works with other
computers but not with yours.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

