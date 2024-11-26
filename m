Return-Path: <linux-usb+bounces-17849-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB699D902C
	for <lists+linux-usb@lfdr.de>; Tue, 26 Nov 2024 02:55:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CC22A286665
	for <lists+linux-usb@lfdr.de>; Tue, 26 Nov 2024 01:55:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 927AD125DF;
	Tue, 26 Nov 2024 01:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s3rqWvjh"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AB36125
	for <linux-usb@vger.kernel.org>; Tue, 26 Nov 2024 01:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732586139; cv=none; b=F7mbCY2b5B4yAR6XsrD/9PytxA/jPZamKOxGzmpywSnUz+8eWNz4GhBOkqwNfA9WtacchRBj2uqv+ROtwhuG4Sx7WYtnK8nXRXC35QIbGvDCp7xapbGKDb2ysfwJ6Dv9L4bqXWT2Cc9FOhIAq0lDtT5XHmzQs/sfqPIa8Adcq9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732586139; c=relaxed/simple;
	bh=5ooHrrOntiY6l0yrDqKNnt8uyWyRjOKlCeRmMX7J/0k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=idiByKpezHE8Q9ZeqV8FXnKlVyG4e/MxYrxjZhK7uPAK57Lct0nDH/KukDlZXwIkfWDqX0RtVV5gMdXozLsZi1qUeTonYEMUOytX5gz73ZvG5QA6EGAYx0DE/qtNPkpp1ilWsm9omSyOBp/re/E3p+u8K01tr2hbK7XjPlVKCuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s3rqWvjh; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id ACA5EC4CECE
	for <linux-usb@vger.kernel.org>; Tue, 26 Nov 2024 01:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732586138;
	bh=5ooHrrOntiY6l0yrDqKNnt8uyWyRjOKlCeRmMX7J/0k=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=s3rqWvjh10ugG2VIVc4/OypcdGsClTgV10xFGD7oT9rHNr2DN+RzMoCusxs1jdbK1
	 khDNdbAu73t+3vJvH1YKSrA1oUzVWbt3r3O/LPFto7VS8ceClo6rCn9P1LB85tyhQb
	 JVCmD4cf/oAwj/syqioR0lPsRDdEqSj8PdEgb6kCxBVzycMxSreiaidQq6KOf7RAY3
	 x5nXk70vrAze57cB8fE2SW1xSOiUlEC80HJlOnnuR7SjUfwoDXaJewBz8sRkjzu1ME
	 haIPfix6/Qv1DIiWD3SVDlTpmcXDluDtyeyYxRn6B2WzJ3Vm69QMIl+hczZaWqqtkn
	 KHxYXyOQbl50Q==
Received: by aws-us-west-2-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
	id 9D519C53BC5; Tue, 26 Nov 2024 01:55:38 +0000 (UTC)
From: bugzilla-daemon@kernel.org
To: linux-usb@vger.kernel.org
Subject: [Bug 219532] Crash in RIP: 0010:xhci_handle_stopped_cmd_ring
Date: Tue, 26 Nov 2024 01:55:38 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: James.Dutton@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P3
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: attachments.created
Message-ID: <bug-219532-208809-3L3sJVcK4N@https.bugzilla.kernel.org/>
In-Reply-To: <bug-219532-208809@https.bugzilla.kernel.org/>
References: <bug-219532-208809@https.bugzilla.kernel.org/>
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

https://bugzilla.kernel.org/show_bug.cgi?id=3D219532

--- Comment #1 from James.Dutton@gmail.com ---
Created attachment 307280
  --> https://bugzilla.kernel.org/attachment.cgi?id=3D307280&action=3Dedit
xhci-ring.c

The kernel source file where the crash happens.
xhci-ring.c:423
       /* ring command ring doorbell to restart the command ring */
        if ((xhci->cmd_ring->dequeue !=3D xhci->cmd_ring->enqueue) &&
            !(xhci->xhc_state & XHCI_STATE_DYING)) {
                xhci->current_cmd =3D cur_cmd;     <- Crashes here. NULL po=
inter
dereference.
                xhci_mod_cmd_timer(xhci);
                xhci_ring_cmd_db(xhci);
        }

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=

