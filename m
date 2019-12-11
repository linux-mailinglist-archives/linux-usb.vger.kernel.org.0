Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E7A811A599
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2019 09:09:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728030AbfLKIJN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Dec 2019 03:09:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:60216 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727829AbfLKIJN (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 11 Dec 2019 03:09:13 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 47A33206A5;
        Wed, 11 Dec 2019 08:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1576051752;
        bh=2pvx8ywlSBtcpGqsmymSfpDI6hIYbE3/CTQWttcz1Fk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Bl/Y0QYlFM9zvngtxWSUnXLGObj/6hwrqsPCHnIB5GoeDGzArDsb8O51fB2GSI/hw
         EJMqYljYF6pzzo71UtX237CZtkOM+AENYMTMz/+0Wf0Gg8aryqT0emvfDOM+kcJ+/d
         yf8kuciFQOwZTDxWzpH4AkybYhf9+JlGcgYX2rgg=
Date:   Wed, 11 Dec 2019 09:09:10 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Jia-Ju Bai <baijiaju1990@gmail.com>, Bin Liu <b-liu@ti.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH 2/2] usb: musb: Fix a possible null-pointer dereference
 in musb_handle_intr_connect()
Message-ID: <20191211080910.GA426347@kroah.com>
References: <20191210165454.13772-1-b-liu@ti.com>
 <20191210165454.13772-3-b-liu@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191210165454.13772-3-b-liu@ti.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 10, 2019 at 10:54:54AM -0600, Bin Liu wrote:
> From: Jia-Ju Bai <baijiaju1990@gmail.com>
> 
> In musb_handle_intr_connect(), there is an if statement on line 783 to
> check whether musb->hcd is NULL:
>     if (musb->hcd)
> 
> When musb->hcd is NULL, it is used on line 797:
>     musb_host_poke_root_hub(musb);
>         if (musb->hcd->status_urb)
> 
> Thus, a possible null-pointer dereference may occur.

Maybe, if musb->hcd really ever could be NULL.

In looking at the code, I don't see where that could happen, do you?
Why is that check there in the first place?

What sets musb->hcd to NULL in the first place?

thanks,

greg k-h
