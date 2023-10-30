Return-Path: <linux-usb+bounces-2331-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0227DB327
	for <lists+linux-usb@lfdr.de>; Mon, 30 Oct 2023 07:18:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9BAF61C20A64
	for <lists+linux-usb@lfdr.de>; Mon, 30 Oct 2023 06:18:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D39FA46B1;
	Mon, 30 Oct 2023 06:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rkpy0WSv"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E717469E
	for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 06:18:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9F7B6C433CA
	for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 06:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698646727;
	bh=iKLluisZ4F2wl3yc1B8aeu91gyrvJ5JXoom5NkGDPas=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Rkpy0WSv600c6iJResG82n5QsMATnWBAyI8XYtqLA5ImG/goZuHMkdggbRtv0g0Kl
	 CMDrocEIQ8+IdUSj0AHqu/clMuQbkZyJguTZjhOekwe3vxPifMQGP/HsZ1TM2M8sAI
	 BMieQ57yj6mEmtZT4Dul1qWk74e27c+S/gUxzqA75CpuMq5WutRiATTuGPHwPGiYlB
	 BxmjyvoR1jZOkfYqmXuD61evjDq8JcTrZ7Ia2WulH+WurT+CCMZjp0cVTK9ov5rnQh
	 2/xXAJQs1R4YE+c/NLeGNo4EWeV9w+x4jok7718NOcHDqZzd9UuL8tHWeBexA6ldaD
	 gh/TnJVM/Y8TA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 86B6CC53BC6; Mon, 30 Oct 2023 06:18:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218086] ACER HD User Facing camera is not working
Date: Mon, 30 Oct 2023 06:18:47 +0000
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
Message-ID: <bug-218086-208809-ogomEQBVng@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218086-208809@https.bugzilla.kernel.org/>
References: <bug-218086-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218086

--- Comment #1 from gregkh@linuxfoundation.org ---
On Sun, Oct 29, 2023 at 11:00:25PM +0000, bugzilla-daemon@kernel.org wrote:
> It looks like it's not added into uvc_driver.c. I've made addition for it
> (see=20
> attachment) and it make camera work. Can we have this code somehow added =
to
> mainline kernel?

Please submit the patch as documented in the kernel file,
Documentation/process/submitting-patches.rst and the developers there
will be glad to take it (i.e. it needs to come through email.)

thanks,

greg k-h

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

