Return-Path: <linux-usb+bounces-22995-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E0EA8692C
	for <lists+linux-usb@lfdr.de>; Sat, 12 Apr 2025 01:31:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F01418952B9
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 23:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAF4A283686;
	Fri, 11 Apr 2025 23:31:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iFY/LRVY"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53CBE1EFF9F
	for <linux-usb@vger.kernel.org>; Fri, 11 Apr 2025 23:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744414268; cv=none; b=P0lEE69E2Cd7DSDs/S5jYS+P0/CKhFqS1nc2I4+4Bzff1UkUPyhCE34ALDNjvNLQtHIRysTcA9lRHbSwsJcspMpUqmAUdcWitNk3r7fh7eNIuGZs3+QhV+gT4LNyOTDNXYp/KR3IQYiDNMR+xGSgOvmfdfkbP9SKob+f2v8NQFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744414268; c=relaxed/simple;
	bh=on0l0G5c2Fc5PXB2eLKR2pWhp45DU58L13uai8vZLno=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=L5P9WoYHDeNWh/MtLEIZ/KC9nTxbSL+EZX5WazqNPj7RLFTxyfqM1JDhWHXqSSV+asjhaTo1WQn2lCjGuZmQZL0m8E2CB4/PJHEDpW0Q8iSdLXn2YgjT4A+pEeIfgzJjNZuwxoN93hq/BgMOcdZZmKu4CRGRQWbONobUX/LlMLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iFY/LRVY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C368AC4CEE5
	for <linux-usb@vger.kernel.org>; Fri, 11 Apr 2025 23:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744414267;
	bh=on0l0G5c2Fc5PXB2eLKR2pWhp45DU58L13uai8vZLno=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=iFY/LRVY2n67anTCVaNZN5qd0n6oiLJ+nzkR8qBr0Hlw/tHbB/JNZR7B6ZMNxktxV
	 sZxjhUaJfDUb0AuueamBU9Z76s/FXhQl9iGwyWOa6qZB//cKyGmAOXY1MBchNPYKFh
	 K6ODHS6wXMxSt1xILGdixcB1LBkpG8S/JYSk5Rf4VJMqEMEG/50slSBGAMfJcLnMB6
	 ZGeTWM2XAhYdrQ695bm15u5acb1+jN92MboLSpETF3YmkhjGdG0E23kMAlpJll8PXz
	 MwpiL/Jx/Pma3DsrJpUFjaRsPfMdJ0i+L9nnABrrKb+FMR89m/+7fNPr3AdQ8IPMY9
	 ewr04dKtqu1jQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B42ACC41614; Fri, 11 Apr 2025 23:31:07 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220002] USB tethering fails with rndis_host on 6.14.2
Date: Fri, 11 Apr 2025 23:31:07 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: aminvandh@gmail.com
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: CODE_FIX
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_status resolution
Message-ID: <bug-220002-208809-71aKkCS1LD@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220002-208809@https.bugzilla.kernel.org/>
References: <bug-220002-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220002

hooman (aminvandh@gmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
             Status|NEW                         |RESOLVED
         Resolution|---                         |CODE_FIX

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

