Return-Path: <linux-usb+bounces-28597-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A075FB99CE2
	for <lists+linux-usb@lfdr.de>; Wed, 24 Sep 2025 14:19:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5BDDF4A3E46
	for <lists+linux-usb@lfdr.de>; Wed, 24 Sep 2025 12:19:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D3E5E4C6C;
	Wed, 24 Sep 2025 12:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NvszbELc"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 549BB2FD1C5
	for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 12:19:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758716380; cv=none; b=ltfwYm8y4R5M0SOZ/xbgZWZabGI/axBZ+h1ehIs2IS6I2rKtoBHE/5M6JB/t6ulsU1GxSk1cdGDyl5pK3NJYSno6ZN3w7UYRe5WBkip157D9MqWrbM8IE0CaPmV2mLkX8KWcurAWYkvAMvObOCwWEFvx8Z0m4ncBpgPNb/hAAk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758716380; c=relaxed/simple;
	bh=DCckZ+DiSCFQjACu+kb3ya06Ju0Y47x/+s4Dq5u5LCo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e/IXenloTWcnOzWaDYPrH242JlnX5UsKLSsax7HPTGGRLp9/fWwJ3qooVqReN8ZAyjQbXovZdTOzOQY3tbG0/n0MavhdPR8rC4ZFQFjT0rIoQsAQGqkEviqslzwa1VvBZ001nVtSnAxJ7xsytFQpqjxajNckizf6fz0jHavb8+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NvszbELc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DFAAAC116B1
	for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 12:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758716379;
	bh=DCckZ+DiSCFQjACu+kb3ya06Ju0Y47x/+s4Dq5u5LCo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=NvszbELcMJFvJq6RXOaSY4Ai8qkJf9cT2nLZWmjNuCwY8FHB/z26jGtrIbxTd0g4+
	 yOt5Pm9ay2hbJRMShWNeHeh9jkv+xmgOgx1rhAtsnwheu8RqelYuBOvwckQG8M/pHZ
	 7FvMpgDHqnPdgACKaFnVT+N96zZRZ3IEJq2BceFiGTQUWxawBfci1olIJE27EjpeVr
	 DuReMt/+HtbjxX7zwchIJe+5OKGrhgw0lMCAC/daopS/C54NAkLJFKQNKtv4Xi2dFZ
	 OOMBwbAmjwl1HqhEiuqWU0Pa0Foruv/j0uj/BmWx9qxX+aTo/nKaPVAddJj5NetNOL
	 2+vEPXzvmDNNQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D8043C3279F; Wed, 24 Sep 2025 12:19:39 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjAxODFdIFVzZXJzIGFjcm9zcyBkaXN0cmlidXRpb25z?=
 =?UTF-8?B?IHNlZSDigJxjb25maWcgZmFpbGVkLCBodWIgZG9lc27igJl0IGhhdmUgYW55?=
 =?UTF-8?B?IHBvcnRzISAoZXJyIC0xOSnigJ0gZnJvbSB4aGNpX2hjZCBhdCBib290Lg==?=
Date: Wed, 24 Sep 2025 12:19:39 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: 6svcyk03@rokejulianlockhart.addy.io
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220181-208809-bC5o5GgSRA@https.bugzilla.kernel.org/>
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

--- Comment #18 from Mr. Beedell, Roke Julian Lockhart (RJLB) (6svcyk03@rok=
ejulianlockhart.addy.io) ---
(In reply to Simorgh P. from comment #17)

*Might* be better, if you presume you'll need somewhat in-depth discussion
(which would be reasonable), to post at https://forums.opensuse.org/new-top=
ic,
instead, or in addition to this, citing your comment here. (You can tag
@RokeJulianLockhart if desired.)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

