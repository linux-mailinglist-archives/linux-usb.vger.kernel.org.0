Return-Path: <linux-usb+bounces-2357-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 805BD7DBDC4
	for <lists+linux-usb@lfdr.de>; Mon, 30 Oct 2023 17:26:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B99151C20ADF
	for <lists+linux-usb@lfdr.de>; Mon, 30 Oct 2023 16:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FDD818E1E;
	Mon, 30 Oct 2023 16:26:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W978eUfJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21E0D536
	for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 16:26:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 633B3C433C7
	for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 16:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698683164;
	bh=PXD8UA5wRo6+NeLF/0W83reI3LYNsDHCyX+rQeZSBHw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=W978eUfJ6xnihQbnPIgo51VQZQBjO1zSuXz+L5x+oAMrdGEPcRWuwwWxabCBDdloD
	 dCx9rwd1ATh0mo8Wftm3Xa9XPcvl61PjSF+me9jOMubIzsNg61KO6cW2rsQqrtjSwd
	 AAIMaQBvki4pV789JChM6+2lBP44S1iPDeZgIL3oHEbQBNxxam6TBsHgbe/SAPn61O
	 9qC7YSAQhFXSThr//xZ/bGQ6ir5KvgnTSFptoHm8GPpi7JZfm5cA5CjkwuHrKMqo1I
	 KKYAYtRsmn2dJb6CUUyYtRany8tQ/dIs1EYaisHxAAXT/KokQC2N9hu8xAWHWnSq9u
	 W19xPv6ZnM/ug==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 43080C53BC6; Mon, 30 Oct 2023 16:26:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215906] DMAR fault when connected usb hub (xhci_hcd)
Date: Mon, 30 Oct 2023 16:26:04 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215906-208809-aZt7F4QSvi@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215906-208809@https.bugzilla.kernel.org/>
References: <bug-215906-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215906

--- Comment #13 from The Linux kernel's regression tracker (Thorsten Leemhu=
is) (regressions@leemhuis.info) ---
Ideally this should be fixed, but we are kinda stuck here:

* Piotr, do you even care about this after all this time?

* does the problem even still happen with the latest mainline kernel? might=
 be
a good idea to test this with 6.6 or 6.7-rc1 is out (e.g. in two weeks from
now) before doing anything else.

* The regression was never bisected, hence it's unclear which developers is
resposible for handling this (USB? IOMMU? something else?). But well, with a
bit of luck Mathias commented earlier and might see this and share his
thoughts.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

