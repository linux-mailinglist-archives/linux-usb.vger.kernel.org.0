Return-Path: <linux-usb+bounces-2754-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CCB7E71E7
	for <lists+linux-usb@lfdr.de>; Thu,  9 Nov 2023 20:07:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5788A1C20B10
	for <lists+linux-usb@lfdr.de>; Thu,  9 Nov 2023 19:07:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FF3322325;
	Thu,  9 Nov 2023 19:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UkODoKK/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7FF1DA41
	for <linux-usb@vger.kernel.org>; Thu,  9 Nov 2023 19:07:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3E0BEC433C8
	for <linux-usb@vger.kernel.org>; Thu,  9 Nov 2023 19:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699556848;
	bh=vQYEPYVnjJzh0MnSvAtyrSpubv8GByL0VPdrdiEIZpE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UkODoKK/VSdM3E/NEiJjGhIa8ZXfydoOvfPS6CkwtJbEulWmc8YEjTPgoFVp8Cj/b
	 9DAMFvAK+rxlbN5mQCcvc9mJFv2JA03Nb2DysrkQObbWhcVuo3UQY/blGfWK/pFrjy
	 gO878A4m6C0q7BuAZWRhBAw+FZcHeGAez0JIevfBqe9bLZSV/99lkGmu2+7bWKfGhK
	 UvsLpLXFe77kgWIMNLYWJ8TnaAwiFuN09LT1bxFCsSQ0XLaRabisX0YZMdWtUfMFE2
	 NGhPVIaRRXnQ9FW+V12rykUR9KN98gcExOL5FWyh7s2nay1nlXHs5CmSaOHRtFqQSZ
	 7WiyQ70dXmWFA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2D59BC4332E; Thu,  9 Nov 2023 19:07:28 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218118] USB3 port does not work on Chromebook XE303C12 with
 Linux kernel 6.5.11
Date: Thu, 09 Nov 2023 19:07:27 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: quark@disroot.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218118-208809-9uzolpkqEe@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218118-208809@https.bugzilla.kernel.org/>
References: <bug-218118-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218118

--- Comment #3 from Andrew (quark@disroot.org) ---
Created attachment 305383
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305383&action=3Dedit
kernel config

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

