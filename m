Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E29711783B1
	for <lists+linux-usb@lfdr.de>; Tue,  3 Mar 2020 21:08:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731338AbgCCUIn convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 3 Mar 2020 15:08:43 -0500
Received: from mail.actia.se ([195.67.112.82]:21568 "EHLO mail.actia.se"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729860AbgCCUIm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 3 Mar 2020 15:08:42 -0500
Received: from S036ANL.actianordic.se (192.168.16.117) by
 S035ANL.actianordic.se (192.168.16.116) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1913.5; Tue, 3 Mar 2020 21:08:39 +0100
Received: from S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69]) by
 S036ANL.actianordic.se ([fe80::e13e:1feb:4ea6:ec69%3]) with mapi id
 15.01.1913.007; Tue, 3 Mar 2020 21:08:39 +0100
From:   Jonas Karlsson <jonas.karlsson@actia.se>
To:     Greg KH <gregkh@linuxfoundation.org>
CC:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: RE: USB transaction errors causing RCU stalls and kernel panics
Thread-Topic: USB transaction errors causing RCU stalls and kernel panics
Thread-Index: AdXxbFdECZ2tmAAoQZaxVkfgHyprqgABZ9yAAAiGryA=
Date:   Tue, 3 Mar 2020 20:08:38 +0000
Message-ID: <ca6f029a57f24ee9aea39385a9ad55bd@actia.se>
References: <ddf8c3971b8544e983a9d2bbdc7f2010@actia.se>
 <20200303163945.GB652754@kroah.com>
In-Reply-To: <20200303163945.GB652754@kroah.com>
Accept-Language: sv-SE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.20.121.3]
x-esetresult: clean, is OK
x-esetid: 37303A2914C9726A637161
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> 
> On Tue, Mar 03, 2020 at 03:05:50PM +0000, Jonas Karlsson wrote:
> > Hi,
> >
> > We have a board with an NXP i.MX8 SoC. We are running Linux 4.19.35 from
> NXP on the SoC.
> >
> > There is a modem connected to the SoC via USB through a USB hub.
> > The modem presents it self as a cdc-acm device with 4 tty:s.
> >
> > Sometimes we end up in a situation where all transfers over USB generetes
> 'USB transaction Errors".
> > It is likely that the modem is misbehaving. When this happens we get a lot of
> "xhci-cdns3: ERROR unknown event type 37"
> > in the terminal indicating that the xhci event ring is full. This often leads to RCU
> stalls and sometimes Kernel panics.
> >
> > If I enable dynamic debug on xhci_hcd and cdc-acm I can see that all
> > transfers have error code -71 (-EPROTO which in xhci translates to
> > 'USB transaction error"). When this happens it seems like xhci resets
> > the ep, sets TR Deq Ptr to unstall the ep and then a new transfer is
> > started which also fails. This behavior generates a lot of events on
> > the event ring which causes 'ERROR unknown event type 37'. This loop
> > of failing transfers seems to continue until we either unbind the USB driver or
> get a kernel panic. The SoC almost becomes unresponsive since it spends most
> of the time executing usb interrupts.
> >
> > If I pull the reset pin of the USB hub and keep it in reset state at
> > this point, the event loop of failing transfers continues despite
> > there is nothing on the USB bus any longer. The only way to get out of that
> loop is to either unbind the usb driver or power cycle the board.
> >
> > Is this the expected behavior when USB transaction error happens for all
> transfers when using cdc-acm class driver?
> > Or could there be something wrong in the low level USB driver (Cadence
> > in our case)? We need to figure out why we get all the transaction errors but
> we also need to make sure the kernel does not die on us when we have a
> misbehaving USB device.
> > Does anyone have a suggestion on what we could do to improve the stability
> of the kernel in this situation?
> 
> I would blame the xhci-cdns driver as it is the one controlling all of this.
> 
> I don't see this driver in the 4.19 tree, so I think you are going to have to get
> support from the company that provided you with that driver as you are already
> paying for that support from them :)
> 
> good luck!
> 
> greg k-h

Thanks for the feedback! If the cadence driver is the main suspect I totally agree with you.

The reason I posted on this mailing list was that I was afraid that the cdc-acm driver could
be causing new transfers to be started when the previous fails due to USB transaction errors and
then trigger this event storm.
The acm_ctrl_irq() function seems to submit a new urb directly if the previous fails, but I cannot 
say that I understand that code very well yet. The acm_read_bulk_callback() function also seem
to submit a new read urb on USB transaction Errors. But If you think this could not cause this
behavior I will ask our supplier to fix the cdns driver.

BR,
Jonas

