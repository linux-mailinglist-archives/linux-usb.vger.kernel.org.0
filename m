Return-Path: <linux-usb+bounces-23417-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id F40A3A9B22C
	for <lists+linux-usb@lfdr.de>; Thu, 24 Apr 2025 17:26:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 487FB4A215A
	for <lists+linux-usb@lfdr.de>; Thu, 24 Apr 2025 15:26:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 198581DDA32;
	Thu, 24 Apr 2025 15:26:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tP2y/YSy"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96A124315C
	for <linux-usb@vger.kernel.org>; Thu, 24 Apr 2025 15:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745508376; cv=none; b=P6MpA7du6tRKSL6HRbk+ikUD71nzzGveUHmji8pAXBsynG6+pvCBcGBnG97djGHskwvRyb+njdNv3qS1xBOYeWpGdkmD518f8pdUAEiYiPAyiSvzeFWH4uqHiZ5AeEP2+JO6zbYDjnpBrl/WLJps8nm/n9anBRYc1FuOMbwLynY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745508376; c=relaxed/simple;
	bh=ZbcqSM5oyOnKJqogZIJ/8pmrYfKRQhhRrWwohUDO0nE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ew6hEdNhBxP/bqjBJRPMkr0cLyBwsaXzcY4NWxkp62haFr0QnzMMbtTsXtBV2fap0HjdL8y0TwHpB94k8dE7cBr3Nk2xUIkAddbor6r0uc1ZhzzOauPi+BlY+zRTmVtuLGUpOziasO0fvQVRQpf1/I/pxND+wAQI7fgX/nU/O7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tP2y/YSy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0875EC4CEEB
	for <linux-usb@vger.kernel.org>; Thu, 24 Apr 2025 15:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745508376;
	bh=ZbcqSM5oyOnKJqogZIJ/8pmrYfKRQhhRrWwohUDO0nE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=tP2y/YSy0dTpdoIvmGF1y5QdadVqS5g2p+yQVEkrKWXDLRFkPsRKnkcJKSIasoWSM
	 KCcBo54V0cTl978kh6FMz0bAK9d0H05yTynV/s5kAcu/2xcLAGk6yjfnFSjNVYz+kI
	 +sBcns+0hlN7egvk4TjAaKr1aSgNdEzmS+35BjxD6g4IDPydiJzI8DCQ8MlCPMMddg
	 fbRNgYLbXNJRMVbUx5iRBrJVvL5foEb/3vjkCWO7dwF70ZgyDl/dg46SAHa4lmkucL
	 mCIA75lOdSzVubGR12+ZaygAsvATtnUy5Rl73HCfCOyTgf2dnJTj5bCbgGEWlGZWWW
	 FN+EbjgCeSADA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D3E49C41612; Thu, 24 Apr 2025 15:26:15 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220052] The usb/cdc-acm driver uses memory after it is freed
Date: Thu, 24 Apr 2025 15:26:15 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gregkh@linuxfoundation.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220052-208809-GMqRpsDOBC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220052-208809@https.bugzilla.kernel.org/>
References: <bug-220052-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220052

--- Comment #1 from gregkh@linuxfoundation.org ---
On Thu, Apr 24, 2025 at 02:31:20PM +0000, bugzilla-daemon@kernel.org wrote:
> Created attachment 308013
>   --> https://bugzilla.kernel.org/attachment.cgi?id=3D308013&action=3Dedit
> A patch file that solves the kernel panic.

Please submit this properly through email so that we can review and
apply it if it is correct.

thanks,

greg k-h

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

