Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B4193D7789
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jul 2021 15:53:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232281AbhG0Nxm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 27 Jul 2021 09:53:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:50048 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231223AbhG0Nxm (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 27 Jul 2021 09:53:42 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DD57B61220;
        Tue, 27 Jul 2021 13:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1627394022;
        bh=IWjlJVGYA+k6KyUAvzK8Ub6t0xn/DJo+sAD1cysN47M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=meGl25Z7a1FVaSFW2kX7eKXYwVXyVv1nG1xJ4RKPd6PF+soyF+zA+5VwFyUYB1WI6
         sXaEXf42TnFY2WX+25/R2a74W5FWeT/V6CGLfgz+qxsvmSCMfj5t+4AFBaMilwiJsV
         Ya0T/A6UPJNbl5q6XwkBwmMXVYZlIg/guHXR1i/E=
Date:   Tue, 27 Jul 2021 15:53:40 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Zhang Qilong <zhangqilong3@huawei.com>
Cc:     balbi@kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH -next v2] usb: gadget: remove leaked entry from udc
 driver list
Message-ID: <YQAP5HSWZyAb5G6T@kroah.com>
References: <20210727073142.84666-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210727073142.84666-1-zhangqilong3@huawei.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 27, 2021 at 03:31:42PM +0800, Zhang Qilong wrote:
> The usb_add_gadget_udc will add a new gadget to the udc class
> driver list. Not calling usb_del_gadget_udc in error branch
> will result in residual gadget entry in the udc driver list.
> We fix it by calling usb_del_gadget_udc to clean it when error
> return.
> 
> Fixes:48ba02b2e2b1a ("usb: gadget: add udc driver for max3420")

Note, in the future, this should look like:

Fixes: 48ba02b2e2b1 ("usb: gadget: add udc driver for max3420")

thanks,

greg k-h
