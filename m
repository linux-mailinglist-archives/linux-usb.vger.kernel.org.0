Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5431C61D88E
	for <lists+linux-usb@lfdr.de>; Sat,  5 Nov 2022 08:46:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbiKEHqJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 5 Nov 2022 03:46:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbiKEHqH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 5 Nov 2022 03:46:07 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CB4BD2E0;
        Sat,  5 Nov 2022 00:46:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 3ED76B81611;
        Sat,  5 Nov 2022 07:46:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 638E5C433C1;
        Sat,  5 Nov 2022 07:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1667634363;
        bh=ZMfmPuWolJn8ktVOTHMoYyWkBeMkqiNVrOl5KM0JWvA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SneXIkaebf8BXOSLqFYRmCDoknqfoJREJxf+eTq2xaA8uaL95vcMaZBGHF30FJQz6
         SXMat3Rj1CPsNwlRMCYsb6CaYxnLmf48BdYmcJOIM8Rn59PC4zlNVFT5Et3qQojgSg
         EacO5/+e1dZNV3SnnVi9K+mc1fSvbocYu0FY/TEaqO5Iu78kf2Tdtj6vl9btoJVkUQ
         FNHiRMSwcWTwwfQVhZi3l6ndL33xOplmAM9TO0IpYp/a1Kl8OB8GK0C+BtTlBht800
         +6MeGSPt/oKlTLUUG2Kz/MmT9iNRinuwfiAqkg4X/tPdczhPjxmWyT2s5+hJxtBMsq
         TISVDqFpvQaZg==
Date:   Sat, 5 Nov 2022 13:16:00 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Andre Przywara <andre.przywara@arm.com>
Cc:     Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sunxi@lists.linux.dev, Karl Kurbjun <karl.os@veroson.com>,
        Icenowy Zheng <uwu@icenowy.me>
Subject: Re: [PATCH v2 3/7] phy: sun4i-usb: Introduce port2 SIDDQ quirk
Message-ID: <Y2YUuMljH0/3Ggm3@matsya>
References: <20221031111358.3387297-1-andre.przywara@arm.com>
 <20221031111358.3387297-4-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221031111358.3387297-4-andre.przywara@arm.com>
X-Spam-Status: No, score=-8.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 31-10-22, 11:13, Andre Przywara wrote:
> At least the Allwinner H616 SoC requires a weird quirk to make most
> USB PHYs work: Only port2 works out of the box, but all other ports
> need some help from this port2 to work correctly: The CLK_BUS_PHY2 and
> RST_USB_PHY2 clock and reset need to be enabled, and the SIDDQ bit in
> the PMU PHY control register needs to be cleared. For this register to
> be accessible, CLK_BUS_ECHI2 needs to be ungated. Don't ask ....
> 
> Instead of disguising this as some generic feature, treat it more like
> a quirk (what it really is):
> If the quirk bit is set, and we initialise a PHY other than PHY2, ungate
> this one special clock, and clear the SIDDQ bit. We also pick the clock
> and reset from PHY2 and enable them as well.

Applied, thanks

-- 
~Vinod
