Return-Path: <linux-usb+bounces-7087-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2AA8677D0
	for <lists+linux-usb@lfdr.de>; Mon, 26 Feb 2024 15:09:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD8182905BA
	for <lists+linux-usb@lfdr.de>; Mon, 26 Feb 2024 14:09:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1B97129A6D;
	Mon, 26 Feb 2024 14:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XwSzZsNb"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BED31292F3
	for <linux-usb@vger.kernel.org>; Mon, 26 Feb 2024 14:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708956347; cv=none; b=I4jjd4luzBJs/R9tlM37qYsiI4/5tHKoWw4y0YOXRWXemQZ+VwFumo5u/ZSYcShHun1DOkzez+bOxF+zNtcn+5LYyRPg52ejP0qssPXQfmnUkoKWO2R1Q20z/PNr+c4zTTmaD88rm5d+yzK84zHabc3o28GenVwW/5+L2mxpq+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708956347; c=relaxed/simple;
	bh=ShVXHzAAl2NXdTe+5EwJVU/Pfmhy7DumPVy3PDr0ptg=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=uY41teYNIECM6fXzg/Ypm4/cAjzBJIY7hvINO7MdzCb6c6zptBlLFqfO0ia5L8oPEfvoL6BydOlMCHA1+5HlJI9oKvc0AAoswaRQrDKZ5WfRj7SP0PPD30pymPD3Tg4K6pFTsn7MLYTLYxrp1t27EdzLiAOqej+xolPSO519lrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XwSzZsNb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D6100C433C7
	for <linux-usb@vger.kernel.org>; Mon, 26 Feb 2024 14:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708956346;
	bh=ShVXHzAAl2NXdTe+5EwJVU/Pfmhy7DumPVy3PDr0ptg=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XwSzZsNboIrdeq9H5ZWk9YDKwqdtE+VA9WOu7Wcg7212kCvdc8sSYmnS6icedkE5E
	 //LDFHW7QXOd8Y1irx5f4tDv2q4sXzpl/i116MScGoYYj5mvi2xKaBij9QtzW0DAoB
	 yARXzTannU4iCyEmf2e07kq/Fers26AKTT6JlNW1D+g+YWGCzFTqKfz5L9tOpCjeRG
	 kbIp0PPGSubwMDyykXPZs4bbniDSJdLN9EL2BDlNsMxzDYGsSOtLmGb7btjXZVBfXr
	 s15iqdxU8Xl2uPPIrlSrgjc83sBwAWE84SivHmwgMnvx6pPC4hdyA3N3u+NR3VRB3j
	 MY/riYb8zCAYw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id C181CC53BC6; Mon, 26 Feb 2024 14:05:46 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218487] Linux warning `usb: port power management may be
 unreliable` on Dell OptiPlex 5055
Date: Mon, 26 Feb 2024 14:05:46 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: pmenzel+bugzilla.kernel.org@molgen.mpg.de
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: DUPLICATE
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218487-208809-esPlPAQlss@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218487-208809@https.bugzilla.kernel.org/>
References: <bug-218487-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218487

--- Comment #3 from Paul Menzel (pmenzel+bugzilla.kernel.org@molgen.mpg.de)=
 ---
Created attachment 305907
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D305907&action=3Dedit
Linux 6.8-rc6+ messages with v2 patches (output of `dmesg`) with
`usbcore.dyndbg=3D+p` and with system firmware 1.1.20

I tested this on a different system but the same model with a slightly older
firmware version OptiPlex 5055 Ryzen CPU/0P03DX, BIOS 1.1.20 05/31/2019. The
warning is gone.

The two patches were applied on top of tag *v6.8-rc6*.

1.=20
https://lore.kernel.org/all/20240220135946.4028553-1-mathias.nyman@linux.in=
tel.com/
2.=20
https://lore.kernel.org/all/20240220135946.4028553-2-mathias.nyman@linux.in=
tel.com/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

