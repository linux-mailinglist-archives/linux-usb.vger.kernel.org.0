Return-Path: <linux-usb+bounces-179-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C5D7A2AE4
	for <lists+linux-usb@lfdr.de>; Sat, 16 Sep 2023 01:12:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B66BE2821EA
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 23:12:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84FD81BDCD;
	Fri, 15 Sep 2023 23:12:34 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577B930CFC
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 23:12:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DC4F9C433D9
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 23:12:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694819553;
	bh=KCbe8Pv77fAvIyKxs3NwayKmODORWQbHPfmZtmEUiHE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=RKgWidFdzRYNN32p7/PZ9bN8+23+38flGwiOtONdaf6cD01e4jMKmVuOYnMdZXb8T
	 4bOY7tLRp8dKL1POGls8IS8KE+kVJfJ9zL/BuZw09ZWB51eMR/3loHfKHaWlidGIRd
	 K48l+bvWDjgrtFZ7smVpurOZYtKvZkB0BAZVWS2E7lTt4DD4HfWPWOxkBMCEFXnpSP
	 AkJE2eMZUTicCdc5Om4ULB7U2jRxU85OLD3DBXEEz3K/6NBdx0qBkqo/NwBxI1DWO/
	 ddgjIe+XWRifuPzUqiNxypaJCNCLbKj4v+C5DPQbrFGwlBDbLZvdmrGUQ9qvKMrA9c
	 MBODTEhEKVa/w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id CC2BAC53BC6; Fri, 15 Sep 2023 23:12:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 216728] Thunderbolt USB Controller died after resume on Intel
 CometLake platform
Date: Fri, 15 Sep 2023 23:12:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mark.blakeney@bullet-systems.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216728-208809-pAXH2kYMEj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216728-208809@https.bugzilla.kernel.org/>
References: <bug-216728-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216728

--- Comment #44 from Mark Blakeney (mark.blakeney@bullet-systems.net) ---
OK, have raised bug #217915. Will address your comments above over there.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

