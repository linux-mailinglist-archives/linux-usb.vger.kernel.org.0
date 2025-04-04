Return-Path: <linux-usb+bounces-22597-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B4AA7C57A
	for <lists+linux-usb@lfdr.de>; Fri,  4 Apr 2025 23:26:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DA463B8514
	for <lists+linux-usb@lfdr.de>; Fri,  4 Apr 2025 21:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F41220ADD5;
	Fri,  4 Apr 2025 21:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ak6Ew7wT"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95F927404E
	for <linux-usb@vger.kernel.org>; Fri,  4 Apr 2025 21:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743802005; cv=none; b=YNvDXaQfROX1I4FOIXa2iklIylUWDdy6v1XQuS0ZW/xgvMtJxgdZXkLX0FDx0nBrijJRY1+jIz9pAwFoqLJ0Gy4P1f9j74PRYMitO/D3+5vkWMzl/JQKw1SiOFFdMl33xnk9d4yIQ2aXPY+ivNCXnH8xoNy9vyHDVnmbDLjdR1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743802005; c=relaxed/simple;
	bh=XTBrSDTSYMh+qcjJz2CYmZBMoQ5m3TfOGO+XHX6LBZ8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=lIuPUjmMYl/YltuWvydXkW94sPYmnilhNJYfgD1U+pG84Zz+2WGRAZVTFXazL5HTUGm+LAeRNsVkR/1JDXZXUWPRMVXFlRF6cASWPct+J3ZiSrStBy9QVn/WOjaHSzNRFxtFw4Q4xQ9smPu+2vNCKCO9ZTWC+gYwmPED4CJAG0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ak6Ew7wT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0A514C4CEE4
	for <linux-usb@vger.kernel.org>; Fri,  4 Apr 2025 21:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743802005;
	bh=XTBrSDTSYMh+qcjJz2CYmZBMoQ5m3TfOGO+XHX6LBZ8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=ak6Ew7wTM+II2Umtutmu1/nFLC9u47FhYX9T8IT6JGoEUI5wHmbzUo2TZojimInMc
	 94iRJExD5Ii7TukG6E2p5YHamAGA3kUPQarHfwr0BgdCeMm1nVKrGaC5bkOZqQ2B+s
	 r0jAXyzz0ogEii0vPjcPIEhOy9G1hYBWBD6cjhuwhLbCFhuV1Ws0mzgD1Gfqm+dD8h
	 0EcY0T/iwiuDcCOirdJo0n0j9wOVaLp2KbRyJSmTP6VwzbSxUHfHIcm6Vb/mnT89CC
	 ImU7gVJuCMzhk/+tKfnS6yP0a3Y+A9MKlZvXWLzKT6IqqvUC1TT8T6HwJtQE+ia+B2
	 5GJQc+nieXI5A==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 040C0C53BBF; Fri,  4 Apr 2025 21:26:45 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 215906] DMAR fault when connected usb hub (xhci_hcd)
Date: Fri, 04 Apr 2025 21:26:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: rolf.reintjes@web.de
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-215906-208809-yllpSBkClY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-215906-208809@https.bugzilla.kernel.org/>
References: <bug-215906-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D215906

--- Comment #30 from Rolf Reintjes (rolf.reintjes@web.de) ---
(In reply to Micha=C5=82 Pecio from comment #29)
> This should now be fixed by
> c133ec0e5717 usb: xhci: Enable the TRB overfetch quirk on VIA VL805
>=20
> which hit mainline today and is bound for stable.

With the newest kernel from debian testing the problem is not there any mor=
e.

rolf@i7-5820K-debian-testing1:~$ uname -a
Linux i7-5820K-debian-testing1 6.12.20-amd64 #1 SMP PREEMPT_DYNAMIC
Debian 6.12.20-1 (2025-03-23) x86_64 GNU/Linux

Thank you very much.

I thought that the patch would only be there from 6.14 kernels onwards.

Can anyone confirm that the problem has gone on other systems?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

