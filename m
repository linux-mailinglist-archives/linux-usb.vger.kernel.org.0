Return-Path: <linux-usb+bounces-11050-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 53A1A901877
	for <lists+linux-usb@lfdr.de>; Mon, 10 Jun 2024 00:11:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 17EFD1C209D0
	for <lists+linux-usb@lfdr.de>; Sun,  9 Jun 2024 22:11:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 89B354D9FB;
	Sun,  9 Jun 2024 22:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mGqK4TWY"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115871CD00
	for <linux-usb@vger.kernel.org>; Sun,  9 Jun 2024 22:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717971099; cv=none; b=ICtRiFchnEhMH0KuX5ybSH2ztsnuXisoy2zll3R9dQntc1RPHhzvEHHda31aE0DLubMx+A3o5pWYPnEkNlY8ldhWYqHVj1zXMxMq18JnLzmLdVVNvhpIhrhfuQJP07rVVOQWn5hEFl2omj9spChp9Y3zb+ghG6uomnqwNmsTRf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717971099; c=relaxed/simple;
	bh=itAoqU14t1ab+gK6KZn/0r8rRhjykPEcAJAVpE0qk1o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uW+BDMv9a1nezhA9IFFqDdxeNjLOhx2BsYaJksZiA207LcP0246DiQdC6JUqSKmgS5vNk3ml3jGJnqpWsi71VLJ1otYHb+7TZo9fNsCDl1MBsvHqg/Lo3RKSRSMJMVPciTKues+7Omt+Nnd6r5mMtGpkXch6hFm2tYl3rH0U2Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mGqK4TWY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7EB0CC2BD10
	for <linux-usb@vger.kernel.org>; Sun,  9 Jun 2024 22:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717971098;
	bh=itAoqU14t1ab+gK6KZn/0r8rRhjykPEcAJAVpE0qk1o=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=mGqK4TWYk/N+GL0B9TjRqUjoUX45hM/D2dFUZp6VZKrCfxeP6vmezSWLqrHQaTk/3
	 DYYnuqvJvkb7UmSc1+VHKL7SCzJZYLFO9oK0MQwv/PcIIQWIlerqvLxxRE60n+YWZU
	 Dm2yPdiuQU0q5isLWaTWX4MFtTXJMfBzHGmgyfpsht5gvSEI3iSpCFbo//3PGHCa/Z
	 D8LlDUUnPfStggFmRUwyVwMiMkAnrt9PPXpsDALkfXqzRLlWR5ZnWnDD9ALIKmiD9+
	 XcpLTJY03t6BELt60H3Tt35YGWBoksr4JCtrzPWRtPP3534yupUZQrtuecx6KUpe9d
	 xwC7RObR8Dijw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 69166C53B50; Sun,  9 Jun 2024 22:11:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215649] all usb devices stop working and forced to reboot the
 system
Date: Sun, 09 Jun 2024 22:11:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: ricciare@libero.it
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: PATCH_ALREADY_AVAILABLE
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-215649-208809-m1MV9LWBhz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215649-208809@https.bugzilla.kernel.org/>
References: <bug-215649-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215649

Nicola Ricciarelli (ricciare@libero.it) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |PATCH_ALREADY_AVAILABLE

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

