Return-Path: <linux-usb+bounces-20033-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 869BBA26155
	for <lists+linux-usb@lfdr.de>; Mon,  3 Feb 2025 18:24:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1894D161EA6
	for <lists+linux-usb@lfdr.de>; Mon,  3 Feb 2025 17:24:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45F5D20B807;
	Mon,  3 Feb 2025 17:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CtnH0fmy"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07AE204C04
	for <linux-usb@vger.kernel.org>; Mon,  3 Feb 2025 17:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738603458; cv=none; b=cQVr3NNKWvtk8Njd4FXMccLD6oUybvVaSB5REc7z2TPeiaB7OaqXVhge6TJECCDHFJGGkE3yfoiab2NJgMOrgAWKPKB53wPRhkKWUunhC/MIlq3OkWt9UT8Z1W3CmgtgG/jShBZaL2Y9RYQyit5qMVZzGG07uXMcp36SpA4G39A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738603458; c=relaxed/simple;
	bh=1LDaQLqKSph3vz/BXzavtjy2S5ukzIPciGtU7y/sHVU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=rj4ruQF6TBco8M9ip5QwicMyPonQXU08bFVUoAEr6Qpe6fxAqHAeinCGWUsgZmKLVKczq+gnDe32XK8gf0F5McdLuFVAEClDIlcWLmzB1mBvBkL4yxvE34htj988/PluqLPMZ24Xde9fVGL3mg+VCF6pxgNf0M/fdJk/NuEHXc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CtnH0fmy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 247FCC4CED2
	for <linux-usb@vger.kernel.org>; Mon,  3 Feb 2025 17:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738603457;
	bh=1LDaQLqKSph3vz/BXzavtjy2S5ukzIPciGtU7y/sHVU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=CtnH0fmyMiy3JyKthOgX1kftG6qvKzQYjSQ+UDbX8djGZPEGMwyygnW/W+d0kj3rd
	 OkZctFF5uUrVrH7BoG46sPlufUwc191iV7iGR9Y9sDvXLvW/AnUbWLsgBJStCGtqky
	 T4E6zFKZSS7HPMhngtfKcs4nf70CIuyyxIPjdxik63hZqni1Q8lTcvGz3H535YLuTC
	 eisnzvwv3m4FkDX8EdQEZFJ8IV9YOa8saDjcA/WR7g3tMX6AKtGYC6aeLYkTVC+gt6
	 k+7a3t+lc/JW5jU186zhbycj9IOY0PKQOF6AE/WOADxFC5+sh/fS3t8+1MrLNf4NZh
	 TzRR6UngGCWEQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 1A79AC41606; Mon,  3 Feb 2025 17:24:17 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219590] Linux 6.13 ucsi driver error:
 drivers/usb/typec/ucsi/ucsi.c:1374 ucsi_reset_ppm
Date: Mon, 03 Feb 2025 17:24:16 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: guido.iodice@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219590-208809-27FjAc4AoX@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219590-208809@https.bugzilla.kernel.org/>
References: <bug-219590-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219590

--- Comment #10 from Guido (guido.iodice@gmail.com) ---
(In reply to Fedor Pchelkin from comment #7)
> Hi,
>=20
> is this warning reproducible on your system only during the initial
> startup/booting the kernel? If you then manually load/unload 'ucsi_acpi'
> module, are there any errors observed in the log?


only during boot

>=20
> Do you have something like the following in the kernel log (dmesg)? Does =
it
> happen when the WARNING occurs or when it does not occur?
>=20
> [    6.482546] ucsi_acpi USBC000:00: failed to reset PPM!
> [    6.482551] ucsi_acpi USBC000:00: error -ETIMEDOUT: PPM init failed

Yes, something similar but in the call trace

03.02.2025 18:12:39:741 WARNING CPU: 2 PID: 35 at
drivers/usb/typec/ucsi/ucsi.c:1377 ucsi_reset_ppm+0x1b4/0x1c0 [typec_ucsi]
03.02.2025 18:12:39:741 RIP     0010:ucsi_reset_ppm+0x1b4/0x1c0 [typec_ucsi]
03.02.2025 18:12:39:741         ? ucsi_reset_ppm+0x1b4/0x1c0 [typec_ucsi
231559ee5125add8a822ef3f41338af7860410e9]
03.02.2025 18:12:39:741         ? ucsi_reset_ppm+0x1b4/0x1c0 [typec_ucsi
231559ee5125add8a822ef3f41338af7860410e9]
03.02.2025 18:12:39:741         ? ucsi_reset_ppm+0x1b4/0x1c0 [typec_ucsi
231559ee5125add8a822ef3f41338af7860410e9]

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

