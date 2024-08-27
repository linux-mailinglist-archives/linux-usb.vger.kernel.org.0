Return-Path: <linux-usb+bounces-14183-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F8A7961313
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 17:41:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 51DD81C20AED
	for <lists+linux-usb@lfdr.de>; Tue, 27 Aug 2024 15:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E422C1C93A0;
	Tue, 27 Aug 2024 15:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C6KlDiBv"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E27D1C8FC4
	for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2024 15:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724773298; cv=none; b=soOrYoCabCWxRrk16CmqcV9b7y3Fs+vbElZJJ8lcl9i8i9iEYU7l0/Lb0SdHfv7q1bwsnXsL0qfmXpEIwQRvTXXc0f8ge+G5PB3lmR4rJbHpzk4EtOShYhaul8oRVsIKc17uBrzNJ3sznUKqxxxexPwqdERURJaQtdmenQFRFTE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724773298; c=relaxed/simple;
	bh=Lq3NQPL5F0si+O7b08hhyFnr9tj1zm+wBXEtZFPB46A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=npXxV43W8VuyCrrTl56weFll+11/NRo3gybTv/k+7UEt5B1E+U0RP50WkmBrqFdl3ZJyRV44nxvV89Zy/SW1hAObOV5J4nZo4URaK4TaFIEXUPYNf8OEvVzBiaxZOYBBXIr7G/41Fos2FbmbBQSZrlUmmOugaEUc7F+UA4Vr9uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C6KlDiBv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0BB68C4AF18
	for <linux-usb@vger.kernel.org>; Tue, 27 Aug 2024 15:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724773298;
	bh=Lq3NQPL5F0si+O7b08hhyFnr9tj1zm+wBXEtZFPB46A=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=C6KlDiBvPlGOfCNxN3YH+RE+wNO5UWXf1EPjfTt9To+tzAta8/K/m5oNl6/uWkrR4
	 Wm+r8qW989rOdTtsSkCpW8J+YJjXBFEptBnGdSUxFjRWbCEVrFLCQw2cFd0LoE8qLe
	 kPuwCOZyoYWXSvuQaOcX8k2Pq5OhoCOsM3PKiLVzrzEFVOrWQ5jsAfOvEekXQJYFLQ
	 gfRtMoesNI3jf7PV+Wo64qQEs9q+6KvNtQ9MUPV2bson94LDTgIJGH+VSuh1hMPoML
	 XJKVRl/aJlsb8W7aKQ4LuEGoaQbagOV3eJjVKPnqUMHAPa9EgeuBs976NMm2pFwBIV
	 sIDYRMoIFr1nA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E7CCEC53B73; Tue, 27 Aug 2024 15:41:37 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219198] usb on Dell WD19TB Thunderbolt Dock stop working
Date: Tue, 27 Aug 2024 15:41:37 +0000
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
Message-ID: <bug-219198-208809-TFSQ1U1o16@https.bugzilla.kernel.org/>
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

--- Comment #12 from Adam Williamson (adamw@happyassassin.net) ---
I would guess the thing to focus on here is the "big set of USB and Thunder=
bolt
changes for 6.11-rc1" - commit 04d17331ca33744e1426fdeee7ba5e975c4b2239 in
Linus' tree . It had 112 commits.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

