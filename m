Return-Path: <linux-usb+bounces-9836-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F488B3478
	for <lists+linux-usb@lfdr.de>; Fri, 26 Apr 2024 11:51:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0FD1B1F2239D
	for <lists+linux-usb@lfdr.de>; Fri, 26 Apr 2024 09:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 396D113F01A;
	Fri, 26 Apr 2024 09:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="scPDP5IY"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B238313F45D
	for <linux-usb@vger.kernel.org>; Fri, 26 Apr 2024 09:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714125070; cv=none; b=jRTTFtm0CdlOicz5OqMiqQVqMCP+bAYQU3zIoxp/R6AhaM/dhkwKGhm3CzNcAOwk2DIqYSt7ZxpJEKTDXXFB+OTdGDPfhYpSGgxafrbtss6QjIF4JKykhUakzlxIWY7ssQSIV/tPsrKkxDxfvzjG3zI1xaa/FHzY2Lrp4pfEZS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714125070; c=relaxed/simple;
	bh=wsKuM1T4GOhWUMoqEuCsQ62LyT8hF99WouuIXk6bCXY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eEJgmudtI/tAHdsVMDn67+I5usQVGysZacJ6UZTiMWLp1jZ17iODf0fOIyaSKYegK0AwC4xe7X2PZ/tadeYbYGh3OFvVQG61qvd+JeXUdvDTb93nrN1CjSDn49Jh7CVG66DnM+hVw43tDBQVOtX8sLl3lWuDqU20n3aC2yoeCjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=scPDP5IY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 546F3C113CD
	for <linux-usb@vger.kernel.org>; Fri, 26 Apr 2024 09:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714125070;
	bh=wsKuM1T4GOhWUMoqEuCsQ62LyT8hF99WouuIXk6bCXY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=scPDP5IYOy9fS3Som6Q5RggnvtHOdVyooxJuMPKYu17jcUUDx6C/L4pbiEfF/9CVs
	 Rclc4W8J1ajqqJbaylKG6GSZjiNB2RYjbmF3sGrDEPtOCZEhqq1+ssw0oQqINdkWIH
	 bMf48m/9V70rPKz/ZSuguY01qpU1pqBSj5lHrrd/NXD7XPxYAKJDKZuHT5k67gfJk9
	 sYX35S7Rl6qrOI3gcg1BqJvkO2o+lpPuW+aVdnon0ZjrIKGA8fTnl/aUbuJ8zr9+qz
	 xGo3ig03wcwhPGv5KG0zYBWdhewJ/M/YAQ8ztHI2sNPtqnGmOEa7D70zKC8ka0nB+x
	 urlDkAadDLPMQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4A853C433DE; Fri, 26 Apr 2024 09:51:10 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218773] device not initialized
Date: Fri, 26 Apr 2024 09:51:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218773-208809-ptaYd5VOGR@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218773-208809@https.bugzilla.kernel.org/>
References: <bug-218773-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218773

--- Comment #3 from Artem S. Tashkinov (aros@gmx.com) ---
Oh, and please upload `sudo dmesg > /tmp/dmesg.txt` (once this all happens,
i.e. the mouse is not detected first and then gets detected).

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

