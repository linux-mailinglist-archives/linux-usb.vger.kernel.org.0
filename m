Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 68B6C3F4B19
	for <lists+linux-usb@lfdr.de>; Mon, 23 Aug 2021 14:49:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236897AbhHWMuY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Aug 2021 08:50:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:52192 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236721AbhHWMuX (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 23 Aug 2021 08:50:23 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 376E0613AC
        for <linux-usb@vger.kernel.org>; Mon, 23 Aug 2021 12:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1629722981;
        bh=SXyEf3F65V0mgX1bBJQy4HNVf64d6OJzuQ/DufKUdG8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=hIMXsOCoDsfZzNB6x/Hze6qih6pH+voRwyGHcJAFXJDzSKdZxJAwqV3qyFJ4M3srG
         GBTVekdgYpPaHNs2ylyo2nq7VgCYelhgue02TZsrcGw/Cg3Z0Ewz2A7yXNvN1Mhfug
         3B7jTAe5gV+JQSDRwmxGjsq92B3VsmrUBLaXFQZlYzdBhAu2FLvCUBy7zNk0zu+Lad
         0AC8Yz8S+w+lW/y7NVcTZGfiJEFDVXqu2VgLgDg09/9MaR3aQIS0vD7kGl1ReUyprc
         q7geX7tkAnk+l4ooMzfkMttpwDp3wiPDz/pdXMIFwGJSJc1SutLfPgV2BnZNyjgmk4
         iGPYRIgKKgdhw==
Received: by pdx-korg-bugzilla-2.web.codeaurora.org (Postfix, from userid 48)
        id 2DD1060FE7; Mon, 23 Aug 2021 12:49:41 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     linux-usb@vger.kernel.org
Subject: [Bug 214021] The USB devices fail to be detected during boot
Date:   Mon, 23 Aug 2021 12:49:40 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: USB
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: mathias.nyman@linux.intel.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_usb@kernel-bugs.kernel.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-214021-208809-wYL7KPMiHV@https.bugzilla.kernel.org/>
In-Reply-To: <bug-214021-208809@https.bugzilla.kernel.org/>
References: <bug-214021-208809@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=3D214021

--- Comment #11 from Mathias Nyman (mathias.nyman@linux.intel.com) ---
(In reply to Alan Stern from comment #10)
>=20
> Would something like the attached patch fix the problem?  It delays
> registration of the secondary root hub until after the primary hcd is
> started, just before the primary root hub is registered.

If I understood the problem correctly we would need to delay the registrati=
on
of the primary roothub until secondary hcd usb_hcd_add() reaches
hcd->driver->start()

xhci pci driver will first create and add primary hcd, then create and add
secondary hcd.

xhci_pci_probe()
  /* create AND add primary hcd in one go */
  usb_hcd_pci_probe(dev, id, &hc_driver)
  primary_hcd =3D dev_get_drvdata(&dev->dev)
  /* create secondary hcd */
  secondary_hcd =3D usb_create_shared_hcd(...,primary_hcd)
  /* add secondary hcd */
  usb_add_hcd(secondary_hcd)


If we force xhci driver to always first create both hcds, and then add them=
, we
could maybe do somethinh like this:


usb_hcd_add()
    ...
    if ((is_primary_hcd(hcd) && !hcd->shared_hcd) || !is_primary_hcd)
        register_roothub(primary_hcd);
    if(!is_primary_hcd(hcd))
        register_roothub(hcd);

If this makes any sense I'll turn this into real code.

--=20
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.=
