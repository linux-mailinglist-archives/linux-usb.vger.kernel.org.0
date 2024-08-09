Return-Path: <linux-usb+bounces-13283-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 90FC294D3D4
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2024 17:44:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BD16F1C2109A
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2024 15:44:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F3317198A2B;
	Fri,  9 Aug 2024 15:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RvUjv7eJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A07CCA64
	for <linux-usb@vger.kernel.org>; Fri,  9 Aug 2024 15:44:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723218291; cv=none; b=dihXcNP7aB9BZgCElXIJfjeWPdSTqC6CaAzztjwOTDuZn9t67IFYBOoGHSslqMbd6GtO7hv5s7qQYCqN8/Ezsd021MWXsDOoNiTj+itfvqtKCTN2EbLmA9NiXcZr/mfoW1Ht979z5De0BepFJ7L9jaH0yg2vFS22Hajm+zj3XdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723218291; c=relaxed/simple;
	bh=+PiaOq+Jd1hubvqZ0p3Cqaz2idIjsT073ihI56e98Ac=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=j3Cb+guyHF1R0vtRiF+Yogsnzhf18DtHGkFtWH1GovyTvugxRD6oR0CqbIG5VHxHsPXGNYJdPvWuGd5NzdB7EYV2vBlcvP57n/eo8Ov+BSNGUOkqEAGMIXA2EPYOIcHN8pLQskoi3EqjbHewpGJjbpNovLF1qjxwIkEc7JdPqEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RvUjv7eJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 07247C4AF0B
	for <linux-usb@vger.kernel.org>; Fri,  9 Aug 2024 15:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723218291;
	bh=+PiaOq+Jd1hubvqZ0p3Cqaz2idIjsT073ihI56e98Ac=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=RvUjv7eJJZryBSSP5smFcCLvkAzB5dF+ArxvpXHNcND7KTOiMvbUtG1QJvl2JsGjo
	 N/WJ1GZznqX3cVZxjFAuh0wq3aj7XEBhiK33l6ZeIrl1+S52qOWJbbNas6tV6g771D
	 eFW6gdsvoa0MLdvTSCrjiRDzLHRjEG3MXzCgyv6U3MKXf4qmbNyBpE5/4TBokbO3su
	 Mm0Eszwy73C23F4aJ0TCWe7Ci3n2pOm6hvRTf2kNf77RssONnEf+dGEhUScR/HGch7
	 5o0AOl8RAN9v/y9DZPPTPd9MilCeZS1yuEFF8QObogd2wA6wUqfmq2yZA4CpB4yuu/
	 6Su/UvGdQhtYA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id E7A33C433E5; Fri,  9 Aug 2024 15:44:50 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Fri, 09 Aug 2024 15:44:50 +0000
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
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-219111-208809-TecvJK1r2L@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219111-208809@https.bugzilla.kernel.org/>
References: <bug-219111-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219111

Alan Stern (stern@rowland.harvard.edu) changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |stern@rowland.harvard.edu

--- Comment #49 from Alan Stern (stern@rowland.harvard.edu) ---
I can't think of anything else to try.  Except maybe to get some helpful
information from the manufacturer.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

