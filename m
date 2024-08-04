Return-Path: <linux-usb+bounces-12934-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF64947051
	for <lists+linux-usb@lfdr.de>; Sun,  4 Aug 2024 21:13:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2F933B20A5C
	for <lists+linux-usb@lfdr.de>; Sun,  4 Aug 2024 19:13:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 419EB132464;
	Sun,  4 Aug 2024 19:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dlSR2jdr"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5DB2FB6
	for <linux-usb@vger.kernel.org>; Sun,  4 Aug 2024 19:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722798800; cv=none; b=cSn2ccRQReAzycS4BuCS9nVSDqUx1wLQo+idpdzR7GSOe6ADhMS0PIv+gP94UgzTuHc3FNPkQH5XhqYC4NP+EgsRk8NCQ9O/3Pvx7DqUkHhw77d55J6NrKL3GjrgMbuHcNcI8tPV/3EbE4GoWNqQdNyqrHGodVuJ730lco2QnXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722798800; c=relaxed/simple;
	bh=1XVXBeclIG36HcQlsLj6V82WA+VS6TOf098wQ8MGnL0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=jbaLG87SZPyHKtF4KXSZ30x2sPi6ebhspaEP3q4RkPF6kqiFU2/z72UkEkg/AFZFGebl/CBH3hRSbjlb1Hq+VS9LpXEmi175eNDtrr5RwuwYY1Y6Uoi3XTiu4/rI01rmYnbSsw0p45QZ++PHEeRIj9Xw88eZFMuTciQroRocIbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dlSR2jdr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 415A1C32786
	for <linux-usb@vger.kernel.org>; Sun,  4 Aug 2024 19:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722798800;
	bh=1XVXBeclIG36HcQlsLj6V82WA+VS6TOf098wQ8MGnL0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=dlSR2jdrLZ3mAFs0TFkKP1v4QG4DaFA35pQhtIZ2zr5XuBnb9PBnOkqjsJOdG8Wy8
	 GhsI3Q5LJZRDhdqsU9e5Kz6JdZ7JuYkcxFtLzddCt+kDJghALGjLDJNAJNI4b6yCFh
	 pBx+IBKjnw0TTEY5jXhcOUdXLEi3FY/CXwIU2xy4w/IKBjrGMVg9KyiIuVZaKR8S97
	 S1UoNnS8SHOwwMXYqkUGn0Jr0uvZP7F/DY9TNJ/6etSebxmPPzi1eZSnVrEqv62jYb
	 xZ7c1f/rLd9aLDdSuZjVXQM7bgOA8IPgG/K4wUTSc68zS9+p6lZwtT9uMmDsedy1Xm
	 uPmKT2dXPm1EQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 2A40FC53B73; Sun,  4 Aug 2024 19:13:20 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219111] Xone:23C mixer not recognized as a 2in/2out device
Date: Sun, 04 Aug 2024 19:13:20 +0000
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
Message-ID: <bug-219111-208809-pmM9zoY35X@https.bugzilla.kernel.org/>
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

--- Comment #19 from Alan Stern (stern@rowland.harvard.edu) ---
For now, I can't think of any other patches to try.

If you have a Windows system, you could do a USB packet capture (using
Wireshark, for example).  That might give an indication of how the device is
meant to work.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

