Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DAFC289D87
	for <lists+linux-usb@lfdr.de>; Sat, 10 Oct 2020 04:33:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729658AbgJJBj5 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Oct 2020 21:39:57 -0400
Received: from netrider.rowland.org ([192.131.102.5]:57409 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1729596AbgJJBQ2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Oct 2020 21:16:28 -0400
Received: (qmail 557292 invoked by uid 1000); 9 Oct 2020 20:49:44 -0400
Date:   Fri, 9 Oct 2020 20:49:44 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     syzbot <syzbot+f5378bcf0f0cab45c1c6@syzkaller.appspotmail.com>
Cc:     andreyknvl@google.com, ath9k-devel@qca.qualcomm.com,
        eli.billauer@gmail.com, gregkh@linuxfoundation.org,
        gustavoars@kernel.org, ingrassia@epigenesys.com,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-wireless@vger.kernel.org, oneukum@suse.com,
        syzkaller-bugs@googlegroups.com, tiwai@suse.de
Subject: Re: WARNING in hif_usb_send/usb_submit_urb
Message-ID: <20201010004944.GB557008@rowland.harvard.edu>
References: <20201009185548.GA546075@rowland.harvard.edu>
 <00000000000088939405b1440053@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <00000000000088939405b1440053@google.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Oct 09, 2020 at 02:55:08PM -0700, syzbot wrote:
> Hello,
> 
> syzbot tried to test the proposed patch but the build/boot failed:
> 
> drivers/net/wireless/ath/ath9k/hif_usb.c:1319:7: error: implicit declaration of function 'usb_find_bulk_in'; did you mean 'usb_fill_bulk_urb'? [-Werror=implicit-function-declaration]

Let's try again, using a different repository.

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git v5.9-rc8

Index: usb-devel/drivers/net/wireless/ath/ath9k/hif_usb.c
===================================================================
--- usb-devel.orig/drivers/net/wireless/ath/ath9k/hif_usb.c
+++ usb-devel/drivers/net/wireless/ath/ath9k/hif_usb.c
@@ -1307,6 +1307,20 @@ static int ath9k_hif_usb_probe(struct us
 	struct usb_device *udev = interface_to_usbdev(interface);
 	struct hif_device_usb *hif_dev;
 	int ret = 0;
+	struct usb_host_interface *alt;
+	struct usb_endpoint_descriptor *epd;
+
+	/* Verify the expected endpoints are present */
+	alt = interface->cur_altsetting;
+	if (!usb_find_int_in_endpoint(alt, &epd) ||
+			usb_endpoint_num(epd) != USB_REG_IN_PIPE ||
+	    !usb_find_int_out_endpoint(alt, &epd) ||
+			usb_endpoint_num(epd) != USB_REG_OUT_PIPE ||
+	    !usb_find_bulk_in(endpoint(alt, &epd) ||
+			usb_endpoint_num(epd) != USB_WLAN_RX_PIPE ||
+	    !usb_find_bulk_out(endpoint(alt, &epd) ||
+			usb_endpoint_num(epd) != USB_WLAN_TX_PIPE)
+		return -ENODEV;
 
 	if (id->driver_info == STORAGE_DEVICE)
 		return send_eject_command(interface);
