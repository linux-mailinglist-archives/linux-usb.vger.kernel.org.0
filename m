Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E708C79BC60
	for <lists+linux-usb@lfdr.de>; Tue, 12 Sep 2023 02:14:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350647AbjIKVkR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 11 Sep 2023 17:40:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240794AbjIKOyB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 11 Sep 2023 10:54:01 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id AE15C118
        for <linux-usb@vger.kernel.org>; Mon, 11 Sep 2023 07:53:53 -0700 (PDT)
Received: (qmail 881336 invoked by uid 1000); 11 Sep 2023 10:53:51 -0400
Date:   Mon, 11 Sep 2023 10:53:51 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
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
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 01/11] usb: gadget: add anonymous definition in struct
 usb_gadget
Message-ID: <de4af676-d1ca-4e75-9d73-9f120dd2f750@rowland.harvard.edu>
References: <20230911042843.2711-1-quic_linyyuan@quicinc.com>
 <20230911042843.2711-2-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230911042843.2711-2-quic_linyyuan@quicinc.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
        SPF_PASS autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Sep 11, 2023 at 12:28:33PM +0800, Linyu Yuan wrote:
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
> +	};

Are you sure these #defines will work on all architectures?  As far as I 
know, the C compiler does not specify that bit fields in packed 
structures will be assigned starting from the low-order bit position.

Alan Stern
