Return-Path: <linux-usb+bounces-29470-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id F153DBF2D4F
	for <lists+linux-usb@lfdr.de>; Mon, 20 Oct 2025 19:58:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A7E9134DD4C
	for <lists+linux-usb@lfdr.de>; Mon, 20 Oct 2025 17:58:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1112C3321CF;
	Mon, 20 Oct 2025 17:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NhGCssyv"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8943513C3CD
	for <linux-usb@vger.kernel.org>; Mon, 20 Oct 2025 17:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760983132; cv=none; b=DxJS8GThMWjhBzuQ9Jc83sHA3LHTnRyFl9RqaQwxaQAEiQWufn1v3zmRQ/d0kK0+xXBRFrjADEDkQZIXPC1NJ9gkWLcoHiGAe1I9B1e1R4lyEdxwxVW0Sfd90BlO67iK9X/4mq4Fs88wZrm43oJ4APD1poIwjnGhrxc4eLCU5zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760983132; c=relaxed/simple;
	bh=IthD0WkWimK1FJ7CQcF0RjgSPkYvXNV3EAMuEMCBYf4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XfJcXChdbztl1rS+3PMKVTA/L04JuwjtgqS5Utqvcvu0miUh+bIocMDEIZ3lFxSzTgxetMdcXrSHEXF2DSBFpwXwy4KWIVKC0S+MzAOVU1XcORo8kEDioobwN3frTzTYpna5YmxDRk2JmbtXS3l57RIn4Ul7Z9KnhL72zpN2NgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NhGCssyv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 28ECCC116B1
	for <linux-usb@vger.kernel.org>; Mon, 20 Oct 2025 17:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760983132;
	bh=IthD0WkWimK1FJ7CQcF0RjgSPkYvXNV3EAMuEMCBYf4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NhGCssyvyuo1y3STaNb2ILwbMI8ATW+XAUoeU/CXbU8J8G0W/SSeIUQJQb9JCtcJs
	 mJFo4ShhbCup/1XNayg+oQjCXgVHuSReNFp6wB2OwuRosW1fND49XeP5kitI8ZK8MV
	 NQCdIGleMYArY36fz96J6bQjzvZHBbP0Tqj1ho5PYWYqvbhIdUWVXce5KNyrqmHurB
	 gHJLVt3TXwHUcr+aOmAb7d80TnlAQ6TiLEOcEmSAcuKzqHqcPrQwH7x+RbhCXGA4fr
	 L71Tf4+6q+/r7Z401E45okk6fqi4GvGxLp3BdF219zbrEEN6vH9Onhb7+kNMvV4pt4
	 kgwql8sz+9YXg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1DC73C53BC5; Mon, 20 Oct 2025 17:58:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220686] REGRESSION: USB devices not recognised when plugged to
 Thunderbolt 4 USB-C ports
Date: Mon, 20 Oct 2025 17:58:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: kenny@panix.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220686-208809-HUrY0raTFW@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220686-208809@https.bugzilla.kernel.org/>
References: <bug-220686-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220686

Kenneth R. Crudup (kenny@panix.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |kenny@panix.com

--- Comment #4 from Kenneth R. Crudup (kenny@panix.com) ---
This was indeed a regression in the kernel, but it's been since fixed and
headed for upstream (if it hasn't already been applied):
https://lore.kernel.org/all/tencent_8C54420E1B0FF8D804C1B4651DF970716309@qq=
.com/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

