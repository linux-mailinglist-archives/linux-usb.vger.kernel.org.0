Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10A6B79D4FA
	for <lists+linux-usb@lfdr.de>; Tue, 12 Sep 2023 17:32:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236451AbjILPc6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 12 Sep 2023 11:32:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236616AbjILPcu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 12 Sep 2023 11:32:50 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 54C9F1FC3
        for <linux-usb@vger.kernel.org>; Tue, 12 Sep 2023 08:32:31 -0700 (PDT)
Received: (qmail 920103 invoked by uid 1000); 12 Sep 2023 11:32:28 -0400
Date:   Tue, 12 Sep 2023 11:32:28 -0400
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
Subject: Re: [PATCH v3 01/10] usb: gadget: add anonymous definition in struct
 usb_gadget
Message-ID: <fbc43e1a-8882-43d4-a1f3-f26c61decc0d@rowland.harvard.edu>
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

This macro usage is a real mess.  Can't you find a better way to do it?

For instance, in the code that parses the trace buffer, define a 
temporary usb_gadget structure and copy the dw1 field from the trace 
buffer to the temporary structure.  Then you can access the fields in 
that structure directly by their original names, with no macros.

Alan Stern
