Return-Path: <linux-usb+bounces-11734-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F13A891A770
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2024 15:11:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3020B1C24305
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2024 13:11:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 10F63187348;
	Thu, 27 Jun 2024 13:10:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aKdHhvqY"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E7BF187328
	for <linux-usb@vger.kernel.org>; Thu, 27 Jun 2024 13:10:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719493832; cv=none; b=qmmJuVuzkowheufAsHN6tr57WzjsteAQPZdyPjiemhf3i+ZPktBGBSy+GaU1yWNaZBgx+SX3VZbn8j97a34MKBAmRvfLFFjwAMxJk4hxMvzxE6G1q3StJMg8XyxrfGOOk1z99iPCM0cKzQhnM8m/AU24dr8m0P+VGkIYVbr6z+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719493832; c=relaxed/simple;
	bh=fQy8UQoDSKUDPVSzBca8myumG1qpDKITAcIUSbFHe64=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XWPtX3iERVs0cJWL++w8JtVvgCdoY5n3w4DuY2+p11sE4uoMcOLyBFiCJObLiR5B24mb+Kk+ZnyeZeUaoYikxBYVwTMPGFYRyxMirWfkAmyTdwy29+vIA7PT37xzmvDAvdvT5l4hDZHyPlpnvWXIEM0zJOzwWIgNahorNIT+4uE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aKdHhvqY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0E75CC4AF07
	for <linux-usb@vger.kernel.org>; Thu, 27 Jun 2024 13:10:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719493832;
	bh=fQy8UQoDSKUDPVSzBca8myumG1qpDKITAcIUSbFHe64=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=aKdHhvqYgPjGnpyNNmYqdUdsoOCFzF6zW//fRUEFjJbaMFjOIqOqaDQqC1rgn08Ah
	 e/3i6QC/mx2PJAD5oFCHGNTJq8+bMze8R0PmvFgPx00JWTMlMNYacc+n80DVly+Sal
	 rXRScpfOO52SEvVnV9LQrEDR5+n59CuoTYW01C2fpuGzIbqcMuAOyo10s5mq6Kg9tj
	 +6frkjZqnawd+Io9JLnyx0v/N48BQj406iCF06qp0IISy/sxHqBxAbG/7pL82evn/b
	 7XSK1D4y9Vbl/vC/x/R7AAvasZNgYI+C0XNuBnlf6uFyYRIOLywG2gmn8u64ZiqxhK
	 MNzzAbBgpK12Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id ECC5CC433E5; Thu, 27 Jun 2024 13:10:31 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 218987] USB devices are not detected after Save/Restore error
 on Intel xHC
Date: Thu, 27 Jun 2024 13:10:31 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-218987-208809-9oxWY2VMGx@https.bugzilla.kernel.org/>
In-Reply-To: <bug-218987-208809@https.bugzilla.kernel.org/>
References: <bug-218987-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D218987

--- Comment #6 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
Created attachment 306504
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D306504&action=3Dedit
patch v2 to fix connect detect issue after xhc resume SRE case

Does this work?

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

