Return-Path: <linux-usb+bounces-15917-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AF5996762
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 12:34:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9877F2846B1
	for <lists+linux-usb@lfdr.de>; Wed,  9 Oct 2024 10:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60A4C190051;
	Wed,  9 Oct 2024 10:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GQOgEZ0w"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB6718FDD0
	for <linux-usb@vger.kernel.org>; Wed,  9 Oct 2024 10:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728470079; cv=none; b=leHezTLbNAnzabAykwugw1wREYQs6T3scfOL2usKoPvZIP4DimUcuFiXON1FuRqwwPyO44iWqR8boweBObVWxHJPs1pEfX9nQKlSv064LO33D2OKTxGeACivmCN3qKPOeFb/OU5/4ywWF+PdR2ApG2OTBezepq159B1tKE0/5BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728470079; c=relaxed/simple;
	bh=1HPNFCorktDlb8Brrz5JbS4JnSGgnmmwEYLGwN8BpjE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=CcZWWc/6x9e5hiW64ids+tlyaAdNzCi9OuGXBgFgH1UqYQE3/m2Fr8/zhrRv8v1q07Dh32j1xeq1umrKsHRtXm1+DDP5+PCYOV47vNzk2U3wztfkj/1R1t4wJGsugNu3dDtG6B8Z8zitiataj5mGvuuqM6eOMIHVbXGcC8zulM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GQOgEZ0w; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61EF2C4CECE
	for <linux-usb@vger.kernel.org>; Wed,  9 Oct 2024 10:34:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728470078;
	bh=1HPNFCorktDlb8Brrz5JbS4JnSGgnmmwEYLGwN8BpjE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GQOgEZ0wj+cjSRReBYvGKP6aLMDedob7fXmkhQa8E0qrzhVsKxOumhQbWYWnxZ2ZO
	 +gtymIsMsiCCsoOsSath7hqJEHtEsx/EveTOonKUE8qoE94mMLp90AmlKy62LlZ028
	 f1EKeM83TusK/HuhO9tY1s3rp17Jb42jZQD9RaPCj5Ep6RI4EyGhBCzoD9eBI2iI+c
	 q6ms4RWA+oKNa6Bbh5tDHFlKm2DjnVppE6VP33gZh8Q2CdcwVGOBiVUXed8bWBc+kB
	 CBtE6Uy1e2RB0v0zRINkJWnIq7NFxaVB1F/tvenlybVleUN0qdlaGKVkEIH3NOjMK1
	 2cLKfAt893qfA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 54C70C53BC7; Wed,  9 Oct 2024 10:34:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219362] USB SATA does not correctly shutdown the SSD upon
 poweroff causing data loss
Date: Wed, 09 Oct 2024 10:34:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: IO/Storage
X-Bugzilla-Component: SCSI
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gregkh@linuxfoundation.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219362-208809-0Wd3ktUJwT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219362-208809@https.bugzilla.kernel.org/>
References: <bug-219362-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219362

--- Comment #11 from gregkh@linuxfoundation.org ---
On Wed, Oct 09, 2024 at 10:08:41AM +0000, bugzilla-daemon@kernel.org wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=3D219362
>=20
> --- Comment #10 from Tomas Mudrunka (harviecz@gmail.com) ---
> Would it be appropriate solution to add new sysrq command to call
> device_shutdown().
> defined in drivers/base/core.c

That is the normal shutdown path (i.e. the syscall), please use that
instead if you wish to have devices shutdown correctly.

sysrq sync and shutdown is for extraordinary situations where the system
is broken and you are attempting to shut it down in a way that is better
than just pulling the power at that point in time.  Don't attempt to
turn it into something else.

thanks,

greg k-h

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

