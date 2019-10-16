Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8D21ED923E
	for <lists+linux-usb@lfdr.de>; Wed, 16 Oct 2019 15:18:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389985AbfJPNSe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Oct 2019 09:18:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:38804 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388141AbfJPNSd (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Wed, 16 Oct 2019 09:18:33 -0400
Received: from localhost (unknown [209.136.236.94])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 210212067B;
        Wed, 16 Oct 2019 13:18:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1571231913;
        bh=YIWcTuUJHIOVXA+g0HyqMlGhT20VZ0OS5Ku5Zr3UxF0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=epj+51FF8efh+asCvRlahgykECVPArnsYRSGChgqgDE2xPFTR2WHASw1k3uGYm0uT
         n2R+VQI7+jP9jU3g1mI5fkT4AjF0uuxPn9a80kRN9tJDOGJo7GSVUDnW5d9ZFP4JOs
         gFMrx8qfXgO8rlsPvUeZtHhSj9ztua0QG+CUx/IA=
Date:   Wed, 16 Oct 2019 06:18:32 -0700
From:   Greg KH <gregkh@linuxfoundation.org>
To:     GwanYeong Kim <gy741.kim@gmail.com>
Cc:     shuah <shuah@kernel.org>, valentina.manea.m@gmail.com,
        allison@lohutok.net, opensource@jilayne.com,
        changcheng.liu@intel.com, tglx@linutronix.de,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH] usbip: tools: Fix read_usb_vudc_device() error path
 handling
Message-ID: <20191016131832.GC56859@kroah.com>
References: <20191015131437.525-1-gy741.kim@gmail.com>
 <bb2bef23-336a-2f28-8faa-00e4adbb76d9@kernel.org>
 <20191016133825.00006e29@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191016133825.00006e29@gmail.com>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 16, 2019 at 01:38:25PM +0900, GwanYeong Kim wrote:
> On Tue, 15 Oct 2019 17:14:32 -0600
> shuah <shuah@kernel.org> wrote:
> 
> > On 10/15/19 7:14 AM, GwanYeong Kim wrote:
> > > cannot be less than 0 - fread() returns 0 on error.
> > > 
> > > Signed-off-by: GwanYeong Kim <gy741.kim@gmail.com>
> > > ---
> > >   tools/usb/usbip/libsrc/usbip_device_driver.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/tools/usb/usbip/libsrc/usbip_device_driver.c
> > > b/tools/usb/usbip/libsrc/usbip_device_driver.c index
> > > 051d7d3f443b..49760b98aabc 100644 ---
> > > a/tools/usb/usbip/libsrc/usbip_device_driver.c +++
> > > b/tools/usb/usbip/libsrc/usbip_device_driver.c @@ -79,7 +79,7 @@
> > > int read_usb_vudc_device(struct udev_device *sdev, struct
> > > usbip_usb_device *dev) if (!fd) return -1;
> > >   	ret = fread((char *) &descr, sizeof(descr), 1, fd);
> > > -	if (ret < 0) > +	if (ret != sizeof(descr))
> > 
> > Are you sure this check is correct? fread() returns the number
> > of elements read, # elements = 1  in this case.
> 
> Thank you for pointing this out.
> Sorry for my mistake.
> 
> > fread() returns 0 when size or # of elements is 0 and in other
> > error cases it will return < # of elements. I would think you
> > want to check ret != 1 here.
> 
> You're right.
> This should be changed to "ret != 1".
> 
> Should I send a new patch?

If you want to have it applied, yes.

thanks,

greg k-h
