Return-Path: <linux-usb+bounces-19689-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C033A1AE2F
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jan 2025 02:29:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 927FC188CA20
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jan 2025 01:30:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E3FC1CDFAC;
	Fri, 24 Jan 2025 01:29:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wrxcqr7k"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36F26FB9
	for <linux-usb@vger.kernel.org>; Fri, 24 Jan 2025 01:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737682191; cv=none; b=b7SCwLv5qOuu7IYViLh7NYD1Ej8dJx95tPYITNeKEmjRMSt32u7TewBg8Tg80L2RRR6LaKaRYi+z36xuA2i2//jZ0JaK8lOQu+uHwp9pXTLArot7uZJkg5IU67wAuwlPtIN6iHC1cYBzWXYFLWP1MsvmczFbzlgO8dc2nGUZeH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737682191; c=relaxed/simple;
	bh=DKPy71lkFftwHQRi2SllzSEAnDCygWR7SZPuK5Wmce4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ZMDeGn2A9s0R4liKYpq3R+Lyvl19KIfdWpHLCOTHUgpGBhwdGxA+SbNyB+wAOVefAMNLuzh+5+OjA5i2WK02nY+Bt87KVBLgjEDOy9jrgFx4j/HlR5QvB2pCxe6ieH7kkqqQ2CVSYxaFRSKSoMVBgIuFeczt/6WC4tRPYqerHrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wrxcqr7k; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 64F96C4CEE0
	for <linux-usb@vger.kernel.org>; Fri, 24 Jan 2025 01:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737682190;
	bh=DKPy71lkFftwHQRi2SllzSEAnDCygWR7SZPuK5Wmce4=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Wrxcqr7khP65A7s+s/nrTRe/hQ3F1pu+9tViLN30CWidWGOzMxLrP31Huoco5SxJh
	 hOH6qCKayCoSrlPKYiDFNcEFJuKhfyGS5XwXGtYYM4as+lsuczNS8jazApdfuKfOVu
	 HKHmlLOB5CcLcw7ciM4KMTgkuz79hxtjIgiWnEklAADnKFXV1KypDmhcHVVNxqACK3
	 PXurHYZ1Mk6LOuYSG90PaXWu5JBL/YhJT8Mf9rtZqwc+eetWVysnri+o1CIu5vZKn5
	 prM3ZJeZZqxJGT84X++RO8BTV3DJPVmP0FlPW+ty17IyOagQgs9DGDLbRJ209E7xdh
	 f/MiTPoZh+0dg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5777AC41606; Fri, 24 Jan 2025 01:29:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219681] ASUS Zenbook S 14 UX5406SA: Unstable USB connection on
 USB-A port under certain condition
Date: Fri, 24 Jan 2025 01:29:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mastercatz@hotmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-219681-208809-MkwWHbzv04@https.bugzilla.kernel.org/>
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

MasterCATZ (mastercatz@hotmail.com) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |mastercatz@hotmail.com

--- Comment #13 from MasterCATZ (mastercatz@hotmail.com) ---
not entirely the same issue=20

but I can no longer reload xhci_hcd because its now built into the kernel=20


6.12.3-061203-generic

sudo modprobe -r xhci_hcd
modprobe: FATAL: Module xhci_hcd is builtin


how can I now restart it ?=20
and who the heck thought building in a xhci_hcd module was a good idea ?=20
lose usb you loose keyboard / mouse =3D bricked system unless you can ssh i=
n with
a phone ..=20




https://ibb.co/c8YFYhG

even if I hibernate and do a full power off and resume when OS loads USB is
dead again (works in bios etc just OS loads it up dead )

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

