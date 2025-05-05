Return-Path: <linux-usb+bounces-23705-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C997AA8FBB
	for <lists+linux-usb@lfdr.de>; Mon,  5 May 2025 11:40:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8AC731897035
	for <lists+linux-usb@lfdr.de>; Mon,  5 May 2025 09:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE9051F91E3;
	Mon,  5 May 2025 09:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JKdW/E1i"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F8314A4F9
	for <linux-usb@vger.kernel.org>; Mon,  5 May 2025 09:40:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746438003; cv=none; b=O1jeFowkcOsq79nmszY3I7s7Vn0fZGywM/w03nKLdjZ8iPTllSmYmEeoIHqKM2W8+NDZg20KMwR089M8njaS0glJb0TvRN17W4DCADFeUzUzlrsDcyjU6GJMLsNQF8rjo3XsuVGZZt29+h4riCT9fzUuYEp+Op4g1+aHnq06n/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746438003; c=relaxed/simple;
	bh=L1keN+D/cy4GU+m6O3XnsSIRyV+uz764gQEOxWkIYAA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=i3BOIgaDU5mU91f2TvmNsKzWJ4fQY4hQ4b4nfLWWCfYAzQq1Y5gpufpNO76PM7E8N6KpbMtsOprnmYrrqmJgSSYMtcrYQUaG97gILFFIKETb2MESaDSh7Eg2jWIzvEJqsysA400RgzEkJVUBJDHFA8L91igrKC/IABuj2qo0sfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JKdW/E1i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CC6DAC4CEE9
	for <linux-usb@vger.kernel.org>; Mon,  5 May 2025 09:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746438002;
	bh=L1keN+D/cy4GU+m6O3XnsSIRyV+uz764gQEOxWkIYAA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JKdW/E1idln3SBlw9JxMlrL0DSuJmQOpptcjOaGeXG+rMw1ypz/mmIkMzCu7PvE5Z
	 2C7hE7VV0q6h+F6Zk44xwBYEDSR10XW7zg0cAtYClmanF8dNPXjxezJ4fjnDTNJq3y
	 HYMRnAL8YT6IyND3CLAC/bp2p3ZWmYyjgoTqAtTYgiEogReNQ8Hb2OZ8ER5KpWQAFW
	 PgQ3B9YH017TzQWXSD/B8sQujZnuT0Zuls3/va3WYn2aKj0lmrctE5iHufL6vJMUUZ
	 AG+jUJUYbyHLde1RJzq1508TnTW7zZbPjtWVfiPg61hemJKK7lIu8MOioHIYgvcvIl
	 olvY/ZqnISPyw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BF055C3279F; Mon,  5 May 2025 09:40:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Mon, 05 May 2025 09:40:02 +0000
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
Message-ID: <bug-220069-208809-n3Q0FhFmAi@https.bugzilla.kernel.org/>
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

--- Comment #40 from Claudio Wunder (cwunder@gnome.org) ---
Just to double check (unfortunately I'm not much familiar with GRUB),
`GRUB_CMDLINE_LINUX=3D"quiet splash xhci_hcd.quirks=3D0x4000000"`

Would that be enough?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

