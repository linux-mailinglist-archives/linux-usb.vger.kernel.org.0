Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6AC6F36AFD7
	for <lists+linux-usb@lfdr.de>; Mon, 26 Apr 2021 10:41:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232358AbhDZImI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 26 Apr 2021 04:42:08 -0400
Received: from mail.kernel.org ([198.145.29.99]:49842 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232213AbhDZImH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 26 Apr 2021 04:42:07 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 74CAA6112F;
        Mon, 26 Apr 2021 08:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1619426486;
        bh=3OhRUSpoPMngaFKGtLGpBnB6b2PuSIee+IPJ3qJkix0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zFDttrpQydLlRRt/eu6E0fFyWoBvo9j7e/B0si/d1zGGUDQ8DB8PetZKcWnbFjQX3
         PJYr+FnVVUidoEvQcldy7pezLopJzo+l69Yj85GGq7tc//Mvcq2Pt+SLcczOKjNMPT
         esAvUg7+mvUeh/8N1FBFCJk5mtNLbJzY0A+7MFr0=
Date:   Mon, 26 Apr 2021 10:41:23 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Pratham Pratap <prathampratap@codeaurora.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: ep0 request dequeue for function drivers
Message-ID: <YIZ8s6ALmGdoJgq4@kroah.com>
References: <655514e3-90c1-e628-d5e6-efb298f49038@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <655514e3-90c1-e628-d5e6-efb298f49038@codeaurora.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Apr 26, 2021 at 01:42:50PM +0530, Pratham Pratap wrote:
> Hi,
> 
> Let's say a function driver queues a request on ep0 and before the
> completion handler could run composition switch/physical disconnect happens.
> This request will be in pending list since gadget_giveback is not done but
> the composite driver will free the request from composite_dev_cleanup. Now,
> once the next connect happens, another ep0 request is queued and while
> handling the completion of that request, gadget driver might end up
> accessing the old/stale request leading to list_poison since pending list is
> corrupted.
> 
> To fix this, the function drivers might want to use setup_pending(mark it to
> true) flag so that when composite_dev_cleanup is run the requests are given
> back from usb_ep_dequeue; clear the setup pending flag in function driver
> when completion handler is run successfully. I can see this issue in almost
> all the function drivers.
> 
> Looking for suggestions and comments.

Have you tried making this change and determined that it works or not?
If so, please submit a patch.

thanks,

greg k-h
