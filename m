Return-Path: <linux-usb+bounces-21148-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14663A47F3E
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 14:35:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 072AF16EF62
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2025 13:28:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 383E623814D;
	Thu, 27 Feb 2025 13:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cDOWJSEP"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5CC622FE13
	for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2025 13:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740662760; cv=none; b=JhhHwriYZ8YzTpx4/d+v22maaT3aSPpL3wZ6zFLOuDze4D2twUenn3TwDorLyUUsNJAgIGQXVo8NNaS6A4FCX8/sICDqmWryDPJfRVDSO/9/kjMu53Zzvs211dqEaO93cffnxcj06uyLfo+Cq7iIyEszZwybttZz1YqUdTg6Ypw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740662760; c=relaxed/simple;
	bh=R+hjDK1kxYNbTUIybq4mrWxdVjXy8izFnj8NbhC6qp8=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ASkz2Lgc1Qm6N6NjNPNNaGMJViuKxGRSIUmpRQrNL5sImG7F8mxY+8//kkgopJTJna9IJapBNU++4sViBLvkSXn6/ewnZvbe0zpCEPejQJ4BQ+nohJSO+eD4lZR3y1cQci0tisD7B2jCunM26h+ju0WPaOH2FYEP1NNVeZns040=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cDOWJSEP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3550FC4CEE6
	for <linux-usb@vger.kernel.org>; Thu, 27 Feb 2025 13:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740662760;
	bh=R+hjDK1kxYNbTUIybq4mrWxdVjXy8izFnj8NbhC6qp8=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=cDOWJSEPqquZZQcpIMhODU4asAMl7D+ngmrhPYwsZWH7BRGyrByeYFUrGK8JvmyMi
	 LsiPsFKjruUjhlPEVqsPjvlCin/4IswqKg4oqZs51jr+QbebAlJtSnPB7IrvtzFr0L
	 CflAHmc3ptSKSyLC6Jgp8CpSK1tsbn0/o+Y8sceYY3DW6vgo3bKyzjfuzWeuQP6R8w
	 bvOsxJ5UmNtBn6yKleGFTPzhAnQjK772FHPz30o+YzkqdEQ13XYmFFpJoEZyS+R+v5
	 3e+4AUDK+Paerr4xUPxRfodIJx+KiInohwsiYH0cYv2aBMRdfS23fFufbSe5L78tp5
	 lfzjvFgMK7EmQ==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 34A61C41613; Thu, 27 Feb 2025 13:25:58 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219773] External USB disk drive and SSD corruption while
 connected to USB 3 ports.
Date: Thu, 27 Feb 2025 13:25:50 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocking
X-Bugzilla-Who: fredbezies@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219773-208809-5gu0d39d7t@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219773-208809@https.bugzilla.kernel.org/>
References: <bug-219773-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219773

--- Comment #22 from Frederic Bezies (fredbezies@gmail.com) ---
Created attachment 307721
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307721&action=3Dedit
usbmon output

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

