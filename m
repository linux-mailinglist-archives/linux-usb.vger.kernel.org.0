Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6149815A213
	for <lists+linux-usb@lfdr.de>; Wed, 12 Feb 2020 08:33:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728350AbgBLHdG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Feb 2020 02:33:06 -0500
Received: from mail-sh.amlogic.com ([58.32.228.43]:14639 "EHLO
        mail-sh.amlogic.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728192AbgBLHdG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Feb 2020 02:33:06 -0500
Received: from [10.18.90.120] (10.18.90.120) by mail-sh.amlogic.com
 (10.18.11.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1591.10; Wed, 12 Feb
 2020 15:33:42 +0800
Subject: Re: [PATCH v8 1/3] dt-bindings: phy: Add Amlogic A1 USB2 PHY Bindings
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kevin Hilman <khilman@baylibre.com>
CC:     Yue Wang <yue.wang@amlogic.com>,
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
References: <1581419454-12667-1-git-send-email-hanjie.lin@amlogic.com>
 <1581419454-12667-2-git-send-email-hanjie.lin@amlogic.com>
 <1jpnelb9pe.fsf@starbuckisacylon.baylibre.com>
From:   Hanjie Lin <hanjie.lin@amlogic.com>
Message-ID: <f154ef4c-ce3c-2a67-01f3-97a5f0af4520@amlogic.com>
Date:   Wed, 12 Feb 2020 15:33:42 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <1jpnelb9pe.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.18.90.120]
X-ClientProxiedBy: mail-sh.amlogic.com (10.18.11.5) To mail-sh.amlogic.com
 (10.18.11.5)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



On 2020/2/11 20:16, Jerome Brunet wrote:
> 
> On Tue 11 Feb 2020 at 12:10, Hanjie Lin <hanjie.lin@amlogic.com> wrote:
> 
>> Add the Amlogic A1 Family USB2 PHY Bindings
>>
>> It supports Host mode only.
>>
>> Signed-off-by: Yue Wang <yue.wang@amlogic.com>
>> Signed-off-by: Hanjie Lin <hanjie.lin@amlogic.com>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> ---
>>  .../bindings/phy/amlogic,meson-g12a-usb2-phy.yaml         | 15 +++++++++++++++
>>  1 file changed, 15 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/phy/amlogic,meson-g12a-usb2-phy.yaml b/Documentation/devicetree/bindings/phy/amlogic,meson-g12a-usb2-phy.yaml
>> index 57d8603..3b7e763 100644
>> --- a/Documentation/devicetree/bindings/phy/amlogic,meson-g12a-usb2-phy.yaml
>> +++ b/Documentation/devicetree/bindings/phy/amlogic,meson-g12a-usb2-phy.yaml
>> @@ -14,6 +14,7 @@ properties:
>>    compatible:
>>      enum:
>>        - amlogic,meson-g12a-usb2-phy
>> +      - amlogic,meson-a1-usb2-phy
>>  
>>    reg:
>>      maxItems: 1
>> @@ -49,6 +50,20 @@ required:
>>    - reset-names
>>    - "#phy-cells"
>>  
>> +allOf:
> 
> Is 'allOf' really needed when there is only one if clause ?
> 

Hi jerome:

Yes, this 'allOf' is not necessary here.
I will remove it.

Thanks,
Hanjie

>> +  - if:
>> +      properties:
>> +        compatible:
>> +          enum:
>> +            - amlogic,meson-a1-usb-ctrl
>> +
>> +    then:
>> +      properties:
>> +        power-domains:
>> +          maxItems: 1
>> +      required:
>> +        - power-domains
>> +
>>  examples:
>>    - |
>>      phy@36000 {
> 
> .
> 
