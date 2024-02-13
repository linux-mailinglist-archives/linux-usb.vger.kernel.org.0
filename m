Return-Path: <linux-usb+bounces-6370-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 860D28538E3
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 18:47:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B8C5A1C2367F
	for <lists+linux-usb@lfdr.de>; Tue, 13 Feb 2024 17:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B750C604A6;
	Tue, 13 Feb 2024 17:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SK5Q9yPD"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F82E60240
	for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 17:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707846393; cv=none; b=BKgzVVmo5izYscY6aEZxQRGKn5VSHVJGm9WgHCZntmt9BElV50eKYBHT7+Jp+QD8rmZ30V3tQJkzxTwh+ohQlSEN/tQ1pt7wtx3FFtOLTE08ZUmcMLlefDxLyifJq47oV8YEHh1WGwPaQZQGTlVnwAxJ03zWSKc8Sud8mn3gxpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707846393; c=relaxed/simple;
	bh=5cknqfsj+ssNw7a20T+9Y/P3H6rlTrMaoXgPp5VJY1o=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UO5ybJepTYoaNPhKWy3453MYFDeCZqxfnThmZNQs7sVNpuQDFKT1RPDM/Y1NgoeI4Xm3kpO3C+0UY64d0xGWLYW6N3fByspXptWWyYrrzbbSh4QcufUjDXhEZFliBtTkCM1DtdG6A48kHyIsnxDk+dafEfR23zIa1oOGcqo59OM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SK5Q9yPD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B0380C433A6
	for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 17:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707846392;
	bh=5cknqfsj+ssNw7a20T+9Y/P3H6rlTrMaoXgPp5VJY1o=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=SK5Q9yPDsmj/T2RGSZv0TyFG7ULklWdBT0CxhDhJz07ofK6u4lLnkmDad6DjOzMd8
	 PYfyXsWKnCIHsdyx0gsOEGan9SZN88WpSAt8qZbvviWcY3Hbp4Zwi+QW6IneOIiSBL
	 qnHTP1mAcy4djw37zK+1gUfHZ0esfGWEFivZS2UNL1uGzuBSztp5K//VWJe6NPPXwq
	 w27Kl7VBIHG3GxEXOhe4xGdX0VNpENjYciCgQvnWQOGWVaL49ZMcN1wV6rN/SGS6Yn
	 g8vygiKTNox/xA+k+u/JNoDP+rVPhj45mdL1Sv1lkEtP0lWQyVX+uX5UeDd6/DMdbZ
	 AO7LnDdUuIlgA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A1AC7C53BD0; Tue, 13 Feb 2024 17:46:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218490] Linux warning `usb: port power management may be
 unreliable` on Dell PowerEdge T440
Date: Tue, 13 Feb 2024 17:46:32 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218490-208809-nZWsezB1ls@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218490-208809@https.bugzilla.kernel.org/>
References: <bug-218490-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218490

--- Comment #5 from Artem S. Tashkinov (aros@gmx.com) ---
*** Bug 218488 has been marked as a duplicate of this bug. ***

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

