Return-Path: <linux-usb+bounces-15842-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 555459947C8
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2024 13:53:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72A921C210F4
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2024 11:53:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DB473FB1B;
	Tue,  8 Oct 2024 11:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cy8sPf0S"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7B01D90A9
	for <linux-usb@vger.kernel.org>; Tue,  8 Oct 2024 11:53:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728388410; cv=none; b=qwAkwUph/LzvNOsGZXvHvK1ovkQVqJIfIsefIGksQfe5dexyhDaZmmYuWnwQ9WGCV0pDkvokbg4iamc2Hvc9Ew5fResYyu82CUK+WAKaf1ZWgYfsaWORbBU50eaCUbkSkZm2gm/jJhD+mupG0aRT9WmnSpXqzkEWFdFEL3ogtbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728388410; c=relaxed/simple;
	bh=6baNXUP2R54nFZPgX/A106q1pDGstebcqyiHj/2uNKU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ms9hDBkNLSiTF+aGC+XaBQkGCCPlopaNFxi38a45vESNIRfqHD2HxexlFH+Mtl3WLsVgpSC67Y+5jQaoX7CQYzOHKxyHBOzBR5z5bCOmXg6Z7lyzqSqZMCbsfq+qmJ1HksrIg1KjXBCzgyTkkpzhca3qbh83KMIGimlBCN4+Nhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cy8sPf0S; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8963FC4CECD
	for <linux-usb@vger.kernel.org>; Tue,  8 Oct 2024 11:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728388410;
	bh=6baNXUP2R54nFZPgX/A106q1pDGstebcqyiHj/2uNKU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=cy8sPf0SHjUe9lxeKNwFqY6Sm4clRpdpj1ahM3Vn7M2qLMCLjnJ4K+9RJLJGFbih2
	 TdhUoSnbP8+alMt5EdHUlzPnGV4FADr1XyMVYvMqZY/ovkZwsMLAhxldr91M+URBit
	 xtGGBgQT0+5jGlFdE1Fgie76qz1NTqOopayqzYrUaqXUknfwCtJN98qMkI20AEpwY7
	 WWCv5UGFrA/jocHq80pBVOp0cUhND+s5Cq/7///7xEZj+E1w3V/umLDGygIGmnetdt
	 BCg2Hvd5iyUDthCcj7NgKaZJv6BETB3wAEo/fXb9bAxp6DJNri4Jo7YV+nXniMiEiv
	 5kGWYW5RW84xA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7D297C53BC1; Tue,  8 Oct 2024 11:53:30 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219362] USB SATA does not correctly shutdown the SSD upon
 poweroff causing data loss
Date: Tue, 08 Oct 2024 11:53:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
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
Message-ID: <bug-219362-208809-XKCyncgzW0@https.bugzilla.kernel.org/>
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

--- Comment #1 from gregkh@linuxfoundation.org ---
On Tue, Oct 08, 2024 at 11:43:02AM +0000, bugzilla-daemon@kernel.org wrote:
> I have SATA SSD drive connected via TUSB9261 converter. Eventualy i
> experience
> filesystem inconsistency when i repeatedly shutdown the device like this:
>=20
> echo s > /proc/sysrq-trigger;
> echo u > /proc/sysrq-trigger;
> echo o > /proc/sysrq-trigger;

Don't do that, you will end up with an unstable system.  Please always
shutdown like normal.

> Same problem does not occur when i do this:
>=20
> echo s > /proc/sysrq-trigger;
> echo u > /proc/sysrq-trigger;
> for i in /sys/block/*/device/delete; do echo 1 > "$i"; done;
> echo o > /proc/sysrq-trigger;

Yes, that is because you are shutting down things in the proper order,
like a normal shutdown will do.

sysrq is not for a normal shutdown, again, do not do that and expect to
have data saved properly.

good luck!

greg k-h

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

