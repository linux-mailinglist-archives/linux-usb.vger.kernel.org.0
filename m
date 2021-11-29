Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B4E7461032
	for <lists+linux-usb@lfdr.de>; Mon, 29 Nov 2021 09:32:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242465AbhK2IgG (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 29 Nov 2021 03:36:06 -0500
Received: from mga11.intel.com ([192.55.52.93]:28026 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S239174AbhK2IeG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 29 Nov 2021 03:34:06 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10182"; a="233412795"
X-IronPort-AV: E=Sophos;i="5.87,272,1631602800"; 
   d="scan'208";a="233412795"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2021 00:28:33 -0800
X-IronPort-AV: E=Sophos;i="5.87,272,1631602800"; 
   d="scan'208";a="458356568"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.163])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2021 00:28:28 -0800
Received: by lahna (sSMTP sendmail emulation); Mon, 29 Nov 2021 10:28:25 +0200
Date:   Mon, 29 Nov 2021 10:28:25 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Gil Fine <gil.fine@intel.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, linux-usb@vger.kernel.org, lukas@wunner.de
Subject: Re: [PATCH 6/7] thunderbolt: Enable CLx for Titan Ridge device
Message-ID: <YaSPKZzif4Dx1ctC@lahna>
References: <20211125143821.16558-1-gil.fine@intel.com>
 <20211125143821.16558-7-gil.fine@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211125143821.16558-7-gil.fine@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Thu, Nov 25, 2021 at 04:38:20PM +0200, Gil Fine wrote:
> diff --git a/drivers/thunderbolt/tb_regs.h b/drivers/thunderbolt/tb_regs.h
> index 08f1213ea565..4786e15241c8 100644
> --- a/drivers/thunderbolt/tb_regs.h
> +++ b/drivers/thunderbolt/tb_regs.h
> @@ -307,6 +307,10 @@ struct tb_regs_port_header {
>  #define TMU_ADP_CS_3_UDM			BIT(29)
>  #define TMU_ADP_CS_6				0x06
>  #define TMU_ADP_CS_6_DTS			BIT(1)
> +/* Used for Titan Ridge only */
> +#define TMU_ADP_CS_6_DISABLE_TMU_OBJ_MASK	GENMASK(3, 2)
> +#define TMU_ADP_CS_6_DISABLE_TMU_OBJ_CL1	BIT(2)
> +#define TMU_ADP_CS_6_DISABLE_TMU_OBJ_CL2	BIT(3)

I think these should be part of the Thunderbolt (legacy) specific
registers as below (these are not in the USB4 spec).

>  
>  /* Lane adapter registers */
>  #define LANE_ADP_CS_0				0x00
> @@ -447,8 +451,33 @@ struct tb_regs_hop {
>  } __packed;
>  
>  /* TMU Thunderbolt 3 registers */
> -#define TB_TIME_VSEC_3_CS_26		0x1a
> -#define TB_TIME_VSEC_3_CS_26_TD		BIT(22)
> +#define TB_TIME_VSEC_3_CS_9			0x9
> +#define TB_TIME_VSEC_3_CS_9_TMU_OBJ_MASK	GENMASK(17, 16)
> +#define TB_TIME_VSEC_3_CS_26			0x1a
> +#define TB_TIME_VSEC_3_CS_26_TD			BIT(22)
