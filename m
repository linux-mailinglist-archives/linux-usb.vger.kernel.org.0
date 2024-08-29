Return-Path: <linux-usb+bounces-14278-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BFD69642EF
	for <lists+linux-usb@lfdr.de>; Thu, 29 Aug 2024 13:26:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1B21F1C21FC8
	for <lists+linux-usb@lfdr.de>; Thu, 29 Aug 2024 11:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70244191F70;
	Thu, 29 Aug 2024 11:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P2BPiyir"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA901917FC
	for <linux-usb@vger.kernel.org>; Thu, 29 Aug 2024 11:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724930793; cv=none; b=ZsvrjjRmpTJbMGb43/2/xP7/82KAtd0hvXj+21FVt11TT58QvQWJrHobZNMzCKKoID38sGRN2t3wNDmW/fvDgYEvC7M1AesQXMWcm4IutqS7bXxpM8eI3irtLcPIkg9IVm8jyweyzY/ekh+tMP6wLYzEad+lo/CDu0PNFGOZd2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724930793; c=relaxed/simple;
	bh=ZIyjpuCCWTHdejO2urYLN53eWNKv4qQi8xSOiS62CXE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=u2xhEPCJCMkiAX94sj5myRhkE5QeawbtpOR4GpMEPdF90mRLfjBBsFqgL8gDPP145JoMZmsYBxO/MtvwOKQFlvW5vzWU2RasslvSsEbE3/kHWLAkrBfUCQ63FCYoFgE4KFDotRyDRSZPTSK689ineznvzcLofiPszgWjpUvvirI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P2BPiyir; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9412DC4CEC3
	for <linux-usb@vger.kernel.org>; Thu, 29 Aug 2024 11:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724930792;
	bh=ZIyjpuCCWTHdejO2urYLN53eWNKv4qQi8xSOiS62CXE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=P2BPiyir+jOV3tfZ/Ly5yXOT10ZoNkSGTaPW5QHtL/1IDhIW7rOeUv9jd2nMgnyPN
	 LXnrQOdM5408YCQRPvkz3N+Oh+KnBGyJ96C3Zs7Fw7i/QrGRTZOtbCKCJ2dIY9Gcvp
	 gVm7dBTTJiKZWvBs7p+xu2fsG1P0KYo1ukPRb28WiDnMK6jYbojW6LV5HmAFISxz3k
	 qjBzDWKLhd/paC0+fV8cKvj8rcYLV0+anP+2g0TOoroAF8ejbuXYX7zsLJUsTHMC2k
	 mLkG8cTaHvNxm0lJUcta6Y6hG6gL63fOP508hZI6Wv/jEv/ueDCcjKbqjVrsQzMKPV
	 LZ3f73mVpN8sA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8A858C53B73; Thu, 29 Aug 2024 11:26:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219207] USB3 broken on Lenovo X1 Yoga Gen 7 for all kernels
 version >= 6.7
Date: Thu, 29 Aug 2024 11:26:32 +0000
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
X-Bugzilla-Changed-Fields: cf_regression
Message-ID: <bug-219207-208809-iJ4i05UQMS@https.bugzilla.kernel.org/>
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
         Regression|No                          |Yes

--- Comment #2 from Artem S. Tashkinov (aros@gmx.com) ---
This patch includes 150 changed files with 7,007 additions and 1,273 deleti=
ons
and it's impossible to figure out which one affected you.

Would be great if you bisected the exact regression using:
https://docs.kernel.org/admin-guide/bug-bisect.html

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

