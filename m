Return-Path: <linux-usb+bounces-17978-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25D2B9DF740
	for <lists+linux-usb@lfdr.de>; Sun,  1 Dec 2024 23:07:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A53C528165F
	for <lists+linux-usb@lfdr.de>; Sun,  1 Dec 2024 22:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 243431D8A0A;
	Sun,  1 Dec 2024 22:07:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qnuoXRRd"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DAD41863E
	for <linux-usb@vger.kernel.org>; Sun,  1 Dec 2024 22:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733090820; cv=none; b=N29PSBw76TKLkMndKEmMXm808OfoDEMJpB7uDtqr+XZW8JxLKWqNQLcyroE0Y76346gTgmxoGy7WB6ExTyYX9N5X8VaJ3goAsECOce1Gdh7NyFcDhSnl0Y1r0i2oNiW6fSWnY7iDoeNyc4WfMkW01bB4fajkKaQtqcI0vkQrm+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733090820; c=relaxed/simple;
	bh=e05i/01jmMy+uT6HMxJk27swKOLjB1eM/RUDxUiH5is=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ic6vj6oBumLEysGC2i79+Wl3/jH0f8hSEj7iTT459IJYknLh4mpjpMatSWkXEK2R9agN4lqBSE1UN2bOQ4Vj8wYMszrkcllHaEz5yrNvxqg/8wuBB/d68zU09vmCkhEHfGVanu3UuPQ321Bb9xNzurYFmPte2XeztQqiXUO/Y+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qnuoXRRd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2DB81C4CEDA
	for <linux-usb@vger.kernel.org>; Sun,  1 Dec 2024 22:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733090820;
	bh=e05i/01jmMy+uT6HMxJk27swKOLjB1eM/RUDxUiH5is=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=qnuoXRRd0pHDZ4XWub8nOPdY+tFKnKAj2HCSEtWZzYz6dmH00Nq1MlHiKxiM4Yd9u
	 zHDJJfEpAJpf3Azk5oJizozldo/QEt6/QPh34cas/5k23Cq36C+ORzMHnOWPTcL5ii
	 7jbhEwf2Rm2W/0gSrGmWrsrikjpPEcuTMhkm502U1isuL7qrXeEbE8r62x1Kj5/VMB
	 tmgaN+hsaRucssAjCYc05idig1jH6HBjhMLX0e/UuWc0j1I/EjqX1w71gVHtHhOGlS
	 XEmytP1iBSWJYf9RPxXQKMnYmC6GM4LsOg7/9Zi2VX6HCTNJynLY/v/WaoRagR2dsU
	 uBjbkolQSxAPg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 19A41C53BC2; Sun,  1 Dec 2024 22:07:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219532] Crash in RIP: 0010:xhci_handle_stopped_cmd_ring
Date: Sun, 01 Dec 2024 22:06:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219532-208809-lyTeBQmT3c@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219532-208809@https.bugzilla.kernel.org/>
References: <bug-219532-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219532

--- Comment #7 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
No sensible way to handle it and it should never happen. All we could do is
print an error and return immediately, but in any such case the xHCI driver=
 is
likely already FUBAR anyway.

I *hope* that you are mistaken and your crash was caused by dereferencing
xhci->current_cmd in the next line, due to cur_cmd being NULL. This is not
supposed to happen either, because the check for (xhci->cmd_ring->dequeue !=
=3D
xhci->cmd_ring->enqueue) is there exactly to catch cases when no commands a=
re
pending and cur_cmd is expected to be NULL.

But it doesn't work for one in 255 commands, namely when the aborted command
was the last one in its ring segment. Then enqueue points at the subsequent
link TRB, while dequeue is already in the next segment. Until recently, such
command abort would have failed due to a different bug (and caused different
problems), but that other bug has just been fixed and it looks like we may
start seeing those NULL dereferences now.

This patch should keep your system from crashing *if* this is the problem t=
hat
you are running into. The driver should print "cur_cmd bug detected, 0 fff"=
 and
continue working normally. (Which means, keep printing more of those "setup
device timed out".)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

