Return-Path: <linux-usb+bounces-13081-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 568CD9476E5
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 10:08:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11066281087
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2024 08:08:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEE8513C906;
	Mon,  5 Aug 2024 08:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PARZU8+a"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D365B2AD04
	for <linux-usb@vger.kernel.org>; Mon,  5 Aug 2024 08:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722845299; cv=none; b=lPzpbEnKj8xtTuciKCwxYHcZkTAVwPkMgZaJZQA7CydrCXcdm0Fjp5gzdE+4Hzgp6JoiZiMczoWK5cBv1I48QqCx2/TDpO00p4M7G0c2r139JQm5Fa8+oEqwPK9CzFY4oXm/JzVWLb6zAyfetN4g8t+7CUuZI8STXysmMhwHUkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722845299; c=relaxed/simple;
	bh=+r+kKRi+x1IgWghgOPsM2zdoxic28I7lwNebXkalWO8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VWxyKuawf1kJYZMTyXjs3IbQSUcz/HFUJV+LZ1/6HrBCk/o+sbJICpCAuQi7DKgIlV1NVoDVJ3D4jdcIESTQRzu+nsVRHa35TbI6NsMPkfVxFDhcFH2L0bVJlXcWFw890OddDp+4jqPxO0C9qU6O/7U0/redMf8A0vbh4lQ6hxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PARZU8+a; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722845298; x=1754381298;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=+r+kKRi+x1IgWghgOPsM2zdoxic28I7lwNebXkalWO8=;
  b=PARZU8+aUzaZMaMIwwoZJnkY9B9sU7r+bnt1RDWfPhVmenCDNVQs9v8o
   8KwDIRJr4CC9p/lArD7FBzeTZDR3nt6dEYFWsqY759FU7tSQ0mn8Erlbx
   hpKw8MWsF3fmykIU1YYAIJbWr0FBYeJtNpOYEfwYF4Sq7D7lVQz86sAiJ
   41HYeIdtEc4NQJilYvMY2T12H8960JW6kduIkv23Q6ccFxwn3wXZsCbSW
   v1eIExRVBkmxiWo3m73Bah9V1ufOoAnAjdK9xNf32iZRs/N/0qGaXR4Dl
   vQcdwS0eWssfiEDaleqPx0TAvgQoyp7CTdB29tPjCpMlCatWMkZ3JcF7U
   Q==;
X-CSE-ConnectionGUID: 5m0eAvZjSMyhqOeMMlHXjw==
X-CSE-MsgGUID: Tww/41YIRmO+qRgop9WxFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11154"; a="24560335"
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; 
   d="scan'208";a="24560335"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2024 01:08:15 -0700
X-CSE-ConnectionGUID: YcSsq8HqRBOiGdVeYKuoWw==
X-CSE-MsgGUID: ONbFGdw/SNqOtJDoSqOpog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,264,1716274800"; 
   d="scan'208";a="56002536"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by orviesa009.jf.intel.com with SMTP; 05 Aug 2024 01:08:12 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 05 Aug 2024 11:08:10 +0300
Date: Mon, 5 Aug 2024 11:08:10 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, rdbabiera@google.com, linux@roeck-us.net,
	badhri@google.com, kyletso@google.com,
	sebastian.reichel@collabora.com, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com
Subject: Re: [PATCH] usb: typec: tcpm: avoid sink goto SNK_UNATTACHED state
 if not received source capability message
Message-ID: <ZrCIakdGq42n44Wg@kuha.fi.intel.com>
References: <20240802064156.1846768-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240802064156.1846768-1-xu.yang_2@nxp.com>

On Fri, Aug 02, 2024 at 02:41:56PM +0800, Xu Yang wrote:
> Since commit (122968f8dda8 usb: typec: tcpm: avoid resets for missing
> source capability messages), state will change from SNK_WAIT_CAPABILITIES
> to SNK_WAIT_CAPABILITIES_TIMEOUT. We need to change SNK_WAIT_CAPABILITIES
> -> SNK_READY path to SNK_WAIT_CAPABILITIES_TIMEOUT -> SNK_READY
> accordingly. Otherwise, the sink port will never change to SNK_READY state
> if the source does't have PD capability.
> 
> [  503.547183] pending state change SNK_WAIT_CAPABILITIES -> SNK_WAIT_CAPABILITIES_TIMEOUT @ 310 ms [rev3 NONE_AMS]
> [  503.857239] state change SNK_WAIT_CAPABILITIES -> SNK_WAIT_CAPABILITIES_TIMEOUT [delayed 310 ms]
> [  503.857254] PD TX, header: 0x87
> [  503.862440] PD TX complete, status: 2
> [  503.862484] state change SNK_WAIT_CAPABILITIES_TIMEOUT -> SNK_UNATTACHED [rev3 NONE_AMS]
> 
> Fixes: 122968f8dda8 ("usb: typec: tcpm: avoid resets for missing source capability messages")
> Cc: stable@vger.kernel.org
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpm.c b/drivers/usb/typec/tcpm/tcpm.c
> index 26f9006e95e1..cce39818e99a 100644
> --- a/drivers/usb/typec/tcpm/tcpm.c
> +++ b/drivers/usb/typec/tcpm/tcpm.c
> @@ -4515,7 +4515,7 @@ static inline enum tcpm_state hard_reset_state(struct tcpm_port *port)
>  		return ERROR_RECOVERY;
>  	if (port->pwr_role == TYPEC_SOURCE)
>  		return SRC_UNATTACHED;
> -	if (port->state == SNK_WAIT_CAPABILITIES)
> +	if (port->state == SNK_WAIT_CAPABILITIES_TIMEOUT)
>  		return SNK_READY;
>  	return SNK_UNATTACHED;
>  }
> -- 
> 2.34.1

-- 
heikki

