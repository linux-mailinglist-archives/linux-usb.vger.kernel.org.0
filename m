Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C2D2C79CF83
	for <lists+linux-usb@lfdr.de>; Tue, 12 Sep 2023 13:10:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234282AbjILLKR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Sep 2023 07:10:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233912AbjILLJO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Sep 2023 07:09:14 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5133C1725
        for <linux-usb@vger.kernel.org>; Tue, 12 Sep 2023 04:09:08 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E7C7C433C8;
        Tue, 12 Sep 2023 11:09:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1694516948;
        bh=EqPpG2XiOk0rvkSuIWcIFaBRZQlFizucla4xjNVZ0mY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=dLImLW2GYbqZ8O6sOiO7CmoRO1kV1RQ8AIqgRgaDDkMgbNcOEN6aw2fzDrBUIY56q
         uSOX1+Nvp+B8jKE6mPVmLc4+lWPufR1pzDG+4yHnpXUhDkpqeABM6biG3VcyjuP3Be
         Y197I3c2aPRJvhOZ7uORxpnZBrpjtaLCaHu9M0yY=
Date:   Tue, 12 Sep 2023 13:09:05 +0200
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
Subject: Re: [PATCH v3 01/10] usb: gadget: add anonymous definition in struct
 usb_gadget
Message-ID: <2023091255-unsubtly-daisy-7426@gregkh>
References: <20230912104455.7737-1-quic_linyyuan@quicinc.com>
 <20230912104455.7737-2-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230912104455.7737-2-quic_linyyuan@quicinc.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Sep 12, 2023 at 06:44:46PM +0800, Linyu Yuan wrote:
> Some UDC trace event will save usb gadget information, but it use one int
> size buffer to save one bit information of usb gadget, so 19 int buffers
> needed to save 19 bit fields which is not good.
> 
> Add one anonymous union which have one u32 member 'dw1' to struct
> 'usb_gadget', it inlclude all 19 bits and can be used by trace event
> during fast assign stage to save more entries with same trace ring buffer
> size.
> 
> Also move all original 19 bit fields into one anonymous struct which
> inside struct 'usb_gadget'.
> 
> In order to allow trace event output stage access the bit from saved u32
> 'dw1', add following macro,
> define USB_GADGET_BITFIELD(n, name) \
> 	({\
> 	union {\
> 		struct {\
> 			u32	sg_supported:1;\
> 			u32	is_otg:1;\
> 			u32	is_a_peripheral:1;\
> 			u32	b_hnp_enable:1;\
> 			u32	a_hnp_support:1;\
> 			u32	a_alt_hnp_support:1;\
> 			u32	hnp_polling_support:1;\
> 			u32	host_request_flag:1;\
> 			u32	quirk_ep_out_aligned_size:1;\
> 			u32	quirk_altset_not_supp:1;\
> 			u32	quirk_stall_not_supp:1;\
> 			u32	quirk_zlp_not_supp:1;\
> 			u32	quirk_avoids_skb_reserve:1;\
> 			u32	is_selfpowered:1;\
> 			u32	deactivated:1;\
> 			u32	connected:1;\
> 			u32	lpm_capable:1;\
> 			u32	wakeup_capable:1;\
> 			u32	wakeup_armed:1;\
> 		} __packed;\
> 		u32		dw1;\
> 	} __aligned(4) __g_u_##name;\
> 	u32 __g_##name; \
> 	BUILD_BUG_ON(sizeof(__g_u_##name) != 4);\
> 	__g_u_##name.dw1 = (n); __g_##name = __g_u_##name.name;\
> 	__g_##name; })
> 
> define USB_GADGET_SG_SUPPORTED(n) USB_GADGET_BITFIELD((n), sg_supported)
> ...
> change to use this kind of macro for all related trace files later.

I'm sorry, but that's horrible, and is NOT how you deal with bitfields
in an endian-neutral way at all.

There are much simpler, and easier, ways to do this properly.

But I'm still missing the huge _WHY_ any of this is needed.  You are not
showing any real advantage at all that I have noticed.

You need to step back and see if any of this is even anything that needs
to change, and if you feel it does need to change, you need to be able
to properly justify _why_ it needs to change.

good luck!

greg k-h
