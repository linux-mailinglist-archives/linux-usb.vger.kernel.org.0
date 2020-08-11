Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AACE242057
	for <lists+linux-usb@lfdr.de>; Tue, 11 Aug 2020 21:31:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726527AbgHKTbv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Aug 2020 15:31:51 -0400
Received: from netrider.rowland.org ([192.131.102.5]:54001 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1726068AbgHKTbv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Aug 2020 15:31:51 -0400
Received: (qmail 345017 invoked by uid 1000); 11 Aug 2020 15:31:50 -0400
Date:   Tue, 11 Aug 2020 15:31:50 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Patrik Nilsson <nipatriknilsson@gmail.com>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Subject: Re: high speed data to usb disk makes the kernel think that is has
 been unmounted
Message-ID: <20200811193150.GA344152@rowland.harvard.edu>
References: <a161e45d-6ce8-2077-c513-380b67c4dfd8@gmail.com>
 <20200811175655.GB828356@kroah.com>
 <47a5804c-835a-f1a2-abce-50b3531f2556@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47a5804c-835a-f1a2-abce-50b3531f2556@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 11, 2020 at 08:34:53PM +0200, Patrik Nilsson wrote:
> Hi Greg,
> > Can you provide kernel logs?  Odds are the disk disconnects itself as it
> > takes too much power or something.
> udev-kernel logs can be found:
> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1886172

The bug report doesn't seem to contain any dmesg kernel logs showing 
what happens when the problem occurs.

Also, the bug report indicates that you started to do a bisection 
looking for the kernel version where the problem first appears, but 
there's no mention of the final result.

The bug report also indicates that one of your tests involves copying 
/dev/zero to a mounted disk device!  That is highly likely to crash the 
kernel regardless of what the hardware does.  What happens if you 
unmount the disk before running the test?

Alan Stern
