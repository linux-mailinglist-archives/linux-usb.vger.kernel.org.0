Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E9FEB11D9F9
	for <lists+linux-usb@lfdr.de>; Fri, 13 Dec 2019 00:25:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731017AbfLLXXx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 12 Dec 2019 18:23:53 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:34089 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730896AbfLLXXw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 12 Dec 2019 18:23:52 -0500
Received: by mail-pg1-f194.google.com with SMTP id r11so489084pgf.1
        for <linux-usb@vger.kernel.org>; Thu, 12 Dec 2019 15:23:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=R1FesrMsNLhrmJsi/HIXYAEi1VeJJ7kHlJczvqulZYg=;
        b=hUZYD0Xwf0RYw3e73Cga+16ykn54AOG9sWN+DWGevEMxHxPa2bBl6Xdr0x4tYA5bgJ
         OcC8IgpVDelltxGAHytKr02PtODdaXeBVHJqnpg6PHC5hD3VeKQ51r85eEHqgWtwn3AY
         sicScLXK+vHXGHprq8ERYZFU/bzvOaBiPYKX6/VbDOEMnrdmeLtpBJh/Lk0MR9G9qrTG
         rsjih5wtjcwj6dN3CSWXLi9zi0NEvk1GwjX7in6lOiAoUnJZu0EQy0mutC9JawuF5mOj
         VOlViIk5W/VDERh6tOBqpangXFKU13sefvq68cAdVEKHoSxLLfBv1PMiEAxgDWDVGRqO
         JTuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=R1FesrMsNLhrmJsi/HIXYAEi1VeJJ7kHlJczvqulZYg=;
        b=ap4y4u8lR+Wg8SRpCKgfkV+sD7WabnktYKP/hSOaDWPblXtFstrSqK2maeC36f2Oby
         9mSCn0l9lKYr2mEpnJ+buK5ny4KQ8Lw0Mzu1MaGMYuX/mPX6Vl3lI57wFq0wJYiKj2Y4
         AMi5hpGTlZbxcRmbtsKPPubjwBY2TIOpaXepo+rq6eeNPdh3v+Cb0MAm7RnwabFZW4eg
         zlCsKp++d51j8pvtqkOfxp3G83/Iw0opPMQrd0LUM6wh3ngMHknQFycq2mJfyVV5ZyN7
         i13DBxoH/9INfgFBCK+q+RmZGSM+OXOVYlBatTtfeoei4gLhOiyi87DCzNRHcdKWLo3D
         0a+A==
X-Gm-Message-State: APjAAAUAINYPgrhzNeqUFRT5z7P1HqXS02Nzwxy2yJM5Y+pumkUybeHN
        BUK+Qu+WxwqARIBFMnrd+s0psA==
X-Google-Smtp-Source: APXvYqy9/uRn0x+YeAKOgcxDnFG2QjQvadTqueYdtexhXSUlY/gHDWcdl5/u4PQl/qA5JD49AvuZMA==
X-Received: by 2002:aa7:9988:: with SMTP id k8mr12254965pfh.200.1576193031952;
        Thu, 12 Dec 2019 15:23:51 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id a26sm8739052pfo.5.2019.12.12.15.23.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2019 15:23:51 -0800 (PST)
Date:   Thu, 12 Dec 2019 15:23:49 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Douglas Anderson <dianders@chromium.org>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Manu Gautam <mgautam@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Sandeep Maheswaram <sanm@codeaurora.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH] usb: dwc3: qcom: Remove useless compatible strings from
 the match table
Message-ID: <20191212232349.GR3143381@builder>
References: <20191212132122.1.I85a23bdcff04dbce48cc46ddb8f1ffe7a51015eb@changeid>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191212132122.1.I85a23bdcff04dbce48cc46ddb8f1ffe7a51015eb@changeid>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu 12 Dec 13:21 PST 2019, Douglas Anderson wrote:

> The of match table in dwc3-qcom.c had an entry per Qualcomm SoC known
> to have dwc3.  That's not needed.  Here's why:
> 
> 1. The bindings specify that the compatible string in the device tree
>    should contain the SoC-specific compatible string followed by the
>    string "qcom,dwc3".
> 
> 2. All known Qualcomm SoC dts files (confirmed via git grep in
>    mainline Linux) using dwc3 follow the rules and do, in fact,
>    contain the SoC-specific compatible string followed by the string
>    "qcom,dwc3".
> 
> 3. The source code does nothing special with the per-SoC strings--they
>    are only used to match the node.
> 
> Let's remove the extra strings from the table.  Doing so will avoid
> the need to land future useless patches [1] that do nothing more than
> add yet more strings to the table.
> 
> NOTE: if later we _do_ find some SoC-specific quirk we need to handle
> in the code we can add back a subset of these strings.  At the time we
> will probably also add some data in the match table to make it easier
> to generalize this hypothetical quirk across all the SoCs it affects.
> 
> [1] https://lore.kernel.org/r/1574940787-1004-2-git-send-email-sanm@codeaurora.org
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> 
>  drivers/usb/dwc3/dwc3-qcom.c | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> index 261af9e38ddd..72e867e02a1c 100644
> --- a/drivers/usb/dwc3/dwc3-qcom.c
> +++ b/drivers/usb/dwc3/dwc3-qcom.c
> @@ -751,9 +751,6 @@ static const struct dev_pm_ops dwc3_qcom_dev_pm_ops = {
>  
>  static const struct of_device_id dwc3_qcom_of_match[] = {
>  	{ .compatible = "qcom,dwc3" },
> -	{ .compatible = "qcom,msm8996-dwc3" },
> -	{ .compatible = "qcom,msm8998-dwc3" },
> -	{ .compatible = "qcom,sdm845-dwc3" },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, dwc3_qcom_of_match);
> -- 
> 2.24.1.735.g03f4e72817-goog
> 
