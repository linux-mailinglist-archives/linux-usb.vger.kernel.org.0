Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 365113F75B2
	for <lists+linux-usb@lfdr.de>; Wed, 25 Aug 2021 15:14:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240626AbhHYNPj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Aug 2021 09:15:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232589AbhHYNPi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Aug 2021 09:15:38 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D013C061757
        for <linux-usb@vger.kernel.org>; Wed, 25 Aug 2021 06:14:53 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id l7-20020a0568302b0700b0051c0181deebso23082801otv.12
        for <linux-usb@vger.kernel.org>; Wed, 25 Aug 2021 06:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XEXdy3GV4G1Rh4nIwOhWQFTlcYHrFKR0AgAwM+GWIhY=;
        b=C6KVnlNzvoXZts4eK3AtJ7eJeh+g2HUsDqP5RqYWV5Cq5yh993fQP4yODhzdrljm+S
         KQJTtU5yn5GcDok9ii5P2spyxujD/nlqJuYq+7onwR3tJAgc69a87oUe812TmSySJ784
         uRtjvcSD8B1eSRSaAgXGageYKCpzx0Tp81OWpO0r4XiutO236+duoMtoVxsUUq8tFKFN
         GAqwl8WPjyHakCLzD726WF7Ei/7NANNOPuvDA8Q5W3Xh2TMQWWaj1NPLaN5QsDyyYn5j
         mQw8aWhQIc2KlkUtrc0k0WjrfyT3Gxet6p80vwL3jGTn/6V9Gx1X1Kg2o6xTAnm/TdWX
         VwOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XEXdy3GV4G1Rh4nIwOhWQFTlcYHrFKR0AgAwM+GWIhY=;
        b=hfAhV/4WepgFeHRBQ0huxedBc1DPFbD86TWvMjXTTq3+UhNOxzuyI/8yvLZgJeTvd0
         Z/rGW36f4ejFFsmfxJcp+rON6IcF8VcskjBHB7nylZII62QyCidq5tfHqnIt10d5rapm
         4HNe87uMMKUiZA4r0ecrN4HySKbQH5ra5b6fwOucVxaiECTVmn6cxqW20bKFPrGlM6K3
         Y6KEDKrIMbX2h3RIYlfiraAGJvIzMxsNFgjMoSGNbJ1e6qRLgynzN14ycD9QQTEggmuB
         2IG2v2xO3UBhRl5fQ9eKaabvHjCLPa0oigiDY/wIEKADRyJ6srWhclSUn6BCvYnpvIzz
         gY9w==
X-Gm-Message-State: AOAM532FhPJ+ETUPlVXKVVnPI9h9yebgifuZksgGSIJBoGXj68Kt7VD9
        Klovzr5b2EdDlS1rDWfTtpnZ8Q==
X-Google-Smtp-Source: ABdhPJwtS44OfMfN51KPVKPwvLNM9KHkNN+kRXCO75cwNa8s0IYEpXQb1SuDHt6SHs1ryUhw391pqA==
X-Received: by 2002:a05:6830:20c2:: with SMTP id z2mr35827621otq.285.1629897292481;
        Wed, 25 Aug 2021 06:14:52 -0700 (PDT)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id k23sm2536842ood.12.2021.08.25.06.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Aug 2021 06:14:52 -0700 (PDT)
Date:   Wed, 25 Aug 2021 06:16:08 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Peter Chen <peter.chen@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        agross@kernel.org, gregkh@linuxfoundation.org,
        jackp@codeaurora.org, wcheng@codeaurora.org,
        linux-usb@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 0/3] Implement role-switch notifications from dwc3-drd to
 dwc3-qcom
Message-ID: <YSZCmDEedJaJyI0u@ripper>
References: <20210704013314.200951-1-bryan.odonoghue@linaro.org>
 <20210707015704.GA28125@nchen>
 <YOX6d+sBEJMP4V3q@yoga>
 <20210708030631.GA22420@nchen>
 <YSWCnsZDdp57KBqB@ripper>
 <87zgt65avm.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87zgt65avm.fsf@kernel.org>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue 24 Aug 22:51 PDT 2021, Felipe Balbi wrote:

> 
> Hi,
> 
> Bjorn Andersson <bjorn.andersson@linaro.org> writes:
> > On Wed 07 Jul 20:06 PDT 2021, Peter Chen wrote:
> >
> >> On 21-07-07 14:03:19, Bjorn Andersson wrote:
> >> > On Tue 06 Jul 20:57 CDT 2021, Peter Chen wrote:
> >> > 
> >> > Allow me to reorder your two questions:
> >> > 
> >> > > And why using a notifier need to concern core's deferral probe?
> >> > 
> >> > The problem at hand calls for the core for somehow invoking
> >> > dwc3_qcom_vbus_overrride_enable() with a pointer to dwc3_qcom passed.
> >> > 
> >> > This means that dwc3-qcom somehow needs to inform the dwc3-core about
> >> > this (and stash the pointer). And this can't be done until dwc3-core
> >> > actually exist, which it won't until dwc3_probe() has completed
> >> > successfully (or in particular allocated struct dwc).
> >> 
> >> Maybe you misunderstood the notifier I meant previous, my pointer was
> >> calling glue layer API directly.
> >> 
> >> Role switch is from dwc3-core, when it occurs, it means structure dwc3 has
> >> allocated successfully, you could call glue layer notifier at function
> >> dwc3_usb_role_switch_set directly.
> >> Some references of my idea [1] [2]
> >> 
> >> [1] Function ci_hdrc_msm_notify_event at ci_hdrc_msm_notify_event
> >> [2] https://source.codeaurora.org/external/imx/linux-imx/tree/drivers/usb/dwc3/core.c?h=lf-5.10.y#n205
> >> 
> >
> > Hi Peter, I took a proper look at this again, hoping to find a way to
> > pass a callback pointer from dwc3-qcom to the dwc3 core, that can be
> > called from __dwc3_set_mode() to inform the Qualcomm glue about mode
> > changes.
> 
> I would rather keep the strict separation between glue and core.
> 

I'm okay with that goal, but the result is that both the OMAP and
Qualcomm driver duplicates the extcon interface already present in the
DRD, and the Meson driver duplicates the usb_role_switch. In addition to
the code duplication this manifest itself in the need for us to link
extcon to both the glue and core nodes in DeviceTree.

In order to function in a USB-C based setup we now need to register a 
usb_role_switch from the Qualcomm glue and we need to evolve the
usb_role_switch implementation to allow for the Type-C controller to
notify more than a single role-switcher.

So we're facing the need to introduce another bunch of duplication and
the DT will be quite ugly with both glue and core having to set up an
of_graph with the Type-C controller.


I really would like for us to come up with a way where the core can
notify the glue that role switching is occurring, so that we instead of
adding more duplication could aim to, over time, remove the extcon and
usb_role_switch logic from the Qualcomm, OMAP and Meson drivers.

Regards,
Bjorn
