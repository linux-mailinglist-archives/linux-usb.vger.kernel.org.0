Return-Path: <linux-usb+bounces-25405-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1899AAF1598
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jul 2025 14:25:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34C2D3B7676
	for <lists+linux-usb@lfdr.de>; Wed,  2 Jul 2025 12:25:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F26D126E707;
	Wed,  2 Jul 2025 12:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gcG4S57l"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CDF230BFB
	for <linux-usb@vger.kernel.org>; Wed,  2 Jul 2025 12:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751459130; cv=none; b=R+C/ibfxlAJEJy7cx6Y6ZdVb4KaNJeakUzlIIeD3JTPpLHUlKG54pPIdgWy5G7b6gSoHig+khbJ50K8oom3j/bG2608TzhlPNaLzXQ9PQSFcKWxoAyjRDdxZVBcBhz3zlowTaYybM4DN92cEHKhCjc6WcaIuee7DzHgs56sSaG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751459130; c=relaxed/simple;
	bh=lF+QOevg3hT9NNfyEuXkTn+SVH3dCTeMBJ04D9dlNKU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rp+bEbTSYrnN/64ts04yKr1WuI1uYTmPZA/a9zbjxydhAEUnepGoXm/4dha32xHBczwc2QeqitR98z2UOq00EFA/WAylTkA4DT3ZbfXeAwZSlnQjN8hZeilgJHR4f8npcWUOt9xIadY2r3i06no6z4LAPG7EpyGI1hcHWrSgAQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gcG4S57l; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EDB9AC4CEF4
	for <linux-usb@vger.kernel.org>; Wed,  2 Jul 2025 12:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751459130;
	bh=lF+QOevg3hT9NNfyEuXkTn+SVH3dCTeMBJ04D9dlNKU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=gcG4S57lv2PnOhf1v3KhQJSL/0G86g5vcD+CJ/27Sz4+QYbOfFs9QM9vxjZxe2I+M
	 2Phv4NQB1pnWv3qlxsEY9E6dAYrNAlrQgV2XgidwtQAoukxlt4xzysgs2f0iXOQgsD
	 oRvSUsebsh1gvR1kix6I7sCUwSX5gkVmo0PMdwN3wCAKBliZe3jk2jGZqX3wMlSjd+
	 7iQBVAqEbc3h5D6IT0Vr0y0LtybAW8AVkawVSMpxva7lX9G2EjDHo3jeBwCvVdqD4W
	 3cTtcTBR01KXSaLPNR3FNA/WASxIkLgpC4SYpwSORSAXzdYu3BRwMjXA3aO0JDQYM5
	 ELWrKum8TD5AQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E6DB1C433E1; Wed,  2 Jul 2025 12:25:29 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjAxODFdIFVzZXJzIGFjcm9zcyBkaXN0cmlidXRpb25z?=
 =?UTF-8?B?IHNlZSDigJxjb25maWcgZmFpbGVkLCBodWIgZG9lc27igJl0IGhhdmUgYW55?=
 =?UTF-8?B?IHBvcnRzISAoZXJyIC0xOSnigJ0gZnJvbSB4aGNpX2hjZCBhdCBib290Lg==?=
Date: Wed, 02 Jul 2025 12:25:29 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: nick.kainielsen@free.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220181-208809-GGBKDCnLBc@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220181-208809@https.bugzilla.kernel.org/>
References: <bug-220181-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220181

Nick Nielsen (nick.kainielsen@free.fr) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |nick.kainielsen@free.fr

--- Comment #9 from Nick Nielsen (nick.kainielsen@free.fr) ---
I'm in Tumbleweed - or I would be=20
-
-
My error message reads
"[1.361031][T442] hub 6-0:1.3 : config failed hub doesn't have any ports (e=
rror
-19)" - there's a difference of numbering of the hub.=20=20=20
-
-
My set up : an AMD Ryzen 5 8600G processor mounted on an ASRock A620M Pro RS
mother board which uses the AMD A620 chipset.
-
-
Willing to help/test bearing in mind my skills are very limited... which is=
 why
I can't format this text

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

