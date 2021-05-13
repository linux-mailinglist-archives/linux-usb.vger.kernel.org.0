Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5609E37F06D
	for <lists+linux-usb@lfdr.de>; Thu, 13 May 2021 02:37:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233578AbhEMAiJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 12 May 2021 20:38:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343695AbhEMAgF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 12 May 2021 20:36:05 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A47DFC0613ED
        for <linux-usb@vger.kernel.org>; Wed, 12 May 2021 17:23:11 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id i13so20186609pfu.2
        for <linux-usb@vger.kernel.org>; Wed, 12 May 2021 17:23:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Luwh+TGoydzGL3JCJlpVZNGhUrtfqRBntVXhvPw5QHw=;
        b=PfS3fnU78oKI5JB9cVtWpPNRgSQDF6jbdL6+Nmu5aJK1dg5mpNWrpAb1xnWeXRSTg2
         t9CsTHKfuGnO8xJLDpEL/zaXCpNBi6kmhbCAnt8cCNNWH0bKpJd8/fYNSrfvNy1+FPrq
         MAk26aE4uuUHS6aQPMzd2+LcrbuY95tiBExmM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Luwh+TGoydzGL3JCJlpVZNGhUrtfqRBntVXhvPw5QHw=;
        b=DV3CQyLH3womntnXJd40B1VSulrwUYpNzmDVldB//3kDDAGbDQ8tsrTW+aWF/Oy3zn
         dXuBw39MpfHm4PxM6+c1qUCsNhbi1M10++QPCNPQtgxLrNQZoay/Ktfqp7Kyq6DjV3sK
         3c/xJV4tFlb7lJdWmgVxRXlRQZc58wJk8kXtWzNpoGa4ACNYJ9mavBllNlje6rIdcfHL
         mzJPH6fiLiIgmJPcTnkn2o0hNgdlCXsXtWOjp5vuQtXydRhYgQDe0uCNAKEC0zhw1XQ6
         tlPGdp9IXcZalEXWB+A7zQ0UMiUKMC7KmOYdyO2ZKhnBgJ2Ih+LuKAwaLerL/Tr6JLTu
         7OZg==
X-Gm-Message-State: AOAM530mPrSRvesEre5x7rR54DWz+c4D4c/UcmmuB5fjjwuqU+iOOF++
        ScoPTC/3Rv/HvCrYjQ3KHJGkCQ==
X-Google-Smtp-Source: ABdhPJzvWhTvBADac93Bf79sSF/vT3WimwfcACeawZ8q5mYpd+q6meomOGgP9eN2ENBNBpktpzI5nw==
X-Received: by 2002:a63:214b:: with SMTP id s11mr2566471pgm.423.1620865391277;
        Wed, 12 May 2021 17:23:11 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:a89e:5bb2:e8e0:4428])
        by smtp.gmail.com with UTF8SMTPSA id t133sm804825pgb.0.2021.05.12.17.23.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 May 2021 17:23:10 -0700 (PDT)
Date:   Wed, 12 May 2021 17:23:09 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Sandeep Maheswaram <sanm@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Manu Gautam <mgautam@codeaurora.org>
Subject: Re: [PATCH v7 5/5] usb: dwc3: qcom: Keep power domain on to support
 wakeup
Message-ID: <YJxxbe9L3+VBEqno@google.com>
References: <1619586716-8687-1-git-send-email-sanm@codeaurora.org>
 <1619586716-8687-6-git-send-email-sanm@codeaurora.org>
 <87lf92k9ms.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87lf92k9ms.fsf@kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Apr 28, 2021 at 01:04:43PM +0300, Felipe Balbi wrote:
> 
> Hi,
> 
> Sandeep Maheswaram <sanm@codeaurora.org> writes:
> > If wakeup capable devices are connected to the controller (directly
> > or through hubs) at suspend time keep the power domain on in order
> > to support wakeup from these devices.
> >
> > Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> > ---
> >  drivers/usb/dwc3/dwc3-qcom.c | 17 +++++++++++++++++
> >  1 file changed, 17 insertions(+)
> >
> > diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> > index 82125bc..1e220af 100644
> > --- a/drivers/usb/dwc3/dwc3-qcom.c
> > +++ b/drivers/usb/dwc3/dwc3-qcom.c
> > @@ -17,9 +17,11 @@
> >  #include <linux/of_platform.h>
> >  #include <linux/platform_device.h>
> >  #include <linux/phy/phy.h>
> > +#include <linux/pm_domain.h>
> >  #include <linux/usb/of.h>
> >  #include <linux/reset.h>
> >  #include <linux/iopoll.h>
> > +#include <linux/usb/hcd.h>
> >  
> >  #include "core.h"
> >  
> > @@ -354,10 +356,19 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom)
> >  {
> >  	u32 val;
> >  	int i, ret;
> > +	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
> > +	struct usb_hcd  *hcd;
> > +	struct generic_pm_domain *genpd = pd_to_genpd(qcom->dev->pm_domain);
> >  
> >  	if (qcom->is_suspended)
> >  		return 0;
> >  
> > +	if (dwc->xhci) {
> > +		hcd = platform_get_drvdata(dwc->xhci);
> > +		if (usb_wakeup_enabled_descendants(hcd->self.root_hub))
> > +			genpd->flags |= GENPD_FLAG_ACTIVE_WAKEUP;
> > +	}
> 
> wow, you really need to find a way to do these things generically
> instead of bypassing a bunch of layers and access stuff $this doesn't
> directly own.
>
> I'm gonna say 'no' to this, sorry. It looks like xhci should, directly,
> learn about much of this instead of hiding it 3-layers deep into the
> dwc3 glue layer for your specific SoC.

Maybe this could be addressed with a pair of wakeup quirks, one for suspend,
another for resume. An optional genpd field could be added to struct
xhci_plat_priv. The wakeup quirks would set/clear GENPD_FLAG_ACTIVE_WAKEUP
of the genpd.

Does the above sound more palatable?
