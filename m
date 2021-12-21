Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13FF847BB5B
	for <lists+linux-usb@lfdr.de>; Tue, 21 Dec 2021 08:57:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235368AbhLUH5U (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Dec 2021 02:57:20 -0500
Received: from dfw.source.kernel.org ([139.178.84.217]:57438 "EHLO
        dfw.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230519AbhLUH5T (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Dec 2021 02:57:19 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 2D2F86114A
        for <linux-usb@vger.kernel.org>; Tue, 21 Dec 2021 07:57:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 067C3C36AE2;
        Tue, 21 Dec 2021 07:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1640073438;
        bh=ppILuB0CoXYhMvF+hSF4aVhpzPoLBxXCFKxCT1hk1pI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=xCW8CANdxNnRZIe7QbnVkIsS37QNXG5foeSJt9OjCwPoPBmL6Qowo/GQnZh2M1en4
         DOxjIEbARPlr+YJLh56AayHeW6ZnK+K7G3OPcNNCf3Evz3XwIJttEYRU+VmOjULxCB
         lvkqqtxsvXM0+vor0d4D1i8stBFLQwrMIkOlbWNs=
Date:   Tue, 21 Dec 2021 08:57:16 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Alexander Stein <alexander.stein@ew.tq-group.com>
Cc:     Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 1/1] usb: dwc3: drd: Add support for usb-conn-gpio
 based usb-role-switch
Message-ID: <YcGI3GUzYv51I6Au@kroah.com>
References: <20211216134940.487518-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211216134940.487518-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Dec 16, 2021 at 02:49:40PM +0100, Alexander Stein wrote:
> usb-conn-gpio devices are a subnode of the USB interface controller, which
> needs to be populated.
> This allows having a non-type-c connector providing dual-role.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> Greg, thank you for your review.
> 
> This was tested on an imx8mp based board (TQMa8MPxL) which uses devicetree.
> Unfortunately I have no non-imx platform available to test this on.
> 
> devm_of_platform_populate() _will_ fail on non-OF builds, so do not call this
> on non-OF enabled platforms.
> AFAICS on OF-platforms this call will only fail upon memory allocation errors.
> If there are no subnodes, this call will not fail. So existing platform should
> work as before.
> 
> Changes in v3:
> * Unregister role-switch upon populating OF tree error
> * Do not call devm_of_platform_populate() on non-OF platforms
> 
> Changes in v2:
> * Added missing variable declaration
> 
>  drivers/usb/dwc3/drd.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/drd.c b/drivers/usb/dwc3/drd.c
> index d7f76835137f..1dcce7a04b41 100644
> --- a/drivers/usb/dwc3/drd.c
> +++ b/drivers/usb/dwc3/drd.c
> @@ -9,6 +9,7 @@
>  
>  #include <linux/extcon.h>
>  #include <linux/of_graph.h>
> +#include "linux/of_platform.h"

Why "" and not <>?

