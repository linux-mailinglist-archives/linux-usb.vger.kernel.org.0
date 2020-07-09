Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA2CC21A602
	for <lists+linux-usb@lfdr.de>; Thu,  9 Jul 2020 19:41:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728089AbgGIRlw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Jul 2020 13:41:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727091AbgGIRlw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Jul 2020 13:41:52 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E66FBC08C5DD
        for <linux-usb@vger.kernel.org>; Thu,  9 Jul 2020 10:41:51 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id m9so1332617pfh.0
        for <linux-usb@vger.kernel.org>; Thu, 09 Jul 2020 10:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8cYRIN56Hfij3RW2GD+DjFbyhFBnKCKVpV/5GtjC11c=;
        b=MbbxQMO8S/5hsh+8k/hugybr95tK+sIBoC5bCnrad8LpeZHlQCG7ysKf/Mzyh8m/5C
         YmvGbOliTnA0TTE7HO2QTZNsx/uicr0aOx5YMzte6uoTvfMkg1aDMusXw0EHYdnyI3cG
         nJeSp3WSP7VswZ6BZr/r1KeQzKyicnpA7O47M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8cYRIN56Hfij3RW2GD+DjFbyhFBnKCKVpV/5GtjC11c=;
        b=Q49hLJNZg+igGv7mcsUQVJFmE8d5fVUNi3Ki6Sz3pwqkNiUS5neHfQaU+RcUC2GatI
         LfxEPz1uhtkVqRMPSlctFHf18ue+c/IGjwzn71T7Unde02l3VW6L6sWiGz6uTu++k8aI
         zyL/WHcjixTU1MKt57zlJ/rbKRVOoA/3+KpXMsJoNKxK2Pl8mOwMJALcJd2nce+whUxi
         uYjKw8VmhIY2mNsjhHAZQGrocla3+U71nIrsLy4bA9IgJrUuojhIz3OTRGUqTa6GJ1D1
         deRpnGb4mSkrpSAyzEArMeKXsR2VVh76sAnKlyXeHvWFQeEOSLO18MHc5G4nAmqHW+Mc
         CWyw==
X-Gm-Message-State: AOAM531BGoIyc071K3483Be5m1Aqf92j1ruicQNc0fSSFI96Bs8f9dLV
        tPzvMPUtsUxUeO2/Ocvn/RfpYA==
X-Google-Smtp-Source: ABdhPJwaRFIKuzRY/WaSqwBDVlSrCc6/yms2+/eGLAG32MYRnXLrjbcC/YNzWraWpr38Uy7POBn/yw==
X-Received: by 2002:aa7:842c:: with SMTP id q12mr16879058pfn.209.1594316511418;
        Thu, 09 Jul 2020 10:41:51 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id p10sm3565791pgn.6.2020.07.09.10.41.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jul 2020 10:41:50 -0700 (PDT)
Date:   Thu, 9 Jul 2020 10:41:49 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sandeep Maheswaram <sanm@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v8 2/2] arm64: dts: qcom: sc7180: Add maximum speed
 property for DWC3 USB node
Message-ID: <20200709174149.GM3191083@google.com>
References: <1594310413-14577-1-git-send-email-sanm@codeaurora.org>
 <1594310413-14577-3-git-send-email-sanm@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1594310413-14577-3-git-send-email-sanm@codeaurora.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 09, 2020 at 09:30:12PM +0530, Sandeep Maheswaram wrote:
> Adding maximum speed property for DWC3 USB node which can be used
> for setting interconnect bandwidth.
> 
> Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> ---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 2be81a2..753e1a1 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -2544,6 +2544,7 @@
>  				snps,dis_enblslpm_quirk;
>  				phys = <&usb_1_hsphy>, <&usb_1_ssphy>;
>  				phy-names = "usb2-phy", "usb3-phy";
> +				maximum-speed = "super-speed";
>  			};
>  		};

It shouldn't be strictly necessary if you use super-speed as default
max-speed in the driver, but it also does no harm.

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>

You might want to add it for other platforms too.
