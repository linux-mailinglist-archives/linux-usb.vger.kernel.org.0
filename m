Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BEE0D4CD77
	for <lists+linux-usb@lfdr.de>; Thu, 20 Jun 2019 14:10:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731817AbfFTMKz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Jun 2019 08:10:55 -0400
Received: from mail.kernel.org ([198.145.29.99]:39986 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726874AbfFTMKz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 20 Jun 2019 08:10:55 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id AB1B42080C;
        Thu, 20 Jun 2019 12:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1561032655;
        bh=bN1t/MIN2QxgnjSE9+T9MkpCfzlHAoELYlESAFINjvQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kjOC/odujwSEu8SdjnElFEpU+rvz3yyWf3VNfducsiViNX0XGo6bLzyIXFhSKJ4tB
         HRxBW6BWtZ/xqzjjW4BbB2EsmSBYdX9tSI+T12fz8ALWO67O+dfp419TmvbvlB5T8F
         gvnGmQvQXo0EJ6oXdTZkygTCA5AFjCDK9yCylO9E=
Date:   Thu, 20 Jun 2019 14:10:52 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Yinbo Zhu <yinbo.zhu@nxp.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>, xiaobo.xie@nxp.com,
        jiafei.pan@nxp.com,
        Ramneek Mehresh <ramneek.mehresh@freescale.com>,
        Nikhil Badola <nikhil.badola@freescale.com>,
        Ran Wang <ran.wang_1@nxp.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 1/5] usb: fsl: Set USB_EN bit to select ULPI phy
Message-ID: <20190620121052.GC19295@kroah.com>
References: <20190614085433.22344-1-yinbo.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190614085433.22344-1-yinbo.zhu@nxp.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 14, 2019 at 04:54:29PM +0800, Yinbo Zhu wrote:
> From: Nikhil Badola <nikhil.badola@freescale.com>
> 
> Set USB_EN bit to select ULPI phy for USB controller version 2.5
> 
> Signed-off-by: Nikhil Badola <nikhil.badola@freescale.com>
> Signed-off-by: Yinbo Zhu <yinbo.zhu@nxp.com>
> ---
>  drivers/usb/host/ehci-fsl.c | 6 ++++++
>  1 file changed, 6 insertions(+)

What changed from v1-v7?  That should always go below the --- line.

Please fix up when you resend v8.

thanks,

greg k-h
