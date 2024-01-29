Return-Path: <linux-usb+bounces-5600-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B658409CE
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jan 2024 16:24:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1C2FFB22CF5
	for <lists+linux-usb@lfdr.de>; Mon, 29 Jan 2024 15:24:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13C06153BC7;
	Mon, 29 Jan 2024 15:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YaHMf/DA"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93265153512
	for <linux-usb@vger.kernel.org>; Mon, 29 Jan 2024 15:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706541850; cv=none; b=Q6nnSyvDPG4Otc59bU8bOhHBK+7BUQUOV0INgEoki6BdOWFZTlpyyY1QQjNTChRZuFObyglO/IIADoNq435Wbg6Io0nUvPSQIGpdVjjogecVA7WJwbBC9QQofDJA0HW7qYP9pw6EQwzrZWXKGF/q3ob5SkjSPplOka9fv49JtX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706541850; c=relaxed/simple;
	bh=TxXDHgr8OPrXwIZjf1VZJXYp8SLhOeE+p8hHrBngbcc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=q3/2impziBZ+4dQ+VkM5J6IHiZoI3iYqp38KUS/0coA9hJWp2I8rVrE+AFdYf/A1/Ih1XSGaXRaQAhv+vKY10TivPB5kUHMz7E2+fyZRYFNdjQwcjqznaHByw3Bx8UI92UsvTck3ZNteZpVGQjC5PBhnF1vr//65x7yKMnsy/0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YaHMf/DA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 15ECFC43394
	for <linux-usb@vger.kernel.org>; Mon, 29 Jan 2024 15:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706541850;
	bh=TxXDHgr8OPrXwIZjf1VZJXYp8SLhOeE+p8hHrBngbcc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=YaHMf/DATHQEtCkLXrd3i6+doAoTN0T1ZYRF89n8fzQ4D05NMfEQbWFizm1MhL1hf
	 bih2bBKPwOls9v+gWyICSMva9Hazu0VNggw9dI1k2NaLpR7nmC6z1tN37BHK5SD4PH
	 yeidbbZAgw04O8CoGHMXM6suoNrW3gJOdRBOnJM1hy38tY4zNH20qO77ZYbAp4rnbD
	 RgymgfVIBete56E9wStZwOTaE/Wm1ugATZO5n6qwtSw7yLqs5TqAG+c5u7yN+y9CjQ
	 iR1cK7aYNNbuvP4Z8t+jejTE3EpY6sL33flCb9fGWZ5iflHnlpb4E3dy1SYb/hNlKY
	 i643aW1yfg1dg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id F02D3C53BCD; Mon, 29 Jan 2024 15:24:09 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 217314] Mackie Profx12v3 not working, showing unable to find
 clock source
Date: Mon, 29 Jan 2024 15:24:09 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: alexander@tsoy.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-217314-208809-8Z87rtixq7@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217314-208809@https.bugzilla.kernel.org/>
References: <bug-217314-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D217314

--- Comment #3 from Alexander Tsoy (alexander@tsoy.me) ---
Please try the following:

modprobe -r snd_usb_audio
modprobe snd_usb_audio vid=3D0x0a73 pid=3D0x0023 quirk_flags=3D0x20

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

