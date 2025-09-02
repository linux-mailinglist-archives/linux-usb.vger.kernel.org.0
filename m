Return-Path: <linux-usb+bounces-27475-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7228AB40F4F
	for <lists+linux-usb@lfdr.de>; Tue,  2 Sep 2025 23:24:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4146916747C
	for <lists+linux-usb@lfdr.de>; Tue,  2 Sep 2025 21:24:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A98402EA16D;
	Tue,  2 Sep 2025 21:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AEVgyRzB"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2070820311
	for <linux-usb@vger.kernel.org>; Tue,  2 Sep 2025 21:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756848253; cv=none; b=PpekwNSnwI4VtWBpbNQoYPi1mJOc5iqoJGv6VL+FTUN7YNtdcZ8iCW55DBuQt02MP5INZkkyohS3My9Oy+KiAByPkJLMZGrN0dOOA9d/KvryxYCrAwQKc8RS42hzbrZVTkq0BhCYMfUcCh9Z8/RbURkUD3URwqYRLx8T0tDyxp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756848253; c=relaxed/simple;
	bh=T8lHMqisD1YdUogAdKOVvGsxIyfALyzAtpZmbB9nZCo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=X9UymrrRWDP3zBXWpqW479qT0QxqD+b2w7DhgMKeEN+1eOg5/2zLh6cVSpr+lf/LyDxCLVxc6sj7zDgO2Z4DdQiCXm9THOJnxhyb32EzsHuW5vOV/WhX8HdLEbI32LWpTWX4Mrf1Dy8KqPBSVfi2v67KMPOurszThqUeaOoL7DA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AEVgyRzB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id ADE22C4CEF4
	for <linux-usb@vger.kernel.org>; Tue,  2 Sep 2025 21:24:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756848252;
	bh=T8lHMqisD1YdUogAdKOVvGsxIyfALyzAtpZmbB9nZCo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=AEVgyRzB1O4EnW+chthrIFFkD/VlJ8yDbMiIbpkYILHP8h6Oh19RE5opkCJ6D1tHs
	 MiIE/F9deJaLITGwtDZnnC21dEdbY4TOz0KqBNXRfe5PAw8cmTajlbe9Xb6yin86aj
	 5mZePbERDlcJFXlH/jaSZ2frvPbBTDrjVcccyxhZwkmtg/mgIljO7a7Pu5OgGiv0Gr
	 4MhdX9R1ccyKO3eu2K8l07fGBzjgRIQ6jizXQfs+j8LLDEa7tBWtbJVfvhEyGCcdrh
	 ws/VPdTWE57V01KA4ddPU+izcqrZfegRP7+x/o9+HPp/0Sj/Jm+N8WqFbl4y7qUEu1
	 ossh6yHYtWEhw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A67F4C3279F; Tue,  2 Sep 2025 21:24:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Tue, 02 Sep 2025 21:24:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: paula@alumni.cse.ucsc.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220491-208809-xwYsC9D5vb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220491-208809@https.bugzilla.kernel.org/>
References: <bug-220491-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220491

--- Comment #18 from Paul Ausbeck (paula@alumni.cse.ucsc.edu) ---
Created attachment 308606
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308606&action=3Dedit
emb-qm77 suspend/resume dmesg log with xhci_hcd & usbcore dynamic debug

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

