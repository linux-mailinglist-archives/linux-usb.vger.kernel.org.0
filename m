Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EA2E1441E33
	for <lists+linux-usb@lfdr.de>; Mon,  1 Nov 2021 17:30:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232683AbhKAQcv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Nov 2021 12:32:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55744 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232300AbhKAQcr (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Nov 2021 12:32:47 -0400
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com [IPv6:2607:f8b0:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04A34C061766
        for <linux-usb@vger.kernel.org>; Mon,  1 Nov 2021 09:30:13 -0700 (PDT)
Received: by mail-oi1-x235.google.com with SMTP id n11so17571380oig.6
        for <linux-usb@vger.kernel.org>; Mon, 01 Nov 2021 09:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NO4BrqlCwZmZbzIFPocj3aL6JgeBLaLvgKTDJLmrKow=;
        b=c5BOqick+DqV5dKJ9M60baALaXbKCh/aIQqSXuYz70tg1OfDwDGMvzzzIeeyYzBVOs
         wQEkiwnfWC6z6lgoqkJUBPEAJgLYQjmvp9M91lM1cIw6Ti5yQtAl0/Nxl8u5SiLbgRBI
         PmYRutyZ5MH15Fd+XeBiaPrpJvGxxaywEcUw2SBQWxbuQ2sBzAVrGuMFq95VPhBXyZYx
         /NzEfUGID/5H36AXv0P8aZKWaRB8tcocXFGyNX/WMJI4Eopn6aZXokq8OyFY8uXnKeSQ
         j2PW/OtJz7PLYjc7zwz81gUkgVRku7CG231kOzj/w61d8ntuyIquczXPTUZoLY8AUK1g
         Ak8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NO4BrqlCwZmZbzIFPocj3aL6JgeBLaLvgKTDJLmrKow=;
        b=BmvGAW2t65lzxCAAdNPP4IkrKwCIS2bMzsCac+TlczUIrE22HEAll8u3WR0ncoy9tJ
         FZht7BEnwyWCO5dCm+08G4EZUtnFb2924kCpRJzH4SutL9Gu7uhvDwVmYbfNak2Bhw85
         xynguDXG3ex3BthQQMM/OPva+6660J4z/KhVeWoA7rtCy6LYtEWz+oFg+s1EJrLShF28
         u4pKrWpe20XlVIKGcPQ0gz1/PEOzW9AhUCo3BVjTKAeG4O83X2o911V7EqLW1nMexjnl
         /J1UlnIuY6/DK5Yhb8Gqj21DojJYyYkuviYP/USBjlTgcphZs3ImfzSfpFalVBXHKRsU
         qgHg==
X-Gm-Message-State: AOAM531ZIGzUBNPmac0adojsYi+P2FQkpyJYayScO3XHHiSCDqt1cLRO
        62MxV2K8YULsIzsVZ0ClODsYFw==
X-Google-Smtp-Source: ABdhPJynItDH2VN268LubauWKT/90v0CWMv3DwvdnmhPWQ0JcZ2Zo7EN9L5f2cZv1NV4uFJ9cWCm3Q==
X-Received: by 2002:a05:6808:1528:: with SMTP id u40mr11320798oiw.155.1635784212148;
        Mon, 01 Nov 2021 09:30:12 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id a8sm202738otr.3.2021.11.01.09.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 09:30:11 -0700 (PDT)
Date:   Mon, 1 Nov 2021 09:31:57 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sandeep Maheswaram <quic_c_sanm@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_pkondeti@quicinc.com,
        quic_ppratap@quicinc.com
Subject: Re: [PATCH v9 4/5] usb: dwc3: qcom: Change the IRQ flag for DP/DM hs
 phy irq
Message-ID: <YYAWfSSD7FCXPo8d@ripper>
References: <1635753224-23975-1-git-send-email-quic_c_sanm@quicinc.com>
 <1635753224-23975-5-git-send-email-quic_c_sanm@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1635753224-23975-5-git-send-email-quic_c_sanm@quicinc.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon 01 Nov 00:53 PDT 2021, Sandeep Maheswaram wrote:

> Change the IRQ flags for DP/DM hs phy irq to avoid interrupt
> triggering during system suspend.
> 

Why does replacing HIGH with RISING change this behavior, or do you get
a RISING interrupt just before hitting suspend which you ignore?

I think it would be nice to have the commit message for this (or per
below request the DTS change) include some details about what's really
happening on the irq line.

> Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 54461f1..356f4f8 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -473,7 +473,7 @@ static int dwc3_qcom_setup_irq(struct platform_device *pdev)
>  		irq_set_status_flags(irq, IRQ_NOAUTOEN);
>  		ret = devm_request_threaded_irq(qcom->dev, irq, NULL,
>  					qcom_dwc3_resume_irq,
> -					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> +					IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_ONESHOT,

IRQF_TRIGGER_* should be omitted from the driver and supplied by the DT.

The dtbs out there should all have IRQ_TYPE_LEVEL_HIGH at this time, so
simply dropping that from this list and updating the dts would be the
right thing to do.

Regards,
Bjorn

>  					"qcom_dwc3 DP_HS", qcom);
>  		if (ret) {
>  			dev_err(qcom->dev, "dp_hs_phy_irq failed: %d\n", ret);
> @@ -488,7 +488,7 @@ static int dwc3_qcom_setup_irq(struct platform_device *pdev)
>  		irq_set_status_flags(irq, IRQ_NOAUTOEN);
>  		ret = devm_request_threaded_irq(qcom->dev, irq, NULL,
>  					qcom_dwc3_resume_irq,
> -					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> +					IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING | IRQF_ONESHOT,
>  					"qcom_dwc3 DM_HS", qcom);
>  		if (ret) {
>  			dev_err(qcom->dev, "dm_hs_phy_irq failed: %d\n", ret);
> -- 
> 2.7.4
> 
