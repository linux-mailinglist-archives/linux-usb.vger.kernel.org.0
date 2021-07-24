Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EDC683D4735
	for <lists+linux-usb@lfdr.de>; Sat, 24 Jul 2021 12:46:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235264AbhGXKGH convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Sat, 24 Jul 2021 06:06:07 -0400
Received: from aposti.net ([89.234.176.197]:46418 "EHLO aposti.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229966AbhGXKGG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sat, 24 Jul 2021 06:06:06 -0400
Date:   Sat, 24 Jul 2021 11:46:24 +0100
From:   Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH 1/2] dt-bindings: dwc2: Add bindings for new Ingenic SoCs.
To:     =?UTF-8?b?5ZGo55Cw5p2w?= <zhouyanjie@wanyeetech.com>
Cc:     gregkh@linuxfoundation.org, robh+dt@kernel.org,
        hminas@synopsys.com, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org, dongsheng.qiu@ingenic.com,
        aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
        sihui.liu@ingenic.com, jun.jiang@ingenic.com,
        sernia.zhou@foxmail.com
Message-Id: <CLWQWQ.DBCX3I00Y95T2@crapouillou.net>
In-Reply-To: <1627116521-124612-2-git-send-email-zhouyanjie@wanyeetech.com>
References: <1627116521-124612-1-git-send-email-zhouyanjie@wanyeetech.com>
        <1627116521-124612-2-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Zhou,

Le sam., juil. 24 2021 at 16:48:40 +0800, 周琰杰 (Zhou Yanjie) 
<zhouyanjie@wanyeetech.com> a écrit :
> Add the dwc2 bindings for the JZ4775 SoC, the JZ4780 SoC, the X1000 
> SoC,
> the X1600 SoC, the X1830 SoC, and the X2000 SoC from Ingenic.
> 
> Signed-off-by: 周琰杰 (Zhou Yanjie) <zhouyanjie@wanyeetech.com>
> ---
>  Documentation/devicetree/bindings/usb/dwc2.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml 
> b/Documentation/devicetree/bindings/usb/dwc2.yaml
> index 10c7d9b..e779d33 100644
> --- a/Documentation/devicetree/bindings/usb/dwc2.yaml
> +++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
> @@ -14,6 +14,12 @@ properties:
>      oneOf:
>        - const: brcm,bcm2835-usb
>        - const: hisilicon,hi6220-usb
> +      - const: ingenic,jz4775-otg
> +      - const: ingenic,jz4780-otg
> +      - const: ingenic,x1000-otg
> +      - const: ingenic,x1600-otg
> +      - const: ingenic,x1830-otg
> +      - const: ingenic,x2000-otg

I don't know if all these IPs are the exact same, but if they are, they 
all should have "ingenic,jz4775-otg" as the fallback.

-Paul

>        - items:
>            - const: rockchip,rk3066-usb
>            - const: snps,dwc2
> --
> 2.7.4
> 


