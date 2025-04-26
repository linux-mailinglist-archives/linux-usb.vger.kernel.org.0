Return-Path: <linux-usb+bounces-23493-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 404E1A9DC21
	for <lists+linux-usb@lfdr.de>; Sat, 26 Apr 2025 18:15:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9AB4F5A632E
	for <lists+linux-usb@lfdr.de>; Sat, 26 Apr 2025 16:15:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98A341E9B2C;
	Sat, 26 Apr 2025 16:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JFhUT5j1"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4C96136
	for <linux-usb@vger.kernel.org>; Sat, 26 Apr 2025 16:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745684148; cv=none; b=puJ2rUNkFbNd+f/gRzVTWNY8QdW3ZPFTWZxB0wCBTmbCPKMQ6K27KQKZnSxbqsKPMIgjrqNTonE0b2y0or5b3tlEY6aE80nx752IF8Ofr/omqLu0XtsZuQzNvM8CUOh0XSjj+PyD+L/2B1ndywviYzDEEmSZIFkWKE5uIuurAT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745684148; c=relaxed/simple;
	bh=Q0tbnDxmRNMiBrfqjLF1P72IhdYw8/ow0z0zxJ5pbso=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XGoM3CfXEwP9gEL5LrjpFs0h/5ZU88u8UEDJJlfyTj9M490vgOg+uu+tk0OhDdwew828X0Hvb24TvznIQWnZ7PyeadqppwDTTwabzbN9GvuFV1FfMsWulZ4Elhhiygv8NkDwIO755h7kc8kFkCNGJOzcTTZJU62X/fXfkmr1+zU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JFhUT5j1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 864A0C4CEE2
	for <linux-usb@vger.kernel.org>; Sat, 26 Apr 2025 16:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745684147;
	bh=Q0tbnDxmRNMiBrfqjLF1P72IhdYw8/ow0z0zxJ5pbso=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JFhUT5j11tpNKmOKWZNcJtQIc65AFbIh57NZjc6dCFahNFlTNjqKHsXgDWtR8tEaS
	 jCV/yat0xeORvewUAmlwd0BEbJuXnEQD87mQE4rCKf/gqnJFNmCQXF4qIbJYOf/6K4
	 2iXvi2vIFShwBc0ZZAZuuSFSm59Bkmas9HBlhLzNMfnaJbg3ICL+L+RNUjzU2FUXdd
	 5cdeqMjoeLyv9Td+GXP9HlC+p3uHM6/VODocDQuvF5MOs4w4xNrNXsPMNc1GJAHBuN
	 n5FSWp9lhoCqiWSz3izrBqJQ2vKVIWiqEiO1tdEQnDpVKeC81ZAuLobPXt04Rd2za0
	 C1gkIfPrYtYVw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7ABD3C41613; Sat, 26 Apr 2025 16:15:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220027] USB 3.2 capture cards using incorrect USB speed
Date: Sat, 26 Apr 2025 16:15:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: nrkowalski@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220027-208809-8xr7Q2JSNL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220027-208809@https.bugzilla.kernel.org/>
References: <bug-220027-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220027

--- Comment #3 from Niko (nrkowalski@gmail.com) ---
The only other 10Gbps device I have at the moment is a USB hub which is
properly detected as a SuperSpeed Plus device.

I have 3 PCs to test with 2x AMD and 1x Intel and all 3 exhibit the same
behavior in Linux Mint 21. I've confirmed the capture card does work at the
correct speed in Windows 11 using the same USB port, with the same cable.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

