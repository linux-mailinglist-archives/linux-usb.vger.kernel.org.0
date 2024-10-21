Return-Path: <linux-usb+bounces-16469-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F87D9A5A99
	for <lists+linux-usb@lfdr.de>; Mon, 21 Oct 2024 08:43:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7909F1C20F5B
	for <lists+linux-usb@lfdr.de>; Mon, 21 Oct 2024 06:43:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F46B1CF5DA;
	Mon, 21 Oct 2024 06:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AA2KNmqF"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF7C1CF291
	for <linux-usb@vger.kernel.org>; Mon, 21 Oct 2024 06:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729493019; cv=none; b=PFRBWi2GBh3dzzJqNP/XAXzzesif6xqP+2/v+a885toRn3ivRWanj8ibzPZOK52jJI7p38u2HDn8TqddpOcEfFLRLnV0CrmVsNQmG551IFIjuhWciKnaNn74X3vsL4YYJV1DDIqtv1U8RwlK0VgkPz6Tm/RExQneIxIYqF0qD4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729493019; c=relaxed/simple;
	bh=rEKbJiIk96MORRyOJ73dz25V9tNXlzLv+aPzi6iQY6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F6xvepz17SyvjzGBkzmM76DjLgYJ0c9Ehk4nIY+ySmIWbDNyAmJreBHk6aYW+Ojj748WDtszzKsWn1fb9Jik2sEnMB+EU2u2KlmzQdspMX3HPwFxAqrKHnUj2JRY8l1W+4vKlOfln9zfh09H/+R4NJz7jJinoXibSOtBIX+a7jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AA2KNmqF; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729493017; x=1761029017;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rEKbJiIk96MORRyOJ73dz25V9tNXlzLv+aPzi6iQY6c=;
  b=AA2KNmqFvDVEVQHH3R3FrJuenF0zJ0nreMWvwUS9hqFetG3wRY5ffIjg
   fxhQhPkx0zF9yW3uA+CzzNOznELP/9hyM9/BsGbziMW5/cFxtLPitue/m
   caNovrFtoTFCB8aqyOyeQiBMdgSIEZpTA6H6JWAQOZ1IwSIivrIY+wSK9
   D/9n09afx86F+XFnHacZ7Mr1Aj4ZkN5UxvGPQqIYKTGPPu16u7Ej4gf0H
   3xo/vna3ZjJqIDHQzEgviW6qZ0Amu5V/nuZPQhxj4U5uoSmPw8y4AiVZ2
   uv9MyW06yyvsMCd88nLT39EcTQupxy/kNT61oXN/1Uw41MmEi9cL7huB1
   g==;
X-CSE-ConnectionGUID: 4n4qTqs2ThGClf2meAeiCg==
X-CSE-MsgGUID: vbaEyB4zS2qywcQCI3FXyA==
X-IronPort-AV: E=McAfee;i="6700,10204,11231"; a="32878078"
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; 
   d="scan'208";a="32878078"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 23:43:36 -0700
X-CSE-ConnectionGUID: mtJ1T2/dSDCbiF4L7/Z5uA==
X-CSE-MsgGUID: PAIAi44DThqH2So0ypsWVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,220,1725346800"; 
   d="scan'208";a="79501020"
Received: from black.fi.intel.com ([10.237.72.28])
  by fmviesa008.fm.intel.com with ESMTP; 20 Oct 2024 23:43:35 -0700
Received: by black.fi.intel.com (Postfix, from userid 1001)
	id 768FF301; Mon, 21 Oct 2024 09:43:33 +0300 (EEST)
Date: Mon, 21 Oct 2024 09:43:33 +0300
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Yehezkel Bernat <YehezkelShB@gmail.com>,
	Michael Jamet <michael.jamet@intel.com>,
	Lukas Wunner <lukas@wunner.de>,
	Andreas Noever <andreas.noever@gmail.com>
Cc: Gil Fine <gil.fine@linux.intel.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] thunderbolt: Honor TMU requirements in the domain when
 setting TMU mode
Message-ID: <20241021064333.GV275077@black.fi.intel.com>
References: <20241011113133.3286723-1-mika.westerberg@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241011113133.3286723-1-mika.westerberg@linux.intel.com>

On Fri, Oct 11, 2024 at 02:31:33PM +0300, Mika Westerberg wrote:
> From: Gil Fine <gil.fine@linux.intel.com>
> 
> Currently, when configuring TMU (Time Management Unit) mode of a given
> router, we take into account only its own TMU requirements ignoring
> other routers in the domain. This is problematic if the router we are
> configuring has lower TMU requirements than what is already configured
> in the domain.
> 
> In the scenario below, we have a host router with two USB4 ports: A and
> B. Port A connected to device router #1 (which supports CL states) and
> existing DisplayPort tunnel, thus, the TMU mode is HiFi uni-directional.
> 
> 1. Initial topology
> 
>           [Host]
>          A/
>          /
>  [Device #1]
>    /
> Monitor
> 
> 2. Plug in device #2 (that supports CL states) to downstream port B of
>    the host router
> 
>          [Host]
>         A/    B\
>         /       \
>  [Device #1]    [Device #2]
>    /
> Monitor
> 
> The TMU mode on port B and port A will be configured to LowRes which is
> not what we want and will cause monitor to start flickering.
> 
> To address this we first scan the domain and search for any router
> configured to HiFi uni-directional mode, and if found, configure TMU
> mode of the given router to HiFi uni-directional as well.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Gil Fine <gil.fine@linux.intel.com>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Applied to thunderbolt.git/fixes.

