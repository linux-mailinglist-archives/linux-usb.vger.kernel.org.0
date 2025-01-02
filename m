Return-Path: <linux-usb+bounces-18945-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E5E9FFA6B
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jan 2025 15:22:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CD0C91883727
	for <lists+linux-usb@lfdr.de>; Thu,  2 Jan 2025 14:22:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D5551B414E;
	Thu,  2 Jan 2025 14:20:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EUvleljf"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385E01B6D09
	for <linux-usb@vger.kernel.org>; Thu,  2 Jan 2025 14:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735827655; cv=none; b=kg/j1G3nG9Zy8DgMngosEpZsNNfWdklp9HC/LeyNeI0RE6mv46FwMpMNosBRapE6H5mvMHYrEKEVEEWW0t8CYO7D43N0Ef0cyRJ/uW5nKgnXFObE7A/flQvELYmfAjqkX8VB+zoTqawaUfxZRTPMhP4QW5DVR8vPSL2KAcL0mOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735827655; c=relaxed/simple;
	bh=a855/xzBLP9tw9VXrostI41MQ95n+unE+VLBq5d9Ndc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Uo53z3t/duU8ekMRGHcNqEmYODBXehmI2ImzwkBnYM8hi9Ivwt1yxqtIjK8YHV6ZrJv7zk0cPKDnNZQBY6XMDdJgRdNZYV4+6UQrFdhv3Hx6f9fQ7DMVRXh60MdzhGpDTy+3ZuFWUoasW5c8HW62qVtaZypA9CjVJ7QXG5dHzio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EUvleljf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6594EC4CED0
	for <linux-usb@vger.kernel.org>; Thu,  2 Jan 2025 14:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735827654;
	bh=a855/xzBLP9tw9VXrostI41MQ95n+unE+VLBq5d9Ndc=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=EUvleljfILf8j5WFcSWzxCIZsQ9hPhL4a+ntFMyLjltt6g9L5cRGGiWgOtGhgy9rI
	 IRUJbNYQ5fZZxmMq/fdDSfzGXu6P6pnsPvUOLrplEtK2tJAOd0dztwmeRq069wMsG/
	 n0Pv/hqa30EVIoYS9fpf4ey9+l95kaOu+RkY4SgtnUIih25WxOtTNgtSZHzfD4Jc7n
	 3OwXquYS1U3E1VYEcl5No5sRKm4PyxUBHF72whUS2RzXBfXtuUbtv0j9xxn5hQa/XQ
	 sS5adGN9Lve0zkyWs9R61IyzgTzu/zC6PaczaFS2yDLhIC9JM55A8Dk54Uc0z0OCwp
	 DLdI3qeyh3vEQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 4C7ACC3279E; Thu,  2 Jan 2025 14:20:54 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219626] Infinite udev uevent stream from USB-C port
Date: Thu, 02 Jan 2025 14:20:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: hegel666@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219626-208809-NxHWPtj4Ss@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219626-208809@https.bugzilla.kernel.org/>
References: <bug-219626-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219626

--- Comment #1 from Marcin Bachry (hegel666@gmail.com) ---
Here's a minimal revert required to fix the issue:

> diff --git a/drivers/usb/typec/ucsi/ucsi_acpi.c
> b/drivers/usb/typec/ucsi/ucsi_acpi.c
> index accf15ff1306..0e28ea57c611 100644
> --- a/drivers/usb/typec/ucsi/ucsi_acpi.c
> +++ b/drivers/usb/typec/ucsi/ucsi_acpi.c
> @@ -61,11 +61,9 @@ static int ucsi_acpi_read_cci(struct ucsi *ucsi, u32 *=
cci)
>       struct ucsi_acpi *ua =3D ucsi_get_drvdata(ucsi);
>       int ret;
>=20=20
> -     if (UCSI_COMMAND(ua->cmd) =3D=3D UCSI_PPM_RESET) {
> -             ret =3D ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_READ);
> -             if (ret)
> -                     return ret;
> -     }
> +     ret =3D ucsi_acpi_dsm(ua, UCSI_DSM_FUNC_READ);
> +     if (ret)
> +             return ret;
>=20=20
>       memcpy(cci, ua->base + UCSI_CCI, sizeof(*cci));

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

