Return-Path: <linux-usb+bounces-30221-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A730C42C52
	for <lists+linux-usb@lfdr.de>; Sat, 08 Nov 2025 12:57:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E67BB188AB57
	for <lists+linux-usb@lfdr.de>; Sat,  8 Nov 2025 11:58:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C504A285C99;
	Sat,  8 Nov 2025 11:57:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oMTbCqJU"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B483134AB
	for <linux-usb@vger.kernel.org>; Sat,  8 Nov 2025 11:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762603052; cv=none; b=sIObAzjoDWlhnDRHY8BpsfKa6ok1yYnNNEkkFMrUQMvsE666jsX6iQXf4tDgU8w8e3DNdWGHlhAje7grsQDdcTV/QejAwt50mwLJjm5DgqPnqo+joSZAZCVseMYETiyy2AVDTLQZsC/CDRK9DudF9hk8cf+BLVmbT+2/dvlElHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762603052; c=relaxed/simple;
	bh=U6OA2MYvfPmckZP8yaf9hmCYekTa8RTWGdOZKm/Zqbk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=u3UGScbhEEqYIBumKx+ZleVYK2kLQybhnhQf2dxOKhREWCzVeVlKuW7ogkN0nf5A5AN3+BKT/BaCYqIHb8mpGkLxcB6q+Q24x38Jp6dNiOSahJjUy30rQgq5tCIFhGgvFjhnj09i+YukUvTgl0zW5OG67YXmYDiGovEda+9kDYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oMTbCqJU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C97B4C4CEF7
	for <linux-usb@vger.kernel.org>; Sat,  8 Nov 2025 11:57:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762603051;
	bh=U6OA2MYvfPmckZP8yaf9hmCYekTa8RTWGdOZKm/Zqbk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=oMTbCqJUbcglDpwF/LBMO/LJXm5RAMTKNagD/e+pztLJpIQBkuvZdKzLVmPGFEZYm
	 LiYrkyP80kHvYj5m/rc6jLxc2VMYF7zeKI/SypL41ouLg+6Bbl2C5IP2G30iL8RkTl
	 whESA6AAlLt6hBQ7UNKa5Ak42/VxcblX5udbapQpEXxVY0EHVHJ7qnEvmhGFgx41ZR
	 ZD+ktEGbCKbTS16krlLEr9ezoDx72yDDCyqW+8tFtWc/ELdw6wvqPIpXep83fOYddg
	 1tUrUFeLlpcn0wg75vxTsYusIX9c8YRce3fmwHsjCgJY5hP5Yk57U7U+6zrysTUOA2
	 xxhdWqEfeA45A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BC704C433E1; Sat,  8 Nov 2025 11:57:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220284] USB4 / Thunderbolt not working after boot until
 thunderbolt module is reloaded
Date: Sat, 08 Nov 2025 11:57:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kim.lindberger@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-220284-208809-D4F8N9dYDV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220284-208809@https.bugzilla.kernel.org/>
References: <bug-220284-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220284

Kim Lindberger (kim.lindberger@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #5 from Kim Lindberger (kim.lindberger@gmail.com) ---
Yes, sorry about the late reply. This has been fixed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

