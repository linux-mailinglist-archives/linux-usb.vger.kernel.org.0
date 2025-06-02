Return-Path: <linux-usb+bounces-24419-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DF8FACAD03
	for <lists+linux-usb@lfdr.de>; Mon,  2 Jun 2025 13:10:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CFD0E189DFCA
	for <lists+linux-usb@lfdr.de>; Mon,  2 Jun 2025 11:11:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 681D0205AD7;
	Mon,  2 Jun 2025 11:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KrtUE/uQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4BA114F70
	for <linux-usb@vger.kernel.org>; Mon,  2 Jun 2025 11:10:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748862653; cv=none; b=bNOiysM5vhy1h6zt4s/EdsC5g7U5OqEjd16vG0OM6HvPllpkiBB8wxYz/mA/WjLUegcymGjAOsNo5MpjMCgKInBBxR+0wIjGXgVTycz01UNHu+86HFfRTFHVcbToWrqN00Eq/oj8tBZLbyee18PAdDJmri2ivX4HcDuDx+/uIIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748862653; c=relaxed/simple;
	bh=f8yv4fzomNDxXAbSOcfu9uko7IEFCJHrT44kE95HkLQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=R5HUYP1/aqxgx92oCNiMADNJpLMYHbB3oI7miRwcrz4E/wWXqIigpduNxPNYouIWJvp3wU5BaUa1jwNZHu9NxWd2ZZFvvrKmHvOBRhKLK4t1yCve09kixQHWc9dPfkxwgFUu4+zLlqUJ61tABXWj8pg/u0dFKYPEytmvKTKC3MQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KrtUE/uQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 60817C4CEED
	for <linux-usb@vger.kernel.org>; Mon,  2 Jun 2025 11:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748862653;
	bh=f8yv4fzomNDxXAbSOcfu9uko7IEFCJHrT44kE95HkLQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KrtUE/uQfgeMrEHm4un/Izd8AQ5WZjadWQtv6CUyo2DvamA0IsNmT66SsLXqDazRX
	 pnyRLisQ3M5rmjV192JrWjCyqW3T6AUhUjHgTtz7T3GcIM8OUds3o560cNtgD+kfQK
	 jG2p0vY+5bmctwnCImofnQxlyz9LlZex7C+aEiQDQIGetxznroR2Ji09kF8XKExgm7
	 rB67FjmE7ofqa+ryzkqVZ/e9b1ST1l0rPYkkI8peFvvo4cZlyNeSVXObZqN/5HNIHP
	 Ac4E8G8FKdblrGMwFci7bu4OWRcH/si/GVyerJ87fR/fhuROidKLK32dHWaZLsetgp
	 AyjySZGh4qdQA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 577ECC41613; Mon,  2 Jun 2025 11:10:53 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: =?UTF-8?B?W0J1ZyAyMjAxODFdIFVzZXJzIGFjcm9zcyBkaXN0cmlidXRpb25z?=
 =?UTF-8?B?IHNlZSDigJxjb25maWcgZmFpbGVkLCBodWIgZG9lc27igJl0IGhhdmUgYW55?=
 =?UTF-8?B?IHBvcnRzISAoZXJyIC0xOSnigJ0gZnJvbSB4aGNpX2hjZCBhdCBib290Lg==?=
Date: Mon, 02 Jun 2025 11:10:53 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: low
X-Bugzilla-Who: 6svcyk03@rokejulianlockhart.addy.io
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220181-208809-XKbWuzg6MN@https.bugzilla.kernel.org/>
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

--- Comment #3 from Mr. Beedell, Roke Julian Lockhart (RJLB) (6svcyk03@roke=
julianlockhart.addy.io) ---
(In reply to Mathias Nyman from comment #2)

> Or does this xHC host have 0 ports on usb2 roothub as well?

I dare say that I'm operating at the boundaries of my lay man's knowledge a=
s it
is. How do you suggest that I ascertain this?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

