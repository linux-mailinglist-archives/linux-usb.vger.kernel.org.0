Return-Path: <linux-usb+bounces-27329-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90C5CB3882D
	for <lists+linux-usb@lfdr.de>; Wed, 27 Aug 2025 19:01:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BA47B7AFAEF
	for <lists+linux-usb@lfdr.de>; Wed, 27 Aug 2025 16:59:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D6BC92F28E2;
	Wed, 27 Aug 2025 17:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hPrFk8b4"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC7A275AF9
	for <linux-usb@vger.kernel.org>; Wed, 27 Aug 2025 17:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756314082; cv=none; b=pJXFFF6+yFv+M0FcuLjjgLUe1YrIbg1oXWFcODEa8Bmv8BfhO7X06RPvIdf9Ch12zEz0w70nyo7F/OAkXomw6PDrvoxMoZn4mkU5KseeFEyWNq6S7GXlCvF7Vwsc48MpR4DbV66jAtcGM9ox8ZiKc+4LVhUJGE6llewI5/Spwzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756314082; c=relaxed/simple;
	bh=WJyOagGkt+CvSgIO7h9hsBcRhoKY8/Od7NYQoHq4TVE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Mw4eBOZaLGW6XusHaqhVq8+Spm11P16Eeof8d2bGKcVsobJzI+1qELbjy1YBt4+M24HKg3Iaem0wn0LNXwR99wLkHPkf0YblnYXwyO6f+d4rABqu+jUEwZVnV5TN4oSdn+gHvdvPmiZqCr1H6YMcBj5p6jCCYIg66xaEXnlOeTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hPrFk8b4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id C4E13C4CEEB
	for <linux-usb@vger.kernel.org>; Wed, 27 Aug 2025 17:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756314080;
	bh=WJyOagGkt+CvSgIO7h9hsBcRhoKY8/Od7NYQoHq4TVE=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=hPrFk8b4YtLuu80X+qLLKyYXd7S2IdVYv9b54MBpjbY4aS5glkil5gB68a2YC1+D3
	 d/u6kPbnR7fIr/cwIPDAmy4f5iQ4LOJhgHNWP3tFmqM8LpMEMNCKjsrukrBD2TVSNU
	 8/snLErPs5F5ppWqW0BRDP2n3Fd1f9a/i9wla5chyeyD2R78uQMs1eSuESJm4i1ynu
	 1LZpFjmzyntYWzj/RkDEmQSDi4bKooKcBzwHtXPhxrnVnCaCLu868f33aO2SQcvCdK
	 ywxubuAmA9Wk3lP9H9J0aa6gp/6Zn1FpHpFq/cTyCEO6KeURHovNH1Del238NsAhJA
	 9eXwjwkTNGaSg==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id B1F29C3279F; Wed, 27 Aug 2025 17:01:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 220491] usb_storage connected SD card disconnects/reconnects on
 resume from suspend
Date: Wed, 27 Aug 2025 17:01:20 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: paula@alumni.cse.ucsc.edu
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-220491-208809-EKV54L0vO7@https.bugzilla.kernel.org/>
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

--- Comment #11 from Paul Ausbeck (paula@alumni.cse.ucsc.edu) ---
Created attachment 308566
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D308566&action=3Dedit
usbmon trace, S/R, "k" quirk enabled, usb_storage disconnect/reconnect

This is a usbmon trace of suspend/resume with associated disconnect/reconne=
ct
of the internal usb_storage device. The "k" quirk is enabled during this tr=
ace.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

