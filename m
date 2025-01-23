Return-Path: <linux-usb+bounces-19686-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F4CDA1A918
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2025 18:46:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C4801889FF8
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2025 17:46:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C597A14A4E1;
	Thu, 23 Jan 2025 17:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IQ29i5yR"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48E482AE6C
	for <linux-usb@vger.kernel.org>; Thu, 23 Jan 2025 17:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737654358; cv=none; b=Fx7cYkf3PE2w9t9rvp958lj9O8ytYZwg3KC75IegEQmtSfN5sWcJ0Nwz3EPVos/jXieNAGMZkJMmjieSRU43dJ5Dw0mLWvOMUB9AAr2qe0djOA0tZXcWDpuESWI67Wm8UywrPFu9NjYXy0yr67a4aSFJKzZtF/Qyq5JBez/s4IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737654358; c=relaxed/simple;
	bh=ODcbP3EKXExhBUvttrROib/56yQdC2W/YhgCxGUcvMI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=YQgBCKf6IyuoMobyqJJmkxj5s9tcgsPR+Fx45IB9HzshMMNHnCjeC25Wkgcd3SYyBO+T4QhxS8R3yvDyDMwC+dIDZc/7v6tExsnONbJwqZfZYDoMvYCxZVBNbahuODc7po3Pc9yyGuMhskcp8BQHbmz2COiUKqm0WsMzGeQwa3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IQ29i5yR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1DCD0C4CEE0
	for <linux-usb@vger.kernel.org>; Thu, 23 Jan 2025 17:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737654358;
	bh=ODcbP3EKXExhBUvttrROib/56yQdC2W/YhgCxGUcvMI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=IQ29i5yRqgY32GGYv27IbRKHKMFhmrQ/wW9yI7YifJ7WF+NtVGt67sgZprtJOV3Wd
	 enYYKlAWtmzVcw6y8rvpi2hpKhn9gMURRNUX+dUWZvtKhUs2Z3TVPxK7PHLDYoC9+1
	 4HBN3rz/um9URPE907RMU9d9vP8PkU+R9WgryKagqvP/lkl3t/R/bZ1haWwuB13rYw
	 oyV+DD+BWhXY4EI4xAgh+dKP6CRKGgUv1eRRGPo85niHNYvpd6B3UdHw+JaTj+TpPO
	 PkEhAE/zAIOWezhaQbrAlQgO9ddaE037doF7rwUMYBsSDYULwqOWAXwZ/WAq8opbsU
	 reAmSJ3VULCCA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 163EBC41612; Thu, 23 Jan 2025 17:45:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219681] ASUS Zenbook S 14 UX5406SA: Unstable USB connection on
 USB-A port under certain condition
Date: Thu, 23 Jan 2025 17:45:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dantmnf2@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219681-208809-kbRUQvL3j4@https.bugzilla.kernel.org/>
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

--- Comment #12 from dantmnf2@gmail.com ---
> is the enclosure running at SuperSpeed when it works correctly?
There are some chances to work with SuperSpeed+, mostly with a longer cable.

To manually trigger the issue without udisks2:

echo "write through" > /sys/class/scsi_disk/0:0:0:0/cache_type
smartctl -a /dev/sda
dd if=3D/dev/sda of=3D/dev/null count=3D1

But this sequence more often gives ~30s IO delay, not timeout.

Also tried another disk with this enclosure and the issue is gone. Seems the
disk is to blame.

As for the Realtek ethernet, I found it never enters U1/U2 state on Windows.
Given there is already NO_LPM quirks for RTL8153, maybe we also need one for
RTL8156?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

