Return-Path: <linux-usb+bounces-21385-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97E9DA4F9EB
	for <lists+linux-usb@lfdr.de>; Wed,  5 Mar 2025 10:26:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6443188BC27
	for <lists+linux-usb@lfdr.de>; Wed,  5 Mar 2025 09:26:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 960D12045B3;
	Wed,  5 Mar 2025 09:26:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L10ScAJg"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FFF01CD21C
	for <linux-usb@vger.kernel.org>; Wed,  5 Mar 2025 09:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741166794; cv=none; b=Eo7RzaZA9FFn1TTeSmjJWa8k9NpqHq9xbKg2ZT2QQNWIT2DTp5sske/aLceJKbWbrGuuB1kXnhFHKbt4bWNqAW1VLyM0FDXJyRLl/Bs/OoUdM/Wmwurd5CPLsN66lx5F5S3TPs0Ct91/iV67mU1yeZYOUIALryVKDgpI5KtwPMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741166794; c=relaxed/simple;
	bh=sU0fSylaU76cuDe5aWk8AUIpQqbv17sczJZZq37bMU0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z6ichwR+dH6nXWoyzghH0C0xpbZTAIqD12KMd67H1fZ0nLzTHB90YQ32ro7GEodIqYUx7e7HJIgRZB1S4pjweIENglY9Ky2hwit1l+mqPIuS4fCDgk97rXQvrwhKPM/eaW+cgWU06y4bQtcfOGKX7CCNqEKB5Gct5TadpwjwJN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L10ScAJg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 72114C4CEE9
	for <linux-usb@vger.kernel.org>; Wed,  5 Mar 2025 09:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741166793;
	bh=sU0fSylaU76cuDe5aWk8AUIpQqbv17sczJZZq37bMU0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=L10ScAJg3tpS8j9I79ym856rtRuKzSUIGwlnM5LDADv+7O1WIXfveC7DnBsrFmrDR
	 dpmnw4UnRAxyroSve5Tfi0Z+p05/d3MvUlNGtlSyYm8mMlKLztO+jsRn/ZTg7S7oaO
	 RcINnAQsFosvG5yu4QAP0Kb7UiyrvpGXEvzx7nJ/XhJu0SsMtbkMW7VTWIyqnOWOon
	 ks1Von+hHEArg2ZFyGk8ddjSUjxmy6b7ZKBionsWhOgDIVPhkcSrP783k/I9stfg0M
	 HMB5sn5MDBRts6ecC+LoHGm1dzAKd4cVyWrX1TRb8JKWe3xPpR/o8kJgTAaG6evpSP
	 L64c2tXEfWFhw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5D812C41612; Wed,  5 Mar 2025 09:26:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219748] Pluggable UD-4VPD dock appears to continually reset
 with AMD AI 365
Date: Wed, 05 Mar 2025 09:26:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mika.westerberg@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219748-208809-mUnog8ZSSX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219748-208809@https.bugzilla.kernel.org/>
References: <bug-219748-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219748

--- Comment #20 from Mika Westerberg (mika.westerberg@linux.intel.com) ---
(In reply to Sean from comment #18)
> Created attachment 307767 [details]
> dmesg after Scan downstream retimers after the router patch
>=20
> While this topic is related to a Plugable dock, the Thunderbolt
> implementation is having some issues for AMD GPUs where display EDIDs can=
't
> be read (https://gitlab.freedesktop.org/drm/amd/-/issues/3050).  This lat=
est
> patch appears to have  helped that issue, as my TB3 Lenovo dock on a
> Framework 16 with an AMD 7840HS CPU is now able to use its display outputs
> at the correct resolutions.  I'll be testing with addition TB docks I have
> access to in the near future as well.

I suggest opening separate issue for this. I don't see how this patch could
affect GPU reading EDID from monitor. Assuming it is over DisplayPort tunne=
l,
at that point the device router is already enumerated. This patch just spee=
ds
up the enumeration to cope with the Pluggable device internal timeout.

Please attach full dmesg with "thunderbolt.dyndbg=3D+p" in the command line=
 too
to that new issue.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

