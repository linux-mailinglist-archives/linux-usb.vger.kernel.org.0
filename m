Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 665E32227A4
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jul 2020 17:41:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728837AbgGPPlP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Jul 2020 11:41:15 -0400
Received: from netrider.rowland.org ([192.131.102.5]:46539 "HELO
        netrider.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728714AbgGPPlP (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Jul 2020 11:41:15 -0400
Received: (qmail 1114001 invoked by uid 1000); 16 Jul 2020 11:41:13 -0400
Date:   Thu, 16 Jul 2020 11:41:13 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>
Subject: Re: [PATCH 2/2 v2] usb: ohci-omap: Convert to use GPIO descriptors
Message-ID: <20200716154113.GD1112537@rowland.harvard.edu>
References: <20200716123433.155854-1-linus.walleij@linaro.org>
 <20200716123433.155854-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200716123433.155854-2-linus.walleij@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 16, 2020 at 02:34:33PM +0200, Linus Walleij wrote:
> The OMAP1 OHCI driver is using the legacy GPIO API to grab some
> random GPIO lines. One is from the TPS65010 chip and used for
> power, another one is for overcurrent and while the driver picks
> this line it doesn't watch it at all.

If the driver doesn't use this GPIO, why keep the code to grab it?

> Convert the driver and the OMAP1 OSK board file to pass these
> two GPIOs as machine descrived GPIO descriptors.
-----------------------------^

> 
> Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Aside from this I don't have any objections.

Alan Stern
