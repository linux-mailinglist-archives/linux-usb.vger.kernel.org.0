Return-Path: <linux-usb+bounces-14277-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3903A9642EC
	for <lists+linux-usb@lfdr.de>; Thu, 29 Aug 2024 13:25:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E184E1F2574F
	for <lists+linux-usb@lfdr.de>; Thu, 29 Aug 2024 11:25:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DD6AA19006B;
	Thu, 29 Aug 2024 11:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kEGglwWn"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66CA3189F58
	for <linux-usb@vger.kernel.org>; Thu, 29 Aug 2024 11:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724930712; cv=none; b=bcK02YqN8gUidWlk1LeielinIKTX5sMm+AK6UDV1/05r6o/gZQcROu9X9I01CvUYv6LzpPmBrr6gTVeM5LLrJMYrJuuXiz+LR5C8+agEsaGbNlhrBZv8xU5LZRFL4FbbFGIe5RUkkfp+QaTQJFC4g4V5oXIlb2M7zSerJSWN570=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724930712; c=relaxed/simple;
	bh=+O5hgZZAJjghdQkw3YdfT/6+mfnMiHrUsla0mRUStcY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Q82YHmmj86SlBR3TdgryTRsrE4B6s3r3b9s9A/0R4vE+eXJkcrD7cir8f8Vw1X5WBPHVAjoQa0paT5M0uozAKy8SkuJKoSWo2kNEdPz6cfPOplLa9mFQqNMnuwLI3Ln7lROTL1DB6GpILdL9SXjMxU30VSzDU+xEm43mJh8bnGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kEGglwWn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03878C4CEC3
	for <linux-usb@vger.kernel.org>; Thu, 29 Aug 2024 11:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724930712;
	bh=+O5hgZZAJjghdQkw3YdfT/6+mfnMiHrUsla0mRUStcY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=kEGglwWnybVVliH5q6QBOQ4ixUr/hq8P0OdhTq7Ezq4S+A6UrDE2hm1pXYw1HXt2m
	 Yqd6hk93lRt2Ote3tRfY7sMADoIAc3pMy0CeGzB8AAfP+fz+YIGsuU2QZ5RxKV+EiJ
	 uY7hVkKlfnyqccJiKy/aOE7mRdSk+TVGgBl1SgvDUfpsB4CJIrKPInC9Mx0jPpBCTc
	 jW2ZYIqPc9f4mzdZJwNxvY6YrKlx6M9djOtl24qiDMfkmb7g1Hd9A6P4dD9mdniRgh
	 Bx46fqV77HiM8k+EEeNsqy6goEh/zVhy/zbRSjxD2S7qQNAyXde888zu1A3EYvbgtM
	 S9NPlgrUuPzNQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E1DB7C53B73; Thu, 29 Aug 2024 11:25:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219207] USB3 broken on Lenovo X1 Yoga Gen 7 for all kernels
 version >= 6.7
Date: Thu, 29 Aug 2024 11:25:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: component version assigned_to product
Message-ID: <bug-219207-208809-1ZcvV5RsbK@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219207-208809@https.bugzilla.kernel.org/>
References: <bug-219207-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219207

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
          Component|Kernel                      |USB
            Version|unspecified                 |2.5
           Assignee|linux-kernel@kernel-bugs.ke |drivers_usb@kernel-bugs.ker
                   |rnel.org                    |nel.org
            Product|Linux                       |Drivers

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

