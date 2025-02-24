Return-Path: <linux-usb+bounces-20963-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C37A416BD
	for <lists+linux-usb@lfdr.de>; Mon, 24 Feb 2025 08:58:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 22BE03A985B
	for <lists+linux-usb@lfdr.de>; Mon, 24 Feb 2025 07:58:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EB30524060C;
	Mon, 24 Feb 2025 07:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R0eBM31p"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 717591898ED
	for <linux-usb@vger.kernel.org>; Mon, 24 Feb 2025 07:58:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740383906; cv=none; b=nIFttWIUN6Oyl+AODRvYGucUjLm6M27b4CEH7APMACIgwnUK73eaNJ72KbZuJ7pLDXkqieEA4dOnGemMBSIleCFkhu/EyX0d01BINcX64bVPl4JyzEq1eEAeTeRU+kkEAmwvWOiZvepgDXX8OSS4XLtwwUSlb0tsIrHbCOD3yaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740383906; c=relaxed/simple;
	bh=j1U/1ydhLWgRogHJEbNuLwRmtYjGslwD4GoWLkcm+CY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LLLugtLKqzJ5ZGWxxucBMj40UJcpcmwBFqKNyJmaBLRDKI3qpNXxd6zIiGjsAcVuhKi7k87SNvomuETRZcGPRSE2KUEKPpTh5r2vhTbwOkhcC1E6VMzswaJiRiShhqLF5IhIBP1lvwUMHLJZtW3Nd0jo6UGyvTBV0HJ3R0HTlzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R0eBM31p; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EC5A7C4CEE6
	for <linux-usb@vger.kernel.org>; Mon, 24 Feb 2025 07:58:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740383906;
	bh=j1U/1ydhLWgRogHJEbNuLwRmtYjGslwD4GoWLkcm+CY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=R0eBM31pMNyrfHduTaOvp9RNS07iu/XNNxAJkHUgaaHRPwE6HYQkUwu/ncYjg8Yr6
	 x7HKnJrF0xLLqvlJ/JolwcAbCi+aNAweP82WaSgXKuMg2hfwfsk/M5ECdpeQlSdIvS
	 u69HoaSAZFFYvingb8+FVZbsw/daUbeY1RtJXSXpGAOyN336n6dUWza5NzVE5//ZvP
	 Ho0zINDNxRsbS1Fgq3nhvdFSZXrdWrme72D5EgCoRNK6FNm2FfOycTC4QL85G9C4UR
	 QCJLzFlmejbudyPjmp8W26CHhuSud2BM+ZPKwdiUFVdHJmPX/Ies8lzy/ObOY/3Qqm
	 R0RrnXRd3HiOA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D963AC41606; Mon, 24 Feb 2025 07:58:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219748] Pluggable UD-4VPD dock appears to continually reset
 with AMD AI 365
Date: Mon, 24 Feb 2025 07:58:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mika.westerberg@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219748-208809-Jw61O00nHE@https.bugzilla.kernel.org/>
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

--- Comment #14 from Mika Westerberg (mika.westerberg@linux.intel.com) ---
Created attachment 307705
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307705&action=3Dedit
Delay router enumeration for a while

Can you try the attached patch (instead of the previous)? It still skips
scanning retimers but adds artificial delay before we enumerate the router.=
 If
there is some sort of timeout in the pluggable device side it should trigger
now. Please attach dmesg (no need for trace).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

