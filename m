Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 83BFD131DAE
	for <lists+linux-usb@lfdr.de>; Tue,  7 Jan 2020 03:35:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727384AbgAGCfN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Jan 2020 21:35:13 -0500
Received: from mail-sh.amlogic.com ([58.32.228.43]:30798 "EHLO
        mail-sh.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727295AbgAGCfN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Jan 2020 21:35:13 -0500
Received: from [10.18.38.198] (10.18.38.198) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Tue, 7 Jan
 2020 10:35:34 +0800
Subject: Re: [PATCH v3 1/6] dt-bindings: phy: Add Amlogic A1 USB2 PHY Bindings
To:     Rob Herring <robh@kernel.org>
CC:     Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Yue Wang <yue.wang@amlogic.com>,
        <linux-amlogic@lists.infradead.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        Carlo Caione <carlo@caione.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Liang Yang <liang.yang@amlogic.com>,
        Jianxin Pan <jianxin.pan@amlogic.com>,
        Qiufang Dai <qiufang.dai@amlogic.com>,
        Jian Hu <jian.hu@amlogic.com>,
        Victor Wan <victor.wan@amlogic.com>,
        Xingyu Chen <xingyu.chen@amlogic.com>
References: <1577428606-69855-1-git-send-email-hanjie.lin@amlogic.com>
 <1577428606-69855-2-git-send-email-hanjie.lin@amlogic.com>
 <20200104002806.GA24214@bogus>
From:   Hanjie Lin <hanjie.lin@amlogic.com>
Message-ID: <dca2c600-fb07-4071-4cf0-0392e64f450c@amlogic.com>
Date:   Tue, 7 Jan 2020 10:35:34 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200104002806.GA24214@bogus>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.18.38.198]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 2020/1/4 8:28, Rob Herring wrote:
> On Fri, Dec 27, 2019 at 02:36:41PM +0800, Hanjie Lin wrote:
>> Add the Amlogic A1 Family USB2 PHY Bindings
>>
>> It supports Host mode only.
>>
>> Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
>> Signed-off-by: Yue Wang <yue.wang@amlogic.com>
>> ---
>>  .../bindings/phy/amlogic,meson-a1-usb2-phy.yaml    | 55 ++++++++++++++++++++++
>>  1 file changed, 55 insertions(+)
>>  create mode 100644 Documentation/devicetree/bindings/phy/amlogic,meson-a1-usb2-phy.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/phy/amlogic,meson-a1-usb2-phy.yaml b/Documentation/devicetree/bindings/phy/amlogic,meson-a1-usb2-phy.yaml
>> new file mode 100644
>> index 00000000..2b2c526
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/phy/amlogic,meson-a1-usb2-phy.yaml
>> @@ -0,0 +1,55 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +# Copyright 2019 Amlogic, Inc
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/phy/amlogic,meson-a1-usb2-phy.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>> +
>> +title: Amlogic A1 USB2 PHY
>> +
>> +maintainers:
>> +  - Yue Wang <yue.wang@amlogic.com>
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - amlogic,meson-a1-usb2-phy
> 
> Use 'const' if there's only 1.
> 

Ok

>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  resets:
>> +    maxItems: 1
>> +
>> +  reset-names:
>> +    items:
>> +      - const: phy
> 
> Don't need *-names when there's a single entry.
> 

Ok

>> +
>> +  "#phy-cells":
>> +    const: 0
>> +
>> +  power-domains:
>> +     maxItems: 1
>> +     description:
>> +       a phandle to respective power domain node as described by generic
>> +       PM domain bindings (see power/power_domain.txt for more information).
> 
> Drop the generic description. No need to duplicate everywhere.
> 

Ok, I will modify these issues.

Thanks

Hanjie

>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - resets
>> +  - reset-names
>> +  - "#phy-cells"
>> +  - power-domains
>> +
>> +examples:
>> +  - |
>> +    usb2_phy1: phy@40000 {
>> +      status = "okay";
>> +      compatible = "amlogic,a1-usb2-phy";
>> +      reg = <0x0 0x40000 0x0 0x2000>;
>> +      resets = <&reset RESET_USBPHY>;
>> +      reset-names = "phy";
>> +      #phy-cells = <0>;
>> +      power-domains = <&pwrc PWRC_USB_ID>;
>> +    };
>> -- 
>> 2.7.4
>>
> 
> .
> 
