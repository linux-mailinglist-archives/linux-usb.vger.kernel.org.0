Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9CDD5141DDB
	for <lists+linux-usb@lfdr.de>; Sun, 19 Jan 2020 13:54:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726860AbgASMy4 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 19 Jan 2020 07:54:56 -0500
Received: from mail.kernel.org ([198.145.29.99]:36350 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726816AbgASMy4 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 19 Jan 2020 07:54:56 -0500
Received: from localhost (lns-bzn-36-82-251-23-53.adsl.proxad.net [82.251.23.53])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4E73320679;
        Sun, 19 Jan 2020 12:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1579438495;
        bh=dKXFd5hiTjPm5ldtVkdFHRnEZm9fPQAiuniO3dh0VaI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FHvSrxWMsQUYOQRbl5WCJRKq9H3VXV58cNP4iX/wAnewK+QZx5VG/h8DbkTFNNNnZ
         RLu1DG0tbv+m7fbBENeIM6GXC7L7GPSlQIv3F3fWJ7w70Cgt7xncvxYEdftKEEpPTY
         QEAuCqz1N+0/zbfXrBhzqMpnLWflafTLhVGWGPwc=
Date:   Sun, 19 Jan 2020 13:54:53 +0100
From:   "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
To:     Jun Li <jun.li@nxp.com>
Cc:     "linux@roeck-us.net" <linux@roeck-us.net>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH] usb: typec: tcpci: mask event interrupts when remove
 driver
Message-ID: <20200119125453.GB149506@kroah.com>
References: <1579431309-10265-1-git-send-email-jun.li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1579431309-10265-1-git-send-email-jun.li@nxp.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Jan 19, 2020 at 10:59:37AM +0000, Jun Li wrote:
> This is to prevent any possible events generated while unregister
> tpcm port.
> 
> Signed-off-by: Li Jun <jun.li@nxp.com>
> ---
>  drivers/usb/typec/tcpm/tcpci.c | 8 ++++++++
>  1 file changed, 8 insertions(+)

Does this need to be backported to older kernels?  If so, how far back?
Any idea what commit caused this issue?

thanks,

greg k-h
