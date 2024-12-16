Return-Path: <linux-usb+bounces-18526-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id B711F9F2D41
	for <lists+linux-usb@lfdr.de>; Mon, 16 Dec 2024 10:47:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D6F16188AE46
	for <lists+linux-usb@lfdr.de>; Mon, 16 Dec 2024 09:47:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D206202C2A;
	Mon, 16 Dec 2024 09:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CCAQKcUL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 408301FF60E
	for <linux-usb@vger.kernel.org>; Mon, 16 Dec 2024 09:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734342434; cv=none; b=Oz9HBkKwP2gyiStIIkwOTvjXzjby0q8mGKnFiQV/eZ5VsRK7ubOxJ3VDddzmQCWODkXA3DmS3DFetUEtPCyFy3sGEo17oB46Fyo0AF2rZs54b6E5rakrJHgjK/IgO3z8xfJ/O5RDFKvGLhLQR51ljRrIcVrRAXWDyiO3dey9AWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734342434; c=relaxed/simple;
	bh=H3US26Z2Ha2pA+ZOZccLIZV15VJcqYdfWc9wFYx60Uw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ozuralUN2AmzdUnuKeuuvQQYDeFh7hQWeAvxATgSQGi8KMqhnGr3c9KBNT0zQOae2gHUYQhkn9Kl/mTrn703DUf7I25XUg07bX6zbAEh4icCVtP71x67uudY5h/S8YDpAp1ofbj/tuZuAwLqefCuQbii+mPhd8N1XR+Oc0nZTuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CCAQKcUL; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734342432; x=1765878432;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=H3US26Z2Ha2pA+ZOZccLIZV15VJcqYdfWc9wFYx60Uw=;
  b=CCAQKcUL1bVlIkKRS4u7boXo2uxhQgo0NbxVqIqo1Yq3uxD+G9iMFjPg
   UQ/iOcHf7rjPx0XAdRA0MKes2lz5cXScEaRV8V+EJpJP+oXiGSwtxqS3O
   bQB9XyP7VBLHPrtN6X4XDE/6oxluiAvCNjif9kmo/B5H9bmvWCxUU8viM
   b2Khx4Qo+rrn+NmVM/CTwrFcVXd3lMNljn8s64XoEpGbYXEnEVfoaz5EA
   BELbT80j2LQmAV3qduRbPthDfMmkiZyPwCdnrE7X2Y79V9lefO5b3s7Ne
   t4SY4JNVC2QCTnK7/qOAGpyZ6yOuu4GWfxo7bl4gBxLkxNnE6QTnb0QPS
   g==;
X-CSE-ConnectionGUID: jyj6B8peRZupfo9nHHbubQ==
X-CSE-MsgGUID: 0nWXNPjPRdegq7P8muMTwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11282"; a="45721808"
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="45721808"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 01:47:11 -0800
X-CSE-ConnectionGUID: vQinTd/3TBOUlWq/SSwjVg==
X-CSE-MsgGUID: P3Akwp28Q5SJLKXxpNMAqA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134485256"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa001.jf.intel.com with SMTP; 16 Dec 2024 01:47:09 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 16 Dec 2024 11:47:07 +0200
Date: Mon, 16 Dec 2024 11:47:07 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Xu Yang <xu.yang_2@nxp.com>
Cc: gregkh@linuxfoundation.org, andre.draszik@linaro.org,
	m.felsch@pengutronix.de, rdbabiera@google.com,
	emanuele.ghidoli@toradex.com, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, jun.li@nxp.com,
	Badhri Jagan Sridharan <badhri@google.com>
Subject: Re: [PATCH] usb: typec: tcpci: set local CC to Rd only when cc1/cc2
 status is Rp
Message-ID: <Z1_3G1Iqz-A01FJr@kuha.fi.intel.com>
References: <20241211105753.1205312-1-xu.yang_2@nxp.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211105753.1205312-1-xu.yang_2@nxp.com>

On Wed, Dec 11, 2024 at 06:57:53PM +0800, Xu Yang wrote:
> The cc1 and cc2 status returned by tcpci_get_cc() may be TYPEC_CC_OPEN
> or TYPEC_CC_RA. So don't assume it's just TYPEC_CC_RD or TYPEC_CC_RP_*.
> This will let local port present Rd on CC only when cc1/cc2 status is
> TYPEC_CC_RP_*.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>

Acked-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/tcpci.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/tcpci.c b/drivers/usb/typec/tcpm/tcpci.c
> index ed32583829be..2f15734a5043 100644
> --- a/drivers/usb/typec/tcpm/tcpci.c
> +++ b/drivers/usb/typec/tcpm/tcpci.c
> @@ -282,7 +282,7 @@ static int tcpci_set_polarity(struct tcpc_dev *tcpc,
>  			if (cc2 == TYPEC_CC_RD)
>  				/* Role control would have the Rp setting when DRP was enabled */
>  				reg |= FIELD_PREP(TCPC_ROLE_CTRL_CC2, TCPC_ROLE_CTRL_CC_RP);
> -			else
> +			else if (cc2 >= TYPEC_CC_RP_DEF)
>  				reg |= FIELD_PREP(TCPC_ROLE_CTRL_CC2, TCPC_ROLE_CTRL_CC_RD);
>  		} else {
>  			reg &= ~TCPC_ROLE_CTRL_CC1;
> @@ -290,7 +290,7 @@ static int tcpci_set_polarity(struct tcpc_dev *tcpc,
>  			if (cc1 == TYPEC_CC_RD)
>  				/* Role control would have the Rp setting when DRP was enabled */
>  				reg |= FIELD_PREP(TCPC_ROLE_CTRL_CC1, TCPC_ROLE_CTRL_CC_RP);
> -			else
> +			else if (cc1 >= TYPEC_CC_RP_DEF)
>  				reg |= FIELD_PREP(TCPC_ROLE_CTRL_CC1, TCPC_ROLE_CTRL_CC_RD);
>  		}
>  	}

-- 
heikki

