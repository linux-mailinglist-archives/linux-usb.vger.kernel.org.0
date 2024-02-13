Return-Path: <linux-usb+bounces-6335-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26587853119
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 14:00:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 586571C2281F
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 13:00:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61A8C50268;
	Tue, 13 Feb 2024 12:59:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U4hMblDm"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5D424E1D7
	for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 12:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707829168; cv=none; b=elIBJKJoGnw8o5Xb8mPFfXDlcHDHgtLgN7yUXU9+XtltnqtGi68GiTEo1OacAZ1piMitusVwk9o/bveJmsfzXSDMG4of3pt+KGbLdJrfXP/SdkM/LbjZfFyS0O3Kab6DervHMExGHHjX5sVFsUNUAJ0ZIuV47itad7ap9+UAcWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707829168; c=relaxed/simple;
	bh=hJQLDGQUXFpqUB+BJ+GdTbXzEsZDLIr/jTrAfIKa+UM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DNJoWLll+bFvaNG8HyDAG5aAhkf5HylA4Ecki2R9JVgBvohjnR54+kOnTFNrLfMvF8IKH7P6ec0Jvdkh84Dp1mq2ASeFZVMNjYfbi7UbuzzL4ot7zk03XH0g50e/zv56rtfsXoBT1SL5MUJf8Qyi9Ckn/dsGl6f3V2lC+yai9LQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U4hMblDm; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5126BC43390
	for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 12:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707829168;
	bh=hJQLDGQUXFpqUB+BJ+GdTbXzEsZDLIr/jTrAfIKa+UM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=U4hMblDmMi3LFwp7ShX+iejnAiKcm/9ZRlEG+xW4U2qXKLCc99pkAjEZH2yx1cqIy
	 9pHvRokSsUXl6OrIDoSq8BUo36ruvrPohzM0Ev234FCeyZkWwvZAlTXfFqY4CuxaIG
	 ihmtxtneTbnvkn7VELKapDJR4AAE7baFcI2Y7LhJaiE+HtaL4H4ufIimSF9Uljmgia
	 t1lfXqF+sIvy9/jy+jjBbHf+xqb5u518s1pe/b3fsgrjaarcAK0o+91wTzM6HBU6B7
	 W0KDlHLADmjHr/eedqEqMmU12AW33RfxzMgmhxiG6DTVOd/GM2cUqSTSQlc/zRskWt
	 8QUA4MYUolBRw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 41C38C53BCD; Tue, 13 Feb 2024 12:59:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218486] Linux warning `usb: port power management may be
 unreliable` on Dell OptiPlex 3620
Date: Tue, 13 Feb 2024 12:59:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pmenzel+bugzilla.kernel.org@molgen.mpg.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-218486-208809-Vl0rZrIjHW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218486-208809@https.bugzilla.kernel.org/>
References: <bug-218486-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218486

Paul Menzel (pmenzel+bugzilla.kernel.org@molgen.mpg.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |pmenzel+bugzilla.kernel.org
                   |                            |@molgen.mpg.de

--- Comment #1 from Paul Menzel (pmenzel+bugzilla.kernel.org@molgen.mpg.de)=
 ---
Created attachment 305860
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305860&action=3Dedit
Output of `acpidump` with system firmware 1.28.0

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

