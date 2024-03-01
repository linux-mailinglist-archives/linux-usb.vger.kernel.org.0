Return-Path: <linux-usb+bounces-7379-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 272A786DDBB
	for <lists+linux-usb@lfdr.de>; Fri,  1 Mar 2024 10:00:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3CD7288330
	for <lists+linux-usb@lfdr.de>; Fri,  1 Mar 2024 09:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AFFC06A03D;
	Fri,  1 Mar 2024 09:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zxqz+pc4"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A03A6A029
	for <linux-usb@vger.kernel.org>; Fri,  1 Mar 2024 09:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709283627; cv=none; b=rpTozpalJL/SqIO98v5KIZEwnOGh6XdMShZxSDbCVcevH/WgxrTMJYpfunLO9Y246wJr/aX1G20ulOILXV92+vgebFn8+q6JAtVLjlCN4Vg3MFAZRjuwwNZ1TZrYUD/iVIk/l1+0pxtp/YNTg1Yzeh+dFg0FI5LnlXNTa5S9j7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709283627; c=relaxed/simple;
	bh=YoD7jmBWnaicyA5RZSyU0zqGWABZazPWYRl2okii0Fg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AaH1ys21yFZgZgSU59Q3R+GqX00VKKIzw5mvWQ0r/EV8+jnsxQCQP3gf3e/RgzkEfjyT34FSxcwYDiq5NmQV8if1CeG5tEJLnsTqvEDYBOYGDATv68RjBhFlVMNTgLNlmJvlwC51T6U5kDZqBq6ECi9UmomyUVBQwq1eG74nXsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zxqz+pc4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D1D92C43394
	for <linux-usb@vger.kernel.org>; Fri,  1 Mar 2024 09:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709283625;
	bh=YoD7jmBWnaicyA5RZSyU0zqGWABZazPWYRl2okii0Fg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Zxqz+pc4YK+Qa9q+EH5t7in1zOoHeJyxet8gll+YxUHDZOS9Nz3LTVMixjhR3w7kw
	 FX5PA8yIkQOEKi2+cHrkKJEK7K4jY8dXtdCxFy1HSrQyObfmNrJTnkmPGml6QqMWjy
	 //ilyiZu5jFZAoI0Nrga+ly0QH9z8Frcm2okV36JAaQ/SxFh6db89Ya9H4mhahawyX
	 w7BioryiL2l9HZJCAouCJzcrkkHYaCXB2vwG8a26TIjhqGd4IaI4A+DyLrZVmnRehZ
	 ZiOdfcswoUomNwOiy3/EI/XQcrRRjKHtIpYiJ0FfFhOF2ffeA6GWObI+JKOGYRuE5f
	 YwnvIi2kPicwg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C1C1DC53BD0; Fri,  1 Mar 2024 09:00:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218525] Thunderbolt eGPU bad performance
Date: Fri, 01 Mar 2024 09:00:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: kaukov.peter@pm.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.isobsolete attachments.created
Message-ID: <bug-218525-208809-DQ8ZURuEo7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218525-208809@https.bugzilla.kernel.org/>
References: <bug-218525-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218525

Kaukov (kaukov.peter@pm.me) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
 Attachment #305924|0                           |1
        is obsolete|                            |

--- Comment #11 from Kaukov (kaukov.peter@pm.me) ---
Created attachment 305934
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305934&action=3Dedit
RTX 4090 dmesg log

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

