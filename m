Return-Path: <linux-usb+bounces-17379-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A635C9C2575
	for <lists+linux-usb@lfdr.de>; Fri,  8 Nov 2024 20:19:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33E0DB23AC8
	for <lists+linux-usb@lfdr.de>; Fri,  8 Nov 2024 19:19:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 933AC1A9B54;
	Fri,  8 Nov 2024 19:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rmEQwJCV"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF81233D6B
	for <linux-usb@vger.kernel.org>; Fri,  8 Nov 2024 19:19:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731093576; cv=none; b=hODFGMpgh4Eq/ULruX+g8tKR4TP93ofz8xVGn8IpHLteYD0N1Cti+Kmi54HaWrQYMhi6bbe8JHcEWcd8XP+uNgQvolco0oSh4OskBRIWPa8ZEDBEB33KuPMlJItAtcYBGWM9Mtj9AHMOMngtJjul/SEjGZIAa4UqDf4M5LZ8/M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731093576; c=relaxed/simple;
	bh=bJ9MeJejCmzk9/wF0UtFUkQx9b9O69EFYufVJzxYmU0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Am/ceD8S4fwzw0uU1jo84M5wU7y1M55W5Ak2PafalPCg6i6T/nZNNIabT0gu5zhnb2ftuKPPpthth7EKMN+oGe4KFjjHM2VJiGOxlg6UP63eVAkaDEfWz0+Xk8jLViempRKe7ys4BbN8vejsECtAUQXhQLk3dU2aDe1fr/12Fmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rmEQwJCV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7FD7AC4CED0
	for <linux-usb@vger.kernel.org>; Fri,  8 Nov 2024 19:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731093575;
	bh=bJ9MeJejCmzk9/wF0UtFUkQx9b9O69EFYufVJzxYmU0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=rmEQwJCVSXkcKuDjBCNjTOfHz6EEaQ0rxsOViEJA+v3bRAAn8J201I2oJJQIg/0zf
	 qh5aOWKyYhslioNfV5X88VI/F4qLiWAoFE2Ht/OUSMsNxXyAcVqTu8EvnjTe/A7w4W
	 62wZ+grtQF32yrQdBpMnhUWkdDpJWNbR9mi7K/4kLVVW9pk5EEb1Ud+hkOS0S55Rh1
	 0lvuQDGKE0ClZFn/mXD1qGw4uL5JESSREGgLybVenUyTBeN3k5fMIAoX14iN30EaFc
	 1dK1k+icyhjEhCb9dqG3NAv39cA9Sv9JUpEgkczmpTZRDFP6d3TiM+E1LnGy/LFeXT
	 fXCFJax156OSQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 6A740C53BC5; Fri,  8 Nov 2024 19:19:35 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218795] USB4 / Thunderbolt + AMD: unstable and slow link (many
 uncorrectable errors)
Date: Fri, 08 Nov 2024 19:19:35 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: glite60@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-218795-208809-BBqYvPQbAz@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218795-208809@https.bugzilla.kernel.org/>
References: <bug-218795-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218795

--- Comment #8 from Eduard Kachur (glite60@gmail.com) ---
(In reply to Mario Limonciello (AMD) from comment #7)
> If you want to ignore the errors you can use "pci=3Dnoaer".

Previously it didn't work with the newer box, VM was silently crashing with=
out
any PCIe errors in console (which is expected), so I didn't bother to try it
with older one, but surprisingly it works well here.

Thanks!

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

