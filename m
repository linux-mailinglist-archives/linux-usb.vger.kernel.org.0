Return-Path: <linux-usb+bounces-27762-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A9AFEB4A0C7
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 06:38:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 371F77A3CFC
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 04:37:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6A502EA72A;
	Tue,  9 Sep 2025 04:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KkHOKYpW"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4971FEEA6
	for <linux-usb@vger.kernel.org>; Tue,  9 Sep 2025 04:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757392720; cv=none; b=XhGVlgcuN4pjB4oGqPu55PjB33BEsdNO9FHFtsiMqkpqQtAOK3Dh1iW+nZPqkMYfsxBah9+dIKV6Fn+fR6IK3FYD38/6i0KZ68jyetg93WUWUR4/y1cZIenRn+TAaaWr68+HkiNNPvsSJVlZOxTszMhzFVgtJ2Gn+mGaI+eb1Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757392720; c=relaxed/simple;
	bh=ZrvtqvKn1m6SmiJk4yRkbIdelfot61oBSo4mIixyGQg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZIYfoDVZw/rzGWbkylWYpVw/jPr1uCnsduu1HR5DqGC8tLzBOxwf4gw6wTWt6P+C82rR7+TBaZ+DeNMYBabL8yG8SNb7gbAm4A652MhmU/X2j34chVWHhYGG3+VymW3/RwJ2kK0c5x/zNUl1qQmy9AyWHO2TcVb9dpuFTzSUq5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KkHOKYpW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4321C4CEF4
	for <linux-usb@vger.kernel.org>; Tue,  9 Sep 2025 04:38:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757392719;
	bh=ZrvtqvKn1m6SmiJk4yRkbIdelfot61oBSo4mIixyGQg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KkHOKYpWGKkY+dmmOs3Tyrx0mEmTNZoZdvpX5wvIrpIXjZs4+vDo1k3R+ZGWDW2nG
	 q3m0/ihRH+RaxSbJhaV0AOUk/MxX3XMxyJbgoRD9k5FCKdqXqOoVc5Q7sEJRTm2psa
	 aSVw+sCybRCWMsFjkXRBP3EgqP5IfAIqVvu6czYh72EnIIJPEF52Y2SCIR20HU+fO0
	 hDO1+/bExEMJiivU61U6MsJPWiw3OLNq+vucQfiaWf+p/pvRCPpDVbF8hu+5dwuSKF
	 /+0NGIFAE5H9NibRa/bemZon7RUAZ3o936gU6OwVzOPUuVq6ULAU5tH2YhlfukQ6wt
	 vQiTM0SP/ZAGA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id AB13EC4160E; Tue,  9 Sep 2025 04:38:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Tue, 09 Sep 2025 04:38:39 +0000
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
Message-ID: <bug-220491-208809-OUT6hNVlR4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220491-208809@https.bugzilla.kernel.org/>
References: <bug-220491-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220491

--- Comment #50 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Hmm, are you sure you need the debugger and wouldn't it be enough to patch =
the
code you are interested in to print whatever things you need?

You can use printk() which works like printf() for variables and dump_stack=
()
to print a stack trace whenever you want, without pausing execution for more
than a few microseconds and causing things to time out/disconnect/etc. You =
may
need to include <linux/printk.h>.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

