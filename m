Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B7759DCED8
	for <lists+linux-usb@lfdr.de>; Fri, 18 Oct 2019 20:59:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2443172AbfJRS7h (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Oct 2019 14:59:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:56344 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726421AbfJRS7h (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 18 Oct 2019 14:59:37 -0400
Received: from localhost (unknown [38.98.37.137])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 73D2B20700;
        Fri, 18 Oct 2019 18:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571425176;
        bh=1LGsLjidu4GWpyPbnG47biJHYr4slOyuXbtj6n/gJec=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=stt2z4TUOuGGT3/TzXo++JWK8AWvyLZF/d/QkYxCaTUiTXq7NpBxd1QbpffU1DGZ4
         baKU/fcEqVzykoaWndzCmdnmtgEiBhh4Gz03IWJt5iZz6tqeUP2agemebG36aqMurw
         5GGuCH6TNkF06R5nxQDgfEeKuTtypPrpL74C50c4=
Date:   Fri, 18 Oct 2019 11:59:18 -0700
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Mathias Nyman <mathias.nyman@intel.com>,
        USB list <linux-usb@vger.kernel.org>,
        Kernel development list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] usb: Add a new quirk to let buggy hub enable and
 disable LPM during suspend and resume
Message-ID: <20191018185918.GA1204767@kroah.com>
References: <Pine.LNX.4.44L0.1910031503050.1797-100000@iolanthe.rowland.org>
 <A6EC775D-CE42-4F34-9B87-478482EF683A@canonical.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <A6EC775D-CE42-4F34-9B87-478482EF683A@canonical.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Oct 17, 2019 at 02:33:00PM +0800, Kai-Heng Feng wrote:
> 
> 
> > On Oct 4, 2019, at 03:04, Alan Stern <stern@rowland.harvard.edu> wrote:
> > 
> > On Fri, 4 Oct 2019, Kai-Heng Feng wrote:
> > 
> >> Dell WD15 dock has a topology like this:
> >> /:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 10000M
> >>    |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/7p, 5000M
> >>            |__ Port 2: Dev 3, If 0, Class=Vendor Specific Class, Driver=r8152, 5000M
> >> 
> >> Their IDs:
> >> Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
> >> Bus 004 Device 002: ID 0424:5537 Standard Microsystems Corp.
> >> Bus 004 Device 004: ID 0bda:8153 Realtek Semiconductor Corp.
> >> 
> >> Ethernet cannot be detected after plugging ethernet cable to the dock,
> >> the hub and roothub get runtime resumed and runtime suspended
> >> immediately:
> >> ...
> >> [  433.315169] xhci_hcd 0000:3a:00.0: hcd_pci_runtime_resume: 0
> >> [  433.315204] usb usb4: usb auto-resume
> >> [  433.315226] hub 4-0:1.0: hub_resume
> >> [  433.315239] xhci_hcd 0000:3a:00.0: Get port status 4-1 read: 0x10202e2, return 0x10343
> >> [  433.315264] usb usb4-port1: status 0343 change 0001
> >> [  433.315279] xhci_hcd 0000:3a:00.0: clear port1 connect change, portsc: 0x10002e2
> >> [  433.315293] xhci_hcd 0000:3a:00.0: Get port status 4-2 read: 0x2a0, return 0x2a0
> >> [  433.317012] xhci_hcd 0000:3a:00.0: xhci_hub_status_data: stopping port polling.
> >> [  433.422282] xhci_hcd 0000:3a:00.0: Get port status 4-1 read: 0x10002e2, return 0x343
> >> 
> >> At this point the SMSC hub (usb 4-1) enters into compliance mode
> >> (USB_SS_PORT_LS_COMP_MOD), and USB core tries to warm-reset it,
> >> 
> >> [  433.422307] usb usb4-port1: do warm reset
> >> [  433.422311] usb 4-1: device reset not allowed in state 8
> >> [  433.422339] hub 4-0:1.0: state 7 ports 2 chg 0002 evt 0000
> >> [  433.422346] xhci_hcd 0000:3a:00.0: Get port status 4-1 read: 0x10002e2, return 0x343
> >> [  433.422356] usb usb4-port1: do warm reset
> >> [  433.422358] usb 4-1: device reset not allowed in state 8
> >> [  433.422428] xhci_hcd 0000:3a:00.0: set port remote wake mask, actual port 0 status  = 0xf0002e2
> >> [  433.422455] xhci_hcd 0000:3a:00.0: set port remote wake mask, actual port 1 status  = 0xe0002a0
> >> [  433.422465] hub 4-0:1.0: hub_suspend
> >> [  433.422475] usb usb4: bus auto-suspend, wakeup 1
> >> [  433.426161] xhci_hcd 0000:3a:00.0: xhci_hub_status_data: stopping port polling.
> >> [  433.466209] xhci_hcd 0000:3a:00.0: port 0 polling in bus suspend, waiting
> >> [  433.510204] xhci_hcd 0000:3a:00.0: port 0 polling in bus suspend, waiting
> >> [  433.554051] xhci_hcd 0000:3a:00.0: port 0 polling in bus suspend, waiting
> >> [  433.598235] xhci_hcd 0000:3a:00.0: port 0 polling in bus suspend, waiting
> >> [  433.642154] xhci_hcd 0000:3a:00.0: port 0 polling in bus suspend, waiting
> >> [  433.686204] xhci_hcd 0000:3a:00.0: port 0 polling in bus suspend, waiting
> >> [  433.730205] xhci_hcd 0000:3a:00.0: port 0 polling in bus suspend, waiting
> >> [  433.774203] xhci_hcd 0000:3a:00.0: port 0 polling in bus suspend, waiting
> >> [  433.818207] xhci_hcd 0000:3a:00.0: port 0 polling in bus suspend, waiting
> >> [  433.862040] xhci_hcd 0000:3a:00.0: port 0 polling in bus suspend, waiting
> >> [  433.862053] xhci_hcd 0000:3a:00.0: xhci_hub_status_data: stopping port polling.
> >> [  433.862077] xhci_hcd 0000:3a:00.0: xhci_suspend: stopping port polling.
> >> [  433.862096] xhci_hcd 0000:3a:00.0: // Setting command ring address to 0x8578fc001
> >> [  433.862312] xhci_hcd 0000:3a:00.0: hcd_pci_runtime_suspend: 0
> >> [  433.862445] xhci_hcd 0000:3a:00.0: PME# enabled
> >> [  433.902376] xhci_hcd 0000:3a:00.0: restoring config space at offset 0xc (was 0x0, writing 0x20)
> >> [  433.902395] xhci_hcd 0000:3a:00.0: restoring config space at offset 0x4 (was 0x100000, writing 0x100403)
> >> [  433.902490] xhci_hcd 0000:3a:00.0: PME# disabled
> >> [  433.902504] xhci_hcd 0000:3a:00.0: enabling bus mastering
> >> [  433.902547] xhci_hcd 0000:3a:00.0: // Setting command ring address to 0x8578fc001
> >> [  433.902649] pcieport 0000:00:1b.0: PME: Spurious native interrupt!
> >> [  433.902839] xhci_hcd 0000:3a:00.0: Port change event, 4-1, id 3, portsc: 0xb0202e2
> >> [  433.902842] xhci_hcd 0000:3a:00.0: resume root hub
> >> [  433.902845] xhci_hcd 0000:3a:00.0: handle_port_status: starting port polling.
> >> [  433.902877] xhci_hcd 0000:3a:00.0: xhci_resume: starting port polling.
> >> [  433.902889] xhci_hcd 0000:3a:00.0: xhci_hub_status_data: stopping port polling.
> >> [  433.902891] xhci_hcd 0000:3a:00.0: hcd_pci_runtime_resume: 0
> >> [  433.902919] usb usb4: usb wakeup-resume
> >> [  433.902942] usb usb4: usb auto-resume
> >> [  433.902966] hub 4-0:1.0: hub_resume
> >> ...
> >> 
> >> However the warm-reset never success, the asserted PCI PME keeps the
> >> runtime-resume, warm-reset and runtime-suspend loop which never bring it back
> >> and causing spurious interrupts floods.
> >> 
> >> After some trial and errors, the issue goes away if LPM on the SMSC hub
> >> is disabled. Digging further, enabling and disabling LPM during runtime
> >> resume and runtime suspend respectively can solve the issue.
> >> 
> >> So bring back the old LPM behavior as a quirk and use it for the SMSC
> >> hub to solve the issue.
> >> 
> >> Fixes: d590c2311150 ("usb: Avoid unnecessary LPM enabling and disabling during suspend and resume")
> >> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> >> ---
> >> v3:
> >> - Add forgotten patch revision changelog.
> >> 
> >> v2:
> >> - Explained by Alan, the hub should properly handle U3 -> U0 transition.
> >>  So use a quirk to target this buggy device only.
> >> 
> >> Documentation/admin-guide/kernel-parameters.txt |  3 +++
> >> drivers/usb/core/hub.c                          | 15 +++++++++++++++
> >> drivers/usb/core/quirks.c                       |  6 ++++++
> >> include/linux/usb/quirks.h                      |  3 +++
> >> 4 files changed, 27 insertions(+)
> > 
> > Mathias may want to try something different to fix this problem.  But
> > if he doesn't, this patch is okay with me.
> > 
> > Acked-by: Alan Stern <stern@rowland.harvard.edu>
> 
> If there's no objection, can we merge this patch?

I wanted to have Mathias weigh in on this before merging it...
