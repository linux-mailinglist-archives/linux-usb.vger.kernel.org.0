Return-Path: <linux-usb+bounces-4933-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A15C82A5A2
	for <lists+linux-usb@lfdr.de>; Thu, 11 Jan 2024 02:44:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 28A79289207
	for <lists+linux-usb@lfdr.de>; Thu, 11 Jan 2024 01:44:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BFC723CA;
	Thu, 11 Jan 2024 01:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p6puedM6"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08C923AA
	for <linux-usb@vger.kernel.org>; Thu, 11 Jan 2024 01:43:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1B487C433C7
	for <linux-usb@vger.kernel.org>; Thu, 11 Jan 2024 01:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704937437;
	bh=vDFubO5vLVdEdA+zZeczz6iGEQ1G2/eWEdt0lC0yQHk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=p6puedM6gXqdU3dFvSFuTizSDCkYSrkDbAewG/uYzg3teDUAy7RDMbQQ0SewTYnH/
	 Ej2JSEYjKYwf/EN0mv4u+CyBK15W6NElUx1N18yKfzLKEfOzhfr/thMk2/bxFF+OoU
	 IzAjscHZPrufjvPqPlQzZGxXW0qNENfr+KuX7ohhn9KNdnN2Kb5thltZIXgunKVY44
	 uaj3dGB/qEnvdtsjL9vI5Oix5RHKbygBouH0B18pw5U1lh54VudEU9M++QmJtczUnM
	 m9/6h+gfHNwwUSbgAwxldGS8FJpS9aaskmg/wVuN2qB+9gQzcZrcTnphY/VhWjwGC5
	 bRfYrhJBVBffg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F39EEC4332E; Thu, 11 Jan 2024 01:43:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218356] NETDEV WATCHDOG: wwan0 (cdc_ncm): transmit queue 0
 timed out
Date: Thu, 11 Jan 2024 01:43:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: opw
X-Bugzilla-Severity: high
X-Bugzilla-Who: 1016309222@qq.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218356-208809-9XpDwMty2J@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218356-208809@https.bugzilla.kernel.org/>
References: <bug-218356-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218356

--- Comment #2 from yilei (1016309222@qq.com) ---
Thank you very much for your reply. I have tested the firmware of buildroot=
 and
its kernel version is 4.19.225. This version should not have this issue, bu=
t I
am currently using the firmware of friendlyWrt and its kernel version is
5.10.110. This version must have this issue. I suspect that buildroot has a=
ny
patches that have already fixed this issue. Should I consult with the offic=
ial
friendlyWrt=EF=BC=9F

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

