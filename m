Return-Path: <linux-usb+bounces-19778-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 703D3A1D324
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jan 2025 10:14:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A3D3418872AD
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jan 2025 09:14:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 27E461FCF43;
	Mon, 27 Jan 2025 09:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GC7IRNk0"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0FB614D28C
	for <linux-usb@vger.kernel.org>; Mon, 27 Jan 2025 09:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737969283; cv=none; b=LP1YR1ngyhDnthq4tkow5fUabQUUd2oNs4ZpSNeRA6HiUaZpySiMwr6kdz4dzGPanrJ4Zbn9u1rh1MCQPh9mWMIk4ogqCgCUCiu++/nXNbfhHUcuv2mePlh+mpWJCLUqVG3/4emcu0Dczno9I0FPwprvsocPkjyGsmHwW/o0q10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737969283; c=relaxed/simple;
	bh=Uj3L7aogkSHUP/84BED9yKSQBX0RgPj0O4ENhor7xHM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Oris6XH/Ho67kRc4kH71kK++xwg7+HCRcD8nbeNfQ+G1LADVx5kRHmE2gUgsyIMx+ZbBJuK4KZpB/vn7bLP1iXoawZE7d2A9w9P42jj3l1QeF4E5M+bm8isnUjm6B4R4i/ARhOCEC5Spr6JgG35zK6EGAjZXGdM/wMaAr+fOZwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GC7IRNk0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 13529C4CEE4
	for <linux-usb@vger.kernel.org>; Mon, 27 Jan 2025 09:14:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737969283;
	bh=Uj3L7aogkSHUP/84BED9yKSQBX0RgPj0O4ENhor7xHM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GC7IRNk0xoXf1ik+iWKojjF9TygATYGkT0XT+RZnDfSbaWkCUtEiX9ulUYjhipvN4
	 g4CtJ5RRHhDzYIiC7vsLdbSCdvdYJ/5N+MzBNzY68QuhWtcOWPPkpGbKhsKb4X13VQ
	 OkJ4y6Maon0T4L3nQVYpW05WVgsqMQOH0Ba54bS+t1cH+ZIz4b6+YV6kke9ncEC02t
	 HNDgdvXJVgswugcbKbnWsD9XbnnajZvra8NK/c2K6x9U/7O1CBo0bF7wymVdcavtVB
	 63SN3cyGAuGbDjJcwzOF+JuRpg/XUSctl+8YkJF3Lb+1zAeChopT4r5b0b9TmioHOK
	 YPeSLVeh4lKgQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 004CFC3279F; Mon, 27 Jan 2025 09:14:42 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219681] ASUS Zenbook S 14 UX5406SA: Unstable USB connection on
 USB-A port under certain condition
Date: Mon, 27 Jan 2025 09:14:42 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219681-208809-lzR3dJfMMp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219681-208809@https.bugzilla.kernel.org/>
References: <bug-219681-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219681

--- Comment #15 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
(In reply to dantmnf2 from comment #12)
> > is the enclosure running at SuperSpeed when it works correctly?
> There are some chances to work with SuperSpeed+, mostly with a longer cab=
le.
What I was thinking is if there is any chance that the hub limits it to
hi-speed, this could explain how some hardware bugs miraculously go away.

> Also tried another disk with this enclosure and the issue is gone. Seems =
the
> disk is to blame.
There seem to be issues with some combinations of disks and enclosures, but=
 I
have never looked into it. It sounds more like a storage problem than a USB
problem to me. At this point I think your best bet would be to read
Documentation/admin-guide/reporting-issues.rst and mail linux-usb and
linux-scsi about this specific UAS issue, because few developers really fol=
low
this bugzilla.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

