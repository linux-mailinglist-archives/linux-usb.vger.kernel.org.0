Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B904F5593B1
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jun 2022 08:45:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230071AbiFXGnZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jun 2022 02:43:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229861AbiFXGnV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jun 2022 02:43:21 -0400
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 3592444746;
        Thu, 23 Jun 2022 23:43:20 -0700 (PDT)
Received: from ip6-localhost (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 25O6dolY023080;
        Fri, 24 Jun 2022 01:39:51 -0500
Message-ID: <46f88070d8f6f47f55310e964a4576cadbc810f4.camel@kernel.crashing.org>
Subject: Re: [PATCH] usb: gadget: aspeed_udc: fix handling of tx_len == 0
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     "neal_liu@aspeedtech.com" <neal_liu@aspeedtech.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "balbi@kernel.org" <balbi@kernel.org>
Date:   Fri, 24 Jun 2022 16:39:50 +1000
In-Reply-To: <20220624063457.GG11460@kadam>
References: <YrMsU9HvdBm5YrRH@kili>
         <HK0PR06MB32023259EBD6B4C649C62E8280B59@HK0PR06MB3202.apcprd06.prod.outlook.com>
         <20220623064320.GN16517@kadam>
         <e0b1c201bec2ccb68d1779ea8e9cfdf27563dd73.camel@amazon.com>
         <20220624063457.GG11460@kadam>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

(switching back to my normal "community" email)

On Fri, 2022-06-24 at 09:34 +0300, Dan Carpenter wrote:
> > Hrm... what is that driver ? I've missed it ... is the code lifted
> > from
> > aspeed-vhub ? If yes, should we instead make it a common code base
> > ?
> > And if there are bug fixes on one they might apply to the other as
> > well...
> 
> 
> No, I'm the person who introduced the bug so it's unique to this
> driver.

Ok thanks. That said, the code looks fairly similar to the vhub code,
so my comment stands, if this is the same IP block, which it appears to
be, the driver should be common.

IE. The vhub is made of a virtual hub with a bunch of UDCs underneath,
this appears to address the ast2600 "new" standalone (no hub) variant
of said UDC if I'm not mistaken.

The way I structured the code in vhub, it shouldn't be overly difficult
to make it standalone. I wrote (and maintain) aspeed-vhub and would be
happy to work on this if I got sent an ast2600 board.

Cheers,
Ben.

