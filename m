Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F16F1B8955
	for <lists+linux-usb@lfdr.de>; Sat, 25 Apr 2020 22:25:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726306AbgDYUZs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 25 Apr 2020 16:25:48 -0400
Received: from netrider.rowland.org ([192.131.102.5]:56571 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726234AbgDYUZs (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 25 Apr 2020 16:25:48 -0400
Received: (qmail 4206 invoked by uid 500); 25 Apr 2020 16:25:47 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 25 Apr 2020 16:25:47 -0400
Date:   Sat, 25 Apr 2020 16:25:47 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     syzbot <syzbot+db339689b2101f6f6071@syzkaller.appspotmail.com>
cc:     andreyknvl@google.com, <gregkh@linuxfoundation.org>,
        <ingrassia@epigenesys.com>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <syzkaller-bugs@googlegroups.com>
Subject: Re: WARNING in usbhid_raw_request/usb_submit_urb (3)
In-Reply-To: <00000000000073e03705a40e6b38@google.com>
Message-ID: <Pine.LNX.4.44L0.2004251621590.4125-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, 24 Apr 2020, syzbot wrote:

> Hello,
> 
> syzbot has tested the proposed patch and the reproducer did not trigger crash:

Let's try a slightly different fix.  This feels a little better; it 
reflects the fact that ep0 always exists, even when a device is 
unconfigured.  Also, it's a smaller change.

Alan Stern

#syz test: https://github.com/google/kasan.git 0fa84af8

Index: usb-devel/drivers/usb/core/message.c
===================================================================
--- usb-devel.orig/drivers/usb/core/message.c
+++ usb-devel/drivers/usb/core/message.c
@@ -1143,11 +1143,11 @@ void usb_disable_endpoint(struct usb_dev
 
 	if (usb_endpoint_out(epaddr)) {
 		ep = dev->ep_out[epnum];
-		if (reset_hardware)
+		if (reset_hardware && epnum != 0)
 			dev->ep_out[epnum] = NULL;
 	} else {
 		ep = dev->ep_in[epnum];
-		if (reset_hardware)
+		if (reset_hardware && epnum != 0)
 			dev->ep_in[epnum] = NULL;
 	}
 	if (ep) {

