Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A995E3EC7B2
	for <lists+linux-usb@lfdr.de>; Sun, 15 Aug 2021 08:28:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231631AbhHOG3U (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 15 Aug 2021 02:29:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:43402 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231238AbhHOG3U (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 15 Aug 2021 02:29:20 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4D4F660240;
        Sun, 15 Aug 2021 06:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1629008930;
        bh=4eLOsiU/fu2gZ8/ZvV6U9dnO9AR+LfRmF46STH+JBYE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=10Ai4I/tYqWV4G7H67lR5aG528RPqPOcBivmJjOcdmPWVnnuIiv15blJOIDqGM9lv
         tXIIEVdvIgepifbWK3vlNec0dlt8EudrOGCZrxPMTEpG75Po6p121ifYdK93+ZcIGP
         XqKmQTBKAX5LuLE6VZ2bgbFpC8uEbOMZx08MnkKw=
Date:   Sun, 15 Aug 2021 08:28:48 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Eyal Lebedinsky <eyal@eyal.emu.id.au>
Cc:     linux-usb@vger.kernel.org
Subject: Re: USB hub problem
Message-ID: <YRi0ICEZM+1eAyNu@kroah.com>
References: <3481f401-1d52-d5a1-d983-4b5f7046704b@eyal.emu.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3481f401-1d52-d5a1-d983-4b5f7046704b@eyal.emu.id.au>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Aug 15, 2021 at 09:32:06AM +1000, Eyal Lebedinsky wrote:
> I have an external 4-way USB3.0 hub (I actually have two of them) That do not behave as expected.
> It is an XCD XCDESSUSBH4BK. It is unpowered. I am on fedora 34, kernel 5.13.8-200.fc34.x86_64
> 
> For starters, I found that attaching a USB SSD does not allow booting from it.

That is up to your BIOS, not Linux.

> I then found that when attaching my phone it is not recognized.

In what way?

> I searched the hub model and IDs but did not find relevant information.
> Is there an official list of supported hubs (or devices)?

No, as any list would instantly be out of date.

> Here is what it looks like.
> 
> When the hub is attached (no phone) I see
>         Bus 001 Device 048: ID 0bda:5411 Realtek Semiconductor Corp. RTS5411 Hub
> and
>         /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/16p, 480M
>             |__ Port 5: Dev 5, If 0, Class=Hub, Driver=hub/4p, 480M
>                 |__ Port 2: Dev 48, If 0, Class=Hub, Driver=hub/4p, 480M
> Attaching the phone does not add a device.
> 
> Detaching/attaching the hub (with the phone already plugged in) I get
>         Bus 001 Device 052: ID 04e8:6860 Samsung Electronics Co., Ltd Galaxy A5 (MTP)
>         Bus 001 Device 051: ID 0bda:5411 Realtek Semiconductor Corp. RTS5411 Hub
> and
>         /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/16p, 480M
>             |__ Port 5: Dev 5, If 0, Class=Hub, Driver=hub/4p, 480M
>                 |__ Port 2: Dev 51, If 0, Class=Hub, Driver=hub/4p, 480M
>                     |__ Port 1: Dev 52, If 1, Class=Communications, Driver=cdc_acm, 480M
>                     |__ Port 1: Dev 52, If 2, Class=CDC Data, Driver=cdc_acm, 480M
>                     |__ Port 1: Dev 52, If 0, Class=Imaging, Driver=, 480M
>                     |__ Port 1: Dev 52, If 3, Class=Vendor Specific Class, Driver=, 480M
> and the phone is recognized and accessible as MTP device.

Great, so when does this not work?  This shows a successful device
found.

thanks,

greg k-h
