Return-Path: <linux-usb+bounces-23682-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 51484AA886E
	for <lists+linux-usb@lfdr.de>; Sun,  4 May 2025 19:23:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AB3303B5AC8
	for <lists+linux-usb@lfdr.de>; Sun,  4 May 2025 17:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6C681DED77;
	Sun,  4 May 2025 17:23:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aiZUTxwB"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4DCA32
	for <linux-usb@vger.kernel.org>; Sun,  4 May 2025 17:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746379399; cv=none; b=G3AYWoREBc48fvnhBTpSjwK2YR9vkMi1u/HJ1+ZgxhM2wCqxibDhpZiSTX/CZQ4WqMAWpk9MzYSFBFcbwBQyvlmMMnAD4NInaAvCdz3TCux6XlBvPa7t6IBDQ2PWZfNqukl1CMkdO3JsRt3zMPY5Iivas840BqVhyHPps+PSv28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746379399; c=relaxed/simple;
	bh=7/z2CNMkZog2BXC8/aFj37YFjFIm1dreCE3zZqeybp8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=W1M8gH1K3/c57YoWFfL1IosXtB7kzCMwb0Qq7QrNBNF0T8OrFi6OnNiZekbVjKKlCXhJupDMfHMJ0HVqCLgNGWGxsue9al8NDdS0eZC345lyzRKhUQLcu1+D36I3kxAch6B2nRlO5x9a/tFTrpa6rIJpANxt+I0BjQGH0ecQKHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aiZUTxwB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9EDD5C4CEED
	for <linux-usb@vger.kernel.org>; Sun,  4 May 2025 17:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746379398;
	bh=7/z2CNMkZog2BXC8/aFj37YFjFIm1dreCE3zZqeybp8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=aiZUTxwBMcyaG8WIokNJ5gs5VncntnA7N/ZBfj9hpEv1eghY277o27DMSo95IAKqU
	 U3a+y0KRhrBtrWV8E58wK7k5Q65U4FG9fXKEppsqGE9djfEgbxKg1BPH2u0mX4EImn
	 dkl2nR3677Of/zjRVlYUYrfjbkks5aJdKtZAlJQFI04Akee5I5HVfpNSNboh8H8MQb
	 55DRIWSaQQhhKdAaf5HVxSjDNC1dojXG7z+9txYA/Ucp6vh80uEZaZYLd9gY4laIG8
	 4qRGG4Yvpertj5rmw456OrU7TVeOqJDVpwv8yZP0X4XqrX5pon3M0sGoXlsyz0o+3q
	 rL8KxaqWOW5YQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 91446C41614; Sun,  4 May 2025 17:23:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Sun, 04 May 2025 17:23:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cwunder@gnome.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220069-208809-fdoyGEmrDl@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220069-208809@https.bugzilla.kernel.org/>
References: <bug-220069-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220069

--- Comment #35 from Claudio Wunder (cwunder@gnome.org) ---
I found out my Monitor has an interesting setting that "puts USB devices to
sleep"; I disabled that (and set the USB Hub on the monitor settings to USB=
 2.0
instead of 3.2); Something tells me maybe this "usb sleep setting" could be
related.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

