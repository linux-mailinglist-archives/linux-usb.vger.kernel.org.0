Return-Path: <linux-usb+bounces-1348-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 451287BF64C
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 10:44:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 76D7E1C20B3A
	for <lists+linux-usb@lfdr.de>; Tue, 10 Oct 2023 08:44:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0239B14F6D;
	Tue, 10 Oct 2023 08:44:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="byD3ycCC"
X-Original-To: linux-usb@vger.kernel.org
Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E841C9449
	for <linux-usb@vger.kernel.org>; Tue, 10 Oct 2023 08:44:08 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31908B6;
	Tue, 10 Oct 2023 01:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696927446; x=1728463446;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=P3e3h6rEHckwaYQiJNlFyKL2I8caGpDPVq6en05d0+U=;
  b=byD3ycCCKNyYPr+40ZShJFG+Gm1T1djBfImnJdJKIjZHXJDhpcz5rXPz
   zIia4+6FJySOhVDX2V/dP+YYllc9ga/VLqXuThFzFLBskqrBhoveVuSEf
   aalN3IRddz0jW+/PaEuguRUWQVRTbEmmG0K2ohM8BqXpMIlqg8gxYxqBy
   Vv4jmwJhfUQEybh8PTdlTjyrD+EHL80oowRpJ+kWmswuLFtgvDj4y5afg
   tLV6y/99B7dnAr/Motcpo+L2hl1LyHt0vyKkUydDS1PY1TT1PLCm5xkfo
   7eboU4R0keBrode+ronfR0bZB/iEYcGN43sG5+Nj/1brug2UA8CGel80n
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="387178842"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="387178842"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2023 01:44:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="730003225"
X-IronPort-AV: E=Sophos;i="6.03,212,1694761200"; 
   d="scan'208";a="730003225"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by orsmga006.jf.intel.com with SMTP; 10 Oct 2023 01:44:02 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 10 Oct 2023 11:44:02 +0300
Date: Tue, 10 Oct 2023 11:44:02 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: RD Babiera <rdbabiera@google.com>
Cc: gregkh@linuxfoundation.org, badhri@google.com,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v1] usb: typec: altmodes/displayport: Signal hpd low when
 exiting mode
Message-ID: <ZSUO0rkmTsRkV361@kuha.fi.intel.com>
References: <20231009210057.3773877-2-rdbabiera@google.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231009210057.3773877-2-rdbabiera@google.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
	RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

On Mon, Oct 09, 2023 at 09:00:58PM +0000, RD Babiera wrote:
> Upon receiving an ACK for a sent EXIT_MODE message, the DisplayPort
> driver currently resets the status and configuration of the port partner.
> The hpd signal is not updated despite being part of the status, so the
> Display stack can still transmit video despite typec_altmode_exit placing
> the lanes in a Safe State.
> 
> Set hpd to low when a sent EXIT_MODE message is ACK'ed.
> 
> Fixes: 0e3bb7d6894d ("usb: typec: Add driver for DisplayPort alternate mode")
> Cc: stable@vger.kernel.org
> Signed-off-by: RD Babiera <rdbabiera@google.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/altmodes/displayport.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
> index f503cb4cd721..718da02036d8 100644
> --- a/drivers/usb/typec/altmodes/displayport.c
> +++ b/drivers/usb/typec/altmodes/displayport.c
> @@ -307,6 +307,11 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
>  			typec_altmode_update_active(alt, false);
>  			dp->data.status = 0;
>  			dp->data.conf = 0;
> +			if (dp->hpd) {
> +				drm_connector_oob_hotplug_event(dp->connector_fwnode);
> +				dp->hpd = false;
> +				sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
> +			}
>  			break;
>  		case DP_CMD_STATUS_UPDATE:
>  			dp->data.status = *vdo;
> 
> base-commit: 1053c4a4b8fcbd28386e80347e7c82d4d617e352
> -- 
> 2.42.0.609.gbb76f46606-goog

-- 
heikki

