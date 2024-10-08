Return-Path: <linux-usb+bounces-15848-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 828BB99496C
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2024 14:24:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3FE9528457C
	for <lists+linux-usb@lfdr.de>; Tue,  8 Oct 2024 12:24:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59E151DE4D7;
	Tue,  8 Oct 2024 12:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qk+yamgf"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D827C1DE4DB
	for <linux-usb@vger.kernel.org>; Tue,  8 Oct 2024 12:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728390146; cv=none; b=BH/6zQlSfsBk9IIAEibw6tcEdi95BpBS4gEfIUPmMozefxs8yxpLNJek8ijZB11C+b8kbyrvCdbnnNvSzyDt13MFRuq7f1tQPQZoDrf7lQYX+U078FZwZF4OdIkzkVn8DsquzA1injqHef54w59OHAVsNhsdvhxyu1isEw64YUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728390146; c=relaxed/simple;
	bh=TlWccp1S4GD7O/SjmTN7yBoWdnlWv4OLpk06vy2YEVs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cWmq6i9auMaLQdXWW9H4ZibRM/vGlh99LfxubxrNhKtR9uoOFOPDQcMh61Efc9PryvN4MpN9GYodb+DumpbBHYJKFEUhNomtb8NpHFX+ijAgmI5tSOer3h7aIxSArp6JKLRcefnN1RFczKeWOKQZDJ7p+wfq9ZdELkeNv7Xcw8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qk+yamgf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 72135C4CECC
	for <linux-usb@vger.kernel.org>; Tue,  8 Oct 2024 12:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728390146;
	bh=TlWccp1S4GD7O/SjmTN7yBoWdnlWv4OLpk06vy2YEVs=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=Qk+yamgf3mxXtXVQxuGyGJ9ZQvMBsG+6pFedHdo+QqGIXc8PE5mk0Q7I0dUt5iHu4
	 dt4k9af0At6pWnvjJEBWdYy+bXTLrf2UegLpa5FjME69anv+7b3Fkfr+cgW+Suy28L
	 XZdcs+8+8DKXpqzvcJKZvARV/0X6PTB/HQJO6Bj0dkFDpNOsdmpvN+7Hjt9IpysJAI
	 wC0HHqK7sAoutQ0NJPd8kA86+SUkKm1W271uIU38QptEn4TJpwClCxGxhPG3GD1QNT
	 sgTVAHCpLnXwVho2LbhG7ye1Ko/Zxx5SqiAYZ8mtum5gvxzI20NgzZjlpIcrA9pENe
	 1LZiQbp/cZJpw==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5D401C53BC1; Tue,  8 Oct 2024 12:22:26 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219362] USB SATA does not correctly shutdown the SSD upon
 poweroff causing data loss
Date: Tue, 08 Oct 2024 12:22:26 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: harviecz@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-219362-208809-X5UplhhXlp@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219362-208809@https.bugzilla.kernel.org/>
References: <bug-219362-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219362

--- Comment #4 from Tomas Mudrunka (harviecz@gmail.com) ---
Anyway... My coworker says he triggered the same error by proper shutdown. =
He
gets sata command fail somewhere near the end of the log when shutting down.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

