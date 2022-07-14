Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8AED757524A
	for <lists+linux-usb@lfdr.de>; Thu, 14 Jul 2022 17:57:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240084AbiGNP47 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 Jul 2022 11:56:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58056 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239542AbiGNP46 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 Jul 2022 11:56:58 -0400
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF343599E5
        for <linux-usb@vger.kernel.org>; Thu, 14 Jul 2022 08:56:56 -0700 (PDT)
Received: by mail-pg1-x533.google.com with SMTP id e132so1942764pgc.5
        for <linux-usb@vger.kernel.org>; Thu, 14 Jul 2022 08:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lLviYBi0EEVTEK9OZBXA1Mtdyl9BBuGrQsiJWIffSLo=;
        b=L3oAEpzX0IX2pH4VwwwjyTXoosibanseQN4CDqsjA6Bu4+C/xlawuV4emkuBaqsH0n
         n6BkBG4l0rDXU3BA2GEmNtU4B0c5mLs9hBJ1VZVjnydtMVITrjAUI2SH8RqtCzt4NnZd
         F9wGpE2vTbfRscRHmyyRN4/BoDOBIhu2kr5MA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lLviYBi0EEVTEK9OZBXA1Mtdyl9BBuGrQsiJWIffSLo=;
        b=CtZy6uM/OPXpgH411o+WHeTuuF58bpDPRWEc9dCUis+H4vdryqw4sAfU9r0d5Cc+V9
         3TRtsTnmfIE4yftivNcfM08JQ2rdEMqpp/S+Sr+A0HpuxL+f0mIjY42RmYeWVefiY0Ag
         fyGmdMdovb3WvLt6ka3PPo7jq4uB3KSxjzPxxukjNie1diKvLTD82ycIgH/OWIUg0mE0
         WiTXv2eG1FE+ISZr2BAZ/153NQWqWazXzseAxrICmjW7p1QsQsVMqZI6DCvSBufWLEoq
         j9o4+lOOjjM899Z45YE2oUvKpEA0kPFUsmml/9gpsWuk3wj+BdWotvyB0AZDgP3vK1rK
         n7TQ==
X-Gm-Message-State: AJIora+3XbsvzqHU3RkjAMOORif/8DBXX95soNsIoevKyxMBX8gBMD1o
        QFAEtMZeyZ4WZmAdkqN/wVpP3A==
X-Google-Smtp-Source: AGRyM1sLnOFPl4fG2U3W3rTEG+gJwQIwhQlBSRnWe/bWEdGj5rCxCF00oDCEdis+edha90DBwp7vMw==
X-Received: by 2002:a05:6a00:1812:b0:52a:c171:7cc5 with SMTP id y18-20020a056a00181200b0052ac1717cc5mr9018198pfa.81.1657814216173;
        Thu, 14 Jul 2022 08:56:56 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:f9cb:38e0:c8f1:abe1])
        by smtp.gmail.com with UTF8SMTPSA id b3-20020a170902d50300b0016bedcced2fsm1719648plg.35.2022.07.14.08.56.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Jul 2022 08:56:55 -0700 (PDT)
Date:   Thu, 14 Jul 2022 08:56:54 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Krishna Kurapati <quic_kriskura@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: qcom: Defer dwc3-qcom probe if dwc3 isn't
 probed properly
Message-ID: <YtA8xloSXtZfBr51@google.com>
References: <1657810516-31143-1-git-send-email-quic_kriskura@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1657810516-31143-1-git-send-email-quic_kriskura@quicinc.com>
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 14, 2022 at 08:25:16PM +0530, Krishna Kurapati wrote:
> On SC7180 devices, it is observed that dwc3 probing is deferred
> because device_links_check_suppliers() finds that '88e3000.phy'
> isn't ready yet.
> 
> As a part of its probe call, dwc3-qcom driver checks if dwc3 core
> is wakeup capable or not. If the dwc3 core is wakeup capable, driver
> configures dwc-qcom's power domain to be always ON. Also it configures
> dp/dm interrupts accordingly to support wakeup from system suspend.
> 
> More info regarding the same can be found at:
> commit d9be8d5c5b03 ("usb: dwc3: qcom: Keep power domain on to retain controller status"
> commit 6895ea55c385 ("usb: dwc3: qcom: Configure wakeup interrupts during suspend")
> 
> In the event, dwc3 probe gets deferred and is processed after dwc3-qcom
> probe, driver ends up reading the wakeup capability of dwc3 core as false
> leading to instability in suspend/resume path.
> 
> To avoid this scenario, ensure dwc3_probe is successful by checking
> if appropriate driver is assigned to it or not after the of_platform_populate
> call. If it isn't then defer dwc3-qcom probe as well.
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>

Fixes: 649f5c842ba3 ("usb: dwc3: core: Host wake up support from system suspend")

> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 7703655..096d1414 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -722,6 +722,9 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
>  		dev_err(dev, "failed to get dwc3 platform device\n");
>  	}
>  
> +	if (!qcom->dwc3->dev.driver)
> +		return -EPROBE_DEFER;

change this to:

		ret = -EPROBE_DEFER;

to put 'dwc3_np'

> +
>  node_put:
>  	of_node_put(dwc3_np);
>  
> -- 
> 2.7.4
> 
