Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 122F8583DD
	for <lists+linux-usb@lfdr.de>; Thu, 27 Jun 2019 15:52:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbfF0NwW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 27 Jun 2019 09:52:22 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:38820 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726370AbfF0NwV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 27 Jun 2019 09:52:21 -0400
Received: (qmail 2648 invoked by uid 2102); 27 Jun 2019 09:52:20 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 27 Jun 2019 09:52:20 -0400
Date:   Thu, 27 Jun 2019 09:52:20 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Mayuresh Kulkarni <mkulkarni@opensource.cirrus.com>
cc:     Oliver Neukum <oneukum@suse.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        <patches@opensource.cirrus.com>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: core: devio: add ioctls for suspend and resume
In-Reply-To: <1561641624.14683.11.camel@opensource.cirrus.com>
Message-ID: <Pine.LNX.4.44L0.1906270944150.1492-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 27 Jun 2019, Mayuresh Kulkarni wrote:

> Thanks for all the comments and clarifications, Alan.
> 
> I will check the 3-ioctl approach on the platform I have using the test
> program I had used to send my original patch.
> 
> Just for my understanding, the below sequence should also work -
> 1. Call ALLOW_SUSPEND
> 2. Previously queued URB fails ==> device no longer active
> 3. Call WAIT_FOR_RESUME

You don't have to perform (2) if you don't want to.  You can proceed
directly to (3); the WAIT_FOR_RESUME ioctl won't return until the
device has both suspended and resumed (or the call is interrupted by a
signal -- such as a 10-second timer expiring).

> 4. After a while (say > 10 sec), assume no remote-wake by device. But
> user-space wants to communicate with the device (due to some end-user
> activity).
> In this case, the user space needs to call FORBID_SUSPEND ioctl. When
> that returns, it is safe to assume device is active.

Or maybe the WAIT_FOR_RESUME ioctl returns because there was a remote 
wakeup.  In this case also you would call FORBID_SUSPEND.

In fact, you should call FORBID_SUSPEND _whenever_ WAIT_FOR_RESUME
returns, unless your program has decided not to use the device any more
(in which case you don't care whether the device is suspended or
resumed).

> 5. Once done, go-to (1).
> 
> Could you please cross-confirm? Thanks,

That's all correct.

Alan Stern

