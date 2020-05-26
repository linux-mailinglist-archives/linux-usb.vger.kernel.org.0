Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9650C1D5F1F
	for <lists+linux-usb@lfdr.de>; Sat, 16 May 2020 08:30:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726414AbgEPGas (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 16 May 2020 02:30:48 -0400
Received: from mail.kernel.org ([198.145.29.99]:54264 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726303AbgEPGar (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 16 May 2020 02:30:47 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 2857220709;
        Sat, 16 May 2020 06:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589610647;
        bh=UXpMFqDhSUuBlI+ewSvHUDOfs8oDzhZM8CpVo/0bilU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=VmrF0GLwCiDqTIscbzq8YKik1hRdOVr9kPUwnqxoJxkS6CVQgSIBEc3eHhFSicJN+
         d16AI29073E01fxwd7ZFQHUoP1RIORuGRTPEfLN/13cfidGXLtLZ8FjH8y7yypLa4c
         uhBBT44BY1fvzqiVAeDpH580dWMl/Avdwt0LqTf0=
Date:   Sat, 16 May 2020 08:30:45 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Colin King <colin.king@canonical.com>,
        Zhang Shengju <zhangshengju@cmss.chinamobile.com>,
        Tang Bin <tangbin@cmss.chinamobile.com>,
        linux-usb@vger.kernel.org, kernel-janitors@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH][next] USB: EHCI: ehci-mv: fix less than zero comparison
 of an unsigned int
Message-ID: <20200516063045.GA3846431@kroah.com>
References: <20200515165453.104028-1-colin.king@canonical.com>
 <20200515172121.GA5498@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200515172121.GA5498@rowland.harvard.edu>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, May 15, 2020 at 01:21:21PM -0400, Alan Stern wrote:
> On Fri, May 15, 2020 at 05:54:53PM +0100, Colin King wrote:
> > From: Colin Ian King <colin.king@canonical.com>
> > 
> > The comparison of hcd->irq to less than zero for an error check will
> > never be true because hcd->irq is an unsigned int.  Fix this by
> > assigning the int retval to the return of platform_get_irq and checking
> > this for the -ve error condition and assigning hcd->irq to retval.
> > 
> > Addresses-Coverity: ("Unsigned compared against 0")
> > Fixes: c856b4b0fdb5 ("USB: EHCI: ehci-mv: fix error handling in mv_ehci_probe()")
> > Signed-off-by: Colin Ian King <colin.king@canonical.com>
> > ---
> 
> Thanks to Coverity for spotting this.  Any reason why it didn't spot 
> exactly the same mistake in the ohci-da8xx.c driver?

I think Coverity only runs on a limited kernel configuration and does
not build everything :(
