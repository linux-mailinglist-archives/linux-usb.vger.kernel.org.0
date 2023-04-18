Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 68CAB6E67C3
	for <lists+linux-usb@lfdr.de>; Tue, 18 Apr 2023 17:06:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232218AbjDRPGm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Apr 2023 11:06:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232191AbjDRPGl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Apr 2023 11:06:41 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 7488C1BD6
        for <linux-usb@vger.kernel.org>; Tue, 18 Apr 2023 08:06:38 -0700 (PDT)
Received: (qmail 428723 invoked by uid 1000); 18 Apr 2023 11:06:37 -0400
Date:   Tue, 18 Apr 2023 11:06:37 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc:     gregkh@linuxfoundation.org, mathias.nyman@intel.com,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/2] USB: Extend pci resume function to handle PM events
Message-ID: <3f486c11-0824-451f-94d6-792f846889f1@rowland.harvard.edu>
References: <20230418140817.3651909-1-Basavaraj.Natikar@amd.com>
 <20230418140817.3651909-2-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230418140817.3651909-2-Basavaraj.Natikar@amd.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 18, 2023 at 07:38:16PM +0530, Basavaraj Natikar wrote:
> Currently, the pci_resume method has only a flag indicating whether the
> system is resuming from hibernation. In order to handle all PM events like
> AUTO_RESUME, SUSPEND etc change the pci_resume method to handle all PM
> events.

You might want to make a different kind of distinction between the 
various sorts of resume.  For example, a resume from runtime suspend 
can occur either because of a request from the system (it needs to start 
using the device) or a remote wakeup request from an attached device.  
The different sorts of resume might have different requirements.


> diff --git a/drivers/usb/host/ehci-pci.c b/drivers/usb/host/ehci-pci.c
> index 4b148fe5e43b..1145c6e7fae5 100644
> --- a/drivers/usb/host/ehci-pci.c
> +++ b/drivers/usb/host/ehci-pci.c
> @@ -354,10 +354,11 @@ static int ehci_pci_setup(struct usb_hcd *hcd)
>   * Also they depend on separate root hub suspend/resume.
>   */
>  
> -static int ehci_pci_resume(struct usb_hcd *hcd, bool hibernated)
> +static int ehci_pci_resume(struct usb_hcd *hcd, int event)
>  {
>  	struct ehci_hcd		*ehci = hcd_to_ehci(hcd);
>  	struct pci_dev		*pdev = to_pci_dev(hcd->self.controller);
> +	bool hibernated = event == PM_EVENT_RESTORE;

Please use the same indentation style as the surrounding code.  Also, 
when a boolean expression is used in an assignment, I prefer to put it 
in parentheses to help set it off from the assignment operator:

	bool			hibernated = (event == PM_EVENT_RESTORE);


> diff --git a/drivers/usb/host/uhci-pci.c b/drivers/usb/host/uhci-pci.c
> index 3592f757fe05..9b90c3221bd8 100644
> --- a/drivers/usb/host/uhci-pci.c
> +++ b/drivers/usb/host/uhci-pci.c
> @@ -167,7 +167,7 @@ static void uhci_shutdown(struct pci_dev *pdev)
>  
>  #ifdef CONFIG_PM
>  
> -static int uhci_pci_resume(struct usb_hcd *hcd, bool hibernated);
> +static int uhci_resume(struct usb_hcd *hcd, bool hibernated);

There's no need to change the function's name.  After all, it is static.

>  
>  static int uhci_pci_suspend(struct usb_hcd *hcd, bool do_wakeup)
>  {
> @@ -202,13 +202,13 @@ static int uhci_pci_suspend(struct usb_hcd *hcd, bool do_wakeup)
>  
>  	/* Check for race with a wakeup request */
>  	if (do_wakeup && HCD_WAKEUP_PENDING(hcd)) {
> -		uhci_pci_resume(hcd, false);
> +		uhci_resume(hcd, false);
>  		rc = -EBUSY;
>  	}
>  	return rc;
>  }
>  
> -static int uhci_pci_resume(struct usb_hcd *hcd, bool hibernated)
> +static int uhci_resume(struct usb_hcd *hcd, bool hibernated)
>  {
>  	struct uhci_hcd *uhci = hcd_to_uhci(hcd);
>  
> @@ -252,6 +252,10 @@ static int uhci_pci_resume(struct usb_hcd *hcd, bool hibernated)
>  	return 0;
>  }
>  
> +static int uhci_pci_resume(struct usb_hcd *hcd, int event)
> +{
> +	return uhci_resume(hcd, event == PM_EVENT_RESTORE);
> +}

Again, try to avoid this wrapper.

Alan Stern
