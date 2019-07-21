Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3B9F6F5A5
	for <lists+linux-usb@lfdr.de>; Sun, 21 Jul 2019 22:45:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726748AbfGUUpo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 21 Jul 2019 16:45:44 -0400
Received: from netrider.rowland.org ([192.131.102.5]:33323 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726031AbfGUUpo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 21 Jul 2019 16:45:44 -0400
Received: (qmail 10519 invoked by uid 500); 21 Jul 2019 16:45:43 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 21 Jul 2019 16:45:43 -0400
Date:   Sun, 21 Jul 2019 16:45:43 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     Joe Perches <joe@perches.com>
cc:     Pawel Laszczak <pawell@cadence.com>,
        <felipe.balbi@linux.intel.com>, <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, <rogerq@ti.com>,
        <linux-kernel@vger.kernel.org>, <jbergsagel@ti.com>,
        <nsekhar@ti.com>, <nm@ti.com>, <sureshp@cadence.com>,
        <jpawar@cadence.com>, <kurahul@cadence.com>, <aniljoy@cadence.com>
Subject: Re: [PATCH v10 2/6] usb:common Separated decoding functions from
 dwc3 driver.
In-Reply-To: <4d4a8a02e4ec7fad9213302d17a6acd17851d8da.camel@perches.com>
Message-ID: <Pine.LNX.4.44L0.1907211639390.9901-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, 21 Jul 2019, Joe Perches wrote:

> On Sun, 2019-07-21 at 19:32 +0100, Pawel Laszczak wrote:
> > Patch moves some decoding functions from driver/usb/dwc3/debug.h driver
> > to driver/usb/common/debug.c file. These moved functions include:
> []
> > diff --git a/drivers/usb/common/debug.c b/drivers/usb/common/debug.c
> []
> > +static void usb_decode_set_clear_feature(__u8 bRequestType, __u8 bRequest,
> > +					 __u16 wValue, __u16 wIndex,
> > +					 char *str, size_t size)
> 
> It's probably not necessary to use Hungarian
> when moving these functions into generic code.

In fact, these are the well known and commonly accepted names for these
data values, as given in the USB specification and used in many other
places in the Linux USB stack.  See for example the definition of
struct usb_ctrlrequest in include/uapi/linux/usb/ch9.h.

Changing them here would only make the code less readable.

Alan Stern

