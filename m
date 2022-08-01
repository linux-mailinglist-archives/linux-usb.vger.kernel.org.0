Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3DC96586737
	for <lists+linux-usb@lfdr.de>; Mon,  1 Aug 2022 12:07:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229927AbiHAKHP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 1 Aug 2022 06:07:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229818AbiHAKHN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 1 Aug 2022 06:07:13 -0400
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C91E217E3A
        for <linux-usb@vger.kernel.org>; Mon,  1 Aug 2022 03:07:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1659348432; x=1690884432;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fhb7xhldC89L8cgu4hlg0XX5aW/vqDM/yAHBIJiYKV4=;
  b=C+r+EjrNnyhiTLd7sYGotBNN1HWrmHeBHCOcgnVvIbvAWHNRHT97dGYl
   L6FWMjNkLVi3/K5Lf3X6i3fmS9i5eJeFXxUDrUBj3VmM1Z0kRq8PoWkY2
   T3vG/WyK7PvfWaaSAShX/ODos/u2eZ+9FA23fQwOlE2S3nMsIMUW6ml9b
   xrRpcc3TyxWXDOYuNBdLikP9Gw+Juk3U7YubFRbA0lD7WsOfHaPUNusuD
   po4qAjKRVzWa8jtkgsR5vVTZPmi4E3dC2GCYJRPZuybRFSP5Uqnx/+qUs
   9pznZuXLShCZ2iO7ldP7rDQATuaSjg9w3jG3jSS3KGUVkGCtUY2DeJFTj
   A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10425"; a="353113448"
X-IronPort-AV: E=Sophos;i="5.93,206,1654585200"; 
   d="scan'208";a="353113448"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2022 03:07:12 -0700
X-IronPort-AV: E=Sophos;i="5.93,206,1654585200"; 
   d="scan'208";a="691410264"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2022 03:07:09 -0700
Received: by lahna (sSMTP sendmail emulation); Mon, 01 Aug 2022 13:07:07 +0300
Date:   Mon, 1 Aug 2022 13:07:07 +0300
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Sanjay R Mehta <Sanju.Mehta@amd.com>
Cc:     andreas.noever@gmail.com, michael.jamet@intel.com,
        YehezkelShB@gmail.com, Basavaraj.Natikar@amd.com,
        mario.limonciello@amd.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 RESEND] thunderbolt: Add DP out resource when DP
 tunnel is discovered.
Message-ID: <Yuely4dKR6Xy5Mdk@lahna>
References: <1657215088-6185-1-git-send-email-Sanju.Mehta@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1657215088-6185-1-git-send-email-Sanju.Mehta@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Thu, Jul 07, 2022 at 12:31:28PM -0500, Sanjay R Mehta wrote:
> From: Sanjay R Mehta <sanju.mehta@amd.com>
> 
> If the boot firmware implements a connection manager of its
> own it may create a DP tunnel and will be handed off to Linux
> CM, but the DP out resource is not saved in the dp_resource
> list.
> 
> This patch adds tunnelled DP out port to the dp_resource list
> once the DP tunnel is discovered.
> 
> Signed-off-by: Sanjay R Mehta <sanju.mehta@amd.com>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> 
> ---
> v2: Re-ordering the function declaration as per Greg's comment.
> 
> ---
>  drivers/thunderbolt/tb.c     | 15 +++++++++++++++
>  drivers/thunderbolt/tb.h     |  1 +
>  drivers/thunderbolt/tunnel.c |  2 ++
>  3 files changed, 18 insertions(+)
> 
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index 9a3214f..dcd0c3e 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -1006,6 +1006,21 @@ static void tb_dp_resource_unavailable(struct tb *tb, struct tb_port *port)
>  	tb_tunnel_dp(tb);
>  }
>  
> +void tb_dp_resource_available_discovered(struct tb *tb, struct tb_port *port)

Please call this tb_discover_dp_resources() make it static and call it
right after tb_discover_tunnels() in tb_start() or in
tb_discover_tunnels().

Thanks!
