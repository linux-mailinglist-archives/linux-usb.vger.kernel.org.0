Return-Path: <linux-usb+bounces-10607-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1F18D1159
	for <lists+linux-usb@lfdr.de>; Tue, 28 May 2024 03:08:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 38342283012
	for <lists+linux-usb@lfdr.de>; Tue, 28 May 2024 01:08:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E46D79F6;
	Tue, 28 May 2024 01:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZX2q/UMP"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB03F440C
	for <linux-usb@vger.kernel.org>; Tue, 28 May 2024 01:08:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716858522; cv=none; b=glDbFfoq9JNK9ueYtP5HnhszMqHcK4u1HbXo4mJeeIbLL7y9NjWyufDS1+OB2FBvblmEEEBmS1PyaLTTR1yOASD386t7ObcoQkQQOSY2oR03j+nCZpybZ8H3jsVTGngStathEG+cJ2fBXA2H1TxoYOiA5hSP1idC0ZKOolOtS/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716858522; c=relaxed/simple;
	bh=97A6UhnCu8hExDvcfrlM6AhDlsTEFnLfZ9vX9lhEYIA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kaObj3GhIaexYB8bA6chmI6xFtOdDvPI366wBBYcc6FPDQFCIMWSIhwCh7B0vm9jYivYaOzkRvoA+HFvCDQV3adneI/pRD7G781rz5qlMfhqOYLDNXVgGni3DTG/bfvoZw3/qumtJ6ZgH0zohwbncN/pcu0IBHR3f9f5Udd8h1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZX2q/UMP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C8913C32782
	for <linux-usb@vger.kernel.org>; Tue, 28 May 2024 01:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716858521;
	bh=97A6UhnCu8hExDvcfrlM6AhDlsTEFnLfZ9vX9lhEYIA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ZX2q/UMPja/0+YUy8hKQsNctwzJX4DWm5oet/ZfwoO4V1kZ7z4tEigh66WBr2JIVR
	 VpUcDxtlosD3CTgm/aksKiFu3h1OKO4R365pBTSnuBR0TxQUyRAlJyLMlkK9DVo3gG
	 w2Ziu2S9SYTq41P1FbpPm9S8FKtVzrAUBlDwVMHxTtch+BAA6fpZujLN2cbuNk8IGg
	 cbdis+w4KF45qN0iHT6nHxEadx5bXjH405RbbTrJ/e0N5YfOgogXEouZDaDDF+Mj4p
	 sGmIjenbGYeyPT3nifPSYbO40OiniFxFIXpfUL38P84I92nXwaP0llwpaAbT7L9pnx
	 f5Q7QeQXuHeOA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B3D7CC53B7F; Tue, 28 May 2024 01:08:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218890] reset SuperSpeed USB device number 2 using xhci_hcd
Date: Tue, 28 May 2024 01:08:41 +0000
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
Message-ID: <bug-218890-208809-123KApREiC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218890-208809@https.bugzilla.kernel.org/>
References: <bug-218890-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218890

--- Comment #3 from Alan Stern (stern@rowland.harvard.edu) ---
That makes sense; the commit changes the sequence of commands during the ea=
rly
part of initialization.  However, to figure out what's going wrong it would=
 be
a big help to have a usbmon trace for an earlier working kernel, such as
6.6.15, for comparison.  Can you do that test and attach the trace to this =
bug
report?

You don't have to collect a huge amount of information.  The first few seco=
nds
would probably be enough -- up to the point where the "Attached SCSI disk"
message appears in the kernel log.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

