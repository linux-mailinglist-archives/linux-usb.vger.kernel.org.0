Return-Path: <linux-usb+bounces-23611-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FD63AA65BA
	for <lists+linux-usb@lfdr.de>; Thu,  1 May 2025 23:43:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B66CF4A7D18
	for <lists+linux-usb@lfdr.de>; Thu,  1 May 2025 21:43:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A925B251790;
	Thu,  1 May 2025 21:43:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g8ItWmvP"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26F7E20D4F2
	for <linux-usb@vger.kernel.org>; Thu,  1 May 2025 21:43:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746135829; cv=none; b=hgVfPoY85JJoK9RnPPx716b3GUqPGtkA+AWIDIZUX/wFya8/yai2EYX10V8i3yS/kN2mrJ5IRo+hLLXowrCt5x3y4rxj/mZLfHA+PdvmiDvd4JRBHscZkfbgVCP5naUrA24qm0Lib6cxdq+X8Anz12plzyGLkdCa4yC2kiob24k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746135829; c=relaxed/simple;
	bh=fsIFtOS1JDlMLbA2gyQscqcHLBch+UEE0piGzb8RvkQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Dbl/SRSnYcMx9NzdBuKxwJ36tfmH5Oj3w37oykg0LrPQUVWJKVqhT6CqVDiAiiLK/3qVn3tppjCysqSHkgI23gDNIjcLJHEjJfpmTVAhaaopF7hC42zL4DAmA1A9Jro4C8PK3Dgpul54bNd5V89LT7R9Iptpkh0uKZV14yFeLXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g8ItWmvP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A13EFC4CEE3
	for <linux-usb@vger.kernel.org>; Thu,  1 May 2025 21:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746135828;
	bh=fsIFtOS1JDlMLbA2gyQscqcHLBch+UEE0piGzb8RvkQ=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=g8ItWmvPdQ8uCs+eGVJpnMhzH5jEJVv9YKAYFLeIVJ1nwuDUHM8bBksiz56J9PjPX
	 xALdL8B9ft/Ia0h5JVqCxZf923Hw7mV2EV3oBqdVpbAQLt/Sqq5+aZbHoG7rPkltI6
	 yS8857JeKAHKe6Eb/xcbzKgzpVVxZp3MiksHJk/WAf9SBylq+u3v5QcmWYXGC1cZXZ
	 IKkGgdamrufhmlr1kY2gqsPqifwWJPOgADL+nFvuNRJLi42yeJfASRAByPEEAxgxaQ
	 E/8kgCgVvH6Gu2KoGQ/1tUkqlOEKNl9ViaSin0FURHBy3JD9A97UJALFaM3ym1DXSf
	 ArDmY33XD/Yhg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 97D40C41612; Thu,  1 May 2025 21:43:48 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Thu, 01 May 2025 21:43:48 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: cwunder@gnome.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220069-208809-T9f8iXmTMt@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220069-208809@https.bugzilla.kernel.org/>
References: <bug-220069-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220069

--- Comment #16 from Claudio Wunder (cwunder@gnome.org) ---
(note that I restarted my PC prior to this due to an unrelated matter)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

