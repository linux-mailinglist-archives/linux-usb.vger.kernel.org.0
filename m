Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D2561D52DC
	for <lists+linux-usb@lfdr.de>; Fri, 15 May 2020 17:02:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726656AbgEOPCc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 15 May 2020 11:02:32 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:57671 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726144AbgEOPCc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 15 May 2020 11:02:32 -0400
Received: from localhost (lfbn-lyo-1-1912-bdcst.w90-65.abo.wanadoo.fr [90.65.91.255])
        (Authenticated sender: alexandre.belloni@bootlin.com)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 18597240009;
        Fri, 15 May 2020 15:02:28 +0000 (UTC)
Date:   Fri, 15 May 2020 17:02:28 +0200
From:   Alexandre Belloni <alexandre.belloni@bootlin.com>
To:     cristian.birsan@microchip.com
Cc:     balbi@kernel.org, gregkh@linuxfoundation.org,
        nicolas.ferre@microchip.com, ludovic.desroches@microchip.com,
        robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/7] usb: gadget: udc: atmel: add usb device support
 for SAM9x60 SoC
Message-ID: <20200515150228.GW34497@piout.net>
References: <20200515111631.31210-1-cristian.birsan@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200515111631.31210-1-cristian.birsan@microchip.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On 15/05/2020 14:16:24+0300, cristian.birsan@microchip.com wrote:
> From: Cristian Birsan <cristian.birsan@microchip.com>
> 
> This patch set adds usb device support for SAM9x60 SoC.
> The DPRAM memory for the USB High Speed Device Port (UDPHS) hardware
> block was increased and the allocation method is changed. This patch
> series simplifies the endpoint allocation scheme to acomodate this SoC
> and the old ones.
> 
> Changes in v2:
> - drop the patch that adds reference to pmc for sam9x60
> - use dt-bindings: usb prefix
> - enable usb device in device tree
> 
> Claudiu Beznea (1):
>   usb: gadget: udc: atmel: use of_find_matching_node_and_match
> 
> Cristian Birsan (6):
>   dt-bindings: usb: atmel: Update DT bindings documentation for sam9x60
>   usb: gadget: udc: atmel: simplify endpoint allocation
>   usb: gadget: udc: atmel: use 1 bank endpoints for control transfers
>   usb: gadget: udc: atmel: rename errata into caps
>   usb: gadget: udc: atmel: update endpoint allocation for sam9x60
>   ARM: dts: at91: sam9x60ek: enable usb device

This should probably be rebased on top of
https://lore.kernel.org/linux-arm-kernel/20200507155651.1094142-1-gregory.clement@bootlin.com/
so we avoid having to define the endpoints in the device tree in the
first place.

-- 
Alexandre Belloni, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
