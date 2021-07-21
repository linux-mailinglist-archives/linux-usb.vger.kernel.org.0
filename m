Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1F353D1180
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jul 2021 16:36:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239157AbhGUNz4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Jul 2021 09:55:56 -0400
Received: from netrider.rowland.org ([192.131.102.5]:58021 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S239174AbhGUNzz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Jul 2021 09:55:55 -0400
Received: (qmail 634549 invoked by uid 1000); 21 Jul 2021 10:36:31 -0400
Date:   Wed, 21 Jul 2021 10:36:31 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Jason Quackenbush <jfquackenbush@gmail.com>
Cc:     linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
Subject: Re: [usb-storage] unusual diagnostic message requestl?
Message-ID: <20210721143631.GB633399@rowland.harvard.edu>
References: <CAORgStp5VT5MVHuBeZEVW08VaUkUfCNHqWhiEKFTchKGzrzf9g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAORgStp5VT5MVHuBeZEVW08VaUkUfCNHqWhiEKFTchKGzrzf9g@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 20, 2021 at 09:14:22PM -0700, Jason Quackenbush wrote:
> Hi, I received a strange notice in the dmesg log while trying to figure out
> why a thumb drive is misbehaving. It told me to send the message to these
> email addresses so I am doing as instructed. I've also included all the
> messages included in the string beginning with when I plugged the stick in
> up to the point where the log stopped because i ran the dmesg command.

Thanks for sending this in.

> Please let me know if you would like any additional information. The dmesg
> output was as follows:
> 
> [30931.644203] usb 1-2.1: new high-speed USB device number 23 using xhci_hcd
> [30931.720562] usb 1-2.1: New USB device found, idVendor=ffff,
> idProduct=1201
> [30931.720580] usb 1-2.1: New USB device strings: Mfr=0, Product=0,
> SerialNumber=0
> [30931.725709] usb-storage 1-2.1:1.0: USB Mass Storage device detected
> 
> 
> *[30931.731119] usb-storage 1-2.1:1.0: This device (ffff,1201,0000 S 06 P
> 50) has unneeded SubClass and Protocol entries in unusual_devs.h (kernel
> 4.16.18-galliumos)                  Please send a copy of this message to
> <linux-usb@vger.kernel.org <linux-usb@vger.kernel.org>> and
> <usb-storage@lists.one-eyed-alien.net
> <usb-storage@lists.one-eyed-alien.net>>*[30931.731321] scsi host0:
> usb-storage 1-2.1:1.0

I don't see any entry like that (vendor ID = 0xffff, product ID = 0x1201) in 
unusual_devs.h in the standard 4.16.18 kernel source.  Has your kernel been 
modified to add such an entry?

Assuming it has, it looks like the entry wasn't added correctly.  It 
probably should contain USB_SC_DEVICE and USB_PR_DEVICE rather than 
USB_SC_SCSI and USB_PR_BULK.

Alan Stern

PS: It also looks like that thumb drive was was programmed in a rather 
shoddy fashion, not compliant with the appropriate standards requirements.
