Return-Path: <linux-usb+bounces-14130-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6205595F908
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2024 20:35:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 949E01C219D8
	for <lists+linux-usb@lfdr.de>; Mon, 26 Aug 2024 18:35:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BF34818BC38;
	Mon, 26 Aug 2024 18:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ACSv7NxL"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4F2823A9
	for <linux-usb@vger.kernel.org>; Mon, 26 Aug 2024 18:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724697319; cv=none; b=ayeK/gubSv+M2n/agUffE/mRG5x6ylKB4D6gk5BrNNWrsFLRXTUCr32Pgoj/kR+ybxbxRVIxfnqxIAfD1xOksVItFYw1oo/wwvRnATlC08ltjhWewKlooEZ8jnmzZbPmtIqao30o3YA/Ei2PQ4ZP1/sgC/IUxpwpxC6lT2UXepU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724697319; c=relaxed/simple;
	bh=IB4ZJWSd9pD9k7lmY1j3IYW+Pk+UieTJBuLfqa8yKXM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LKTV7abFmdJ3fT7PTY3iIL+DfDHHuZajko+YR5BQodXwiyrF5Z/f3Ycb8FrTz3sUaaCOA+4DyJXRJ7S8HU5Q7xHpTvclX8DioNIZsFFrq+tzlh8QLHR+noabGRSrR0rIBEP8C5NCEJDq2ryrwORc+5w/wx6scdVD+PF9zV2nqZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ACSv7NxL; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BB554C4DE0D
	for <linux-usb@vger.kernel.org>; Mon, 26 Aug 2024 18:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724697318;
	bh=IB4ZJWSd9pD9k7lmY1j3IYW+Pk+UieTJBuLfqa8yKXM=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ACSv7NxLrfOxuz3JbYxa2n27W6GoA76mVObEzCv9+CU9EQ761s37ooxDd7LGWQidl
	 Vi1I69YcIPwyLyvXB1PI5SG7k8BcDBetxxnivLqMGPoJGopnlR/a1lIcda9HJxM2O8
	 wbrZmPi3fO5ttnySJOqVODI64ge0TS1EeHOp81JKYOL/bn5dlMx0uhJjhAFfPSCJym
	 T0e4HBhnlrtXTKvqOrohMe9ed201BEYmSdPP6kV+ZqGuMiqz8xtDlE1UDRebzzXmwq
	 NNDfnOszjrZjiKwftBLPRP7DnBGW/vx2arg7cchisWydHQlgpJPPcR+tMyZ+ylJrwX
	 r9mFSKT5ImhuQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id ACE0BC53B73; Mon, 26 Aug 2024 18:35:18 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219198] usb on Dell WD19TB Thunderbolt Dock stop working
Date: Mon, 26 Aug 2024 18:35:18 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: regressions@leemhuis.info
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-219198-208809-fduJCFMuGB@https.bugzilla.kernel.org/>
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

The Linux kernel's regression tracker (Thorsten Leemhuis) (regressions@leem=
huis.info) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |regressions@leemhuis.info

--- Comment #4 from The Linux kernel's regression tracker (Thorsten Leemhui=
s) (regressions@leemhuis.info) ---
Do you run "powertop --auto-tune" somewhere? Then it might be related to
https://lore.kernel.org/all/be791564-ccca-4dd5-915f-aa32b2482817@molgen.mpg=
.de/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

