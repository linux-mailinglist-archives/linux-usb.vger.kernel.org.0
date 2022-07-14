Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C0DE5751CC
	for <lists+linux-usb@lfdr.de>; Thu, 14 Jul 2022 17:28:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240230AbiGNP2b (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 14 Jul 2022 11:28:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240163AbiGNP2a (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 14 Jul 2022 11:28:30 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6EEA5491D1;
        Thu, 14 Jul 2022 08:28:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1D70AB82158;
        Thu, 14 Jul 2022 15:28:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0311EC34114;
        Thu, 14 Jul 2022 15:28:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1657812506;
        bh=UHVTNSkCzm9DDuuxFuLvHdAZaBjHmgSYbC8odP2+tjU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WN5r76BtwY0MWpvAzNouauJ36nIJdUe3J3D9U3YuoFwWcSlPNUEOEyQFIlm49oMEm
         RpbpkOA8YSyYMZeI1T6orbzLMZhLoapUjrTNtNpcMapaJ87Treo9S3/2NSQY12HJFK
         NA60GY604csUi4goXEU+fTvOFFh3519MoEv3cYvA=
Date:   Thu, 14 Jul 2022 17:28:23 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: dwc3: qcom: Defer dwc3-qcom probe if dwc3 isn't
 probed properly
Message-ID: <YtA2FwnL9GRUU35i@kroah.com>
References: <1657810516-31143-1-git-send-email-quic_kriskura@quicinc.com>
 <YtAv8R7QlTZCjvRO@kroah.com>
 <2938c8ff-ecc6-0a6e-6011-f83f3e3fbaa1@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2938c8ff-ecc6-0a6e-6011-f83f3e3fbaa1@quicinc.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 14, 2022 at 08:39:31PM +0530, Krishna Kurapati PSSNV wrote:
> 
> On 7/14/2022 8:32 PM, Greg Kroah-Hartman wrote:
> > On Thu, Jul 14, 2022 at 08:25:16PM +0530, Krishna Kurapati wrote:
> > > On SC7180 devices, it is observed that dwc3 probing is deferred
> > > because device_links_check_suppliers() finds that '88e3000.phy'
> > > isn't ready yet.
> > > 
> > > As a part of its probe call, dwc3-qcom driver checks if dwc3 core
> > > is wakeup capable or not. If the dwc3 core is wakeup capable, driver
> > > configures dwc-qcom's power domain to be always ON. Also it configures
> > > dp/dm interrupts accordingly to support wakeup from system suspend.
> > > 
> > > More info regarding the same can be found at:
> > > commit d9be8d5c5b03 ("usb: dwc3: qcom: Keep power domain on to retain controller status"
> > > commit 6895ea55c385 ("usb: dwc3: qcom: Configure wakeup interrupts during suspend")
> > > 
> > > In the event, dwc3 probe gets deferred and is processed after dwc3-qcom
> > > probe, driver ends up reading the wakeup capability of dwc3 core as false
> > > leading to instability in suspend/resume path.
> > > 
> > > To avoid this scenario, ensure dwc3_probe is successful by checking
> > > if appropriate driver is assigned to it or not after the of_platform_populate
> > > call. If it isn't then defer dwc3-qcom probe as well.
> > > 
> > > Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
> > > ---
> > >   drivers/usb/dwc3/dwc3-qcom.c | 3 +++
> > >   1 file changed, 3 insertions(+)
> > > 
> > > diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> > > index 7703655..096d1414 100644
> > > --- a/drivers/usb/dwc3/dwc3-qcom.c
> > > +++ b/drivers/usb/dwc3/dwc3-qcom.c
> > > @@ -722,6 +722,9 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
> > >   		dev_err(dev, "failed to get dwc3 platform device\n");
> > >   	}
> > > +	if (!qcom->dwc3->dev.driver)
> > > +		return -EPROBE_DEFER;
> > > +
> > Why not limit this check to a device type like your changelog mentions?
> > 
> > thanks,
> > 
> > greg k-h
> Hi Greg,
> 
> I wanted to make it common to any device using this driver. Although on
> devices
> ike SC7280,this issue is not seen but the code would hold good. Do you see
> any
> concerns if we do it this way ?

How many different types of hardware did you test this change on and
what was the results?

thanks,

greg k-h
