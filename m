Return-Path: <linux-usb+bounces-21286-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 79996A4C668
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 17:14:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6F88518985B2
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 16:12:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 782CA215F43;
	Mon,  3 Mar 2025 16:06:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X9Qg7QEf"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F030C21504A
	for <linux-usb@vger.kernel.org>; Mon,  3 Mar 2025 16:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741017969; cv=none; b=L5az1lbMA8saPHj1fOaM6+AHWgQcWv248ldrTOvXOVSn+R6fWLVCrrvk2LC4eC9bdqaQgiteaur8TRauCkqWVfye8JvMNlmx0suKjZZ7SJkIkGwLAV1JBAf0vRLNgou8tqiFKabcWAffcioYtWsMCooCE1RhwYRT8DGQ/jKha8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741017969; c=relaxed/simple;
	bh=d6fFXQBUASKPmrEGDuVd/CBZlilsI3XTLNt8OAnLhIA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=r9iNkczkQ9mcxu4l3jjgPZ2JnHg/Xyr/EFige9bifSJU0S/XCur4cBR4Q1JH5wC5yIyKwR0TcYekLsGFF1UnzKBaFf6RlSH37aBG7S6iSHcYLCEBCyf2L/xS31s+UaHQfZnXEr+9UEbVB7McpNlZRslxf/0zIj74983vYLwxmVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X9Qg7QEf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61B9BC4CEEA
	for <linux-usb@vger.kernel.org>; Mon,  3 Mar 2025 16:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741017968;
	bh=d6fFXQBUASKPmrEGDuVd/CBZlilsI3XTLNt8OAnLhIA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=X9Qg7QEfDwY5HP1jWKLKomtrOXAlnqZZJccuo049i3oFRcJyLd0y7+5bYMu3vsf2Q
	 I/92SncE7u2Az362Jf0uUH9VFdnnSASX/+gLQsdnBQLpCXShyLxF3WJRuRGQJCFEcg
	 D6Rp8mki2EUj1jc8ftxgeqcNV/kgOjQqISwUkTAPTPb1/uoLy35FmRhOFMBZ7K35OK
	 9UpKgXxhAn9KgZn1FBtepkTJX82JuGiaPsU3fY2pLTc5+P882BG8yXd4i33Gh5cHA2
	 dLqZ1hACmJItBxcxfqbspJwXz4yQdB5zjTcD9PUDJgKcs+cQN8EX3WH1Vg+D9XB0FQ
	 61oStuGu4Tkjg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 54854C53BC5; Mon,  3 Mar 2025 16:06:08 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219748] Pluggable UD-4VPD dock appears to continually reset
 with AMD AI 365
Date: Mon, 03 Mar 2025 16:06:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: lyz27@yahoo.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219748-208809-Pycy3TtO8z@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219748-208809@https.bugzilla.kernel.org/>
References: <bug-219748-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219748

--- Comment #15 from Thomas (lyz27@yahoo.com) ---
Created attachment 307733
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307733&action=3Dedit
dmesg after delay-router-enumeration patch

The latest patch resulted in the dock detaching again.  Dmesg attached.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

