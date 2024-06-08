Return-Path: <linux-usb+bounces-11037-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5832D900F19
	for <lists+linux-usb@lfdr.de>; Sat,  8 Jun 2024 03:36:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9030EB23BB7
	for <lists+linux-usb@lfdr.de>; Sat,  8 Jun 2024 01:36:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91E783D6A;
	Sat,  8 Jun 2024 01:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="blMpLeeC"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 067D8A31
	for <linux-usb@vger.kernel.org>; Sat,  8 Jun 2024 01:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717810558; cv=none; b=pkTwTLKRE7jS9hZO+28bp1paaZCa5env3JxbDIcQTrg+GWZCFCfqJje4xtMQ8zbf0fwqXFk6cK4B+LlsP2t614S7D9Ex/3xPx5AdqlXxtubg9fNgfEwfwNVd/nnKEpYn0JBrxEdI0OC3MlOv1l3B37BC3P50yu+YDmH3UwlAyME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717810558; c=relaxed/simple;
	bh=n8qKshzCFujiyiQMA3dngyRchWU5xgBUcaNLsZz++hg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Vf8x9KXVSGDvDg7iTsyDu2JMZBha3gzwG2QOta7C3ydArvX/UTLLOawobUywHmszE8mghmHFO5gzdDRaj5Y0/gxNNMKzXLgKVXFaWS0qkmM9RcxsFnM8xwOJY/WUovILu6/Hobzk8i+ZPHImh1KD0/Myr+mnGIhcpSJ+H6QckUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=blMpLeeC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 906A5C2BBFC
	for <linux-usb@vger.kernel.org>; Sat,  8 Jun 2024 01:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717810557;
	bh=n8qKshzCFujiyiQMA3dngyRchWU5xgBUcaNLsZz++hg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=blMpLeeCmsBmzPbBvsCU3vuqz6c1urFGgcXMzB9LrW40xN5ZCtKHfL5mGwDdsKuA9
	 1gW6SNG5Y37Z/YLfeYgft+zOFxdvMpZqW83CePuU1SXTrpe6QZIveavX3wcb4caakY
	 73OjPBk9hA0jNV9s1XTjPGG95w7fm+k1nD15yseR+b99KjCUELAIuj2U7KXNcgyPqx
	 7PR9ZWHdBLEkZ7uwNro5wlXzwxfMbzU1naC4vOoyVm8kbU73iXygqls2BODUUlG4Rz
	 3fA1v+lAigV0NGP22lrrsGnyxipV8mKkLCGFA3JusQ4oCgq/wfr9Z9lkJdOBWJXmwd
	 IYbCui/bfWoCg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 7AB4DC433E5; Sat,  8 Jun 2024 01:35:57 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218943] No SuperSpeedPlus on AM4/5 Hubs
Date: Sat, 08 Jun 2024 01:35:57 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jarrard@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218943-208809-FrqgoZgWwJ@https.bugzilla.kernel.org/>
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

--- Comment #6 from Jarrard (jarrard@proton.me) ---
Created attachment 306440
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306440&action=3Dedit
fresh dmesg output

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

