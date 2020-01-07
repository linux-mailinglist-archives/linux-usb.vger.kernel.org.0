Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3B1713345B
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jan 2020 22:25:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728825AbgAGVZL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Jan 2020 16:25:11 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:48668 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1729318AbgAGVZH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Jan 2020 16:25:07 -0500
Received: (qmail 8325 invoked by uid 2102); 7 Jan 2020 16:25:06 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 7 Jan 2020 16:25:06 -0500
Date:   Tue, 7 Jan 2020 16:25:06 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     syzbot <syzbot+10e5f68920f13587ab12@syzkaller.appspotmail.com>
cc:     andreyknvl@google.com, <gregkh@linuxfoundation.org>,
        <gustavo@embeddedor.com>, <ingrassia@epigenesys.com>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <syzkaller-bugs@googlegroups.com>
Subject: Re: WARNING in usbhid_raw_request/usb_submit_urb (2)
In-Reply-To: <000000000000b9ee2d059b933d37@google.com>
Message-ID: <Pine.LNX.4.44L0.2001071624021.1567-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 7 Jan 2020, syzbot wrote:

> Hello,
> 
> syzbot has tested the proposed patch but the reproducer still triggered  
> crash:
> WARNING in usbhid_raw_request/usb_submit_urb

All right, now for a slightly larger change.

Alan Stern

#syz test: https://github.com/google/kasan.git ecdf2214

Index: usb-devel/drivers/usb/core/urb.c
===================================================================
--- usb-devel.orig/drivers/usb/core/urb.c
+++ usb-devel/drivers/usb/core/urb.c
@@ -205,7 +205,7 @@ int usb_urb_ep_type_check(const struct u
 
 	ep = usb_pipe_endpoint(urb->dev, urb->pipe);
 	if (!ep)
-		return -EINVAL;
+		return -EBADF;
 	if (usb_pipetype(urb->pipe) != pipetypes[usb_endpoint_type(&ep->desc)])
 		return -EINVAL;
 	return 0;

