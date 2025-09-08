Return-Path: <linux-usb+bounces-27756-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A56DAB49D0D
	for <lists+linux-usb@lfdr.de>; Tue,  9 Sep 2025 00:41:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 67DCE17BF79
	for <lists+linux-usb@lfdr.de>; Mon,  8 Sep 2025 22:41:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E760F2ECEAC;
	Mon,  8 Sep 2025 22:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X4NIg5XL"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8CF2EB879
	for <linux-usb@vger.kernel.org>; Mon,  8 Sep 2025 22:41:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757371294; cv=none; b=DFat3GvIclgm/SpLiT8J9eyo3I0vuBIxcbbRvd/6YxZNvkk4E1HqCUQXkuOxzUDZ+1NTrdeXxMmy0bRBGETXjC6Mg7e6yZ9wvg+qRR80T6+/2gHRt7I6SFQgbmr2YXoa++7tiaNrvFwGSByNMW+X32jKbIn0mIu88X3KLy1V3f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757371294; c=relaxed/simple;
	bh=PL0kf76lq/beCXOqj0IpQm3xlIT3H9CyelZQLsyuxBw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mjF9sVrRM2SU/ptNfE/HX5I8+IHKIb7nSkM+uE/KVOopcGstYUpGrtpMBUH319emvZMRhYk812Iwbavh3WaVPQE2kXKSqVmsDqX0PW4dNt3uleQ17pMY00MulzX5j3c1nnupCaSbKMNFCoAn5VF8LRV0jq+k6XMb1oGbzVXIE58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X4NIg5XL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EA43FC4CEF7
	for <linux-usb@vger.kernel.org>; Mon,  8 Sep 2025 22:41:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757371294;
	bh=PL0kf76lq/beCXOqj0IpQm3xlIT3H9CyelZQLsyuxBw=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=X4NIg5XLVSfAlluKBlqZ1c3Ki7644adtl14+bdDGhUGwp2ngvUhl0fSXh43D+1eec
	 Jr90vWhLJQGH3fGhhWIRnNNWay6WE0tgWMCp58ayQCnDhjiu+UEwsOUeA7kBzeO5L+
	 bd7wkGnnLQ9XWqXy+MRJOOd5Nb6bWmNB/yw30RHOgAy9pQ0eJ322kflxN9Ou+KOTZH
	 hVtGOnkp7C9jTxz97e/eD1H5kxb/iAk8V5hQte3dYRJacY9KUgX/RNMiNFY7fW/I8f
	 vUG3pnMgSvRHSr3vit9qiUdHRq0YIHADa8a/VD8IUZZBPjXaVewYvHWQZLAEOFSUu6
	 P0VS4juhlWNxw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DE598C41612; Mon,  8 Sep 2025 22:41:33 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Mon, 08 Sep 2025 22:41:33 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: paula@alumni.cse.ucsc.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220491-208809-ivdjX5KKuA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220491-208809@https.bugzilla.kernel.org/>
References: <bug-220491-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220491

--- Comment #47 from Paul Ausbeck (paula@alumni.cse.ucsc.edu) ---
After some more testing it now appears that Alan's reset_resume_delay patch=
 is
not a true solution to the ativ9 SD card reader unmount problem. After I
applied and unapplied Mathias' patch the original problem returned. I've tr=
ied
to get back to the "lucky" state where unmounts weren't happening on S/R but
thus far I can't get there.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

