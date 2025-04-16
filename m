Return-Path: <linux-usb+bounces-23147-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 61AE5A90660
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 16:28:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B61528E7563
	for <lists+linux-usb@lfdr.de>; Wed, 16 Apr 2025 14:19:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07B7A1B042E;
	Wed, 16 Apr 2025 14:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nSDFqry0"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810821ADC97
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 14:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744813063; cv=none; b=GLEjQe28ze9cdlwaD82XwtKlMyz3WrUPGNWbhuJP2UbZRv0m91feX0vUPEgIdKUO0ZxwyZHNwbuULfqxxx6iCVtPw5lrNcizvqL2Mf1BlhXPjddoOR7D2yiX0dpU7TMTvG1qNXlVD8kP78oojAYIo4L+TO3qSwH76pQPRoWpJS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744813063; c=relaxed/simple;
	bh=8T9qgbGGD0DTpl6mZKx2hU8m37u0krSHEHonIq7IGFo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=e5L2eybPoA+efZK1dRKsionw7qBPMAUGW9GjZ34HgjNLI8emaFVXFROjUbHNZ5YgRd5uKGWV1s+SOL5Us8s4S8D++bnR99W0GRFwDfHVgU1u49P0xP72XpjoS8rr9jTYE8fIZgU0iajNKLfY8H2EDetVwaQR40TM/dL+N1Jn0/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nSDFqry0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 61F92C4CEED
	for <linux-usb@vger.kernel.org>; Wed, 16 Apr 2025 14:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744813063;
	bh=8T9qgbGGD0DTpl6mZKx2hU8m37u0krSHEHonIq7IGFo=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=nSDFqry0kjWV0SAgxPuoR1EO06J5eIacpUTNdUEV1MhiprgTB5hERO8poEvU/cR7d
	 NtHGtMt9p5QRDg/gQ4RK1B6KiH6aTnJE+uDitWCzpsanQvuIrSfqUh5irdQPkg8kDG
	 kHe5yxPrMqA4UhqJOP2J7gOwrJ5FnSH5YzYxfEGY8/F+klkPwH9TwROJBNIH/SlnC3
	 GHfG0fgZBfHPqTFONWWBkYVNOHeGcUQ7xbGQorlFWjSD4s+QGmBbndSHQViMr61W2n
	 Pt354y9lu/8U1ZCqO+Ro1tvxyyGaOHfqgzxmKcSY34o3+4UkfTIvblqdclfrCazUN8
	 f6c9A/QM0jgyw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 53F85C53BBF; Wed, 16 Apr 2025 14:17:43 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220002] USB tethering fails with rndis_host on 6.14.2
Date: Wed, 16 Apr 2025 14:17:43 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: christian@heusel.eu
X-Bugzilla-Status: RESOLVED
X-Bugzilla-Resolution: ANSWERED
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-220002-208809-kaFxjEiV46@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220002-208809@https.bugzilla.kernel.org/>
References: <bug-220002-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220002

Christian Heusel (christian@heusel.eu) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |christian@heusel.eu

--- Comment #4 from Christian Heusel (christian@heusel.eu) ---
I have now also posted this to the mailing lists:
https://lore.kernel.org/all/e0df2d85-1296-4317-b717-bd757e3ab928@heusel.eu/

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

