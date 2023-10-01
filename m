Return-Path: <linux-usb+bounces-886-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 676467B4807
	for <lists+linux-usb@lfdr.de>; Sun,  1 Oct 2023 16:25:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by ny.mirrors.kernel.org (Postfix) with ESMTP id 67A7B1C20864
	for <lists+linux-usb@lfdr.de>; Sun,  1 Oct 2023 14:25:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68997179B3;
	Sun,  1 Oct 2023 14:25:17 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA6F9CA61
	for <linux-usb@vger.kernel.org>; Sun,  1 Oct 2023 14:25:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 725A5C433C7
	for <linux-usb@vger.kernel.org>; Sun,  1 Oct 2023 14:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696170316;
	bh=ai5E4NnNEkq16MOEuDXhux93xzttKoDtGw33c4QfobQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=cep/C8FTbQ0f9JHMyf55utEds5lcCFGSIVu3IG9E43Y4L4SA78pbLLzWqDzeseeIZ
	 rbnunbX7xcsmcIOceChIPHgYy1/+0k0REV9UxqBN3QR97F2a4kb6to31Oc0sUjmLB3
	 dkVLcK1+O/hj2cG+LWKgJE8xhCPrDLslnpDFkSYYlUgfg2tO/6bblh+i1zdC2kpH7d
	 Y+ifMdtADBs5B0Qoj21G6zpQd12PFYAjHWLc2Ar3u15JsixdbUZyeCbsZe329gvEmY
	 p7m7U9clTVLRW3BYOKPlI0b+H+idD/IrKNKKmVZODhT9HaVBN202jlWciRDUe/pvQE
	 749kyelMk2XIA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 36CEDC4332E; Sun,  1 Oct 2023 14:25:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 217960] Linux 6.5.5 - kernel BUG with ucsi_acpi
Date: Sun, 01 Oct 2023 14:25:15 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217960-208809-2XnBXnUckJ@https.bugzilla.kernel.org/>
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

--- Comment #4 from Oleksii Shevchuk (alxchk@gmail.com) ---
No. Here is dmesg from 6.4.3 without blacklists

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

