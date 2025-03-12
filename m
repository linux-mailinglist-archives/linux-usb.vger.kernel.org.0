Return-Path: <linux-usb+bounces-21680-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA232A5D97F
	for <lists+linux-usb@lfdr.de>; Wed, 12 Mar 2025 10:33:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 578643B44BE
	for <lists+linux-usb@lfdr.de>; Wed, 12 Mar 2025 09:33:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53C6523A997;
	Wed, 12 Mar 2025 09:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A53oAZnK"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3D823278D
	for <linux-usb@vger.kernel.org>; Wed, 12 Mar 2025 09:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741772011; cv=none; b=NPn0ctHv5Vyq07CmO5eUdMQwWDLLQPy/HydUfsgUGtWUqqmJxy7rwt5hndO9H3hpYeTXJxdnfa3AK99pTn9GvmDxNiVhVCkWugwzi6N0+f45whb5wnykbs7LZgEKBD32twlnJOYXssjW1exRN4s1pVOLZtMoGkv8n7hne9+VTo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741772011; c=relaxed/simple;
	bh=Z08dWdOAg9tKAgpeV3Wvl8xfDlaRRkJ6nKtHr2O0aL0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=K196MxpuectXKo9r8rySQy8seiBJgEb54ZzgvM5s3bwibWAO3oRdiMVHgY674Yurf1BwaeR1Gm9GDGLCkg6yxcvyC25fBbA+9g/wjjp04EW5WiDPVlKhv8tomPQqypHhwh/OGpjQ5fliw1g8E//utsau3xSOHA0U5qbSEDdD4DM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A53oAZnK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1B6FEC4CEEC
	for <linux-usb@vger.kernel.org>; Wed, 12 Mar 2025 09:33:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741772011;
	bh=Z08dWdOAg9tKAgpeV3Wvl8xfDlaRRkJ6nKtHr2O0aL0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=A53oAZnKn0teU+U/Be4u1LcDe3sZMJzB86ev5/Hx7helnLK1LM8kdOJYF+XzfcI/u
	 wTgCg0nnSlkUMECmuenrLKm3NOCP2GrWTXoKl6/w3ztlnFfbZPjGc+FmeFM2xWISr/
	 B8JU+MWQUN5UUz9BAci28AYrYK5pEm8fuXkeSA/zqGum9iiP2PYG9ALse6BZaFtAzK
	 Qq6+PljKJAdaz1fLKdKjMEddtrlbjEpucKbBE93VQWPVtU4A8KdbpzHl+Z82zv3VPI
	 MGLrJDJacuUP4jvC2TkCDheE0m0pNaMjKc3/SBYJ92jDL3h1WBRuHGnarpHgnMFbRQ
	 eanBxx/QyDzKw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 0D3D0C41614; Wed, 12 Mar 2025 09:33:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219748] Pluggable UD-4VPD dock appears to continually reset
 with AMD AI 365
Date: Wed, 12 Mar 2025 09:33:30 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mika.westerberg@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219748-208809-IMmeEiD59Y@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219748-208809@https.bugzilla.kernel.org/>
References: <bug-219748-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219748

--- Comment #34 from Mika Westerberg (mika.westerberg@linux.intel.com) ---
Just sent the patch upstream:

https://lore.kernel.org/linux-usb/20250312092603.3666723-1-mika.westerberg@=
linux.intel.com/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

