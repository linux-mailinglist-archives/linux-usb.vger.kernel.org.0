Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D113A51FF90
	for <lists+linux-usb@lfdr.de>; Mon,  9 May 2022 16:25:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237123AbiEIO1p (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 May 2022 10:27:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237127AbiEIO1n (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 May 2022 10:27:43 -0400
Received: from alexa-out.qualcomm.com (alexa-out.qualcomm.com [129.46.98.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 539901E2181
        for <linux-usb@vger.kernel.org>; Mon,  9 May 2022 07:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1652106228; x=1683642228;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=yQRwekD07tFyPKMqXVeiCng0+smZlBR/RHUIFT4bvXI=;
  b=DfhhJl1lCaM4jsS7AjNGZ5wqwNINCwBXCOSfnyCCb2RAvINgHMTAD91k
   1AXZDXuIcLWFO8M/jGLJYsNKmNwAgVgT5r80xQLOn8yt2db/eimuSkW9K
   /cwV35GdTrpDFpGf74wdW50gUEH2W14jQqjNUv7XMd5zx0KNlH9c2k4B4
   8=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 09 May 2022 07:23:48 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2022 07:23:48 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 9 May 2022 07:23:47 -0700
Received: from hu-pkondeti-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 9 May 2022 07:23:45 -0700
Date:   Mon, 9 May 2022 19:53:41 +0530
From:   Pavan Kondeti <quic_pkondeti@quicinc.com>
To:     Alan Stern <stern@rowland.harvard.edu>
CC:     Pavan Kondeti <quic_pkondeti@quicinc.com>,
        Matthias Kaehlcke <mka@chromium.org>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [v15 3/6] usb: dwc3: core: Host wake up support from system
 suspend
Message-ID: <20220509142341.GA28596@hu-pkondeti-hyd.qualcomm.com>
References: <YnRUPxBZB55TPmf2@google.com>
 <a83dea08-0920-17e6-ec1c-f9d8a490a08d@quicinc.com>
 <20220506051448.GE4640@hu-pkondeti-hyd.qualcomm.com>
 <YnVD+ltiQhKE+jPf@google.com>
 <YnVSIvwXsKySg33M@google.com>
 <YnVmXmG+6emL4nxv@rowland.harvard.edu>
 <YnVs7kSkpjUBWc5w@google.com>
 <YnWFaSXJJ8T7IYtl@rowland.harvard.edu>
 <20220509033238.GA9170@hu-pkondeti-hyd.qualcomm.com>
 <YnkgaagoaYK7LkCq@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <YnkgaagoaYK7LkCq@rowland.harvard.edu>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, May 09, 2022 at 10:08:41AM -0400, Alan Stern wrote:
> On Mon, May 09, 2022 at 09:02:38AM +0530, Pavan Kondeti wrote:
> > On Fri, May 06, 2022 at 04:30:33PM -0400, Alan Stern wrote:
> > > On Fri, May 06, 2022 at 11:46:06AM -0700, Matthias Kaehlcke wrote:
> > > > Currently the core/PHYs are always powered off during suspend in host mode:
> > > > 
> > > > static int dwc3_suspend_common(struct dwc3 *dwc, pm_message_t msg)
> > > > {
> > > > 	...
> > > > 
> > > > 	switch (dwc->current_dr_role) {
> > > > 	case DWC3_GCTL_PRTCAP_HOST:
> > > > 		if (!PMSG_IS_AUTO(msg)) {
> > > > 			dwc3_core_exit(dwc);
> > > > 			break;
> > > > 		}
> > > > 
> > > > 	...
> > > > }
> > > > 
> > > > With that I would expect wakeup to be broken for all dwc3. I'm a bit confused
> > > > though, since dwc3-imx8mp.c seems to support wakeup and the driver landed
> > > > after the above patch ...
> > > > 
> > > > This series intends to change the above code to something like this:
> > > > 
> > > > 	if (!PMSG_IS_AUTO(msg)) {
> > > > 	       if (device_may_wakeup(dwc->dev) &&
> > > > 	                       device_wakeup_path(dwc->dev)) {
> > > > 	               dwc->phy_power_off = false;
> > > > 	       } else {
> > > > 	               dwc->phy_power_off = true;
> > > > 	               dwc3_core_exit(dwc);
> > > > 	       }
> > > > 	}
> > > 
> > > > i.e. the core/PHYs would only be powered down if wakeup is disabled or no
> > > > wakeup capable devices are connected. With that plug/unplug events still
> > > > wouldn't be detected.
> > > 
> > > Indeed.  Shouldn't the "&&" and "||"?  That is, don't you want to leave 
> > > the core and PHY powered if wakeup is enabled for the root hub or for 
> > > any devices beneath it?
> > > 
> > > It would be simpler to leave the core and PHY powered whenever wakeup is 
> > > enabled for the controller itself, regardless of the status of the root 
> > > hub and downstream devices.  Users might not like this so much if the 
> > > default setting is to enable wakeup for the controller always.  Still, 
> > > it's an easy solution.
> > > 
> > At this point it is not clear if all boards that has DWC3 controller can
> > support wakeup capability or not. Thats why we have introduced a wakeup device
> > tree property based on which we advertise our wakeup capability.
> > 
> > device_init_wakeup(&pdev->dev, of_property_read_bool(dev->of_node,
> > "wakeup-source"));
> > 
> > Hence the && condition to make sure that we support wakeup and our children
> > needs it.
> 
> Oh, I see.  I misread the code above, thinking that dwc->dev referred to 
> the root hub.  It doesn't; it refers to the controller.  Sorry for the 
> mistake.
> 
> BTW, if there's any trouble with getting device_wakeup_path() to work 
> the way you want, you could consider instead calling 
> usb_wakeup_enabled_descendants() on the root hub.  This function returns 
> a count of the number of wakeup-enabled USB devices at or below the 
> device you pass to it.
> 

This series [1] started with usb_wakeup_enabled_descendants() actually. one
of the problem with this API is that we have to call this on both USB2.0 and
USB3.0 root hubs. Do you think we can have a wrapper function like
usb_hcd_wakeup_enabled_descendants() that accepts hcd as an argument and
internally call usb_wakeup_enabled_descendants() on both root hubs and return
the result.

Thanks,
Pavan
