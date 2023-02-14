Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ECB0069589A
	for <lists+linux-usb@lfdr.de>; Tue, 14 Feb 2023 06:42:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230008AbjBNFm2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Feb 2023 00:42:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229713AbjBNFm1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Feb 2023 00:42:27 -0500
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8AC18CDC2
        for <linux-usb@vger.kernel.org>; Mon, 13 Feb 2023 21:42:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676353344; x=1707889344;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vHqSQzUkcvj+D4jPKF07wdZ5skjzet1qzVrBL60lBaM=;
  b=PLJ93sPREU+7esOichN2bHrFv/8uYd2au7SaFd/n2fIerxeAFZRm+XVL
   dSYy9inzy1V0sLQOx24s7YJP6/T/2bHIcNnLsotdsuWxKEXeJV+lgP6pM
   yfB+FHn30CVOEZ9Db8P9sZeOSFCfMrXRbOoUQ3B/Jhb/PKpuKLkivdJxL
   7Dgbm7EMLZlUitQpgB0CJDlA2tMpKRfHfj9fM+76VmsF+YMtCImJot3AT
   dUC6LVJVCUKsUgYLuhGWjUm3seL2P8b6jdKOsX6iL9KDFU5FhgAZjmcCf
   k135Yjoah0PTYIFHxND6Zud7p0Zojx+eXvm8pCRtyvMUca3P1K8//CmuN
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="333218410"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="333218410"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 21:42:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="671110334"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="671110334"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 21:42:22 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id CE8F91A6; Tue, 14 Feb 2023 07:43:01 +0200 (EET)
Date:   Tue, 14 Feb 2023 07:43:01 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Sanjay R Mehta <Sanju.Mehta@amd.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, Basavaraj.Natikar@amd.com,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v3] thunderbolt: Add quirk to disable CLx
Message-ID: <Y+sfZbVjjFiSf9BU@black.fi.intel.com>
References: <1676311911-1952-1-git-send-email-Sanju.Mehta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1676311911-1952-1-git-send-email-Sanju.Mehta@amd.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Mon, Feb 13, 2023 at 12:11:51PM -0600, Sanjay R Mehta wrote:
> From: Sanjay R Mehta <sanju.mehta@amd.com>
> 
> Add QUIRK_NO_CLX to disable the CLx state for hardware which
> doesn't supports it.
> 
> AMD Yellow Carp and Pink Sardine don't support CLx state,
> hence disabling it using QUIRK_NO_CLX.
> 
> Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> ---
>  drivers/thunderbolt/quirks.c | 19 +++++++++++++++++--
>  drivers/thunderbolt/tb.h     | 11 ++++++++---
>  2 files changed, 25 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/thunderbolt/quirks.c b/drivers/thunderbolt/quirks.c
> index b5f2ec7..47ff4b8 100644
> --- a/drivers/thunderbolt/quirks.c
> +++ b/drivers/thunderbolt/quirks.c
> @@ -20,6 +20,11 @@ static void quirk_dp_credit_allocation(struct tb_switch *sw)
>  	}
>  }
>  
> +static void quirk_clx_disable(struct tb_switch *sw)
> +{
> +	sw->quirks |= QUIRK_NO_CLX;
> +}
> +
>  struct tb_quirk {
>  	u16 hw_vendor_id;
>  	u16 hw_device_id;
> @@ -37,6 +42,13 @@ static const struct tb_quirk tb_quirks[] = {
>  	 * DP buffers.
>  	 */
>  	{ 0x8087, 0x0b26, 0x0000, 0x0000, quirk_dp_credit_allocation },
> +	/*
> +	 * CLx is not supported on AMD USB4 Yellow Carp and Pink Sardine platforms.
> +	 */
> +	{ 0x0000, 0x0000, PCI_VENDOR_ID_AMD, 0x162e, quirk_clx_disable },
> +	{ 0x0000, 0x0000, PCI_VENDOR_ID_AMD, 0x162f, quirk_clx_disable },
> +	{ 0x0000, 0x0000, PCI_VENDOR_ID_AMD, 0x1668, quirk_clx_disable },
> +	{ 0x0000, 0x0000, PCI_VENDOR_ID_AMD, 0x1669, quirk_clx_disable },
>  };
>  
>  /**
> @@ -47,6 +59,7 @@ static const struct tb_quirk tb_quirks[] = {
>   */
>  void tb_check_quirks(struct tb_switch *sw)
>  {
> +	struct tb_nhi *nhi = sw->tb->nhi;
>  	int i;
>  
>  	for (i = 0; i < ARRAY_SIZE(tb_quirks); i++) {
> @@ -56,9 +69,11 @@ void tb_check_quirks(struct tb_switch *sw)
>  			continue;
>  		if (q->hw_device_id && q->hw_device_id != sw->config.device_id)
>  			continue;
> -		if (q->vendor && q->vendor != sw->vendor)
> +		if (q->vendor && (q->vendor != sw->vendor &&
> +				  q->vendor != nhi->pdev->vendor))

Can't you use the router ID here not the NHI PCI ID?

>  			continue;
> -		if (q->device && q->device != sw->device)
> +		if (q->device && (q->device != sw->device &&
> +				  q->device != nhi->pdev->device))

Ditto here.
