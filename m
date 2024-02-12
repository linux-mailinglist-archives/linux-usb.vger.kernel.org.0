Return-Path: <linux-usb+bounces-6256-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 362D8851EAE
	for <lists+linux-usb@lfdr.de>; Mon, 12 Feb 2024 21:30:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5CFD91C22340
	for <lists+linux-usb@lfdr.de>; Mon, 12 Feb 2024 20:30:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F021F1DDC3;
	Mon, 12 Feb 2024 20:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aUXAkdcU"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F2EA48
	for <linux-usb@vger.kernel.org>; Mon, 12 Feb 2024 20:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707769826; cv=none; b=g4aczI8Fc/qyA9UsxXDw3eOhxlEcZscn5/ohVToSMkRG540JJKCM30t/uwCTB5meyumQ+DX56JzL5RBMlNG71az8alUvZ1CAyplUxJQRHQO0b1wjdpnqsLh6sMAIpFxq2PDanY799/rv9NCJ7ve4lo8YchK/kk96itkP0woqguw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707769826; c=relaxed/simple;
	bh=S/oY1FD7HDTK4gMc2xjQKR50DnCckTOGQ9lRI4Pu/g8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=NFdeKI10ATkVqMYM89X35JtGDnO5iDnmY9Ff7pxAjaBamrhCZ05kJ0nBZ7JOJDGhcQJRLq2nV4hwEO6gxfiMsXDUCfzha0PcEjKefZIev2mrdiD06valPmTLgbuyJ0AmtWT0jDqmp5pVGupDTybnPMwhvkJOlGqmfVeuh96VjRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aUXAkdcU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E9FFEC433F1
	for <linux-usb@vger.kernel.org>; Mon, 12 Feb 2024 20:30:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707769825;
	bh=S/oY1FD7HDTK4gMc2xjQKR50DnCckTOGQ9lRI4Pu/g8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=aUXAkdcUZuzM6NCciOon+oH+fxPocywQKLIDJZkNlGx742BfD6FShuxeMapzXYExd
	 MOgNf6xw4/Hg+OmMAOP97KeL9zeeQyLr1zz2dC1IL14/AkLJbXWhPAsfv135UChPXB
	 AtoLOADPf3oJvSChiE8MwaepoRrpVzm0cwnPq53+fYNAnrsqdFJ5xfYq7nfxIhonel
	 45RZK648XG7EWbFr/lb7ukHCj2GBVBAmRq+C6LsZDQClofh3PJmvFPEEq7daLSD9tc
	 U88lH5XZ7d7Byj+QTirK77HqAfOT8+/yJoqn17Z0ktvhHAfdvYBVvnSYSfU9HC3Wx7
	 7S/VtzzAyTuzA==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id DA3E6C53BD1; Mon, 12 Feb 2024 20:30:25 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 216728] Thunderbolt USB Controller died after resume on Intel
 CometLake platform
Date: Mon, 12 Feb 2024 20:30:25 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: neo.wong@intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-216728-208809-3C8VEfoSo6@https.bugzilla.kernel.org/>
In-Reply-To: <bug-216728-208809@https.bugzilla.kernel.org/>
References: <bug-216728-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D216728

--- Comment #46 from Neo Wong (neo.wong@intel.com) ---
Lunar New Year break, will back on 16/Feb.
-neo

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

