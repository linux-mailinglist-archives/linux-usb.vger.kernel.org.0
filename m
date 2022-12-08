Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4384A64732D
	for <lists+linux-usb@lfdr.de>; Thu,  8 Dec 2022 16:34:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229909AbiLHPeh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Dec 2022 10:34:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230339AbiLHPeT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Dec 2022 10:34:19 -0500
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 020F41A82C
        for <linux-usb@vger.kernel.org>; Thu,  8 Dec 2022 07:32:42 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id D0018CE24BE
        for <linux-usb@vger.kernel.org>; Thu,  8 Dec 2022 15:32:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA9B8C433C1;
        Thu,  8 Dec 2022 15:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1670513557;
        bh=F3ZWq6n7J6NptMal801NbIkr6l8YvqrlnMNHLSRrLmU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GZu7xX41EfQnMnI+uUAK5htXvtFfagRNiE4AWK6VoCtD4XYJboK7dTRYY4XEU8i29
         9ljp6/TATR9dX/d7c5TNu1mjPO6Tykfj/bMWSRZl7GLx7xZHfL8cWb/0Z/T7RJ/WAF
         XO9HWAlN9gt2T9OjGU+Z54PBzWhE8m/LtGeuQlAk=
Date:   Thu, 8 Dec 2022 16:32:34 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Daniel Scally <dan.scally@ideasonboard.com>
Cc:     linux-usb@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        mgr@pengutronix.de, kieran.bingham@ideasonboard.com
Subject: Re: [PATCH 2/3] usb: gadget: uvc: Add new disable_interrupt_ep
 attribute
Message-ID: <Y5IDkjgvc3fit8hR@kroah.com>
References: <20221205143758.1096914-1-dan.scally@ideasonboard.com>
 <20221205143758.1096914-3-dan.scally@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221205143758.1096914-3-dan.scally@ideasonboard.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 05, 2022 at 02:37:57PM +0000, Daniel Scally wrote:
> Add a new attribute to the default control config group that allows
> users to specify whether they want to disable the default interrupt
> endpoint for the VideoControl interface.
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
>  drivers/usb/gadget/function/u_uvc.h        |  2 +
>  drivers/usb/gadget/function/uvc_configfs.c | 53 ++++++++++++++++++++++
>  2 files changed, 55 insertions(+)

Where is the userspace documentation for this new configfs attribute?

thanks,

greg k-h
