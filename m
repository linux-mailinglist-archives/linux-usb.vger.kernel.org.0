Return-Path: <linux-usb+bounces-2807-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C2187E92C6
	for <lists+linux-usb@lfdr.de>; Sun, 12 Nov 2023 21:46:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C22291F20F91
	for <lists+linux-usb@lfdr.de>; Sun, 12 Nov 2023 20:46:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 940431A287;
	Sun, 12 Nov 2023 20:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ueSsgoLD"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F010A19BD9
	for <linux-usb@vger.kernel.org>; Sun, 12 Nov 2023 20:46:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 698DEC433CB
	for <linux-usb@vger.kernel.org>; Sun, 12 Nov 2023 20:46:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699821969;
	bh=DCTVYPiLbdW1Ng5GHHU5suItQLo65EXdoJ8DUXgiqXs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ueSsgoLD4lDe4MHAng/gOM4zMzoGs8CMaARASZXr0UzBG3pYqIPExSxY497/HRUoQ
	 SriCKLVbDocNa1bUuWEkTOIxscFu11im0Us1Wpprj/YArdiiKKgrpqV1joeUG/7ICT
	 +KTDClh1ZGeJ8yfD+x7TmTwoKhr+jnbjXOlwL2NkcZ7RJ3skE1x2+wPV2T8fm3Ku3h
	 wkeeugCHawYw8O5IHaWkwR8l6OxvpEK6xiCElF0kmUWb5HDF2IWsAXCJqeOehEkHCD
	 9xnHswaVuIH2AoSasiuKRZIhV/F1ym697QuXcU1/aYjRW+FtzWaLw18z/mwshIT06N
	 C9J0eGmBCDfEw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 517BDC53BD4; Sun, 12 Nov 2023 20:46:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Sun, 12 Nov 2023 20:46:08 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ferry.toth@elsinga.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215740-208809-VLdvnLcas6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215740-208809@https.bugzilla.kernel.org/>
References: <bug-215740-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215740

--- Comment #9 from Ferry Toth (ferry.toth@elsinga.info) ---
Ok, it's different then in #6 above.

smsc95xx behaves as a 5p hub, with an usb to ethernet adapter plugged into 1
port. So, 4 ports remain available to the user. The bug itself is likely
located in hub.c.

I can reproduce this with an ordinary 7p hub (EVB USB2517). Plugging the hub
causes no issues. Then plugging an usb device (in my case I just plugged a
mouse) into a port triggers the "cacheline tracking EEXIST".

The warning occurs only once (regardless unplugging the device or the hub).

Note that on Ubuntu 23.10 the warning does not occur, but they have most de=
bug
options not set. So, likely this is an old bug that has gone undetected for=
 a
long while.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

