Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E29A459EC8E
	for <lists+linux-usb@lfdr.de>; Tue, 23 Aug 2022 21:38:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232117AbiHWThA (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 23 Aug 2022 15:37:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232054AbiHWTgh (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 23 Aug 2022 15:36:37 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 297C1F1B7A
        for <linux-usb@vger.kernel.org>; Tue, 23 Aug 2022 11:33:21 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id m2so13576234pls.4
        for <linux-usb@vger.kernel.org>; Tue, 23 Aug 2022 11:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=h0fZBa4RIPV1lUQU8KdlmL0X2qjbCYHqc2je/hll2RI=;
        b=Voh+qKavx7B3jK+RcBLlhE6kqdY9ZA1VYViVd6oI3FoyRAcRgrXOVZKsZstrHGbjQv
         ZyboF85ngechUBZmkWDQc0vZzdPcYFzrcBGMxHcm+Qdd3QhmZdH48fd1r0xlfWp8vkCE
         +OMv0KFrlH1rhxqCfNnT76KBStIwiZxNnUM/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=h0fZBa4RIPV1lUQU8KdlmL0X2qjbCYHqc2je/hll2RI=;
        b=78MyD4aMtesDCojW5+7KBJB4pT7xVRDXHzNWBEwnhbxdLNxupwhK1Efhh+oMDxNebO
         KVerSdUMnK1DXUh7Cjn1tqy3oqVXe00wRlfxwhSfFjff3BhHxv/2j/YIhfcRpRU9Aaju
         JGET4ZQej9egaCumq0Gy5RpRQnPXvHMCte4dsRfTS9JUQTgm9+LcccFsvfOQed1vQ51B
         AMBVZ7Tv/CdhpQTd9YYjAswZTAW33+0cQjGw0eAKqfA0qNJmronnKEtYE7+EqWSBwfSU
         r0MdsmomAow5ARC6/wF8G3ljiH9Gn/OjObYPU++wd0wWbr/b6hBEem3+CChsyRv4vIep
         q4tw==
X-Gm-Message-State: ACgBeo2k0LtFsHf946Aefe5eLYQlDK+t/9TDGtvxTtfMR1CY6Oit6tsx
        x5GtuWLlhUwGjD5Ju0shbybWQg==
X-Google-Smtp-Source: AA6agR6AKcCS1DcwchHgXQr7Id/ZYfcJPfbgIw53jD4US0Kc8wG1Esq72w3z7Qj7/BA+V5CseIZKaQ==
X-Received: by 2002:a17:902:d50b:b0:172:d4f4:91aa with SMTP id b11-20020a170902d50b00b00172d4f491aamr16155779plg.53.1661279600756;
        Tue, 23 Aug 2022 11:33:20 -0700 (PDT)
Received: from localhost ([2620:15c:11a:202:fee6:a961:5d1d:553])
        by smtp.gmail.com with UTF8SMTPSA id x11-20020aa7956b000000b00535da15a252sm10784457pfq.165.2022.08.23.11.33.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 11:33:20 -0700 (PDT)
Date:   Tue, 23 Aug 2022 11:33:18 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Johan Hovold <johan+linaro@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        Pavankumar Kondeti <quic_pkondeti@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: keep PHYs disabled during suspend
Message-ID: <YwUdbkyL8GgvLQJA@google.com>
References: <20220823124047.14634-1-johan+linaro@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220823124047.14634-1-johan+linaro@kernel.org>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Johan,

On Tue, Aug 23, 2022 at 02:40:47PM +0200, Johan Hovold wrote:
> Commit 649f5c842ba3 ("usb: dwc3: core: Host wake up support from system
> suspend") started leaving the PHYs enabled during suspend for
> wakeup-capable controllers even though it turns out this had nothing to
> do with wakeup.
> 
> Rather, the wakeup capability flag was (ab-)used as a proxy to configure
> the suspend behaviour in an attempt to reduce power leakage on some
> platforms.
> 
> Stop abusing the wakeup configuration and restore the 5.19 behaviour of
> keeping the PHYs powered off during suspend. If needed, a dedicated
> mechanism for configuring the PHY power state during suspend can be
> added later.
> 
> Fixes: 649f5c842ba3 ("usb: dwc3: core: Host wake up support from system suspend")
> Link: https://lore.kernel.org/r/Yuv7AM/5jtO/pgcm@google.com
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
> ---
>  drivers/usb/dwc3/core.c      | 4 ++--
>  drivers/usb/dwc3/dwc3-qcom.c | 1 -
>  2 files changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 8c8e32651473..0cdb6be720e1 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1983,7 +1983,7 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
>  		dwc3_core_exit(dwc);
>  		break;
>  	case DWC3_GCTL_PRTCAP_HOST:
> -		if (!PMSG_IS_AUTO(msg) && !device_may_wakeup(dwc->dev)) {
> +		if (!PMSG_IS_AUTO(msg)) {

My assumption was that the PHYs need to be powered for wakeup to work, but
apparently that isn't the case, wakeup still works on sc7x80 with this part
of this patch.

>  			dwc3_core_exit(dwc);
>  			break;
>  		}
> @@ -2044,7 +2044,7 @@ static int dwc3_resume_common(struct dwc3 *dwc, pm_message_t msg)
>  		spin_unlock_irqrestore(&dwc->lock, flags);
>  		break;
>  	case DWC3_GCTL_PRTCAP_HOST:
> -		if (!PMSG_IS_AUTO(msg) && !device_may_wakeup(dwc->dev)) {
> +		if (!PMSG_IS_AUTO(msg)) {
>  			ret = dwc3_core_init_for_resume(dwc);
>  			if (ret)
>  				return ret;
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 9a94b1ab8f7a..9995395baa12 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -904,7 +904,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
>  
>  	wakeup_source = of_property_read_bool(dev->of_node, "wakeup-source");
>  	device_init_wakeup(&pdev->dev, wakeup_source);
> -	device_init_wakeup(&qcom->dwc3->dev, wakeup_source);

Surprisingly this part breaks wakeup on sc7x80, with the above removal
of the device_may_wakeup() checks it is not clear to me why wakeup needs
to be enabled for the core.
