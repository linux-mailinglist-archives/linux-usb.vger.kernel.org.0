Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13BB0560F9E
	for <lists+linux-usb@lfdr.de>; Thu, 30 Jun 2022 05:30:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232025AbiF3Daa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Jun 2022 23:30:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230386AbiF3Da2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Jun 2022 23:30:28 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 819CD35A85
        for <linux-usb@vger.kernel.org>; Wed, 29 Jun 2022 20:30:27 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id q11so24310408oih.10
        for <linux-usb@vger.kernel.org>; Wed, 29 Jun 2022 20:30:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=vmWO1bX6e8/Hu74o/LHcG8YcSD0XqQe6mmyPQwkDsH0=;
        b=KtTuvfGKJFovDnq4WF87SWlUm/o+U7aMWXjeXmq4aaJuRE/4Qv3e56VMOFiWLOBR4X
         ZN5yqS87AUWbPB6iTd/Wwv8gu+Y2YfgqlzXd5e52VwQIjvu0lmNWQs6RBa1w0x71o1Wh
         Opy217J7SVwkFpDD4KCECh2y2B3X5ml4uuRblBaATnEfiJBwSbM5LZghGgcsye0b+vVI
         qy/q76O7cI2+JjTGDef8K09dm1TK0TL4cnuIZjRDn9fbRaXAM8QAkAfz/VgvroqDfBaV
         VNSDNZZNQVMljn67Ujrvn2XSQaKQlRsW/icEML1R0ChYr7wm1wpEgSbL0TYWOP4QF+o1
         SM/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=vmWO1bX6e8/Hu74o/LHcG8YcSD0XqQe6mmyPQwkDsH0=;
        b=Tlbnofduj6PGAcNMLlKMB3yJVwHWis2MmW9h3w3d+lVlxrEvwv0g4Ysm9AyMuRmQSl
         ZF/nMR2bw2CBXtiKr2HkC/fZvslKHr8h8ZuvWNta1Sb71GCQVtgRHT2ySLSauuUtxEX3
         t/WQyAtBLAk2Bvu4dOS4jbxn1CUv4Fb8paOQsRnbOLy9Di2XQsYilBBMFKqPMT6orjvq
         qUip4p51Lh7tHj8nH5/6IDZep+0feZYoIBFILkd769LV2BRud1PzKOidF17RekBM7mNm
         N3XHuCbG+tiQteXBeluM4G/2KnRlUn+RFetPEDBzT4AffgqZ6qZsyF64jyrMPEmsIGmk
         KDMQ==
X-Gm-Message-State: AJIora+4lIHulICN1PRanSKGrfo/KzN5Cr6MEQ/dk4sxuLlQDyQAIPpQ
        Uga69/BX3iEJ7bYf2BcDs5385g==
X-Google-Smtp-Source: AGRyM1t4p1tRCN42sY1rawYoYJ6RPTS2JYo+xN86JOKVaP6uhUJLJTfm4SCjmYJOZvHZM85eJ9qkBg==
X-Received: by 2002:a05:6808:17a0:b0:32f:5531:7b52 with SMTP id bg32-20020a05680817a000b0032f55317b52mr5218614oib.220.1656559826817;
        Wed, 29 Jun 2022 20:30:26 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id w22-20020a9d5a96000000b00616caca05adsm6666353oth.80.2022.06.29.20.30.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jun 2022 20:30:25 -0700 (PDT)
Date:   Wed, 29 Jun 2022 22:30:23 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH 06/13] arm64: dts: qcom: correct DWC3 node names and unit
 addresses
Message-ID: <Yr0Yz7UATt0aqvL1@builder.lan>
References: <20220504131923.214367-1-krzysztof.kozlowski@linaro.org>
 <20220504131923.214367-7-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220504131923.214367-7-krzysztof.kozlowski@linaro.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed 04 May 08:19 CDT 2022, Krzysztof Kozlowski wrote:
[..]
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 692cf4be4eef..6af80a627c3a 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -3868,7 +3868,7 @@ usb_1: usb@a6f8800 {
>  					<&gladiator_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3_0 0>;
>  			interconnect-names = "usb-ddr", "apps-usb";
>  
> -			usb_1_dwc3: dwc3@a600000 {
> +			usb_1_dwc3: usb@a600000 {

Linux uses the dev_name() when identifying each of these controllers in
/sys/class/UDC, as such changing the name here will break existing USB
ConfigFS Gadget users.

We had this fixed for a while, but where forced to revert it.


So I think, in order for us to merge this without breaking AOSP, we'd
need to come up with a way to retain the old UDC name (perhaps a label
property?)

Regards,
Bjorn
