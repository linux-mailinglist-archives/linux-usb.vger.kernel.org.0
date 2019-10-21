Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 29C8BDE1C5
	for <lists+linux-usb@lfdr.de>; Mon, 21 Oct 2019 03:28:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726738AbfJUB2H (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 20 Oct 2019 21:28:07 -0400
Received: from Mailgw01.mediatek.com ([1.203.163.78]:36643 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726718AbfJUB2H (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 20 Oct 2019 21:28:07 -0400
X-UUID: 5507cde80d0b4b29931f0ffb515b1011-20191021
X-UUID: 5507cde80d0b4b29931f0ffb515b1011-20191021
Received: from mtkcas35.mediatek.inc [(172.27.4.253)] by mailgw01.mediatek.com
        (envelope-from <chunfeng.yun@mediatek.com>)
        (mailgw01.mediatek.com ESMTP with TLS)
        with ESMTP id 125360284; Mon, 21 Oct 2019 09:27:56 +0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS33N1.mediatek.inc
 (172.27.4.75) with Microsoft SMTP Server (TLS) id 15.0.1395.4; Mon, 21 Oct
 2019 09:27:51 +0800
Received: from [10.17.3.153] (172.27.4.253) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 21 Oct 2019 09:27:51 +0800
Message-ID: <1571621272.31576.7.camel@mhfsdcap03>
Subject: Re: [PATCH] usb: mtu3: fix missing include of mtu3_dr.h
From:   Chunfeng Yun <chunfeng.yun@mediatek.com>
To:     "Ben Dooks (Codethink)" <ben.dooks@codethink.co.uk>
CC:     <linux-kernel@lists.codethink.co.uk>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>
Date:   Mon, 21 Oct 2019 09:27:52 +0800
In-Reply-To: <20191017172717.31409-1-ben.dooks@codethink.co.uk>
References: <20191017172717.31409-1-ben.dooks@codethink.co.uk>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-TM-SNTS-SMTP: 25F215405ED27AA9B6E03A344BF7268CD05F4EB00D98C9A18751FA822DAE4A042000:8
X-MTK:  N
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 2019-10-17 at 18:27 +0100, Ben Dooks (Codethink) wrote:
> The declarations of ssusb_gadget_{init,exit} are
> in the mtu3_dr.h file but the code does that implements
> them does not include this. Add the include to fix the
> following sparse warnigns:
> 
> drivers/usb/mtu3/mtu3_core.c:825:5: warning: symbol 'ssusb_gadget_init' was not declared. Should it be static?
> drivers/usb/mtu3/mtu3_core.c:925:6: warning: symbol 'ssusb_gadget_exit' was not declared. Should it be static?
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---
> Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-usb@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> ---
>  drivers/usb/mtu3/mtu3_core.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/mtu3/mtu3_core.c b/drivers/usb/mtu3/mtu3_core.c
> index c3d5c1206eec..9dd02160cca9 100644
> --- a/drivers/usb/mtu3/mtu3_core.c
> +++ b/drivers/usb/mtu3/mtu3_core.c
> @@ -16,6 +16,7 @@
>  #include <linux/platform_device.h>
>  
>  #include "mtu3.h"
> +#include "mtu3_dr.h"
>  #include "mtu3_debug.h"
>  #include "mtu3_trace.h"

Acked-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Thanks a lot

>  


