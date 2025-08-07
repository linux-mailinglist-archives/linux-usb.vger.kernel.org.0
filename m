Return-Path: <linux-usb+bounces-26590-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB6FB1DB49
	for <lists+linux-usb@lfdr.de>; Thu,  7 Aug 2025 18:04:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1A5BD7A1B11
	for <lists+linux-usb@lfdr.de>; Thu,  7 Aug 2025 16:03:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 451E126D4C0;
	Thu,  7 Aug 2025 16:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pZNjqwJl"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91D726CE14
	for <linux-usb@vger.kernel.org>; Thu,  7 Aug 2025 16:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754582675; cv=none; b=IM8Nv0f1S/yxplcuu1imglhvnseqNxAJD/qvuinoi3gyrislfvJyJupRmHpDavpzi1B0cFtTTQ9BCOpN/2YCJ4bP8/vAcO2Gm+BDVQH+3uN0f4XXtOV/QbY5Bl6szKBm0nVdUvGZILh8eViUzoZONk3rWBfbcPTBIVXizorfUCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754582675; c=relaxed/simple;
	bh=/BbNXS6spj4upBCr/GqdInSwNvPo2KT+w1TO5Tq17UI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=utrmVhhWIqox6f6cddYqHu2XP+i2AuKppDTRhembYuxtderLd/VI7goUJECvznusHfwVV790TUgX8RfmyIHCsWQBXoGiFbYsR01HVpmDrUeqia52FiSBIbF+zLCsQ/l9chHYZhcVoLiPfXpLuOH57AZf/mq1Ubl6JBAv5Je0KRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pZNjqwJl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 787CDC4CEF1
	for <linux-usb@vger.kernel.org>; Thu,  7 Aug 2025 16:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754582675;
	bh=/BbNXS6spj4upBCr/GqdInSwNvPo2KT+w1TO5Tq17UI=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=pZNjqwJlxzTSKt4XZ15s03Gh3L4TzxsYShbZuTB7m/84s1PVmsR5ttu7gU4ynwgld
	 tmZImqFLif1k2Ivgu7dWnq1c6ykWxBXSjvrPUQry1WUZenuEsxWT+v3wrpByidqSK3
	 Yd36y7YgvB8XsPzM5oF3LAvE0zreO86QOBwipHphupJLwQh1yiDAYPridYn1r6Ma6V
	 tC6oAHm4VhjU5tCFXWMfCwqi+XR6HT4dOVO0MV7tQ4cXQGmTxv+We/RHKBJuuhuBtz
	 H0/UyK461zTHRrBI8/3abzhf7f09aDEChU4WHzOBg/xJ+CpS0iyUgj2J44tvLFjnP+
	 bsdUxAfIYpdwA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6A75FC3279F; Thu,  7 Aug 2025 16:04:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220422] USB: Misdecoded serial number from Dymo Twin Turbo
 (0922:0018) breaks multi-device support in CUPS
Date: Thu, 07 Aug 2025 16:04:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gregkh@linuxfoundation.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220422-208809-SssOj4s7hT@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220422-208809@https.bugzilla.kernel.org/>
References: <bug-220422-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220422

--- Comment #2 from gregkh@linuxfoundation.org ---
On Thu, Aug 07, 2025 at 01:46:44AM +0000, bugzilla-daemon@kernel.org wrote:
> **Expected Behavior:**
> The kernel should decode USB string descriptors defensively, including
> recovery
> from common misalignment issues in UTF-16LE encoding. Devices that return
> malformed descriptors should still expose unique serial numbers if the raw
> data
> permits recovery.

The device should be fixed instead, how did this device pass the USB-IF
testing framework?

thanks,

greg k-h

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

