Return-Path: <linux-usb+bounces-19777-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E90A1D2EC
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jan 2025 10:06:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D04453A4FC3
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jan 2025 09:05:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 178271FCF6B;
	Mon, 27 Jan 2025 09:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eAYaNF3n"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907301FCD11
	for <linux-usb@vger.kernel.org>; Mon, 27 Jan 2025 09:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737968750; cv=none; b=OyvzL8eDEKsYA7YCpoHjeghS+4m3RBXn/BvLKQpilIQMWFcGLQOJPE5QJpYsCJhim06AD9DMRfheo9alXt8mQn4qNmix9eZSPpII/gzg57hCEBbeJhyhfJkCLrHBKoABz51bedvHI6pAWp16jbmSuZtIZp5ANct9qxaZlKkWJi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737968750; c=relaxed/simple;
	bh=GpSZXJI6YKU7mPlnfkYA/aSy4acej2k9e6TO33S6aF4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QI7Ek794PK9pSicWWuy2zhYp6qk4h+mIqqJrScwKJSFvK47qAPoWh5R3Ny7mzoCm9dtT9qhbdghp7b9zpmtmEk8wi1psqhFGzcmb/vEjsh5LYU37J58DmOAYAVuJF6HBbtKZvnq9sBUGkAiN/P4JgwDBQADYZXeIxVTLO2tQEkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eAYaNF3n; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EFA49C4CED2
	for <linux-usb@vger.kernel.org>; Mon, 27 Jan 2025 09:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737968750;
	bh=GpSZXJI6YKU7mPlnfkYA/aSy4acej2k9e6TO33S6aF4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=eAYaNF3n2SUNIPEbkhs081W6bN2/7+WtscGorJt0aBoZJSCYVdW9jre8CtJW1aeNz
	 4U477i9IuVy6AkxizqYSlsFyhAJ/9sHRv9dZ4Mef42ptDaQw0Q5VZwNft6h++ks8Hu
	 Nm6CDVI9xFXbyXRA1ND3wrLUcwHPiPpvC5e49w5IqAhxJknl0INyPaEAdKR8TA0SSL
	 RcwO3igfV8Vzp8o1DZlkN54E7aDqkY4HdShodBrFOE02zD1OiOKk62nl0mNR55f5OT
	 vmmj3rYC2yEUrePBScsULl2lFg9k5Md31+z8eGf96BuEOexsY74r1Rzcl05dmqjyjK
	 qLENeVo+wVNZA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E596FC3279F; Mon, 27 Jan 2025 09:05:49 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219681] ASUS Zenbook S 14 UX5406SA: Unstable USB connection on
 USB-A port under certain condition
Date: Mon, 27 Jan 2025 09:05:49 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219681-208809-uB4PgfsNgN@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219681-208809@https.bugzilla.kernel.org/>
References: <bug-219681-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219681

--- Comment #14 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
> who the heck thought building in a xhci_hcd module was a good idea ?
Your distribution did, it's their choice.
> https://ibb.co/c8YFYhG
This should be posted as a separate bug, not here.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

