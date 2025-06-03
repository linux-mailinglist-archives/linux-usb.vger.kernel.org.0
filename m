Return-Path: <linux-usb+bounces-24455-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BC721ACC916
	for <lists+linux-usb@lfdr.de>; Tue,  3 Jun 2025 16:28:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BEFC97A5278
	for <lists+linux-usb@lfdr.de>; Tue,  3 Jun 2025 14:27:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D10AE23816C;
	Tue,  3 Jun 2025 14:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jP4TkH4s"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5971B3E47B
	for <linux-usb@vger.kernel.org>; Tue,  3 Jun 2025 14:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748960904; cv=none; b=eXM0hpIN1Ofle2PGc8B18Ooyca5nde4KQKQK8Cv+RW4r2dRDvSnhRHQ4L+F1JQe6EcsVYg407fFbdq0lUqTC/k/msmmGSd5Qa+yjJq+SGnnVBU0lGOi78kV8zewcgC9Y+7/H+4A5n/EEqRTVlyT2jLUtRjOX+3RV/AvASRAgaG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748960904; c=relaxed/simple;
	bh=aIU2Fjh+8fTusD3pQHtrSwEhdjzHPQT+huzCgoAfCxs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BuSHwKn4N5UPH3Repi3GrhQOEIKKnBwjRjCMVN07ZCOrE7y5X1G8d/o5L0yidJdM+IoO9tvVfs96mpjPchWGNzGUckvlpI/8Nkg2LWY3SUv059bNt1gfP33yuiosF+VahsiNSLBfle4UijuH+k8LYOFffvEaQvhtqzy2QVyo6+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jP4TkH4s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BB323C4CEF5
	for <linux-usb@vger.kernel.org>; Tue,  3 Jun 2025 14:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748960903;
	bh=aIU2Fjh+8fTusD3pQHtrSwEhdjzHPQT+huzCgoAfCxs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=jP4TkH4shaXLpGtGxDw/zd10JZY/iasLIIVd3Q1X5eKlscaTtcGj6r1ro1mocDXGv
	 GkTluIcBs0holXLZnanW2UsO49AtIgMRp48+/NbzX0ceRb0aHZXsTu+3wLCQnfx9iD
	 tFTwa9c5eqqzJ9y5M5KnRdJFiGysPjJT+N+wq3ZQDZoFlAt2bSF0OO+RgAHWk/AzJe
	 IuX1HWfhISIheMqlfqUAYwwp9vbNv2wvmx0pAvm/uQhaSfMzxAYDpE9odoYQtbR44C
	 /tBGJD9XbKIupjd9XfpKpASzeXQsZ+i8kAuRWERzegote0lLMpHRT8NJcjiQ9DnycX
	 KVIslpjYXFddQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B219CCAB780; Tue,  3 Jun 2025 14:28:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215740] kernel warning: DMA-API: xhci_hcd: cacheline tracking
 EEXIST, overlapping mappings aren't supported
Date: Tue, 03 Jun 2025 14:28:23 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215740-208809-tMkHMwvonz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215740-208809@https.bugzilla.kernel.org/>
References: <bug-215740-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215740

--- Comment #42 from Alan Stern (stern@rowland.harvard.edu) ---
In theory the problem could arise from any two kmalloc allocations, not just
the ones done by the USB hub driver.  It would be better to fix this in the=
 MM
core or in Kconfig: Set the minimal allocation alignment to the cache-line =
size
whenever CONFIG_DMA_API_DEBUG is enabled.

Would that be acceptable?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

