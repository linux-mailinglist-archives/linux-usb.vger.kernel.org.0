Return-Path: <linux-usb+bounces-27098-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BD1BDB2FDDE
	for <lists+linux-usb@lfdr.de>; Thu, 21 Aug 2025 17:11:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B32D81BA02FC
	for <lists+linux-usb@lfdr.de>; Thu, 21 Aug 2025 15:06:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 92FC6263F3C;
	Thu, 21 Aug 2025 15:05:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U7CDlYDc"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BF1525A33F
	for <linux-usb@vger.kernel.org>; Thu, 21 Aug 2025 15:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755788737; cv=none; b=g2cwjRb9Bxl2crXHDW9KlnN0l4Djh5f4z8nSS0hs4Br1JPKnwKpbn2ag5rZdzWDoyFk+0zke33dZDkRirncZb0aMbXIOfhAEX9TPltwiafgg3f5j2HjvDqGDyQymsKOKTDsXgFAOFHLvY4c+tswORo9XlHe0Gd5Oz7nFu7Tg2tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755788737; c=relaxed/simple;
	bh=NgXPXEHwosc9Y3swaUbHroEw5ms8A7Cq5F6vVWndFGk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mTX6zLSnfc4W0JKQHqAttJx99QZJiQFjOCNmhK+2eCnI4Omy8fQb6ASwRNrBn3eVhJdJufp4/8KcyI6jPYh18TIxj3VO1NoHC2xoGwUiSBkwLcOlpgZIDfGGtJAgE//4hMCHniHBv8HLJ3txhMiW4z1KaZPx1ZC1EcG1qP7GwkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U7CDlYDc; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 94210C4CEEB
	for <linux-usb@vger.kernel.org>; Thu, 21 Aug 2025 15:05:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755788736;
	bh=NgXPXEHwosc9Y3swaUbHroEw5ms8A7Cq5F6vVWndFGk=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=U7CDlYDccyXgrL/DDGGfkfXLbKR5NNMNA+8nV6WhK661fLZy+Vab2xiROpRZlx2fi
	 /eXMYw67aFx3YQKDkeEeoGF7HAWTHlyXt6pKkCdurtbSYoPh9RaVvQ93+olcaQ2era
	 Jj5tglqlZdvgUjoSHeps+Nj+prHMx2rebCVT73/UEAZqiUBrWODFWap0E5E9R7z1iP
	 0aLNzQr+uYe8fkpW0OTGG8hLf0ukL2usyRXG3YuLu6cKmo8ZaLhCkzGfeO8f/Pw7co
	 +A+2bL41w3aXQ5eNodWJXXGS2qMbsY+W9nBbdZtOKkt/GpzTYgeOw6I/ZgfhNSUrI0
	 CrTBNIBidizRA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 85CAEC53BC5; Thu, 21 Aug 2025 15:05:36 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220460] Plugging USB-C adapter into one port results in `Failed
 to set U2 timeout to 0x3f,error code -110`
Date: Thu, 21 Aug 2025 15:05:36 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220460-208809-a17SUvjnX5@https.bugzilla.kernel.org/>
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

--- Comment #6 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
Could you take the same logs when connecting the dock to the working USB-C
port?

Also output of "lsusb -v" (as root) with working dock could be useful

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

