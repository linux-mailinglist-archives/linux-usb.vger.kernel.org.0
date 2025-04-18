Return-Path: <linux-usb+bounces-23230-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 637FEA93C22
	for <lists+linux-usb@lfdr.de>; Fri, 18 Apr 2025 19:37:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA55D7AD9C7
	for <lists+linux-usb@lfdr.de>; Fri, 18 Apr 2025 17:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB528218EB1;
	Fri, 18 Apr 2025 17:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Awg7phWG"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41CE72AE8C
	for <linux-usb@vger.kernel.org>; Fri, 18 Apr 2025 17:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744997870; cv=none; b=oayH5oDnG3NKV6H0PAUY5WPrfgsrty24mikHa/CwOdQYP/WHaAYQKYtaPjLparL+PrBudHOFTRItBe+ZIxoaqt1uG/Aiou6L3aW5gM+LWO7fpovILHppX15IeRh8kTABGTYyMb4tiX15sufPf5ByLj7SQKEK0khJqD/3xzc4mG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744997870; c=relaxed/simple;
	bh=vltrVbVzrSykpSVM0h2jlCRHi5SW1JSMRIp/G2ieRao=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QVELohrkckEVudoNdreXLbXRWNK8RE8J1g9wexhzf+zwNAvZQEBAEvSAaZsPh/9Jkiyyi/pUPH5YfkK42CCxlXJOzfL/H0C7sSzC11G7Wca6VFy8T0h3m1OwgMBqaDvOSYSDlCcyAyaDMvIfUhzvvgV+d1FVmmSU6Z1if/AKJ+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Awg7phWG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BC90CC4CEEC
	for <linux-usb@vger.kernel.org>; Fri, 18 Apr 2025 17:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744997869;
	bh=vltrVbVzrSykpSVM0h2jlCRHi5SW1JSMRIp/G2ieRao=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Awg7phWGopb7IMkSdqeSl66LxoRMj5SLOdyJjNURQ9Z/1gYc3sWOxpBRld9oV+4fI
	 LCYSXtvn/SFzOZjiYSmgiqCiU9iXPpRpEOD0NEMMx6wGlQOILiHzQxuaLqYXIPpaI7
	 ztcwaM9OW5hVn6hng0oKP+VO5pVzXPlfojPfwzp/MFlLbOnBuYu4Ayw9uQQ1CsfWam
	 kRJms3BneWw45TbuGG8tRJ5iol8nK414inibrBPBE8gIXpkIu9yQS5w0AVOVyi1FYD
	 pCrTEGtcEy6MwTfgWQLKWUewPOVOnJLiDo63skgaEq52p1uU/CzS+OTVtg7XNmRpi1
	 rCUc3WQOCU+xg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AE7F1C53BC7; Fri, 18 Apr 2025 17:37:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220016] USB devices plugged into USB hubs on
 6.14.2-300.fc42.x86_64 do not work
Date: Fri, 18 Apr 2025 17:37:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: PCI
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stevenfalco@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220016-208809-Kttvw00M3y@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220016-208809@https.bugzilla.kernel.org/>
References: <bug-220016-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220016

--- Comment #12 from Steven A. Falco (stevenfalco@gmail.com) ---
Created attachment 307986
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307986&action=3Dedit
6.13.10 with realloc=3Don, no keyboard

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

