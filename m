Return-Path: <linux-usb+bounces-21109-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F94BA46EBB
	for <lists+linux-usb@lfdr.de>; Wed, 26 Feb 2025 23:47:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 423881889DE6
	for <lists+linux-usb@lfdr.de>; Wed, 26 Feb 2025 22:48:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82EF025E822;
	Wed, 26 Feb 2025 22:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="exOgT+0J"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0863A25E80B
	for <linux-usb@vger.kernel.org>; Wed, 26 Feb 2025 22:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740610073; cv=none; b=dZpefP5slqyN1RyX6OSSCID++WcO8pTZdKnt9kYWAy3GMEurMLhQVBVkkr33G3FmgNoNLPWGjCEC5UOXXov90ha5HHoZ0x08VytBHel5oBCI2JbJgdSY3yVYLb7Ktj82sfX85b6wVoZNuO1gx0BW8wSjLGqkayNDy4EeYWML0Ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740610073; c=relaxed/simple;
	bh=j/Vhu0xzHJktRlY16pZffaSoOEKANOEifQ9DmAr1TBQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mYgCzQI6iqkq+p94OJ3TLAS7cJDcLO0/O3MsWPnlTosBtzKuN4I7ieCDNzWrk3hRIvZ/wCkfNmAk08gexly+m2V+Zq09fs0aSSO9lFSVCXpuSejffGfStaNVmaJF3gFCo86saAQjuLZTRIBEaOrnQydtFgt4Uy5fkdxzggsxopA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=exOgT+0J; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7D085C4CED6
	for <linux-usb@vger.kernel.org>; Wed, 26 Feb 2025 22:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740610072;
	bh=j/Vhu0xzHJktRlY16pZffaSoOEKANOEifQ9DmAr1TBQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=exOgT+0JIb4dGNIpEnPwyJlYKElEYentDb00+HANrFq1+LskYc/jKXpLtVeNXl6Kf
	 /TUSqXnp3Ldm1BQ4/URxX9p3Bo4SgskI47JOKHJFNoYSWgVzfgsnTjnkey4DLRoF77
	 cGNNBwnoiGspX7Mo//F01+uojqAuivxDkcNjPmkTiX+BorH2pLkw6y7sPE8Luopwk5
	 hAsDIldDyOpv2TP7s1+FyU+rMvOMHvnqZY7rD2tMT2hnZ49ODXZbaolaU5AFWIr2YO
	 aXgMpPRq8TY9b2Jbeqp9/9il7ze/QuUCGyE4r9gD0pt+L85pNM2j2HGrpB6owegkyw
	 brCHbztq9eynQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 67849C3279F; Wed, 26 Feb 2025 22:47:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219824] [6.13 regression] USB controller just died
Date: Wed, 26 Feb 2025 22:47:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219824-208809-KDOBszltZA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219824-208809@https.bugzilla.kernel.org/>
References: <bug-219824-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219824

--- Comment #3 from Artem S. Tashkinov (aros@gmx.com) ---
The SUSE issue is seemingly unrelated, please dismiss.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

