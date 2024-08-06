Return-Path: <linux-usb+bounces-13146-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 511609494D2
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2024 17:49:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AA695B24B12
	for <lists+linux-usb@lfdr.de>; Tue,  6 Aug 2024 15:46:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21A812AF15;
	Tue,  6 Aug 2024 15:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c0rEZ1M9"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D00C18D63D
	for <linux-usb@vger.kernel.org>; Tue,  6 Aug 2024 15:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722959207; cv=none; b=YMbFEAyuff3qsghGnlnmU7aiFfF+E5jZ/mWKfkkUHU+k1Xa+1ivvZdNC6GMlSreMdy+rYPUKXGyM9Gdow4kKcIANm7DR2UkP8vfkcDgZXh7WxMVNC2Evu/QR6iNMFa/1wuJ2rhVkdEN6uF+UFxprTsq86pgltM5YIFZD+F7xask=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722959207; c=relaxed/simple;
	bh=EfUl/Qg6+G4X7aMivZwP8+7WpyqEwTj2D5hs4t6njkA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=niJMEEvq/9ewnQlJ0XSP33nKuM2jwDFloqpVZpFmZFsGWc6WfKPd+Zeoq9uo8jAu3ezZTiZgfyC5D6Q6rUL4AlsnNUb+j1Sb6Xvy+B1a/UNuB8CTICCz9O0zGSRnDi4jxqRWWga861aT5b6gXJBqYxS+sh4UkmDG/wd4wCKlY24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c0rEZ1M9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1ECDEC32786
	for <linux-usb@vger.kernel.org>; Tue,  6 Aug 2024 15:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722959207;
	bh=EfUl/Qg6+G4X7aMivZwP8+7WpyqEwTj2D5hs4t6njkA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=c0rEZ1M9S6QhnvL6Aw5AwaQUQ7IieKSPTPYAfMK/YGSslJtnM+f4hgeNV4al9A6lg
	 rrqqaEuH+EIIMVtjFXmmZD6FWDsnEdhCcJF9U7xtziSlKwLcwDr7tiDjBLlWAt2nW4
	 v8Z9KtdzNSPluw8NV/9BjcO0abr2l9mZPyUQkW0MMr+1WzY6pcwDpfPnWNnYua0y6S
	 JR4dLK7iQM7/9JnDKY6zteMtKZ38Gr+uFH1fjk74ldWBlTbMis2iykfz00Zgxd1i2b
	 nn9qy1qs1SVWJMSsUgbgospdXQAKJ5cm8Y/3jqvS+flNUfRDwYvRI8vAOy2icenHsi
	 dOfscVzMFFFGQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 039D2C53B50; Tue,  6 Aug 2024 15:46:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Tue, 06 Aug 2024 15:46:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: com+bugzilla-kernel@c-henry.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219111-208809-eusmnhF5yh@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219111-208809@https.bugzilla.kernel.org/>
References: <bug-219111-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219111

--- Comment #29 from CH (com+bugzilla-kernel@c-henry.fr) ---
Created attachment 306676
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306676&action=3Dedit
lsusb -v -d 22f0:0008 with old_scheme_first set to Y

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

