Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 932B3229ADB
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jul 2020 16:59:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732483AbgGVO7P (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jul 2020 10:59:15 -0400
Received: from netrider.rowland.org ([192.131.102.5]:47549 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1730600AbgGVO7O (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jul 2020 10:59:14 -0400
Received: (qmail 1314062 invoked by uid 1000); 22 Jul 2020 10:59:13 -0400
Date:   Wed, 22 Jul 2020 10:59:13 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     WeitaoWangoc <WeitaoWang-oc@zhaoxin.com>,
        mathias.nyman@linux.intel.com, ulf.hansson@linaro.org,
        vkoul@kernel.org, hslester96@gmail.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Carsten_Schmid@mentor.com,
        efremov@linux.com, tonywwang@zhaoxin.com, weitaowang@zhaoxin.com,
        CobeChen@zhaoxin.com, TimGuo@zhaoxin.com, wwt8723@163.com
Subject: Re: [PATCH] USB:Fix kernel NULL pointer when unbind UHCI form
 vfio-pci
Message-ID: <20200722145913.GB1310843@rowland.harvard.edu>
References: <1595419068-4812-1-git-send-email-WeitaoWang-oc@zhaoxin.com>
 <20200722124414.GA3153105@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200722124414.GA3153105@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jul 22, 2020 at 02:44:14PM +0200, Greg KH wrote:
> On Wed, Jul 22, 2020 at 07:57:48PM +0800, WeitaoWangoc wrote:
> > This bug is found in Zhaoxin platform, but it's a commom code bug.
> > Fail sequence:
> > step1: Unbind UHCI controller from native driver;
> > step2: Bind UHCI controller to vfio-pci, which will put UHCI controller in one vfio
> >        group's device list and set UHCI's dev->driver_data to struct vfio-pci(for UHCI)
> 
> Hah, that works?  How do you do that properly?  What code does that?

Yeah, that can't possibly work.  The USB core expects that any host 
controller device (or at least, any PCI host controller device) has its 
driver_data set to point to a struct usb_hcd.  It doesn't expect a host 
controller to be bound to anything other than a host controller driver.

Things could easily go very wrong here.  For example, suppose at this 
point the ehci-hcd driver just happens to bind to the EHCI controller.  
When this happens, the EHCI controller hardware takes over all the USB 
connections that were routed to the UHCI controller.  How will vfio-pci 
deal with that?  Pretty ungracefully, I imagine.

The only way to make this work at all is to unbind both uhci-hcd and 
ehci-hcd first.  Then after both are finished you can safely bind 
vfio-pci to the EHCI controller and the UHCI controllers (in that 
order).

Alan Stern
