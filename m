Return-Path: <linux-usb+bounces-11122-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 64890902FBD
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 07:02:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D3971F23DE8
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2024 05:02:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FA29170835;
	Tue, 11 Jun 2024 05:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RCmjEVvq"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8C237E
	for <linux-usb@vger.kernel.org>; Tue, 11 Jun 2024 05:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718082138; cv=none; b=c+lK+WQ0H88L5FLssBEsKzpxbbJUjRtn0aPlEeT0UQKY1yvn7hBCnPAolCJCn1l0c5cWAJveRoowbBDogGhSwh5SH3CWIoeTrmUOmW/PdUZcEmJwC7n/Zkf0r43M8+EGmq5S83JJ8ayIckRVfV/y7YELoVa2icSF1WVz8ZVcWjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718082138; c=relaxed/simple;
	bh=r0SWNFg4hq76mDxANfYNxLdYoxe4RoZY/Cjv3DxoKlU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bqZp62bIELjZnmMlJoKRuT95LxAaEAnDqqKG9hwkSg8A4RBYCVnuBNB9qFp/JiIiGA0xTUACpUsDH7Gr7ah/NiD2s3vj6xaCkqAgXUNq3rM6KqdkG5zxmkW9Ghv0ogU44V5cypUw8QwHE5u3aGGvehDlYjnJmkVeem6JIH/FQMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RCmjEVvq; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 38789C2BD10
	for <linux-usb@vger.kernel.org>; Tue, 11 Jun 2024 05:02:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718082138;
	bh=r0SWNFg4hq76mDxANfYNxLdYoxe4RoZY/Cjv3DxoKlU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=RCmjEVvqqqOVA1YAAmU5NyTVMxpHht6yhQabGwbqQ2q05YbCNqDGT9GuY0vMLlF+L
	 rj/9+g51BMeqwdqGC01kcYtA2UrvVDRU/n2iJGnvf/lSPEvH0QxQgWnY5yAjNZrlPu
	 X4xvSN7RxK+jyPtH3pW0kD4pjJNRJDWsck+B5Ho5bc7vX8egmUjT/+5L80HnaOdvsa
	 epaTa5z7zTOGbZpzEoLgMmWhWoVnwlaLPcTl0eJ2qWFO2v4AfOJN3FvZke1pxEKElo
	 8yiVhqRXH+1PrkXYmw9gFK2t7E0CKvAiOm5saRI+qo6t0g+9QTWqL57Pc1NbUYSnON
	 pDRCD1KjlcQ7g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 24CE4C53B73; Tue, 11 Jun 2024 05:02:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218943] No SuperSpeedPlus on AM4/5 Hubs
Date: Tue, 11 Jun 2024 05:02:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jarrard@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218943-208809-o2hs0fYnlw@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218943-208809@https.bugzilla.kernel.org/>
References: <bug-218943-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218943

--- Comment #10 from Jarrard (jarrard@proton.me) ---
Device is working under SuperSpeedPlus for windows.=20

If I boot to Linux (dual boot) it sets to SuperSpeed(NO PLUS) and then rebo=
ot
(not ac off) to Windows it is stuck in 5Gbps mode.  Only a full AC off will
reset the device.=20

Linux is forcing the device into 5Gbps mode somehow.


USBView Pastebin from Win10  pastebin.com/HDJm5wDg

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

