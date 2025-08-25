Return-Path: <linux-usb+bounces-27238-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BE1B33A7F
	for <lists+linux-usb@lfdr.de>; Mon, 25 Aug 2025 11:18:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7684B3A1EB5
	for <lists+linux-usb@lfdr.de>; Mon, 25 Aug 2025 09:17:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC13C2D12EB;
	Mon, 25 Aug 2025 09:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bbmRBFem"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40ACD2D12E0
	for <linux-usb@vger.kernel.org>; Mon, 25 Aug 2025 09:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756113361; cv=none; b=PT2UEuBrTBWn3aK4LP4WtHiRMgdT/zvb21EjNI7X9gBJ6o6NgGbpTtYYZy13eFdDBN5wG3qauyOeH4TDpakvJAVX8+gpLqTa9+/0RzpLwL6iRlaOqDshOsA6VXpImb2DxkP+di9mjytlKV6/AdVtgXG8sASuMH6gYLIULuV0kBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756113361; c=relaxed/simple;
	bh=NiJRK31pPVn1JmmLSzv1SuUflk4DEfS6cGO02Dn97ZA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jmGD3kBPCVnOYjbIlquaXKX2WQXmCYqZTUy8gsHc2TUAxM9KNAS36TjUklRzbiz1grhRkG1OJAJ5/Qp4tLyBAmrcUt+Xu54/m8FVjXgWIRcKGSELItzY8J/GaEPO3ZXTdbmM5s+ib+l1WhqPBF+v9C1c1YpsVg06Sh3nQog45Ow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bbmRBFem; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A2C31C19423
	for <linux-usb@vger.kernel.org>; Mon, 25 Aug 2025 09:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756113360;
	bh=NiJRK31pPVn1JmmLSzv1SuUflk4DEfS6cGO02Dn97ZA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=bbmRBFemy2uvU6TxztD78palZpUEqsKjYf4tco3OcdoOliArHA6k1exolGDSnLekz
	 orz+hUi6FCTnvGcCD/XONaoKEq9MS1H61FgR0AmKWfo1JvDRucA95mTPONNJ01j2Bv
	 Xbh+vvYEVk7sYtB1KmQtuTj1kdBgqYyooTdC9U2zmg4RgqoCflUkpQ/P0ixmEdqIpQ
	 pEvQVkVELe/Hbc0knu1ksD1RPhY2YhPhYSYGBDJhBUBLoeaXs7svV4tRfRaRrqV91d
	 os87e+bOxjQlyg+oPOXF8rgP06OTdDoYgLGzgjRRtZhF43cizRzM+NWWLaYCGg7+OU
	 2R95oFZFflwqw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 91B2AC3279F; Mon, 25 Aug 2025 09:16:00 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220460] Plugging USB-C adapter into one port results in `Failed
 to set U2 timeout to 0x3f,error code -110`
Date: Mon, 25 Aug 2025 09:16:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pmenzel+bugzilla.kernel.org@molgen.mpg.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220460-208809-oqjt6yT106@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220460-208809@https.bugzilla.kernel.org/>
References: <bug-220460-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220460

--- Comment #11 from Paul Menzel (pmenzel+bugzilla.kernel.org@molgen.mpg.de=
) ---
Created attachment 308545
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308545&action=3Dedit
Output of `dmesg` (Linux 6.16.1) with dynamic debug of xhci_hcd and usbcore,
USB-C connector plugged both ways

It turns out, that I am only able to reproduce the issue, when the USB-C
connector is plugged in a certain position. Without wrangling the cable, it=
 can
be described, that it happens with the adapter logo on the top side, and sw=
itch
it (and the connector) upside down, it=E2=80=99s not reproducible. Does tha=
t make
sense? New logs attached.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

