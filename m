Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E532179B2BD
	for <lists+linux-usb@lfdr.de>; Tue, 12 Sep 2023 01:59:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235927AbjIKVi1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Sep 2023 17:38:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236879AbjIKLho (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Sep 2023 07:37:44 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 018DD12E
        for <linux-usb@vger.kernel.org>; Mon, 11 Sep 2023 04:37:37 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBF81C433C7;
        Mon, 11 Sep 2023 11:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1694432257;
        bh=c5IoarIxHSYYM7hEeFEOtl1MBLW1Og0H65A+tAxlb+o=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SHuSFDK3xEPgT8nsYyarBmpW+Y3Qy3i9bTKEVdVh/ntppCxpwqHBKIBv6VwHgfq8H
         yDemvCDVa8C8cx9KD9GWN44oPrN5fyeNGeLh6gx0TSJjZPynyCC1z3Y0o9eBhiMpEm
         +D5jXqYorAC0UZLEnxSa+xtkTo8twzkupyAcpf7Q=
Date:   Mon, 11 Sep 2023 13:37:33 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Peter Chen <peter.chen@kernel.org>,
        Pawel Laszczak <pawell@cadence.com>,
        Roger Quadros <rogerq@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Neal Liu <neal_liu@aspeedtech.com>,
        Cristian Birsan <cristian.birsan@microchip.com>,
        Bin Liu <b-liu@ti.com>, Kevin Cernekee <cernekee@gmail.com>,
        Justin Chen <justin.chen@broadcom.com>,
        Al Cooper <alcooperx@gmail.com>, Li Yang <leoyang.li@nxp.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Daniel Mack <daniel@zonque.org>,
        Haojian Zhuang <haojian.zhuang@gmail.com>,
        Robert Jarzmik <robert.jarzmik@free.fr>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Herve Codina <herve.codina@bootlin.com>,
        hierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Michal Simek <michal.simek@amd.com>,
        Rui Miguel Silva <rui.silva@linaro.org>,
        Valentina Manea <valentina.manea.m@gmail.com>,
        Shuah Khan <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 01/11] usb: gadget: add anonymous definition in struct
 usb_gadget
Message-ID: <2023091137-babble-chaffing-553c@gregkh>
References: <20230911112446.1791-1-quic_linyyuan@quicinc.com>
 <20230911112446.1791-2-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230911112446.1791-2-quic_linyyuan@quicinc.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 11, 2023 at 07:24:36PM +0800, Linyu Yuan wrote:
