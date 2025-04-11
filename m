Return-Path: <linux-usb+bounces-22993-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD57A86851
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 23:31:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 593BE189A562
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 21:31:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D64629C356;
	Fri, 11 Apr 2025 21:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CoGufKag"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E46F929B237
	for <linux-usb@vger.kernel.org>; Fri, 11 Apr 2025 21:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744407086; cv=none; b=d/z7U7r8SDBIoTeI/Us5IED4KbUzKvZHglZbblXQMVqNgWgNJ3Ai0GPyRv9Eiq0/MdKhrNonAq/yONZB5RqEYq0RUEzFLvn+WNXjdaGDQwLjXgSuxPAg44I+/t+vdx/g16dCqu03a6dRVSB3Q4SY/gXKb7ZpLw92N+kqv21k+Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744407086; c=relaxed/simple;
	bh=lxMQq6L8ptGSHBjM2OYnoy8cqR2pBlMlLM/eeZbpZ2Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ltj3Rcpv3MSlR4BNkHn4vdaSPcCrN5A3e/8JYkVXmijyL+RidrCUHmokDlwEde7h30iZzHIKKrEJEfUFZQXDO75HeN2XRYDR78rws4wiSyzKYliVBGyU5yTZLRnM/11bGmVUydLsrCQQc5qxV+snLl2qk2kB8dvhsyfCtE0Fpdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CoGufKag; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 626B3C4CEE9
	for <linux-usb@vger.kernel.org>; Fri, 11 Apr 2025 21:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744407085;
	bh=lxMQq6L8ptGSHBjM2OYnoy8cqR2pBlMlLM/eeZbpZ2Y=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CoGufKagUPBlKp3jt9XZRjVpLtppq6Fls8Qu7g6OXRdrRMG5GazCkBMaa52OSuBsl
	 IWdfxSLjKMonk9eG96v58Z2pwbdUuFUZxJ1NzDZvVeBHKZwCgRZbG2zTKa5fu6ZGr3
	 psGVJG/QMLKY+F4cd7qhLkx+X8IXcwMFHSOryoL8clzflNbQ/riVetYl2WaKKZALIj
	 VZzhhDGMqUccXUvWv6a6Tu0HzJcxKKvaaKm9c7zaNOah5Lyb162wVJMIrEzJxZEGZw
	 s5zvdcLiSHTBbKFhZ5rphjfhWSlv7mzr4hcL3mHcIJoinMBwfuwh9dejGPkHU51WtA
	 oFaVwQ1MKG/6Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5346BC53BC5; Fri, 11 Apr 2025 21:31:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220002] USB tethering fails with rndis_host on 6.14.2
Date: Fri, 11 Apr 2025 21:31:24 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aminvandh@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220002-208809-t8FFcIhXv1@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220002-208809@https.bugzilla.kernel.org/>
References: <bug-220002-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220002

--- Comment #3 from hooman (aminvandh@gmail.com) ---
I revert the 67d1a8956d2d on main (6.15-rc1*) and it fixed. thanks

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

