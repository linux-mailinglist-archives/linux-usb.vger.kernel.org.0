Return-Path: <linux-usb+bounces-9879-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B5FB08B543F
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 11:28:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 71AFE28324D
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2024 09:28:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97AC623746;
	Mon, 29 Apr 2024 09:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fDo0WxYp"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 239E0171C8
	for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 09:27:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714382876; cv=none; b=eKO0gNvx7swUnRIK/Q9Y9iHZEd40Wq6bBNpfPhuUmawjwJ/jallVXJo3R5Xq7/AWCC/YraF929eWYdFWD8T8tVHYR1pPENWL2n1emSqzI1+PGgzVHbhazd1U2qdVHnc1CnTDcCB65hQqt4PlXtAj1s5kLzRvaLDQ7uoMCuhCi30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714382876; c=relaxed/simple;
	bh=Pm3HwzHqh5gIo2Ghg37HyvRbvrT/95O444sivYBcEto=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Eq1d2hKqFczdZ3dhttCCCJDeFMWssg5tqW/Wg/Py3lBGc7vST1+evD2wVXILwP4Lv68v873teT85+v7JFlXStkhf7busAW+FmS56fYcWZK/6T/sYIkdU2305/NldMOm0xdeagXnZ5MC10dVM88c6c/efpodMn4LwW3A9G6HaLAY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fDo0WxYp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 90FF9C4AF18
	for <linux-usb@vger.kernel.org>; Mon, 29 Apr 2024 09:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714382875;
	bh=Pm3HwzHqh5gIo2Ghg37HyvRbvrT/95O444sivYBcEto=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=fDo0WxYp+7CLVBpCp4qpJj17hAot80louMO2Na2/Vhp1VW01nvwFtrKBT9BGR3qA3
	 5WHWd12x+RSTc9UsoxlTsy6NxOiulknIBcocx74A5qzPon+OYQ6QzQ079X+lCUfBuf
	 v9690VnNgxiqSkpLUaUjn4NkmonGe0Z76E4vFrF10Tv4P4HbZTTt3i2nLFRp04gGeh
	 hpgHx4ILLlMAzUFWsN9VIs/oNREvZ0JUb2f89lTbZUY8gDqURl+GtWhm14/hGBycK0
	 oKTSs0jcSM106zhAoUAkjS+UyaEUjnGDHq2swVqMrJJDQTe//J5hq0x+ElVfhFQ3/z
	 VOqLNLPsOKg+w==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 88822C16A72; Mon, 29 Apr 2024 09:27:55 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218789] ucsi_acpi USBC000:00: ucsi_acpi_dsm: failed to evaluate
 _DSM 2 in logs
Date: Mon, 29 Apr 2024 09:27:55 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: webcapcha@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218789-208809-xcurgcJZTg@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218789-208809@https.bugzilla.kernel.org/>
References: <bug-218789-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218789

--- Comment #2 from webcapcha@gmail.com ---
Created attachment 306238
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306238&action=3Dedit
system-info

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

