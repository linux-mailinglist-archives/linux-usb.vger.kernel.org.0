Return-Path: <linux-usb+bounces-4220-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 18E06815166
	for <lists+linux-usb@lfdr.de>; Fri, 15 Dec 2023 21:50:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C1F1B1F236B2
	for <lists+linux-usb@lfdr.de>; Fri, 15 Dec 2023 20:50:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EDA34652A;
	Fri, 15 Dec 2023 20:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CQPZhhVh"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBD103E49F
	for <linux-usb@vger.kernel.org>; Fri, 15 Dec 2023 20:50:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BFBA8C433C7
	for <linux-usb@vger.kernel.org>; Fri, 15 Dec 2023 20:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702673400;
	bh=Q9VLeLzTfsKr0O0MWtTqoO7mdVgwFgr1bK+hyTd5EV4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CQPZhhVhwmLB/Pq/KW0pnqf1h4Rfe6imcNkepQa5jl8q4okrrUmg00h2dFR+odlyX
	 tYg3gJ4WADbVd8GZ9VDRyCsZ5KNf5ZPy80afvh5rx1G83X9dbkWNqzx7qW3fNkwaYj
	 sqBa4D6Bg74prThzrd8zNox7A9L26Iuwzefz/rsiMYuft0sVGNiLI1znsUsMl5Wa56
	 X43Z6udUviHH32IR0NbErnr3rTU2mhrqM4iFyHO1GNdUh9UwIrzmbLTbls7XQavfOs
	 ZOgTTfMG/kbpr5J4M9MGpFKPMmyyCnNlveyqZ67bK6zBS6BRcGaKxSBMs8LufIhiVs
	 Jch6V9YHzYpMQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A2BADC4332E; Fri, 15 Dec 2023 20:50:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 217475] Foxconn / Hon Hai Bluetooth adapter 0489:e0cd stops
 working on ThinkPad T14s AMD Gen1
Date: Fri, 15 Dec 2023 20:50:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: sombriks@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-217475-208809-NXJhXeitPD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217475-208809@https.bugzilla.kernel.org/>
References: <bug-217475-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217475

Leonardo Silveira (sombriks@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |sombriks@gmail.com

--- Comment #4 from Leonardo Silveira (sombriks@gmail.com) ---
i got similar issue on ThinkPad T14 Gen 2a

i turned it off, slapped the machine twice then it went back working.
not completely sure if it's a software issue but it is happening.

when it stops working it keeps not working. until it come back.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

