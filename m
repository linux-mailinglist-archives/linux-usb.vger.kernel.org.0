Return-Path: <linux-usb+bounces-27192-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A794B32066
	for <lists+linux-usb@lfdr.de>; Fri, 22 Aug 2025 18:23:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1DC321C2431E
	for <lists+linux-usb@lfdr.de>; Fri, 22 Aug 2025 16:20:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CABB226A0B3;
	Fri, 22 Aug 2025 16:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WUSyNGSK"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF5C265623
	for <linux-usb@vger.kernel.org>; Fri, 22 Aug 2025 16:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755879596; cv=none; b=FMWQuhF+8qA5xvLNzNN0LRIjL+GMI6aT2trmBTM1v2FBJ3/HtNBsxjpnpYEFkUICi/JreyGfFwld34AR28CDpIgwsTafO3aTMt5aiUAtg03Yu0oKo8cPjPbA4nY/00JtlnzAvTzMdOfENiRyLP+1xgneUGUHrnsoXu/bbnLTfdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755879596; c=relaxed/simple;
	bh=tAsBVwoxKCQ3PLvYUXC/VSZ8FxXaMUtYExN9Hz38wMk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S9fZ+mFLFT0Tklj5429Y7aXMmYLnzlRTKFc7DhTGCsTZc+2dR9WF6hnVCq87JFr6kbVVr6xje/RYg55mxg9gz0qIODC8KNZRGysI7ndvWLLLkBPuHIQtoqlKhNAA+DgsKq90RL1gsIecWFyxvs0widdF80lYwbo8sLnyLxSybJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WUSyNGSK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C0FDDC16AAE
	for <linux-usb@vger.kernel.org>; Fri, 22 Aug 2025 16:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755879595;
	bh=tAsBVwoxKCQ3PLvYUXC/VSZ8FxXaMUtYExN9Hz38wMk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=WUSyNGSKJlvbTKx+FEsw/XN18D/kQhUGqsIHpjhK5Aib11JYHmUwlvR3ciOv3mhJo
	 7ZIyWSoZJnu4fg05xP8HHbQNnWnr0Hf6De8ZL5Nt3X/kMKsvez9SbrDOzYDj3ymEXL
	 ycCxJ9mPAAnwe0Z3KHpPVjwOQWzsKexYX6y5+0XkLJoREExmPLUR/18G954xgwVCwA
	 ZQ2zgChP1WjldvmMWvNQap+TlmAeo8upiiq+a1K8UBKm9oyfAImO2nwFV4MY/lkpj4
	 7OqOSpPXjtJySzQocOu/I0oTgeC0Yze23otDztyYvYiFxBMb8bL4vA8lNZB9gY/T+c
	 39nUGGT7dQtSg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id BA4C8C53BC9; Fri, 22 Aug 2025 16:19:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjAxODFdIFVzZXJzIGFjcm9zcyBkaXN0cmlidXRpb25z?=
 =?UTF-8?B?IHNlZSDigJxjb25maWcgZmFpbGVkLCBodWIgZG9lc27igJl0IGhhdmUgYW55?=
 =?UTF-8?B?IHBvcnRzISAoZXJyIC0xOSnigJ0gZnJvbSB4aGNpX2hjZCBhdCBib290Lg==?=
Date: Fri, 22 Aug 2025 16:19:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: grm1@mailbox.org
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220181-208809-r7a4bkm1iQ@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220181-208809@https.bugzilla.kernel.org/>
References: <bug-220181-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220181

grm1@mailbox.org changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |grm1@mailbox.org

--- Comment #13 from grm1@mailbox.org ---
I found this bug report here through
https://bbs.archlinux.org/viewtopic.php?id=3D302115&p=3D2 after lookup my j=
ournald
error "archlinux kernel: hub 6-0:1.0: config failed, hub doesn't have any
ports! (err -19)"

I tested the patch
0001-usb-xhci-pci-add-support-for-hosts-with-zero-usb3-po.patch 2025-06-04
13:14 UTC, Niklas Neronin.

Running archlinux with custom linux 6.16.2-arch1 PKGBUILD to just add the
patch.

The message disappear and i don't notice any crash.

System is "ASRock B650M PG Lightning/B650M PG Lightning, BIOS 3.30 06/16/20=
25."

Thank you Niklas Neronin.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

