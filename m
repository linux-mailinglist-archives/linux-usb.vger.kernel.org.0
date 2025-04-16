Return-Path: <linux-usb+bounces-23110-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2F99A8B1E3
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 09:21:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6461C3B27E9
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 07:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7611A224B09;
	Wed, 16 Apr 2025 07:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h1ERq18K"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEE5E21D594
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 07:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744788080; cv=none; b=PvLYmqfs6j8x/S+ixuVM97RRtKv4kyVcK8cLhj1whpdRFC3kLhIz98oQAxx6cQnMxfSLNr3dsE4Od0YVj4uo/tzveXSXtZA6zXtD228uYJRwUBHvpgWyJ/QB8JBa5/m/cEKtSMDh/uUbRMfVgt4pZtkh+ekbGBvYwAtEbwkJMcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744788080; c=relaxed/simple;
	bh=stZjV/ZSOAfxKUoj9dDb5x72loKh2SPHOffc7kQRbXY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BrpLLeiFg3q2QCQEoVPm4tzs1OpqnyAaXlX+RqKYbyPzyTkhP8nRB3kv4r+pBdScy4IyffdBlTnv3ccAIigj0uh1WynBAxk8QjZk0LBTCzjtcALWKDgjV8cMCF5HbErYLGqNYZXXyCXROt1o+LAj5VcpX8uNXRorXp+ijqPx2oM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h1ERq18K; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CE2C3C4CEE9
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 07:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744788079;
	bh=stZjV/ZSOAfxKUoj9dDb5x72loKh2SPHOffc7kQRbXY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=h1ERq18Ki/HkysIa0iHnQm1wI7A54glinWYbPdal0hb8NUSCfFxeDXzM391mTUOYh
	 YqKOTpSL2afSO3PcZzawDI6WesoHPgA5YQ9Mikxa2483OCdZkLZ66aZB3OWGapAs8e
	 Vp1iw7hdrwMTcMuJ5a6giDxHBBPzFu4ZdZpPh3RjDICOngEKzOhq7fqW3mPTY9/1VB
	 ZgGArvfvyTTGKCROE2vtMaxnWJVFDSheAZBI0KPIAS1aMponMy+Mr9Poz397QRAS4l
	 vyZxZdumLgIMYT4neYasAPGFQP50fBOsSA49xJoF0vA1WvKVvVaaf1q0jOhWxc3WIw
	 eqmO2Enzl8VGw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C17B2C4160E; Wed, 16 Apr 2025 07:21:19 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220016] USB devices plugged into USB hubs on
 6.14.2-300.fc42.x86_64 do not work
Date: Wed, 16 Apr 2025 07:21:19 +0000
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
X-Bugzilla-Changed-Fields: cf_kernel_version cf_regression
Message-ID: <bug-220016-208809-wM1oOWjVRy@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220016-208809@https.bugzilla.kernel.org/>
References: <bug-220016-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220016

Artem S. Tashkinov (aros@gmx.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
     Kernel Version|                            |6.14.2
         Regression|No                          |Yes

--- Comment #2 from Artem S. Tashkinov (aros@gmx.com) ---
Would be great if you could bisect:

https://docs.kernel.org/admin-guide/bug-bisect.html

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

