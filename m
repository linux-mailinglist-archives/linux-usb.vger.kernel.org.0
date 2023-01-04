Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A216B65D9AC
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jan 2023 17:27:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239908AbjADQ1D (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Jan 2023 11:27:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239832AbjADQ1A (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Jan 2023 11:27:00 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 468FD1B9E1
        for <linux-usb@vger.kernel.org>; Wed,  4 Jan 2023 08:26:59 -0800 (PST)
Received: (qmail 472771 invoked by uid 1000); 4 Jan 2023 11:26:58 -0500
Date:   Wed, 4 Jan 2023 11:26:58 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Frank Li <Frank.Li@nxp.com>, Rondreis <linhaoguo86@gmail.com>,
        Chanh Nguyen <chanh@os.amperecomputing.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: The "bus for gadgets" is preventing the use of multiple UDCs
Message-ID: <Y7Wo0jyqKuB2iUsc@rowland.harvard.edu>
References: <Y7WkOwcNYl2mWyiW@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7WkOwcNYl2mWyiW@kuha.fi.intel.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 04, 2023 at 06:07:23PM +0200, Heikki Krogerus wrote:
> Hi,
> 
> Before the introduction of this bus it was possible to use configfs
> with multiple device controllers:
> 
>         echo "dwc3.1.auto" > usb_gadget/g1/UDC
>         echo "dwc3.2.auto" > usb_gadget/g2/UDC
> 
> But now only one UDC can be assigned. When I try to assign the second
> UDC for g2, I get this error:
> 
>         Error: Driver 'configfs-gadget' is already registered, aborting...
>         UDC core: g2: driver registration failed: -16

Two separate patches have been submitted to fix this.  See:

https://lore.kernel.org/linux-usb/20221213220354.628013-1-Frank.Li@nxp.com/
https://lore.kernel.org/linux-usb/20221221091317.19380-1-chanh@os.amperecomputing.com/

So far, neither of them has been merged.

Alan Stern
