Return-Path: <linux-usb+bounces-7315-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BAC86C47C
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 10:07:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D5275285B14
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 09:07:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BBA456B9B;
	Thu, 29 Feb 2024 09:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FkegqeFk"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1425B55C16
	for <linux-usb@vger.kernel.org>; Thu, 29 Feb 2024 09:07:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709197643; cv=none; b=W91pLnF3N2/wYSzbn6pbFVzjFXbu+FPyH4SJBfYK6fRRy44bxbb1MJzYd7u20i3r0SrSyYWmHwXfeTfUQFtbOE9JTUtCZhc5w75Ttdnd8e2WkWcugboNm/vVIg8jSlc2va5wM21drXdx2HtwhbLsTeZuw7SuX1BsLhL4/FZBYqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709197643; c=relaxed/simple;
	bh=DqdyOd4ShmTi4w7LJXLzmV2myVsy4L46Vc7pGu1kTWo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CGyvSlp4ksrOOtk/AgrFdwAQ1sgYy+emw94IRG+sm+u/x0ywQElcBuTgAIG43be3GGGOmY1U2iTkZMJ8GI8vSFHlGjHrRVCt6ASogI05xYJhEHoUXexEDmHpgI9+5DU1EnKUQIjOhXY0fmacWRekZwy9PMheW/Cis8CsF/rf4Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FkegqeFk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8C9CAC433C7
	for <linux-usb@vger.kernel.org>; Thu, 29 Feb 2024 09:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709197642;
	bh=DqdyOd4ShmTi4w7LJXLzmV2myVsy4L46Vc7pGu1kTWo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=FkegqeFkLuh4IwNBCMl/96WU+J3FAq+MKwi4HpZQouIxSor14EaDuXKPWd6iMzXT7
	 WgWJd5QHjZtIrlOtwEIHffhgAFEufh/gwvLze7SnsIYVUgkt9ssjbBdTpcRrkJXCR/
	 riTAWv2tC6LmRNA7RmdAsGc/B/6yd017tN3g9fNLSBsQFxoeQSALz1Jt1CcpTdIPFb
	 hbuK7ei6NjndV6LV2E2/Q9IA2VT1WEeqFpuXg62ageo07IljtAauw69IoVvABiTj6C
	 VXHoIjBeNV3KxsJy68QNqqCgEoiZWa0dQimZQq0uxbtg27PXvyY9tYci4tjTabWoP+
	 C/U/hf6oYD8Kw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 71ACAC53BD0; Thu, 29 Feb 2024 09:07:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218525] Thunderbolt eGPU bad performance
Date: Thu, 29 Feb 2024 09:07:22 +0000
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
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218525-208809-lkWG8ec69Z@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218525-208809@https.bugzilla.kernel.org/>
References: <bug-218525-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218525

--- Comment #8 from Artem S. Tashkinov (aros@gmx.com) ---
> RTX 4090 Unigine Linux Benchmark
> RTX 4090 Unigine Windows Benchmark

There's like a 3% difference between Windows and Linux results for this
benchmark though Windows has two times better min fps.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

