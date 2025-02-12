Return-Path: <linux-usb+bounces-20551-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B02EBA32EAA
	for <lists+linux-usb@lfdr.de>; Wed, 12 Feb 2025 19:27:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3BC6D1885EEB
	for <lists+linux-usb@lfdr.de>; Wed, 12 Feb 2025 18:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 36C48260A33;
	Wed, 12 Feb 2025 18:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U6GYOIOb"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B267025EFA6
	for <linux-usb@vger.kernel.org>; Wed, 12 Feb 2025 18:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739384865; cv=none; b=dQRX+DK0cG/08ADEt+3kOT4NxS51Kx5qV82bp0aA+e1qz1eMqyjwO9lu9KnYpAVWot0ODsP+jJpOqnFQI3+zVJvtNJRRsn+dBo1HwyyoEImQBZys9gBh+nqLAuEPmmLHmqGKp9igHwXvJQzfjl/9kly1jIcWg/qcNH9r30FPOqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739384865; c=relaxed/simple;
	bh=dQ7RdQBxjNt2uOa+Uo1+Lyy4fhFcmfB5seaX2tY/t0A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NPdDiP3JBztblsPfMGYVArkO6pPCCY3A2M+bBHiY2vu9eyXgII2WZbmyYN5JTa246LC0yuAgDFGKl/otXIpYqWS/W3ScmLmWuJteblsAeuwMFH9KbtVoCK8yRvW2T2MZCWhiKwlj7ZIVeWu5uWkNk+GizB0PRLDKHtr/6biI18c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U6GYOIOb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 309E8C4CEE5
	for <linux-usb@vger.kernel.org>; Wed, 12 Feb 2025 18:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739384865;
	bh=dQ7RdQBxjNt2uOa+Uo1+Lyy4fhFcmfB5seaX2tY/t0A=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=U6GYOIObCYJKKedWOj+FzcPrI9w+QReyMFnGsCti5FRYWo+yiVVGwEvg1LP8/yeLw
	 vAM58FwEIDxj7RPpTcdkPoyFXyglwpKM/GIe7h7IqnuxAXmlwJJNVY0Juj+JXYlYpn
	 nkeX4vw63Zab3miLuNOkXtgPLENNaM417QkWOhSwXs/5UfcNWzvvJwmQG5gJhi06Dx
	 Z1Z1Rr0+TP+U+P+a4KP8w5/MUhc6zABBMlBriGlFxxly6Jtkz3swFY3fMRYH4bOkeP
	 b4/xm8AEvHUBdzfgc2wM8sQQIjcF1PNlk0vPR+xPRINzlRf35pktW3vp21arY4eIia
	 oheobvRmNAavQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 15944C3279F; Wed, 12 Feb 2025 18:27:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219773] External USB disk drive and SSD corruption while
 connected to USB 3 ports.
Date: Wed, 12 Feb 2025 18:27:44 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: fredbezies@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219773-208809-iyjP1XqgGj@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219773-208809@https.bugzilla.kernel.org/>
References: <bug-219773-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219773

--- Comment #2 from Frederic Bezies (fredbezies@gmail.com) ---
I also launch both:

sudo fdisk -l /dev/sdb
sudo smartctl -x /dev/sdb

First command:

sudo fdisk -l /dev/sdb
Disk /dev/sdb: 465,76 GiB, 500107862016 bytes, 976773168 sectors
Disk model: MobileDataStar=20=20
Units: sectors of 1 * 512 =3D 512 bytes
Sector size (logical/physical): 512 bytes / 512 bytes
I/O size (minimum/optimal): 512 bytes / 512 bytes
Disklabel type: gpt
Disk identifier: 0D820E40-5858-9090-8081-828310111213

Device     Start       End   Sectors   Size Type
/dev/sdb1   2048 976773119 976771072 465,8G Microsoft basic data

Second command? See attached file.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

