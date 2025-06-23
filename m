Return-Path: <linux-usb+bounces-25005-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A8847AE3B1B
	for <lists+linux-usb@lfdr.de>; Mon, 23 Jun 2025 11:51:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D26CC3A431E
	for <lists+linux-usb@lfdr.de>; Mon, 23 Jun 2025 09:49:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00676238C1A;
	Mon, 23 Jun 2025 09:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W7QZvVbr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20520218E9F
	for <linux-usb@vger.kernel.org>; Mon, 23 Jun 2025 09:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750672193; cv=none; b=iQgVlGDQRKobEmfYaXU+ekrMKpb0BMG4G04yKVrHKHMfGwZOTv8S7w+ePL19nZ4jv/jUqUdmbSEJP4PnAXXmwtth9GaBMAF85XOXDBNo4PFSFrJy04Z7l/F7Lic3Fu4TlTFTZSMFEuPNHB3CFAXO5Hr32Q7UwfG67F6xcC6Yj0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750672193; c=relaxed/simple;
	bh=ePmqVM54dTapknJB15AB58E3mKcp8vfjWXdeF78Hvcc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fwnwhsgcnwScv+snKHBYO2NozFu9OEu7FizzSAak4JitJgaV7BcJ0vfKUFUniBKEllvxaBCFr6tQ3aB9d9T8EhwNXk9vhPwEvybcyDtl5b3RvpM7CfpAzjJLzrm4J6Fo5EJ9aQn+m8f9Finib1AyR8kEfj64fyZwc6PnO7mcZLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W7QZvVbr; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750672193; x=1782208193;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ePmqVM54dTapknJB15AB58E3mKcp8vfjWXdeF78Hvcc=;
  b=W7QZvVbr1TmYMOudC9ZwRCiH0m/6+yZajECmhqLQQlbrsil8mT8QJ3lc
   qCWOslH9rX+wEPvugCQ00lMu4eaNzy4w4QKkvhYWnB9HUPdUuLjojo7b4
   bmZW09kITjZSJffXmugDf6rX62wF3850w4I4mAZyuKvho6SxJk0IMRuxA
   v6eoUHyVWQEBTRg1WTp5rNl8k41Pu+F2CJ4DiTQThWgS4Qj6JXw1eVami
   ENAWWtVunyrk7vq02HNL+s3ZlZSNksrbuOh6E0Ln6thgRCwyaMcckDDjr
   +zLbZFWHfNXoMflzBOQaWB5MJKQe19KhlpN75vJnzsy+mtrix//8zwyVC
   w==;
X-CSE-ConnectionGUID: j5mEDTk/RBWXp4jMQbKKHw==
X-CSE-MsgGUID: f0d3yLdZStyDpuk85AiS8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="52741513"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="52741513"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2025 02:49:52 -0700
X-CSE-ConnectionGUID: V7ezqH+aRuCohTreziv2Dg==
X-CSE-MsgGUID: b1MJUNw9SzWxCqXlfJl4zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; 
   d="scan'208";a="152060033"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 23 Jun 2025 02:49:49 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id E8EB2108; Mon, 23 Jun 2025 12:49:47 +0300 (EEST)
Date: Mon, 23 Jun 2025 12:49:47 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Alok Tiwari <alok.a.tiwari@oracle.com>
Cc: westeri@kernel.org, michael.jamet@intel.com,
	heikki.krogerus@linux.intel.com, YehezkelShB@gmail.com,
	wonchung@google.com, andreas.noever@gmail.com,
	linux-usb@vger.kernel.org
Subject: Re: [QUERY] thunderbolt: Should usb4_port_device_add() return
 ERR_PTR() on component_add() failure?
Message-ID: <20250623094947.GW2824380@black.fi.intel.com>
References: <20250622140455.2884518-1-alok.a.tiwari@oracle.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250622140455.2884518-1-alok.a.tiwari@oracle.com>

Hi,

On Sun, Jun 22, 2025 at 07:04:51AM -0700, Alok Tiwari wrote:
> I noticed that in usb4_port_device_add(), when component_add() fails,
> the function logs an error and calls device_unregister(),
> but does not return an ERR_PTR(ret) immediately:
> Should this be changed to return ERR_PTR(ret); right after device_unregister()?
> 
> ret = component_add(&usb4->dev, &connector_ops);
> if (ret) {
>     dev_err(&usb4->dev, "failed to add component\n");
>     device_unregister(&usb4->dev);
>     // Missing return here?

Yes, I think it is the right thing to do.

Other option is that we don't call device_unregister() here and continue
because this is not fatal - it works just fine without the component
linkage. I actually prefer this one.

> }
> 
> Thanks,
> Alok
> 
> ---
> diff --git a/drivers/thunderbolt/usb4_port.c b/drivers/thunderbolt/usb4_port.c
> index 852a45fcd19d1..6db4a0c8e4496 100644
> --- a/drivers/thunderbolt/usb4_port.c
> +++ b/drivers/thunderbolt/usb4_port.c
> @@ -323,6 +323,7 @@ struct usb4_port *usb4_port_device_add(struct tb_port *port)
>         if (ret) {
>                 dev_err(&usb4->dev, "failed to add component\n");
>                 device_unregister(&usb4->dev);
> +               return ERR_PTR(ret);
>         }
> 
>         if (!tb_is_upstream_port(port))
> -- 
> 2.47.1

