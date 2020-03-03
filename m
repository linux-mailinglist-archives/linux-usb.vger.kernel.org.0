Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EA141177C13
	for <lists+linux-usb@lfdr.de>; Tue,  3 Mar 2020 17:40:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728787AbgCCQjs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 3 Mar 2020 11:39:48 -0500
Received: from mail.kernel.org ([198.145.29.99]:48740 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725932AbgCCQjr (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 3 Mar 2020 11:39:47 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 10A17215A4;
        Tue,  3 Mar 2020 16:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1583253587;
        bh=AZQG6MdUEJBQV93leuXyfSfp0lHi/3ZxaHYGmOIX+IE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ko3U7HHXxcUZszQzz0fUwsnPLds0Yb0UEwsdaWo+ofcqc8ffEgJOPBkaoO7uNUNpU
         5Ux4FKTvl/+N3hALk1Ui074fmV9z2wu76La7Rnerof+joNEHvQHSA3yas1uokdDhZG
         GHNgJg7bKSV5Lhxc/u4BUAk7kOisfkPpO5zljMZc=
Date:   Tue, 3 Mar 2020 17:39:45 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Jonas Karlsson <jonas.karlsson@actia.se>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: USB transaction errors causing RCU stalls and kernel panics
Message-ID: <20200303163945.GB652754@kroah.com>
References: <ddf8c3971b8544e983a9d2bbdc7f2010@actia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ddf8c3971b8544e983a9d2bbdc7f2010@actia.se>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Mar 03, 2020 at 03:05:50PM +0000, Jonas Karlsson wrote:
> Hi,
> 
> We have a board with an NXP i.MX8 SoC. We are running Linux 4.19.35 from NXP on the SoC.
> 
> There is a modem connected to the SoC via USB through a USB hub. 
> The modem presents it self as a cdc-acm device with 4 tty:s.
> 
> Sometimes we end up in a situation where all transfers over USB generetes 'USB transaction Errors". 
> It is likely that the modem is misbehaving. When this happens we get a lot of "xhci-cdns3: ERROR unknown event type 37" 
> in the terminal indicating that the xhci event ring is full. This often leads to RCU stalls and sometimes Kernel panics.
> 
> If I enable dynamic debug on xhci_hcd and cdc-acm I can see that all transfers have error code -71 
> (-EPROTO which in xhci translates to 'USB transaction error"). When this happens it seems 
> like xhci resets the ep, sets TR Deq Ptr to unstall the ep and then a new transfer is started 
> which also fails. This behavior generates a lot of events on the event ring which causes 
> 'ERROR unknown event type 37'. This loop of failing transfers seems to continue until we either unbind
> the USB driver or get a kernel panic. The SoC almost becomes unresponsive since it spends most of the 
> time executing usb interrupts. 
> 
> If I pull the reset pin of the USB hub and keep it in reset state at this point, the event loop of failing 
> transfers continues despite there is nothing on the USB bus any longer. The only way to get out of 
> that loop is to either unbind the usb driver or power cycle the board.
> 
> Is this the expected behavior when USB transaction error happens for all transfers when using cdc-acm class driver?
> Or could there be something wrong in the low level USB driver (Cadence in our case)? We need to figure out why we 
> get all the transaction errors but we also need to make sure the kernel does not die on us when we have a misbehaving USB device. 
> Does anyone have a suggestion on what we could do to improve the stability of the kernel in this situation?

I would blame the xhci-cdns driver as it is the one controlling all of
this.

I don't see this driver in the 4.19 tree, so I think you are going to
have to get support from the company that provided you with that driver
as you are already paying for that support from them :)

good luck!

greg k-h
