Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AA473A7412
	for <lists+linux-usb@lfdr.de>; Tue, 15 Jun 2021 04:36:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230508AbhFOCiF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 14 Jun 2021 22:38:05 -0400
Received: from perceval.ideasonboard.com ([213.167.242.64]:49014 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230058AbhFOCiE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 14 Jun 2021 22:38:04 -0400
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 3E9B78B7;
        Tue, 15 Jun 2021 03:19:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623719959;
        bh=htLtHR8v8VzRLHV5IJA6tmQXI5BoGv3VFtYHukkDPAg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bxsqYzxJALhM30NSO0XkmI+Fho2EriFzvamIJncxSYfU8FUE3qhdu74LS08EIGrWE
         MLImfoW+LZafx5tLqM7hSyRzTlXE9agv7qbhe4LQR5U/zIC4LwyRYCxEImnxgGN2vg
         lFbmfNv4GcVfKcODwuw1dZFVu4+zlINPHwUTPkpA=
Date:   Tue, 15 Jun 2021 04:18:59 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-usb@vger.kernel.org, caleb.connolly@ideasonboard.com,
        paul.elder@ideasonboard.com, balbi@kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 2/3] usb: gadget: uvc: add VIDIOC function
Message-ID: <YMgAA90NIP7q+GMr@pendragon.ideasonboard.com>
References: <20210530222239.8793-1-m.grzeschik@pengutronix.de>
 <20210530222239.8793-3-m.grzeschik@pengutronix.de>
 <YMB49cIXkRi4rtG9@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YMB49cIXkRi4rtG9@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

On Wed, Jun 09, 2021 at 10:16:53AM +0200, Greg KH wrote:
> <resending as your email headers were b0rked causing replies to only go
> to you...>
> 
> On Mon, May 31, 2021 at 12:22:38AM +0200, Michael Grzeschik wrote:
> > This patch adds support to the v4l2 VIDIOC for enum_format,
> > enum_framesizes, enum_frameintervals and try_fmt. The configfs userspace
> > setup gets parsed and this configfs data is used in the v4l2 interface
> > functions.
> > 
> > Signed-off-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> > ---
> >  drivers/usb/gadget/function/f_uvc.c        |  54 ++++
> >  drivers/usb/gadget/function/uvc.h          |  18 +-
> >  drivers/usb/gadget/function/uvc_configfs.c |   5 +
> >  drivers/usb/gadget/function/uvc_configfs.h |   2 +
> >  drivers/usb/gadget/function/uvc_queue.c    |   4 +-
> >  drivers/usb/gadget/function/uvc_v4l2.c     | 325 ++++++++++++++++++---
> >  drivers/usb/gadget/function/uvc_v4l2.h     |   1 +
> >  drivers/usb/gadget/function/uvc_video.c    |  10 +-
> >  8 files changed, 369 insertions(+), 50 deletions(-)
> 
> It would be great to have some v4l developers review/ack this so we know
> if it's ok to take or not.

Done. Sorry for the delay.

tl;dr: I miss the rationale for this patch series, I don't really see
the benefit of moving code from the userspace helper application to the
kernel.

-- 
Regards,

Laurent Pinchart
