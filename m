Return-Path: <linux-usb+bounces-31384-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 16879CB5B89
	for <lists+linux-usb@lfdr.de>; Thu, 11 Dec 2025 13:00:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5B357301FF41
	for <lists+linux-usb@lfdr.de>; Thu, 11 Dec 2025 12:00:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 358F530DD0E;
	Thu, 11 Dec 2025 12:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W8gPlMPI"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9229307AFB
	for <linux-usb@vger.kernel.org>; Thu, 11 Dec 2025 12:00:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765454403; cv=none; b=O1tRG/7lphoxVcc+HoU3omhByDl+/xO1dBmym/TH6YX1451c0VTrjd9gOujh9wvxvpYPIubl3qzv1kqR2nAPiJAH6bXT2yR3av4kbIvuOFSTzVI082iAbFHVm9zpM8yqjc2Y9EbnMvkQN72QEHMiGI3Xw1D9wtB93d2E7M8AKwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765454403; c=relaxed/simple;
	bh=q3jbNFXqjobAZKkTOZGGQ6vBx3eR4kuJP7iGPTdUnvY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QJk2Jb44Sx20qmPwwZpbE3wwYc17B+ljjFWHwBuxghg8mLD3mTzRLdpDabRivDM+1qph9N9v/pxIadrze8IlyxK5yQg3jUdVID3j9JUOtVEn/AriVEsXqNeWZYTfvdjN3ADTWeScVUJiBj/AWLixgUPNy03zjV4fKo5HmJFiy7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W8gPlMPI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 283C2C113D0
	for <linux-usb@vger.kernel.org>; Thu, 11 Dec 2025 12:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765454403;
	bh=q3jbNFXqjobAZKkTOZGGQ6vBx3eR4kuJP7iGPTdUnvY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=W8gPlMPI1kky6myLYrwe/1IKjMlvRY29k077vBbl+gfGiWO0odCxy2F+wWw6e7d/m
	 /W0IsPg9NuNZyBG0eRdURbvdwp9Zt9G2zKtmZzC18FfeXmGjclk1+LjnZexw2rscbv
	 zY1uK/nLxBBGysNvryKnHroF0kjGSnz0VSuXJ6ewcpwJYCFM5r9BMdZ2bDrhQUUt1a
	 u5nSu0qZdYNZDccejkH6ysYNkMYq6m12fyc5ibNpl3Tus8CABuU/qTekpaP/zcXO2k
	 jqVrIfs32bTl8N44uI9wHICfc6PiotziQOQ6SYp5n3BcmUTlwNaddzbtlsSR24zVNn
	 XUWUn9wLgHc9Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 18256C4160E; Thu, 11 Dec 2025 12:00:03 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220686] REGRESSION: USB devices not recognised when plugged to
 Thunderbolt 4 USB-C ports
Date: Thu, 11 Dec 2025 12:00:02 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: anonq@tutanota.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: UNREPRODUCIBLE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-220686-208809-vW5qr9zJOo@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220686-208809@https.bugzilla.kernel.org/>
References: <bug-220686-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220686

anonq@tutanota.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |UNREPRODUCIBLE

--- Comment #8 from anonq@tutanota.com ---
I cannot reproduce the problem anymore in the latest Fedora kernels
* 6.17.9-200.fc42
* 6.17.10-200.fc42

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

