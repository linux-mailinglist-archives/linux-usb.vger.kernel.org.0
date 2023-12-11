Return-Path: <linux-usb+bounces-3993-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B62A680DB13
	for <lists+linux-usb@lfdr.de>; Mon, 11 Dec 2023 20:48:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6D9F1C2164E
	for <lists+linux-usb@lfdr.de>; Mon, 11 Dec 2023 19:48:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 58713537EC;
	Mon, 11 Dec 2023 19:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QUOyM2yL"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFCDF48CCD
	for <linux-usb@vger.kernel.org>; Mon, 11 Dec 2023 19:48:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 32BF3C433C7
	for <linux-usb@vger.kernel.org>; Mon, 11 Dec 2023 19:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702324080;
	bh=iXdVbOfCBJ4lVnCMA84ManKmXqj5/96qk/zRPIQKQIU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QUOyM2yLA8PFMudK6P4dTgtUmQzMDMJbu5KjwtB2oOKd/b8PUJkR83apMBXNGP8fK
	 R5qYFpOleiC0kcUiUJtMnTyniTvvkP/INTrzgbf5Bjry5vHZ8j1XlwJSauHvMweriH
	 yp6yu11vUQKCoLlejnKcb/dvwWSQRJ9bvY8FEF9vcNYklLTn6wQwlZFk0aiEQv3WHj
	 LyLKJrOalgFbnSattyMYojHeWankcljRrhEeKHLAspGSaoPzidEUAJKL1WRJn+ZTJc
	 KepQdqtqCyDbRzmVbNMI9fwX51G5bRNMkJA3R19vvovDxCmkfQ8sctY1vl1grHL5C1
	 LLPkK2kLLEqng==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 109C3C4332E; Mon, 11 Dec 2023 19:48:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218249] Since kernel 6.3.1 Logitech MK260 Unifying Receiver not
 working properly
Date: Mon, 11 Dec 2023 19:47:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jan.grobecker@gmx.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218249-208809-5fD6Pa1hTx@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218249-208809@https.bugzilla.kernel.org/>
References: <bug-218249-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218249

--- Comment #2 from Jan Grobecker (jan.grobecker@gmx.net) ---
Hi Bagas!

Will try to compile the latest kernel from source.

Thanks
Jan Grobecker

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

