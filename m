Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8983568D0A1
	for <lists+linux-usb@lfdr.de>; Tue,  7 Feb 2023 08:34:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229874AbjBGHeR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Feb 2023 02:34:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbjBGHeQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Feb 2023 02:34:16 -0500
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1736CD522
        for <linux-usb@vger.kernel.org>; Mon,  6 Feb 2023 23:34:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675755255; x=1707291255;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OgtYsofrcc+AAD+fm+0k+og9OQm1+d+ZHF4Gg+GTkHU=;
  b=a2ww/VycfaGpMdeMQDH4lrNzNxXzetfgSiLNZib8DVOHRgEzVdS5TSbz
   O/pSKCpMRqR2awM3HXuxmteCXcteRmpixaO3NvZCvf3LbfCq5sNQrWJzu
   dhRxxwCVMAaVqmVHGPqD05ftyu+JXRSnLZjtyVCBSiip9z60S4xp6u08i
   anKt9ZTPBWyBxB3qd1MoOIMcC5SbcsXMcFe3Dc553w4KLm1Om9AjkQAd9
   r2JQroowx/7m27ceO7XcbweJ0Fqh/LFBQie+0tLG918Iqslloc9QuevKB
   X6tZe+GZGGluyTdCqaHug0uKe0QTdROnXuOvU71MeHR8OV+M3S7vd7V2Q
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="313080249"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="313080249"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2023 23:34:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10613"; a="809420399"
X-IronPort-AV: E=Sophos;i="5.97,278,1669104000"; 
   d="scan'208";a="809420399"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmsmga001.fm.intel.com with SMTP; 06 Feb 2023 23:34:10 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 07 Feb 2023 09:34:09 +0200
Date:   Tue, 7 Feb 2023 09:34:08 +0200
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Linyu Yuan <quic_linyyuan@quicinc.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, Jack Pham <quic_jackp@quicinc.com>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Pratham Pratap <quic_ppratap@quicinc.com>
Subject: Re: [PATCH] usb: typec: disable pm for typec class devices
Message-ID: <Y+H+8Nt/5bgTBv4Y@kuha.fi.intel.com>
References: <1675752122-8147-1-git-send-email-quic_linyyuan@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1675752122-8147-1-git-send-email-quic_linyyuan@quicinc.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 07, 2023 at 02:42:02PM +0800, Linyu Yuan wrote:
> as there is no pm operation, call device_set_pm_not_required() to disable
> all typec class devices.
> 
> Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> ---
>  drivers/usb/typec/class.c   | 5 +++++
>  drivers/usb/typec/mux.c     | 2 ++
>  drivers/usb/typec/pd.c      | 3 +++
>  drivers/usb/typec/retimer.c | 1 +
>  4 files changed, 11 insertions(+)

Now this is just boilerplate.

Why not propose this to be done in core for every new device that
doesn't have a bus, and that doesn't have the pm ops assigned in the
device type?


> diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
> index ed3d070..b75ec6d 100644
> --- a/drivers/usb/typec/class.c
> +++ b/drivers/usb/typec/class.c
> @@ -548,6 +548,7 @@ typec_register_altmode(struct device *parent,
>  	alt->adev.dev.groups = alt->groups;
>  	alt->adev.dev.type = &typec_altmode_dev_type;
>  	dev_set_name(&alt->adev.dev, "%s.%u", dev_name(parent), id);
> +	device_set_pm_not_required(&alt->adev.dev);

Note that for alt modes you can't do this. They can be bind to
drivers - there is a bus for them.

thanks,

-- 
heikki
