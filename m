Return-Path: <linux-usb+bounces-14613-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 217B396ACF1
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2024 01:41:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 61EFAB20B6F
	for <lists+linux-usb@lfdr.de>; Tue,  3 Sep 2024 23:41:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E391A1D7983;
	Tue,  3 Sep 2024 23:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s0pe4efs"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6333C126C0B
	for <linux-usb@vger.kernel.org>; Tue,  3 Sep 2024 23:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725406860; cv=none; b=WuYSOYRQ3weG1G5F9eI04oDUMe+eA6bzpx2dvaMMGU3gKKNL1mgK+OclqBIEJR1G/6vg6fVMMGThCw9Nl5fF5syunXDcyiHzFxuwExVBy+EfGeZyxTfhx9ZDVotGT73DezdoT3JXgpgIHfUQJvQ6/4RA0y9pCeeHOL+wVU1HyYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725406860; c=relaxed/simple;
	bh=dD4OEXSzLpJf2nPsprQusfj1lzyQcBDKqJ9Cm6vxOWE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=b9etG7ejWgOBCEsGQ6nzgzVnJtTyhc4rKQTbHnjPAu72Mc1VKVnQDfWAXxYR7QhAnEs/8X4Mmhixw+CvsePCKpwaEB5Y31z7d1rqT7MaNUzrEnOyQBRXSqx/293jCN+8p5VR9LBrhbI3W5ACqoR+HPqjsjHjyHT5F0gq7bWVvtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s0pe4efs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA6FAC4CEC8
	for <linux-usb@vger.kernel.org>; Tue,  3 Sep 2024 23:40:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725406860;
	bh=dD4OEXSzLpJf2nPsprQusfj1lzyQcBDKqJ9Cm6vxOWE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=s0pe4efsuxVbujPhiRM5xGUXrdYew9SlBL3EQ90AGMwVleoD9sQBkNucMABp3P2wY
	 pgrt4gLAUDaHN54Qlxj9rDjbXruCqr92G9L4U5eZsSqqGahtx3xkEVWbUD+xy2jA6P
	 iu43lGq8VUywBUYBE159gX/mQtAKYb862A4MJIDP7hH/7mf8OBA+5jbXXJXbgT4uiX
	 1GSOuJVNNq1lZ6qrP9vC6zW8/25lx/WXSm/XfXfIPuWl34D6w+end5/EKZ7VgFik+Y
	 14op75RTg7HT28/Hz8bbEHGSPjQ8HKLnSXi7Xu7o4IGanb0MrqvPOQt7noMLjOdULa
	 yp4n/gOIO5/KA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D652FC53BBF; Tue,  3 Sep 2024 23:40:59 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219198] usb on Dell WD19TB Thunderbolt Dock stop working
Date: Tue, 03 Sep 2024 23:40:59 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: adamw@happyassassin.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219198-208809-7tIU1MpVrt@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219198-208809@https.bugzilla.kernel.org/>
References: <bug-219198-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219198

--- Comment #28 from Adam Williamson (adamw@happyassassin.net) ---
6.11rc6 (with the patch merged upstream) is good for me too. Thanks a lot.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

