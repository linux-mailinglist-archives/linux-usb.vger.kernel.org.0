Return-Path: <linux-usb+bounces-19697-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB50A1B835
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jan 2025 15:53:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B0A29168006
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jan 2025 14:53:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C67CA142E6F;
	Fri, 24 Jan 2025 14:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aXi1tvai"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3E83C0B
	for <linux-usb@vger.kernel.org>; Fri, 24 Jan 2025 14:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737730413; cv=none; b=BP49wIFkhf6jUq8OoExKOiwRZ4C8AnIhfTkfc045NLwsWx6uTQ4O1ODrp+/aWI5tUQG2A528sLQVAeDiG+O0HRsL5W+/pZJdaXb+xm+GSBk2nVw+T9TnRDnjk+btif6JgaklMtTzedWkwVJZV8nL7oBnHeOcJ8PcvTsn5EN59dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737730413; c=relaxed/simple;
	bh=YnVE61C02X3jNpFnDUhrmXP95L7XcXpO5FlCecGZN8E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Imevr1hK1U3P7l9fqLRK5b59LVTpEFg1wSY36T2PH3NZ4HA9p9L7r2HsEhbrKnYdeJqD4m5EMjzvjgSvQc3YzJk812go7Q0Q2zoQI8FM5li4DbsDSabgo8QWgZ7XeJvLbwsxEQvYn7QnUO4cYGr8Q0Awcq9iltZmjeGowEu97bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aXi1tvai; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B3840C4CEE3
	for <linux-usb@vger.kernel.org>; Fri, 24 Jan 2025 14:53:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737730411;
	bh=YnVE61C02X3jNpFnDUhrmXP95L7XcXpO5FlCecGZN8E=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=aXi1tvaiQGvAiQu+EjOifqgBW07bKZiTjkXQInw8vBJf8l8MqlKvKIAmedkKj+USL
	 uaV1SnjYj6aWxLdgjmdET/lPoB0Si7FGJ+2E/gW0dzWc24bUeiGo+Wy+LWdnS9oMbi
	 oIcKprLtYeoHhxbn+K/mtcYL7ClH1Y66judTuYFhp3elD9lfIHo052ECD0AO391Dsl
	 TK0CCtZUOcitOq8JV1p5QZSu614hGWLmkLjz92S8upYiH807WOcKwaKY2z4I78brPh
	 VWyLMj/UrDzcI+UJbsVt5nc1BtnvONM1+/sSEDWnIQwqKMQsBqJZXhhvp/6rY1eUKI
	 5ol5ehF5jCVQQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A74C2C3279E; Fri, 24 Jan 2025 14:53:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215906] DMAR fault when connected usb hub (xhci_hcd)
Date: Fri, 24 Jan 2025 14:53:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rolf.reintjes@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-215906-208809-yRYfLqFTCH@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215906-208809@https.bugzilla.kernel.org/>
References: <bug-215906-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215906

Rolf Reintjes (rolf.reintjes@web.de) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |rolf.reintjes@web.de

--- Comment #28 from Rolf Reintjes (rolf.reintjes@web.de) ---
(In reply to Micha=C5=82 Pecio from comment #26)
I have a new E-Mail-account.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

