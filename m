Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2ABA2692444
	for <lists+linux-usb@lfdr.de>; Fri, 10 Feb 2023 18:16:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232647AbjBJRQo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Feb 2023 12:16:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60346 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232604AbjBJRQl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Feb 2023 12:16:41 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B3A861D06
        for <linux-usb@vger.kernel.org>; Fri, 10 Feb 2023 09:16:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676049400; x=1707585400;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=a8u2/4HkeGKJcuJiX7mGfs+qp9rnEvswvHIZq7ndLLY=;
  b=JZ8rc/MaGu+cnGlu0fFitsbxfYLW9LDXcD2dL9fmngwhsJv2sBKQLGfV
   yayzoGGxjFH2pgEfXbsOL8gF2NLnUhI/QD5wNYZDNZrjrJXTLP3/KuoVn
   zrjOYFGxfCmzxUAMmENq1nAKek5uriwEOfqYXPjT4c8ky/UPS/9mFPB7A
   sotsHWjmbIT7ekMB4bFD7+Ny0+hLPOqyM7ksPVzaf9NqV/OjBDPzgfQfh
   qd5S6F+kDMsS4yALeW7a/A2nbY4JJVeJVaaWiavehObrSgaENErP/swMn
   K5w0A6CQ2JEqPgq9j4JCfExQ7h2Jalsh2EW1feT2eSTYBP2RBR4CNsuqF
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="395079594"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="395079594"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 09:15:35 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="668108579"
X-IronPort-AV: E=Sophos;i="5.97,287,1669104000"; 
   d="scan'208";a="668108579"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga002.jf.intel.com with ESMTP; 10 Feb 2023 09:15:32 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id C9BF71C5; Fri, 10 Feb 2023 19:16:11 +0200 (EET)
Date:   Fri, 10 Feb 2023 19:16:11 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Sanjay R Mehta <Sanju.Mehta@amd.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, Basavaraj.Natikar@amd.com,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] thunderbolt: Disable CLx state for AMD Yellow Carp
 and Pink Sardine
Message-ID: <Y+Z72ytOTag5b9mX@black.fi.intel.com>
References: <1676043287-119829-1-git-send-email-Sanju.Mehta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1676043287-119829-1-git-send-email-Sanju.Mehta@amd.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Feb 10, 2023 at 09:34:47AM -0600, Sanjay R Mehta wrote:
> From: Sanjay R Mehta <sanju.mehta@amd.com>
> 
> AMD Yellow Carp and Pink Sardine don't support CLx state,
> hence disabling it.
> 
> Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> ---
>  drivers/thunderbolt/nhi.h    |  6 ++++++
>  drivers/thunderbolt/quirks.c |  6 ++++++
>  drivers/thunderbolt/tb.h     | 35 ++++++++++++++++++++++++++++++++---
>  3 files changed, 44 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/thunderbolt/nhi.h b/drivers/thunderbolt/nhi.h
> index b071802..3d8cfaf 100644
> --- a/drivers/thunderbolt/nhi.h
> +++ b/drivers/thunderbolt/nhi.h
> @@ -87,6 +87,12 @@ extern const struct tb_nhi_ops icl_nhi_ops;
>  #define PCI_DEVICE_ID_INTEL_RPL_NHI0			0xa73e
>  #define PCI_DEVICE_ID_INTEL_RPL_NHI1			0xa76d
>  
> +/* PCI IDs for AMD USB4 controllers */
> +#define PCI_DEVICE_ID_AMD_YELLOW_CARP_NHI0		0x162e
> +#define PCI_DEVICE_ID_AMD_YELLOW_CARP_NHI1		0x162f
> +#define PCI_DEVICE_ID_AMD_PINK_SARDINE_NHI0		0x1668
> +#define PCI_DEVICE_ID_AMD_PINK_SARDINE_NHI1		0x1669
> +
>  #define PCI_CLASS_SERIAL_USB_USB4			0x0c0340
>  
>  #endif
> diff --git a/drivers/thunderbolt/quirks.c b/drivers/thunderbolt/quirks.c
> index b5f2ec7..f38db02 100644
> --- a/drivers/thunderbolt/quirks.c
> +++ b/drivers/thunderbolt/quirks.c
> @@ -63,4 +63,10 @@ void tb_check_quirks(struct tb_switch *sw)
>  
>  		q->hook(sw);
>  	}
> +
> +	/*
> +	 * CLx is not supported on AMD USB4 Yellow Carp and Pink Sardine platforms.
> +	 */
> +	if (tb_switch_is_yellow_carp(sw->tb->nhi) || tb_switch_is_pink_sardine(sw->tb->nhi))

Instead of these, please add them to the tb_quirks[] array.

> +		sw->quirks |= QUIRK_NO_CLX;
>  }
> diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
> index f978697..d7988ad 100644
> --- a/drivers/thunderbolt/tb.h
> +++ b/drivers/thunderbolt/tb.h
> @@ -23,6 +23,11 @@
>  #define NVM_MAX_SIZE		SZ_512K
>  #define NVM_DATA_DWORDS		16
>  
> +/* Keep link controller awake during update */
> +#define QUIRK_FORCE_POWER_LINK_CONTROLLER		BIT(0)
> +/* Disable CLx if not supported */
> +#define QUIRK_NO_CLX					BIT(1)
> +
>  /**
>   * struct tb_nvm - Structure holding NVM information
>   * @dev: Owner of the NVM
> @@ -905,6 +910,30 @@ static inline bool tb_switch_is_tiger_lake(const struct tb_switch *sw)
>  	return false;
>  }
>  
> +static inline bool tb_switch_is_yellow_carp(const struct tb_nhi *nhi)
> +{
> +	if (nhi->pdev->vendor == PCI_VENDOR_ID_AMD) {
> +		switch (nhi->pdev->device) {
> +		case PCI_DEVICE_ID_AMD_YELLOW_CARP_NHI0:
> +		case PCI_DEVICE_ID_AMD_YELLOW_CARP_NHI1:
> +			return true;
> +		}
> +	}
> +	return false;
> +}
> +
> +static inline bool tb_switch_is_pink_sardine(const struct tb_nhi *nhi)
> +{
> +	if (nhi->pdev->vendor == PCI_VENDOR_ID_AMD) {
> +		switch (nhi->pdev->device) {
> +		case PCI_DEVICE_ID_AMD_PINK_SARDINE_NHI0:
> +		case PCI_DEVICE_ID_AMD_PINK_SARDINE_NHI1:
> +			return true;
> +		}
> +	}
> +	return false;
> +}
> +
>  /**
>   * tb_switch_is_usb4() - Is the switch USB4 compliant
>   * @sw: Switch to check
> @@ -997,6 +1026,9 @@ static inline bool tb_switch_is_clx_enabled(const struct tb_switch *sw,
>   */
>  static inline bool tb_switch_is_clx_supported(const struct tb_switch *sw)
>  {
> +	if (sw->quirks & QUIRK_NO_CLX)
> +		return false;
> +
>  	return tb_switch_is_usb4(sw) || tb_switch_is_titan_ridge(sw);
>  }
>  
> @@ -1254,9 +1286,6 @@ struct usb4_port *usb4_port_device_add(struct tb_port *port);
>  void usb4_port_device_remove(struct usb4_port *usb4);
>  int usb4_port_device_resume(struct usb4_port *usb4);
>  
> -/* Keep link controller awake during update */
> -#define QUIRK_FORCE_POWER_LINK_CONTROLLER		BIT(0)
> -
>  void tb_check_quirks(struct tb_switch *sw);
>  
>  #ifdef CONFIG_ACPI
> -- 
> 2.7.4
