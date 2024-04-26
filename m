Return-Path: <linux-usb+bounces-9835-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 136608B3477
	for <lists+linux-usb@lfdr.de>; Fri, 26 Apr 2024 11:50:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9DDB12861AD
	for <lists+linux-usb@lfdr.de>; Fri, 26 Apr 2024 09:50:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 93BEF13FD63;
	Fri, 26 Apr 2024 09:50:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XkeQEGdx"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ECE913EFEC
	for <linux-usb@vger.kernel.org>; Fri, 26 Apr 2024 09:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714125015; cv=none; b=Udw41m0iaeuwSi5NRDSiojdqDB2x5ofGxOYIYS9HrzUD8/NWufLKpNcqRx4oeuN14zBn0uiRQgDQsIXmvVDnzO+WRZHHIuf8PDnIIH4pzJDk39AsoFM6uuFw5HR/JC8boir0uSebt0w5Z+LOTyNguoMFRFKYkomRkraukXJK7K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714125015; c=relaxed/simple;
	bh=6DptD7Y4+C0x0AdF37q0rf+ds2Wf9tuJuYTbd/g7jKA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fx4DRMIDcL/EScqsoIrfmQ4BMFEdtKjc3W/8ETNm+tYw/PUX4DBabmWukmLVUfvmWxLsmw24AvLCkpMM2qphYT7/G0Ga00cZFGXaIQl4MZFzXkjt3wEQG2Os/+c0LWI3o0iOoYOrd6/adAEsEThjEnQW2naYh3sQatIgIxx0P7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XkeQEGdx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A3A7FC2BD10
	for <linux-usb@vger.kernel.org>; Fri, 26 Apr 2024 09:50:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714125014;
	bh=6DptD7Y4+C0x0AdF37q0rf+ds2Wf9tuJuYTbd/g7jKA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XkeQEGdxzag6XjEw5Tvb7fjTlCzgvTfZ8dq9U9+t+wdgs/fi1bMkW+9p6HeHw61Zi
	 z5LHT0bjlrwX6F3aFzGM7IS989D1G3AZhahS+tbkCXbfJnMyDS3TcqSqDXkH3T70tC
	 uyz11tEMH0t62YaC6QfgZoqfEh9+JU2w5SfC0LZN+nBBkOpN0V0G1k+XPoyfOSajby
	 eVZJtkgZzAEe1i6/H4g0L1OO2njhGfyFYkq5zmXQflK19BkTenMfxEUQ889M8+UzC5
	 Uyd0JB0A692b1FO/a01eSZfHqv1T4CKTwa63g196gA41+QfB9fiH+gPQf0pbbLzik/
	 BeTjnK8NvIaOA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 83D00C433E3; Fri, 26 Apr 2024 09:50:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218773] device not initialized
Date: Fri, 26 Apr 2024 09:50:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218773-208809-qZDoliEu2Z@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218773-208809@https.bugzilla.kernel.org/>
References: <bug-218773-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218773

--- Comment #2 from Artem S. Tashkinov (aros@gmx.com) ---
ASUS X670-P is a brand new motherboard, this issue can't be 10 years old.

1. Update your motherboard BIOS to the latest release.
2. If possible please confirm this bug affects Windows 10/11 running on your
device.
3. Make sure you've tried a completely different USB cable.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

