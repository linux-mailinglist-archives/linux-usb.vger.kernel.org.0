Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A3A355B4F2
	for <lists+linux-usb@lfdr.de>; Mon, 27 Jun 2022 03:38:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229742AbiF0Bdr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 26 Jun 2022 21:33:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229603AbiF0Bdq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 26 Jun 2022 21:33:46 -0400
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 716EE2673;
        Sun, 26 Jun 2022 18:33:45 -0700 (PDT)
Received: from ip6-localhost (localhost.localdomain [127.0.0.1])
        by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 25R1UGbi027657;
        Sun, 26 Jun 2022 20:30:18 -0500
Message-ID: <c960c2e02ddeacd527442e0b3b0db532c9017e1b.camel@kernel.crashing.org>
Subject: Re: [PATCH] usb: gadget: aspeed_udc: fix handling of tx_len == 0
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     Neal Liu <neal_liu@aspeedtech.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Cc:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "balbi@kernel.org" <balbi@kernel.org>
Date:   Mon, 27 Jun 2022 11:30:15 +1000
In-Reply-To: <HK0PR06MB32024B6C49E2C958185E005280B49@HK0PR06MB3202.apcprd06.prod.outlook.com>
References: <YrMsU9HvdBm5YrRH@kili>
         <HK0PR06MB32023259EBD6B4C649C62E8280B59@HK0PR06MB3202.apcprd06.prod.outlook.com>
         <20220623064320.GN16517@kadam>
         <e0b1c201bec2ccb68d1779ea8e9cfdf27563dd73.camel@amazon.com>
         <20220624063457.GG11460@kadam>
         <46f88070d8f6f47f55310e964a4576cadbc810f4.camel@kernel.crashing.org>
         <HK0PR06MB32024B6C49E2C958185E005280B49@HK0PR06MB3202.apcprd06.prod.outlook.com>
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

On Fri, 2022-06-24 at 07:46 +0000, Neal Liu wrote:
> > 
> Hi Ben, This UDC is the independent IP. The ast2600 board can run
> aspeed-vhub & aspeed_udc simultaneously with different USB port.
> I think it's no need to restruct the code in vhub.

But is it a copy of the same base IP block ? IE, is the fundamental HW
interface of the independent UDC operating the same way with the same
register layout as one of the ports of the vHUB ?

I don't like having multiple drivers for the same hardware... if it's
different enough, then let's keep it separate, but if not, we should
definitely split the udc from the existing vhub code so that the same
driver can operate standalone or beneath a vhub. 

Cheers,
Ben.

