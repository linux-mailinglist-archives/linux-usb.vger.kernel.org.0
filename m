Return-Path: <linux-usb+bounces-6412-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CE470855068
	for <lists+linux-usb@lfdr.de>; Wed, 14 Feb 2024 18:34:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0719D1C2095F
	for <lists+linux-usb@lfdr.de>; Wed, 14 Feb 2024 17:34:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 15AA960DCA;
	Wed, 14 Feb 2024 17:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AqKtWH7F"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9512E5D732
	for <linux-usb@vger.kernel.org>; Wed, 14 Feb 2024 17:34:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707932044; cv=none; b=VdrW/t4CCCi9s+PV1EGaBmT5IcYMmXirhGSaU6u3C3pO5RqikCWA0/mJMSzVHh7sGj+eDpCqe+DLdTntenXRm/qN9s6tLX3GXVfAjhquygkVwAMRqGjKuKgAyYNrW8PoKXhvEabVnicGdiL3Oa/A0B8TEELTtat8U8FUg+nywSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707932044; c=relaxed/simple;
	bh=htOeZhNO3wS8tf4aAl6NI0kwYRNIl9MnoBziPADZM5g=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=S7PwmiTh/JxQeOzBPGAKYxCplwVGrfPP4bjvaQN1zshMBEZFyxwkqGi3ywCDz2wizd9ipZnr12bWyRSznz8LAMqbuPiZrP5ThlpNtmUY/AYECXqZCD+7or6/hCHN4SYlNLAxPRQhM3qYb5XtZz+aXFA4dpzsGZEkOicdBx8klFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AqKtWH7F; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 1A2D8C433C7
	for <linux-usb@vger.kernel.org>; Wed, 14 Feb 2024 17:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707932044;
	bh=htOeZhNO3wS8tf4aAl6NI0kwYRNIl9MnoBziPADZM5g=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=AqKtWH7FKlqDHs0PIfZ8qMAM2OR4CWtgZ65ESo4rGPZuZM0QgJjpTgSXj1IIOVRP5
	 6bnpvo+3u+2EkWvbzzfq/3XPUQoRo3ut0kfJmm9/rEBsaf6ycfPSkO8cRVGveZi7GX
	 +GCNUA/nFknVfmrYjiiqvGisNdSsBn4+4oB+ukzPszYbFIzRg+3g/LaIy09TaQaloM
	 J3Rf1KhupG+J+N0w8Vp+z3etiHOAtOehwEiAu+uLHJqPLtKryUzXUR0Q0HFV5Wo1Y7
	 Z1ylXfVN0x8EUeVHyZAJxbtbV8GAOwJQaddDPSh8dz0pDydqhIPRo/FskPxDNsevPG
	 DWK8Ro9kpf2rA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 070CAC4332E; Wed, 14 Feb 2024 17:34:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218495] NKRO does not work on Mistel MD770 (Holtek
 Semiconductor, Inc. USB-HID Keyboard)
Date: Wed, 14 Feb 2024 17:34:03 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: ishitatsuyuki@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218495-208809-RXo73Dx3iV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218495-208809@https.bugzilla.kernel.org/>
References: <bug-218495-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218495

--- Comment #1 from Tatsuyuki Ishi (ishitatsuyuki@gmail.com) ---
Created attachment 305873
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305873&action=3Dedit
lsusb description of the device

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

