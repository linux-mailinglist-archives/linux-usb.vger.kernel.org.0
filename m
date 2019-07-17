Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E081D6B377
	for <lists+linux-usb@lfdr.de>; Wed, 17 Jul 2019 03:46:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725951AbfGQBnz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Jul 2019 21:43:55 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37820 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725850AbfGQBnz (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 16 Jul 2019 21:43:55 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id D0D8F3082131;
        Wed, 17 Jul 2019 01:43:54 +0000 (UTC)
Received: from ovpn-112-14.rdu2.redhat.com (ovpn-112-14.rdu2.redhat.com [10.10.112.14])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D6A525C232;
        Wed, 17 Jul 2019 01:43:53 +0000 (UTC)
Message-ID: <c80b2d08453ba94d3762021d6a184acfd6b1762e.camel@redhat.com>
Subject: Re: [PATCH v5] USB: serial/qmi_wwan: add D-Link DWM-222 device ID
From:   Dan Williams <dcbw@redhat.com>
To:     Rogan Dawes <rogan@dawes.za.net>, linux-usb@vger.kernel.org
Cc:     Johan Hovold <johan@kernel.org>, Lars Melin <larsm17@gmail.com>
Date:   Tue, 16 Jul 2019 20:43:52 -0500
In-Reply-To: <20190716191205.GA27426@lisa.dawes.za.net>
References: <20190716191205.GA27426@lisa.dawes.za.net>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.42]); Wed, 17 Jul 2019 01:43:54 +0000 (UTC)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 2019-07-16 at 21:12 +0200, Rogan Dawes wrote:
> Add device id for D-Link DWM-222.
> 
> Cc: stable@vger.kernel.org
> ---
> Also add the qmi_wwan entry, since it was blacklisted already in option
> 
> Apologies for the spam!
> 
>  drivers/net/usb/qmi_wwan.c  | 1 +
>  drivers/usb/serial/option.c | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/drivers/net/usb/qmi_wwan.c b/drivers/net/usb/qmi_wwan.c
> index 8b4ad10cf940..69e0a2acfcb0 100644
> --- a/drivers/net/usb/qmi_wwan.c
> +++ b/drivers/net/usb/qmi_wwan.c
> @@ -1292,6 +1292,7 @@ static const struct usb_device_id products[] = {
>  	{QMI_FIXED_INTF(0x2001, 0x7e16, 3)},	/* D-Link DWM-221 */
>  	{QMI_FIXED_INTF(0x2001, 0x7e19, 4)},	/* D-Link DWM-221 B1 */
>  	{QMI_FIXED_INTF(0x2001, 0x7e35, 4)},	/* D-Link DWM-222 */
> +	{QMI_FIXED_INTF(0x2001, 0x7e3d, 4)},	/* D-Link DWM-222 A2 */
>  	{QMI_FIXED_INTF(0x2020, 0x2031, 4)},	/* Olicard 600 */
>  	{QMI_FIXED_INTF(0x2020, 0x2033, 4)},	/* BroadMobi BM806U */
>  	{QMI_FIXED_INTF(0x0f3d, 0x68a2, 8)},    /* Sierra Wireless MC7700 */
> diff --git a/drivers/usb/serial/option.c b/drivers/usb/serial/option.c
> index a0aaf0635359..db6f76bbb471 100644
> --- a/drivers/usb/serial/option.c
> +++ b/drivers/usb/serial/option.c
> @@ -1951,6 +1951,8 @@ static const struct usb_device_id option_ids[] = {
>  	  .driver_info = RSVD(4) },
>  	{ USB_DEVICE_INTERFACE_CLASS(0x2001, 0x7e35, 0xff),			/* D-Link DWM-222 */
>  	  .driver_info = RSVD(4) },
> +	{ USB_DEVICE_INTERFACE_CLASS(0x2001, 0x7e3d, 0xff),			/* D-Link DWM-222 A2 */
> +	  .driver_info = RSVD(0) | RSVD(4) },

I don't think we actually do need to blacklist interface 0, since
that's likely a QCDM/DIAG interface and that does need a serial driver
like option or qcserial.

Johan, any reason why you thought we should blacklist 0?

Dan

>  	{ USB_DEVICE_AND_INTERFACE_INFO(0x07d1, 0x3e01, 0xff, 0xff, 0xff) },	/* D-Link DWM-152/C1 */
>  	{ USB_DEVICE_AND_INTERFACE_INFO(0x07d1, 0x3e02, 0xff, 0xff, 0xff) },	/* D-Link DWM-156/C1 */
>  	{ USB_DEVICE_AND_INTERFACE_INFO(0x07d1, 0x7e11, 0xff, 0xff, 0xff) },	/* D-Link DWM-156/A3 */

