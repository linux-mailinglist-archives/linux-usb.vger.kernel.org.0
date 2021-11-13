Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A694044F43C
	for <lists+linux-usb@lfdr.de>; Sat, 13 Nov 2021 17:53:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235865AbhKMQ4O (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 13 Nov 2021 11:56:14 -0500
Received: from netrider.rowland.org ([192.131.102.5]:53141 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S235241AbhKMQ4O (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 13 Nov 2021 11:56:14 -0500
Received: (qmail 59821 invoked by uid 1000); 13 Nov 2021 11:53:20 -0500
Date:   Sat, 13 Nov 2021 11:53:20 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <greg@kroah.com>, zhang haiming <tcs.kernel@gmail.com>
Cc:     USB mailing list <linux-usb@vger.kernel.org>
Subject: [PATCH v5] USB: ehci_brcm_hub_control: Improve port index sanitizing
Message-ID: <20211113165320.GA59686@rowland.harvard.edu>
References: <20211113045714.46373-1-tcs.kernel@gmail.com>
 <20211113154049.GA58521@rowland.harvard.edu>
 <CAB2z9eybMuHKj64OJhjcUTMR5Or5kR_PgCqHb-KPCuYrvOZ3ow@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAB2z9eybMuHKj64OJhjcUTMR5Or5kR_PgCqHb-KPCuYrvOZ3ow@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

From: Haimin Zhang <tcs.kernel@gmail.com>

Due to (wIndex & 0xff) - 1 can get an integer greater than 15, this
can cause array index to be out of bounds since the size of array
port_status is 15. This change prevents a possible out-of-bounds
pointer computation by forcing the use of a valid port number.

Reported-by: TCS Robot <tcs_robot@tencent.com>
Signed-off-by: Haimin Zhang <tcs.kernel@gmail.com>
Signed-off-by: Alan Stern <stern@rowland.harvard.edu>

---

v5 (Alan Stern):	Changed 0xf in patch description to 15.  Added
			comment explaining why the port index is sanitized.

 drivers/usb/host/ehci-brcm.c |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

Index: usb-devel/drivers/usb/host/ehci-brcm.c
===================================================================
--- usb-devel.orig/drivers/usb/host/ehci-brcm.c
+++ usb-devel/drivers/usb/host/ehci-brcm.c
@@ -62,8 +62,12 @@ static int ehci_brcm_hub_control(
 	u32 __iomem	*status_reg;
 	unsigned long flags;
 	int retval, irq_disabled = 0;
+	u32 temp;
 
-	status_reg = &ehci->regs->port_status[(wIndex & 0xff) - 1];
+	temp = (wIndex & 0xff) - 1;
+	if (temp >= HCS_N_PORTS_MAX)	/* Avoid index-out-of-bounds warning */
+		temp = 0;
+	status_reg = &ehci->regs->port_status[temp];
 
 	/*
 	 * RESUME is cleared when GetPortStatus() is called 20ms after start
