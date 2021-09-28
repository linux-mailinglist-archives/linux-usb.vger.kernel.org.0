Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5511041B0F9
	for <lists+linux-usb@lfdr.de>; Tue, 28 Sep 2021 15:37:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241095AbhI1Nic (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 28 Sep 2021 09:38:32 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:37967 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241427AbhI1Ni2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 28 Sep 2021 09:38:28 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1632836209; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=RXIq/K2ohsUwqQm35SM1S19TmqC+YjwzpoMV/xptKiU=;
 b=cTg5TaYwT/vbg4q+3+YQZlFTis1doCqpVemec+8KKcm8dYGQ2ysSNsodNTvDjd4Z8WOhAwdS
 bmJxBXoLqvCNCXwEavd4b1+7GgKQ3bRERktzKBNszDZ42uNpTyEg4UYV/SLtSoCwcD+U/E5v
 fyosHbU3DJD0USCc0kjUzOn97ZU=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyIxZTE2YSIsICJsaW51eC11c2JAdmdlci5rZXJuZWwub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 61531a6b9ffb4131497e37bd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 28 Sep 2021 13:36:43
 GMT
Sender: pmaliset=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A0C30C447A3; Tue, 28 Sep 2021 13:36:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pmaliset)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BFACEC4338F;
        Tue, 28 Sep 2021 13:36:41 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 28 Sep 2021 19:06:41 +0530
From:   Prasad Malisetty <pmaliset@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     agross@kernel.org, bhelgaas@google.com, bjorn.andersson@linaro.org,
        lorenzo.pieralisi@arm.com, robh+dt@kernel.org,
        svarbanov@mm-sol.com, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, dianders@chromium.org,
        mka@chromium.org, vbadigan@codeaurora.org, sallenki@codeaurora.org,
        manivannan.sadhasivam@linaro.org
Subject: Re: [PATCH v8 3/4] arm64: dts: qcom: sc7280: Add PCIe nodes for IDP
 board
In-Reply-To: <CAE-0n53N-7wGgGmqep6ZTAt14dYObq43cTak_BWAjy6XS0Gnig@mail.gmail.com>
References: <1631898947-27433-1-git-send-email-pmaliset@codeaurora.org>
 <1631898947-27433-4-git-send-email-pmaliset@codeaurora.org>
 <CAE-0n53N-7wGgGmqep6ZTAt14dYObq43cTak_BWAjy6XS0Gnig@mail.gmail.com>
Message-ID: <5677240b6391d3e9a2d9a629505b9bf6@codeaurora.org>
X-Sender: pmaliset@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2021-09-21 01:21, Stephen Boyd wrote:
> Quoting Prasad Malisetty (2021-09-17 10:15:46)
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
>> index 99f9ee5..ee00df0 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
>> @@ -199,6 +199,39 @@
>>         modem-init;
>>  };
>> 
>> +&pcie1 {
>> +       status = "okay";
>> +
>> +       perst-gpio = <&tlmm 2 GPIO_ACTIVE_LOW>;
>> +       pinctrl-0 = <&pcie1_default_state &nvme_ldo_enable_pin>;
>> +};
>> +
>> +&pcie1_phy {
>> +       status = "okay";
>> +
>> +       vdda-phy-supply = <&vreg_l10c_0p8>;
>> +       vdda-pll-supply = <&vreg_l6b_1p2>;
>> +};
>> +
>> +&pcie1_default_state {
>> +       reset-n {
>> +               pins = "gpio2";
>> +               function = "gpio";
>> +
>> +               drive-strength = <16>;
>> +               output-low;
>> +               bias-disable;
>> +       };
>> +
>> +       wake-n {
>> +               pins = "gpio3";
>> +               function = "gpio";
>> +
>> +               drive-strength = <2>;
>> +               bias-pull-up;
>> +       };
> 
> I think the previous round of this series Bjorn was saying that these
> should be different nodes and tacked onto the pinctrl-0 list for the
> pcie1 device instead of adding them as subnodes of the "default state".
> 

Hi Stephen,

Here NVMe gpio entry is endpoint related where as wake-n and reset-n are 
PCIe controller gpio's. I think Bjorn was saying keep endpoint related 
gpio (NVMe) in separate state entry in pinctrl-0 list.

Thanks
-Prasad.

>> +};
>> +
>>  &pmk8350_vadc {
>>         pmk8350_die_temp {
>>                 reg = <PMK8350_ADC7_DIE_TEMP>;
>> @@ -343,3 +376,10 @@
>>                 bias-pull-up;
>>         };
>>  };
>> +
>> +&tlmm {
>> +       nvme_ldo_enable_pin: nvme_ldo_enable_pin {
> 
> Please use dashes where you use underscores in node names
> 
>        nvme_ldo_enable_pin: nvme-ldo-enable-pin {
> 
>> +               function = "gpio";
>> +               bias-pull-up;
> 
> Of course with that said, the name of this node makes it sound like 
> this
> is a gpio controlled regulator. Why not use that binding then and 
> enable
> the regulator either by default with regulator properties like
> regulator-always-on and regulator-boot-enable and/or reference it from
> the pcie device somehow so that it can be turned off during suspend?
> 
Agree, I will add in next patch series.

>> +       };
>> +};
