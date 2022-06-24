Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB57F5598C3
	for <lists+linux-usb@lfdr.de>; Fri, 24 Jun 2022 13:46:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231667AbiFXLpC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 24 Jun 2022 07:45:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231545AbiFXLpA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 24 Jun 2022 07:45:00 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6063D7B35E;
        Fri, 24 Jun 2022 04:44:59 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 238C4B82844;
        Fri, 24 Jun 2022 11:44:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AA41C34114;
        Fri, 24 Jun 2022 11:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1656071096;
        bh=5Tm2xIThPEQH7daxMrKHrQTQlwdPZNy13QOFOTFFjxw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=o8ImJxiBSpFS9U6JzlTgEqOQk3LsuUqcYpoNxz5aADpNrP4+iq7IMH2Dh98xihbRM
         U5JQ4mL/RE3fTyiyUL7Iq4S9xOrNQnJb9PEZPGw40QJ/yLkq67WP00KQ2jUdypMr5M
         aJ6TYkUYW3c0h0lP/E2CH1/KViWmYUR3krmM1Luc=
Date:   Fri, 24 Jun 2022 13:35:54 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Neal Liu <neal_liu@aspeedtech.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Felipe Balbi <balbi@kernel.org>, Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        "linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel-janitors@vger.kernel.org" <kernel-janitors@vger.kernel.org>
Subject: Re: [PATCH v2] usb: gadget: aspeed_udc: fix handling of tx_len == 0
Message-ID: <YrWhmkqpDuL34rQR@kroah.com>
References: <YrRj38cU1nV4gsUX@kili>
 <HK0PR06MB3202A24ACAA94B6525ECA7DF80B49@HK0PR06MB3202.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <HK0PR06MB3202A24ACAA94B6525ECA7DF80B49@HK0PR06MB3202.apcprd06.prod.outlook.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 24, 2022 at 02:01:18AM +0000, Neal Liu wrote:
> > The bug is that we should still enter this loop if "tx_len" is zero.
> > 
> > Reported-by: Neal Liu <neal_liu@aspeedtech.com>
> > Fixes: c09b1f372e74 ("usb: gadget: aspeed_udc: cleanup loop in
> > ast_dma_descriptor_setup()")
> > Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> > ---
> > v2: Remove the unnecessary "chunk >= 0" condition
> 
> I mean v1 looks good to me.
> Sorry if you are misunderstanding.

I have no idea if v1 or v2 is the "correct" one here, sorry.

Dan, can you send a v3 that you all agree on?

thanks,

greg k-h
