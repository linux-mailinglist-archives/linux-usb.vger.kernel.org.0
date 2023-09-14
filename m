Return-Path: <linux-usb+bounces-56-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E7AF87A03DE
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 14:30:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DFEC41C2087C
	for <lists+linux-usb@lfdr.de>; Thu, 14 Sep 2023 12:30:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0710922EEF;
	Thu, 14 Sep 2023 12:30:09 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8703C21A14
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 12:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id F28C1C43391
	for <linux-usb@vger.kernel.org>; Thu, 14 Sep 2023 12:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694694607;
	bh=4kz4uua3nOB/mOm9S1/UjE9P7n3pRWfQHf5/RFj60yM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=iQUSFTqWU7y3OO+HezkLqRx2yms3fM5aCvd0bJu/MfVqE5xj5NiYJLWI/24UpMnz0
	 6fOfXFPnEdRgv1VLUOX+7uFEZ68TLcl009GWPgZA2z0stGHervcIPzB7zC776HGnt/
	 Zck20ECONtjMscfh+HKnMWrL1KhwysSyHybJrb4P1uFeb0PjQuzgm28n8zctR0K2Ya
	 bUeIYwZFCBqqY363sYNmKqT24xqCuZhQdw7qEyIcbaArNgpw8YYH9DTJteLetZY6Un
	 SSatNGDOt044rU7JIbh5yrWKw5Xz2YVo89DICsacRti/3y4il3NDvEWrvyUppMxLFU
	 vjxjSiKwvTgyg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E4030C53BCD; Thu, 14 Sep 2023 12:30:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 216728] Thunderbolt USB Controller died after resume on Intel
 CometLake platform
Date: Thu, 14 Sep 2023 12:30:06 +0000
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
Message-ID: <bug-216728-208809-7a2SPLnuNg@https.bugzilla.kernel.org/>
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

--- Comment #38 from Mark Blakeney (mark.blakeney@bullet-systems.net) ---
I'll add to my comment above that since 6.5 the delay I mention of 2.5 mins=
 is
consistently now about 60 to 70 secs instead. However, after that time the
laptop display returns but I find that some of my dock connected devices
(displays, keyboard, and mouse) may not all recover. I have to re-plug the =
dock
to kick them back into life.

To reiterate, all this worked fine on kernel 6.3.9 and earlier. Broke from
6.4.1 and still broken on current 6.5.3. This is all definitely related to =
the
changes and issues discussed over this series of emails:
https://www.spinics.net/lists/linux-pci/msg142902.html but there they seem =
to
conclude it being a Lenovo issue whereas Matt L and I are seeing this 6.4/6=
.5
issue on Dell laptop + Dell dock so it is not Lenovo specific.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

