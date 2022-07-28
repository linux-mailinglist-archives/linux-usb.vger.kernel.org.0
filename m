Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7B4A583A0B
	for <lists+linux-usb@lfdr.de>; Thu, 28 Jul 2022 10:08:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234595AbiG1IIV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Jul 2022 04:08:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233818AbiG1IIT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Jul 2022 04:08:19 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8644061D72
        for <linux-usb@vger.kernel.org>; Thu, 28 Jul 2022 01:08:18 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 2DCD6B82284
        for <linux-usb@vger.kernel.org>; Thu, 28 Jul 2022 08:08:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73B0AC433C1;
        Thu, 28 Jul 2022 08:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1658995695;
        bh=fVvnBQzo3+KCjldp7w4ekvg/si6EwLheoel9u13XFnU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MOUOZvuxK749282sx1ZcAEM/vSxFl1cNAt8PCbGwvnrdZk09J8n731dsTMaC22dsF
         Uxh4o9bqiBtdulD+ZfAdRSJ2rjqFg58gLfmE0sysGVeeVBUMmjALAm12PWXC3L7rWX
         nsmBuoX0SJuekCj6R+48w/Hu2o1LoQVr384vAso0=
Date:   Thu, 28 Jul 2022 10:08:13 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Vicki Pfau <vi@endrift.com>
Cc:     Felipe Balbi <balbi@kernel.org>, Maxim Devaev <mdevaev@gmail.com>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/2] USB: gadget: f_hid: Add Get-Feature report
Message-ID: <YuJD7Xp3Ue86Y+I+@kroah.com>
References: <20220726005824.2817646-1-vi@endrift.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220726005824.2817646-1-vi@endrift.com>
X-Spam-Status: No, score=-7.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 25, 2022 at 05:58:25PM -0700, Vicki Pfau wrote:
> --- /dev/null
> +++ b/include/uapi/linux/usb/g_hid.h
> @@ -0,0 +1,38 @@
> +/* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
> +/*
> + * g_hid.h -- Header file for USB HID gadget driver
> + *
> + * Copyright (C) 2022 Valve Software
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, write to the Free Software
> + * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA

This whole license "boilerplate" is not needed, and should be removed
(especially things like addresses, that's crazy).

Only thing that is needed is the SPDX line.

> + */
> +
> +#ifndef __UAPI_LINUX_USB_G_HID_H
> +#define __UAPI_LINUX_USB_G_HID_H
> +
> +#include <linux/types.h>
> +
> +struct usb_hidg_report {
> +	__u16 length;
> +	__u8 data[512];

Why 512?

> +};
> +
> +/* The 'g' code is also used by gadgetfs and hid gadget ioctl requests.
> + * Don't add any colliding codes to either driver, and keep
> + * them in unique ranges (size 0x20 for now).
> + */
> +#define GADGET_HID_WRITE_GET_REPORT	_IOW('g', 0x42, struct usb_hidg_report)

This should be in the same .h file so that we don't get confused and
accidentally use the same ioctl.

> +
> +#endif /* __UAPI_LINUX_USB_G_HID_H */
> diff --git a/include/uapi/linux/usb/gadgetfs.h b/include/uapi/linux/usb/gadgetfs.h
> index 835473910a49..9754822b2a40 100644
> --- a/include/uapi/linux/usb/gadgetfs.h
> +++ b/include/uapi/linux/usb/gadgetfs.h
> @@ -62,7 +62,7 @@ struct usb_gadgetfs_event {
>  };
>  
>  
> -/* The 'g' code is also used by printer gadget ioctl requests.
> +/* The 'g' code is also used by printer and hid gadget ioctl requests.

Yeah, put the definition here.

thanks,

greg k-h
