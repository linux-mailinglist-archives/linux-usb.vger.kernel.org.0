Return-Path: <linux-usb+bounces-11355-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E641F90A31C
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2024 06:48:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 115E31F21725
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2024 04:48:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1B3DF16132A;
	Mon, 17 Jun 2024 04:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XWJOGFEx"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DC7256A
	for <linux-usb@vger.kernel.org>; Mon, 17 Jun 2024 04:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718599727; cv=none; b=KFoLNoyKlyvcvpEf9IOv6KGeiUIk2tTVc2Un4GK4LzqBXHcCc9ZeRlCkOtZ32/tZ1Dog4mSoqzEY4TOdxEWcZjIpGF7hRRh/g5kygwQ+1EoE3x3429DbNzojmHt+L97FSS+jqHZuDbOyHq5AxQAWkmmueYN7hgPoJmAitzV11Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718599727; c=relaxed/simple;
	bh=6sHnrcp6Bpi+lzK/y44dPE6trim/85BJmaXsbxmaxtI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=dxFZes5v15UlYtikjVl8SsO2FtZ70uPh9sQv9gprucL8V1gv7ZaUxlW0O8iaxGopodgyoRjYkrYma8o90GJog9c7AjKBhnyc8bnMr47KGpWPz2FgsV7+5LZlG1Xede78WbcG0pO/Z9jIQizQEr9n0oQbTZyi0K4E2LiGT1NA3cE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XWJOGFEx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1DC7FC4AF1A
	for <linux-usb@vger.kernel.org>; Mon, 17 Jun 2024 04:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718599727;
	bh=6sHnrcp6Bpi+lzK/y44dPE6trim/85BJmaXsbxmaxtI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XWJOGFExsbk+Pn2SM6/aPzuJWxOySNy/iV2497z+B/DrrEJgFeXmaFWVpPyjn9So8
	 it8ck/j+WtgVE7QO51AuhgIjYI+vaOi1us5t9Pt+0y8UipQkafnQaxEqw1RqPTN4bX
	 Szvo1XqXrfUhqN7tz5N2My4s/ybS0PEnfaIhGs6LqSoDFgaYTvgxv5+uL65BhwBDxA
	 KGLN6oLLtw3B5nE9YH6VbO0ECE/FH6rbQT5bTDl0Cdr2kwp/YhNROIuWcPL156xKD7
	 nyAtp3hPmrUhxMkywlaJkwxtyV3ztONKuxUbDcvs0s9HnOrb8GN9VTtHVapyzkyVRp
	 9UGLXX1zAoA8g==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1590DC53B73; Mon, 17 Jun 2024 04:48:47 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218943] No SuperSpeedPlus on AM4/5 Hubs
Date: Mon, 17 Jun 2024 04:48:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jarrard@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218943-208809-cX6rQVmqSf@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218943-208809@https.bugzilla.kernel.org/>
References: <bug-218943-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218943

--- Comment #28 from Jarrard (jarrard@proton.me) ---
(In reply to Lars Melin from comment #27)
> (In reply to Jarrard from comment #23)
>=20

> I can't see any AsMedia device, maybe you mean the AVerMedia device?
> What do you mean with the hub shows as 10Gbps?
>=20
> I can only see one hub, the ViaLabs VL813 and it is clearly a 5Gbps hub, =
it
> is identifying itself as USB3.0 (55Gbps)  and the mfgr specs also says th=
at
> it is a 5Gbps hub.

Yes that was a typo on my part, its AverMedia

I have 10Gbps hub connect to same port now and it shows as 10Gbps.=20=20
The VIA Hub at 5Gbps is wrong and possibly created by the AverMedia device
which is also wrong. But it does not appear when I use a physical 10Gbps hub
however the AverMedia device is still wrong.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

