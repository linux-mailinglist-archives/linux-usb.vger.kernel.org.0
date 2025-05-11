Return-Path: <linux-usb+bounces-23843-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3FBAB2840
	for <lists+linux-usb@lfdr.de>; Sun, 11 May 2025 14:49:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 18EAA189790F
	for <lists+linux-usb@lfdr.de>; Sun, 11 May 2025 12:49:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E906256C62;
	Sun, 11 May 2025 12:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sFBvCynN"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D836419F137
	for <linux-usb@vger.kernel.org>; Sun, 11 May 2025 12:49:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746967772; cv=none; b=s9PZ/32gtz05uReeZjScwRdF+U5zY4Vn4sRwmhPtG64eWfsV5u2Te3rVPktpRGjxWBD0LbKibwVfcYCZJIWjrmE8vynH11XhSkp5ETy4HM+sj26WQsOFVLt2fMriTUg5lgklpiJVBhmXWG3MnEKv+cVYQzhIagFHknbcwVxg80I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746967772; c=relaxed/simple;
	bh=RkjlFfGOtUzU701fXitoaMQcr8BnEt32QB6pV8i5RkU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fXnI6S9DpBs2ZKPRoCci4nh1sg7tzZDri1uS+PYxt62gg2uLr2gZM6JSqrncmgcAQKwH9nKdHiXtrWWfnfRuAmjKCD/TTKKePJ0NCzi4iq1OtYXS5m2UsyJ8vjoavOXycNq/QVuKzzgdid02CVzBep+VIVez4WpljcFYgdT4jHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sFBvCynN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4EC71C4CEE4
	for <linux-usb@vger.kernel.org>; Sun, 11 May 2025 12:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746967772;
	bh=RkjlFfGOtUzU701fXitoaMQcr8BnEt32QB6pV8i5RkU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=sFBvCynNo1LuDjPwJ7IETOId2Z5W3IRbEh63yem8r2XT3jHqLybHa+hCdRgZ9qWhD
	 2gc47kKfrJN2Y9Rwzt3i9tpraTh1N+zYBEhV7RWolI5T8D95K88XezEuw0bnQkLMA8
	 0izidLIoYuO9MyWw8hpKHeaLmGK4f9aCklo9d30P4FTeTJVmlNA/YMmo8cg6s2V7Yg
	 8kBR67+c9bwNc1mNtnSzFQqJKtaW5CTI7E+WBoLOqXwPAQWh/cl/Ac2oIq0ra1q5/+
	 1Dj61/yLOat+eI0MVZmUKL7jApPjM3S/ozGzuzHIva0CJ7uBvH/bYVe45EFjG5Tnua
	 HZo74hvoy6JZg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 444F8C41616; Sun, 11 May 2025 12:49:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220069] [6.13.9] regression USB controller dies
Date: Sun, 11 May 2025 12:49:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220069-208809-uo49l5Way5@https.bugzilla.kernel.org/>
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

--- Comment #48 from Alan Stern (stern@rowland.harvard.edu) ---
Did you make the change I recommended in comment #43?  That is, in
drivers/usb/core/hub.c, in the usb_reset_and_verify_device() routine, move =
the

        if (udev->reset_resume)
                hub_hc_release_resources(udev);

code _below_ the following

        mutex_lock(hcd->address0_mutex);

line.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

