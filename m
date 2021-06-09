Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 591AB3A0EA6
	for <lists+linux-usb@lfdr.de>; Wed,  9 Jun 2021 10:17:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237617AbhFIITE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Jun 2021 04:19:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:60334 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237607AbhFIITC (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 9 Jun 2021 04:19:02 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9652461042;
        Wed,  9 Jun 2021 08:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1623226616;
        bh=p52CWKZWMGbnlBUNks4Kn59WCrUN61LnR+e/4kEbP2g=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WMW8ECL/9rMVMRwkY4eh9isjskbAWWTGTkt1cQp0MT2T0piu2cTEoZej+P79mPJbd
         RiCzdiM413Y/WIi3gAhQ4fOeuZuOBohGAyr5Q1fWgnApmzMYjuZwJ8LqAmi44D+Ufm
         qW/sx1vXVlp0nA8WA74dpbcgzBu/svI1SQsazqVU=
Date:   Wed, 9 Jun 2021 10:16:53 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        caleb.connolly@ideasonboard.com, paul.elder@ideasonboard.com,
        balbi@kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 2/3] usb: gadget: uvc: add VIDIOC function
Message-ID: <YMB49cIXkRi4rtG9@kroah.com>
References: <20210530222239.8793-1-m.grzeschik@pengutronix.de>
 <20210530222239.8793-3-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210530222239.8793-3-m.grzeschik@pengutronix.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

<resending as your email headers were b0rked causing replies to only go
to you...>

On Mon, May 31, 2021 at 12:22:38AM +0200, Michael Grzeschik wrote:
> This patch adds support to the v4l2 VIDIOC for enum_format,
> enum_framesizes, enum_frameintervals and try_fmt. The configfs userspace
> setup gets parsed and this configfs data is used in the v4l2 interface
> functions.
> 
> Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> ---
>  drivers/usb/gadget/function/f_uvc.c        |  54 ++++
>  drivers/usb/gadget/function/uvc.h          |  18 +-
>  drivers/usb/gadget/function/uvc_configfs.c |   5 +
>  drivers/usb/gadget/function/uvc_configfs.h |   2 +
>  drivers/usb/gadget/function/uvc_queue.c    |   4 +-
>  drivers/usb/gadget/function/uvc_v4l2.c     | 325 ++++++++++++++++++---
>  drivers/usb/gadget/function/uvc_v4l2.h     |   1 +
>  drivers/usb/gadget/function/uvc_video.c    |  10 +-
>  8 files changed, 369 insertions(+), 50 deletions(-)

It would be great to have some v4l developers review/ack this so we know
if it's ok to take or not.

thanks,

greg k-h
