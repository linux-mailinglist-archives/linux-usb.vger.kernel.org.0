Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D824A453D25
	for <lists+linux-usb@lfdr.de>; Wed, 17 Nov 2021 01:28:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231731AbhKQAbS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 16 Nov 2021 19:31:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229532AbhKQAbR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 16 Nov 2021 19:31:17 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 128EAC061570
        for <linux-usb@vger.kernel.org>; Tue, 16 Nov 2021 16:28:20 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id j5-20020a17090a318500b001a6c749e697so3208744pjb.1
        for <linux-usb@vger.kernel.org>; Tue, 16 Nov 2021 16:28:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0zSan3zyfssZm8glKrNvZwNNqhLypmG9XdxQ4QcrlZk=;
        b=hESnXBu7LwpYcgkki+GhD88Q/C2HlRb9cEcZxEoCgKLn+8n8bfrX14aDm8tK2Iblkz
         6lPC96vuwPpTvuqbWQyw0KD1y3oSrXre3XmYSQMdSgU+fKyWmo13u7khesLykgqTT+61
         mSVuxYxaJk9bdgl6YS6eIJraWGfw5oaJ14J0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0zSan3zyfssZm8glKrNvZwNNqhLypmG9XdxQ4QcrlZk=;
        b=2xBPi+UDle+GmGa5Ie6z03mF4meJKDKHV5ifT7PKkkIycgTGxFuQJr0E/b8bCHGJeP
         z0Jge8114OZMQUxvRGnO/jx0V+Uo5XoW5K8QuEkm2IurzO1btj3AKPc/6fSrIfW4SWrf
         oK10Yli89ndZAItR14oiwUq1dcNz26IWl8As7UNZTpeHzWNWHHa1O56yDyj/4buAkrJN
         oHzeItC+ohrtRJUBly8BjiD21TbvWPT4AupVgLP5WpuWIGirOjq3CDZQVbNKL59DGX+8
         KwBkJvvAZyDV9mWgqU5MzNMKm3WQfvXJwc3Wx/dgjbC80w1QOsI+8rj4nKtp2UpK6PvE
         eg8w==
X-Gm-Message-State: AOAM530c2eJSKfHkeTkczze2kHe+rJmmsKrB7xeyV8BBCXk8OMWrJ8PN
        Yu1RbvRb4zO4Yh5hECza+UqQvg==
X-Google-Smtp-Source: ABdhPJwR2N+u+K9j7iPM2+1GWglyKrYfKEzX4BOqSiHVzkkl1iHtYSF19I0llUUVQg39c61v6cwhug==
X-Received: by 2002:a17:90a:c58e:: with SMTP id l14mr4149412pjt.214.1637108899526;
        Tue, 16 Nov 2021 16:28:19 -0800 (PST)
Received: from google.com ([2620:15c:202:201:bcd2:b839:9ed:baea])
        by smtp.gmail.com with ESMTPSA id i11sm3269814pfu.50.2021.11.16.16.28.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Nov 2021 16:28:18 -0800 (PST)
Date:   Tue, 16 Nov 2021 16:28:16 -0800
From:   Brian Norris <briannorris@chromium.org>
To:     Sandeep Maheswaram <quic_c_sanm@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_pkondeti@quicinc.com,
        quic_ppratap@quicinc.com
Subject: Re: [PATCH v9 2/5] usb: dwc3: core: Host wake up support from system
 suspend
Message-ID: <YZRMoNEZTy8XimIx@google.com>
References: <1635753224-23975-1-git-send-email-quic_c_sanm@quicinc.com>
 <1635753224-23975-3-git-send-email-quic_c_sanm@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1635753224-23975-3-git-send-email-quic_c_sanm@quicinc.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Nov 01, 2021 at 01:23:41PM +0530, Sandeep Maheswaram wrote:
> Avoiding phy powerdown when wakeup capable devices are connected
> by checking wakeup property of xhci plat device.
> Phy should be on to wake up the device from suspend using wakeup capable
> devices such as keyboard and mouse.
> 
> Signed-off-by: Sandeep Maheswaram <quic_c_sanm@quicinc.com>

Because you've now factored in a device_may_wakeup() (which evaluates
'false' for me), this no longer breaks my Rockchip RK3399 systems
(previous versions did). So from that angle:

Tested-by: Brian Norris <briannorris@chromium.org>

> ---
>  drivers/usb/dwc3/core.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> index 643239d..a6ad0ed 100644
> --- a/drivers/usb/dwc3/core.c
> +++ b/drivers/usb/dwc3/core.c
> @@ -1787,7 +1787,7 @@ static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
>  		dwc3_core_exit(dwc);
>  		break;
>  	case DWC3_GCTL_PRTCAP_HOST:
> -		if (!PMSG_IS_AUTO(msg)) {
> +		if (!PMSG_IS_AUTO(msg) && !device_may_wakeup(&dwc->xhci->dev)) {

I still find it odd to use device_may_wakeup(), since that's something
controlled by user space (sysfs) and doesn't fully factor in hardware
support. But that's what xhci-plat.c is doing, so I guess I see why
you're imitating it...
...still, feels wrong to me. But so does a lot of how dwc3 works.

Brian

>  			dwc3_core_exit(dwc);
>  			break;
>  		}
> @@ -1848,13 +1848,16 @@ static int dwc3_resume_common(struct dwc3 *dwc, pm_message_t msg)
>  		spin_unlock_irqrestore(&dwc->lock, flags);
>  		break;
>  	case DWC3_GCTL_PRTCAP_HOST:
> -		if (!PMSG_IS_AUTO(msg)) {
> +		if (!PMSG_IS_AUTO(msg) && !device_may_wakeup(&dwc->xhci->dev)) {
>  			ret = dwc3_core_init_for_resume(dwc);
>  			if (ret)
>  				return ret;
>  			dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_HOST);
>  			break;
> +		} else {
> +			dwc3_set_prtcap(dwc, DWC3_GCTL_PRTCAP_HOST);
>  		}
> +
>  		/* Restore GUSB2PHYCFG bits that were modified in suspend */
>  		reg = dwc3_readl(dwc->regs, DWC3_GUSB2PHYCFG(0));
>  		if (dwc->dis_u2_susphy_quirk)
> -- 
> 2.7.4
> 
