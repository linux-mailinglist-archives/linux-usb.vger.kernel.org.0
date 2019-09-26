Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B26FABEC7E
	for <lists+linux-usb@lfdr.de>; Thu, 26 Sep 2019 09:23:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728904AbfIZHXU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 26 Sep 2019 03:23:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:51458 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728886AbfIZHXU (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 26 Sep 2019 03:23:20 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 5AF24206E0;
        Thu, 26 Sep 2019 07:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1569482599;
        bh=v3BqyoQbTrCw6XEOTcmGDraA108KGpx2oXYIr2JpHTU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RsHjHFwQ6ahMrjYqskp1hXuoVrmDdQkymHZM/MAC3747fvrPlaOD9TkbQ+YpfzRO0
         uWTycQrGB7nRaoR4/OlHpgPcDQMPwfOVXhbEu0/vs1YkF3kyYGnCs837zQoYZuunhD
         /n6PoRW4mFKT/bhQ/6XaF50Q6rVFpUffRifpxn7M=
Date:   Thu, 26 Sep 2019 09:23:16 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Pawel Laszczak <pawell@cadence.com>
Cc:     linux-usb@vger.kernel.org, felipe.balbi@linux.intel.com,
        dan.carpenter@oracle.com
Subject: Re: [PATCH -next] usb: cdns3: Fix sheduling with locks held.
Message-ID: <20190926072316.GA1581871@kroah.com>
References: <1569481230-14120-1-git-send-email-pawell@cadence.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1569481230-14120-1-git-send-email-pawell@cadence.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 26, 2019 at 08:00:30AM +0100, Pawel Laszczak wrote:
> Patch fix issue in cdns3_ep0_feature_handle_device function.
> 
> The function usleep_range can't be used there because this function is
> called with locks held and IRQs disabled in
> cdns3_device_thread_irq_handler().
> 
> To resolve this issue patch replaces usleep_range with mdelay.
> 
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Pawel Laszczak <pawell@cadence.com>
> Fixes: 7733f6c32e36 ("usb: cdns3: Add Cadence USB3 DRD Driver")
> ---
>  drivers/usb/cdns3/ep0.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Is this v2 of the patch?

If so, it needs to be said so in the subject line, and below the ---
line describe what changed from the previous one.

That should all be described in the kernel documentation, right?

v3 please?

thanks,

greg k-h
