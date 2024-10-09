Return-Path: <linux-usb+bounces-15918-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C747A99677F
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 12:41:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 29670B2248A
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 10:41:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E78C918F2DA;
	Wed,  9 Oct 2024 10:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G9CC9gpn"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71DEB18E751
	for <linux-usb@vger.kernel.org>; Wed,  9 Oct 2024 10:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728470501; cv=none; b=eGeLoqhsVlMptF4A7vXAxOFtnFBntyTtmkyCF3i23TWpuN6ef9nFJvDshZV8YqCLhY5ZnSEVCbiOn+4JuuMSX7MKWHt4NkzEOpCpAoovSPOj0m21mc/oWMKYMaamS5db3NYu8WL9wTTA1qw7yiElEdI3xNCB914cEUPy1Z+P4PY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728470501; c=relaxed/simple;
	bh=bBopqJzJnoYVPRnqjd+7UpMxANx5WhFlV/HIB9FVHx0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OetpHDQoFJja3LAGLoJz4rWm1p6qrVyvNczSYbKEh1WzQB3iN7OB1zRKSBBgHhO18hc9HlfU8e6Mr3zhvt476RmPgQbvxle+79vgO8uV/pcNTGtR9q2b8lmQDNrycyiWWJIf86TlfYCMhmh7WQpifLbd+wScx3LfNav+mUGcv7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G9CC9gpn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id F2DCEC4CEC5
	for <linux-usb@vger.kernel.org>; Wed,  9 Oct 2024 10:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728470501;
	bh=bBopqJzJnoYVPRnqjd+7UpMxANx5WhFlV/HIB9FVHx0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=G9CC9gpnUs7jd1bI0vfSbjtRFOjv/Q0dQH6rMapbK3GLC+4f4WO4INjXJVQMOHr62
	 qZdhj1mnPVDKeypvoQPJVlzzt41H6IpKBwogf3S3MGir52ZDqQd1nF7gg/1H0YFXPS
	 6BrwJdWa+yt7Y9gtXvgO+Q1MrkjMYJa/I6A7WyOZhXtc1U+f13axjqmFz1W49oj5aG
	 dWWCd/0OUD2YkXWc1vbqSk3WExFNYbqUrXUHhFmmt+WRZ9grANBuwfitlP6k1m46Z+
	 p+BThtKTr0RwfUe9j7ETJccvVlZIYShyi5bVordSTKiNAa4EGE6N7JRd1QYyjZtx7J
	 OiirA5/2DtF2A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E59F1C53BBF; Wed,  9 Oct 2024 10:41:40 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219362] USB SATA does not correctly shutdown the SSD upon
 poweroff causing data loss
Date: Wed, 09 Oct 2024 10:41:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: IO/Storage
X-Bugzilla-Component: SCSI
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: harviecz@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219362-208809-oJRp7WbAWL@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219362-208809@https.bugzilla.kernel.org/>
References: <bug-219362-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219362

--- Comment #12 from Tomas Mudrunka (harviecz@gmail.com) ---
But i want to be 100% sure no userspace will be involved in the shutdown. I=
f i
do proper shutdown the init will be doing stuff and i cannot achieve the
shutdown on time before the backup capacitors discharge...

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

