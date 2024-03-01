Return-Path: <linux-usb+bounces-7380-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6D186DDC2
	for <lists+linux-usb@lfdr.de>; Fri,  1 Mar 2024 10:01:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CCBCB1C232AD
	for <lists+linux-usb@lfdr.de>; Fri,  1 Mar 2024 09:01:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6B3656A33A;
	Fri,  1 Mar 2024 09:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f5qhPYS3"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E99B16A02F
	for <linux-usb@vger.kernel.org>; Fri,  1 Mar 2024 09:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709283643; cv=none; b=XHozCptQEUE1RhbkSM7S7RNKEQNVPoILqhBSbQnnh2P/EpsxYmxr4E07mwt1xTwfoQvIaX6X4BDb6/bulho9FfPeE/QzsK9aytf+GMqf2q1BbTMZXAE2zly4Fy9em7iLwXostd2qk6q3PEggQz8BEq9CDneh9Wn6QQtnN3xBAxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709283643; c=relaxed/simple;
	bh=L+NmDoVEulCbmqzMRM4huHL15WkLI9euTQQBh284pLc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=vBjECn4nktQxGEMPLgm7aQEdwuwNxMVr+k5kYiaKvE/lBFUfZS5Ep0l3RrS9qRRNM7DRAfZLDbQRMf0Grbls6M4kkdM6Es2h/KWuU0Rj0iZlVsN78nAmVWrGO0dMzRE4/n9gWGEGZImD6dgZNqxbZN3ikSlwnpJ8eDtm/yr5lgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f5qhPYS3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 741A0C43390
	for <linux-usb@vger.kernel.org>; Fri,  1 Mar 2024 09:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709283642;
	bh=L+NmDoVEulCbmqzMRM4huHL15WkLI9euTQQBh284pLc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=f5qhPYS3cATBcHSbJHAWMaVc7U2l6UkZnw3E/I7N+TOIzbLy6CqD/zkOKUKgbBxqJ
	 lBI4fqnvAtbEgmZESe6OnSWaMy24tUAP/No4/lXSLpFDyE56NavvtyBETDceCDmsGm
	 y9/18dOa5ZJHYgl1Yxy7bQko60gxX/W5PMLB0WJRbi3Xi7Mz2hpfiT5giKlbf92eXt
	 JYNYeKhxNp9ef3eqJLhI4QGmw8tUSnL4MCr2YS9FNgsQjzG/DGKF22fX5Xg3b9kB3E
	 HeHPKaIvqYsjTpHEEkl2TaewLe1XrIE/huE0b3ZgetYz5tXIk/H7ApnUCL30b/tiGl
	 Bx0OtBUNnx3gA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 63DF8C53BD0; Fri,  1 Mar 2024 09:00:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218525] Thunderbolt eGPU bad performance
Date: Fri, 01 Mar 2024 09:00:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kaukov.peter@pm.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-218525-208809-7DXPn3n4b4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218525-208809@https.bugzilla.kernel.org/>
References: <bug-218525-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218525

Kaukov (kaukov.peter@pm.me) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #305925|0                           |1
        is obsolete|                            |

--- Comment #12 from Kaukov (kaukov.peter@pm.me) ---
Created attachment 305935
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305935&action=3Dedit
RTX 4090 lspci log

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

