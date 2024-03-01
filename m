Return-Path: <linux-usb+bounces-7415-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6012486EBC8
	for <lists+linux-usb@lfdr.de>; Fri,  1 Mar 2024 23:23:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 017ED1F2430E
	for <lists+linux-usb@lfdr.de>; Fri,  1 Mar 2024 22:23:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61A8059B7A;
	Fri,  1 Mar 2024 22:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Emq4fO7x"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C375A0F0
	for <linux-usb@vger.kernel.org>; Fri,  1 Mar 2024 22:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709331627; cv=none; b=TEn+YzfD2t4nF0eg6hpBKQf87k92rPRA6ikGjI6c0W5m8PeqzjP0+iPOmvYuP2AJmzWOoSu0KT6/zdiQz8+DazJPwyBZWUnyvvdJDRY9i3Qy8xhasBJSMUZIJLISmoUIYImSuKPmy2OYMbqMZumP0vxue1a+RQMEDdjLW8F3pSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709331627; c=relaxed/simple;
	bh=n9brysMoOJk9mGN6+T284rqIu9vNW10L3tvfEsln4b0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Quxden9mw690PZipzGLsXWdJBLrh2sB+LCPPR4DGlc6lOHeSeSDN+OZM48e2i45hpeEyNRlea86SrOZupmNqNQbgvVri9G23O97OtgOFsHzBUuMH3VfPjhCTE95r/Gel/TGnPKzhWHLQt65GviMOf9w6GT4BkVsV+fIYDaigc2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Emq4fO7x; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 73A34C433C7
	for <linux-usb@vger.kernel.org>; Fri,  1 Mar 2024 22:20:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709331627;
	bh=n9brysMoOJk9mGN6+T284rqIu9vNW10L3tvfEsln4b0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Emq4fO7xJhfE5I9ec3RC6m8ydnpgVaa3OX3js0Q60fFiLGGgPMB8Xaq2iwyWtDN17
	 3QheBZh9FyRWKjpyhG2qKEf9fjUvwhJM4Ezm4SpOpkdE1p40mxFH0mK6g/Hgb8dvyI
	 uv38x0EWsgqPirfJCv7g7Ex3mjK9lhGRCn49Ef+LHbtsDkTEpVkFCNfLWXSsr/lQ/O
	 T5SO0FoFSXU1E0eRPKy7h/YlMMtKciF/6yzKb3Dw9M/FJhb/Fyr0y04B9UHs33xB7n
	 1zODB+6hXBae5r/r9uZ7ow8L1Yaj4n9mmCBtjQlt5gPsurngsa+xCy+VEk2fICiIbf
	 qL1jpmwlKgU3w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 63B22C4332E; Fri,  1 Mar 2024 22:20:27 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218546] xhci_hcd prevents hibernate/S4 suspend from working on
 several systems
Date: Fri, 01 Mar 2024 22:20:27 +0000
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
Message-ID: <bug-218546-208809-PWTWTm6MaW@https.bugzilla.kernel.org/>
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

--- Comment #1 from Todd Brandt (todd.e.brandt@intel.com) ---
Created attachment 305941
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305941&action=3Dedit
otcpl-dell-7390-cmlu_disk.html

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

