Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A480B43903E
	for <lists+linux-usb@lfdr.de>; Mon, 25 Oct 2021 09:20:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231373AbhJYHWn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 25 Oct 2021 03:22:43 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:55094 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230183AbhJYHWm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Oct 2021 03:22:42 -0400
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19P6qN51012732;
        Mon, 25 Oct 2021 09:20:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=Z6nK0T3KPSvgwKH+T3spCM1HMT7IXBot+P5ETpHeGOY=;
 b=ik4sp/2PfFjDhr+Ag/T2oYCwJe1sgraRcPk/Cl9seEHii6YdzEWP7Gp88L5Lc7L0Jtli
 KVJpOmYi2CrjOSo65GDmUrlgYGdXSlsr67PhhKu/5iPNfvBVbozdEdK139Dpz764Ygmx
 Wb6+7q0cub6KquIBCjsNcXide+jzjHd1/rMMst8yEEmaOWdVo95SnhY+PIbbBuaO5X91
 UlNrWavEkTNya4KeEyYRGJjpJwsFfb9sTDjIz/XFC4z1o+gKOnsgtfhAI6gjlKWADpzq
 tlgE8tSpZNs5u3ljNTi8iav+wZxjoAZVB0uxncxej1XMdiJe5tiE+Z8k1OmSY4gXldku lA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3bwqpsg58h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 25 Oct 2021 09:20:15 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5550310002A;
        Mon, 25 Oct 2021 09:20:15 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 312A02138EF;
        Mon, 25 Oct 2021 09:20:15 +0200 (CEST)
Received: from [10.211.0.75] (10.75.127.50) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 25 Oct
 2021 09:20:13 +0200
Subject: Re: [PATCH] dt-bindings: usb: dwc2: Add otg-rev property
 documentation
To:     Marek Vasut <marex@denx.de>, <linux-usb@vger.kernel.org>
CC:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>
References: <20211024003652.227772-1-marex@denx.de>
From:   Fabrice Gasnier <fabrice.gasnier@foss.st.com>
Message-ID: <d3169061-e131-8dd9-5796-b82b9800cef1@foss.st.com>
Date:   Mon, 25 Oct 2021 09:20:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20211024003652.227772-1-marex@denx.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE3.st.com (10.75.127.6) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-10-25_02,2021-10-25_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 10/24/21 2:36 AM, Marek Vasut wrote:
> Copy the otg-rev property documentation from usb-drd.yaml into the DWC2
> binding document, since some users of the DWC2 IP like STM32MP1 use the
> otg-rev property in DT bindings for this controller.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> ---
> NOTE: Shouldn't this somehow be part of the USB core bindings instead?

Hi Marek,

Yes, this is similar to patch series I sent recently, see [1].

[1]
https://lore.kernel.org/linux-usb/1634133425-25670-1-git-send-email-fabrice.gasnier@foss.st.com/

BR,
Fabrice

> ---
>  Documentation/devicetree/bindings/usb/dwc2.yaml | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/usb/dwc2.yaml b/Documentation/devicetree/bindings/usb/dwc2.yaml
> index 10c7d9b6cc53f..254436c19870b 100644
> --- a/Documentation/devicetree/bindings/usb/dwc2.yaml
> +++ b/Documentation/devicetree/bindings/usb/dwc2.yaml
> @@ -120,6 +120,16 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/uint32-array
>      description: size of periodic tx fifo per endpoint (except ep0) in gadget mode.
>  
> +  otg-rev:
> +    description:
> +      Tells usb driver the release number of the OTG and EH supplement with
> +      which the device and its descriptors are compliant, in binary-coded
> +      decimal (i.e. 2.0 is 0200H). This property is used if any real OTG
> +      features (HNP/SRP/ADP) is enabled. If ADP is required, otg-rev should be
> +      0x0200 or above.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0x0100, 0x0120, 0x0130, 0x0200]
> +
>    snps,need-phy-for-wake:
>      $ref: /schemas/types.yaml#/definitions/flag
>      description: If present indicates that the phy needs to be left on for 
> 
