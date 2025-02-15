Return-Path: <linux-usb+bounces-20679-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F717A36EFF
	for <lists+linux-usb@lfdr.de>; Sat, 15 Feb 2025 16:09:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA7083ACF04
	for <lists+linux-usb@lfdr.de>; Sat, 15 Feb 2025 15:09:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C9651DB158;
	Sat, 15 Feb 2025 15:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oVhO/n5w"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86CE3151991
	for <linux-usb@vger.kernel.org>; Sat, 15 Feb 2025 15:09:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739632193; cv=none; b=PSdhhFxbHHPaBGF7NltLgmwJ70OQlbMFDccNWlMeePBMk+WedR8XHdhNyYfyc/BL1i4Df++Dlzf+fIYMT2Wlim4nb/9du04B1JUjFP2IgMf7xmT5S17WvajP7f6h2vD6j6cBZdEI/jxPqw/bJ3Nj+LQwZKJbBFBcKU9hUgLOLzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739632193; c=relaxed/simple;
	bh=54N8ks7FiByHXWFtA6UQ+2A1SvXZcTu6rS6ZE+bM2E8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=FqXlLq+Ob3kubjtMxHxuVvciqijSO+rt82MpTdpY+DT15D1KauHjYBAI+p2p/JDtEnmDR1ALkGpvT41gSQQbAZWvFiRgC2COBHFwmJtHoYDuIK7BSmGerf8qFYISECNJqyz83AJ2Ar27UhS8W9trFX68E7XAIY1RTBW5MbfbBCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oVhO/n5w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F3332C4CEE7
	for <linux-usb@vger.kernel.org>; Sat, 15 Feb 2025 15:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739632193;
	bh=54N8ks7FiByHXWFtA6UQ+2A1SvXZcTu6rS6ZE+bM2E8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=oVhO/n5w9v+gU3QO4YO/1OC3JzmfJDaAG48p2kaE7AIlTSbP/Op+hlg+0/agRyM33
	 OoRCzvRKV4/0lkhUV0wUhVJpzJLO5CS8wBlDX6Qh/Iagmqrr7Cl6NkkiD+r7edLSm4
	 kih2jB9lGj/SfblZRSDZm3J7floBlB5MkY3rnfaqUdcmhDD6gznmf0VJgFyjBUAQq6
	 +IryMnSFcvkYvnIaHWDmx6mDHGYK3Fvrt4tAgmXfQb0GWFqS8GTdyiR0oLFQYNbP1b
	 K+msO+tE+Wx19k19jAVu5vUg86WRDJ5Pn0NEo2jdnfSzJ2UoGURm1QsEEweVmlBhoJ
	 cXf5oRD+74DaA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id EAD9EC41612; Sat, 15 Feb 2025 15:09:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219773] External USB disk drive and SSD corruption while
 connected to USB 3 ports.
Date: Sat, 15 Feb 2025 15:09:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: fredbezies@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219773-208809-4OZ9D85dC5@https.bugzilla.kernel.org/>
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

--- Comment #7 from Frederic Bezies (fredbezies@gmail.com) ---
Created attachment 307663
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307663&action=3Dedit
/proc/dynamic_debug/control content

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

