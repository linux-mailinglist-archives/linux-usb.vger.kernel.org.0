Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9E31B37F9B6
	for <lists+linux-usb@lfdr.de>; Thu, 13 May 2021 16:34:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234455AbhEMOgD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 13 May 2021 10:36:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234496AbhEMOfw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 13 May 2021 10:35:52 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15FE4C06174A
        for <linux-usb@vger.kernel.org>; Thu, 13 May 2021 07:34:36 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id k19so21956700pfu.5
        for <linux-usb@vger.kernel.org>; Thu, 13 May 2021 07:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=C9qcsyL6yalplt7TEViKsaafpdRV3NQo90FG/ZmLHHw=;
        b=a81n26wG1rUABw5Cr3vqYpat2S0pL6HfO1dqhiePTuRUl++kq6mRf6Dq/fFWY+ALqM
         WreVF9AA1Joxy/wvlwiETwQKsDdL1UKEC8knVt+dR4kLKRv9Yn+d6OQtg4tFBFxObZR1
         eeRCTvF42iKnxw4xZtUjhpDej+TqBElbmgnCo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=C9qcsyL6yalplt7TEViKsaafpdRV3NQo90FG/ZmLHHw=;
        b=NPDus7bj0Fw/aubcYczhj3GgWpyv2JQqD42OZJ518M9lf6lJovVdliIE4YImdR6wkT
         1rwrtpZjpGyZNEvbBhEjfc5j00Pzs7zM53psUM2KwAn7SbZ6Za/FX+wUx91f0g0zVRli
         EEqC9nDRxNE6SxH1oc7CHKxk0hKJAdcw/BqZHh0LPk+yhlr61CnT/lDotFlIR9d6psDd
         mEBEV8MTEnlX8O1HQkMpDmEqM1Bu3w+R5rrrjJi12jmtCKVnPmcX4JvfehsvM5EiSf4I
         L9k+F75JHy8dAe+8qcmp7WUKBWKuZKf7xObUXTJeWl89y9I6JjaPfhjaTpWrLn9P9fCw
         c01w==
X-Gm-Message-State: AOAM531hJtMzMOb4/sHyhnSl7pyEO6/nItAoUzQUkYGmXmWCkmXpnUMi
        Le83uNsU3TRd1TenF6HNgc8Qwg==
X-Google-Smtp-Source: ABdhPJwXk/+OzcFksJCqCvgdzV26fUsWpYljSIhXwI1wcSy28N2Yb2BBVPQ1rAmqQCnjoluRZs4GTA==
X-Received: by 2002:a62:1b97:0:b029:24e:44e9:a8c1 with SMTP id b145-20020a621b970000b029024e44e9a8c1mr41913118pfb.19.1620916475530;
        Thu, 13 May 2021 07:34:35 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:4c2:8d34:961f:de80])
        by smtp.gmail.com with UTF8SMTPSA id d23sm2277201pfo.80.2021.05.13.07.34.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 May 2021 07:34:35 -0700 (PDT)
Date:   Thu, 13 May 2021 07:34:33 -0700
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
Message-ID: <YJ04+aQijdSxJjm3@google.com>
References: <1619586716-8687-1-git-send-email-sanm@codeaurora.org>
 <1619586716-8687-6-git-send-email-sanm@codeaurora.org>
 <87lf92k9ms.fsf@kernel.org>
 <YJxxbe9L3+VBEqno@google.com>
 <87tun67nhc.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87tun67nhc.fsf@kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 13, 2021 at 04:49:19PM +0300, Felipe Balbi wrote:
> 
> Hi,
> 
> Matthias Kaehlcke <mka@chromium.org> writes:
> >> Sandeep Maheswaram <sanm@codeaurora.org> writes:
> >> > If wakeup capable devices are connected to the controller (directly
> >> > or through hubs) at suspend time keep the power domain on in order
> >> > to support wakeup from these devices.
> >> >
> >> > Signed-off-by: Sandeep Maheswaram <sanm@codeaurora.org>
> >> > ---
> >> >  drivers/usb/dwc3/dwc3-qcom.c | 17 +++++++++++++++++
> >> >  1 file changed, 17 insertions(+)
> >> >
> >> > diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> >> > index 82125bc..1e220af 100644
> >> > --- a/drivers/usb/dwc3/dwc3-qcom.c
> >> > +++ b/drivers/usb/dwc3/dwc3-qcom.c
> >> > @@ -17,9 +17,11 @@
> >> >  #include <linux/of_platform.h>
> >> >  #include <linux/platform_device.h>
> >> >  #include <linux/phy/phy.h>
> >> > +#include <linux/pm_domain.h>
> >> >  #include <linux/usb/of.h>
> >> >  #include <linux/reset.h>
> >> >  #include <linux/iopoll.h>
> >> > +#include <linux/usb/hcd.h>
> >> >  
> >> >  #include "core.h"
> >> >  
> >> > @@ -354,10 +356,19 @@ static int dwc3_qcom_suspend(struct dwc3_qcom *qcom)
> >> >  {
> >> >  	u32 val;
> >> >  	int i, ret;
> >> > +	struct dwc3 *dwc = platform_get_drvdata(qcom->dwc3);
> >> > +	struct usb_hcd  *hcd;
> >> > +	struct generic_pm_domain *genpd = pd_to_genpd(qcom->dev->pm_domain);
> >> >  
> >> >  	if (qcom->is_suspended)
> >> >  		return 0;
> >> >  
> >> > +	if (dwc->xhci) {
> >> > +		hcd = platform_get_drvdata(dwc->xhci);
> >> > +		if (usb_wakeup_enabled_descendants(hcd->self.root_hub))
> >> > +			genpd->flags |= GENPD_FLAG_ACTIVE_WAKEUP;
> >> > +	}
> >> 
> >> wow, you really need to find a way to do these things generically
> >> instead of bypassing a bunch of layers and access stuff $this doesn't
> >> directly own.
> >>
> >> I'm gonna say 'no' to this, sorry. It looks like xhci should, directly,
> >> learn about much of this instead of hiding it 3-layers deep into the
> >> dwc3 glue layer for your specific SoC.
> >
> > Maybe this could be addressed with a pair of wakeup quirks, one for suspend,
> > another for resume. An optional genpd field could be added to struct
> > xhci_plat_priv. The wakeup quirks would set/clear GENPD_FLAG_ACTIVE_WAKEUP
> > of the genpd.
> >
> > Does the above sound more palatable?
> 
> I don't get why you need quirk flags. All you're doing here is:
> 
> 	if (usb_wakeup_enabled_descendants(hcd->self.root_hub))
>         	genpd->flags |= GENPD_FLAG_ACTIVE_WAKEUP;
> 
> If you move this test to xhci_suspend(), you shouldn't need all the
> magic, right?

Right, the quirks shouldn't be necessary if setting/clearing the genpd
flag is the right thing to do for any controller that sets the genpd
field in _priv, which probably is the case.

