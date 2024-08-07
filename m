Return-Path: <linux-usb+bounces-13191-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D48694A7B1
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2024 14:29:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9B5031C21CA3
	for <lists+linux-usb@lfdr.de>; Wed,  7 Aug 2024 12:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 204241E4F1C;
	Wed,  7 Aug 2024 12:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="p9K8iHeF"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98FB41E2101
	for <linux-usb@vger.kernel.org>; Wed,  7 Aug 2024 12:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723033742; cv=none; b=JBH1RiU6M1PR5f28HtfSA0valku7ayyUZC+78wMKKsHnszIS9JBlM2gF3tb78nhMP41KNaslUH2bL9KeBd95P/SPtKq6amRwnpMQyL8wOVrEpDIwF/2xrpp8Vb/u2b+IJazr/YK7k6d3F26v4CtY4ykiGB3DCWkvFJOeO/CWFQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723033742; c=relaxed/simple;
	bh=3kXrLnMJ+JmkHv7qikzyFQL11ZZXdf16hOkgvoYz3rE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mQo8I/UHTOSVO88lUxZci+1VU22KH1Wag9IbosCG07Ndbqs5dtoKc2tsI/5BrvmNHjHTZJdRYxsn4n4X2o2OtFgYaUoL3xR0oIZoykbeHfCp7wsogaYAjdj9Y80V/2ovRcbSxRfhgqSAvC9beiqnamo0BeG+BzOP+NKANnqQGWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=p9K8iHeF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C07AC32782
	for <linux-usb@vger.kernel.org>; Wed,  7 Aug 2024 12:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723033742;
	bh=3kXrLnMJ+JmkHv7qikzyFQL11ZZXdf16hOkgvoYz3rE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=p9K8iHeFRSvNfvhSqu6Q+fpiLlJoCVp24aQhsuLgU1UHyJfS2CUsZUsxo+ba2pJ7u
	 UuWu1CCcq6/ODzI1KMUbhO4MDdsAks1YlwfClN3ysXU+0n6y/e1vcZORxJSSfgN9Sy
	 F7ucJ2chYZOwhiYEcatgI+x/3vhlv89ZwlGGggDwCC/tqO3zWUeRhFGwx4IB7hdtRX
	 RMc0zrKFusGlrEs1HcItB49yM0bBYQCYWY2x1SdpKLh3l0CLnUP7JRr9vbQaUJsvwN
	 oSKNgfFU4eaDIT7naAqJ193uSpgQM3//8vuIIZw3PakStLZ3M25pnywTUtY1qpAtA+
	 hAxkNmsnZaBdg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5EDC5C53B73; Wed,  7 Aug 2024 12:29:02 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Wed, 07 Aug 2024 12:29:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: com+bugzilla-kernel@c-henry.fr
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219111-208809-XXG4lHDZWH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219111-208809@https.bugzilla.kernel.org/>
References: <bug-219111-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219111

--- Comment #33 from CH (com+bugzilla-kernel@c-henry.fr) ---
Here it is. I hope it help. Otherwise I guess I'll have to ship you the dev=
ice.
Is it doable?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

