Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E1E03A1058
	for <lists+linux-usb@lfdr.de>; Wed,  9 Jun 2021 12:48:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238122AbhFIJlc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Jun 2021 05:41:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58366 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234765AbhFIJlb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Jun 2021 05:41:31 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEC6DC061574
        for <linux-usb@vger.kernel.org>; Wed,  9 Jun 2021 02:39:36 -0700 (PDT)
Received: from pyrite.rasen.tech (unknown [IPv6:2400:4051:61:600:2c71:1b79:d06d:5032])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id E1E7246E;
        Wed,  9 Jun 2021 11:39:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1623231568;
        bh=N+blYAag285IHH1/E95R6pgYnBVGKtzaOQNNo6gO9FI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=gehBKa+X3v8jj7MlowDBZr6rShDPuaCufd2uuPf/jEoQa84aAOev7ID+Wbgazf/xb
         yLRNBQFUtnyAinaVTSbOYaDBXKJX5X4KwWmiZlvqo0BF1GVBhnCqlH57mzxr48jL8/
         ACojhP7E6/eBHCImvOmfiJDJR8H1akaKLlz5PJwE=
Date:   Wed, 9 Jun 2021 18:39:19 +0900
From:   paul.elder@ideasonboard.com
To:     Michael Grzeschik <m.grzeschik@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        caleb.connolly@ideasonboard.com, balbi@kernel.org,
        kernel@pengutronix.de
Subject: Re: [PATCH 0/3] usb: gadget: uvc: use configfs entries for
 negotiation and v4l2 VIDIOCS
Message-ID: <20210609093919.GA770943@pyrite.rasen.tech>
References: <20210530222239.8793-1-m.grzeschik@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210530222239.8793-1-m.grzeschik@pengutronix.de>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Michael,

Thank you for the patch series.

On Mon, May 31, 2021 at 12:22:36AM +0200, Michael Grzeschik wrote:
> This series improves the uvc video gadget by parsing the configfs
> entries. With the configfs data, the driver now is able to negotiate the
> format with the usb host in the kernel and also exports the supported
> frames/formats/intervals via the v4l2 VIDIOC interface.

Sorry for the delay, I'll start looking at this (and your other series)
now.

Paul

> 
> Michael Grzeschik (3):
>   usb: gadget: uvc: move structs to common header
>   usb: gadget: uvc: add VIDIOC function
>   usb: gadget: uvc: add format/frame handling code
> 
>  drivers/usb/gadget/function/f_uvc.c        | 324 +++++++++++++++++++-
>  drivers/usb/gadget/function/uvc.h          |  32 +-
>  drivers/usb/gadget/function/uvc_configfs.c | 116 +------
>  drivers/usb/gadget/function/uvc_configfs.h | 121 ++++++++
>  drivers/usb/gadget/function/uvc_queue.c    |   4 +-
>  drivers/usb/gadget/function/uvc_v4l2.c     | 335 ++++++++++++++++++---
>  drivers/usb/gadget/function/uvc_v4l2.h     |   1 +
>  drivers/usb/gadget/function/uvc_video.c    |  23 +-
>  8 files changed, 781 insertions(+), 175 deletions(-)
> 
> -- 
> 2.29.2
> 
