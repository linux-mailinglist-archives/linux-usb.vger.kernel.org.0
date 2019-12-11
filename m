Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BBE011BD36
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2019 20:43:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726911AbfLKTnn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Dec 2019 14:43:43 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:42058 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726592AbfLKTnm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Dec 2019 14:43:42 -0500
Received: by mail-io1-f68.google.com with SMTP id f82so43357ioa.9
        for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2019 11:43:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WEsvDQ4frWg0g6hsrfrPUpwL5OB0pB+03rAe/lqxJKs=;
        b=flsBnhRwZYV3x2jeRLaTFJggFGEUKvXMx7aFjFYS3tsR8jzvWNQoAoI6geow1bE3hH
         Sm1LHlGve7GLu+f76odVmRz0tXt8hYDqPTJrJRYFvL0aMIGYCHbglAf0y9IBgG5JZcf1
         BeLTAaE39MIUTOH4uRNWoLbPm1wDCHD8VhJPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WEsvDQ4frWg0g6hsrfrPUpwL5OB0pB+03rAe/lqxJKs=;
        b=G3X8XC4FR/QFHqqQDB0l3GvFALjITCYqr0qr3TUe9vtiwBFWdzKUpX1wljyLmb5dGx
         KEtjvD5nqtpoEmdNfG1WPLr2uEkeo1K01bqlzWSg+5ZILMj67EtyKttW+L/2tFX0Fo1m
         ayHF9MxCWbpnC7e+NEQbLx6ye1WSLw3c698q6OOdOyxeWn7oeO1AzFvWSIEG/GW6vf+B
         A81UzFkiJOj7OJ2avIUDbWQTRSfdKgkdKOu4Vm/1IVktVWdNU3TsIQ+xgVb0ot4um++g
         uz/4KG0WJmgygpju1FMRuDs1RfyFNOHJgS/J4wfN51Btnd4hVIC1yntQVqfM0L0gCaKy
         HfKg==
X-Gm-Message-State: APjAAAVuOx+IPYfyZT60dQVGBINSA4lHg4R2vxevZKQ+dsjsyrxk4OOa
        XPnUZ3ZZOtGBf6p1wxCdsG1h1DFPou8=
X-Google-Smtp-Source: APXvYqzLNpa+UYjRTKWFABLeqFVAo6kNWPQ85N/ai68igKIRB0iCC+fiy4HoTUWUA0Ydask9+MVHtA==
X-Received: by 2002:a5d:8442:: with SMTP id w2mr3978520ior.8.1576093421491;
        Wed, 11 Dec 2019 11:43:41 -0800 (PST)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com. [209.85.166.179])
        by smtp.gmail.com with ESMTPSA id 71sm990956ilv.19.2019.12.11.11.43.40
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Dec 2019 11:43:40 -0800 (PST)
Received: by mail-il1-f179.google.com with SMTP id f6so20497819ilh.9
        for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2019 11:43:40 -0800 (PST)
X-Received: by 2002:a92:d581:: with SMTP id a1mr4374504iln.218.1576093420076;
 Wed, 11 Dec 2019 11:43:40 -0800 (PST)
MIME-Version: 1.0
References: <1574940787-1004-1-git-send-email-sanm@codeaurora.org> <1574940787-1004-2-git-send-email-sanm@codeaurora.org>
In-Reply-To: <1574940787-1004-2-git-send-email-sanm@codeaurora.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Wed, 11 Dec 2019 11:43:28 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Uy6ryrbpzFg1sesJkWrgh05tLgvtozx0afJPF_u4-ESA@mail.gmail.com>
Message-ID: <CAD=FV=Uy6ryrbpzFg1sesJkWrgh05tLgvtozx0afJPF_u4-ESA@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] usb: dwc3: Add support for SC7180 SOC
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-usb@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Thu, Nov 28, 2019 at 3:35 AM Sandeep Maheswaram <sanm@codeaurora.org> wrote:
>
> Add compatible for SC7180 SOC in USB DWC3 driver
>
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  drivers/usb/dwc3/dwc3-qcom.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 261af9e..1df2372 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: GPL-2.0
> -/* Copyright (c) 2018, The Linux Foundation. All rights reserved.
> +/* Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
>   *
>   * Inspired by dwc3-of-simple.c
>   */
> @@ -753,6 +753,7 @@ static const struct of_device_id dwc3_qcom_of_match[] = {
>         { .compatible = "qcom,dwc3" },
>         { .compatible = "qcom,msm8996-dwc3" },
>         { .compatible = "qcom,msm8998-dwc3" },
> +       { .compatible = "qcom,sc7180-dwc3" },
>         { .compatible = "qcom,sdm845-dwc3" },

It is, of course, up to Felipe.  ...but in my opinion this is the
wrong change and instead we should be deleting the SoC-specific
strings (msm8996, msm8998, sdm845) from this file because they don't
buy us anything.  To explain how it works:

1. Device tree should have both the "SoC-specific" and generic
"qcom,dwc3" strings.  Only the "qcom,dwc3" will actually be used but
the SoC-specific string is there so if we find a case later where we
need to handle a SoC-specific quirk then it'll already be there.

2. Bindings should have both the "SoC-specific" and generic
"qcom,dwc3" strings.  The binding is describing what's in the device
tree.

3. Until we have a SoC-specific quirk to handle, we _don't_ need to
add the SoC-specific string to the driver itself.


-Doug
