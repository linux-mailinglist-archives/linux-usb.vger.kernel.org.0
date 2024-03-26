Return-Path: <linux-usb+bounces-8348-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1610288B8E2
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 04:44:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47BAE1C2D301
	for <lists+linux-usb@lfdr.de>; Tue, 26 Mar 2024 03:44:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE634129A71;
	Tue, 26 Mar 2024 03:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RQKicFFU"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6579A21353
	for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 03:43:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711424635; cv=none; b=WLgJvU3HJEu/JpxJpE+2XsOLar5jxR7YoXcylDehJYWerUJsBkglgA1giVrD97LEP8OmiVPS9ucTsWcLlllzZ2ISOS44A20la9lx2bShsuuG94zlHAGCjpQ38wWrwwykojEK/NgfDdGYbT9ABdnE31qXdr9oy2jAyV0z6C3Y0tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711424635; c=relaxed/simple;
	bh=+o0whJcG8vCmfbHk6BiIC7A0pBlm7AmyVTKd4sRRu0w=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=N6H84BZ0AZY+SEFWqrNBssbMS6H7Ks3F6Y87f0s/w0W4/72Zx6tVT/HqfEPFWkWTxo/hF3rEbeDM1XZN+j4I9+ldcf8C7wSefwtallEuxZVaGlUMNZlcy7L2itakIkL+fYADthdfRaFpaCf4NvGzyjvS216q3MiWKzVoFAHDmTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RQKicFFU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D940AC433F1
	for <linux-usb@vger.kernel.org>; Tue, 26 Mar 2024 03:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711424634;
	bh=+o0whJcG8vCmfbHk6BiIC7A0pBlm7AmyVTKd4sRRu0w=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=RQKicFFURT4IamU3HociBLyMaskX3Bp84e3fBTwviIq8cYVZTWltRAMyEZTwroeIc
	 nhQ9Z4HIJIkMFCd24j63lucHshoH288riomznqnNXfqEyguRNsfC76VN3oAQiydVAp
	 95XrUm/dXLoVFS2FbRVxnY4QAZLj79uEsPgw0IiEIldzo/lbOgt+vAqxsL6CffTa7f
	 JTpeCnNr73XfS3T1FEkt31QqZcBLpALasTujFGuXsB9kcqLbOOaUapAkMIvLXlYwZM
	 kXUJOyKslUZTEIIm5GTLgdrUHpNeVWNJlNU3trd1hSJ4HqU5B1PRfVaqrTjndlfEkV
	 PzH4bIIbs4ulA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C6731C4332E; Tue, 26 Mar 2024 03:43:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218526] Unable to achieve 240hz on usb4 docking station
Date: Tue, 26 Mar 2024 03:43:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: samworlds123@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218526-208809-RHfZUbuGOl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218526-208809@https.bugzilla.kernel.org/>
References: <bug-218526-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218526

--- Comment #3 from Samuel (samworlds123@gmail.com) ---
Still happening on 6.8.1

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

