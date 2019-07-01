Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B832CE43C
	for <lists+linux-usb@lfdr.de>; Mon, 29 Apr 2019 16:06:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728303AbfD2OGG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Apr 2019 10:06:06 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:54102 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728189AbfD2OGF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 29 Apr 2019 10:06:05 -0400
Received: (qmail 1756 invoked by uid 2102); 29 Apr 2019 10:06:04 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 29 Apr 2019 10:06:04 -0400
Date:   Mon, 29 Apr 2019 10:06:04 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     "Tangnianyao (ICT)" <tangnianyao@huawei.com>
cc:     mathias.nyman@intel.com, <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [RFC] Question about reset order for xhci controller and pci
In-Reply-To: <160fa1ea-2e82-343b-d5d6-2b9adde70cf4@huawei.com>
Message-ID: <Pine.LNX.4.44L0.1904291002290.1632-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 29 Apr 2019, Tangnianyao (ICT) wrote:

> Using command "echo 1 > /sys/bus/pci/devices/0000:7a:02.0/reset"
> on centos7.5 system to reset xhci.
> 
> On 2019/4/26 11:07, Tangnianyao (ICT) wrote:
> > Hi,all
> > 
> > I've meet a problem about reset xhci and it may be caused by the
> > reset order of pci and xhci.
> > Using xhci-pci, when users send reset command in os(centos or red-hat os),
> > it would first reset PCI device by pci_reset_function. During this
> > process, it would disable BME(Bus Master Enable) and set BME=0, and
> > then enable it and set BME=1.
> > And then it comes to xhci reset process. First, it would send an
> > endpoint stop command in xhci_urb_dequeue. However, this stop ep command
> > fails to finish. The reason is that BME is set to 0 in former process and
> > xhci RUN/STOP changes to 0, and when BME is set to 1 again, RUN/STOP doesn't
> > recover to 1.
> > I've checked BME behavior in xhci spec, it shows that "If the BME bit is set to 0
> > when xHC is running, the xHC may treat this as a Host Controller Error, asserting
> > HCE(1) and immediately halt(R/S=0 and HCH=1). Recovery from this state will
> > require an HCRST." It seems that the stop ep command failure is reasonable.
> > Maybe I've missed something and please let me know.

Your email subject says "Question about...".  What is the question?

Also, given that your question concerns what happens when you write to
/sys/bus/pci/..., perhaps you should consider mailing it to some PCI
maintainers as well as to the USB maintainers.

Perhaps the reset was not meant to be used the way you are doing it.  
A more conservative approach would be to unbind xhci-hcd from the 
device before doing the reset and then rebind it afterward.

Alan Stern

