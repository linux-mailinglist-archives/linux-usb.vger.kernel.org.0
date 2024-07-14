Return-Path: <linux-usb+bounces-12206-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC94930ACF
	for <lists+linux-usb@lfdr.de>; Sun, 14 Jul 2024 18:33:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 740321F21B93
	for <lists+linux-usb@lfdr.de>; Sun, 14 Jul 2024 16:33:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A0C213B28F;
	Sun, 14 Jul 2024 16:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nfA0bUvo"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22B0E320E
	for <linux-usb@vger.kernel.org>; Sun, 14 Jul 2024 16:32:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720974775; cv=none; b=kCLtJRojlg6JEs98w8MZpGQkpbHyXed75hvHLQdAofIYJuoldoReSYW1O8/+qsxZCwfY3hIgkEBYc1rnZW/VaNpkrLs/ESnKuK110GQGLMyBh1Q17qbb8dZCk8GeSJ2YoQJgYnF9ENuZBiKxVczjHAyFBSQtTrqzZUFIZ7yyGsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720974775; c=relaxed/simple;
	bh=Z/rK2tjiO79FnLJpx/y1R+OXecIA75hJ8fZVhnEE5J0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Duza9ncmJd8LPV2IRiBRRQq+kjtH5L+NWM199IoAnkWpMEJsy/NolDbid6Nwo2T7QIKy/Dsi+q5CHYNuq5nVkBigwGZmAjclB5F2zdTGqCit36VU7OQS1TVmQnK/v4cBtKEKfiZECHrnn7Nb9rhpdoP7cMsVwxJauZpee80K9eU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nfA0bUvo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 95A81C4AF09
	for <linux-usb@vger.kernel.org>; Sun, 14 Jul 2024 16:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720974774;
	bh=Z/rK2tjiO79FnLJpx/y1R+OXecIA75hJ8fZVhnEE5J0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nfA0bUvofX0D9oWLcw6S+1tMp6PK52GmTqcq+b6hDkcnHaT0iItEv/rHBSU9qxqtg
	 FKHueex5JjXH4P8tTYbMo72tKgjUACevg2pmqUOASPAiOJ4zDBhWr/eFIEe8cVatdw
	 co8SbWt1sR87vPFxTS1/croBD0oXFfE6dbSj5JZBsrnVflYpLKytFCFXPN1jCe+6W7
	 Fzbgh4D77FL4v7uaBeL8roBxyHK8RHdTNc9cnxGJvbv63rhNWjhQUtya7ouxlZJuob
	 xysRCCnJjR6CqezxpQsE+HMocOFJU0LGpJ2av/JuNhcAiH7EUeUOTe72vz3yibPWhw
	 oyolMZgb7b2KQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 82AD0C53B50; Sun, 14 Jul 2024 16:32:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219039] kernel 6.6.39 freezes with QNAP TL-D800C usb case
Date: Sun, 14 Jul 2024 16:32:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: matthias@bodenbinder.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219039-208809-u8MKwkVPCn@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219039-208809@https.bugzilla.kernel.org/>
References: <bug-219039-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219039

--- Comment #6 from matthias@bodenbinder.de ---
I created a patch file for 6.6.39 based on Michael's proposal (comment #3):

--- a/drivers/usb/host/xhci-ring.c
+++ b/drivers/usb/host/xhci-ring.c
@@ -2657,6 +2657,7 @@
                                 slot_id, ep_index);
                        goto err_out;
                }
+               inc_deq(xhci, ir->event_ring);
                return 0;
        }


I can confirm that this prevents the freezing. The device and the attached =
hard
discs work normal as far as I can tell. I did a fio benchmark run on one of=
 the
zfs pools in that QNAP case and it executed just fine with the usual result=
s.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

