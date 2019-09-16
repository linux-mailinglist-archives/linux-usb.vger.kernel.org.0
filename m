Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 07FB6B3DA4
	for <lists+linux-usb@lfdr.de>; Mon, 16 Sep 2019 17:28:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389120AbfIPP2T (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Sep 2019 11:28:19 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:51076 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1727374AbfIPP2T (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 16 Sep 2019 11:28:19 -0400
Received: (qmail 3496 invoked by uid 2102); 16 Sep 2019 11:28:18 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 16 Sep 2019 11:28:18 -0400
Date:   Mon, 16 Sep 2019 11:28:18 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Rhys Kidd <rhyskidd@gmail.com>
cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, <linux-accelerators@lists.ozlabs.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        "David S . Miller" <davem@davemloft.net>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexander Shiyan <shc_work@mail.ru>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Johan Hovold <johan@kernel.org>
Subject: Re: [RFC PATCH 1/1] USB: myriad-ma24xx-vsc: Firmware loader driver
 for USB Myriad ma24xx
In-Reply-To: <20190916110341.1310-2-rhyskidd@gmail.com>
Message-ID: <Pine.LNX.4.44L0.1909161127030.1489-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 16 Sep 2019, Rhys Kidd wrote:

> The Myriad ma24xx in USB Intel Neural Compute Stick and Intel Neural
> Compute Stick 2 provides an API to accelerate AI inference calculations
> on the dedicated SHAVE VLIW vector co-processors, which are orchestrated
> by one or more LEON SPARC v8 real time cores.
> 
> However, they need firmware to be loaded beforehand. An uninitialised
> Myriad ma24xx presents with a distinctive USB ID. After firmware
> loading, the device detaches from the USB bus and reattaches with a new
> device ID. It can then be claimed by the usermode driver.

Is there any particular reason you need to have a kernel driver load 
the firmware?  Why can't a user program take care of it?  The 
usb_modeswitch program does that sort of thing all the time.

Alan Stern

