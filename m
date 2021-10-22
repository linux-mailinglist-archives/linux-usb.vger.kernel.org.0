Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E483437459
	for <lists+linux-usb@lfdr.de>; Fri, 22 Oct 2021 11:08:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232282AbhJVJLB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Oct 2021 05:11:01 -0400
Received: from mail.kernel.org ([198.145.29.99]:41776 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232203AbhJVJLA (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 22 Oct 2021 05:11:00 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 42CFF60F12;
        Fri, 22 Oct 2021 09:08:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1634893723;
        bh=zsP3z2McQlmTD60dB3Z+iafB+Ib7BOmZMfoEKTSrah0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cjpHZuCwKCmNSXFjSqIFDjAZWsbAvE5JoGJhniJ1AYxw6VXBSS5L207al3NwMCBAs
         yQGo5L5EAqfLqXdtQaJm6YD/9ub+eqkz6q4zZUQTPXnmtNWCciQgnnvfHofLaLy9KQ
         vf5xzzgalwAAAHaR1fBDIcbD7EXHkHKZtwZF5ESc=
Date:   Fri, 22 Oct 2021 11:08:41 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
        Sergey Shtylyov <s.shtylyov@omprussia.ru>
Subject: Re: [PATCH 07/10] usb: host: ohci-da8xx: fix deferred probing
Message-ID: <YXJ/mYKYK5wHaYMB@kroah.com>
References: <20211021191437.8737-1-s.shtylyov@omp.ru>
 <20211021191437.8737-8-s.shtylyov@omp.ru>
 <d91d3f67-a4ec-30be-a1ab-8318bfbf51ef@omp.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d91d3f67-a4ec-30be-a1ab-8318bfbf51ef@omp.ru>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Oct 21, 2021 at 10:17:43PM +0300, Sergey Shtylyov wrote:
> On 10/21/21 10:14 PM, Sergey Shtylyov wrote:
> 
> > From: Sergey Shtylyov <s.shtylyov@omprussia.ru>
> 
>    Oops, should have been @omp.ru -- missed it somehow... :-?
> 
> > The driver overrides the error codes returned by platform_get_irq() to
> > -ENODEV for some strange reason, so if it returns -EPROBE_DEFER, the driver
> > will fail the probe permanently instead of the deferred probing. Switch to
> > propagating the error codes upstream.
> > 
> > Fixes: efe7daf2231a ("USB: OHCI: DA8xx/OMAP-L1x glue layer")
> > Signed-off-by: Sergey Shtylyov <s.shtylyov@omprussia.ru>
> 
>    Hm, this needs fixing too...
> 
> > Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> [...]

Please fix up and add Alan's acks and send a v2 of this series.

thanks,

greg k-h
