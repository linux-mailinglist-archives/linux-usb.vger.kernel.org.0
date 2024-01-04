Return-Path: <linux-usb+bounces-4720-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F06FF823D4D
	for <lists+linux-usb@lfdr.de>; Thu,  4 Jan 2024 09:20:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8FC611F25735
	for <lists+linux-usb@lfdr.de>; Thu,  4 Jan 2024 08:20:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA3C32030A;
	Thu,  4 Jan 2024 08:19:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r5hsfHMA"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DE44200C6
	for <linux-usb@vger.kernel.org>; Thu,  4 Jan 2024 08:19:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CFDC3C433C9
	for <linux-usb@vger.kernel.org>; Thu,  4 Jan 2024 08:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704356393;
	bh=ilsPYaqMuJmZNc6aiaaWkMFO0FbnjcrJ7HPnkAyo8NI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=r5hsfHMASmfk8FXzD90ipEIqJY+yRbLm6CBSXeopC/QgTZbPD1/Sef2IxEEC1StEm
	 V+AHXyEYPmx8X+BdD66R0cUAgM4bYA05LtzAv2D9Nx63iVRl2EZrnjuZtrvI1zYnxv
	 gE8PV2Go9yOa6QHfrDp0Gv2LkBHNexF9B2YZYuPrQyX77sP97ga6mxST0YNire1lR0
	 KSwZ8BagGt0OIPtT0YFVilTpsjc6xkmWVZpu3jXiRkNDqY8Ry/388OfQfKUfxCSRe0
	 MxauQyrNUzuzRI1N08AXOYh6TV1FS2IwJ56Dc2CCEZOaASVO2GBUOGuWIkMy4sC/5D
	 vcrtRbEPPK4lA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B84D7C53BD2; Thu,  4 Jan 2024 08:19:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218338] usb: cdc_acm: Support for Uniden BC125AT radio scanner
Date: Thu, 04 Jan 2024 08:19:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: greg@kroah.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218338-208809-9Zrcp9fe7W@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218338-208809@https.bugzilla.kernel.org/>
References: <bug-218338-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218338

--- Comment #1 from Greg Kroah-Hartman (greg@kroah.com) ---
On Thu, Jan 04, 2024 at 01:23:18AM +0000, bugzilla-daemon@kernel.org wrote:
> The code to add in /drivers/usb/class/cdc-acm.c
>=20
> ~~~
>   { USB_DEVICE(0x1965, 0x0017), /* Uniden BC125AT */
>   .driver_info =3D NO_UNION_NORMAL, /* has no union descriptor */
>   },
> ~~~
>=20
> Reference:
> https://lore.kernel.org/lkml/20180706054524.670321998@linuxfoundation.org/

Can you submit a patch to the mailing list, as documented, that adds
this change in this same format?

Otherwise we can't do much with just this bug report as-is, sorry.

thanks,

greg k-h

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

