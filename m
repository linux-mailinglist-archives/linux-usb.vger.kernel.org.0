Return-Path: <linux-usb+bounces-17686-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C9DA9D0DB1
	for <lists+linux-usb@lfdr.de>; Mon, 18 Nov 2024 11:04:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 40F8E1F229A5
	for <lists+linux-usb@lfdr.de>; Mon, 18 Nov 2024 10:04:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 614241922F2;
	Mon, 18 Nov 2024 10:04:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="alZ+GpNi"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1059718E03A;
	Mon, 18 Nov 2024 10:04:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731924243; cv=none; b=Ya+n5cmhRf2t0dF1+/FhWVQViW9iykKe2GTAZAY19sUvKydfvAIsqcePJji03qYplJpoUAhOPzuJG7IBOe4LBKjZqObZT+9PFFtd5QT9ewF0h/8ZCM0z0wNcyNqnt2nk2m8BbGdxtI2T+swF3NFUfbZewfRUz/gHOY6rfwCjsRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731924243; c=relaxed/simple;
	bh=zgyIH/dPqO9AR+6eGxLLGKeaGjr33djGd8vinQ9wohk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pbXukL+Zdoy+hL5v7yg7VFmfFir6CvRhm0cov0OMrBwvRzqlYaePlsvh4Sm3v2rdevNrn2A268EgLa3Dy8K/TSbDKdaTaYiT3juHo9DJzYfEhQHVWf8DtE5eKjO4dh64LwYS/8QIxgJgVmkLRI+9Ye62JZI8x5aGkAEUG/j3U0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=alZ+GpNi; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731924243; x=1763460243;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=zgyIH/dPqO9AR+6eGxLLGKeaGjr33djGd8vinQ9wohk=;
  b=alZ+GpNi4VKNmAEUf/+iQsxUrFK737WyoSt1Wk7G9fGV4CoD0ho0Z/M9
   qPuy5JIn2/8BcR6mi9rcPKD7wyd+0fm50Wjl5YV4amXghvDSKZA++RPxh
   R4/jbgs3pT10TogDAiwiRCKxTn9gx1tqa9Zv2Kk6xwMd4GNYutNnTgeLq
   zOU1mrBBwyWYrymrHDtSyAj8km0MIRgrVLLiD4Up/Kj0te/wQEYryuJpo
   TGAS0PAfOQ7PEamq4p5lqEP2IjIVow6K95rm+JDbw7vBig3XidhSLl7OL
   QT2G3BWYI15LtC9uY0qnBNMyAquJgaSYqruvZnRBjVygsGOjFXcR1BbMc
   A==;
X-CSE-ConnectionGUID: Kw2NaMpoRDOKs62bTfJUMQ==
X-CSE-MsgGUID: 9aIkFJ8ISPOr06eVAJlXsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="32011317"
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="32011317"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 02:04:01 -0800
X-CSE-ConnectionGUID: yFgWo+ZHQpu439qQW1HqsA==
X-CSE-MsgGUID: pY47fUwNQT6bFIK227wFyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,163,1728975600"; 
   d="scan'208";a="89594260"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by fmviesa010.fm.intel.com with SMTP; 18 Nov 2024 02:03:57 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Mon, 18 Nov 2024 12:03:56 +0200
Date: Mon, 18 Nov 2024 12:03:56 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Oliver Facklam <oliver.facklam@zuehlke.com>
Cc: Biju Das <biju.das@bp.renesas.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	Benedict von Heyl <benedict.vonheyl@zuehlke.com>,
	Mathis Foerst <mathis.foerst@zuehlke.com>,
	Michael Glettig <michael.glettig@zuehlke.com>
Subject: Re: [PATCH v2 2/4] usb: typec: hd3ss3220: use typec_get_fw_cap() to
 fill typec_cap
Message-ID: <ZzsRDK_9LZLs8Hf3@kuha.fi.intel.com>
References: <20241114-usb-typec-controller-enhancements-v2-0-362376856aea@zuehlke.com>
 <20241114-usb-typec-controller-enhancements-v2-2-362376856aea@zuehlke.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241114-usb-typec-controller-enhancements-v2-2-362376856aea@zuehlke.com>

On Thu, Nov 14, 2024 at 09:02:07AM +0100, Oliver Facklam wrote:
> The type, data, and prefer_role properties were previously hard-coded
> when creating the struct typec_capability.
> 
> Use typec_get_fw_cap() to populate these fields based on the
> respective fwnode properties, if present.
> 
> Signed-off-by: Oliver Facklam <oliver.facklam@zuehlke.com>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/hd3ss3220.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/typec/hd3ss3220.c b/drivers/usb/typec/hd3ss3220.c
> index 56f74bf70895ca701083bde44a5bbe0b691551e1..e581272bb47de95dee8363a5491f543354fcbbf8 100644
> --- a/drivers/usb/typec/hd3ss3220.c
> +++ b/drivers/usb/typec/hd3ss3220.c
> @@ -264,7 +264,14 @@ static int hd3ss3220_probe(struct i2c_client *client)
>  	typec_cap.type = TYPEC_PORT_DRP;
>  	typec_cap.data = TYPEC_PORT_DRD;
>  	typec_cap.ops = &hd3ss3220_ops;
> -	typec_cap.fwnode = connector;
> +
> +	/*
> +	 * Try to get properties from connector,
> +	 * but continue with defaults anyway if they are not found
> +	 */
> +	ret = typec_get_fw_cap(&typec_cap, connector);
> +	if (ret != 0 && ret != -EINVAL && ret != -ENXIO)
> +		goto err_put_role;
>  
>  	hd3ss3220->port = typec_register_port(&client->dev, &typec_cap);
>  	if (IS_ERR(hd3ss3220->port)) {
> 
> -- 
> 2.34.1

-- 
heikki

