Return-Path: <linux-usb+bounces-21767-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EA5A2A60F4C
	for <lists+linux-usb@lfdr.de>; Fri, 14 Mar 2025 11:49:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 41CD6881980
	for <lists+linux-usb@lfdr.de>; Fri, 14 Mar 2025 10:49:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5AB451FCF7D;
	Fri, 14 Mar 2025 10:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WC3XF7pr"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FBA1779AE
	for <linux-usb@vger.kernel.org>; Fri, 14 Mar 2025 10:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741949388; cv=none; b=STGvG0BZmNS6lXjCpYRngmoxp0WvTX6MwTLnnqlNgFz2Df+54IaEkORKEuLFxSyuwpfswNSTL5SvaBC0UC2ZZeG7TNX9eMORWNmNaETQW7olsSPNYequyXNk9FJR5xMv4QPu6RoHI0GbGEL7jbkt4TT5e3CH3kGnr4CuMD/YaXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741949388; c=relaxed/simple;
	bh=6fYljQwt3u12BXQOyzUx7F5nLQG7ON36kwqKS5VfNkA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=R61Dlw1uB0owHcXqpkx9TAoCwXnU/W8qNBmMSaviWSzAM2YQBoq2EABzYhdFPEcHyV4GWJqbHVQhu7SpNih4CTefSmKRE2R4fwu79UqMyoEhhYx3FC7WfvnTXPe3HFXq+bZLxULVDrDWC0v/igap9Pda/t6111aTrLlSzG03XS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WC3XF7pr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 53E12C4CEEE
	for <linux-usb@vger.kernel.org>; Fri, 14 Mar 2025 10:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741949388;
	bh=6fYljQwt3u12BXQOyzUx7F5nLQG7ON36kwqKS5VfNkA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WC3XF7pruA73WWluJH19y6LYnAisL2uOSe8hvv9Aewyt1biZ9C3giqbVWBvg4X68Y
	 DP0YNAjYLqJ3g/pcGTQE92cJHsUdqTSedA2V9xqZoMvl0e+i/EIyKyNh5EfHgI3rMq
	 l8givj5IO01m6xAa32SSsKqSSS+SL41wemrr9hIxr1Zd+rYrekMVoveZ0irRC38qQs
	 u8kuydhtO2N2bUb2PYvZUJMp3MwkaapVTkzJY9xeKVQO6nRm3VdABaUcANFCWntibD
	 0c/1TeBgSX18osl9o+EPmSWnvdSawdNJ7jDN4PKHMjX1BaspJiYSvr1ffEAAcxchXv
	 DShs1GLckcezQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4AEF7C433E1; Fri, 14 Mar 2025 10:49:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219824] [6.13 regression] USB controller just died
Date: Fri, 14 Mar 2025 10:49:47 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: christian.rohmann@frittentheke.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219824-208809-DsaawuT9sW@https.bugzilla.kernel.org/>
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

--- Comment #23 from christian.rohmann@frittentheke.de ---
(In reply to Artem S. Tashkinov from comment #22)
> 6.13.7 absolutely includes it:

> https://cdn.kernel.org/pub/linux/kernel/v6.x/ChangeLog-6.13.7


Ah sorry, my bad. Thanks!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

