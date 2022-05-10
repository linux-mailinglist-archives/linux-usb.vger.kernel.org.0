Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBB3D520AB3
	for <lists+linux-usb@lfdr.de>; Tue, 10 May 2022 03:31:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234245AbiEJBfB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 9 May 2022 21:35:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231757AbiEJBe6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 9 May 2022 21:34:58 -0400
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B29A1B79C
        for <linux-usb@vger.kernel.org>; Mon,  9 May 2022 18:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1652146261; x=1683682261;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=1BXGTaOcEAu6jDr1XNLsbih6XrhF0HfOCZOa/vZF9jA=;
  b=ndNZx6VMYJ/WQXpcCOEfG4x449iWtl23qP4g6o2REtSq4aIS/cB5/kRk
   TzUE8yop4bJKojxR4EP2l4+AkkHoDjzi4nrR8k5Wmfhak82CtY185QvYM
   GjwB/4/Onh+L12YM9uG9xbbqnaA0hZYSJJHKv7pO79xbOifT5A1BZRNeJ
   w=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 09 May 2022 18:31:00 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2022 18:31:00 -0700
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 9 May 2022 18:31:00 -0700
Received: from hu-pkondeti-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.22; Mon, 9 May 2022 18:30:58 -0700
Date:   Tue, 10 May 2022 07:00:54 +0530
From:   Pavan Kondeti <quic_pkondeti@quicinc.com>
To:     Pavan Kondeti <quic_pkondeti@quicinc.com>
CC:     Alan Stern <stern@rowland.harvard.edu>,
        Matthias Kaehlcke <mka@chromium.org>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [v15 3/6] usb: dwc3: core: Host wake up support from system
 suspend
Message-ID: <20220510013054.GA24800@hu-pkondeti-hyd.qualcomm.com>
References: <YnVD+ltiQhKE+jPf@google.com>
 <YnVSIvwXsKySg33M@google.com>
 <YnVmXmG+6emL4nxv@rowland.harvard.edu>
 <YnVs7kSkpjUBWc5w@google.com>
 <YnWFaSXJJ8T7IYtl@rowland.harvard.edu>
 <20220509033238.GA9170@hu-pkondeti-hyd.qualcomm.com>
 <YnkgaagoaYK7LkCq@rowland.harvard.edu>
 <20220509142341.GA28596@hu-pkondeti-hyd.qualcomm.com>
 <YnkmV1wyC8fwBdub@rowland.harvard.edu>
 <20220510011602.GA16769@hu-pkondeti-hyd.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20220510011602.GA16769@hu-pkondeti-hyd.qualcomm.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
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

On Tue, May 10, 2022 at 06:46:02AM +0530, Pavan Kondeti wrote:
> On Mon, May 09, 2022 at 10:33:59AM -0400, Alan Stern wrote:
> > On Mon, May 09, 2022 at 07:53:41PM +0530, Pavan Kondeti wrote:
> > > On Mon, May 09, 2022 at 10:08:41AM -0400, Alan Stern wrote:
> > > > BTW, if there's any trouble with getting device_wakeup_path() to work 
> > > > the way you want, you could consider instead calling 
> > > > usb_wakeup_enabled_descendants() on the root hub.  This function returns 
> > > > a count of the number of wakeup-enabled USB devices at or below the 
> > > > device you pass to it.
> > > > 
> > > 
> > > This series [1] started with usb_wakeup_enabled_descendants() actually. one
> > > of the problem with this API is that we have to call this on both USB2.0 and
> > > USB3.0 root hubs. Do you think we can have a wrapper function like
> > > usb_hcd_wakeup_enabled_descendants() that accepts hcd as an argument and
> > > internally call usb_wakeup_enabled_descendants() on both root hubs and return
> > > the result.
> > 
> > Sure you can.  Feel free to write such a function and add it to hcd.c.  
> > Ideally it should work for host controllers with any number of root 
> > hubs, just adding up the number of wakeup-enabled descendants for all of 
> > them.
> > 
> Thanks Alan for the suggestion. Does the below diff looks good?
> 
> Thanks,
> Pavan
> 
> diff --git a/drivers/usb/core/hcd.c b/drivers/usb/core/hcd.c
> index c9443aa..f707f9b 100644
> --- a/drivers/usb/core/hcd.c
> +++ b/drivers/usb/core/hcd.c
> @@ -2704,6 +2704,19 @@ int usb_hcd_is_primary_hcd(struct usb_hcd *hcd)
>  }
>  EXPORT_SYMBOL_GPL(usb_hcd_is_primary_hcd);
>  
> +unsigned int usb_hcd_wakeup_enabled_descendants(struct usb_hcd *hcd)
> +{
> +	unsigned int nr_wakeup;
> +
> +	nr_wakeup = usb_wakeup_enabled_descendants(hcd->self.root_hub);
> +
> +	if (hcd->shared_hcd)
> +		nr_wakeup += usb_wakeup_enabled_descendants(hcd->shared_hcd->self.root_hub);
> +

btw, should we add an else block here to take care of companion controllers
associcated if any. Can you pls tell us if it is possible that we have all
the below cases together? should the companion check be done only when
shared_hcd is not present?

- primary HCD (USB2.0, EHCI/XHCI)
- secondary HCD (USB3.0 XHCI)
- hs_companion (USB2.0 companion) for OHCI/UHCI

unsigned int usb_hcd_wakeup_enabled_descendants(struct usb_hcd *hcd)
{
	unsigned int nr_wakeup;

	nr_wakeup = usb_wakeup_enabled_descendants(hcd->self.root_hub);

	if (hcd->shared_hcd)
		nr_wakeup += usb_wakeup_enabled_descendants(hcd->shared_hcd->self.root_hub);
	else if (hcd->self.hs_companion)
		nr_wakeup += usb_wakeup_enabled_descendants(hcd->self.hs_companion->root_hub);

	return nr_wakeup;
}

Thanks,
Pavan
