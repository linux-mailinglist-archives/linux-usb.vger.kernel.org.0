Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 833E648BEC5
	for <lists+linux-usb@lfdr.de>; Wed, 12 Jan 2022 08:03:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351078AbiALHDB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Jan 2022 02:03:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232181AbiALHC6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Jan 2022 02:02:58 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E446C06173F
        for <linux-usb@vger.kernel.org>; Tue, 11 Jan 2022 23:02:58 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CB9C1B818BD
        for <linux-usb@vger.kernel.org>; Wed, 12 Jan 2022 07:02:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC0E9C36AEA;
        Wed, 12 Jan 2022 07:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1641970975;
        bh=7JDA4k0zxJuMnbVH8EHiieDOvbm3seUgtaLOgeDkXOA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rQKKYmHGAwBUG17q02R5fBdSLthS6VjmxwV46n5IwRcFNXmHplpQiLFRrNVbRwASp
         Nj3XvmrRqkZ4zMv3bXdEpyQjkhERstY12dpUE72aI+6yQ/jiUsOo4fP2uIDpR9tvxR
         ihbgzIze1f893u4Ajif7p/5YIC6skiau2BTLkZXM=
Date:   Wed, 12 Jan 2022 08:02:52 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     James <bjlockie@lockie.ca>
Cc:     linux-usb <linux-usb@vger.kernel.org>
Subject: Re: problem with USB-C
Message-ID: <Yd59HLmparwNaok9@kroah.com>
References: <830aa508-5c20-c7c9-5ba9-04bcf5ac7178@lockie.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <830aa508-5c20-c7c9-5ba9-04bcf5ac7178@lockie.ca>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 11, 2022 at 07:56:53PM -0500, James wrote:
> $ lsusb -tv
> /:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 5000M
>     ID 1d6b:0003 Linux Foundation 3.0 root hub
> /:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 480M
>     ID 1d6b:0002 Linux Foundation 2.0 root hub
> /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 10000M
>     ID 1d6b:0003 Linux Foundation 3.0 root hub
> /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/10p, 480M
>     ID 1d6b:0002 Linux Foundation 2.0 root hub
>     |__ Port 5: Dev 2, If 0, Class=Human Interface Device, Driver=usbhid,
> 1.5M
>         ID 04d9:1503 Holtek Semiconductor, Inc. Keyboard
>     |__ Port 5: Dev 2, If 1, Class=Human Interface Device, Driver=usbhid,
> 1.5M
>         ID 04d9:1503 Holtek Semiconductor, Inc. Keyboard
>     |__ Port 6: Dev 3, If 0, Class=Human Interface Device, Driver=usbhid,
> 1.5M
>         ID 30fa:0400
> 
> With my USB3 drive plugged in to the USB-C port which is supposed to be
> USB3.1.
> https://asrock.com/MB/AMD/B450M%20Pro4/index.us.asp
> 
> $ lsusb -tv
> /:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 5000M
>     ID 1d6b:0003 Linux Foundation 3.0 root hub
> /:  Bus 03.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 480M
>     ID 1d6b:0002 Linux Foundation 2.0 root hub
> /:  Bus 02.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/4p, 10000M
>     ID 1d6b:0003 Linux Foundation 3.0 root hub
> /:  Bus 01.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/10p, 480M
>     ID 1d6b:0002 Linux Foundation 2.0 root hub
>     |__ Port 1: Dev 4, If 0, Class=Mass Storage, Driver=uas, 480M
>         ID 0bc2:2321 Seagate RSS LLC Expansion Portable
>     |__ Port 5: Dev 2, If 0, Class=Human Interface Device, Driver=usbhid,
> 1.5M
>         ID 04d9:1503 Holtek Semiconductor, Inc. Keyboard
>     |__ Port 5: Dev 2, If 1, Class=Human Interface Device, Driver=usbhid,
> 1.5M
>         ID 04d9:1503 Holtek Semiconductor, Inc. Keyboard
>     |__ Port 6: Dev 3, If 0, Class=Human Interface Device, Driver=usbhid,
> 1.5M
>         ID 30fa:0400
> 
> 
> Why are the hubs listed as Linux Foundation 3.0 root hubs and not 3.1 root
> hubs?

Because your devices do not advertise themselves as a USB 3.1 root hub.
Perhaps the documentation is incorrect?

thanks,

greg k-h
