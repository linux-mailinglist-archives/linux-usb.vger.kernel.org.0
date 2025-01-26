Return-Path: <linux-usb+bounces-19774-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BB388A1CDF4
	for <lists+linux-usb@lfdr.de>; Sun, 26 Jan 2025 20:02:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 606EF1884A12
	for <lists+linux-usb@lfdr.de>; Sun, 26 Jan 2025 19:02:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 991C8155759;
	Sun, 26 Jan 2025 19:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o+Z76jAt"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115EE1714D0
	for <linux-usb@vger.kernel.org>; Sun, 26 Jan 2025 19:02:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737918135; cv=none; b=VOLT/Sg47BNHyd0sx7w7z3INL2XVFqzpCJhel0U6ocBsH/DiYfm308efWO7dbm7AhUYMq0Ojcsdxu7hm1tUE5j9VYko9G2U72LiKyiASoDiz0Bp/uqcADhiMnVnuq8vUjdIALut/wehd7++aQfHvRvL2yKPjLP/Yubq0STkMWNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737918135; c=relaxed/simple;
	bh=XCfjBt6IWuKuE8NX5k7Vn/p8BrqvXn2Zfw9OVGKW4Bs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hR6eprIe9kppfw7pmBTMH5gdzHjlI+C6ktfNs9opHkCbfJLRgwNKFJDPl0rLM9tihJVxFwd+4Lr+wAyoWawvgKDFWn6LoXItCqs11mGeJLKGppl27LJ2+yJ1vrWvNrDrtsGGRZ2lIHT5Z5UMPJfjwlLyyWUzF97loDn1vF5+Syg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o+Z76jAt; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81CF6C4CEE8
	for <linux-usb@vger.kernel.org>; Sun, 26 Jan 2025 19:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737918134;
	bh=XCfjBt6IWuKuE8NX5k7Vn/p8BrqvXn2Zfw9OVGKW4Bs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=o+Z76jAtpxNHdE2FJqyEFdfDRAVz2WozJzpNYe0B4fHLZc/aYUX56VNHcX5fP77wI
	 0ufxytQcrXuEy4KPqM3LQgq87ZhmWCgGl5U4GJcOgqNyaz+5+4gtD63Vhh/xXdL2gJ
	 w6kq9LchtUcq4EeHzariaAaJJ27yh1Mo2Lr5n6Do2xJL8jTgSBkGDsxPGTHlHHMHGo
	 K3QKmPyT1vaWGrW5w9g2l4hn+skhhfJNfwTddSTj3qR7u/X61kq3YJZRZCONNAMMlm
	 P8iXTJRSzNRJN2y2UKX6evGlM6Pn+eel4ak1PLLt1M0oERzqAg8wW4jBzfuMeOCJ75
	 j0QQait8kGJGg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 77646C41606; Sun, 26 Jan 2025 19:02:14 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219726] USB devices fail to show up when upgrading to 6.12.11
Date: Sun, 26 Jan 2025 19:02:14 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEEDINFO
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status cf_regression
Message-ID: <bug-219726-208809-QIwjyRFLwQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219726-208809@https.bugzilla.kernel.org/>
References: <bug-219726-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219726

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |NEEDINFO
         Regression|No                          |Yes

--- Comment #2 from Artem S. Tashkinov (aros@gmx.com) ---
Please post=20

sudo dmesg -t=20

for both kernels.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

