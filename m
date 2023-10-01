Return-Path: <linux-usb+bounces-876-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18D7D7B477B
	for <lists+linux-usb@lfdr.de>; Sun,  1 Oct 2023 14:43:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sv.mirrors.kernel.org (Postfix) with ESMTP id CAC2D281B63
	for <lists+linux-usb@lfdr.de>; Sun,  1 Oct 2023 12:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89080EAC1;
	Sun,  1 Oct 2023 12:43:54 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397349CA61
	for <linux-usb@vger.kernel.org>; Sun,  1 Oct 2023 12:43:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A693FC433C8
	for <linux-usb@vger.kernel.org>; Sun,  1 Oct 2023 12:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696164233;
	bh=/cJYhviEV/gDWiImByJxjaMu5Ounk+f3tupwSJWsGC0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pfTArBM6kj8kgYi+fhVoetlF3xShtSmH2ZjVdJQQ9juIOeLFsTGuPlTbjwC7Zuig6
	 AEGXAcoU2BQKc/GvxxLL5rnUeVEOF+LmqzuCS9oBEkKv7lClv31f4LWMupolOXd5UZ
	 tL0wUj5YY7h4bueETckI0pfaMox0Bfr1k0dcR8h872PHfhHcYM2MXh8b7zvG2aHKfm
	 jS6jK0ixNtIQUPEevkLL3MI2katJXKCX3aP6KxLv/mDBoreg2vjp0Zv5fx0r2TjyPu
	 1YLKCLbMKmPPlvaRh2aBRLvS5EK9nS6s3pOr133JBgHri8n9nFN4Sxg/WAXhKkCwYN
	 23De2+U33GK0A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 95E0FC4332E; Sun,  1 Oct 2023 12:43:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 217960] Linux 6.5.5 - kernel BUG with ucsi_acpi
Date: Sun, 01 Oct 2023 12:43:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alxchk@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-217960-208809-hKGNDdLfMq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217960-208809@https.bugzilla.kernel.org/>
References: <bug-217960-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217960

--- Comment #1 from Oleksii Shevchuk (alxchk@gmail.com) ---
Created attachment 305170
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305170&action=3Dedit
dmesg1

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

