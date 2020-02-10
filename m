Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 14935158491
	for <lists+linux-usb@lfdr.de>; Mon, 10 Feb 2020 22:08:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727199AbgBJVI6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Feb 2020 16:08:58 -0500
Received: from netrider.rowland.org ([192.131.102.5]:34107 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727056AbgBJVI6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Feb 2020 16:08:58 -0500
Received: (qmail 15201 invoked by uid 500); 10 Feb 2020 16:08:56 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 10 Feb 2020 16:08:56 -0500
Date:   Mon, 10 Feb 2020 16:08:56 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     James Lockie <bjlockie@lockie.ca>
cc:     linux-usb@vger.kernel.org
Subject: Re: dmesg -> lsusb -t
In-Reply-To: <170302c8930.279c.665a3322dda79c663fe860d9fff7dd5d@lockie.ca>
Message-ID: <Pine.LNX.4.44L0.2002101559040.13988-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 10 Feb 2020, James Lockie wrote:

> 
> $ sudo lsusb -t
> /: Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 5000M
>     |__ Port 1: Dev 2, If 0, Class=Mass Storage, Driver=usb-storage, 5000M
> /: Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 480M
>     |__ Port 2: Dev 3, If 0, Class=Vendor Specific Class, Driver=, 480M
>     |__ Port 4: Dev 4, If 0, Class=Human Interface Device, Driver=usbfs, 1.5M
> /: Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 10000M
>     |__ Port 2: Dev 3, If 0, Class=Mass Storage, Driver=uas, 5000M
> 
> $ dmesg
> [42540.188430] usb 2-2: new SuperSpeed Gen 1 USB device number 3 using xhci_hcd
> 
> How is 'usb 2-2' mapped to lsusb?

It maps to the child entry below Bus 02 marked with Port 2.  In
addition, the dmesg line indicates that it maps to an entry with Dev 3.

> I'm guessing it is the last entry from lsusb?

Yes; that's the one which satisfies the mapping criteria.

> If it was a Gen 2 USB device it could run at 10000M?

Yes, assuming it was connected to a Gen 2 controller.

> Why is the first line of lsusb only 5000M?

Because that particular xHCI host controller is only Gen 1.

Alan Stern

