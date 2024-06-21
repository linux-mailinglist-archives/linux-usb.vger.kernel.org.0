Return-Path: <linux-usb+bounces-11543-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D0383912E22
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jun 2024 21:53:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0DB3B1C222EC
	for <lists+linux-usb@lfdr.de>; Fri, 21 Jun 2024 19:53:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD4CA16D4CC;
	Fri, 21 Jun 2024 19:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ACpB606U"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563D3156F3C
	for <linux-usb@vger.kernel.org>; Fri, 21 Jun 2024 19:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718999592; cv=none; b=QSjVzE0beoW7fjq1no+2Vx9OzcKYZgv23v/iqufUZBNpJHW1NkKVftYpgE+jYegb0+TD0AL4rk2rjzIVWvs0i22660TtcOpdDgPFK//3HRsTgPQyVXi423e7vcfE05O4v1UdYwwDrD9MxXXU99RvSpYbFlun08t0Hatbto5r74c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718999592; c=relaxed/simple;
	bh=uGD14xlNB/oV/k4DhpUPc2vgl6B6KfoXk50e7Bw0Ke4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LYs6vXPqGKWHcEW7RHWouWdKAN7JSThSHkxdH5muMCk0JN+Sz0PpfWUYrV/gY/QuSArYLS+PFyWG+e3aOvcx2O9ndg3uTAYI7udNdnmJ0veP550vtp6gCEVEg9SzWYQq3BQdlKQPF8EFhQlb1nvTAzsuSKSAnrz+Q1yU0rcwBiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ACpB606U; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CD94BC2BBFC
	for <linux-usb@vger.kernel.org>; Fri, 21 Jun 2024 19:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718999591;
	bh=uGD14xlNB/oV/k4DhpUPc2vgl6B6KfoXk50e7Bw0Ke4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ACpB606Ueo7awgaFGS+yoFDwnUihaUj6/Kk7jM4JJbG79Dl5RkyGp1ON1WcFSOJzz
	 dgDyPCMzbaCcOzgvsfh+w9RgJKT0rTIeGBojhTo0cWRydEqC4SBPdin4IlZS4Ggle7
	 3N516E3oZEDwdQSrJDkrAQfdFNVo9zjmvcaPTlXjgGd3w3t4cWjp44kaIHGclpLoRy
	 i2x1tOpFG2sIWUZMF75/r4U8o/CYINYuzC+x/uH04Bs5nEF7Yom7JKiFe7oYIgmPSP
	 wUOdsQpoUjrp9TNSzh0x43uzK1jc3ndAJTV4MrSJWCNQo5vACzZpCLDo9ag7zOJxvI
	 LuvSjJ+cHdFkQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BC6EBC53BA7; Fri, 21 Jun 2024 19:53:11 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218890] reset SuperSpeed USB device number 2 using xhci_hcd
Date: Fri, 21 Jun 2024 19:53:11 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pierretom+12@ik.me
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-218890-208809-jQZBDAVVlV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218890-208809@https.bugzilla.kernel.org/>
References: <bug-218890-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218890

Pierre Tomon (pierretom+12@ik.me) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--- Comment #17 from Pierre Tomon (pierretom+12@ik.me) ---
Patches are now in stable releases, 6.9.6 here, all is ok.

Commit: f0260589b439 - xhci: Set correct transferred length for cancelled b=
ulk
transfers
Releases: v6.1.95, v6.6.35 and v6.9.6

Commit: 7926d51f73e0 - scsi: sd: Use READ(16) when reading block zero on la=
rge
capacity disks
Releases: v6.1.95, v6.6.35 and v6.9.6

Thanks to Alan Stern, Mathias Nyman, Martin K. Petersen and others for the
help.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

