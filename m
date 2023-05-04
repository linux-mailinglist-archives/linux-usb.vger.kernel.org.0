Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 300736EFE15
	for <lists+linux-usb@lfdr.de>; Thu, 27 Apr 2023 01:42:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242780AbjDZXm1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 26 Apr 2023 19:42:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241611AbjDZXmX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 26 Apr 2023 19:42:23 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D87FE3ABD
        for <linux-usb@vger.kernel.org>; Wed, 26 Apr 2023 16:42:17 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-504e232fe47so14278917a12.2
        for <linux-usb@vger.kernel.org>; Wed, 26 Apr 2023 16:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682552536; x=1685144536;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZLVs3263t2teDRTXdz5t8bFzGRiK7kYETPsxms6eL6I=;
        b=Ttz+SLmrQfsQ2A3EcrAQow5haAlQmo4fTMb+Imrs7ICAuXH7Myhkhco84qhNfFRP5J
         CjP945mmPsI2U5NP5LsH2u5FzOQhlnUoKaugxPPdUhEDYW6lvJw97+pANAC8zqW44aqG
         Y2FiIPmIOQTkbw+9VKIsOdhv42OKPJ34QlK1Wzvfq7FFbju2NnrUBGe36lIeCuSDzk58
         4120Z7AsAjcfoVhzWC//ydHWqXi3cFOafqpH400suCq72WQdQ7j25681Tu/xtP2cXehl
         OOB+OlyvOFkGleZjvj/rQP4le06vY4JkFYfuA6b8u2f32dvffoiIf/TWNnf0gHXOxtdx
         fKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682552536; x=1685144536;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZLVs3263t2teDRTXdz5t8bFzGRiK7kYETPsxms6eL6I=;
        b=gqVh7NpeTgngYM72ojSpCwKhxb8OnvctXg5vWIGbc7ggwnUevKHHYo6r4qaA9fE/7O
         3d6vzuJcGu3xWYv9ZtMIziWXftygnnl8/+0hK75dMTMndP+SZomFmnLxr8sxLHX+oXXP
         DDFUGLSCFpqpJDF0kgEo3cB9IpjEi1Hg19CL0fE1ODOwVpSOFtF1W2KU57P1HRoSxSkr
         BAo5M+LShzrHjWiklDywXXH9acRGPiS2r63k9U4bkPzgMTxkguQGdMfUUYSzLhItVS9z
         GryORSXSe0Dm/528k5w3X7+x/OVfqrnPqwe9+2zemduxl3Xi0rIhQ6douHyGs/9wxcBn
         09TA==
X-Gm-Message-State: AAQBX9cwOQ2HGKAAhze5RFb2oNLx3WQTsk+HKkLO9buba4wIQk0jjv83
        XaZIKIxr4GKHGTxSsYTZxbFryw==
X-Google-Smtp-Source: AKy350YsWJrmVXvulbVEZKykpoK9kWHFkFN2sJlJoFlZgl/ec3q490HFPPTRY7ORu7kZUvq3uA76Qg==
X-Received: by 2002:a17:906:1498:b0:94f:322d:909c with SMTP id x24-20020a170906149800b0094f322d909cmr19109414ejc.34.1682552536106;
        Wed, 26 Apr 2023 16:42:16 -0700 (PDT)
Received: from [172.23.2.152] ([31.221.30.162])
        by smtp.gmail.com with ESMTPSA id e6-20020a1709062c0600b0094ef2003581sm8804723ejh.153.2023.04.26.16.42.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Apr 2023 16:42:15 -0700 (PDT)
Message-ID: <ac49075d-439e-da46-9ef6-0b0828f8e072@linaro.org>
Date:   Thu, 27 Apr 2023 00:42:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v1 0/6] arm64: qcom: sa8775p: add support for USB
Content-Language: en-US
To:     Adrien Thierry <athierry@redhat.com>,
        Shazad Hussain <quic_shazhuss@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org
References: <20230421133922.8520-1-quic_shazhuss@quicinc.com>
 <ZEcEGJiikEC2wIVE@fedora>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <ZEcEGJiikEC2wIVE@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 4/24/23 23:35, Adrien Thierry wrote:
