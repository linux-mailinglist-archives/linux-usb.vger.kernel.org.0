Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 08C3A3674F1
	for <lists+linux-usb@lfdr.de>; Thu, 22 Apr 2021 00:00:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235430AbhDUWBF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Apr 2021 18:01:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235659AbhDUWAz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Apr 2021 18:00:55 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BDE1DC06174A
        for <linux-usb@vger.kernel.org>; Wed, 21 Apr 2021 15:00:02 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 9A39C3EE;
        Wed, 21 Apr 2021 23:59:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1619042396;
        bh=RLETp/FcqAqTUDDoMdhfzASV5dvg1S83ibysLRNd524=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=awUh0KPfdRsKO21ZqlYeIQGJ4CT7Dgx7fCWfKFQKaivYP1WIVwH1hr3s5eba8EQXV
         +9/51/qpbD+hyV8FGqd9nT28QPHr8Rsu4w5xPoGHx3LrczWIFmy2p6/gXOJYmt/vZA
         y5e78duRLxs+lNJXdCaKyFnckf8FDabqauGLz08A=
Date:   Thu, 22 Apr 2021 00:59:51 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org, kernel@pengutronix.de,
        Paul Elder <paul.elder@ideasonboard.com>,
        Caleb Connolly <caleb.connolly@ideasonboard.com>
Subject: Re: [PATCH 0/3] usb: gadget: uvc: improve uvc gadget performance
Message-ID: <YICgV1bnCWWWXa4n@pendragon.ideasonboard.com>
References: <20210421211513.29002-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210421211513.29002-1-m.grzeschik@pengutronix.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

CC'ing Paul and Caleb.

I'm afraid I have no bandwidth to review UVC gadget patches at the
moment.

On Wed, Apr 21, 2021 at 11:15:10PM +0200, Michael Grzeschik wrote:
> This series improves the performance of the uvc video gadget by adding a
> zero copy routine using the scatter list interface of the gadget. The
> series also increases the amount of allocated requests depending of the
> speed and it also reduces the interrupt load by only trigger on every
> 16th request in case of super-speed.
> 
> Michael Grzeschik (3):
>   usb: gadget: uvc: make uvc_num_requests depend on gadget speed
>   usb: gadget: uvc: add scatter gather support
>   usb: gadget: uvc: decrease the interrupt load to a quarter
> 
>  drivers/usb/gadget/Kconfig              |   1 +
>  drivers/usb/gadget/function/f_uvc.c     |   1 +
>  drivers/usb/gadget/function/uvc.h       |  15 ++-
>  drivers/usb/gadget/function/uvc_queue.c |  30 ++++-
>  drivers/usb/gadget/function/uvc_queue.h |   5 +-
>  drivers/usb/gadget/function/uvc_video.c | 145 +++++++++++++++++++-----
>  6 files changed, 164 insertions(+), 33 deletions(-)

-- 
Regards,

Laurent Pinchart
