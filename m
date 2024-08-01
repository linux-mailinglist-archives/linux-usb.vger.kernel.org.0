Return-Path: <linux-usb+bounces-12846-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 62D68944A61
	for <lists+linux-usb@lfdr.de>; Thu,  1 Aug 2024 13:29:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1EE20282417
	for <lists+linux-usb@lfdr.de>; Thu,  1 Aug 2024 11:29:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BDE2189BB5;
	Thu,  1 Aug 2024 11:29:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ja1PxqDQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D937616D4F3
	for <linux-usb@vger.kernel.org>; Thu,  1 Aug 2024 11:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722511772; cv=none; b=n1F/m+1MsBkpfjefMWSXz2A+B8qsLTa/NK1BmEWuon8VppJ/S9SuhJRcYefhpYBDM5D3uU+FfD2dDjACYEXsu8uugtz8IbgbdI4V2wxLz4rfd6iTgT4C9HPmNpuAbWiMQ1cDs4XaIGik3gTcCN8K6zXFi7ykYUZz0+p5d70wcdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722511772; c=relaxed/simple;
	bh=scDPtuO6DNYd9P8oTUXbsLqhYLruruaDnn1DwQC6vL8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ayD6E5s9EF6TO4YFpHdnXLcK1/n3K5XFUTyixwOzcnhouxjFdZeua/kcUrpQF+9DgllkgMiuAWbinULtzcluHng+1CPXSvgbzMSL1BpVsCySslHR8s8L2F6vz9MWurJQTSupkKcTXlGhGMhwee4TI6l4GQJ1Aue1Y5xPKEgflic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ja1PxqDQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 49A3FC4AF09
	for <linux-usb@vger.kernel.org>; Thu,  1 Aug 2024 11:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722511772;
	bh=scDPtuO6DNYd9P8oTUXbsLqhYLruruaDnn1DwQC6vL8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ja1PxqDQlGnOj2rkYUy8IJ9wNPrID2996nirXsgd3LNi80qSGtWOMKr0IByJ/Ee/B
	 +fAquJH7DRjW3njFrUdlodv2D+4LW22Cjs8pn/EO7X2A3ByJxsRzsR3ExrCZIliA0z
	 VvBkJkzsrL2n7SyF6/d4Rl4o2O+DLA/pNJn6ZjwYCur3tNwPGeHUDfrGV7eCkazRbm
	 fML9gP3lNQtHa6+GR80IVJDGOPU+Omn1giJvNVSPEyFIToPWBt7H9kFIqXJ0CFmFGT
	 tUEXxFjAKMAMS6fuv+fz6P90xc3HAwiPuotrCsjUIg++Pr2ec/hqBSR40AA2FoLfDZ
	 Gs9+KAeR7lAvw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 3ED80C53B7E; Thu,  1 Aug 2024 11:29:32 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219113] I/O-errors freezing the system [sd 0:0:0:0: [sda]
 tag#11 uas_eh_abort_handler 0 uas-tag 1 inflight: CMD OUT]
Date: Thu, 01 Aug 2024 11:29:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ijaaskelainen@outlook.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219113-208809-gjwkZeo5jH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219113-208809@https.bugzilla.kernel.org/>
References: <bug-219113-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219113

--- Comment #7 from Ilari J=C3=A4=C3=A4skel=C3=A4inen (ijaaskelainen@outloo=
k.com) ---
I am sure it gave those messages before AHH now I remember do I got other
versions of kernel installed let me check.

6.1.99-102 I think they all gave me the same error message.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

