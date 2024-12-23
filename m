Return-Path: <linux-usb+bounces-18738-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4229FAE14
	for <lists+linux-usb@lfdr.de>; Mon, 23 Dec 2024 13:02:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 66E271884451
	for <lists+linux-usb@lfdr.de>; Mon, 23 Dec 2024 12:02:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 396E21991BA;
	Mon, 23 Dec 2024 12:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K48k9pR1"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1772194AEE
	for <linux-usb@vger.kernel.org>; Mon, 23 Dec 2024 12:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734955343; cv=none; b=SDZOFyMPWPDyKTISdnNHeAZ5LW3dTVJ1v7yGzzR9EUeG3ocSQZYJaA0vx8KjctaWN5P4i9IdsctKTusXgDQCBDVcibBxuJZOKDgA1WM5q4v4e4AVhDdgAfndDXwboYUq+UQUlWRf7D+sAEoKNIEAphhmLbGgd27c/hK1Ipxs9C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734955343; c=relaxed/simple;
	bh=7EBuY/k7h/6LfRdOByD0a0RKEk9s92v7hfhSR8YBfTI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PMEne5GGSd2qKH5LHYssUHg+zRjiXmVM/okzmGH25WRg+lL5zJDjKaCVH0vauktL0SbgEyNL3G8Z40oq86KaPTTB8v5uNwL8idp4YwCOymZcjhklaBhO8uZE0XTdPVP8eL4QftjZcsES3oxOzKcTdkJr6O5J1NPERw59pH5B4ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K48k9pR1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3BEECC4CEDD
	for <linux-usb@vger.kernel.org>; Mon, 23 Dec 2024 12:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734955343;
	bh=7EBuY/k7h/6LfRdOByD0a0RKEk9s92v7hfhSR8YBfTI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=K48k9pR18e4rm2gk0MU7YuufeehWGapucTpYCvYH6hmwgSQnNNSEyJNocvDcZN6CR
	 +lSCnbGhwfuHmPLtewx5wKF3hdikNBtjQ4yXQPBfKc+hpRN8rRq8clRICNZInhJnoa
	 24qnoXwL1X4ZZSXIrQs+2FrTjC7rRbKW55QCUqHJJaMWcm30vGG7B5ODvBNKc6V2VU
	 J2QGf5EanyfmKIATSIRuz58//3W5dM7/CI6TE58g+DuW1MY9JGVLebpzJb/EWG3N4z
	 rSccY7hvQZfSmQClYAUEtTDUsfNUYiw7nZagqYMqrQEW7ULLaPTsd4mAzIxIedEe/c
	 o/sWgCm0fbuhQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 340BCC41613; Mon, 23 Dec 2024 12:02:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215906] DMAR fault when connected usb hub (xhci_hcd)
Date: Mon, 23 Dec 2024 12:02:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215906-208809-Fco7ZKnl1D@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215906-208809@https.bugzilla.kernel.org/>
References: <bug-215906-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215906

--- Comment #24 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Maybe debugfs is not mounted. Try
mount -t debugfs none /sys/kernel/debug

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

