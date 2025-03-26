Return-Path: <linux-usb+bounces-22163-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EBB5CA7132C
	for <lists+linux-usb@lfdr.de>; Wed, 26 Mar 2025 09:56:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8099C17329C
	for <lists+linux-usb@lfdr.de>; Wed, 26 Mar 2025 08:56:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E9AD1A4F21;
	Wed, 26 Mar 2025 08:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JE+3bNeB"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C2227456
	for <linux-usb@vger.kernel.org>; Wed, 26 Mar 2025 08:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742979414; cv=none; b=Ag9GeII98ABms9sbCGN7H2rrp/zKLFgxsENMhQE8JZlPI1Ai0m33p2Be5OpwezTu4vpHykFnPEqQeYdeh2KD0TWyEn4A9v59EC3ZywFCLf6vvDaOka6MtUkjj+rQ4StdUz6IVGVtydbEjtLHQYfq4y+vnx1dAZndud9mJWPOW1M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742979414; c=relaxed/simple;
	bh=ExY5VAot4hQlRkN3JoHFS2Nor6iF02PUZBN3jefCk5E=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=QO5pDTwXd9a4PKkaFbr0MEYN74QhoA/jab7TZ67G+mR2e9P8Yi3DBVkWzpmWdHrEgU0Kyu1hpgmJzQTocon2JiP/Hmli0frGLTwxYh7RHy6VnMsRn/1T8RjM2DcTX2eM9BgqxyheahNN0x73DS77oWcFUSL7263OEAWMss7WYYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JE+3bNeB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 90163C4CEE2
	for <linux-usb@vger.kernel.org>; Wed, 26 Mar 2025 08:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742979412;
	bh=ExY5VAot4hQlRkN3JoHFS2Nor6iF02PUZBN3jefCk5E=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=JE+3bNeBN5c3tkhBWMQ1ujRPaxNHgJKezA6XnE6BHMGNwVymlN/E0mdT+xI68frzo
	 O85YYO6b3GmxcVd8tpHZZ1JPJcwj0oNB31jow/5qCP01lZR6xUTiQi7JdB5j0m/u2a
	 WSBDghg6sRa6gp3E4oCS1jIxrlRhWr6/uDZbF7UP30diae3Q/Tk3WjK+XjrpWHlmrx
	 dIEqlTNTYKeV8PqJjyIzoShgVz0ampX+9gGl1/9/OTyBoWwJjaH2kWxVaLmeA2dYGQ
	 +pcAyGdWEx+0Ngm4pEwKGOBAdlpO/ZY06J86+A+YMvN9+TyS71nV36Qetu1OtR7Kd8
	 8q6hjN2r9GDrw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 87BD0C4160E; Wed, 26 Mar 2025 08:56:52 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219924] xhci_hcd TRB DMA error and device lockup with AKLOT 2i2
 USB audio interface
Date: Wed, 26 Mar 2025 08:56:52 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: michal.pecio@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219924-208809-EUrZXry4Ge@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219924-208809@https.bugzilla.kernel.org/>
References: <bug-219924-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219924

--- Comment #2 from Micha=C5=82 Pecio (michal.pecio@gmail.com) ---
Either that, or it's possibly related to
https://bugzilla.kernel.org/show_bug.cgi?id=3D218695

where IIRC some Intel controller was executing (or at least signaling
completion of) isochronous OUT transfers twice per transfer after device
disconnection.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

