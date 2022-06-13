Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25002548042
	for <lists+linux-usb@lfdr.de>; Mon, 13 Jun 2022 09:16:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238944AbiFMHLc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Jun 2022 03:11:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238937AbiFMHLb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Jun 2022 03:11:31 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F48A19FBC
        for <linux-usb@vger.kernel.org>; Mon, 13 Jun 2022 00:11:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 41238B80D62
        for <linux-usb@vger.kernel.org>; Mon, 13 Jun 2022 07:11:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAE80C34114;
        Mon, 13 Jun 2022 07:11:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1655104288;
        bh=9n/Xay7I46zd0KP8JV7iX3pNrSb394dlOYXe3LfVv10=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XF/Pk9Lb7NdQu3Eo6CryzWxlK/egxVJAitQfGGJsFnHyeDC2niOpXmm47+7WVjVC0
         k0C+5rHIAv+VIv6KcKFgucdskA9yC0/xag+JzbMHmXuiNhfQpt47G6dcXKDhvUC0AF
         FVtUd3/ZZWDNq8Gyd9KB4M2tmOaqmcYZI9Wk2mQM=
Date:   Mon, 13 Jun 2022 09:10:58 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de
Subject: Re: [PATCH] fixup! usb: gadget: uvc: calculate the number of request
 depending on framesize
Message-ID: <YqbjAiBCGtC6KeB8@kroah.com>
References: <YqDlP3uy33+WPphJ@pendragon.ideasonboard.com>
 <20220613065844.1029977-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220613065844.1029977-1-m.grzeschik@pengutronix.de>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 13, 2022 at 08:58:44AM +0200, Michael Grzeschik wrote:
> ---
> In Patch "c5d337a3: usb: gadget: uvc: Fix comment blocks style" the overall
> comment style was fixed to use a consistent format.
> 
> Laurent suggested to fix the comment format and to drop the extra
> parantheses around video->ep->mult in this patch. But it was already
> taken without those changes.
> 
> Greg, could you fix this up in usb-next?

I need a real patch that I can apply, this is not that format :(

