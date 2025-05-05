Return-Path: <linux-usb+bounces-23701-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B762BAA8F1A
	for <lists+linux-usb@lfdr.de>; Mon,  5 May 2025 11:14:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 049AD3A660E
	for <lists+linux-usb@lfdr.de>; Mon,  5 May 2025 09:13:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9364B1A5BB9;
	Mon,  5 May 2025 09:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TBp9DNR9"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A2E81D54EE
	for <linux-usb@vger.kernel.org>; Mon,  5 May 2025 09:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746436438; cv=none; b=Zhrb5ec/4ckjoVvyOCyZvaJlhxyTfsN3hj2OoWVDmUnptVFjr17ewRsVg2RT5D65gHyykIGqcQ1Ugxj+n05nxgveOLi7t26TYax8Y+PxrsLkTl/n7CFueBN4SgijjtFh8heQmGyl1sHml247phLTnvqcvUIgHIA+ajK2nQRqfsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746436438; c=relaxed/simple;
	bh=PPqgH6fZe1xu5sKAnV/cUZcuSoh6zHQY/v9NZ50ANy8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=U1i7xirE1X4/cfGH7CEUh7DRWbeX5s5Ib4KAtepx1d141aboiIiewKmiBQrBWQWBqSMVRK+R7QMbo/hdCUCjGrsT+JWtJlcMJhEWNNf/B//LIy/O34/2bmo2ABFr0cUQZuu4UgLUkP/txIkuCONvW/1UvHXjgBHwVlZNiZRn+m0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TBp9DNR9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 821EBC4CEF1
	for <linux-usb@vger.kernel.org>; Mon,  5 May 2025 09:13:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746436437;
	bh=PPqgH6fZe1xu5sKAnV/cUZcuSoh6zHQY/v9NZ50ANy8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TBp9DNR9Pzy8FTAgaXA4dNAZwAo8hzBqwBNoUJwRI0Vyeak4u8pxeUGUVhUYiObXs
	 py1O/PZ/orzmWgb5Vj9xtaHqM7g8cTgAIS1odL3ZVpicdGH0Z13gDQTBpH30gnxqi1
	 myGXb8gqCD4qSVmbR9KBMc5Pt79YiptmG268wWRlzMpITo5Zp6hmFstTtmLP9sTaYr
	 f2mkSRDtqjbDxPKT4b18yiBkHaIwWSugNUwR48YxCLbi9o+8czkoyO4oBvxF/3tXQa
	 iBPHZJeO9A5vj338mQQwoK4BY6/CoQns35wuxOfbAwsOXZ77gcJGINMeuc6u89ES29
	 eCPxcp4Nrm9wA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 73BFEC41614; Mon,  5 May 2025 09:13:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Mon, 05 May 2025 09:13:57 +0000
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
Message-ID: <bug-220069-208809-jxWqTAwKPi@https.bugzilla.kernel.org/>
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

--- Comment #38 from Claudio Wunder (cwunder@gnome.org) ---
That's very useful (all the commentary)!

By the way,

> Looks like a 3rd crash happened, interestingly enough, the script did not
> detect a 3rd crash and did not send an unbind/bind command; But the Bus (=
5)
> got completely disconnected, Bus (7) which previously had the webcam, now=
 is
> still working. I did not have the autopsy command running for Bus (5) so =
no
> logs; But Ill start it now and keep an eye on it.

Ignore this, I facepalmed myself afterwards, of course it would only
unbind/bind and capture 6a since that's what I provided to the script. I
modified the script adding support to "multiple" pci ids and generating the
folders and dumps prefixed with the pciid.

> I would suggest to reenable power management, and try something else. If =
you
> moved the problematic hubs to bus 5, try to move the problematic webcam to
> bus 7.

Noted, Ill first keep it off for one more day to see a crash happens; Then =
Ill
re-enable it afterwards.

> If bus 5 crashes, the problem is only hubs and the webcam is harmless.
If bus 7 crashes, the problem is the webcam.
If neither bus crashes for a few days, it looks like it takes two to the ta=
ngo.

Ill attempt these distribution steps.

> If your kernel has xhci_hcd and xhci_pci built as modules, run:

`lsmod` doesn't seem to list either xhci_pci and xhci_hcd as modules;

> If they are built into the kernel image, you need to figure out how to add

Seems the case. Can I add this flag via grub?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

