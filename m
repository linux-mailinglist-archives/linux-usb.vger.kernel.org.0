Return-Path: <linux-usb+bounces-2785-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E1C07E7D81
	for <lists+linux-usb@lfdr.de>; Fri, 10 Nov 2023 16:47:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E21DFB20E01
	for <lists+linux-usb@lfdr.de>; Fri, 10 Nov 2023 15:47:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9AABF1DA43;
	Fri, 10 Nov 2023 15:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nFQR2tIC"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDA001DDC3
	for <linux-usb@vger.kernel.org>; Fri, 10 Nov 2023 15:47:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 69452C433C9
	for <linux-usb@vger.kernel.org>; Fri, 10 Nov 2023 15:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699631265;
	bh=CyESPWM2Ofo5PwwcT2g/s9Z1xODQ4fTPqdVxS1KQsb0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nFQR2tIC3TE/2iE1nr1oO8mSXEUIp5KHci76s4jJDzjSThmZ52zfUFKw8KprjLhLO
	 ZO9b8gfej1em4mUX1jcEnqgQiNrWF1HiM/1aLeH0XcVJ7FdeJBCiXaQwn5pZbdXvmF
	 3dqHrbPb9b6yVKeSdDkh7+v4BSW9M2+ekW8SP479nGEOq0TmOusjTvrZul8WJEmuKS
	 kaziAVRIgogbYt22LE+j5DmJjnChYK8qnivmiN843WwfGFyJlx6dtOiejju5s81tFy
	 UKC0jR1K8nhj75KT0mCMcMddiD6w9vDxHDiXsfU1qgBnjn3U5XiYlEPG8L+R6pg8mk
	 Gbsk3AQVQKXjg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 42117C4332E; Fri, 10 Nov 2023 15:47:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 217715] USB from Thunderbolt 2 dock disconnects (xHCI host not
 responding)
Date: Fri, 10 Nov 2023 15:47:45 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: youp1one1@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: OBSOLETE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-217715-208809-3jVYUwzEup@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217715-208809@https.bugzilla.kernel.org/>
References: <bug-217715-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217715

youp1one1@gmail.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |OBSOLETE

--- Comment #7 from youp1one1@gmail.com ---
I have not seen this issue happening since Kernel 6.5.6, so closing it.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

