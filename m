Return-Path: <linux-usb+bounces-26055-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C63EDB0C7CA
	for <lists+linux-usb@lfdr.de>; Mon, 21 Jul 2025 17:38:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4B0066C1983
	for <lists+linux-usb@lfdr.de>; Mon, 21 Jul 2025 15:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 71F1A2D6639;
	Mon, 21 Jul 2025 15:37:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RMRtxMR1"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E82452DCC03
	for <linux-usb@vger.kernel.org>; Mon, 21 Jul 2025 15:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753112275; cv=none; b=Vme+MMlhETI1FF+GZoknn+/PfmtWFzcs7tR4/CypiZkojJhLIACCW+wrSR2W6p5a3X4P2zO6oS6reRfbZQ+iRExTurpPbGuPXMZol8H/4wrZ/tR/LJT3/r4PSA3VgPptDUiQVT8TB8OGwpMOuipmww1xkTw8HIklOYtJgJzCx6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753112275; c=relaxed/simple;
	bh=udD0dK7MdiRc+1CzR0dePaMuyHJhnvAuBdHA7izczzk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z9bDRHk0b7qWiEj/mapR+Fm+bWn5gYzdWeLd3/I/za+w89Yhi0vDrQ+pjRWaCD291PYsxb3oVh2ki9Yb+SZ6l5XJVtuViMbBQqnXxknyEyy6FUMghied9IYRdarCtqiEWfFj/jV3uunGAuvCQpVrwA5YfRjcE88qSMDF9IyHqoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RMRtxMR1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CBB83C4CEED
	for <linux-usb@vger.kernel.org>; Mon, 21 Jul 2025 15:37:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753112274;
	bh=udD0dK7MdiRc+1CzR0dePaMuyHJhnvAuBdHA7izczzk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=RMRtxMR1PHrH6gQhSh8MMGNjeodIvTxERGO92eHocvpwpXI2zKceLVTWS4PH5wIVO
	 hJVsnHdA1dZMkfn7SFxTM2bumx0SEl0ddCcfYrhk0HoW7bjTr6SbEkl3nDOK9kv3XC
	 +jDcWkyYUi+T4Vc1OqqxCENU7+qQlTGndvDaQGgKB1MjZTNtyjtYCjY4zWrkcatBWN
	 3sPDGRjXzqtWyYs/r54q3FOc5pFEqjgENndEoCXpRm78cr/MMWajzPtQgr3QgYcWe9
	 c04hwguYD7FBDsbFQhwD5/7pu3NKmBkPYG3MG3gopE4B961KBd0IEY/9T23qghp8KT
	 9+KZOGnGQifRg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BC6AFC41616; Mon, 21 Jul 2025 15:37:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220331] FTDI serial IO - unknown device type: 0x8312
Date: Mon, 21 Jul 2025 15:37:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: greg@kroah.com
X-Bugzilla-Status: REOPENED
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220331-208809-pubYRDDsFJ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220331-208809@https.bugzilla.kernel.org/>
References: <bug-220331-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220331

--- Comment #3 from Greg Kroah-Hartman (greg@kroah.com) ---
On Mon, Jul 21, 2025 at 02:58:05PM +0000, bugzilla-daemon@kernel.org wrote:
> ad 1. The device is not recognized even in latest kernel 6.15.7 .
> ad 2. Where should requests for a newer hadrware support be placed then?

On the linux-usb@vger.kernel.org mailing list.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

