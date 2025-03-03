Return-Path: <linux-usb+bounces-21290-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 59992A4CBEF
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 20:24:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 65C133A8FCA
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 19:23:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9821230BEB;
	Mon,  3 Mar 2025 19:23:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d6Tp//S/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 327021F8733
	for <linux-usb@vger.kernel.org>; Mon,  3 Mar 2025 19:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741029829; cv=none; b=Bpg1EZjPbrExwDzt1Z298VUGJlU++kdy3snlCSuU+g0W2bysY0EoF1es5J1Rvwx4pAvf2bUVFY1DjYuLfrFeSnBeeZXrbqGkO/OYY3Eir+TPObXE+/p0LsicjocCcSl0USb47SQffP//vmVktRAO7b0s3fqW7ZNfVZvBbFEJv8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741029829; c=relaxed/simple;
	bh=JWe2ROsVgY2eDXcUQU/9kFF2JYIe31BSRz+GL70LCqE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cTC3Rpyk0+fVqmpsvZZYRdsm1Oj3ZmY0owbSef3PHtoewF1p05Pm0AuEjYjYXjvun/9fOlQyXaT0sUmtIPFpgT4dq1EG/WNRIe9jRRMFjCR/wgHYqkjcybvJcZRxPbkE+y8B/XwWd/Fo5M1A1qKyTnAzgKIRxkxO1llV+z8DvnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d6Tp//S/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 961F3C4CEEB
	for <linux-usb@vger.kernel.org>; Mon,  3 Mar 2025 19:23:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741029828;
	bh=JWe2ROsVgY2eDXcUQU/9kFF2JYIe31BSRz+GL70LCqE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=d6Tp//S/PhlA703zqrGWBOzNPbZluJU5TyrJO8MxOg5TsSlnyfVJmulFkwsJehbTN
	 uQEGeAx4hvyxpc0BywSFbhh6j2lEPn2Orxs7/gTV4Ba2YRbN7eU35Lh3l8PsIxInK0
	 hp2OM6MpJgTQ+UA1RvPeq4ZofHtk6laOdURtJkfMmdaltgR/pLY0VcnPDfL2CiCtiz
	 lFzEetDSKg0ymitdi+sQp55VByapfGH6GTaMSqawHFvdUgGCW8xgFyvMxwYVRWn600
	 F3hRlRvid+USJxSG5+Yxowjg7zEbLQqaUMTuMo+2G33x3mDAigQl1XWXBXr8byYf+c
	 z5kTeXR9qOe9A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7D1F9C433E1; Mon,  3 Mar 2025 19:23:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219824] [6.13 regression] USB controller just died
Date: Mon, 03 Mar 2025 19:23:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219824-208809-SbKGpchTKG@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219824-208809@https.bugzilla.kernel.org/>
References: <bug-219824-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219824

--- Comment #13 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Hmm, can enabling a debug message which never gets printed really make a big
difference? Maybe I'm crazy, but I wonder if it's possible that your
interaction with USB devices while entering those commands somehow prevents=
 (or
at least delays) the failure?

I suppose that both dynamic debug and tracing settings persist across a sus=
pend
cycle, so if you still have no luck, maybe try setting everything up before
suspending and then do nothing after resuming?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

