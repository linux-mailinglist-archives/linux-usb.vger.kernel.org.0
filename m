Return-Path: <linux-usb+bounces-7417-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95D9486EBDA
	for <lists+linux-usb@lfdr.de>; Fri,  1 Mar 2024 23:30:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3F88C1F23F25
	for <lists+linux-usb@lfdr.de>; Fri,  1 Mar 2024 22:30:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56B7D2AEFF;
	Fri,  1 Mar 2024 22:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Mh6FcvIv"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D561BAD55
	for <linux-usb@vger.kernel.org>; Fri,  1 Mar 2024 22:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709332213; cv=none; b=lt9O24uYmK2sUvLEazEHqejBcPByB8lEs4RUBXIH7HksuFv2SFAcZOWpJeAKf6rwpawfXOfUJmCL4Rj+VNGu6OIOEA5iOcacCiSIJHMEpSwCWmY+lnCt+V+LgWG3Q+nnHShCPCQ6J/VXqE4pHz+4e5WTMbkPV868rqM3ez1TzbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709332213; c=relaxed/simple;
	bh=kI7+yqVHlLgvurlPSYT5Vjh2Hi4V4RAVmlT2GRhAvtI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=o3w2rUPKPGwtasRVw/hnvdPWPNT7+zX+oJeuEFD6RzTJiRKjmi7MqBnK7cZTld2iAIdcoFLQWbMGxkUpgDCS8z21wILR6oq5hrWeek+3LcB3vnAmCT5A6JfzLYrvKZGhZ05Y9caMe5buHVnR2P5CwBWBXw9NWucXIxOSAogane0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Mh6FcvIv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 78288C433F1
	for <linux-usb@vger.kernel.org>; Fri,  1 Mar 2024 22:30:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709332213;
	bh=kI7+yqVHlLgvurlPSYT5Vjh2Hi4V4RAVmlT2GRhAvtI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Mh6FcvIvQefdWJnL7MhgWI14WXEV4xt9xVigP3DpPFtSaUl1EZMgEBJFHrNdW4Ase
	 IiQNft2mXO5RNlVrvqy42k4V2QMJyP07qgL8eq5UQHLyhQZbHgfVOq45nUIzuJXSE1
	 M90jpFvJ0JAfdYjGc/DtwbF3SdjOeKsuQ3ebMr7g8yzMPCiN5Sh3Ssmr43LaNqzwnu
	 Pgwz/I/Ls02fia1N1c0hhrusi7TA07W8r9pnkIw99tShtxcM7RtLjNaNdfRxbKkPD5
	 daaDvPMvpjbuaj/yd8tsmWhcN3q4xHNFibvcM2/egu1ZnkK7+OtUjS3WxrdN+ZSlHg
	 6H6f79F6yj3Lg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5D33BC4332E; Fri,  1 Mar 2024 22:30:13 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218546] xhci_hcd prevents hibernate/S4 suspend from working on
 several systems
Date: Fri, 01 Mar 2024 22:30:13 +0000
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
Message-ID: <bug-218546-208809-XzkuDiZVr2@https.bugzilla.kernel.org/>
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

--- Comment #3 from Todd Brandt (todd.e.brandt@intel.com) ---
Created attachment 305943
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305943&action=3Dedit
issue.def

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

