Return-Path: <linux-usb+bounces-11630-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA38916899
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jun 2024 15:08:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5EDF21C20E60
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jun 2024 13:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 215CD157A5C;
	Tue, 25 Jun 2024 13:08:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KQYH+VHa"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F1BA1482F8
	for <linux-usb@vger.kernel.org>; Tue, 25 Jun 2024 13:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719320902; cv=none; b=dD9WzG+Al+/30zhUDSu8Sn0vxZWK/azHXP9+jCNCwm/ejxMAYXmdDwfWlsSZfQNA7AR9XNsfXIdFr0NEZoUrKvel3i0LcFpwlsu2TgLQcHJv28fWmHJRVVuBvdj17JSMy0e8mdRjIbEOJj9rpGHD20nIuxF9ulxpf0pQ6xSwqio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719320902; c=relaxed/simple;
	bh=BKoajj2TVRJdnrX37ghdq0/0LXQOCUndx2bRNwlMI9Y=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=IdfCrzRp1/PiG8idHMJ9GVfDsH2iHI0v80HlgF2KbOG2zbeg71/52vPeCYHohhzEv1+zZ1VW5izXeKtq8LjZhPWJAZQZsH47zAIOidlq9t9p5eDXaRl04xdh2SBRUtS4Zk40pTqVjgU/Sb/oWYsU306T0TS50LvByo/cnKq1J5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KQYH+VHa; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3A42EC32781
	for <linux-usb@vger.kernel.org>; Tue, 25 Jun 2024 13:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719320902;
	bh=BKoajj2TVRJdnrX37ghdq0/0LXQOCUndx2bRNwlMI9Y=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=KQYH+VHawH/EBbTFg4yJkyqBhMniYLXCT0AiDZSM8XcASEneML9dMLMWl5EPpTQXi
	 stp14R74A91l2cpELkrfxvHwA+IWEN7N3X7lbdsknFRHDasWTCzZHfB5CLBZ9orWxr
	 gdJ1gldcJoxHghCvpt7qrUNVuxOVg0+r8A9RbnLXj28py4HKA2rnuJzUugjcM+gbSv
	 LMnFTIC+nGd3rZh3zmvwOZfQMztov1BCWGIzh9D9EsfRkLYeotrtrk2mNke7+wxLlL
	 4yOPUuhS7CCYwHYJOlHnQYrnKGi9M4T+SPhdZcKA3xBuUvy2QkSTURe6RmWIMKuuFc
	 xyJnAFuSQwBQQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 317A6C433E5; Tue, 25 Jun 2024 13:08:22 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218987] USB devices are not detected after Save/Restore error
 on Intel xHC
Date: Tue, 25 Jun 2024 13:08:22 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: repk@triplefau.lt
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218987-208809-Y9rEWugFf4@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218987-208809@https.bugzilla.kernel.org/>
References: <bug-218987-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218987

--- Comment #2 from Remi Pommarel (repk@triplefau.lt) ---
Created attachment 306494
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306494&action=3Dedit
Patch attempt to get devices enumerated when a SRE occurs

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

