Return-Path: <linux-usb+bounces-23731-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7EEAA98AC
	for <lists+linux-usb@lfdr.de>; Mon,  5 May 2025 18:21:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A55F17CE73
	for <lists+linux-usb@lfdr.de>; Mon,  5 May 2025 16:21:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D6B926B2B3;
	Mon,  5 May 2025 16:20:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XnPiqFG4"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E913E26B0BE
	for <linux-usb@vger.kernel.org>; Mon,  5 May 2025 16:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746462013; cv=none; b=As9NSsE6TcE1c4ZVx+ILLnHpPidOvGSLbT/P+6PdOdOayTNCt5rVxPR9SqgnyNREUe/OtSifsdUKbMgAvXUnUQqzpQHVu+qCB61NJwIbBgTvrF9Yiz/oard+NReQIAdrk/8PNuxYydck0ZHH4E7NEJumw0h8oJx6eCZg4IcjWx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746462013; c=relaxed/simple;
	bh=iVCa3RLv4Z2qotUJ5EE64Kgu+w6PCAEp0AiYUmxyDoA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BK/imeHE+jgCVRpaCk7phjkL/G7TAMKWkWo8+TlLhYGJIu8fob7Yx4pdYkFei6KP2goLdJjVZnvzZhommvA7ftHEJkU7b87Dk/ky66SV+YUj6dwno9P+HeT47Ht6ToY0uGKlQRmYaRr0LMrxj5s2sSJXwi3sHDhguvvxBAXssh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XnPiqFG4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 65172C4CEE4
	for <linux-usb@vger.kernel.org>; Mon,  5 May 2025 16:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746462012;
	bh=iVCa3RLv4Z2qotUJ5EE64Kgu+w6PCAEp0AiYUmxyDoA=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=XnPiqFG4QbFQt5hFMgUMy1gYE39PQF4Zo2VYGruVblLwtuM4JRUU7yT9oA0WePGMO
	 R8dmWj1DNqtvLqd0XgMgwH5iz68ArUhCCaBNIsAZmAAhkj03oepVLzlOdxHdyVTpX6
	 9NC6ve1AMkTxIVkDRFEdliKjIgYmaZyB2OArKlWVla52806wUZd9qUfIKKTzeib5wG
	 kz2DFh0V/OlduCZYssS8n4X4a9arISpVqI79yyMUlCoTLH68DIZwrKirbMhrtwLoEM
	 RYpPkDSGQDI7wwITbfVbP64rbJQgH1rhUaqCs060IQ3zku/tHqHVeyf7TBfaFxyocK
	 yW4OLq/suH6NQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 5818EC41613; Mon,  5 May 2025 16:20:12 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220090] usb: teach the usb subsystem about non-coherent dma
Date: Mon, 05 May 2025 16:20:12 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: gregkh@linuxfoundation.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-220090-208809-ADyqaWznj3@https.bugzilla.kernel.org/>
In-Reply-To: <bug-220090-208809@https.bugzilla.kernel.org/>
References: <bug-220090-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D220090

--- Comment #1 from gregkh@linuxfoundation.org ---
On Mon, May 05, 2025 at 03:45:51PM +0000, bugzilla-daemon@kernel.org wrote:
> This is based on my findings attempting to bring the usb EHCI driver
> "ehci-hlwd" in wii-linux (https://wii-linux.org/) to mainline linux (6.14=
).

Great, please submit patches for this, BUT it looks like this:

> Commit 461db2bdbf3c978e76dd10a04a63fa06bb29114f changed the conditions ne=
eded
> to trigger a sync for non-coherent dma memory.

Might be the real root of the problems.  Please work with the dma
developers to see if that's the cause, as all other platforms seem to
work just fine with the ehci drivers that we know of, so perhaps this is
just a dma subsystem setup issue somewhere for your platform?

thanks,

greg k-h

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

