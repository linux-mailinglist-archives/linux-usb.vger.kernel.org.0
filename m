Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A0AAF54C2C7
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jun 2022 09:41:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346794AbiFOHlK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jun 2022 03:41:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245632AbiFOHlI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jun 2022 03:41:08 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0C1E3D1E0
        for <linux-usb@vger.kernel.org>; Wed, 15 Jun 2022 00:41:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5AE16B81C8A
        for <linux-usb@vger.kernel.org>; Wed, 15 Jun 2022 07:41:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D04EC385A5;
        Wed, 15 Jun 2022 07:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1655278865;
        bh=XkCoTIkm/Q4hAsZjLG7TEIs8znSu67knXRYuVrmIStg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GkuNXA8KY47XfsqnScntR2GguDb7tspJbbuveqF84CvE+WQ/A9r1WPiyKmD9znMRC
         QFelMu2OgUZKcxtl8Whk+gS0G7/vBCBhlVB3QQRlqp3CMXyCU1RZqqwIvAka9olxyp
         3tSI5bYHSU+YUY0fLjnRUV9YRcRYWSyInPXu1Lp4=
Date:   Wed, 15 Jun 2022 06:59:13 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     John Youn <John.Youn@synopsys.com>,
        Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] usb: dwc3: core: Deprecate GCTL.CORESOFTRESET
Message-ID: <YqlnIYQ1AOiXqjov@kroah.com>
References: <54b6e2974bccacbd644f9ba75d8929d09848ecc4.1653586398.git.Thinh.Nguyen@synopsys.com>
 <8c4f423c-613d-2347-0769-3af4674d8582@synopsys.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c4f423c-613d-2347-0769-3af4674d8582@synopsys.com>
X-Spam-Status: No, score=-8.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 15, 2022 at 01:21:46AM +0000, Thinh Nguyen wrote:
> Hi Greg,
> 
> Thinh Nguyen wrote:
> > Synopsys IP DWC_usb32 and DWC_usb31 version 1.90a and above deprecated
> > GCTL.CORESOFTRESET. The DRD mode switching flow is updated to remove the
> > GCTL soft reset. Add version checks to prevent using deprecated setting
> > in mode switching flow.
> > 
> > Signed-off-by: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
> > ---
> >  drivers/usb/dwc3/core.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> > index e027c0420dc3..6b5f6d0eb1dd 100644
> > --- a/drivers/usb/dwc3/core.c
> > +++ b/drivers/usb/dwc3/core.c
> > @@ -159,7 +159,8 @@ static void __dwc3_set_mode(struct work_struct *work)
> >  	}
> >  
> >  	/* For DRD host or device mode only */
> > -	if (dwc->desired_dr_role != DWC3_GCTL_PRTCAP_OTG) {
> > +	if ((DWC3_IP_IS(DWC3) || DWC3_VER_IS_PRIOR(DWC31, 190A)) &&
> > +	    dwc->desired_dr_role != DWC3_GCTL_PRTCAP_OTG) {
> >  		reg = dwc3_readl(dwc->regs, DWC3_GCTL);
> >  		reg |= DWC3_GCTL_CORESOFTRESET;
> >  		dwc3_writel(dwc->regs, DWC3_GCTL, reg);
> > 
> > base-commit: 97fa5887cf283bb75ffff5f6b2c0e71794c02400
> 
> Just checking to see if we missed this patch. If it needs more review,
> then we can leave it be.

It's not in my queue at all, I have no idea what happened to it...

Please resubmit if it's still needed.

thanks,

greg k-h
