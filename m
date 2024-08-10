Return-Path: <linux-usb+bounces-13301-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CE73094DD8A
	for <lists+linux-usb@lfdr.de>; Sat, 10 Aug 2024 17:50:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A5B6DB21069
	for <lists+linux-usb@lfdr.de>; Sat, 10 Aug 2024 15:49:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59C531607AD;
	Sat, 10 Aug 2024 15:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QPFTkvyw"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D63633FBA7
	for <linux-usb@vger.kernel.org>; Sat, 10 Aug 2024 15:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723304991; cv=none; b=A4iDMwYNIYu9WNyKZ5inD2dPw8P1IeTNCRMX2w/MI75pkwagjmBk436Tvf7uBVjcyoozZFLudju/mp/oNLeVg/L0EZyK7BV2w0HRoPH6wU4ZZCjfH6vljwBAEHr2ZjwZMTT7RBSelwccHXx8y976PFOAFjFlpTP5/NstuCykezM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723304991; c=relaxed/simple;
	bh=i2CWTd6TEEjXkSkvi6q/XzBYKoprlJyegg3FSdneIS8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CERhxI9pcXp30Iix7TH4ETFFigMSnXhWcsHJiFDeQJxHCtRiFnLnI4PO2EBgdLwE0KHWcJC7qx92rNJWzzNe74Tkws/C77T0nxVaBAXUFkRUSq7+vEpFG/Nhcmr9vwQ1K89mpREx/qsE6R9AOLyBhHlYUPtlM/s3bTrsJtIdWhA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QPFTkvyw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 54C68C32781
	for <linux-usb@vger.kernel.org>; Sat, 10 Aug 2024 15:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723304991;
	bh=i2CWTd6TEEjXkSkvi6q/XzBYKoprlJyegg3FSdneIS8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QPFTkvywhEV7gKHN/sIP2tbzb6/szjbhFmkUAXaDT5qipdXOTCZ5gViZvDLmM0dP6
	 sYcyOkmhuB86Um3R+qgfgitVz93Zckd/2I7kCqFaPIKh5f0hicdm6IjbJDHsxA8H0a
	 z5PMMymXuaX+Rt+2f0dEVcXyIo7noSirGvqFzcxBhNx5LV1g92ccPw5zj84hIDicFP
	 Vp4PbSeYntX8FRVjSikOWpIYQy8CHG7N+o4hVC7ra7Of7jiwhzr4h1y2TMd5CFPYMX
	 dG0oEGmuZfWk74ZYzMFZWMNN6wKfaGfhS/epZTSca9SDBq0pyniv6wXhk1MnSBlUyw
	 X8gEehlBF2H4A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4CF77C53B73; Sat, 10 Aug 2024 15:49:51 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Sat, 10 Aug 2024 15:49:51 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-219111-208809-fsGG8DDVP8@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219111-208809@https.bugzilla.kernel.org/>
References: <bug-219111-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219111

Alan Stern (stern@rowland.harvard.edu) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|stern@rowland.harvard.edu   |

--- Comment #52 from Alan Stern (stern@rowland.harvard.edu) ---
There isn't really anything we can do to help.  We can't change the existing
behavior very much without running the risk that a lot of other devices will
stop working.

One thing we could do is create a special case that would add extra handling
for the Xone:23C.  But the kernel can't tell that the device is an Xone:23C
before asking for the device descriptor, so that won't help.

I still wonder how Windows manages to make the device work.  The packet
captures from Wireshark don't show everything that's going on.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

