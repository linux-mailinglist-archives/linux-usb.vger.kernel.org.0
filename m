Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id BA212170F79
	for <lists+linux-usb@lfdr.de>; Thu, 27 Feb 2020 05:12:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728416AbgB0EMA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Feb 2020 23:12:00 -0500
Received: from kernel.crashing.org ([76.164.61.194]:36664 "EHLO
        kernel.crashing.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728355AbgB0EMA (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Feb 2020 23:12:00 -0500
Received: from localhost (gate.crashing.org [63.228.1.57])
        (authenticated bits=0)
        by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 01R4AhSr022499
        (version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
        Wed, 26 Feb 2020 22:10:46 -0600
Message-ID: <c1f990ad2fd35deeba9e4e937cb19ee5080ea2a8.camel@kernel.crashing.org>
Subject: Re: [PATCH v4 5/7] ARM: dts: aspeed-g5: add vhub port and endpoint
 properties
From:   Benjamin Herrenschmidt <benh@kernel.crashing.org>
To:     rentao.bupt@gmail.com, Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Colin Ian King <colin.king@canonical.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-usb@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-aspeed@lists.ozlabs.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org,
        taoren@fb.com
Date:   Thu, 27 Feb 2020 15:10:42 +1100
In-Reply-To: <20200226230346.672-6-rentao.bupt@gmail.com>
References: <20200226230346.672-1-rentao.bupt@gmail.com>
         <20200226230346.672-6-rentao.bupt@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 2020-02-26 at 15:03 -0800, rentao.bupt@gmail.com wrote:
> From: Tao Ren <rentao.bupt@gmail.com>
> 
> Add "aspeed,vhub-downstream-ports" and "aspeed,vhub-generic-
> endpoints"
> properties to describe supported number of vhub ports and endpoints.
> 
> Signed-off-by: Tao Ren <rentao.bupt@gmail.com>

Acked-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>

> ---
>  No change in v2/v3/v4.
>    - It's given v4 to align with the version of the patch series.
> 
>  arch/arm/boot/dts/aspeed-g5.dtsi | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/aspeed-g5.dtsi
> b/arch/arm/boot/dts/aspeed-g5.dtsi
> index ebec0fa8baa7..f12ec04d3cbc 100644
> --- a/arch/arm/boot/dts/aspeed-g5.dtsi
> +++ b/arch/arm/boot/dts/aspeed-g5.dtsi
> @@ -195,6 +195,8 @@
>  			reg = <0x1e6a0000 0x300>;
>  			interrupts = <5>;
>  			clocks = <&syscon ASPEED_CLK_GATE_USBPORT1CLK>;
> +			aspeed,vhub-downstream-ports = <5>;
> +			aspeed,vhub-generic-endpoints = <15>;
>  			pinctrl-names = "default";
>  			pinctrl-0 = <&pinctrl_usb2ad_default>;
>  			status = "disabled";