> Hi Shazad,
>
> On Fri, Apr 21, 2023 at 07:09:15PM +0530, Shazad Hussain wrote:
>> Update relavent DT bindings for USB, add new config to the phy driver,
>> add USB and PHY nodes to the .dtsi and enable them in the board .dts
>> for the sa8775p-ride platform.
>>
>> Shazad Hussain (6):
>>    dt-bindings: usb: qcom,dwc3: Add bindings for SA8775P
>>    dt-bindings: phy: qcom,usb-snps-femto-v2: Add bindings for SA8775P
>>    dt-bindings: phy: qcom,sc8280xp-qmp-usb3-uni: Add SA8775P USB PHY
>>      binding
>>    phy: qcom-qmp: Add SA8775P USB3 UNI phy
>>    arm64: dts: qcom: sa8775p: add USB nodes
>>    arm64: dts: qcom: sa8775p-ride: enable USB nodes
>>
>>   .../phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml   |   1 +
>>   .../bindings/phy/qcom,usb-snps-femto-v2.yaml  |   1 +
>>   .../devicetree/bindings/usb/qcom,dwc3.yaml    |   5 +
>>   arch/arm64/boot/dts/qcom/sa8775p-ride.dts     |  92 +++++++
>>   arch/arm64/boot/dts/qcom/sa8775p.dtsi         | 239 +++++++++++++++++-
>>   drivers/phy/qualcomm/phy-qcom-qmp-usb.c       |  45 ++++
>>   6 files changed, 381 insertions(+), 2 deletions(-)
>>
>> -- 
>> 2.17.1
>>
> Thanks for posting this. I tested the series on the sa8775p, and it seems
> initialization for the controller at a400000 sometimes fails with a
> timeout (-110) error:
>
>      dwc3 a400000.usb: Adding to iommu group 2
>      xhci-hcd xhci-hcd.0.auto: xHCI Host Controller
>      xhci-hcd xhci-hcd.0.auto: new USB bus registered, assigned bus number 1
>      xhci-hcd xhci-hcd.0.auto: can't setup: -110
>      xhci-hcd xhci-hcd.0.auto: USB bus 1 deregistered
>      xhci-hcd: probe of xhci-hcd.0.auto failed with error -110
>      dwc3 a600000.usb: Adding to iommu group 3
>      dwc3 a800000.usb: Adding to iommu group 4
>      xhci-hcd xhci-hcd.1.auto: xHCI Host Controller
>      xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned bus number 1
>      xhci-hcd xhci-hcd.1.auto: hcc params 0x0110ffc5 hci version 0x110 quirks 0x0000000000010010
>      xhci-hcd xhci-hcd.1.auto: irq 162, io mem 0x0a800000
>      xhci-hcd xhci-hcd.1.auto: xHCI Host Controller
>      xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned bus number 2
>      xhci-hcd xhci-hcd.1.auto: Host supports USB 3.1 Enhanced SuperSpeed
>      hub 1-0:1.0: USB hub found
>      hub 1-0:1.0: 1 port detected
>      usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
>      hub 2-0:1.0: USB hub found
>      hub 2-0:1.0: 1 port detected
>
> In this case, only usb devices for a800000 are showing:
>
>      dracut:/# ls -alh /sys/bus/usb/devices
>      total 0
>      drwxr-xr-x 2 root root 0 Feb 27 00:00 .
>      drwxr-xr-x 4 root root 0 Feb 27 00:00 ..
>      lrwxrwxrwx 1 root root 0 Feb 27 00:00 1-0:1.0 -> ../../../devices/platform/soc@0/a8f8800.usb/a800000.usb/xhci-hcd.1.auto/usb1/1-0:1.0
>      lrwxrwxrwx 1 root root 0 Feb 27 00:00 2-0:1.0 -> ../../../devices/platform/soc@0/a8f8800.usb/a800000.usb/xhci-hcd.1.auto/usb2/2-0:1.0
>      lrwxrwxrwx 1 root root 0 Feb 27 00:00 usb1 -> ../../../devices/platform/soc@0/a8f8800.usb/a800000.usb/xhci-hcd.1.auto/usb1
>      lrwxrwxrwx 1 root root 0 Feb 27 00:00 usb2 -> ../../../devices/platform/soc@0/a8f8800.usb/a800000.usb/xhci-hcd.1.auto/usb2
>
> This happens approximately 1 out of 2 reboots. Here's the kernel output
> when initialization succeeds:
>
>      dwc3 a600000.usb: Adding to iommu group 2
>      dwc3 a800000.usb: Adding to iommu group 3
>      xhci-hcd xhci-hcd.0.auto: xHCI Host Controller
>      xhci-hcd xhci-hcd.0.auto: new USB bus registered, assigned bus number 1
>      xhci-hcd xhci-hcd.0.auto: hcc params 0x0110ffc5 hci version 0x110 quirks 0x0000000000010010
>      xhci-hcd xhci-hcd.0.auto: irq 161, io mem 0x0a800000
>      xhci-hcd xhci-hcd.0.auto: xHCI Host Controller
>      xhci-hcd xhci-hcd.0.auto: new USB bus registered, assigned bus number 2
>      xhci-hcd xhci-hcd.0.auto: Host supports USB 3.1 Enhanced SuperSpeed
>      hub 1-0:1.0: USB hub found
>      hub 1-0:1.0: 1 port detected
>      usb usb2: We don't know the algorithms for LPM for this host, disabling LPM.
>      hub 2-0:1.0: USB hub found
>      hub 2-0:1.0: 1 port detected
>      dwc3 a400000.usb: Adding to iommu group 4
>      xhci-hcd xhci-hcd.1.auto: xHCI Host Controller
>      xhci-hcd xhci-hcd.1.auto: new USB bus registered, assigned bus number 3
>      xhci-hcd xhci-hcd.1.auto: USB3 root hub has no ports
>      xhci-hcd xhci-hcd.1.auto: hcc params 0x0220fe65 hci version 0x110 quirks 0x0000000000010010
>      xhci-hcd xhci-hcd.1.auto: irq 162, io mem 0x0a400000
>      hub 3-0:1.0: USB hub found
>      hub 3-0:1.0: 1 port detected
>
> And the list of usb devices:
>
>      dracut:/# ls -alh /sys/bus/usb/devices
>      total 0
>      drwxr-xr-x 2 root root 0 Feb 27 00:00 .
>      drwxr-xr-x 4 root root 0 Feb 27 00:00 ..
>      lrwxrwxrwx 1 root root 0 Feb 27 00:00 1-0:1.0 -> ../../../devices/platform/soc@0/a8f8800.usb/a800000.usb/xhci-hcd.0.auto/usb1/1-0:1.0
>      lrwxrwxrwx 1 root root 0 Feb 27 00:00 2-0:1.0 -> ../../../devices/platform/soc@0/a8f8800.usb/a800000.usb/xhci-hcd.0.auto/usb2/2-0:1.0
>      lrwxrwxrwx 1 root root 0 Feb 27 00:00 3-0:1.0 -> ../../../devices/platform/soc@0/a4f8800.usb/a400000.usb/xhci-hcd.1.auto/usb3/3-0:1.0
>      lrwxrwxrwx 1 root root 0 Feb 27 00:00 usb1 -> ../../../devices/platform/soc@0/a8f8800.usb/a800000.usb/xhci-hcd.0.auto/usb1
>      lrwxrwxrwx 1 root root 0 Feb 27 00:00 usb2 -> ../../../devices/platform/soc@0/a8f8800.usb/a800000.usb/xhci-hcd.0.auto/usb2
>      lrwxrwxrwx 1 root root 0 Feb 27 00:00 usb3 -> ../../../devices/platform/soc@0/a4f8800.usb/a400000.usb/xhci-hcd.1.auto/usb3
>
> Have you also encountered this?

I've had some issues with QMPPHY not (sometimes?) probing in time on SM6115 only when built as a module.. perhaps it'd be worth checking out of it works fine with =y?


Konrad

>
> Best,
>
> Adrien
>
