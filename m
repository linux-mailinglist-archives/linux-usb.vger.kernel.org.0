Return-Path: <linux-usb+bounces-19376-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D5B1BA1270B
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2025 16:16:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C13D07A21F2
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jan 2025 15:16:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD31712AAE2;
	Wed, 15 Jan 2025 15:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LG/0Gq10"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1A413A250
	for <linux-usb@vger.kernel.org>; Wed, 15 Jan 2025 15:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736954196; cv=none; b=t4DJOSTz0kNgWqKFNOQ56UppUaFtsCwdlAHJcT1JwGAnEmvbbdayTua6tp4sd8Z/sES7bObW8BZ4AoCKP+aeeIKQuOjB1cj8R6ImLCNkL/7dkKul698whTrGRJagPapejlQzBnQePuomh90EQ65ZSmdjQtKALCTut9BnlGXnpFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736954196; c=relaxed/simple;
	bh=0IJVyuPx5YGhOlgyzra7tSTfr4Q0wdy9A1/M+v284QA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=UxhueAaB5K+Q0STtwsuPRdwqpcwYLYtSkf+VqgyGtS33t8YkGbATSVu1AA1IOYGyyZ6O61qpgiUu1OKqfnor/uvAC6ZZQMPozkoj9jTO4pqGBAidLiiQae4Y7ScAOtHdRaoOLXkyK3c25yntx8WovgYfhS2IVMiM094N/ddsJwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LG/0Gq10; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id AE42AC4CEDF
	for <linux-usb@vger.kernel.org>; Wed, 15 Jan 2025 15:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736954195;
	bh=0IJVyuPx5YGhOlgyzra7tSTfr4Q0wdy9A1/M+v284QA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=LG/0Gq10HPoQPmvTN5l7Vb+WeP2Olq6aYbuz0WpTcAKydAyDe2IiV68r6QNN+erWj
	 39BHkKtA2lMTC2lcgzmz+uk/MEJtRPpZtNS96xnoU5QFCKXzCeLZ98tIHweiXfKw+B
	 ID4UBYXQHM1I44UvY+C6687Uy0+NKzcvvugViltrqVeF1An0Hh1TVPQ/T/K3kXiXaD
	 RykMUUqmPAkyQt8DSlyOJ/9/miQ8bnEve2GhQkHuoxOcvW8GSuUfHPHjPGtoHsYYZH
	 P0XeGN1Sp4GIIU1zMdWqtsRYTM3q0fPlkK5JXKLWCSkELJh0TCMQ09NIRsAws8mpHC
	 a5279XhGw5CkQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id A1FCDC41612; Wed, 15 Jan 2025 15:16:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219681] ASUS Zenbook S 14 UX5406SA: Unstable USB connection on
 USB-A port under certain condition
Date: Wed, 15 Jan 2025 15:16:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: dantmnf2@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219681-208809-gHOO5l4VWd@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219681-208809@https.bugzilla.kernel.org/>
References: <bug-219681-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219681

--- Comment #2 from dantmnf2@gmail.com ---
> Are the working and not working ports on the same USB bus, or on different
> ones? Perhaps two different types of USB controllers?

They are on different controllers:
    # readlink /sys/bus/usb/devices/usb*
    ../../../devices/pci0000:00/0000:00:0d.0/usb1
    ../../../devices/pci0000:00/0000:00:0d.0/usb2
    ../../../devices/pci0000:00/0000:00:14.0/usb3
    ../../../devices/pci0000:00/0000:00:14.0/usb4
    # lspci
    ...
    00:0d.0 USB controller: Intel Corporation Lunar Lake-M Thunderbolt 4 USB
Controller (rev 10)
    ...
    00:14.0 USB controller: Intel Corporation Lunar Lake-M USB 3.2 Gen 2x1 =
xHCI
Host Controller (rev 10)
    ...

> I wonder if any of that is preceded by low level USB errors? Maybe try ag=
ain
> with some dynamic debug:

It do have some messages like "Stopped on Transfer TRB for slot 4 ep 6" and
"Transfer error for slot 9 ep 0 on endpoint"

> I presume this is not a regression and there are no kernel versions where=
 it
> works correctly?

This is a relatively new platform and kernels before 6.12 cannot give a usa=
ble
system.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

