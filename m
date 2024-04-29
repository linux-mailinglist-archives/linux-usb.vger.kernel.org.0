Return-Path: <linux-usb+bounces-9884-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A92928B56A8
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 13:31:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 430CB1F2174A
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 11:31:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70C0428398;
	Mon, 29 Apr 2024 11:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OlOPGrp8"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C6F4778E
	for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 11:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714390206; cv=none; b=WT43Z58xyypeJ2tLitliH9urXUXUzt2KtMUsGZ8/kkmt4x+v0B3kUcdQM4Xu2fpxaft9QJbuOAZ5BVdlnwBJ+KWbJWBIely6P5FznBnRCJ8cF0G9Dl2ezzFFMoFG1XBDWaNQEYvLxOFKGmkVXy112WUBHIPUl6g21JEKDhmuCOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714390206; c=relaxed/simple;
	bh=99+38b49VNXEx+Xavan8Eios6IKLbaVDVZ89RWNKRIg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=kX6F2C4txJwnAgikezy3WcKjs04t2Fkf1BhaXFZCSKz3gSo0HHh32Go9YMMDdy921X6tMocLN/qLaqQYiSylSFv14YiQeN4GbRc9YftnXkD9PhWTPth3WuVV3gyZaF6cDjaXj+aFkxd3XZdSfFWULALHwqtLZaPDiG+wygCyhkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OlOPGrp8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8684AC116B1
	for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 11:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714390205;
	bh=99+38b49VNXEx+Xavan8Eios6IKLbaVDVZ89RWNKRIg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=OlOPGrp8N+bTsjJL8BJCZD9fe2kxWVq2Y/25gPF+vVQ5kbpglK5hOFYQzyr2k4xK/
	 Zix3hYbgH/3DGYKbBEnod8RksdH5+ngYujQo/ov8WAFOqux920mUFJtiOuqTbAepCr
	 yXM/YwELtygeVOMcbyVydu8eTgH3X1AF6qnWO940hdoEuKeFCN0MUJWd2S2K63GJ4s
	 46h2D0HVKumHhkTdEmPkRyjAbxrJPAiT2psVB9+ef+WonoPZLT9Zqf85uEFc0QBRjs
	 gxbvbtrACih8na9u0OuFx3va7+ALqlFYCnk9nKT4fEmepIdckfa03PglUUVck7JFmG
	 XEKOZ/tDLFzhw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 74B95C16A72; Mon, 29 Apr 2024 11:30:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218789] ucsi_acpi USBC000:00: ucsi_acpi_dsm: failed to evaluate
 _DSM 2 in logs
Date: Mon, 29 Apr 2024 11:30:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: heikki.krogerus@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218789-208809-6gXXt50alS@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218789-208809@https.bugzilla.kernel.org/>
References: <bug-218789-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218789

--- Comment #5 from Heikki Krogerus (heikki.krogerus@linux.intel.com) ---
This issue has been reported earlier (indirectly):
https://bugzilla.kernel.org/show_bug.cgi?id=3D216438.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

