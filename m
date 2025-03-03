Return-Path: <linux-usb+bounces-21284-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5648A4C578
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 16:42:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 18D2E160E9C
	for <lists+linux-usb@lfdr.de>; Mon,  3 Mar 2025 15:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1496C211261;
	Mon,  3 Mar 2025 15:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RBYsYzAF"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91225145348
	for <linux-usb@vger.kernel.org>; Mon,  3 Mar 2025 15:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741016573; cv=none; b=oi75HdrpMIgJBQfnmLA0YrwwORdWFtZ6UD029thPuoSaaMIPtWKyq2cnL2hJdQCl5dXVgTLY2KG5Uj9v6Q8RhXcSWrxcLFSFZYo/+bV2e1veyw5gPqXJpIHYwRWoYB4yriSZ7buQNMLky/UvUeUtGhMBLGeQHt+UAh+7MVIrf2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741016573; c=relaxed/simple;
	bh=qK8MnH8FNUu7EdPjKXDF05HjAr6mmgXf5v+1EhCv3Lg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=TotUQfrfG987SnP6gudXZhzH94jcIMNc0z/j2ZDrjdYc9oemY2jjLY3I1NkIYbiC8/kiU9450bkeJJCqTHwjBV9alR/bBeWaphrWkOaadW4QZ3adRpomNK2K0oG+1olJ8c031jROT59CoOVX/aowQiuhYcTz0riD8cIj7BZKLl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RBYsYzAF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 11AD5C4CEE6
	for <linux-usb@vger.kernel.org>; Mon,  3 Mar 2025 15:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741016573;
	bh=qK8MnH8FNUu7EdPjKXDF05HjAr6mmgXf5v+1EhCv3Lg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=RBYsYzAF+y4IxTEpGp4TJvMHXaU2CWP2ZvqDCnrghDMme86INSciJxw8TwoiJ7nMO
	 pZdoRo6anbxQW8l03UrRR0gJm664SNPurjMlWEEMLehVQ5nNKIPoqjeDTOa9ICaw59
	 rkRUCxaKHGxQAemJv2igGn+nQDxBSKAUxXXU4JezRRicW3p2fei5jrWJl+gzqLZYIM
	 OZG5IjQpVDcHmp3RFPoVOcza+Gr+mIyFvP6xLULZHTPf/mUdxb/cgxswzqN7/q3Y58
	 pVphqbxIS0K6e1z3anVSVXFYwo15plCHzfESMVwPN67N37W2K8AFQR5JI+fU6b/+oH
	 uM8b26Lg0YP1Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F135CC53BBF; Mon,  3 Mar 2025 15:42:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219824] [6.13 regression] USB controller just died
Date: Mon, 03 Mar 2025 15:42:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219824-208809-vRyqYcQbOM@https.bugzilla.kernel.org/>
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

--- Comment #12 from Artem S. Tashkinov (aros@gmx.com) ---
(In reply to Micha=C5=82 Pecio from comment #10)
> What if you enable only this one thing? Does anything show up under normal
> use or before the HC dies (if it still does)?
>=20
> echo 'func xhci_handle_cmd_stop_ep +p' >/proc/dynamic_debug/control

The same issue. Without debug the USB controller dies in a few minutes, with
just this line it is working just fine.

> Can you still run one more try with xhci tracing instead of dynamic debug?
It does not affect timing as much:

I will try this ASAP.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

