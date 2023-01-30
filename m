Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EDB9681689
	for <lists+linux-usb@lfdr.de>; Mon, 30 Jan 2023 17:37:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237449AbjA3Qhw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 30 Jan 2023 11:37:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235634AbjA3Qhv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 30 Jan 2023 11:37:51 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 6A44B3B0D0
        for <linux-usb@vger.kernel.org>; Mon, 30 Jan 2023 08:37:49 -0800 (PST)
Received: (qmail 414002 invoked by uid 1000); 30 Jan 2023 11:37:48 -0500
Date:   Mon, 30 Jan 2023 11:37:48 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Daniel Scally <dan.scally@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org,
        laurent.pinchart@ideasonboard.com, mgr@pengutronix.de,
        balbi@kernel.org, kieran.bingham@ideasonboard.com,
        torleiv@huddly.com
Subject: Re: [PATCH v3 06/11] usb: gadget: configfs: Support arbitrary string
 descriptors
Message-ID: <Y9fyXEOduSuEGSG1@rowland.harvard.edu>
References: <20230130093443.25644-1-dan.scally@ideasonboard.com>
 <20230130093443.25644-7-dan.scally@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130093443.25644-7-dan.scally@ideasonboard.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 30, 2023 at 09:34:38AM +0000, Daniel Scally wrote:
> Add a framework to allow users to define arbitrary string descriptors
> for a USB Gadget. This is modelled as a new type of config item rather
> than as hardcoded attributes so as to be as flexible as possible.
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Changes in v3:
> 
> 	- Moved this functionality from the UVC function to usb gadget core.
> 
> Changes in v2:
> 
> 	- New patch
> 
>  drivers/usb/gadget/configfs.c | 172 +++++++++++++++++++++++++++++++++-
>  include/linux/usb/gadget.h    |  11 +++
>  2 files changed, 181 insertions(+), 2 deletions(-)

Shouldn't this patch also include an update to 
Documentation/usb/gadget_configfs.rst?

Alan Stern
