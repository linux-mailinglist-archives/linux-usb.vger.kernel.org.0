Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A9683658E2B
	for <lists+linux-usb@lfdr.de>; Thu, 29 Dec 2022 15:59:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233472AbiL2O7x (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 29 Dec 2022 09:59:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233664AbiL2O7t (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 29 Dec 2022 09:59:49 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 49F5312602
        for <linux-usb@vger.kernel.org>; Thu, 29 Dec 2022 06:59:48 -0800 (PST)
Received: (qmail 307636 invoked by uid 1000); 29 Dec 2022 09:59:47 -0500
Date:   Thu, 29 Dec 2022 09:59:47 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Dan Scally <dan.scally@ideasonboard.com>,
        linux-usb@vger.kernel.org, balbi@kernel.org,
        gregkh@linuxfoundation.org, kieran.bingham@ideasonboard.com,
        torleiv@huddly.com, mgr@pengutronix.de
Subject: Re: [PATCH v2 8/9] usb: gadget: uvc: Allow linking function to
 string descs
Message-ID: <Y62rY/HvXEXiUbI0@rowland.harvard.edu>
References: <20221121092517.225242-1-dan.scally@ideasonboard.com>
 <20221121092517.225242-9-dan.scally@ideasonboard.com>
 <a350247d-396a-d732-793d-f9e07a09d032@ideasonboard.com>
 <Y6z2i6ANAKzgf/x6@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y6z2i6ANAKzgf/x6@pendragon.ideasonboard.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Dec 29, 2022 at 04:08:11AM +0200, Laurent Pinchart wrote:
> I haven't dug in the USB gadget configfs implementation, but I think
> string support is something that shouldn't be specific to the UVC
> gadget. I think we should be able to create a config item of "type"
> string, and have gadget helpers handle the rest.
> 
> Feedback from the USB gadget maintainers would be useful.

Absolutely there should be support for arbitrary strings in the gadget 
configfs core.  After all, it already supports strings for the vendor 
and product names.

Alan Stern
