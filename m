Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 85646585DCB
	for <lists+linux-usb@lfdr.de>; Sun, 31 Jul 2022 08:33:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236283AbiGaGd1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 31 Jul 2022 02:33:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236324AbiGaGdZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 31 Jul 2022 02:33:25 -0400
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com [IPv6:2607:f8b0:4864:20::82e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69B5D13DC4
        for <linux-usb@vger.kernel.org>; Sat, 30 Jul 2022 23:33:24 -0700 (PDT)
Received: by mail-qt1-x82e.google.com with SMTP id u12so6041892qtk.0
        for <linux-usb@vger.kernel.org>; Sat, 30 Jul 2022 23:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=zqtO3uZt9+T1koeAgCZ+PJaUEdw+iPxfmGhYKCo5TwM=;
        b=Ag/+5X4ew7HsQZiIo+tLvovcbQAq2aTjSu7qqq/RUa34QI9RsfGAsGG6FRljWpom4a
         KT6z+cjigdHbgoQD0spzfZ7d9LH6zjUCEqZEj0OrG+zDkbnf0TXDMF+Ox1KKaA992bx7
         2u3qUMn+wbMr4Yzg3r5a9o7QNVD5Tdpjab8fHWajKI3R1CeMeGIfj52q1RBkKswVvGYD
         vFluFuRAGbU7ZTuPAFsTz4l78LAiyvCe9zSo/UjD2coPNog9lD2AwkDzaJrKrYjuQ1CU
         NrE04LxdYqRRdYdH48KbJKk6q4/RtTDU4RiJ5ROC5yvMSoccdgQMdbo1roJnKGw8jWOD
         Apbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=zqtO3uZt9+T1koeAgCZ+PJaUEdw+iPxfmGhYKCo5TwM=;
        b=4hrBEunHeMyHnyJthcEzMzGEkSKEJd4w5aSRsZX6NlVAlHygI4f+7LpHf+t8DU0ZTs
         1i+bppKHHAeqDvBasG54ewSMxX0c0ZWBxinxVYCU/E9esMWzE36LzedLr0mFmK4EN+Wr
         LFiQIQQvQjpjhodyYDQ65qGSW7YjtLBcp6zJq5akevq1pRbxWU/L1J7F8PZewyCvoDI2
         Q4O0sxaEmclxGWSGwI9dBbq9+7ward8vpAoCGSLEum7lI2w2FSmI3i3JMGu0qiHoQiAU
         EMsQeC1BHRCnvjxh+KRatoWLlFQYiU4IxBiTh6cUpvqXPM+61FzOr6YQPfcL7jhlrjtN
         WgYA==
X-Gm-Message-State: AJIora/F9eY6spowu4kep5FxiwUizLLIy+kMjj3Nc+kjZHv+pVMeCLyt
        FOcGnAxpLJfakEL6hT47A9f+5EIRGUPI9c5rzN7M4Q==
X-Google-Smtp-Source: AGRyM1vJaZN98pwaotBoPrDzExHeTvDQ9MOGkVFjSBDgse8wpdKHRj/YPfCrExbsbO6l4OLVjwtUFyhtRvxFQ7Oyado=
X-Received: by 2002:a05:622a:451:b0:31f:4257:4eb2 with SMTP id
 o17-20020a05622a045100b0031f42574eb2mr9507979qtx.370.1659249203596; Sat, 30
 Jul 2022 23:33:23 -0700 (PDT)
MIME-Version: 1.0
References: <1659237530-436-1-git-send-email-quic_kriskura@quicinc.com>
In-Reply-To: <1659237530-436-1-git-send-email-quic_kriskura@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sun, 31 Jul 2022 09:33:12 +0300
Message-ID: <CAA8EJpq=+y7ZOrdAoA-RsLLPgLn5hi+TaTvqetrwz93E+ONjKA@mail.gmail.com>
Subject: Re: [PATCH] usb: dwc3: qcom: Provide stubs for dwc3_qcom_read_usb2_speed
 function
To:     Krishna Kurapati <quic_kriskura@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Randy Dunlap <rdunlap@infradead.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, 31 Jul 2022 at 06:19, Krishna Kurapati
<quic_kriskura@quicinc.com> wrote:
>
> This patch intends to fix a build issue that is occurring due to

Please refrain from the "This patch" phrase. See the
Documentation/process/submitting-patches.rst for the suggestions for
the commit message.

> dwc3_qcom_read_usb2_speed function which uses usb_hub_find_child API
> in its effors to get the speed of devices (HS/FS/LS) connected.
>
> usb_hub_find_child API is a part of usb core compiled into the kernel
> when CONFIG_USB=y. In some builds (make randconfig for i386)
> CONFIG_USB is not set and the usb core is not compiled into the
> kernel causing linking errors.
>
> Provide stubs for dwc3_qcom_read_usb2_speed function to use
> usb_hub_find_child API only if CONFIG_USB is set. Else return
> USB_SPEED_UNKNOWN.

The commit message describes the issue in terms of CONFIG_USB being
compiled into the kernel or not. It is not clear if the issue
manifests with CONFIG_USB=m (which is also 'not compiled into the
kernel').
If I understand correctly, the cause for linking errors is not in the
CONFIG_USB being not compiled into the kernel, but in CONFIG_USB being
not enabled at all (which is possible since USB_DWC3 depends on USB ||
USB_GADGET).
If my understanding is correct, I'd suggest changing the commit
message to describe the cause rather than just the issue you observed
on randconfig failure.

>
> Fixes: 6895ea55c385 (usb: dwc3: qcom: Configure wakeup interrupts during suspend)
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index c5e482f..bd8dc5a 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -299,6 +299,7 @@ static void dwc3_qcom_interconnect_exit(struct dwc3_qcom *qcom)
>         icc_put(qcom->icc_path_apps);
>  }
>
> +#ifdef CONFIG_USB
>  static enum usb_device_speed dwc3_qcom_read_usb2_speed(struct dwc3_qcom *qcom)
>  {
>         struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
> @@ -318,6 +319,12 @@ static enum usb_device_speed dwc3_qcom_read_usb2_speed(struct dwc3_qcom *qcom)
>
>         return udev->speed;
>  }
> +#else
> +static enum usb_device_speed dwc3_qcom_read_usb2_speed(struct dwc3_qcom *qcom)
> +{
> +       return USB_SPEED_UNKNOWN;
> +}
> +#endif
>
>  static void dwc3_qcom_enable_wakeup_irq(int irq, unsigned int polarity)
>  {
> --
> 2.7.4
>


-- 
With best wishes
Dmitry
