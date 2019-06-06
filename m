Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 090CF376F7
	for <lists+linux-usb@lfdr.de>; Thu,  6 Jun 2019 16:37:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728850AbfFFOhM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 6 Jun 2019 10:37:12 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:51900 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728754AbfFFOhM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 6 Jun 2019 10:37:12 -0400
Received: (qmail 3593 invoked by uid 2102); 6 Jun 2019 10:37:11 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 6 Jun 2019 10:37:11 -0400
Date:   Thu, 6 Jun 2019 10:37:11 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     "Bollinger, Seth" <Seth.Bollinger@digi.com>
cc:     USB list <linux-usb@vger.kernel.org>,
        Seth Bollinger <seth.boll@gmail.com>
Subject: Re: USB reset problem
In-Reply-To: <A2655C7A-C29C-4462-A668-8F7B9C81A648@digi.com>
Message-ID: <Pine.LNX.4.44L0.1906061030580.1641-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 6 Jun 2019, Bollinger, Seth wrote:

> Hello All,
> 
> Recently we saw a problem where the device reset will fail due to a
> configuration descriptor check in hub.c:5600.
> 
>         if (memcmp(buf, udev->rawdescriptors[index], old_length)
>                 != 0) {
>             dev_dbg(&udev->dev, "config index %d changed (#%d)\n",
>                 index,
>                 ((struct usb_config_descriptor *) buf)->
>                     bConfigurationValue);
>             changed = 1;
>             break;
>         }
> 
> The descriptors returned from the device have a different iInterface.  
> I checked the usb spec and couldn’t find anything that says
> iInterface can’t change.  I don’t have the source for the device,
> but I think it’s probably generating the interface string each
> reset and returning a different index for it (“ADB interface”).
> 
> Has anyone else seen this?  Does the spec guarantee that iInterface
> should never change between device resets?

I have not seen this, and the spec doesn't really guarantee anything 
about what happens between device resets.

On the other hand, saying the reset failed in this case is not 
unreasonable.  The end result is that the device will be re-enumerated 
with its new iInterface value.

If this is really a problem we can change the code so that the 
iManufacturer, iProduct, iSerialNumber, iConfiguration, and iInterface 
descriptor values are exempt from the change check.  It would be a 
little difficult, though, because we would have to parse the 
descriptors to find out where the iInterface values are.

Alan Stern

