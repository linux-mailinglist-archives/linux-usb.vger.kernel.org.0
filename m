Return-Path: <linux-usb+bounces-12231-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DBFE932182
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jul 2024 09:53:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BDF82281DD2
	for <lists+linux-usb@lfdr.de>; Tue, 16 Jul 2024 07:53:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72C973BBC2;
	Tue, 16 Jul 2024 07:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HEBrtgmu"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3C5224EF
	for <linux-usb@vger.kernel.org>; Tue, 16 Jul 2024 07:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721116397; cv=none; b=a3S5NuaLShtmysplV9SuZftUfgTPILOZ2cATd5Y1Ba2O4seh+1elraSo1upk226aX42RQvaZ/FV0Iczu35WKBc6DHgwZnUI1L2YqUJ3Udj6t0I2/vVhitTtw8l47DCbOcN6u6Y+sB00xtbRJhR8ufPvugVQPWBMhLQX+2kBIxyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721116397; c=relaxed/simple;
	bh=1tZMgte4TTbI/AJUlt9usNnndyTWUzsANhvKoCCRQU4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nabyhRGV1B7tNIQSsKiAHYXcTHYaweAu6K37tLJ0nRANKND/JNvWAml1M/d/XBuaEBLjOcrQtVlfXChMeM2aoJ4mjW8QpS/WkAD9XrwYsrk5nkAcbTsGNojdlIq6AfNm+Qun3MPgG9sJqKncxpZbFJ5v05g5zmyPUhrgFh+TURw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HEBrtgmu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7A072C116B1
	for <linux-usb@vger.kernel.org>; Tue, 16 Jul 2024 07:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721116396;
	bh=1tZMgte4TTbI/AJUlt9usNnndyTWUzsANhvKoCCRQU4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HEBrtgmuK0CDwkdbOwUweRx6pOek8n5oDUmweF4Oo1uXHx2PpqXk4nIafOsPVfM+X
	 S9DbSt79Wz/scelp4fjOeqqwwU0jO39DuOqSLnaWkRtOVZUcFNriGjmbyNQsYj6Ibw
	 LofR/1H4qfBHNHonBn2CmIdqZ2lw6BhwLkqXBob0ePt36hjMjCiDR5mscT0kw7OG02
	 hiN3l1zW4cMH2sTd8nrucWSGdCGcrRYqayeIfz0ugSuXMKqMgMccc/WCXgCHBmNxic
	 eHOIylr3ZoRSSWlfAVe/MP6gog8OAhrC/d3dLSH9WZY3UsmE7txEf/g9Mrbk0EVt33
	 +3DXp92UPffKg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 642C1C433E5; Tue, 16 Jul 2024 07:53:16 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219039] kernel 6.6.39 freezes with QNAP TL-D800C usb case
Date: Tue, 16 Jul 2024 07:53:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aros@gmx.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-219039-208809-zYiDDkJx43@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219039-208809@https.bugzilla.kernel.org/>
References: <bug-219039-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219039

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

