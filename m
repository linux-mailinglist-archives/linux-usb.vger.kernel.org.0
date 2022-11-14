Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0E6F6273CE
	for <lists+linux-usb@lfdr.de>; Mon, 14 Nov 2022 01:21:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235561AbiKNAVw convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sun, 13 Nov 2022 19:21:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235601AbiKNAVv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 13 Nov 2022 19:21:51 -0500
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CA11B38B9;
        Sun, 13 Nov 2022 16:21:50 -0800 (PST)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C9C1A23A;
        Sun, 13 Nov 2022 16:21:56 -0800 (PST)
Received: from slackpad.lan (unknown [172.31.20.19])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5DF6F3F73B;
        Sun, 13 Nov 2022 16:21:48 -0800 (PST)
Date:   Mon, 14 Nov 2022 00:20:25 +0000
From:   Andre Przywara <andre.przywara@arm.com>
To:     Samuel Holland <samuel@sholland.org>
Cc:     Icenowy Zheng <uwu@icenowy.me>, Chen-Yu Tsai <wens@csie.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        soc@kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH v3 10/11] phy: sun4i-usb: Replace types with explicit
 quirk flags
Message-ID: <20221114002025.351d3084@slackpad.lan>
In-Reply-To: <7b2606df-3ae5-2699-66bd-12815ffc785b@sholland.org>
References: <20221106154826.6687-1-andre.przywara@arm.com>
        <20221106154826.6687-11-andre.przywara@arm.com>
        <D8382138-8943-46F7-B6A6-F83DF98E26AE@icenowy.me>
        <7b2606df-3ae5-2699-66bd-12815ffc785b@sholland.org>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, 13 Nov 2022 17:52:33 -0600
Samuel Holland <samuel@sholland.org> wrote:

> On 11/6/22 09:54, Icenowy Zheng wrote:
> > 
> > 
> > 于 2022年11月6日 GMT+08:00 下午11:48:25, Andre Przywara <andre.przywara@arm.com> 写到:  
> >> So far we were assigning some crude "type" (SoC name, really) to each
> >> Allwinner USB PHY model, then guarding certain quirks based on this.
> >> This does not only look weird, but gets more or more cumbersome to
> >> maintain.
> >>
> >> Remove the bogus type names altogether, instead introduce flags for each
> >> quirk, and explicitly check for them.
> >> This improves readability, and simplifies future extensions.
> >>
> >> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> >> ---
> >> drivers/phy/allwinner/phy-sun4i-usb.c | 50 ++++++++-------------------
> >> 1 file changed, 15 insertions(+), 35 deletions(-)
> >>
> >> diff --git a/drivers/phy/allwinner/phy-sun4i-usb.c b/drivers/phy/allwinner/phy-sun4i-usb.c
> >> index 51fb24c6dcb3..422129c66282 100644
> >> --- a/drivers/phy/allwinner/phy-sun4i-usb.c
> >> +++ b/drivers/phy/allwinner/phy-sun4i-usb.c
> >> @@ -99,27 +99,17 @@
> >> #define DEBOUNCE_TIME			msecs_to_jiffies(50)
> >> #define POLL_TIME			msecs_to_jiffies(250)
> >>
> >> -enum sun4i_usb_phy_type {
> >> -	sun4i_a10_phy,
> >> -	sun6i_a31_phy,
> >> -	sun8i_a33_phy,
> >> -	sun8i_a83t_phy,
> >> -	sun8i_h3_phy,
> >> -	sun8i_r40_phy,
> >> -	sun8i_v3s_phy,
> >> -	sun50i_a64_phy,
> >> -	sun50i_h6_phy,
> >> -};
> >> -
> >> struct sun4i_usb_phy_cfg {
> >> 	int num_phys;
> >> 	int hsic_index;
> >> -	enum sun4i_usb_phy_type type;
> >> 	u32 disc_thresh;
> >> 	u32 hci_phy_ctl_clear;
> >> 	u8 phyctl_offset;
> >> 	bool dedicated_clocks;
> >> 	bool phy0_dual_route;
> >> +	bool phy2_is_hsic;  
> > 
> > Maybe use a `int hsic_phy` instead? But the problem is this practice is
> > assuming USB0 could not be HSIC -- although USB0 is usually OTG.  
> 
> There is already a `hsic_index` variable in the struct we can use.

Ha, indeed, good find! And we are already checking for the same
condition (is this the HSIC port?) using this variable. Saves one more
member in the struct.

Thanks!
Andre


> 
> Regards,
> Samuel
> 
> 

