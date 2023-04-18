Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 60F3D6E67FB
	for <lists+linux-usb@lfdr.de>; Tue, 18 Apr 2023 17:23:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231577AbjDRPXt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Apr 2023 11:23:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231663AbjDRPXq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Apr 2023 11:23:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E379E12CBC
        for <linux-usb@vger.kernel.org>; Tue, 18 Apr 2023 08:23:35 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 70F066306D
        for <linux-usb@vger.kernel.org>; Tue, 18 Apr 2023 15:23:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78531C433EF;
        Tue, 18 Apr 2023 15:23:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1681831414;
        bh=s/wVScLZ3H6X7c+SxovOR5BsI2PCtS7+RucRrWbBPNU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=n8lgEjxBTfitmQaLhj6gDtXKzW2P0tsWSNNl+fLHz5drOWTosWFAxMsbIUO/QWf6A
         NYsbdnwFbCePv9yrCvde3Ps5hdLebbrIRBgkd4+sXxujHLLhuWauvzjwn3HdParJTe
         lUVtKU5LphKTn1I88Y+lbzVz0E9r5sxpxVivK5ck=
Date:   Tue, 18 Apr 2023 17:23:32 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>
Cc:     stern@rowland.harvard.edu, mathias.nyman@intel.com,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/2] USB: Extend pci resume function to handle PM events
Message-ID: <2023041846-pang-cough-f739@gregkh>
References: <20230418140817.3651909-1-Basavaraj.Natikar@amd.com>
 <20230418140817.3651909-2-Basavaraj.Natikar@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230418140817.3651909-2-Basavaraj.Natikar@amd.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
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
> 
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> ---
>  drivers/usb/core/hcd-pci.c  | 14 ++++++++------
>  drivers/usb/host/ehci-pci.c |  3 ++-
>  drivers/usb/host/ohci-pci.c |  8 +++++++-
>  drivers/usb/host/uhci-pci.c | 10 +++++++---
>  drivers/usb/host/xhci-pci.c |  4 ++--
>  drivers/usb/host/xhci.c     |  3 ++-
>  drivers/usb/host/xhci.h     |  2 +-
>  include/linux/usb/hcd.h     |  2 +-
>  8 files changed, 30 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/usb/core/hcd-pci.c b/drivers/usb/core/hcd-pci.c
> index ab2f3737764e..bef092da477a 100644
> --- a/drivers/usb/core/hcd-pci.c
> +++ b/drivers/usb/core/hcd-pci.c
> @@ -415,12 +415,15 @@ static int check_root_hub_suspended(struct device *dev)
>  	return 0;
>  }
>  
> -static int suspend_common(struct device *dev, bool do_wakeup)
> +static int suspend_common(struct device *dev, int event)

Shouldn't there be a PM_EVENT_* type for this so that we can properly
type-check that it is being used properly everywhere?  Much like we can
do for GFP_* flags?

Not the fault of this patch, just a general comment...

thanks,

greg k-h
