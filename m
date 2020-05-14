Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F7F51D3B3F
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2020 21:05:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728311AbgENTAS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 May 2020 15:00:18 -0400
Received: from netrider.rowland.org ([192.131.102.5]:50677 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1729504AbgENSzu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 May 2020 14:55:50 -0400
Received: (qmail 23212 invoked by uid 500); 14 May 2020 14:55:49 -0400
Date:   Thu, 14 May 2020 14:55:49 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Bin Liu <b-liu@ti.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: musb: return -ESHUTDOWN in urb when three-strikes
 error happened
Message-ID: <20200514185549.GA22428@rowland.harvard.edu>
References: <20200513213620.21541-1-b-liu@ti.com>
 <20200514013205.GA10515@rowland.harvard.edu>
 <20200514142803.GA11463@iaqt7>
 <20200514144053.GC12181@rowland.harvard.edu>
 <20200514150259.GB11463@iaqt7>
 <20200514153731.GC11463@iaqt7>
 <20200514162604.GA9571@rowland.harvard.edu>
 <20200514170023.GD11463@iaqt7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200514170023.GD11463@iaqt7>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 14, 2020 at 12:00:23PM -0500, Bin Liu wrote:

> > Still, it's worth pointing out that this change abuses the API (perhaps 
> > mentioning it in a comment).  And it still would be preferable to fix 
> 
> Okay, I will add those notes in comment in v2.
> 
> > the drivers in question, impractical though that may be.  (I have a hard 
> > time believing there are really 500 of them getting this wrong...)
> 
> I am not sure about it either, but yeah it is not practical to fix the
> issue in device drivers. So far I have seen 3 reports of this issue:
> 
> 1. with FTDI usb-serial adapter, the issue is in the usb serial generic
> driver;

It shouldn't be hard to fix this.  We don't even need a delayed retry; 
the driver can simply treat -EPROTO as an unrecoverable error, just like 
-ESHUTDOWN.

Alan Stern

> 2. with a modem, the issue is in usb wwan driver as I fixed in the patch
> I sent yesterday;
> 
> 2. another modem, before I was able to locate the offending device
> driver, the guy who reported the issue disappeared, and not responding
> me.
> 
> -Bin.
