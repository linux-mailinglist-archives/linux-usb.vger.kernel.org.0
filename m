Return-Path: <linux-usb+bounces-19680-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8455FA1A712
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2025 16:27:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B5151889FD8
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jan 2025 15:27:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0634E212D94;
	Thu, 23 Jan 2025 15:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mWlnUGPJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81AE2212D66
	for <linux-usb@vger.kernel.org>; Thu, 23 Jan 2025 15:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737646045; cv=none; b=B7PeJ4Dc3xaCQPZutzhnupc/o8WPluzFUA5hH2cvl0ACMTi93UfSf7l3DnfD+UhJefKbfY+YbG8o9uWP1oATXW6FYDNAV65p9d6ucbBtgw2SWCPYa8nJtiPfamTAUk0lX+2CV/9xLBOFzi8OPNc+EHzWfnfrDDCKaCd72TwD4dU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737646045; c=relaxed/simple;
	bh=pKfBnzT8NU9AC/uXgB4t1/Vl5SDxvy5l6KbTMPzBMtA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=eDkQzdgVkVe45nx3j4LMiNCC1RDm7XK77dRfH/k3+yyB1lh3gtt3G6DdGzGFnbC/OTtze0kiHJ6gVBYXSrF0VUvTuUQliQ8QSCv0VfNaBLXF85PLH4UW7WMX9b+Oo8c4oPv6J2/BPEcp9W99gu2UzthYL7fFxTZLttiyOEYz8zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mWlnUGPJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 03A8DC4CEE2
	for <linux-usb@vger.kernel.org>; Thu, 23 Jan 2025 15:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737646045;
	bh=pKfBnzT8NU9AC/uXgB4t1/Vl5SDxvy5l6KbTMPzBMtA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=mWlnUGPJZ9ZMlU2MtR4d/wewmgJjtZhWDBQNSpfgt/HEevYITfRVSxSX/Ca8nwcEX
	 ts3ldj50wVUSGRaiq36uCUzjSXpaP7E0uPPuodFcjvzNCOk7k+hPeM7KhItijGWCmm
	 gGaj7fifBlLG4CjRZugUTtCT7ZS65I3D2GT+Pgs2MSXxuyXXS3dQndCTFJWE/RskND
	 xfjaJ0G+ImDjdxOG7ZUrKCS6ODphftB7Ieeontfw9oMT8nvbD3fRQCA7BP0ntQg1jN
	 VzoSgOG/WAWEUTOS/q79jfv5uFnbUAWJNPf5l1iEEYW0V0MYlQ02pIsFcvpzBdklIJ
	 LSEtnBne1ut7g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id D7D89C3279F; Thu, 23 Jan 2025 15:27:24 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219681] ASUS Zenbook S 14 UX5406SA: Unstable USB connection on
 USB-A port under certain condition
Date: Thu, 23 Jan 2025 15:27:24 +0000
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
Message-ID: <bug-219681-208809-b2aMYiJvFf@https.bugzilla.kernel.org/>
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

--- Comment #11 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
OK, so the UAS bug is on three different host controllers now. It's strange
that the hub still makes a difference. Stupid question: is the enclosure
running at SuperSpeed when it works correctly?

Can you trigger the issue instantly without udisks2 by running something li=
ke
'skdump', 'smartctl -a' or 'smartctl -x'? This may be a more reliable
reproducer than starting udisks2 and waiting, if the problem is caused by S=
MART
queries.

There is this patch from Raspberry Pi which you could try. It should be
harmless and some Realtek chip was supposedly caught having bugs in this ar=
ea,
but I tried it on a different buggy UAS chip and it didn't help so YMMV.
https://github.com/raspberrypi/linux/commit/66aef6ce3557edd9d58d794e4a800c5=
be49ca0e7

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

