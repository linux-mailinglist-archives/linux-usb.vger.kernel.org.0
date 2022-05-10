Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3EEBD521E9A
	for <lists+linux-usb@lfdr.de>; Tue, 10 May 2022 17:28:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244973AbiEJPcF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 May 2022 11:32:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242802AbiEJPan (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 May 2022 11:30:43 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id C23822E9E7
        for <linux-usb@vger.kernel.org>; Tue, 10 May 2022 08:22:18 -0700 (PDT)
Received: (qmail 164435 invoked by uid 1000); 10 May 2022 11:22:17 -0400
Date:   Tue, 10 May 2022 11:22:17 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Pavan Kondeti <quic_pkondeti@quicinc.com>
Cc:     Matthias Kaehlcke <mka@chromium.org>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [v15 3/6] usb: dwc3: core: Host wake up support from system
 suspend
Message-ID: <YnqDKXemavWnJtTc@rowland.harvard.edu>
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
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220510011602.GA16769@hu-pkondeti-hyd.qualcomm.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
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

It looks fine, aside from lacking any comments/kerneldoc.

Alan Stern

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
> +	return nr_wakeup;
> +}
> +EXPORT_SYMBOL_GPL(usb_hcd_wakeup_enabled_descendants);
> +
>  int usb_hcd_find_raw_port_number(struct usb_hcd *hcd, int port1)
>  {
>  	if (!hcd->driver->find_raw_port_number)
> diff --git a/include/linux/usb/hcd.h b/include/linux/usb/hcd.h
> index 1886e81..a5d561b 100644
> --- a/include/linux/usb/hcd.h
> +++ b/include/linux/usb/hcd.h
> @@ -474,6 +474,7 @@ extern void usb_remove_hcd(struct usb_hcd *hcd);
>  extern int usb_hcd_find_raw_port_number(struct usb_hcd *hcd, int port1);
>  int usb_hcd_setup_local_mem(struct usb_hcd *hcd, phys_addr_t phys_addr,
>  			    dma_addr_t dma, size_t size);
> +extern unsigned int usb_hcd_wakeup_enabled_descendants(struct usb_hcd *hcd);
>  
>  struct platform_device;
>  extern void usb_hcd_platform_shutdown(struct platform_device *dev);
> 
