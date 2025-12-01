Return-Path: <linux-usb+bounces-31056-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id BB08FC9631E
	for <lists+linux-usb@lfdr.de>; Mon, 01 Dec 2025 09:36:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6124A344084
	for <lists+linux-usb@lfdr.de>; Mon,  1 Dec 2025 08:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05F952D0606;
	Mon,  1 Dec 2025 08:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H9uHRNXv"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBE429A312
	for <linux-usb@vger.kernel.org>; Mon,  1 Dec 2025 08:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764578201; cv=none; b=LfmWQ3sfiw2FymYX0lsUBT6P+qnLPBiY1RIoQVfMAtT0OPKHKYA0Gp2b7OyiB7I4Z8WeyYtXB2sF6oT2zxKGtaRwYxNSIAYoO/5MGzryY45HigMJzug6fZKVXGMmfa/wqI9ppT5ti1Pqdcg10m+TUpylnt5aFleIU9ygg81zbNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764578201; c=relaxed/simple;
	bh=AoPsruioT0rUoGRYbALGPyow9PyIumlhHl8JvBgkSxA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=WnZMCiEy048SV3GE+OmVRAEbf+4ogt4Kgu0/j53X9OQehEco2pEtMjMqOkI/02Fs/2CXvH7jSW4fbdmG7VetnsI0OCcOXoVHthHspXD3uSOWazsqobaE+jnRIFqsWbBAZsEaH4GpHwhEOdnfYWArRdqT6aaca8Ci4t3xhVV7cnQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H9uHRNXv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5EE97C19421
	for <linux-usb@vger.kernel.org>; Mon,  1 Dec 2025 08:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764578201;
	bh=AoPsruioT0rUoGRYbALGPyow9PyIumlhHl8JvBgkSxA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=H9uHRNXvkm7IMCqcn1sjZfJAaZxopGp/jbj6hWvNPP2A/uX0R9c4dLAjAvsB5R0cV
	 BCDLl7ObpiJ73cL1qp8q+eWVIfa399qheLSuat02Tz442HQGMpTBsChcIwcnKBDl3g
	 8zDKqvaaNW0u4uQ6/DuuDVa3YBkKxidAdkomzl5KQ0xg+9ewbZ83qrkN8M+1npQVvT
	 T3zRgxxpyhyyKfLXgGymavHMBPoaaQ3FtQYQri9xpodcnULtFv6b8/JDrJ3fUiKFtL
	 Bi+h2kO6MU8xoTtoJc2D5+tVz0ailAqWbYv42RnqICS1XUxIyUUXY9laelgY32izog
	 l4XYSmRIf5wfg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 59C7AC53BBF; Mon,  1 Dec 2025 08:36:41 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220686] REGRESSION: USB devices not recognised when plugged to
 Thunderbolt 4 USB-C ports
Date: Mon, 01 Dec 2025 08:36:41 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: anonq@tutanota.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220686-208809-h2JaN8GVy3@https.bugzilla.kernel.org/>
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

--- Comment #6 from anonq@tutanota.com ---
The latest Fedora Kernel I can get is 6.17.8-200.fc42.x86_64 and the problem
still persists

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

