Return-Path: <linux-usb+bounces-2341-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF997DB530
	for <lists+linux-usb@lfdr.de>; Mon, 30 Oct 2023 09:34:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DAA65B20D9C
	for <lists+linux-usb@lfdr.de>; Mon, 30 Oct 2023 08:34:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6EF62A94D;
	Mon, 30 Oct 2023 08:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uVB7nT3o"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA575D50C
	for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 08:34:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4154DC433C9
	for <linux-usb@vger.kernel.org>; Mon, 30 Oct 2023 08:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698654843;
	bh=rbTZUvbtec2I4ULa1TldH7Ua/2xKb2URBFAHTb9h8nE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=uVB7nT3oGJjLrM1bxz6QRqmQC3QNyakB1DPaf98ehF5V44ZbMIhMjQRbOPJ/F6+O9
	 tCOEq0XgDMBzfGxwDA3Mo7GImkb6drmyhglTKotjIuaRSbTvI+crety+wHKiv7Z8Ba
	 RePvqb9/Lmm+peUpDl737gRlocoLAD4u0jla+22xuzR7R9o2dh6YbTltRnz5fo67l6
	 zTN2jmC7EcTk/5neDBgnT/z3xffYOvtARBxWLlE/lvPHmN26tUe0KxyYWDJXmk1Lbi
	 KGvb4LH6kqT3MYCrqwcKGyysVf834AgYH1RttK3D+AtA4i9EkoP9N5P9SV1MI/goTe
	 +bSL99ia20ZFg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 221C0C53BCD; Mon, 30 Oct 2023 08:34:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218086] ACER HD User Facing camera is not working
Date: Mon, 30 Oct 2023 08:34:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-218086-208809-hNc4IyVchF@https.bugzilla.kernel.org/>
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

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mchehab@infradead.org

--- Comment #2 from Artem S. Tashkinov (aros@gmx.com) ---
Mauro Carvalho Chehab, please take a look.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

