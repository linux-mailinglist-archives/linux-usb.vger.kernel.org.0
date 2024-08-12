Return-Path: <linux-usb+bounces-13323-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 485CD94E665
	for <lists+linux-usb@lfdr.de>; Mon, 12 Aug 2024 08:09:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EECA91F22303
	for <lists+linux-usb@lfdr.de>; Mon, 12 Aug 2024 06:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0262414D6FC;
	Mon, 12 Aug 2024 06:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vo7f1Dwr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB5E3715E
	for <linux-usb@vger.kernel.org>; Mon, 12 Aug 2024 06:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723442944; cv=none; b=F51246FceL7k/vzkA8/FHtN4fhePolo4573G57H/aKVBChsqJ5jWuAbyRq5TeJFarRg2KxaxLXFred13C+jQIPWHUNsHi4Qyl182FhC7NV9JUNpLW4EotyW50lj0PMjakG76rDawFd5BNKNHU3o/bZ6rlUP9IUOvLbI2Qw87+xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723442944; c=relaxed/simple;
	bh=Uj+5k8L2qg4D5bdZo4Rh+cdiQo5jJChaIQwKLINhaQM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M9cFXiV+EQ83IDxHWFAmOLZLeyXx/wOp1Y/XscfLoVvclTU2ItY7Yov+tgQfBioWD3cerl80w+uGPxR+ZS6h35nbqd1vkeYRzDtDgVCP/9sseHVQQIJTN5rQ3eUHGj0Qym4Z8dL+UxB7T5Qy/zQ0KgTIcrvdkKDkiuM0IENRtk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vo7f1Dwr; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723442942; x=1754978942;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Uj+5k8L2qg4D5bdZo4Rh+cdiQo5jJChaIQwKLINhaQM=;
  b=Vo7f1DwrJo2I2aw2tMCiyQKHXIuxuwsiv4283Xim/p2XivySLFGTHrMu
   /M6ySMp6y+4pnz3QSxeItPBt9StC/zEH3JGjArH1Sd20DFK0j78JEscPr
   KRaB29FI0b5NX8YvYzDQcVH+po8ToYvNpMeN726iefYwwWud3bicvbnTu
   Ej9GBowfl01yzTQ6+eeYBqlKsMD/By7nI2++jmD/OxkQDZJWkVOfCHWeg
   Hr9zzxZ7eXlIXvyQLrB2w1C1pyqdwIYOS0EMJAe+ri362qxuPGcfsPJaL
   EusMCUo7HA2xC8T4eCSKqIEZD8COCnHBB5iRDOZwicAwJiszcQP33XJtJ
   Q==;
X-CSE-ConnectionGUID: JCfLHWXNSguXrHOZJ969Tg==
X-CSE-MsgGUID: cJ8mIuREQJ6DyVFUJy9a/g==
X-IronPort-AV: E=McAfee;i="6700,10204,11161"; a="21663078"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="21663078"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2024 23:09:01 -0700
X-CSE-ConnectionGUID: MMFDrDUASmuxbiOmKHXpkg==
X-CSE-MsgGUID: d4Ly3+F9QKmZZ79Zs9hsGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; 
   d="scan'208";a="58117568"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by fmviesa008.fm.intel.com with SMTP; 11 Aug 2024 23:08:57 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 12 Aug 2024 09:08:56 +0300
Date: Mon, 12 Aug 2024 09:08:56 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, rdbabiera@google.com, linux@roeck-us.net,
	badhri@google.com, kyletso@google.com, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] Revert "usb: typec: tcpm: clear pd_event queue in
 PORT_RESET"
Message-ID: <Zrmm+KOGaG2GwRP/@kuha.fi.intel.com>
References: <20240809112901.535072-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240809112901.535072-1-xu.yang_2@nxp.com>

On Fri, Aug 09, 2024 at 07:29:01PM +0800, Xu Yang wrote:
> This reverts commit bf20c69cf3cf9c6445c4925dd9a8a6ca1b78bfdf.
> 
> During tcpm_init() stage, if the VBUS is still present after
> tcpm_reset_port(), then we assume that VBUS will off and goto safe0v
> after a specific discharge time. Following a TCPM_VBUS_EVENT event if
> VBUS reach to off state. TCPM_VBUS_EVENT event may be set during
> PORT_RESET handling stage. If pd_events reset to 0 after TCPM_VBUS_EVENT
> set, we will lost this VBUS event. Then the port state machine may stuck
> at one state.
> 
> Before:
> 
> [    2.570172] pending state change PORT_RESET -> PORT_RESET_WAIT_OFF @ 100 ms [rev1 NONE_AMS]
> [    2.570179] state change PORT_RESET -> PORT_RESET_WAIT_OFF [delayed 100 ms]
> [    2.570182] pending state change PORT_RESET_WAIT_OFF -> SNK_UNATTACHED @ 920 ms [rev1 NONE_AMS]
> [    3.490213] state change PORT_RESET_WAIT_OFF -> SNK_UNATTACHED [delayed 920 ms]
> [    3.490220] Start toggling
> [    3.546050] CC1: 0 -> 0, CC2: 0 -> 2 [state TOGGLING, polarity 0, connected]
> [    3.546057] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
> 
> After revert this patch, we can see VBUS off event and the port will goto
> expected state.
> 
> [    2.441992] pending state change PORT_RESET -> PORT_RESET_WAIT_OFF @ 100 ms [rev1 NONE_AMS]
> [    2.441999] state change PORT_RESET -> PORT_RESET_WAIT_OFF [delayed 100 ms]
> [    2.442002] pending state change PORT_RESET_WAIT_OFF -> SNK_UNATTACHED @ 920 ms [rev1 NONE_AMS]
> [    2.442122] VBUS off
> [    2.442125] state change PORT_RESET_WAIT_OFF -> SNK_UNATTACHED [rev1 NONE_AMS]
> [    2.442127] VBUS VSAFE0V
> [    2.442351] CC1: 0 -> 0, CC2: 0 -> 0 [state SNK_UNATTACHED, polarity 0, disconnected]
> [    2.442357] Start toggling
> [    2.491850] CC1: 0 -> 0, CC2: 0 -> 2 [state TOGGLING, polarity 0, connected]
> [    2.491858] state change TOGGLING -> SRC_ATTACH_WAIT [rev1 NONE_AMS]
> [    2.491863] pending state change SRC_ATTACH_WAIT -> SNK_TRY @ 200 ms [rev1 NONE_AMS]
> [    2.691905] state change SRC_ATTACH_WAIT -> SNK_TRY [delayed 200 ms]
> 
> Fixes: bf20c69cf3cf ("usb: typec: tcpm: clear pd_event queue in PORT_RESET")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index cce39818e99a..4b02d6474259 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -5655,7 +5655,6 @@ static void run_state_machine(struct tcpm_port *port)
>  		break;
>  	case PORT_RESET:
>  		tcpm_reset_port(port);
> -		port->pd_events = 0;
>  		if (port->self_powered)
>  			tcpm_set_cc(port, TYPEC_CC_OPEN);
>  		else
> -- 
> 2.34.1

-- 
heikki

