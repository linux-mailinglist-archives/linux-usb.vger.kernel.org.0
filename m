Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCAAD2B099D
	for <lists+linux-usb@lfdr.de>; Thu, 12 Nov 2020 17:12:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728610AbgKLQMN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Nov 2020 11:12:13 -0500
Received: from netrider.rowland.org ([192.131.102.5]:49277 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728426AbgKLQMN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Nov 2020 11:12:13 -0500
Received: (qmail 279112 invoked by uid 1000); 12 Nov 2020 11:12:12 -0500
Date:   Thu, 12 Nov 2020 11:12:12 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     John Boero <boeroboy@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Kernel null dereference race condition fix.
Message-ID: <20201112161212.GC276702@rowland.harvard.edu>
References: <CAO5W59jPcJej6srJiQ4yzwtNbvdK9RGJ=_KK5KeckkYeThrX6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAO5W59jPcJej6srJiQ4yzwtNbvdK9RGJ=_KK5KeckkYeThrX6A@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Nov 12, 2020 at 11:00:16AM +0000, John Boero wrote:
> Hi for months Linux users have been reporting random USB crashes with
> certain webcams.  It happens randomly and mostly with Logitech webcams
> (which claim no Linux support).  I'm pretty sure I've tracked it down
> to a simple pointer check before dereference but it completely crashes
> USB subsystems until reboot and is really frustrating.
> 
> PR and explanation can be found here.  Please have a look.  It won't
> fix any race condition but at least it won't Oops the kernel.
> https://github.com/torvalds/linux/commit/a40519014549f60969c8e67a2fd91426db05fe04

Are you saying that some webcam driver is calling usb_ifnum_to_if() with 
dev set to NULL?  If it is, that's a bug in the webcam driver.  It needs 
to be fixed by patching the driver, not by patching usbcore.

Can you test this by replacing your patch with the following code in 
usb_ifnum_to_if()?

	if (!dev) {
		WARN(1, "dev is NULL in usb_ifnum_to_if");
		return;
	}

Alan Stern
