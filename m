Return-Path: <linux-usb+bounces-26052-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D1CAFB0C710
	for <lists+linux-usb@lfdr.de>; Mon, 21 Jul 2025 16:58:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AC5DB1883AF8
	for <lists+linux-usb@lfdr.de>; Mon, 21 Jul 2025 14:58:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EA602C327C;
	Mon, 21 Jul 2025 14:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a7mVZwn2"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5D92E406
	for <linux-usb@vger.kernel.org>; Mon, 21 Jul 2025 14:58:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753109886; cv=none; b=ZutrP5rnS9V32GTQeUkIcEOrCw2mYxvE7Vfbn0Bu+rTcuPpk56eBtA0FRiULhMa4xZsTADeZLOXEPO+saWTwXPuAa30cwylvqZpubMXk7Cc3mvgT9QbWWjhUTaXPQPSGgdPxKaMT4mP6DPgPdELejP+BbndzoNaRMxrMjX+4dok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753109886; c=relaxed/simple;
	bh=wha40rYvdEdCzdiiXuLRpcxaRoij+Gp1NI62obIwXSI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UR/h/yrwEb0C3N25wiYlbLSXHoaGXN0iCpwsbJ6bS6lI4GdtWae1UYfrJal49tZb07VYKmpSgyTXHiIiWDtVONZYdyEWUPREMk4M99aYKwa0Sn9BC4JeSsi/mhaO5usHQAuQxusM9WvFruZ6B+0Jb4CcDALchjtbnVLxSQIaqBQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a7mVZwn2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C4A1C4CEED
	for <linux-usb@vger.kernel.org>; Mon, 21 Jul 2025 14:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753109885;
	bh=wha40rYvdEdCzdiiXuLRpcxaRoij+Gp1NI62obIwXSI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=a7mVZwn2znjesb+qZqtQRnwFAOP45LUWQgRBDMGolHBUEwDBonDDqDmomCTeISV5M
	 WVACtALQw6JmkWCSCvzpwjMFvGwWURpLefs9NxBUXKM/RqEjz/ItXg0jxBzoqPgaGG
	 PdC1H6M1Rsu024u3LmNzIsUtX+5EIzmQa3VAkYmc6rMIWT7p+ZQUxLXNO2fpPgMvZP
	 NQ2VMgvWSMgr4t3swq3asdLrSpDo07+Gtq8xEKpVkAL2O9inYf1S/RNCIYBAgSd7tJ
	 pZefqraq/y5RU4epGaeMgyoLNLflxwSr+eOFtOvkhw/ploYhbj2Ieej6bWINyP++WI
	 NIOGNTM05WfDg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 89F5CC41612; Mon, 21 Jul 2025 14:58:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220331] FTDI serial IO - unknown device type: 0x8312
Date: Mon, 21 Jul 2025 14:58:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tomas.hanslik@septim.cz
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-220331-208809-YidEqlYeGQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220331-208809@https.bugzilla.kernel.org/>
References: <bug-220331-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220331

tomh (tomas.hanslik@septim.cz) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|RESOLVED                    |REOPENED
         Resolution|WILL_NOT_FIX                |---

--- Comment #2 from tomh (tomas.hanslik@septim.cz) ---
ad 1. The device is not recognized even in latest kernel 6.15.7 .
ad 2. Where should requests for a newer hadrware support be placed then?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

