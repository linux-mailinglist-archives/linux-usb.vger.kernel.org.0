Return-Path: <linux-usb+bounces-11615-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 99439915E1F
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jun 2024 07:27:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1FC34B229C8
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jun 2024 05:27:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E32A6145A10;
	Tue, 25 Jun 2024 05:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oODp7epb"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65683145A0E
	for <linux-usb@vger.kernel.org>; Tue, 25 Jun 2024 05:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719293221; cv=none; b=R7/b/pV9DHp2QhXcI1Pdh9doh+Lgn9dNzMKYK3jfWjAzxPkjORPAW/l7IFKMRutwTbN/wrxVGGg/vEPOzMt1KNLx5FtIQe1T/bjgYNIIw6s6wEh9RxzXOo8PM3zA5HPqf+JvO3+bfDDfZ8kO2QQ/LjgOyqEUorTemmNvxz3l8TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719293221; c=relaxed/simple;
	bh=7I8mTfgSjsgh8ISCAlyDJxwKOkiUhceXRzqD+G9EcSc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TpIcFlqBA3MDAz7R/1Q/CTvzqmKC0FKuvKX6BxyGewwuAEx50ji4cA40D6yHzuEhNS/iP6Tu/8rxS8tuf8tjjntogu3bPie6JrCKNznhcZu4SMJBr55nJhR9r57t0OgcXB/8xEgpcZNJ8nT+3f+ypV5RrM+FVEaZsZJ9JXqYwsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oODp7epb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F19BBC4AF07
	for <linux-usb@vger.kernel.org>; Tue, 25 Jun 2024 05:27:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719293221;
	bh=7I8mTfgSjsgh8ISCAlyDJxwKOkiUhceXRzqD+G9EcSc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=oODp7epba06JMsqCBJuJ6J4DNXvSaYZxfBJ0bGvCCP0u2toaJDI8xG64moIoRBcQG
	 o9HHCbAcmd+iHpTcDsJ3xwP0LwbJTvfDzKhEW8Dfyk1dJg/pfjFTm71TdlACknD3G6
	 DXGnCdtpwC3CQQOqC3/i32pOArBT1GOh99+58zK0szXrJautOwW7cD7xWurdUkQouE
	 uH+7e6tbck+kCtJtIFVPn6j0gt4DW2Bvfgl9oxDMYXXB6hgda72Yhz0ds8gCXLCm+P
	 g6BCYJDlZzlJE6XB6+xO5huvVcUK0119bC4DusIOF1cVvOBFzh6yw8k26Bj+pDshwa
	 Gc7IGTxyfWvgw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E1C71C53B50; Tue, 25 Jun 2024 05:27:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218977] new dtb break orangepi's usb gadget
Date: Tue, 25 Jun 2024 05:27:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218977-208809-zctLVt0WZe@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218977-208809@https.bugzilla.kernel.org/>
References: <bug-218977-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218977

The Linux kernel's regression tracker (Thorsten Leemhuis) (regressions@leem=
huis.info) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |regressions@leemhuis.info

--- Comment #1 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
You are unlikely to reach the right people here. Best to write a mail to An=
dre
Przywara <andre.przywara@arm.com>, who authored that commit; ideally do so =
as a
reply to
https://lore.kernel.org/all/20221110005507.19464-1-andre.przywara@arm.com/
while keeping the list of recipients.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

