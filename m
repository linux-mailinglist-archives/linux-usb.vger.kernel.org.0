Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1AA8C194E3A
	for <lists+linux-usb@lfdr.de>; Fri, 27 Mar 2020 01:58:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727809AbgC0A6A (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Mar 2020 20:58:00 -0400
Received: from netrider.rowland.org ([192.131.102.5]:50393 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727683AbgC0A6A (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 26 Mar 2020 20:58:00 -0400
Received: (qmail 16053 invoked by uid 500); 26 Mar 2020 20:57:59 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 26 Mar 2020 20:57:59 -0400
Date:   Thu, 26 Mar 2020 20:57:59 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@netrider.rowland.org
To:     John Donnelly <john.p.donnelly@oracle.com>
cc:     linux-usb@vger.kernel.org
Subject: Re: Question :  remote "ILO" setup - keyboard and mouse enumeration
In-Reply-To: <7A2988F9-C174-4A13-8F0E-B3D73A33DF47@oracle.com>
Message-ID: <Pine.LNX.4.44L0.2003262047590.15302-100000@netrider.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 26 Mar 2020, John Donnelly wrote:

> Hi,
> 
> This is 10,000 foot question for a issue I am looking at :
> 
> Quite a few servers have a BCM that expose a USB keyboard and mouse
> when a " iLo client session " is started that also provides a remote
> console.
> 
> For instance on Bus 01.Port 1: Dev 1, Port 8 there are these devices :
> 
>  lsusb -t
> /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/10p, 5000M
> /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/16p, 480M
>     |__ Port 8: Dev 2, If 0, Class=Hub, Driver=hub/7p, 480M
>         |__ Port 3: Dev 3, If 0, Class=Communications, Driver=cdc_ether, 480M
>         |__ Port 3: Dev 3, If 1, Class=CDC Data, Driver=cdc_ether, 480M
> 
> 
> When a remote viewer ( iLO ) session is started, two HID appear under
> Port 8 :
> 
> 
>  lsusb -t
> /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/10p, 5000M
> /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/16p, 480M
>     |__ Port 8: Dev 2, If 0, Class=Hub, Driver=hub/7p, 480M
>         |__ Port 1: Dev 7, If 0, Class=Human Interface Device, Driver=usbhid,480M
>         |__ Port 2: Dev 6, If 0, Class=Human Interface Device, Driver=usbhid,480M
>         |__ Port 3: Dev 3, If 0, Class=Communications, Driver=cdc_ether, 480M
>         |__ Port 3: Dev 3, If 1, Class=CDC Data, Driver=cdc_ether, 480M
> 
> 
> Is this device tree showing me the Port 8 is somehow wired to the BCM
> ?  And the BCM did some sort of operation that causes the xhci_hcd
> driver to enumerate a new device ?

Yes, it looks that way.  The operation is just turning on a 
connection -- electronically closing a switch.  Same as if you plugged 
in a keyboard and a mouse.

> The driver :  “ usbhid “ in real life appears to be a built-in
> component to the kernel - Not a loadable module .  I suspect that is
> so keyboards always work.

That's a common design decision, but it doesn't have to be that way.  
If you build your own kernel, you can set it up any way you want.

> When the iLO session is terminated the two HID devices disappear . 
> 
> If anyone can point me documentation how this works I would appreciate it.  

You should look though the documentation for the BCM and iLO.  That's 
where you're most likely to find the answers.

Alan Stern

