Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 107CC6DF237
	for <lists+linux-usb@lfdr.de>; Wed, 12 Apr 2023 12:51:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229759AbjDLKvn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 Apr 2023 06:51:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbjDLKvm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 Apr 2023 06:51:42 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA1C76A45
        for <linux-usb@vger.kernel.org>; Wed, 12 Apr 2023 03:51:41 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 590FE62EAC
        for <linux-usb@vger.kernel.org>; Wed, 12 Apr 2023 10:51:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A789BC433D2;
        Wed, 12 Apr 2023 10:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1681296700;
        bh=Lg5pm7FSqYhrsA7eCeAkVtZrBrMnjAirxKahsI9Xy2k=;
        h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
        b=Lp2+1sz7VunsOlJlGV1GgdMuJg/1BFnudjlDMA9AuOpVTOTVWXqOtPU38siOwg/D4
         vIRTVLzPOj4fbBSlE5HDbxhlsfxK0yTaJ9K9I825d7ezmn9ry0umGb5Vld/Ob70lVx
         t/Z3qQy/D3/Af9l1F83kTexEqHdl9zIr/BD2+D0z6ygubg7H39ok+AlG00laczwBdT
         MPUjfRNQETbNBboTpVFDQdU8Cku+0oRjSbi6WrPNbDQU+b72FNY8J0UKFV5nLCztOT
         LK2mwQ82Yr7aH6okHunZByHgdf6BT53F9gZqtrX0D7wCtHyXiytH+x/jneOZNhkPe7
         +hBh9b7eYgolQ==
Message-ID: <92865c32-ce19-1455-564c-76d8af102276@kernel.org>
Date:   Wed, 12 Apr 2023 12:51:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 2/2] dt-bindings: usb: snps,dwc3: Add
 'snps,parkmode-disable-hs-quirk' quirk
Content-Language: en-US
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Stanley Chang <stanley_chang@realtek.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
References: <20230411053550.16360-1-stanley_chang@realtek.com>
 <20230411053550.16360-2-stanley_chang@realtek.com>
 <20230411213514.7ck6f4jinnpzl4xo@synopsys.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20230411213514.7ck6f4jinnpzl4xo@synopsys.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_MED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 11/04/2023 23:35, Thinh Nguyen wrote:
> +Rob
> 
> On Tue, Apr 11, 2023, Stanley Chang wrote:
>> Add a new 'snps,parkmode-disable-hs-quirk' DT quirk to dwc3 core for
>> disable the high-speed parkmode.
>>
>> Signed-off-by: Stanley Chang <stanley_chang@realtek.com>
>> ---
>>  Documentation/devicetree/bindings/usb/snps,dwc3.yaml | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
>> index be36956af53b..45ca967b8d14 100644
>> --- a/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
>> +++ b/Documentation/devicetree/bindings/usb/snps,dwc3.yaml
>> @@ -232,6 +232,11 @@ properties:
>>        When set, all SuperSpeed bus instances in park mode are disabled.
>>      type: boolean
>>  
>> +  snps,parkmode-disable-hs-quirk:
>> +    description:
>> +      When set, all HighSpeed bus instances in park mode are disabled.
>> +    type: boolean
>> +
>>    snps,dis_metastability_quirk:
>>      description:
>>        When set, disable metastability workaround. CAUTION! Use only if you are
>> -- 
>> 2.34.1
>>
> 
> Please also Cc the devicetree maintainer.
> 

No, please use scripts/get_maintainers.pl

Best regards,
Krzysztof

