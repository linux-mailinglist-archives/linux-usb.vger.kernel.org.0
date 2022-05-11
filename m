Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFB26522933
	for <lists+linux-usb@lfdr.de>; Wed, 11 May 2022 03:51:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240808AbiEKBvT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 May 2022 21:51:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240796AbiEKBvR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 May 2022 21:51:17 -0400
Received: from alexa-out-sd-01.qualcomm.com (alexa-out-sd-01.qualcomm.com [199.106.114.38])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6230606E0;
        Tue, 10 May 2022 18:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1652233872; x=1683769872;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bGoWUSVkBi0VXKTbuYsdajcXGv1TjqD5Cu56Xf2zl10=;
  b=CU744RWHpoPzi4UIdfb/vRjLY//Fmll07FWhSeIsVF2pB+ZAzQeK1Jj2
   VzyO36VkciC4QKRaazlG6IiAfZ1IDXLN/rTaaPcOeaqyIov6Kc3Swru6M
   D28ioiNm4BPmqI7fHUnmlyP8S3vPm3hTC668yc0V7Sn/1T2cyLw7STWFg
   k=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 10 May 2022 18:51:11 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 May 2022 18:51:11 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 10 May 2022 18:51:11 -0700
Received: from hu-pkondeti-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Tue, 10 May 2022 18:51:04 -0700
Date:   Wed, 11 May 2022 07:21:01 +0530
From:   Pavan Kondeti <quic_pkondeti@quicinc.com>
To:     Pavan Kondeti <quic_pkondeti@quicinc.com>
CC:     Matthias Kaehlcke <mka@chromium.org>,
        Krishna Kurapati <quic_kriskura@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Andy Gross" <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Mathias Nyman <mathias.nyman@intel.com>,
        <devicetree@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-pm@vger.kernel.org>, <quic_ppratap@quicinc.com>,
        <quic_vpulyala@quicinc.com>
Subject: Re: [v15 2/6] usb: host: xhci-plat: Enable wakeup based on children
 wakeup status
Message-ID: <20220511015101.GB23843@hu-pkondeti-hyd.qualcomm.com>
References: <1651740973-7944-1-git-send-email-quic_kriskura@quicinc.com>
 <1651740973-7944-3-git-send-email-quic_kriskura@quicinc.com>
 <YnVAZSZYQvIJxOHv@google.com>
 <20220509033843.GB9170@hu-pkondeti-hyd.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220509033843.GB9170@hu-pkondeti-hyd.qualcomm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 09, 2022 at 09:08:43AM +0530, Pavan Kondeti wrote:
> On Fri, May 06, 2022 at 08:36:31AM -0700, Matthias Kaehlcke wrote:
> > On Thu, May 05, 2022 at 02:26:09PM +0530, Krishna Kurapati wrote:
> > > device_wakeup_path() tells if any of the children devices needs
> > > wakeup. Use this hint to enable/disable wakeup of our device. This
> > > helps the parent device of xhci-plat (like sysdev) to retrieve
> > > the wakeup setting via device_wakeup_path().
> > > 
> > > Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> > > ---
> > >  drivers/usb/host/xhci-plat.c | 8 ++++++++
> > >  1 file changed, 8 insertions(+)
> > > 
> > > diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> > > index 649ffd8..ad585fa 100644
> > > --- a/drivers/usb/host/xhci-plat.c
> > > +++ b/drivers/usb/host/xhci-plat.c
> > > @@ -415,6 +415,14 @@ static int __maybe_unused xhci_plat_suspend(struct device *dev)
> > >  	if (pm_runtime_suspended(dev))
> > >  		pm_runtime_resume(dev);
> > >  
> > > +	if (device_wakeup_path(dev)) {
> > > +		if (!device_may_wakeup(dev))
> > > +			device_wakeup_enable(dev);
> > > +	} else {
> > > +		if (device_may_wakeup(dev))
> > > +			device_wakeup_disable(dev);
> > > +	}
> > 
> > This code is not self-explantatory and deserves a comment.
> > 
> > Enabling/disabling wakeup for the purpose if signalling is a bit of a
> > hack. It might be an acceptable hack as long as it has no side effects.
> > However with the current implementation the wakeup state of the xHCI can
> > be different after resuming than it was before going to suspend:
> > 
> > after boot
> >   grep -h xhci /sys/class/wakeup/*/name
> >     => xhci-hcd.14.auto
> > 
> > after suspend w/o wakeup capable device
> >   grep -h xhci /sys/class/wakeup/*/name
> >     => no results
> > 
> > after suspend with wakeup capable device
> >   grep -h xhci /sys/class/wakeup/*/name
> >     => xhci-hcd.14.auto
> > 
> > The hack shouldn't alter the wakeup state 'persistently', i.e. you'll have
> > to restore it on resume, as in Pavan does in his reply to '[PATCH v14 2/7]
> > PM / wakeup: Add device_children_wakeup_capable()' (it needs to be done
> > conditionally though).
> 
> I am worried that we are not doing the right thing here. why should the
> xhci-plat goes against the wishes of the user space policy here? Can we NOT
> just do anything here? If some one wants xhci-plat to wakeup all the time,
> dwc3 will be configured to wakeup the system provided that the support is
> available. This way we don't break any existing users of xhci-plat i.e not
> enabling wakeup from the kernel.
> 
Krishna,

can we please drop this patch and use device_wakeup_path() and verify the
following cases.

1. one of the downstream USB device supports wakeup and xhci-plat wakeup is enabled
2. one of the downstream USB device supports wakeup and xhci-plat wakeup is
disabled
3. none of the downstream USB device supports wakeup (or disable) and
xhci-plat wakeup is enabled.
4. none of the downstream USB device supports wakeup (or disable) and
xhci-plat wakeup is disabled.

We don't want to enable xhci-plat wakeup capability like we do in this patch
and potentially break any other platform. Lets leave the policy to the user
space and rely on wakeup path to see if we can achieve the desired result.

Thanks,
Pavan
