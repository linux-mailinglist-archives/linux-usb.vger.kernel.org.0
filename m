Return-Path: <linux-usb+bounces-23569-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DB074AA4611
	for <lists+linux-usb@lfdr.de>; Wed, 30 Apr 2025 10:57:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A87C33AEF77
	for <lists+linux-usb@lfdr.de>; Wed, 30 Apr 2025 08:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A3D0B213E89;
	Wed, 30 Apr 2025 08:57:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lNSXm+Rg"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA8A20FAB2
	for <linux-usb@vger.kernel.org>; Wed, 30 Apr 2025 08:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746003462; cv=none; b=YDzz43vBUNpyVIffZX3Qj9LRsGVs1T5+lenrOuEBuhGkkVwyNIskRA8dN53CWx/O2FNg28mVQ4eWBP+jzcEdRDLHj/SFcBjlreB2CK3JKxaaKsh2hTWD9e2Qcaz9UcWjy9lGIwbofy1beTs6TeSovZ5iBxrjpKtwOQCdvBmmkyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746003462; c=relaxed/simple;
	bh=dQXGjepkVw6G+x+ChLqGDMLyB2gX3KP7wTGHNv0FjcA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OinrXQNIH468avJ/6r4wjn5UjE4lo5pRnhKowdSQpNln5qoTW42X8tMgSIn3BtNswVQDU4QiKQUmatx3cf75lbWyjXGlPjmFdspWN3m7NRGs6WKmVJZnWo1j0+WHoZGYWMrTKmYGW40WvGLFltsKAc1cbWi9VoSY0qrplNoM9bM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lNSXm+Rg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9DD61C4CEE9
	for <linux-usb@vger.kernel.org>; Wed, 30 Apr 2025 08:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746003461;
	bh=dQXGjepkVw6G+x+ChLqGDMLyB2gX3KP7wTGHNv0FjcA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=lNSXm+Rg1UyAD42s5Uscxk1DkNK1xoMcFoJ59lmn5jv0RMtPelMo3JwUrJ/rgmbZX
	 60UNgzBBTpSzIEFxkWFpk/OTZM73OHrhN89LCQUT+7pfQZBAtRP3RhOY14Vh2uDKOv
	 K2Gz5TqWy1U6TrGksgdgNQBFndO4skaxpiavNv67WjpEkRaxA+smxh6uftPuFXsl/x
	 DW1fOVTmjEeZ40HA5e1o/gTNumUWe1tEuyY1h/39qJ7x+T+SJt1lxDnWnS36MYs7nJ
	 mGOQ9dvNXfSnyaxBiLMK8zcNzDbCzDDm8EBHRnEtBCdUI8nRiz6D25T1nAXPdIF/kS
	 FeOvogqgIeS7g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 8FCFCC41614; Wed, 30 Apr 2025 08:57:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Wed, 30 Apr 2025 08:57:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220069-208809-mwfMNFbs0o@https.bugzilla.kernel.org/>
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

Mathias Nyman (mathias.nyman@linux.intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mathias.nyman@linux.intel.c
                   |                            |om

--- Comment #5 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
The symptoms still hint to be the regression caused by:

36b972d4b7ce usb: xhci: improve xhci_clear_command_ring()

Which  was fixed by Michal in:
c7c1f3b05c67 usb: xhci: Fix host controllers "dying" after suspend and resu=
me

Regression was caused by command cycle confusion, meaning controller stops
fetching commands from the ringbuffer as it incorrectly assumes that comman=
ds
queued after cycle mismatch are old commands from last cycle on ring buffer.
Driver keeps queuing new commands and hardware keeps ignoring them.

Regression was first noticed when a dedicated timeout timer for "stop endpo=
int"
command did not complete in time, and timer handler assumed host is dead.

In this case it's the generic command timer that times out before a "stop
endpoint" timer. xhci driver tries to recover by aborting the failing comma=
nd,
but abort likely fails as well as hardware isn't really processing any comm=
ands
at the moment, and we end up assuming host is dead.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

