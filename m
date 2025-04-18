Return-Path: <linux-usb+bounces-23238-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 998D0A93C8D
	for <lists+linux-usb@lfdr.de>; Fri, 18 Apr 2025 20:06:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE9D244374A
	for <lists+linux-usb@lfdr.de>; Fri, 18 Apr 2025 18:06:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E065E2206A2;
	Fri, 18 Apr 2025 18:06:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MsCSLcuF"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 678B7433C4
	for <linux-usb@vger.kernel.org>; Fri, 18 Apr 2025 18:06:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744999586; cv=none; b=Ydlc7s6vl90ETCT827u8W8D5FF9no7iRoB994EU9UX+NA2rpIiXBNMaH7xrIZR8If0pHu5gwc4mAB3BILWYKVDoCd7Wdhlk3qOYEuBm0+Bz72prrRAgV5MeOjg2e4n4spRIovf8uFJlCOH/YEJfr+l7WqQ78EtccaQQSMloFZuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744999586; c=relaxed/simple;
	bh=acvftOviHM2yAmMPOnidwmtikybKhO8xX889/OKwUcI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=EhhSO7fksPpw3yxL8jj7TcQ2ACzN0hD9i6K0SRjlZumjx4oxRThDPT2zEziyoXho4dv+oF34hedUfKESfYZviU5QZ2O0077Uv+duCZmZ+47JO9BdgnDT3FPPvZ+U/ULEvP/WriJZj94TQ2YUmetTPJK3IsaEdLSCmX+fcQ1VB4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MsCSLcuF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D3C76C4CEEA
	for <linux-usb@vger.kernel.org>; Fri, 18 Apr 2025 18:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744999585;
	bh=acvftOviHM2yAmMPOnidwmtikybKhO8xX889/OKwUcI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=MsCSLcuFxtqG+71ectEOW/1rdqbyT3CbWuAW755FgAXjPH4oNgdnQQfJXsLTwXLYh
	 0D5GXC/gvsnKAmNkzaywEzyxXssbpyjS6ZBF+28Bg23kQSXuIIV/IW6QAmTffFvX4A
	 oMwdPwo+BK4lCqckXDuqeHRLxpZi9SPIDiEbzxRuw/vBnUWhNUetXAkSwcEdsCgUH3
	 o1VPHZI2FHGiCon8yGStbKwOnx9rL993q84xtvyK2ia4Ti9vumGYQEGHxIIae7dUmh
	 dayev0n77wf5c25E+l6rNvv1KINh5zmD2Pcv9LOyvCn5QNR8CUqeWt0zPPQSxjGsHh
	 dbr+SMDSPN5wQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C8292C41612; Fri, 18 Apr 2025 18:06:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220016] USB devices plugged into USB hubs on
 6.14.2-300.fc42.x86_64 do not work
Date: Fri, 18 Apr 2025 18:06:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: PCI
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stevenfalco@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220016-208809-CnRoStkpQC@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220016-208809@https.bugzilla.kernel.org/>
References: <bug-220016-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220016

--- Comment #20 from Steven A. Falco (stevenfalco@gmail.com) ---
Created attachment 307992
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307992&action=3Dedit
6.14.2 with realloc=3Don, no keyboard

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

