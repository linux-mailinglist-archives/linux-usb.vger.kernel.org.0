Return-Path: <linux-usb+bounces-23228-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 17EDBA93ADC
	for <lists+linux-usb@lfdr.de>; Fri, 18 Apr 2025 18:30:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E3A433A22AD
	for <lists+linux-usb@lfdr.de>; Fri, 18 Apr 2025 16:26:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9689E21420E;
	Fri, 18 Apr 2025 16:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QAQ3xAL9"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C0FB21506E
	for <linux-usb@vger.kernel.org>; Fri, 18 Apr 2025 16:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744993541; cv=none; b=d6lm2s5id/nS2fFQNd1J0rp4pL8ljwdOgLIHm3lE/d/hXzerxEzQi3do4HQSaajDAjaZCr/sPFrkSghcvFiX5bmHO3kSbNn4pBdm/ZYj+PJ3zmz7oOtygN9olibPVJvfhbM8/5c1vFUJy7QsudHDce2JxvZJNdd7VDQt7G7G8jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744993541; c=relaxed/simple;
	bh=VfROq6WPTSBO5Ap5dlO5eNtUqJTJKGNwUoxJ17LWDK4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=s7vOCUHzZoSK31iia2xsLlAhluN2yLWp5lgfKAyLVHbIL2iZvat+zGV5Ir+Pfbfc12nswJ6ryJJGjSSvpy+Kmyy8DRh83oiIv5OCL57hTgcHJFeTc1DnKJHbbd9ki6kr3BvRMiHy6ujDTuZwYyJu/baOcmeCOZaST/kv3qO3V9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QAQ3xAL9; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 82ED1C4CEEC
	for <linux-usb@vger.kernel.org>; Fri, 18 Apr 2025 16:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744993539;
	bh=VfROq6WPTSBO5Ap5dlO5eNtUqJTJKGNwUoxJ17LWDK4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QAQ3xAL9P6GiN5c71KXFkKFBs7VgriQ+ivIm+qpUIJ8DaDG8ipsKYP/8bMEZ1hYuz
	 PSph0xdVKjn8uUZDskqCsW8uKXpR/zftUumarllX7YhHRp0UB+VA8f7PU5bQIDM73Q
	 oXANAiOpDBbZ9KFpkTjLleKoDKQlFRJ1yc1bse/N43z4O+w2JIwOShiEl3B63SmNKp
	 BeEoFBCggOl1RXW1U3kiCWiEwhUAAFn7ewj37OOdDjtOHbafiXB2aqeYsDOUMF6FoG
	 HeYZ1Pkjcv24Q1fkpTmzhQzxUCTHFWaYrWnGqKn/idDAdL22qH+lZPETdBnpMVLe2R
	 livAydXcd61Fw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 712B1C4160E; Fri, 18 Apr 2025 16:25:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220016] USB devices plugged into USB hubs on
 6.14.2-300.fc42.x86_64 do not work
Date: Fri, 18 Apr 2025 16:25:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: PCI
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ilpo.jarvinen@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220016-208809-TTNveuhjke@https.bugzilla.kernel.org/>
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

Ilpo J=C3=A4rvinen (ilpo.jarvinen@linux.intel.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |ilpo.jarvinen@linux.intel.c
                   |                            |om

--- Comment #11 from Ilpo J=C3=A4rvinen (ilpo.jarvinen@linux.intel.com) ---
Does also 6.13 fail if pci=3Drealloc is on the kernel command line? It's not
clear to me if PCI resource reallocation got enabled along with the kernel
upgrade, that is, if Fedora packaging e.g. decided to enable
CONFIG_PCI_REALLOC_ENABLE_AUTO in kernel's .config which is orthogonal to
kernel version changes.

Please provide /proc/iomem from both working and non-working configuration.
Preferrably with the otherwise identical kernel version, if you can't get it
from the non-working configuration at all due to lack of keyboard, I'll man=
age
with the log from working only (things can be inferred from dmesg but it's =
very
very tedious process).

Could you also clarify what you meant with this: "This issue also seems to =
be
present in 6.15.0 as well."? Kernel version 6.15 is not released yet, 6.15
cycle is only at -rc2 at this point.

I'll try to look more into this next week.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

