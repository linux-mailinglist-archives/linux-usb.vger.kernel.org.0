Return-Path: <linux-usb+bounces-19541-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B53A1710F
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2025 18:13:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E18361887CD8
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jan 2025 17:13:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3B3B1EC00F;
	Mon, 20 Jan 2025 17:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GPs9DWPV"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B35D1EE001
	for <linux-usb@vger.kernel.org>; Mon, 20 Jan 2025 17:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737393183; cv=none; b=DyiVixCsmqP2kGeBltpRFROIUx+G/sqUYnN9LRsK0/DwhoQ9cTnY1hfK9a15nyCPWk6o47nUFbcSScZ+iVvK+Tg8xw5y2cWxMvr4BfXUGUcS30ozN1RSY9+3+VCzErtHLg01UHKqFKNJiEqy8QXQtnbUOBDKGi8vxMXobwYbmEs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737393183; c=relaxed/simple;
	bh=3uv0+GnqMa+CPWUug5ZpSbAMYM0WXuMuS5fBfZ5zyHY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EKHWe05Yd5zwm8BagvTh5S4/ZIN5IshY1xrPZ179iQnwExOr+s9fLBf+PMXBn+ZF9FOMcerQ18gl4b7IMSnc9MLTma3V9N1kVn/ByGuRpCAto2BeV868uWIB+Qv0A+nn0/Tyipc2PXK1c9U+kAlzOQVOf7mh5Ogsb1nubuzy+LA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GPs9DWPV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EEE76C4CEE2
	for <linux-usb@vger.kernel.org>; Mon, 20 Jan 2025 17:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737393183;
	bh=3uv0+GnqMa+CPWUug5ZpSbAMYM0WXuMuS5fBfZ5zyHY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GPs9DWPVdaxUxWthyGiXsumJLsmvyavd9OSEBTPFU3arRvHNALlAHrJ4l0JmNWBcw
	 KxnzScohXFMEsM6u9eYVotlgDOTAXJF0J+UMgF+vCAqS7cgOhLe+KN1i89mnDjSoLo
	 WJNlh5el+vq6snS8FsvzARDQBL/feTNe6lb6uwazDodIcdMgFDVeqKSIffYNcnI+tz
	 249K4vXX9QW5qwnf7GnrIJoRltvb52yftSaz1CwtOzTJDFCuzrXbMqgugdFXOKagnS
	 +RuMFiQCtExTh47/f+F6G/fp9SE+ZsLG9OO3H9B6fSnM4e6yktriYVyECrPHUqEQ21
	 MyXEYGbaKSDHg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E5501C41606; Mon, 20 Jan 2025 17:13:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219681] ASUS Zenbook S 14 UX5406SA: Unstable USB connection on
 USB-A port under certain condition
Date: Mon, 20 Jan 2025 17:13:02 +0000
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
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219681-208809-o1T7ezVE7m@https.bugzilla.kernel.org/>
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

--- Comment #7 from dantmnf2@gmail.com ---
Created attachment 307509
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307509&action=3Dedit
dmesg with more dynamic debug

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

