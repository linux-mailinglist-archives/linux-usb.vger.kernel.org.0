Return-Path: <linux-usb+bounces-20508-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B273FA31848
	for <lists+linux-usb@lfdr.de>; Tue, 11 Feb 2025 22:52:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BBABF7A1A78
	for <lists+linux-usb@lfdr.de>; Tue, 11 Feb 2025 21:51:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 51C642676E7;
	Tue, 11 Feb 2025 21:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lZOUSs6/"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6B9267715
	for <linux-usb@vger.kernel.org>; Tue, 11 Feb 2025 21:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739310731; cv=none; b=GcHNsQQqyrldlLKbvSHXjem4hiImQXeBtWRnd3hfMRMrS5Zsdd3C3w7p4dBdTcXJrJZwcH+g6zj7737VrvUbouj7q2oABb53S1dk6Z+lvfD0K1+cAnfsr43cJjSHt/MIIo7QztsiazchfNZe8uQ/lamyXNnobBZARlzpQBHEJT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739310731; c=relaxed/simple;
	bh=GFF1ZxzFdKWoBCOUE3zY0FIPJlfbraeWb7re9+9QqMA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AJPyiPz/yEd+TE7yaCuluCwASjRNvS4X0z7sFASSKrephCs2rkY36qYZOzp5iWrt5N8b/L3JFy7QuOGK+zt+JAb7JFb7SH9nAXRHmjpiwhJM6xReCNHD6AnAta71wooaa/gJ0E3W9PkzclyjPFyFfVgtwIbO9PD8nPFG8BojYQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lZOUSs6/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 48AAAC4CEDD
	for <linux-usb@vger.kernel.org>; Tue, 11 Feb 2025 21:52:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739310731;
	bh=GFF1ZxzFdKWoBCOUE3zY0FIPJlfbraeWb7re9+9QqMA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lZOUSs6/S3PXg4dFic6g+dBys2eML6uCwCwmVhFpCHZU3skKGnQjdF8j4V0QKesUP
	 g0ucy0shtvf6nDr4f4p4SMYbpNUTfoOq/SifJs29jMnZ2QJ8hioI430oaVEWM8qjvK
	 kFCqFKrTDT5avahKAh7jSdyIQuAQ/cRyv9lCD73iufncjRnTlGK2paqiwRB8Biny/t
	 htyIgZH4C47tVEegIdbzAshclAZB4+udCl+pN31EdKxVVsRtwGB7VdKgB2sj9As/gh
	 m496Z419oskHC7dm+B+U0rZJ3NjCWWMrdtJw7HI8ngttyYEHcaeCfJ//XyI92UdWHk
	 jSro5IjPwHzEA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3DE3FC3279E; Tue, 11 Feb 2025 21:52:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219773] External USB disk drive and SSD corruption
Date: Tue, 11 Feb 2025 21:52:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: fredbezies@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219773-208809-QCLDsfJyrM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219773-208809@https.bugzilla.kernel.org/>
References: <bug-219773-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219773

--- Comment #1 from Frederic Bezies (fredbezies@gmail.com) ---
Created attachment 307617
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307617&action=3Dedit
dmidecode log

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

