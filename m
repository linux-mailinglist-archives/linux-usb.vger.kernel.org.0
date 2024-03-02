Return-Path: <linux-usb+bounces-7423-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D598486F079
	for <lists+linux-usb@lfdr.de>; Sat,  2 Mar 2024 14:02:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8FE2E283C41
	for <lists+linux-usb@lfdr.de>; Sat,  2 Mar 2024 13:02:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BABAA175AC;
	Sat,  2 Mar 2024 13:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CEiauEJu"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 453AA1757B
	for <linux-usb@vger.kernel.org>; Sat,  2 Mar 2024 13:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709384527; cv=none; b=UVYNFmp//r/7Y/xRzB8w5RaMjdBFKxaXjpIoxGUYir+AMcxDBkbstLgcs/ar8fQ9Vws7VLHSXjXhqoElnpma36n2nLKx0xe8rJCTZuvYzmOdBiaAixqNLY9OR/bymnqjD29PjQQUe6wxdWUQrzGIc2foWl7NU4OFxqAxxS40Ru8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709384527; c=relaxed/simple;
	bh=RXK1s/vUkgxkotuGRqPTpx5SI22uD2HRQ4paagL5+Zw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dTzS8+cuIa7fygF7SDfC3EdjBpVpFr/YhWthIi5OArwWck9u9lhJl8+0bMoghcZwNyfHuWcqn5k1TnQZuxCvaWICaMYy73F2YDZ4CC8cidqpdAslwxsfMIxMxlTBFePrCnY1xsj50wAhWeP9hRrHGj10EhbLB6uy1DEEAUsppso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CEiauEJu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AEE68C43390
	for <linux-usb@vger.kernel.org>; Sat,  2 Mar 2024 13:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709384526;
	bh=RXK1s/vUkgxkotuGRqPTpx5SI22uD2HRQ4paagL5+Zw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CEiauEJugGCd6eBtGqQT+BS8YjiX+JpV3J00gdS2Xsins1jBBFwQRLoxIwHcMTHHU
	 bl8Mo8Vl6sPoYVVCT/2xYGwhTolDYqQ84xPxk/LVaVesPTwXOQ4yZR1H1KbKeXocKq
	 fAQtZyXoiFfrJ8CCR+V6nkBk6MA4zVDDl+6rRSXD3XwIBgI7dYlKbkUWdlEeS7WsXU
	 fJmsE/FuWUhWCdzdMguWm9EWoSKw7dL51BsmAUlT9BpJV6nyCIx0oA6SsV9HKgUc6A
	 Ede3X8YIsRJsFqXp6637FZMMugefcAaz9gghro5KswmTZu1WFgaaLg367NCJD9t5nf
	 XYzBJdYj059kw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 91F68C53BCD; Sat,  2 Mar 2024 13:02:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218544] not enough bandwidth, synaptics hi-res audio duplex
 audio
Date: Sat, 02 Mar 2024 13:02:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ibmalone@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218544-208809-PKzdoAsRkB@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218544-208809@https.bugzilla.kernel.org/>
References: <bug-218544-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218544

--- Comment #8 from Ian Malone (ibmalone@gmail.com) ---
Thanks, I don't have access to the machine this weekend but will test that =
next
week.
I don't really need to get this working, but it does slightly bug me that w=
hat
should be the simplest situation (single full speed device given we've disa=
bled
all others) apparently never worked properly. (Presumably this device, alth=
ough
FS, is just a little more demanding than most were.) I stumbled across a
scheduler patch that Monty wrote around 2006 which looks like it was never
adopted, I might see if it can still be applied.
http://web.mit.edu/xiphmont/Public/kernel/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

