Return-Path: <linux-usb+bounces-22294-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D0C7A74937
	for <lists+linux-usb@lfdr.de>; Fri, 28 Mar 2025 12:27:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A8D027A8710
	for <lists+linux-usb@lfdr.de>; Fri, 28 Mar 2025 11:26:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 064C4218AA5;
	Fri, 28 Mar 2025 11:27:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bZrGRESj"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77DBA21ADB4
	for <linux-usb@vger.kernel.org>; Fri, 28 Mar 2025 11:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743161247; cv=none; b=YuuBtlM4oZp5ozVGuB5q1JJXIA3B/IJNxK/2tCPG9SPOwkgYfBItuOAOXWnaU25leNY7KRqcpD9tcwXCHqjql/hpopxDvH/Jx1SCZOoJrpFmy6+qJNEdG+a7udUhWLM5PTxgDNk/ywEtiVBbZqJ87ep3leTfgDjt//C/8+J/Zig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743161247; c=relaxed/simple;
	bh=BYC4dyOv9U8z+C+4DrMxqahNFJG0TadJrYnq7s9z2nA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ELV3IQe2ymjRxf8Gj6uTh8AqtoCWOCcxdWJxPCYQeJcKH/yE55nO/v7W0iUi3SaRtSNdt0G79GRmGf5FOXoUEzF98hYE8912Ly8FTxIbUjHqszuYd5iqIpe0DYmZYhaTD8VSraCK6l6k6/9U/6VjEDpI0ber20F4McWl/PUQCFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bZrGRESj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2D3A1C4CEE4
	for <linux-usb@vger.kernel.org>; Fri, 28 Mar 2025 11:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743161247;
	bh=BYC4dyOv9U8z+C+4DrMxqahNFJG0TadJrYnq7s9z2nA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=bZrGRESjFhOrdN1vNnqM4LsHpMpWbuB2UgL1ZZ3ZXf0hFRL/vFEhlcoeodOXcKLrp
	 LTtOPyDV9OAveDbVnQquShSN68LavVDdPLDNkxPH/eQKWFQkt4Nv6L3Fjy+EmrM48l
	 qHasJZ9awrRWP/qRoTIueVT8XK//oYP8CwaT9CLwSOdR8AmPeJioNSWZ2mjldIbyZ4
	 4zApQIalzpoGJXmc5WgkbMLyj4JOXEWEg12j05CF8afwIsj0GeACwQKwXG2sdHYGeL
	 HG2Rf88oTGFTjFfkLA9yUKWRwkm9dQ5cUhcRvgGLI0w0zS04I13ecZKi14+WDUaH0B
	 UScm1ARWT5Pgw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 21728C41614; Fri, 28 Mar 2025 11:27:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219951] Missing null check in ast_vhub_init_dev
Date: Fri, 28 Mar 2025 11:27:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: greg@kroah.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219951-208809-WxKBuymt3j@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219951-208809@https.bugzilla.kernel.org/>
References: <bug-219951-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219951

--- Comment #1 from Greg Kroah-Hartman (greg@kroah.com) ---
On Fri, Mar 28, 2025 at 11:15:22AM +0000, bugzilla-daemon@kernel.org wrote:
> When devm_kasprintf() fails, it returns a NULL pointer. However, this ret=
urn
> value is not properly checked in the function ast_vhub_init_dev.=20
>=20
> A NULL check should be added after the devm_kasprintf call to prevent
> potential
> NULL pointer dereference error.

Please submit a patch for this if you feel it needs to be fixed up.

thanks,

greg k-h

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

