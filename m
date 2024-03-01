Return-Path: <linux-usb+bounces-7416-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B7ED986EBC9
	for <lists+linux-usb@lfdr.de>; Fri,  1 Mar 2024 23:23:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6D66F1F231E6
	for <lists+linux-usb@lfdr.de>; Fri,  1 Mar 2024 22:23:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE2255A0F2;
	Fri,  1 Mar 2024 22:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kOpNEqWE"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7804C59B5C
	for <linux-usb@vger.kernel.org>; Fri,  1 Mar 2024 22:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709331657; cv=none; b=uQVLP8QxG7n72ZUDVyoUeBxCJz0MuUr8RNqoleWQlwNjeeL0a3Ly+RJ/aWcc3i3F9/39SGymouW4PHpPljEsEcdcf0o6krWo9TnBnsQkRc6d/oMu3RDilJ/9e4Cde2UJRTTcI8FsQYPS382vXwbpP+7UXUiN9/pTXaq32ON7dq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709331657; c=relaxed/simple;
	bh=6TyZPY4ztVDsvrSnjRB8LEGrtgtFdMRvn9dSIibG048=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BqK/nuZ656kLcdBM1tD38w3w8eVoVB/KsRUGpeCgH72oPop3LypDsOIP8TMJJV57UGx4nwQRxJ5PGFBAU0iwrtTUY08lz+Eh5gkQfK2TCRDjdF5cpkUZ3mE9MmOknv+wYjP0aB0u0doRp/nSBmVeskh9eWLOA+b1Xh5y9Dovxv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kOpNEqWE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E8529C433F1
	for <linux-usb@vger.kernel.org>; Fri,  1 Mar 2024 22:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709331656;
	bh=6TyZPY4ztVDsvrSnjRB8LEGrtgtFdMRvn9dSIibG048=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=kOpNEqWEzyHst2yLBdrxaQTAjDACeamfKF49G7bH9esi3jxhDX/NbtJhQlp465tn6
	 JTj7BYK7yxrU7n4CUpn2TrWem2b2ac12PI1JVB0Z4Rg2tiSjsI8i1hd0Ze4qPzm3iQ
	 uVRKS5ZxaDqpi9bUklfVKNDjBtngpEpoK7zdR7qouUUCNgMpnocL8LpDwgMm7V0DDh
	 4g2pSv4FQEryDebFJy3cQgDLKSX1NcXkATPs/1VnPdzbZ1rGpJfXsGTRYw+kFia01T
	 qqs565L+5KaIa0iQhaNOhRFBbGhLFqWRAX547gobw9p5Nzt6EioVOFTSy+DKhTNW3B
	 mRToLR+m8BI0A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D337BC4332E; Fri,  1 Mar 2024 22:20:56 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218546] xhci_hcd prevents hibernate/S4 suspend from working on
 several systems
Date: Fri, 01 Mar 2024 22:20:56 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: todd.e.brandt@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218546-208809-siTM0szfDf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218546-208809@https.bugzilla.kernel.org/>
References: <bug-218546-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218546

--- Comment #2 from Todd Brandt (todd.e.brandt@intel.com) ---
Created attachment 305942
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305942&action=3Dedit
otcpl-hp-spectre-tgl_disk.html

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

