Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E22254DB381
	for <lists+linux-usb@lfdr.de>; Wed, 16 Mar 2022 15:41:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344251AbiCPOmb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Mar 2022 10:42:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237870AbiCPOma (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Mar 2022 10:42:30 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 755215F257
        for <linux-usb@vger.kernel.org>; Wed, 16 Mar 2022 07:41:16 -0700 (PDT)
Received: (qmail 1762666 invoked by uid 1000); 16 Mar 2022 10:41:15 -0400
Date:   Wed, 16 Mar 2022 10:41:15 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc:     "Schmid, Carsten" <Carsten_Schmid@mentor.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: Trouble with Intenso FlashLine 32GB USB stick on Kernel 4.14
Message-ID: <YjH3C/qhvs37EtUf@rowland.harvard.edu>
References: <1647437997247.23069@mentor.com>
 <YjHswpjToSM5Pr7n@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YjHswpjToSM5Pr7n@kroah.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Mar 16, 2022 at 02:57:22PM +0100, gregkh@linuxfoundation.org wrote:
> On Wed, Mar 16, 2022 at 01:39:57PM +0000, Schmid, Carsten wrote:
> > Hi Greg, Mathias,
> > 
> > i have a USB stick that - when plugged in - forces a USB storage hang message.
> > Prior to that message i can see USBDEVFS_CONTROL timeout messages.
> > (BTW the stick works fine on a desktop system with a recent kernel)
> > The stick is having  a USB-C connector, and is connected to a USB2 port through an adapter (that i also used on the Desktop system for a quick check, and it worked there on a USB2 port)
> > 
> > I built a reproducer and collected traces (see attachment).
> > As there is no MAINTAINER given for drivers/usb/core, i send that to you and the USB mailing list to ask someone to look into that.
> > 
> > >From the kernel's dmesg, these are the entries when trace has been recorded.
> > 
> > [159909.172301] usb 1-1: new high-speed USB device number 13 using xhci_hcd
> > [159909.314291] usb 1-1: New USB device found, idVendor=058f, idProduct=6387
> > [159909.314299] usb 1-1: New USB device strings: Mfr=1, Product=2, SerialNumber=3
> > [159909.314303] usb 1-1: Product: Intenso Flash Line
> > [159909.314306] usb 1-1: Manufacturer: ALCOR
> > [159909.314310] usb 1-1: SerialNumber: E13DF681
> > [159909.317093] usb-storage 1-1:1.0: USB Mass Storage device detected
> > [159909.319468] scsi host2: usb-storage 1-1:1.0
> > [159909.614535] usb 1-1: usbfs: USBDEVFS_CONTROL failed cmd NmeDefaultPrio rqt 192 rq 51 len 2 ret -110
> > [159909.665513] usb 1-1: usbfs: USBDEVFS_CONTROL failed cmd NmeDefaultPrio rqt 192 rq 51 len 2 ret -110
> > [159909.729510] usb 1-1: usbfs: USBDEVFS_CONTROL failed cmd NmeDefaultPrio rqt 192 rq 51 len 2 ret -110
> > [159909.780610] usb 1-1: usbfs: USBDEVFS_CONTROL failed cmd NmeDefaultPrio rqt 192 rq 51 len 2 ret -110
> 
> Why is usbfs being used for a storage device?  What userspace program do
> you have that is poking at the device?

The name of the program is mentioned right in the error message (the 
"cmd" item): NmeDefaultPrio.  Don't know what package that program 
belongs to.

Alan Stern
