Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 96D8F2136C7
	for <lists+linux-usb@lfdr.de>; Fri,  3 Jul 2020 10:57:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726183AbgGCI5N (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 3 Jul 2020 04:57:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:56526 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725915AbgGCI5N (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 3 Jul 2020 04:57:13 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 81DE7207DA;
        Fri,  3 Jul 2020 08:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1593766633;
        bh=MlIcJE04yAgAAu3tlEad3BGw8TeJnm5KnC11ClCsEGw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=euAJ/1Cw+cgiXEPyHS9lPiM9oRuLjCyR7qxcAX4anVUzRd1giMMZ51g2svuiS7cTS
         fstfZh0fW506I7sgzzeTDhF2hXUCXMnlz3sMcA2kAAJeTIYoa9xEXLyN/3+Cg7od37
         siNlDSUl3NXsjgaeql2HhidPfVxmFXgjKqYQ+shY=
Date:   Fri, 3 Jul 2020 10:57:17 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Chris Dickens <christopher.a.dickens@gmail.com>
Cc:     linux-usb <linux-usb@vger.kernel.org>,
        Felipe Balbi <balbi@kernel.org>, andrzej.p@samsung.com
Subject: Re: [PATCH] usb: gadget: composite: Remove dedicated OS Feature
 Descriptors request
Message-ID: <20200703085717.GA2514858@kroah.com>
References: <20200703072436.GB2225285@kroah.com>
 <20200703083534.5292-1-christopher.a.dickens@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200703083534.5292-1-christopher.a.dickens@gmail.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 03, 2020 at 01:35:34AM -0700, Chris Dickens wrote:
> Currently Microsoft OS Feature Descriptors are handled using a
> separately allocated USB request, however everything about this USB
> request is identical to the USB request used for all other control
> responses. Simplify the code by removing this separate USB request and
> using the same USB request as all other control responses.
> 
> While at it, simplify the composite_ep0_queue() function by removing the
> req and gfp_flags arguments. The former is no longer necessary with a
> single USB request and the latter is always GFP_ATOMIC.
> 
> Signed-off-by: Chris Dickens <christopher.a.dickens@gmail.com>
> ---
>  drivers/usb/gadget/composite.c | 69 +++++-----------------------------
>  drivers/usb/gadget/configfs.c  | 11 ------
>  include/linux/usb/composite.h  |  9 -----
>  3 files changed, 9 insertions(+), 80 deletions(-)

Did you confirm by testing that this actually works with a real device
that wants to talk to Windows with those feature descriptors?

thanks,

greg k-h
