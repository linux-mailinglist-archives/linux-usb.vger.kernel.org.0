Return-Path: <linux-usb+bounces-14253-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 215D89630DF
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2024 21:19:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD8782818BD
	for <lists+linux-usb@lfdr.de>; Wed, 28 Aug 2024 19:19:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6A441A7AF6;
	Wed, 28 Aug 2024 19:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T+O7+9E3"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE512868B
	for <linux-usb@vger.kernel.org>; Wed, 28 Aug 2024 19:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724872766; cv=none; b=f3Ssj6WoIoJ4c+FF6fL8Zc/YlFA7QGbEB99+mr4OHgErUKSFXEdEKfAxQNlaACRHd8uTo5T4gaTfBOKTCFRvIe8Kam0klBScA2bb+MPvLggWUmzcFHyrp81yItFpMOpzh+kR2idDFbHa4t+onELr9/+22Ew2knSl9mSlxZjlIOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724872766; c=relaxed/simple;
	bh=vcBb7c8I0/GdOpoYCTMjeRg8N8pr6xEiXrOOLfybB+Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=axSjqlfveUeSXpk/WEZw4mqpUopboNE1fiLTb7acrvx2tPMjr3yGRMNQoCFm9/zyDT6fhhzNBbWSuCcIspwq0brFCcbmZk7ZtQmzUAGLLxi5qFz0WeedfmaKmclejYQPLBtrrF+DkJ6MFO+IV3Qi0sRNgX6B0kZVqcPGlnDs0uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T+O7+9E3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0A07DC4CEC1
	for <linux-usb@vger.kernel.org>; Wed, 28 Aug 2024 19:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724872766;
	bh=vcBb7c8I0/GdOpoYCTMjeRg8N8pr6xEiXrOOLfybB+Q=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=T+O7+9E3ucs8pcftMW+K5JyfgexMzj6+XvDRqtWopYxcdL6BSm6UDg3kW/V8HlOYi
	 VtjlKCNwQOE74c3hg26WyW9koZBqkjIGyYKtY8fiwMrqq14kdqGS3el8Sye6yGZwCC
	 s81+o9K83AXW+NrjHFLmvhwSzeuiLztx797s36jgtJlCNsFtNCNLstFsosNVrdL5Kz
	 o7GYc7FBCCWfrfn1o14Ych8BtJ599fDRTbe7x77AWVFGRkAkSw+Ci3v5APbRn3ZS/d
	 7V8qkd4Eo4/qz4KSlaDO4Xs+8aZr2TYf4q5Db//V+m2p+7Je2CRxv08LdXePkFnXTL
	 MgNNsV3CTO7GQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 021C7C53BB9; Wed, 28 Aug 2024 19:19:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219198] usb on Dell WD19TB Thunderbolt Dock stop working
Date: Wed, 28 Aug 2024 19:19:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: adamw@happyassassin.net
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219198-208809-thf3KGjkwK@https.bugzilla.kernel.org/>
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

--- Comment #25 from Adam Williamson (adamw@happyassassin.net) ---
OK, I would say that kinda seems like a different bug then.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

