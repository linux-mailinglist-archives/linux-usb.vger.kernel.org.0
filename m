Return-Path: <linux-usb+bounces-21368-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E9B60A4F1AD
	for <lists+linux-usb@lfdr.de>; Wed,  5 Mar 2025 00:42:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 455743A5E30
	for <lists+linux-usb@lfdr.de>; Tue,  4 Mar 2025 23:41:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EF1B620AF69;
	Tue,  4 Mar 2025 23:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e9iJ3Xv3"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 777941EBA1C
	for <linux-usb@vger.kernel.org>; Tue,  4 Mar 2025 23:41:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741131716; cv=none; b=gFjwb3T3/PzDtUsgDo6Ij+Iu6wVEbWPtedskylZ36mouIUVEzNPh7ObvrPxzx3IwKGUgIC/MpjaNBuWX9jJy6XPtWzXXU6oHr307MYbYdtNl/ebg1vVgJ1EqNEHbBAbswZUNCYS/3niCTC4u3NCmGBTvcFfFu8veVDrB627JdXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741131716; c=relaxed/simple;
	bh=C62+YqkmKAT9s7TKFsc+W//+5XRuSYQwr8xOhDy20WE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cGpJd76Zjxja/gHMZsMuD+3INKxzyYrRuz2BTHDMgjsB09Erau4hD1eOevomwOuQ9NCWyEuM/LFZtdM1gRoLIAY3om+KHeKOrFgaMsFA+tJ2wyuE0ubfkU1GEgb5gI0fk+m/OIeLLwx4Mi/kZl05oEO6Kzas4b8SL70Tj9rMTxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e9iJ3Xv3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DDBF1C4CEE9
	for <linux-usb@vger.kernel.org>; Tue,  4 Mar 2025 23:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741131715;
	bh=C62+YqkmKAT9s7TKFsc+W//+5XRuSYQwr8xOhDy20WE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=e9iJ3Xv3/xd2WvKzesb+nlgjl2Z0l2f/xhaxbZGV0WJBqbyU4f+W5cJxdLoepHFZX
	 iDEU2EkcM/mTKWlXZc5ZR9g9b50iOKmeNXSsEl2GzdpL4tRb6/LJRgGYzPZJMB/GZG
	 XEFenaWso589TVT8VYVZCqZV6Kw35xV2a2Ktru2bQIQqUHENSxLl7qLgJ9Q+ykysYU
	 iDN9+HtOE/npPys9qEWlD5AEQl0Nz3T+4nlxB9xUQHop0RV2uOC/JWMMwl4xBSX4Ty
	 Ni1X2bJHU0o57gU3WuU5zOZHEKdO/d+SqnIiEHRHyLHlMsRYhRfIcgWpqxNDddmdG+
	 IcmHmFx54iy+w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CE3A1C41614; Tue,  4 Mar 2025 23:41:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219748] Pluggable UD-4VPD dock appears to continually reset
 with AMD AI 365
Date: Tue, 04 Mar 2025 23:41:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: sean@bioslevel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc attachments.created
Message-ID: <bug-219748-208809-WWH6cSxteL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219748-208809@https.bugzilla.kernel.org/>
References: <bug-219748-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219748

Sean (sean@bioslevel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |sean@bioslevel.com

--- Comment #18 from Sean (sean@bioslevel.com) ---
Created attachment 307767
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307767&action=3Dedit
dmesg after Scan downstream retimers after the router patch

While this topic is related to a Plugable dock, the Thunderbolt implementat=
ion
is having some issues for AMD GPUs where display EDIDs can't be read
(https://gitlab.freedesktop.org/drm/amd/-/issues/3050).  This latest patch
appears to have  helped that issue, as my TB3 Lenovo dock on a Framework 16
with an AMD 7840HS CPU is now able to use its display outputs at the correct
resolutions.  I'll be testing with addition TB docks I have access to in the
near future as well.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