> Some UDC trace event will save usb gadget information, but it will use
> one int size buffer to save one bit information of usb gadget, so more
> than one int buffer to save several bit fields which is not good.
> 
> Add one anonymous union have three u32 members which can be used by trace
> event during fast assign stage to reduce trace buffer usage, and add
> related macro to extract bit fields from u32 members for later trace event
> output state usage.
> 
> Also move sg_supported and other bit fields into one anonymous struct
> which inside anonymous union and Change bit fields from unsigned to u32
> type, it will make sure union member have expected u32 size.
> 
> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> ---
> v2: no change
> 
>  include/linux/usb/gadget.h | 63 ++++++++++++++++++++++++++------------
>  1 file changed, 44 insertions(+), 19 deletions(-)
> 
> diff --git a/include/linux/usb/gadget.h b/include/linux/usb/gadget.h
> index 75bda0783395..cdf62e7f34e7 100644
> --- a/include/linux/usb/gadget.h
> +++ b/include/linux/usb/gadget.h
> @@ -357,6 +357,7 @@ struct usb_gadget_ops {
>   * @in_epnum: last used in ep number
>   * @mA: last set mA value
>   * @otg_caps: OTG capabilities of this gadget.
> + * @dw1: trace event purpose
>   * @sg_supported: true if we can handle scatter-gather
>   * @is_otg: True if the USB device port uses a Mini-AB jack, so that the
>   *	gadget driver must provide a USB OTG descriptor.
> @@ -432,25 +433,49 @@ struct usb_gadget {
>  	unsigned			mA;
>  	struct usb_otg_caps		*otg_caps;
>  
> -	unsigned			sg_supported:1;
> -	unsigned			is_otg:1;
> -	unsigned			is_a_peripheral:1;
> -	unsigned			b_hnp_enable:1;
> -	unsigned			a_hnp_support:1;
> -	unsigned			a_alt_hnp_support:1;
> -	unsigned			hnp_polling_support:1;
> -	unsigned			host_request_flag:1;
> -	unsigned			quirk_ep_out_aligned_size:1;
> -	unsigned			quirk_altset_not_supp:1;
> -	unsigned			quirk_stall_not_supp:1;
> -	unsigned			quirk_zlp_not_supp:1;
> -	unsigned			quirk_avoids_skb_reserve:1;
> -	unsigned			is_selfpowered:1;
> -	unsigned			deactivated:1;
> -	unsigned			connected:1;
> -	unsigned			lpm_capable:1;
> -	unsigned			wakeup_capable:1;
> -	unsigned			wakeup_armed:1;
> +	union {
> +		struct {
> +			u32		sg_supported:1;
> +			u32		is_otg:1;
> +			u32		is_a_peripheral:1;
> +			u32		b_hnp_enable:1;
> +			u32		a_hnp_support:1;
> +			u32		a_alt_hnp_support:1;
> +			u32		hnp_polling_support:1;
> +			u32		host_request_flag:1;
> +			u32		quirk_ep_out_aligned_size:1;
> +			u32		quirk_altset_not_supp:1;
> +			u32		quirk_stall_not_supp:1;
> +			u32		quirk_zlp_not_supp:1;
> +			u32		quirk_avoids_skb_reserve:1;
> +			u32		is_selfpowered:1;
> +			u32		deactivated:1;
> +			u32		connected:1;
> +			u32		lpm_capable:1;
> +			u32		wakeup_capable:1;
> +			u32		wakeup_armed:1;
> +		} __packed;
> +		u32			dw1;
> +#define		USB_GADGET_SG_SUPPORTED(n)			((n) & BIT(0))
> +#define		USB_GADGET_IS_OTG(n)				((n) & BIT(1))
> +#define		USB_GADGET_IS_A_PERIPHERAL(n)			((n) & BIT(2))
> +#define		USB_GADGET_B_HNP_ENABLE(n)			((n) & BIT(3))
> +#define		USB_GADGET_A_HNP_SUPPORT(n)			((n) & BIT(4))
> +#define		USB_GADGET_A_ALT_HNP_SUPPORT(n)			((n) & BIT(5))
> +#define		USB_GADGET_HNP_POLLING_SUPPORT(n)		((n) & BIT(6))
> +#define		USB_GADGET_HOST_REQUEST_FLAG(n)			((n) & BIT(7))
> +#define		USB_GADGET_QUIRK_EP_OUT_ALIGNED_SIZE(n)		((n) & BIT(8))
> +#define		USB_GADGET_QUIRK_ALTSET_NOT_SUPP(n)		((n) & BIT(9))
> +#define		USB_GADGET_QUIRK_STALL_NOT_SUPP(n)		((n) & BIT(10))
> +#define		USB_GADGET_QUIRK_ZLP_NOT_SUPP(n)		((n) & BIT(11))
> +#define		USB_GADGET_QUIRK_AVOIDS_SKB_RESERVE(n)		((n) & BIT(12))
> +#define		USB_GADGET_IS_SELFPOWERED(n)			((n) & BIT(13))
> +#define		USB_GADGET_DEACTIVATED(n)			((n) & BIT(14))
> +#define		USB_GADGET_CONNECTED(n)				((n) & BIT(15))
> +#define		USB_GADGET_LPM_CAPABLE(n)			((n) & BIT(16))
> +#define		USB_GADGET_WAKEUP_CAPABLE(n)			((n) & BIT(17))
> +#define		USB_GADGET_WAKEUP_ARMED(n)			((n) & BIT(18))

Does this actually work on both types of endian-ness?

thanks,

greg k-h
