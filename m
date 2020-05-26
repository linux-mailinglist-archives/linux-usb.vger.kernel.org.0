Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 738451DA45F
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2020 00:19:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726489AbgESWTF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 May 2020 18:19:05 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:52924 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725998AbgESWTE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 May 2020 18:19:04 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 04JMIqOf057744;
        Tue, 19 May 2020 17:18:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1589926732;
        bh=c1gNUTsHB3gfgkX/gTaB62tQSNuCVzXqjEsmpqFZNow=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=EVzxb79ac+E5BSzuU90j/JF6T/OBf/3ArGRe7NoRfuaOqdbtZHPjFEE8wun3fZ20t
         ZmU5QtpMoV31HWGLoXF6GGexouZIT56jAJMqz0O6fdspUPRQq9y/PEzzJgoKJqhCQi
         o+6JZyuZa5dCqiLH9kGS5LvrQu+l3EiyN5BRTg14=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 04JMIqFx072467
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 19 May 2020 17:18:52 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Tue, 19
 May 2020 17:18:51 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Tue, 19 May 2020 17:18:51 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 04JMIpPZ086866;
        Tue, 19 May 2020 17:18:51 -0500
Date:   Tue, 19 May 2020 17:18:51 -0500
From:   Bin Liu <b-liu@ti.com>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
CC:     Michael Grzeschik <m.grzeschik@pengutronix.de>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        <linux-usb@vger.kernel.org>, <russell@personaltelco.net>,
        <fercerpav@gmail.com>
Subject: Re: [PATCH v1] usb: musb: dsps: set MUSB_DA8XX quirk for AM335x
Message-ID: <20200519221851.GA15845@iaqt7>
Mail-Followup-To: Bin Liu <b-liu@ti.com>,
        Oleksij Rempel <o.rempel@pengutronix.de>,
        Michael Grzeschik <m.grzeschik@pengutronix.de>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, russell@personaltelco.net,
        fercerpav@gmail.com
References: <20200327053849.5348-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20200327053849.5348-1-o.rempel@pengutronix.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Fri, Mar 27, 2020 at 06:38:49AM +0100, Oleksij Rempel wrote:
> Beagle Bone Black has different memory corruptions if kernel is
> configured with USB_TI_CPPI41_DMA=y. This issue is reproducible with
> ath9k-htc driver (ar9271 based wifi usb controller):
> 
> root@AccessBox:~ iw dev wlan0 set monitor  fcsfail otherbss
> root@AccessBox:~ ip l s dev wlan0 up
> kmemleak: Cannot insert 0xda577e40 into the object search tree (overlaps existing)
> CPU: 0 PID: 176 Comm: ip Not tainted 5.5.0 #7
> Hardware name: Generic AM33XX (Flattened Device Tree)
> [<c0112c14>] (unwind_backtrace) from [<c010dc98>] (show_stack+0x18/0x1c)
> [<c010dc98>] (show_stack) from [<c08c7c2c>] (dump_stack+0x84/0x98)
> [<c08c7c2c>] (dump_stack) from [<c02c75a8>] (create_object+0x2f8/0x324)
> [<c02c75a8>] (create_object) from [<c02b8928>] (kmem_cache_alloc+0x1a8/0x39c)
> [<c02b8928>] (kmem_cache_alloc) from [<c072fb68>] (__alloc_skb+0x60/0x174)
> [<c072fb68>] (__alloc_skb) from [<bf0c5c58>] (ath9k_wmi_cmd+0x50/0x184 [ath9k_htc])
> [<bf0c5c58>] (ath9k_wmi_cmd [ath9k_htc]) from [<bf0cb410>] (ath9k_regwrite_multi+0x54/0x84 [ath9k_htc])
> [<bf0cb410>] (ath9k_regwrite_multi [ath9k_htc]) from [<bf0cb7fc>] (ath9k_regwrite+0xf0/0xfc [ath9k_htc])
> [<bf0cb7fc>] (ath9k_regwrite [ath9k_htc]) from [<bf1aca78>] (ar5008_hw_process_ini+0x280/0x6c0 [ath9k_hw])
> [<bf1aca78>] (ar5008_hw_process_ini [ath9k_hw]) from [<bf1a66ac>] (ath9k_hw_reset+0x270/0x1458 [ath9k_hw])
> [<bf1a66ac>] (ath9k_hw_reset [ath9k_hw]) from [<bf0c9588>] (ath9k_htc_start+0xb0/0x22c [ath9k_htc])
> [<bf0c9588>] (ath9k_htc_start [ath9k_htc]) from [<bf0eb3c0>] (drv_start+0x4c/0x1e8 [mac80211])
> [<bf0eb3c0>] (drv_start [mac80211]) from [<bf104a84>] (ieee80211_do_open+0x480/0x954 [mac80211])
> [<bf104a84>] (ieee80211_do_open [mac80211]) from [<c075127c>] (__dev_open+0xdc/0x160)
> [<c075127c>] (__dev_open) from [<c07516a8>] (__dev_change_flags+0x1a4/0x204)
> [<c07516a8>] (__dev_change_flags) from [<c0751728>] (dev_change_flags+0x20/0x50)
> [<c0751728>] (dev_change_flags) from [<c076971c>] (do_setlink+0x2ac/0x978)
> 
> After applying this patch, the system is running in monitor mode without
> noticeable issues.
> 
> Suggested-by: Michael Grzeschik <m.grzeschik@pengutronix.de>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
>  drivers/usb/musb/musb_dsps.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/musb/musb_dsps.c b/drivers/usb/musb/musb_dsps.c
> index 88923175f71e..c01f9e9e69f5 100644
> --- a/drivers/usb/musb/musb_dsps.c
> +++ b/drivers/usb/musb/musb_dsps.c
> @@ -690,7 +690,7 @@ static void dsps_dma_controller_resume(struct dsps_glue *glue) {}
>  #endif /* CONFIG_USB_TI_CPPI41_DMA */
>  
>  static struct musb_platform_ops dsps_ops = {
> -	.quirks		= MUSB_DMA_CPPI41 | MUSB_INDEXED_EP,
> +	.quirks		= MUSB_DMA_CPPI41 | MUSB_INDEXED_EP | MUSB_DA8XX,

The MUSB_DA8XX flag cannot be simply applied to MUSB_DSPS, at least the
teardown and autoreq register offsets are different as show in
cppi41_dma_controller_create().

Do you understand what exactly caused the issue? The kernel trace above
doesn't provide enuough information.

-Bin.
