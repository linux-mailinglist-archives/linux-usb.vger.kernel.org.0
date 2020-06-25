Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCBFE20A503
	for <lists+linux-usb@lfdr.de>; Thu, 25 Jun 2020 20:31:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404164AbgFYSbw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Jun 2020 14:31:52 -0400
Received: from netrider.rowland.org ([192.131.102.5]:34927 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S2403908AbgFYSbw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Jun 2020 14:31:52 -0400
Received: (qmail 268268 invoked by uid 1000); 25 Jun 2020 14:31:51 -0400
Date:   Thu, 25 Jun 2020 14:31:51 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     James <bjlockie@lockie.ca>
Cc:     linux-usb <linux-usb@vger.kernel.org>
Subject: Re: Alfa AWUS036ACM (Mediatek MT7612U) problem
Message-ID: <20200625183151.GA266690@rowland.harvard.edu>
References: <59c96b05-2bdb-44d3-7371-6e5e05c20927@lockie.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <59c96b05-2bdb-44d3-7371-6e5e05c20927@lockie.ca>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jun 25, 2020 at 01:08:34PM -0400, James wrote:
> I have an Alfa AWUS036ACM (Mediatek MT7612U) on a Raspberry Pi 4. with:
> OpenWrt SNAPSHOT r13626-751e6ab8e6 / LuCI Master git-20.175.45303-bb95e67
> Kernel Version: 5.4.48
> 
> # lsusb
> Bus 002 Device 002: ID 0e8d:7612 MediaTek Inc.
> 
> |My AP keeps dieing (I suspect when it's under load and some other condition
> :-(). mt76x2u 2-1:1.0: error: mt76x02u_mcu_wait_resp failed with -110| I
> tried:
> 
> https://superuser.com/questions/176319/hard-reset-usb-in-ubuntu-10-04

Did you try running the usbreset program described in that web page?

> cd /sys/bus/usb/drivers/usb
> 
> echo 2-2 > unbind ; sleep 3 ; echo 2-2 > bind I think it should be 2-1 so I
> tried that:
> 
> echo 2-1 > unbind ; sleep 3 ; echo 2-1 > bind
> 
> |[ 3539.309730] mt76x2u 2-1:1.0: firmware upload failed: -110
> [ 3540.828260] mt76x2u: probe of 2-1:1.0 failed with error -5|
> That didn't work.
> Physically removing reinserting works (if I also "reset" the wifi in OpenWrt
> (I don't know what this does)).
> 
> There must be a way to remove/reinsert in software instead of rebooting.

Well no, actually there isn't.  Removing a cable breaks the power 
connection; if the device gets its power from the USB cable then it goes 
through a complete shutdown (and restart when you plug it back in).  On 
most computers and USB hubs, there is no way to turn off power to the USB 
ports in software -- the hardware simply won't do it.  _Some_ hubs can 
turn off port power, but most can't.

It is possible to do various sorts of reset in software, such as by using 
the usbreset program mentioned above.  But none of them do exactly the 
same thing as unplugging and replugging the USB cable.

Alan Stern
