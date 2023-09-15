Return-Path: <linux-usb+bounces-147-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2734A7A1FC1
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 15:23:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3724282327
	for <lists+linux-usb@lfdr.de>; Fri, 15 Sep 2023 13:23:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D35A10975;
	Fri, 15 Sep 2023 13:23:05 +0000 (UTC)
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32CA101D4
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 13:23:03 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71C1E2D68
	for <linux-usb@vger.kernel.org>; Fri, 15 Sep 2023 06:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694784137; x=1726320137;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to:content-transfer-encoding;
  bh=ylC0xjb/u+IdxNLba1hcI2gs9CiUZCl9FEmGmvkiYzQ=;
  b=jJi6yCNEBwd5cFjVC0EDENPqFUrrGcZFvbVGP1SPqMOKZgjLQh/vQeSN
   q3vMWGyF0yn3ZqtrSqZMbuqPkTcwxyGLnsot+IaH2MGHTVGgBD9tmIExD
   UcDMXEmUs0STgfWHMZN56aBug2Ncybd0KVa0u/wIuyJF3IC7+zpGg4XJs
   0o/2198O7TtE+pPAPWZH6xxhjlbK3wgottGDP1ifisJBCf7xG4WKChcR7
   TNbpzlbtB4rAGz7Z2DfJnVaM7sB1bUO8i1F8N1dvCnJWi3A88NFhdotep
   vo0+K23B4ztIBCB1vUMm+jjFcEbOLuNCJqhcZtA8nfd/kyaj7Q4vHotWj
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="381974908"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="381974908"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2023 06:20:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="721677527"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; 
   d="scan'208";a="721677527"
Received: from mattu-haswell.fi.intel.com (HELO [10.237.72.199]) ([10.237.72.199])
  by orsmga006.jf.intel.com with ESMTP; 15 Sep 2023 06:20:33 -0700
Message-ID: <c00ce19e-efb4-fe82-e46b-5c369fbcc2c9@linux.intel.com>
Date: Fri, 15 Sep 2023 16:21:54 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.13.0
Subject: Re: [PATCH 2/2] xhci: Enable RPM on controllers that support
 low-power states
Content-Language: en-US
To: Basavaraj Natikar <Basavaraj.Natikar@amd.com>, mathias.nyman@intel.com,
 gregkh@linuxfoundation.org, mika.westerberg@linux.intel.com,
 mario.limonciello@amd.com, linux-usb@vger.kernel.org
References: <20230821065742.2924681-1-Basavaraj.Natikar@amd.com>
 <20230821065742.2924681-3-Basavaraj.Natikar@amd.com>
From: Mathias Nyman <mathias.nyman@linux.intel.com>
In-Reply-To: <20230821065742.2924681-3-Basavaraj.Natikar@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On 21.8.2023 9.57, Basavaraj Natikar wrote:
> Use the low-power states of the underlying platform to enable runtime PM.
> If the platform doesn't support runtime D3, then enabling default RPM will
> result in the controller malfunctioning, as in the case of hotplug devices
> not being detected because of a failed interrupt generation.
> 
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> ---
>   drivers/usb/host/xhci-pci.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/host/xhci-pci.c b/drivers/usb/host/xhci-pci.c
> index c908a80ef436..1bb5b510c5ba 100644
> --- a/drivers/usb/host/xhci-pci.c
> +++ b/drivers/usb/host/xhci-pci.c
> @@ -693,7 +693,9 @@ static int xhci_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
>   	/* USB-2 and USB-3 roothubs initialized, allow runtime pm suspend */
>   	pm_runtime_put_noidle(&dev->dev);
>   
> -	if (xhci->quirks & XHCI_DEFAULT_PM_RUNTIME_ALLOW)
> +	if (pci_choose_state(dev, PMSG_SUSPEND) == PCI_D0)
> +		pm_runtime_forbid(&dev->dev);
> +	else if (xhci->quirks & XHCI_DEFAULT_PM_RUNTIME_ALLOW)
>   		pm_runtime_allow(&dev->dev);
>   
>   	dma_set_max_seg_size(&dev->dev, UINT_MAX);

Looks good to me

-Mathias

