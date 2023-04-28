Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD2F56F174F
	for <lists+linux-usb@lfdr.de>; Fri, 28 Apr 2023 14:14:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232045AbjD1MON (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 28 Apr 2023 08:14:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229657AbjD1MOK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 28 Apr 2023 08:14:10 -0400
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D47F21726
        for <linux-usb@vger.kernel.org>; Fri, 28 Apr 2023 05:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682684049; x=1714220049;
  h=message-id:date:mime-version:to:references:from:subject:
   in-reply-to:content-transfer-encoding;
  bh=B1w9uKPuvEu26Niu+Yqyrkn/GKsd9SMW/1mQK67lgOc=;
  b=LWJuaHuZebgG2nuoufUPJ3OxcD9rA/DhYqbSUlV67JRdHPW80v274YmR
   FARbn4sY0D1jKtszWZH6cLz2EE00AkZpks5eK/lL2E7IC2Ce8PwELQtMk
   isCbq7O6C+fH/t/MYWjbmxDAE+Iyzwf9/Og+aTBhyjA0BBsqaN8R56K+d
   e7+/CovJnq8xKcHMJ+I7RWVoU/O9us64oBk/kZCntRC2K8atfam8n6JVQ
   yuy+sRjgxerGSxng7HKhlOmpMwomV3owhPFscEJGQY4J1srgnXpNRiIcW
   jLyIk/b7R+x+sN5nmN96rEfVdNLakQ/n0jMmkzmk0btgyCFaFcQ1+Zkdl
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="336791354"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; 
   d="scan'208";a="336791354"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Apr 2023 05:14:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="941072352"
X-IronPort-AV: E=Sophos;i="5.99,234,1677571200"; 
   d="scan'208";a="941072352"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by fmsmga006.fm.intel.com with ESMTP; 28 Apr 2023 05:14:07 -0700
Message-ID: <f0cebcd5-1bad-7123-241c-bedbe49d0e93@linux.intel.com>
Date:   Fri, 28 Apr 2023 15:15:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.7.1
Content-Language: en-US
To:     Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
        gregkh@linuxfoundation.org, stern@rowland.harvard.edu,
        mathias.nyman@intel.com, linux-usb@vger.kernel.org
References: <20230427174220.3953123-1-Basavaraj.Natikar@amd.com>
 <20230427174220.3953123-2-Basavaraj.Natikar@amd.com>
From:   Mathias Nyman <mathias.nyman@linux.intel.com>
Subject: Re: [PATCH v3 1/2] USB: Extend pci resume function to handle PM
 events
In-Reply-To: <20230427174220.3953123-2-Basavaraj.Natikar@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 27.4.2023 20.42, Basavaraj Natikar wrote:
> Currently, the pci_resume method has only a flag indicating whether the
> system is resuming from hibernation. In order to handle all PM events like
> AUTO_RESUME (runtime resume from device in D3), RESUME (system resume from
> s2idle, S3 or S4 states) etc change the pci_resume method to handle all PM
> events.
> 
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> ---
>   drivers/usb/core/hcd-pci.c    | 24 +++++++++++++-----------
>   drivers/usb/host/ehci-pci.c   |  3 ++-
>   drivers/usb/host/ohci-pci.c   |  8 +++++++-
>   drivers/usb/host/uhci-pci.c   |  7 ++++---
>   drivers/usb/host/xhci-histb.c |  2 +-
>   drivers/usb/host/xhci-pci.c   |  4 ++--
>   drivers/usb/host/xhci-plat.c  |  4 ++--
>   drivers/usb/host/xhci-tegra.c |  2 +-
>   drivers/usb/host/xhci.c       |  3 ++-
>   drivers/usb/host/xhci.h       |  2 +-
>   include/linux/usb/hcd.h       |  2 +-
>   11 files changed, 36 insertions(+), 25 deletions(-)
> 

...

>   
> diff --git a/drivers/usb/host/xhci-plat.c b/drivers/usb/host/xhci-plat.c
> index b9f9625467d6..727e771d4d5f 100644
> --- a/drivers/usb/host/xhci-plat.c
> +++ b/drivers/usb/host/xhci-plat.c
> @@ -465,7 +465,7 @@ static int __maybe_unused xhci_plat_resume(struct device *dev)
>   	if (ret)
>   		return ret;
>   
> -	ret = xhci_resume(xhci, 0);
> +	ret = xhci_resume(xhci, PMSG_ON);

Maybe PMSG_RESUME, not that it has any bigger impact.

>   	if (ret)
>   		return ret;
>   
> @@ -494,7 +494,7 @@ static int __maybe_unused xhci_plat_runtime_resume(struct device *dev)
>   	struct usb_hcd  *hcd = dev_get_drvdata(dev);
>   	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
>   
> -	return xhci_resume(xhci, 0);
> +	return xhci_resume(xhci, PMSG_ON);

This should be PMSG_AUTO_RESUME, otherwise we will skip the 120ms port event check that needs
to be done for runtime resume cases

>   }
>   
>   const struct dev_pm_ops xhci_plat_pm_ops = {
> diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
> index a88c39e525c2..665f5c20f551 100644
> --- a/drivers/usb/host/xhci-tegra.c
> +++ b/drivers/usb/host/xhci-tegra.c
> @@ -2275,7 +2275,7 @@ static int tegra_xusb_exit_elpg(struct tegra_xusb *tegra, bool runtime)
>   	if (wakeup)
>   		tegra_xhci_disable_phy_sleepwalk(tegra);
>   
> -	err = xhci_resume(xhci, 0);
> +	err = xhci_resume(xhci, PMSG_ON);

Same here,  runtime ? PMSG_AUTO_RESUME : PMSG_RESUME

>   	if (err < 0) {
>   		dev_err(tegra->dev, "failed to resume XHCI: %d\n", err);
>   		goto disable_phy;

Thanks
Mathias
