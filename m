Return-Path: <linux-usb+bounces-23536-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E184A9FCBA
	for <lists+linux-usb@lfdr.de>; Tue, 29 Apr 2025 00:04:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 842F2171F06
	for <lists+linux-usb@lfdr.de>; Mon, 28 Apr 2025 22:04:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F90F20E031;
	Mon, 28 Apr 2025 22:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XLK/KHXT"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04BF41F4199
	for <linux-usb@vger.kernel.org>; Mon, 28 Apr 2025 22:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745877847; cv=none; b=DGcss+WE50fgM1HVxx5qvHldH4FQtSFNAXRMHagAvuv7eqlTz+YQass+nQmWVOU65asti+tN0OQcyllUYwqm4pJVSeqWqqnAZagiKySNP8Nl9PYFmU4/6nPVrVMNuIof0KKtYNZht54QUsdWeeMUZoqcFNNE5I0XqPjYPsKuKC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745877847; c=relaxed/simple;
	bh=08Ih18B+H9alks+wRMyi7A+go5s0XuQm8+pd+dAFxMo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=C1Yv60+1DOhn7NcWdUj0SJSkiKY9QjeVfJsUdYbNr4IObbx1Y7BSuFv1ovmUeAw1LK0TidsiGbSQuYgJd3vzUVfv+46teH8wxQIjztq6SrEuqf1Z4PAinItykZL+gbOfCYLlA3VnXBQJ4kJWI/DWiz2kFgGzoSO72IKzsf3rl/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XLK/KHXT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 83EB3C4CEE4
	for <linux-usb@vger.kernel.org>; Mon, 28 Apr 2025 22:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745877845;
	bh=08Ih18B+H9alks+wRMyi7A+go5s0XuQm8+pd+dAFxMo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XLK/KHXTE5jzuSHE0Ardzz8jrFRPYm8alPrr/8ojx7DETJiKBOe1fSAmDEBSeQvqP
	 jWYwxvJ5nXnS2q0AHuotU9mZLmLRwV5zZkCPTfI34CJxVyJcoT7V17ubS8jofDP26G
	 5SU+ef9WNPBfgtsnbyEfiEUIDmp27H1YyDN9jVj/yRXU8+4t0RCrgG86xnVH2cu4Iq
	 Eg5kSSkKtDJwnyD4T5snQlRTfwbSzUieIcnl/bBs2njn0Xbgj+mMrCfWQCMp2/C0C9
	 rGZy49Jbrs6BUZ0BR/AUz38MqFy0X3iSvlnH2pcKoQFR4mDocuhogAEgcLj6hR5505
	 0VCJj17GJfI4w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 704D5C433E1; Mon, 28 Apr 2025 22:04:05 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 213771] ch341 USB-Serial converter receives but does not send
Date: Mon, 28 Apr 2025 22:04:05 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: luzemario@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-213771-208809-9sPVvshUtM@https.bugzilla.kernel.org/>
In-Reply-To: <bug-213771-208809@https.bugzilla.kernel.org/>
References: <bug-213771-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D213771

--- Comment #9 from Luzemario (luzemario@gmail.com) ---
This issue appears to be FIXED with Kernel 6.1.0-17. It works for me.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

