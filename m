Return-Path: <linux-usb+bounces-7393-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1484286E4D7
	for <lists+linux-usb@lfdr.de>; Fri,  1 Mar 2024 16:58:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 419661C2279F
	for <lists+linux-usb@lfdr.de>; Fri,  1 Mar 2024 15:58:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8D6070AC0;
	Fri,  1 Mar 2024 15:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WpN5Jb6V"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3955D38F9A
	for <linux-usb@vger.kernel.org>; Fri,  1 Mar 2024 15:58:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709308705; cv=none; b=okSLDU28W657T0lN9fwG6dP3oaU2Ca5jMefSSKzNBwTGqYcJBqlAejmZXxzX30CC15k8uMprnwk5srllThU+4aHYcsukpEnAZjsHIYxBRq46DMjPfqWk+jc9wsa/P0Y4izTnZmtvbwITksySdt8RzDriBmV+dujVrZRbZHa4EUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709308705; c=relaxed/simple;
	bh=uUYSiVvcwbHv/3ie/Dfqh3hjMGy8dScoKdCX1+W31fE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q/EoF+/kJU0KBYuD6zsT8U26DvPnRH59337PlE1w1TewIl/eS2UHWS7QF1KT97V9Xf7biw3YGy/j8G4gAoB9PMcKWUkOFFBNQGEbUz3txTQBazzZzGK+BwvaaZS3OLtQdDKjshxJ3BLPsxN3Jq0auDxjWNnWI4aPQyPGNm9deGE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WpN5Jb6V; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7796CC433F1
	for <linux-usb@vger.kernel.org>; Fri,  1 Mar 2024 15:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709308704;
	bh=uUYSiVvcwbHv/3ie/Dfqh3hjMGy8dScoKdCX1+W31fE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WpN5Jb6VI7pLNFRVWjf3uvxRUIwyRW40Z8XkyKxAo0wE2YdFc+ENJcrq774hZ+Zt8
	 wAeVmJu9R41f1BEvslsbcp/PttTqwy+fleOSkrwsp0AWxisXZcFu45nOJCFp2ICm2o
	 2tNIQ8Y/lBANJS8COaEWr5gzR4x7x5JyaZOlCQgphWZdIvMHqvF+0issOFQHQXwdiL
	 jaK661aXhyyzHLgFjao62kYrd5X3sePwfnRborC6A2iJnsCNLYJEMw6DiXwl2cuXcU
	 OUjSXpacpSOoGtwN8550t13TFAtJNhYkF8eYFWTBGFZE6sArQ6+f1TiGEir3t+64d8
	 ptUw5g96UcKvQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5B48CC53BD0; Fri,  1 Mar 2024 15:58:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218544] not enough bandwidth, synaptics hi-res audio duplex
 audio
Date: Fri, 01 Mar 2024 15:58:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218544-208809-lAMcmhNIuG@https.bugzilla.kernel.org/>
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

--- Comment #2 from Alan Stern (stern@rowland.harvard.edu) ---
Can you attach the output from "lsusb -v" for this device?  And also the
contents of /sys/kernel/debug/usb/devices?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

