Return-Path: <linux-usb+bounces-22941-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17953A852E2
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 07:09:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDF2C9A1AA6
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 05:09:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3078E27CB35;
	Fri, 11 Apr 2025 05:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g5Npoiv5"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C6C1E7C06
	for <linux-usb@vger.kernel.org>; Fri, 11 Apr 2025 05:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744348183; cv=none; b=XdVfBwzjvg9UofEZU7OsMGvnISJjhvuaLwT4zcbNGb5BHrJYxWlnj/O2pSeFxIybvq5TygsNsR0DPW+7GHlho7ZhKWPNEOeTHbMoG9HdbjlxgpI+gswCFOseXPwWztQQrKXUkxLdPqPvZV4q1fqZm2vuDBdeD4kfSCiJ65PLsLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744348183; c=relaxed/simple;
	bh=801bC1WeogLvg+OXXH6/HLa5x12g/rdtgM4NFjFeUEM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=a9y2SZzdTNlgXywPq7yGshsZXBnQYFKSEbLZohEZavqCggmFMmFKhM4XnAHMy51YeCKZLLGpK4fm4bqa1StyATLlMFeJOPlC1e3ipxVrGVYt3JEfAlZyNZFX4FR4Q07Ah//ZrW4dEWX1/YbmhRpRSC26JRgfFD33a8YAXy8Co3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g5Npoiv5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1BBCDC4CEE5
	for <linux-usb@vger.kernel.org>; Fri, 11 Apr 2025 05:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744348182;
	bh=801bC1WeogLvg+OXXH6/HLa5x12g/rdtgM4NFjFeUEM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=g5Npoiv5feMhiylysr7sgF8W+tdpGg+oUXLRWfKpoZOlGRQQ2mAyevEO4vSJIrLB8
	 X6vMZEKtie45SQtPx6bW8OF2gdQZJ/f6G6wh+D85me+4sXKQdQ+y/gxQM1BOMQfw3Y
	 MTwJ5bxyiGVfhSocOX0gL3gs+Bew1xIy0o1MDHoIhgVKKRxZp7AxsgvzswzuWnlwZA
	 sVhFlh75OCPV8WaIhIRf3DeO02PXIBwC7MF8dS/wDM45zI9a3C8rK2ZULiqo8mIB7w
	 bHk+ak0A7fitvLIwVTz/OfR4uNW0u4vPPRetCXpOk6jIZ411mjcex2dyI2bdb9COJq
	 OIxtqig2K9uHw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 01D62C3279F; Fri, 11 Apr 2025 05:09:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220002] USB tethering fails with rndis_host on 6.14.2
Date: Fri, 11 Apr 2025 05:09:41 +0000
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
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220002-208809-x0znYrjKuk@https.bugzilla.kernel.org/>
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

Micha=C5=82 Pecio (michal.pecio@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |michal.pecio@gmail.com

--- Comment #1 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
No meaningful changes to USB core or xhci_hcd, wild guess that maybe you co=
uld
try reverting this?

d34963d968a6 rndis_host: Flag RNDIS modems as WWAN devices

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

