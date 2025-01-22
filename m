Return-Path: <linux-usb+bounces-19635-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7950FA19565
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 16:37:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C12213ACF26
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2025 15:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79ECF2144DA;
	Wed, 22 Jan 2025 15:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YTz/kb+v"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01728214227
	for <linux-usb@vger.kernel.org>; Wed, 22 Jan 2025 15:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737560208; cv=none; b=Rb2Ewm/Ok2wRA+EWeqe5shST6M2O5wio3oETTAhNC4YUr1AqtL0Ehq0RLjzynxIwMVclXkVBAdt9630R6/XsSzoa+NhCjqU4ThGIEy3c2SdxgXYIZjlNGIPEfZk5O4QgeMb6epyRZf0+MJetUyeI88xjqcr67HXav5aGy9Upo94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737560208; c=relaxed/simple;
	bh=FnrE8VVsFrsXnr9e9h7Pjld0HEnsfpvWWgv5DXOlxoI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CEoHqOegBKwJYSIYeeImQLCg8B8972flbPCtfQSnVh8vYPiifBcv2zlsLpX8N6439bcy2Co5yKEyJEV6asKJLh5d3JTtdHxiREprgGAu7e4WYc8Ci03tqHKxA9cvebM4Drq1I+j8b0Yb87iZC1j7cemxV0OUG0tCarnZw5cj1pY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YTz/kb+v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 73988C4CED3
	for <linux-usb@vger.kernel.org>; Wed, 22 Jan 2025 15:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737560207;
	bh=FnrE8VVsFrsXnr9e9h7Pjld0HEnsfpvWWgv5DXOlxoI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=YTz/kb+v5Upss6AIzkVtu4OqESbrmQrgoMqATTdCvO4LfMMELLWBml5clDwlI8dtX
	 xrBIaEIeJRdlx/KyhEr8U7AYDCVlyoymFSQCY+yp9HXR/hYR9cEzRvh6bMkTkv/ucL
	 IMBctU1VKY12d+jSz6NQsowcyCbxxeWE9dK/5cEQZ37uYIuTV5x0Mk29OIulYbEqEo
	 K+zl9ddELIu2X+uwxqN5OiC7wlPJGXmQhI/a5umetc8mvgLXDiZ8EH94IOJJZ0xCp3
	 YxCVeBfoHIxGuAlwvuz0FV8rkExgyeyshy/Jt6N5CelWxFnIB9lq4lg9iUOodatDvm
	 xP5Q396kYKgpg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 61D5EC41612; Wed, 22 Jan 2025 15:36:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219681] ASUS Zenbook S 14 UX5406SA: Unstable USB connection on
 USB-A port under certain condition
Date: Wed, 22 Jan 2025 15:36:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dantmnf2@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219681-208809-tOIi9dyhH1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219681-208809@https.bugzilla.kernel.org/>
References: <bug-219681-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219681

--- Comment #10 from dantmnf2@gmail.com ---
Both kernel parameter and kernel patch can help the Ethernet adapter. It
transferred tens of gigabytes without disconnecting.

No luck for the disk enclosure, but just found it also won't work on USB-C
ports (at this time) and another AMD system, yet still no issue on a hub wi=
th
multiple devices.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

