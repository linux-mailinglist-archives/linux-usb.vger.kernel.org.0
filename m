Return-Path: <linux-usb+bounces-23166-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B455A90E8B
	for <lists+linux-usb@lfdr.de>; Thu, 17 Apr 2025 00:20:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEBBC3B7032
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 22:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05318230BD1;
	Wed, 16 Apr 2025 22:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KzPRz+89"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CA52DFA42
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 22:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744841995; cv=none; b=nLkcVq79gIZ/jgpMS2PsGemkShwpvSN8P25pvEVw3dDmIpqgo4w/T1eTOYFvSgJRvb85/ixVtvKK2t4mipGTpU/ru3/D1VdrZTJA67/AdaSkzc1DnZh2yNEsG0wAE7J3MuuAxif/9Dx/Ecg+Ipy45T84DLWCXMuBrfcyOxeEzN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744841995; c=relaxed/simple;
	bh=W0I8B7MsAth5PpnPQrhZCN3jfaNdWfK4+/xiya7hdxM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JFHL0/to79oSE3KDFye+H2OhlGGR/sgKvTpE9mDF6Y/yfkwEBSED0aaabeKDfw3GplvlBZenFOjTOkXUXKEGGFJsTFB1d2xAOTOBo9Itjrllqf7nPWA2irW8NhfOzDNjAsvKm7sr2RrOHzwekGBAhJDCli3iXHKZ9bCKE3z4W6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KzPRz+89; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01529C4CEEA
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 22:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744841995;
	bh=W0I8B7MsAth5PpnPQrhZCN3jfaNdWfK4+/xiya7hdxM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KzPRz+89LVrvieQ23rpHdKvUhXxaojxRyIgFl9U94+r0OG0S8V2jrF2YlamWwjCIa
	 zfTT638xnUn31gNh5FmmPTOQrQEfgF8s81cWZJkO32GfF1sLydE0SSe/DB2gDIIV8Y
	 JVQBsyg57fLhiBg5IurGuXwu3kClyYaGu1FondR7nB/QaTzewMDSqHyMOxf0KDO7Gp
	 /XBgvgwF1L+d1ERDpRj/VoKpvpM61uAQ42dG34299UwnH/03VMn6T77ZKLLsKQFVYZ
	 ZCTgIY4FuuIjXLvbvJkGT48gDMZg0c/sTNaF5K9AH30pfLKrW12dXztVbdv8QxL8zt
	 Efi+wubMXrrZw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E8B67C53BC7; Wed, 16 Apr 2025 22:19:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220016] USB devices plugged into USB hubs on
 6.14.2-300.fc42.x86_64 do not work
Date: Wed, 16 Apr 2025 22:19:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: PCI
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: joe@solidadmin.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220016-208809-Qlzv6ZBdjm@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220016-208809@https.bugzilla.kernel.org/>
References: <bug-220016-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220016

--- Comment #9 from Joe Doss (joe@solidadmin.com) ---
Setting pci=3Drealloc=3Doff in the kernel cmdline works as well.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

