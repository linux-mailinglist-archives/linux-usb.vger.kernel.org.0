Return-Path: <linux-usb+bounces-27570-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CBAE5B44B44
	for <lists+linux-usb@lfdr.de>; Fri,  5 Sep 2025 03:35:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 87D291B27A51
	for <lists+linux-usb@lfdr.de>; Fri,  5 Sep 2025 01:35:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C42997FBA1;
	Fri,  5 Sep 2025 01:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UwktZ6Vf"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F8B10A1E
	for <linux-usb@vger.kernel.org>; Fri,  5 Sep 2025 01:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757036107; cv=none; b=EPUjYxrIblDgQ7Okwo1jCdrmytNJLnbxHHKNau+5dy7AukqRrOkNy2JJVbKg6rCojFRDmGKak1gnA983lESDC8c4BoLBgC/NHalBuk355ssJyaqcWBvSomyJyyteQbiLBGv3bzKuoCP0CwdlfL41kTO8nftDL20YcZTxmwxu0Dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757036107; c=relaxed/simple;
	bh=PPmWeG0chs1KCirCJISIIIxYXqbBS/WoB3Q8bROFRQ8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GphsBXUtCotn1yp/4pFu3gQAotyRMvY347e1rnatQRodwD3bcymLoifTIc4KwMNOzao09cjv5nLz75A+LP1PpvzIzQqbF2ZzfO1ezBHa5moaTzmTgOBa7a/PLjPkSHhIbEAujAzdiywQGbnDRetndNtYZeTRwzAx5D+SRh29QpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UwktZ6Vf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id BF720C4CEF6
	for <linux-usb@vger.kernel.org>; Fri,  5 Sep 2025 01:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757036106;
	bh=PPmWeG0chs1KCirCJISIIIxYXqbBS/WoB3Q8bROFRQ8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=UwktZ6Vf145NekbloTMDXhPs8MmcYR3YTw88+Hoph9bH2sedXXAhH19yE+aGOZE71
	 ZzcxcKpHnoAR/UalawIWy76Fc1gIzp6Rt/KAuNmeTrxIon0PG3hezp9rRrZTkAs0jI
	 75XOgrElGUydacNhfywG/idxFa6ZysJi1lwfO27hbOY+hm1MP/USU66GgASqsfqrS7
	 HGcfbS0YLAfl6ecJGnQMQvaolj8FZE5YCaBrG0UXrzFBNtoI+vQruWTsLkFjgxwb6t
	 8hKwIm2Ks1Lu3IqK4QZXjitTUjv04prjKye8mgGYYw3MKZnuSf5wxZnZoST68dOL48
	 8rlTeZuMgmkDw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id ACF87C3279F; Fri,  5 Sep 2025 01:35:06 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Fri, 05 Sep 2025 01:35:06 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: stern@rowland.harvard.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220491-208809-yn956lPRqA@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220491-208809@https.bugzilla.kernel.org/>
References: <bug-220491-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220491

--- Comment #42 from Alan Stern (stern@rowland.harvard.edu) ---
The emb-qm77 system sees to be a special case, with a real hardware problem=
.=20
It reports overcurrent conditions on every port during resume -- even ports
that aren't connected to a device.

usb-persist fails when an overcurrent condition is present.  Not because the
condition is disqualifying, but merely because usb-persist was never given =
the
capability of handling it.  In theory this capability could be added.  But
would it be worthwhile?  How common are systems with this hardware bug?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

