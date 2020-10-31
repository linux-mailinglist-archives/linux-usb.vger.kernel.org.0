Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE4962A151B
	for <lists+linux-usb@lfdr.de>; Sat, 31 Oct 2020 11:15:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726722AbgJaKPx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 31 Oct 2020 06:15:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:53978 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726719AbgJaKPx (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 31 Oct 2020 06:15:53 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A356320719;
        Sat, 31 Oct 2020 10:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604139353;
        bh=k55592a3MRtpfBWcY0/9Daew+ap/Hnqw9WgHoeOC8iU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=IjoOSwx1aldcP3qIhI51g/XfbX9os65sG5gI2D7zMhbISA367YwYkwNS/GJEUH3VW
         S/xBy0zHqHuenak99Ou41lMPHAA/oUIaowxbQ7qyX5T9pOMWasvx0pPDDBXpSsJKui
         fhDJF+yPwmGr4FRdb0TyVrLHUiY3jMREystzX69o=
Date:   Sat, 31 Oct 2020 11:16:39 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Zhang Qilong <zhangqilong3@huawei.com>
Cc:     hadess@hadess.net, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] USB: apple-mfi-fastcharge: fix reference leak in
 apple_mfi_fc_set_property
Message-ID: <20201031101639.GA525736@kroah.com>
References: <20201031101144.45164-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201031101144.45164-1-zhangqilong3@huawei.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Oct 31, 2020 at 06:11:44PM +0800, Zhang Qilong wrote:
> pm_runtime_get_sync() will increment pm usage at first and it
> will resume the device later. If runtime of the device is
> active or has error(else....), resume operation will fail. If
> we do not call put operation to decrease the reference, the
> result is that this device cannot enter the idle state and
> always stay busy or other non-idle state.
> 
> Fixes: 249fa8217b846 ("USB: Add driver to control USB fast charge for iOS devices")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---
>  drivers/usb/misc/apple-mfi-fastcharge.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

What changed from v1?  Always put that below the --- line.

Can you fix that up and send a v3?

thanks,

greg k-h
