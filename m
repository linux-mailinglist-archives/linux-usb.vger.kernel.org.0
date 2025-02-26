Return-Path: <linux-usb+bounces-21107-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B39CDA46E9D
	for <lists+linux-usb@lfdr.de>; Wed, 26 Feb 2025 23:31:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BE47B3A85CA
	for <lists+linux-usb@lfdr.de>; Wed, 26 Feb 2025 22:31:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D53125BAC6;
	Wed, 26 Feb 2025 22:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M0RBSd/J"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083B325D905
	for <linux-usb@vger.kernel.org>; Wed, 26 Feb 2025 22:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740609086; cv=none; b=daaAf3aLO8sDP92pU1ACocJwYRen4luyve7yutIbI0331SLOzbntPvOqdXLw0ObiXW2ggwhFrWbNI6qNNdvhHPC6+tsHv67lzQSKYu9WBFdFbjYMbRPQ5DAyUO7whwa8b9o5sg0kZrpDahyCEbGfGxS+2PAqkejWbxl2tMWrAqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740609086; c=relaxed/simple;
	bh=qTvHMhNateJ26tVlCz6mTebCLy5Y07OZpWJtnblGNIc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=MIv+ihD4F6t/5gW2l1jN9nU/FQlXaTIlyFZx/01QbxZVJAVRd286sjFZ4cTusqEXGppqUWeZfnJNDMGvSGryv5hB4Xg494AEzHUUNhtnAfwNDHr3iSyO9tkLVpw95adWypzeBKrSDQbrKZy3d2PRRk+JgVPUQD1yZfzrRoF3A9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M0RBSd/J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D61CC4CED6
	for <linux-usb@vger.kernel.org>; Wed, 26 Feb 2025 22:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740609085;
	bh=qTvHMhNateJ26tVlCz6mTebCLy5Y07OZpWJtnblGNIc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=M0RBSd/JSwZX/yRgQXtriCXZylodKSzuC4wK+Bbbe5STQyerxHCwiavNJeTEbcval
	 x2XBCTWBxYUGyjsEiO5Opzc/ju3jHR1JHolIEY0nPv0UPE4wopk55RcJqJx3c1bync
	 wb1J+xbZcNDKi081dU0LurCvckrBIeRtwDXZ6pdpbGk3f42GkiEMe/9FysPO29blIF
	 +6S1Qh+9rKSGrYm/Sj4We7gUmFX7As4DxFnycIprTKJKmh4VQj9bogoaiKespviMHQ
	 x3N4dbWO/Dvj4hMTSFaglW4hYdxLcWuBnZMPqGxjJ6aXSk/qZSxgsPmefYwuFtNVGE
	 kySaHD+W/Nqsw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 684E6C3279F; Wed, 26 Feb 2025 22:31:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219824] [6.13 regression] USB controller just died
Date: Wed, 26 Feb 2025 22:31:25 +0000
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
Message-ID: <bug-219824-208809-4EmFwGXN8j@https.bugzilla.kernel.org/>
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

--- Comment #2 from Artem S. Tashkinov (aros@gmx.com) ---
This was reported in the SUSE bug tracker earlier:

https://bugzilla.suse.com/show_bug.cgi?id=3D1236992

I don't see it being reported here, so the issue is not new.

Yet I see no patches queued for 6.13.5.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

