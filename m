Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6D3C5462D5
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jun 2022 11:52:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347434AbiFJJwf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Jun 2022 05:52:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237172AbiFJJwe (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Jun 2022 05:52:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F6F3AF1E6
        for <linux-usb@vger.kernel.org>; Fri, 10 Jun 2022 02:52:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id CFD9961F29
        for <linux-usb@vger.kernel.org>; Fri, 10 Jun 2022 09:52:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDB3AC34114;
        Fri, 10 Jun 2022 09:52:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1654854752;
        bh=0mgnC41WpR5onqpuAuvhIcf9JE5JR88zblZfakpsrFI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dv/CJO1NHAqZdCdVpUC3gP0deZ1M8Yl9ij9Gnl6XAmeu0a5DATAtmXgnLYGNbdyc0
         WUPR/Ii8JpQaLLS+mUNUpqjGRa3RlSJeBmhorRmr9Habon5UQNwekAt8jqfXX63SjB
         3EhJHpYMUyORqZz+8/IvSZkhI4mz2ib7RgBLH1ow=
Date:   Fri, 10 Jun 2022 11:52:04 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        paul.elder@ideasonboard.com, kieran.bingham@ideasonboard.com,
        nicolas@ndufresne.ca, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de
Subject: Re: [PATCH v2 0/3] usb: gadget: uvc: fixes and improvements
Message-ID: <YqMURMVQRepxpmrZ@kroah.com>
References: <20220529223848.105914-1-m.grzeschik@pengutronix.de>
 <YqMUG0u1V7FEVwXO@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YqMUG0u1V7FEVwXO@kroah.com>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 10, 2022 at 11:51:23AM +0200, Greg KH wrote:
> On Mon, May 30, 2022 at 12:38:45AM +0200, Michael Grzeschik wrote:
> > This series includes several patches to improve the overall usb uvc
> > gadget code. It includes some style changes and some serious fixes.
> > 
> > Michael Grzeschik (3):
> >   usb: gadget: uvc: calculate the number of request depending on
> >     framesize
> >   usb: gadget: uvc: increase worker prio to WQ_HIGHPRI
> >   usb: gadget: uvc: call uvc uvcg_warn on completed status instead of
> >     uvcg_info
> > 
> >  drivers/usb/gadget/function/f_uvc.c     |  4 ++++
> >  drivers/usb/gadget/function/uvc.h       |  1 +
> >  drivers/usb/gadget/function/uvc_queue.c | 17 ++++++++++++-----
> >  drivers/usb/gadget/function/uvc_v4l2.c  |  2 +-
> >  drivers/usb/gadget/function/uvc_video.c | 11 ++++++++---
> >  5 files changed, 26 insertions(+), 9 deletions(-)
> 
> This patch series fails to apply to my tree, can you please rebase and
> resend?

Make that one patch failed to apply, I took the other two.

thanks,

greg k-h
