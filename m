Return-Path: <linux-usb+bounces-11353-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D0E7A90A2A0
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2024 04:50:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C6E4B1C203B8
	for <lists+linux-usb@lfdr.de>; Mon, 17 Jun 2024 02:50:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95F4B1CFBD;
	Mon, 17 Jun 2024 02:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mXTgBfzA"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F93379D3
	for <linux-usb@vger.kernel.org>; Mon, 17 Jun 2024 02:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718592618; cv=none; b=Yf8wZhlZQHvlfl8GWjn11y4bDCG1N4yKoAUT1nP72L8Q2d2gQhSTDJYmKGYIS8ORb8YX7pMiodQVm2ygoNhUuzo9w5HoxXEGM/f+8AT9V/e2eT67XqV5MVPPJo6ud2faxML+q2lam287Z5LjOfRMNdz/AGESYdfFzBrj0SV2Xjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718592618; c=relaxed/simple;
	bh=Ybg8/iXcGvZx/NENf2LKuYDwOS3I0rInleK5cISpcrU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PA0nxyW+Yxm1n6M/LkDCb5wXjeSh2Z35XpENs2nXYe9qfbJyh/IV76X1TqxX3DIC8uV6z9emOXQifMHOn20/u6iQDTs7LOgEBRm/Bcvool2Hyy23eKkmwRRYsJtltkZKgn+9JMzQAWyk79De3tPZAOZrQFPvny78nBlc5fhON6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mXTgBfzA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id CEAE1C32786
	for <linux-usb@vger.kernel.org>; Mon, 17 Jun 2024 02:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718592617;
	bh=Ybg8/iXcGvZx/NENf2LKuYDwOS3I0rInleK5cISpcrU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=mXTgBfzAg7q0qZT6cRBWYmj1jSSql9u2umpf5s3R86D/HrSbrT+MBLnaAT1odJKiG
	 V5+ANNfBl6J216aOWabWz0MvJ9/H0d2WE2aP5enGJsA4l29AE8dH1crQniCc7LJ6xm
	 fUkKsiIx9wdvp6l3g7hq3if8PSSEkm3LwgH//N9XqQqsMmNUYdhHTfTzIlAVP/Wwvh
	 2IMNuPcIJDV05yqX+sLVf/Lea1y255X4kv8c34uzG2r4osQbbarTCNPfCJ6ZZkqw58
	 ZZOgte3xMpVflEybuxvHqnPvYZ8FoF2jWAgE16pUH1QNWcnkzEvq8ZWK6s/wYxg+GK
	 p+xqiqoYtDMYQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B2BAAC433E5; Mon, 17 Jun 2024 02:50:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218943] No SuperSpeedPlus on AM4/5 Hubs
Date: Mon, 17 Jun 2024 02:50:17 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: jarrard@proton.me
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218943-208809-NyzJZIy7nb@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218943-208809@https.bugzilla.kernel.org/>
References: <bug-218943-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218943

--- Comment #26 from Jarrard (jarrard@proton.me) ---
AverMedia said they won't be fixing this for Linux.=20=20

So until a exception flag can be compiled into these USB speed checks for t=
his
device. Its stuck at 5Gbps.=20=20

Wish I was a Kernel code-master, probably fixable within a day for myself.=
=20

Thanks for help none the less. The OBS server will remain on Win10. (I have
dual boot in case miracle happens and this issue is resolved)

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

