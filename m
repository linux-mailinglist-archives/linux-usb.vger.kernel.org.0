Return-Path: <linux-usb+bounces-27184-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EB2B31752
	for <lists+linux-usb@lfdr.de>; Fri, 22 Aug 2025 14:15:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 965BAB038D0
	for <lists+linux-usb@lfdr.de>; Fri, 22 Aug 2025 12:12:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABED02FABF7;
	Fri, 22 Aug 2025 12:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ILqhu273"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17F7E2F90ED
	for <linux-usb@vger.kernel.org>; Fri, 22 Aug 2025 12:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755864773; cv=none; b=iQBCfpXWY/Nz1VKgSGNVo6kP5j4QPhwFPmPp4N7o2vd7bBEyMacfeVehzAF6Yhw6Iiont78tm0LXzi53lBGLqOtShkCydfzKoM1K36LbY/4Sz7cwBmIWPhanYmijg4rlorWe8Ov67iUtnicMI9uQbsU570Zo3ad6+mxFiJjSfdA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755864773; c=relaxed/simple;
	bh=yykFoMyh3EhvfFBul6Z6Q3d3wrLInjT7BSRTKD7ElpI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ouKur3Z7uHh6s+WQc/ve8XCoGQwZ+NfljxnyzMkpUgQ1nR1QuQ8XvOyEYAr2m8DFB4Dx/s2qGFYref99V7ypYjMHef5yMKSdGAb3MXbnbWsukc0C/K+Af0AsLAL4PBpkQxD/s18WWNAmYplFqfria6ZmadfgXHA8CKrUQIWpsBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ILqhu273; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9035EC116B1
	for <linux-usb@vger.kernel.org>; Fri, 22 Aug 2025 12:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755864772;
	bh=yykFoMyh3EhvfFBul6Z6Q3d3wrLInjT7BSRTKD7ElpI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ILqhu2739wllBwifAiv3TkDihYwP4qvI8v6gfivXJj6V2oSzu5drWQtBxOOdsQFQG
	 HbzPHt/p/RZPhqiEQFSXqwPMrnfESFClgh256ZC6011lRVlVzAzFbdILQd+SG201rq
	 xbe7Taxrhqec/V376cHdS4QK64gJHdP9YTOKjXuW04JH0rbXGuOBuX8RpBoqWMjLo0
	 +UNMylOBk3laeI6RbZ0s3f8Fyu0ioPLR172n3Ciml6tYIrT8bn27V48+j0XU/4oWdx
	 oEHedn92F36c6rxsvsknt7RkQHDB9qHDpkNiea8WprJGuQT7Fc8VQRYiWF7upIv4/Q
	 DBL38SMJAiF0g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 87CC1C4160E; Fri, 22 Aug 2025 12:12:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220460] Plugging USB-C adapter into one port results in `Failed
 to set U2 timeout to 0x3f,error code -110`
Date: Fri, 22 Aug 2025 12:12:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pmenzel+bugzilla.kernel.org@molgen.mpg.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220460-208809-4Y1CAQlDMq@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220460-208809@https.bugzilla.kernel.org/>
References: <bug-220460-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220460

--- Comment #8 from Paul Menzel (pmenzel+bugzilla.kernel.org@molgen.mpg.de)=
 ---
Created attachment 308535
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308535&action=3Dedit
Output of `sudo lsusb -v` with LMP adapter connected to left USB-C port wit=
h no
errors/warnings

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

