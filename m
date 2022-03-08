Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9F77F4D1B07
	for <lists+linux-usb@lfdr.de>; Tue,  8 Mar 2022 15:53:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347650AbiCHOyo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 8 Mar 2022 09:54:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234154AbiCHOyo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 8 Mar 2022 09:54:44 -0500
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88DBB2E096
        for <linux-usb@vger.kernel.org>; Tue,  8 Mar 2022 06:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1646751227; x=1678287227;
  h=to:cc:references:from:subject:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=zeMWxwZ30S6VBETKZhm258zEcDrFW79BXEaWO/w3pOQ=;
  b=Z9UYtb9Z3eyL20H/8zjqwo2Epjno/CMOagE7UxD8qw/YRM0PqtPjZXIj
   n9a0iq79LOWyHYUqgdoHOWv2rDnd1JHPoaZugITfGqfI8EW++2m7katw0
   He9UV5CzvttyNqmlDDqbCPQRwaRRfAQbk69BfFCSeWABG+GiPbgUwGuVT
   LDJaFpDXutH7nMzsidX0q24StzXnTwwrswTKDpDGlXhCSGuG9jjJ7xzIG
   46/xMBdf1G/2LYGVEy1vURrZfmw4+xVhsOCCciW3JEgrybhoOWlzU3ikq
   QpUWk3WwvkbrQcQikrWyn9qST9BtckK0wQUfDazT9eBxTEpjB4ieOQMXr
   g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="254428096"
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; 
   d="scan'208";a="254428096"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2022 06:53:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,165,1643702400"; 
   d="scan'208";a="578011785"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga001.jf.intel.com with ESMTP; 08 Mar 2022 06:53:45 -0800
To:     Heiner Kallweit <hkallweit1@gmail.com>,
        Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Linux USB Mailing List <linux-usb@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Jack Pham <quic_jackp@quicinc.com>,
        Tung Nguyen <tunguyen@apm.com>
References: <18a93669-7f7a-dad8-38f4-44819fc3b64a@gmail.com>
 <e73bc0c1-e530-7419-0197-1b7de02c87c5@gmail.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH 5/5] xhci: support omitting shared hcd if either of the
 root hubs has no ports
Message-ID: <e41743c9-73dd-0c2c-3df3-a20b53f066e8@linux.intel.com>
Date:   Tue, 8 Mar 2022 16:55:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <e73bc0c1-e530-7419-0197-1b7de02c87c5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 4.3.2022 20.37, Heiner Kallweit wrote:
> If either of the root hubs has no ports, then we can get rid of
> overhead like the shared hcd. A major internal change is that now
> the main hcd can be USB2 or USB3.
> 
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
> ---
>  drivers/usb/host/xhci-mem.c | 11 +++++------
>  drivers/usb/host/xhci.c     |  9 ++++++---
>  2 files changed, 11 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
> index a1a17713a..ced139583 100644
> --- a/drivers/usb/host/xhci-mem.c
> +++ b/drivers/usb/host/xhci-mem.c
> @@ -2362,12 +2362,11 @@ static int xhci_setup_port_arrays(struct xhci_hcd *xhci, gfp_t flags)
>  		xhci->usb2_rhub.num_ports = USB_MAXCHILDREN;
>  	}
>  
> -	xhci->needs_shared_hcd = 1;
> -
> -	/*
> -	 * Note we could have all USB 3.0 ports, or all USB 2.0 ports.
> -	 * Not sure how the USB core will handle a hub with no ports...
> -	 */
> +	if (xhci->usb2_rhub.num_ports && xhci->usb3_rhub.num_ports)
> +		xhci->needs_shared_hcd = 1;
> +	else
> +		xhci_info(xhci, "USB%u root hub has no ports\n",
> +			  xhci->usb2_rhub.num_ports ? 3 : 2);

This now works for xhci controllers using xhci-plat.c, but in all other cases
the the secondary hcd will still be added.

Would it make sense to instead of setting xhci->needs_shared_hcd, we
set a xhci->allow_single_roothub flag in the .reset override function?
In the xhci-plat.c case this would be in xhci_plat_setup()

We would only add the flag if the respective probe supports one roothub.

Add a helper function to check if we if really should set up just one 
hcd in probe, and should call xhci_run_finished() already the he first time
xhci_run() is called (like you do in patch 3/5).

Something like:

bool xhci_has_one_roothub(struct xhci_hcd *xhci)
{
	return xhci->allow_single_roothub && (!xhci->usb2_rhub.num_ports != !xhci->usb3_rhub.num_ports);
}

Thanks
-Mathias
