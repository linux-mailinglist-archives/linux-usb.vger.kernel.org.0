Return-Path: <linux-usb+bounces-31861-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B4CACEC1DF
	for <lists+linux-usb@lfdr.de>; Wed, 31 Dec 2025 15:46:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 726F8300FF9E
	for <lists+linux-usb@lfdr.de>; Wed, 31 Dec 2025 14:46:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4173719F12D;
	Wed, 31 Dec 2025 14:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l8XichAN"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4CB2C9D
	for <linux-usb@vger.kernel.org>; Wed, 31 Dec 2025 14:46:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767192380; cv=none; b=oUuxuZz8HEePiSK0ahv9kkkZhoz+O32LyiXOGBlmGlUgTqiZosV10Sd3SBNiOjCHWTOFLcNlyFAXAjQViIIVfZM3H9u990WBKtKToZcetjAMFK5QcVJt0BDYnBO0vkbkiboIoOO95jTSYmo7rgYl6dnqqOJewLHutoYYXy3tuL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767192380; c=relaxed/simple;
	bh=yzgDW8Mj0SZ9sQG7hd0W4FPMfmeqs3ccQn45XleAvlo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uBjAdVNh/kVz/jxcB8CItFtXgfT6qvQcqeEsLjHLiza6uo2HCjAq1zj6cxLA/lTyXB5Q/Nw5U4elZEv2Wpi/YjHuVdqxFTPMN44X4z1oaLcm7yoxOJdTuB4gW6BevQwmEL5+jPvMOSnrKhBI1s/915JO80ZzcwcRvnkZa+1uUSU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l8XichAN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 41FA7C16AAE
	for <linux-usb@vger.kernel.org>; Wed, 31 Dec 2025 14:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767192380;
	bh=yzgDW8Mj0SZ9sQG7hd0W4FPMfmeqs3ccQn45XleAvlo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=l8XichANhnfZKP6alZxLPfhRqKUcX/kRp5W+fvqESyXeE6WLmtwtp6Ja+wQQ6a5vv
	 P5EG9TO/gavy8emBCg4rDnKzLyAER7buAb4YnfXjy8f8WCjwVvH4K6fTWaWfmr1haP
	 qPIy4XA8XUBV1yacGEPD4W2o47f2r2Migr2Qz7XYXRIa2amY0rdVAY8UUcsliIZpm8
	 DGB+2/m4cRlY3OBTlzodpwQWSzw++B4dG5J1UxBb7wyKbdwe/U0Ee5d1ddyrv3jy1H
	 DOl0bqnozexbuEisBuiaKYRHoaDRdgN8iHS7ElS1YibEr7wEiVJB8RRY+hEmJYIbA9
	 6nHohq49tdDwA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 356F1C433E1; Wed, 31 Dec 2025 14:46:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220904] [BUG] ucsi_acpi: USB 3.0 SuperSpeed not negotiated on
 USB-C hot-plug
Date: Wed, 31 Dec 2025 14:46:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: thomas@jetzinger.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220904-208809-mkCbBdG7HO@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220904-208809@https.bugzilla.kernel.org/>
References: <bug-220904-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220904

--- Comment #8 from Thomas Jetzinger (thomas@jetzinger.com) ---
After further testing, I can confirm that the USB ports also fail to recover
after suspend/resume cycles. Will share logs later.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

