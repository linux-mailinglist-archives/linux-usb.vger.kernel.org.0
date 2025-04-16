Return-Path: <linux-usb+bounces-23164-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CEBAA90DDD
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 23:38:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EA66C7A1D90
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 21:37:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76C98233120;
	Wed, 16 Apr 2025 21:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YPifrSF5"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFDE8197A8A
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 21:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744839490; cv=none; b=iaiXEjdQj6K8qgCLsp7WAqPY2IxdNpF9BD3uxQ8Z/G/ceHWrfQSElSKvUKSCebc2t3kWkmKvTM+ogBrnKgw0jP6WRPQrioSioDLTZmVm8hRyhj5Tj161oqw/7YJkVxaesA8OW6+iwSPI+bCVlcZw992oRcFpScCr9d7RE3pXouk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744839490; c=relaxed/simple;
	bh=ZTzyrJbgG1CjJQCSCR7z9ap0YqzV15oPwse8HVlrDgg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=T+XtqrBVBI0EOCFwdyI5HunLwkRqiUJYruc9q4sXXOjgRrdrCcH/J2osnZrjgyajn3q1zBTUxVWJrk6MkZ6LWEl65DoawggUNkXS/Je1NWkK5Usn0E6DPmNF7m7+h+yQhajsDbI5L+YbpgYp5c+w/C5ijKf80enzSySlCS62F5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YPifrSF5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6AA9EC4CEEC
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 21:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744839489;
	bh=ZTzyrJbgG1CjJQCSCR7z9ap0YqzV15oPwse8HVlrDgg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=YPifrSF5MPMll22hwKeePs5TzVzJprebtBzO5lvEavwo4d7jWbuEiwscikJsGCVNe
	 46/rskGJ6mmJI94Bz7zAXeywJbM8QHxa+Oz62BEiej+iyhoHED0D8Kbbf655zYSS5/
	 ZhloV6fXAQ8D1ga+3XkJ5pKaCneqeuckSTAeVtiG0cTzGaAJwixp229YXK/qFu0xuW
	 scrtA1AdLGBN8OzdVMnLEXmQLJCS4cAs6XznMI8WtFE4FdJArmv6zpGBHkvUBMKXV9
	 kJOsbtAo3NaxZQ+QO9dQdg/tDebkik+VfRStIObxQWAeAjlRjome0RphdF4pQEGzuu
	 gY5LCTz5IQKyg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5B88FC53BC5; Wed, 16 Apr 2025 21:38:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220016] USB devices plugged into USB hubs on
 6.14.2-300.fc42.x86_64 do not work
Date: Wed, 16 Apr 2025 21:38:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: PCI
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stevenfalco@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220016-208809-KyiSKSDQiV@https.bugzilla.kernel.org/>
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

--- Comment #8 from Steven A. Falco (stevenfalco@gmail.com) ---
I am now able to build a working 6.14 kernel.  The only thing I had to chan=
ge
was to turn off CONFIG_PCI_REALLOC_ENABLE_AUTO.

With CONFIG_PCI_REALLOC_ENABLE_AUTO off, all my USB controllers work.

With CONFIG_PCI_REALLOC_ENABLE_AUTO=3Dy, some of my USB controllers don't
initialize.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

