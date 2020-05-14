Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E8261D3218
	for <lists+linux-usb@lfdr.de>; Thu, 14 May 2020 16:06:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726190AbgENOGk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 May 2020 10:06:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:53032 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726087AbgENOGk (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 14 May 2020 10:06:40 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6E1A620671;
        Thu, 14 May 2020 14:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589465199;
        bh=B/i/v1+v8U/tY4KYXpS/Ecj1mgXNzLqiWTHuTkx0BD0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H5D0kl/oJNKD3KyUuGRpBd6qSYcWxxszA8HwtLsCfN5FT4v0EUdng3HaVXu/Cq1ix
         2xbUgzB8J0t9Q0qIBVEekRMDcYNlErNCLn311Md3+QaSaF2uwz7nZguENBH1bo0AX/
         ISx7l52cYY5N8mR97U4ERH/HiajWJB3l5VqUSL/Y=
Date:   Thu, 14 May 2020 16:06:37 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Christian Gromm <christian.gromm@microchip.com>
Cc:     driverdev-devel@linuxdriverproject.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 3/7] staging: most: usb: check number of reported
 endpoints
Message-ID: <20200514140637.GE2581983@kroah.com>
References: <1589463989-30029-1-git-send-email-christian.gromm@microchip.com>
 <1589463989-30029-4-git-send-email-christian.gromm@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1589463989-30029-4-git-send-email-christian.gromm@microchip.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 14, 2020 at 03:46:25PM +0200, Christian Gromm wrote:
> This patch checks the number of endpoints reported by the USB
> interface descriptor and throws an error if the number exceeds
> MAX_NUM_ENDPOINTS.
> 
> Signed-off-by: Christian Gromm <christian.gromm@microchip.com>
> Reported-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  drivers/staging/most/usb/usb.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)

This is a bugfix that should get backported to stable kernels, right?

thanks,

greg k-h
