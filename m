Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1FA383EC2E0
	for <lists+linux-usb@lfdr.de>; Sat, 14 Aug 2021 15:34:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238502AbhHNNeh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 14 Aug 2021 09:34:37 -0400
Received: from mail.kernel.org ([198.145.29.99]:32836 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S238455AbhHNNeg (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 14 Aug 2021 09:34:36 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 17C2A60E52;
        Sat, 14 Aug 2021 13:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1628948048;
        bh=JneI4EQ7EiX+Muo55rB64GvmgeEuitFAdTD99+IMm78=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=l1tOr7x1S6/OS5aUEfwdfg+e98ZMVIMfvPz62xhYhRHbY1LmbKX+xNj4ry/iOyPtv
         pULpEPaY5MuqUHqZhY5Kd8ovnA3HmAR3hR9KYcovbZ7V6RgAElkM0mzzfSRQfdjNbB
         OIOOy5+0299UAcNc2exVsmRfQz2QyABuInDKjRaE=
Date:   Sat, 14 Aug 2021 15:34:06 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Sergey Shtylyov <s.shtylyov@omp.ru>
Cc:     linux-usb@vger.kernel.org, Felipe Balbi <balbi@kernel.org>
Subject: Re: [PATCH v3 0/2] Stop calling request_irq(), etc. with invalid
 IRQs in the USB drivers`
Message-ID: <YRfGTlkvpSccyM2g@kroah.com>
References: <fb92857f-3120-9a20-65ba-f21aeb4b9020@omp.ru>
 <YRdlGFh71JmKrJIm@kroah.com>
 <e17abfd6-09ab-d701-49c2-e2a1891c72ba@omp.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e17abfd6-09ab-d701-49c2-e2a1891c72ba@omp.ru>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Aug 14, 2021 at 02:59:09PM +0300, Sergey Shtylyov wrote:
> On 14.08.2021 9:39, Greg Kroah-Hartman wrote:
> 
> > > Here are 2 patches against the 'usb-linus' branch of GregKH's 'usb.git' repo.
> > 
> > Wait, why that branch?
> 
>    What branch I'd use for the fixes then?

Ah, you really want this in for 5.14-final?  People are hitting this
issue now?

> >  Please make them against the branch you want
> > them applied to.  Hopefully they will apply to the usb-next branch...
> 
>    I didn't intend them for usb-next but looks like they apply there too.

I think it belongs there as a "nice cleanup to have", right?

thanks,

greg k-h
