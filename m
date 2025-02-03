Return-Path: <linux-usb+bounces-20034-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D8448A26161
	for <lists+linux-usb@lfdr.de>; Mon,  3 Feb 2025 18:29:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 69A4916536C
	for <lists+linux-usb@lfdr.de>; Mon,  3 Feb 2025 17:29:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E2A620B810;
	Mon,  3 Feb 2025 17:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z+Cj9Z/z"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A373204C04
	for <linux-usb@vger.kernel.org>; Mon,  3 Feb 2025 17:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738603744; cv=none; b=ix++uAuJtPVSZdBue+eo1ka8S9Tgc/So2QYwiYAPFw4sm+eiQdmpOeHpHe/zUc1K1JCOXEAcc+hGYa4hE/bObblQXEDVFCvcSwAM66fN+T0MCoPuwEJIZwECVrVg9jT3vhkhmaxjRZ02yOPAoHe7bayxDfqI4kJLe9h24kmcRFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738603744; c=relaxed/simple;
	bh=1waQZJeX1PbVHTQxfyu1ERL2y5sWdAoSmjmpTcqfFKU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pAdmb/GRMeb6+8Krwljeno4j7YThSDqZETOKhkclr9tQj3fKWp/WwArgUK/K1X28iz0PIGUner2hJ15kyDcKFypvJ5cppJC0h+bDTiBR7W91iu95Tf+IGgMTOmSoFqt2ugwSKKlSKmTc98tN0t8oh92YpF5dBlETg80yjoakfmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z+Cj9Z/z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7466AC4CEE2
	for <linux-usb@vger.kernel.org>; Mon,  3 Feb 2025 17:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738603744;
	bh=1waQZJeX1PbVHTQxfyu1ERL2y5sWdAoSmjmpTcqfFKU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Z+Cj9Z/zRuY9aIz7FkaVLUyi3nU6w232d2B7FyFE3uJpTk7O55L0flhDTsKc8NtpG
	 4O0yLXv7r1rx6K4/l33/f7FUJZg5UTVa0n2ByAi7mG5G2JAjwDRNEy0Xc5U+3L0NHf
	 mOTokdsDm7UeY6fQ7rBXSXCTkMK7JfgSBdD/vE0Vzf510y+Uwt48IKfN1GQI9FTGYY
	 MwaesnAJ+uKJP1AlHMEr1qudKqxAWpj085G2FYl29kh6kGXNQdnLt4+wbVgCIE4Fu0
	 yHDhY9AYX6spbGqY2x+WTcS7suG+SuljbZu5AVEuW7xqZV3RRexjFUUcGwGnkbeKLA
	 AQtrDZfY63eeQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 61A8AC41614; Mon,  3 Feb 2025 17:29:04 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219590] Linux 6.13 ucsi driver error:
 drivers/usb/typec/ucsi/ucsi.c:1374 ucsi_reset_ppm
Date: Mon, 03 Feb 2025 17:29:04 +0000
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
Message-ID: <bug-219590-208809-aVjdFrBHNY@https.bugzilla.kernel.org/>
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

--- Comment #11 from Guido (guido.iodice@gmail.com) ---
Sorry for the stupid question, how do I recompile only the module and not t=
he
entire kernel after patching?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

