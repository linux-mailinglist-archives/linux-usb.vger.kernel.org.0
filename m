Return-Path: <linux-usb+bounces-23538-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E84FA9FD50
	for <lists+linux-usb@lfdr.de>; Tue, 29 Apr 2025 00:51:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3F9F33B2515
	for <lists+linux-usb@lfdr.de>; Mon, 28 Apr 2025 22:51:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6DCE2144A4;
	Mon, 28 Apr 2025 22:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HSby488+"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6BF214222
	for <linux-usb@vger.kernel.org>; Mon, 28 Apr 2025 22:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745880683; cv=none; b=VZHZgFsVygkRBVtESlBvMKWqhAv3QpU/wvDhebuVGovnuJO+HBOX3pJlCPs1kPxeEnPljvP2HAEsrPi8WOcoElMCa/7yn0fsr4Aff994IIl1q78IE7KT/LVVjdptyzWbU0Y3GJhg9VSiRsmhxSE3oe/s/46lMc5d0ItHAOD7PKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745880683; c=relaxed/simple;
	bh=a8vlbBWO1IBXBrv3Jpm9HT7R1OcscnEIAxL80AaCPyU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=D8gd9GY+3UYaIAuPk3BujAS8BG2BUbR4gHEVQ2OHrPFWXFl00mCWts6P9YjYd2Tm2KQ8Kxkd3WfCLAZu8bfq2yKbPWAwa6hpWV3AGiQnppL7OGpDO6HZVU1TEfi86sBbjbujxh0bZ9ndbywpir7WTY+bY0WwKEA6o2ZnqJH6Clc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HSby488+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 43BFCC4CEEA
	for <linux-usb@vger.kernel.org>; Mon, 28 Apr 2025 22:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745880683;
	bh=a8vlbBWO1IBXBrv3Jpm9HT7R1OcscnEIAxL80AaCPyU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=HSby488+aF+8TsmGTabUEP/DNGUUnDFRbuAAseThAgJZ9orQp/3BXOlNPZFGklBvE
	 uniacO7vsYzKPiCXNylWxyhEw6tzovaBApXBABhswL5ulrkod373uJphvJtrI1GpOe
	 YCBb3USeJPtlxU0859xpnCNXygJx822koXiDN0rprbcq3LcFyDmgqP5+F83oc2MoTc
	 XOhcgefHJudUkiLPwCSvEtuARfjF6H49eXlpvnZZa+HED1GE8X/BzvmawmLcLvLEip
	 a2WHXCKi/GrtOdJJfVq3dqhyUC8fpiAnqO7ZHAnF7+3uiZ65nW47yNYa3LuxSNdJqv
	 eDcgaHI1OcpEg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 329EAC4160E; Mon, 28 Apr 2025 22:51:23 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 213771] ch341 USB-Serial converter receives but does not send
Date: Mon, 28 Apr 2025 22:51:23 +0000
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
Message-ID: <bug-213771-208809-WwKg84bkR8@https.bugzilla.kernel.org/>
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

--- Comment #11 from Luzemario (luzemario@gmail.com) ---
Linux 6.8.0-57 (Linux Mint 22) did it work too.

This bug can be closed.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

