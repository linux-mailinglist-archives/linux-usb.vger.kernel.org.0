Return-Path: <linux-usb+bounces-17129-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CF769BD064
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2024 16:32:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9E98D1C2185A
	for <lists+linux-usb@lfdr.de>; Tue,  5 Nov 2024 15:32:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A379E1F95A;
	Tue,  5 Nov 2024 15:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="acuC2pOb"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B22071750
	for <linux-usb@vger.kernel.org>; Tue,  5 Nov 2024 15:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730820757; cv=none; b=C1eZa64whtI8Ea80mwZq89RGo6kwLMnZG2PRZzU0sz/c0lqCVNbZho441+SMvTUxnzOK/aqosxQ6SM9MKtNwOh3+MafjIbggbu5U7TJfURERM4BYMNLTv08kpfJaG2E7YzHMpdHWYjzCm3p8cmhL+UHLos/F/qz2clmR4AArPRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730820757; c=relaxed/simple;
	bh=xYTCaDKvBDfrTAzaonHknU7UhWISD09+1TeUiN6hSwI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oXBkGXmZJX5Jhfq9t/ywvP4gGqTtadDew/ON25pqYaYIQNuP8/DsBEK3ipVFOjnFwmcyr11+RUJZGTFhprNDnwuosVKkYljuL+HYKJDeBvCpSNcWxwDxKfr/AWhGCD7V3uPjg2hdrdVCM8hqALsxJ/JXKfPlca9IPF6IyS+tPyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=acuC2pOb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C1304C4CECF
	for <linux-usb@vger.kernel.org>; Tue,  5 Nov 2024 15:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730820756;
	bh=xYTCaDKvBDfrTAzaonHknU7UhWISD09+1TeUiN6hSwI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=acuC2pOb7j2ZTybfwE/M8sriP/ZSuLvZM1CkI08vrxjGJRkonhkewhsbiZUCHPO9q
	 MS347wtyAdTKyV6IK4TR2VTq2Xk+8QpxNkkDcE3penkkJDAvWgB3wixg510plF98fh
	 zPRBwVk0KzLVfiVnWYptBmx2nkbHmmctjO1POpr6HnSmaTpQWdIczMIdDIt7dMRPSx
	 kiPe7ETYd0cr56u+lRwYF2I87ckp0xoMqe7L1dP+wHTexljwNdlMSugI6wfi7dVN5A
	 VQq9kH4P3C3CFYKttWR4Iz6KSuDNbcDao0rh7Auc40NAtC2yarog15nxUrZw/kQjpc
	 3CVP66Ft0VIiQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B3F44C53BC7; Tue,  5 Nov 2024 15:32:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219470] Add support for Apple USB-C Magic Trackpad 2
Date: Tue, 05 Nov 2024 15:32:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: enhancement
X-Bugzilla-Who: gregkh@linuxfoundation.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219470-208809-vFW6JUxVEp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219470-208809@https.bugzilla.kernel.org/>
References: <bug-219470-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219470

--- Comment #1 from gregkh@linuxfoundation.org ---
On Tue, Nov 05, 2024 at 03:04:35PM +0000, bugzilla-daemon@kernel.org wrote:
> I'm happy to submit a patch, thanks!

Please just send a patch as documented and we will be glad to apply it.

thanks,

greg k-h

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

