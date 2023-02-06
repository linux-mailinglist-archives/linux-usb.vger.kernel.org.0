Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 604FE68BB85
	for <lists+linux-usb@lfdr.de>; Mon,  6 Feb 2023 12:31:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbjBFLbr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 6 Feb 2023 06:31:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjBFLbq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 6 Feb 2023 06:31:46 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4A3E5241
        for <linux-usb@vger.kernel.org>; Mon,  6 Feb 2023 03:31:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675683105; x=1707219105;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aWITIdhNu2mzF/ia0sAo0qNZnYx16EOcHcrrUL7fLes=;
  b=CWxvk7eJX1fA/O6rkcngmZKINishpt169jE6ZRySXDE0V2JoRMIXYRF3
   rD4E2g6HviupWE/abC8+Bxl5b0RxClA5QjT5kZzC+GFM1evfZSGFklB5w
   huUNUYTdse8QHQo33ZPWT/u22uJSNii3Dx3IM8SpHU4iJ+aBxab6mgIn7
   01HpuZwx+wajtG0Sm1G1MzPSIsqT4C7eMIVSH5kQm/EVb94Bhi01wNxz+
   snfK2U/VdxWVZeTYnYNZvg7xItvinvfqMhvSIEp48AtOn6r7AJRSnN2+r
   tUlyfsaiN7n8tqkOadzXdP/DYxS5Wl8wTOaq5zfWMXwYCGQL9oHBvaZxg
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="308825878"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="308825878"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 03:31:45 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10612"; a="809098353"
X-IronPort-AV: E=Sophos;i="5.97,276,1669104000"; 
   d="scan'208";a="809098353"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 06 Feb 2023 03:31:42 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 06 Feb 2023 13:31:42 +0200
Date:   Mon, 6 Feb 2023 13:31:41 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Jack Pham <quic_jackp@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>
Subject: Re: [PATCH v2] usb: roles: disable pm for role switch device
Message-ID: <Y+DlHUUMX6bACxA6@kuha.fi.intel.com>
References: <1675425314-13857-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1675425314-13857-1-git-send-email-quic_linyyuan@quicinc.com>
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_PASS,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Feb 03, 2023 at 07:55:14PM +0800, Linyu Yuan wrote:
> there is no PM operation for a role switch device,
> call device_set_pm_not_required() in usb_role_switch_register() to disable.
> 
> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
> v2: remove cc stable
> 
>  drivers/usb/roles/class.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/usb/roles/class.c b/drivers/usb/roles/class.c
> index eacb46e..b303c64 100644
> --- a/drivers/usb/roles/class.c
> +++ b/drivers/usb/roles/class.c
> @@ -344,6 +344,7 @@ usb_role_switch_register(struct device *parent,
>  	dev_set_drvdata(&sw->dev, desc->driver_data);
>  	dev_set_name(&sw->dev, "%s-role-switch",
>  		     desc->name ? desc->name : dev_name(parent));
> +	device_set_pm_not_required(&sw->dev);
>  
>  	ret = device_register(&sw->dev);
>  	if (ret) {
> -- 
> 2.7.4

-- 
heikki
