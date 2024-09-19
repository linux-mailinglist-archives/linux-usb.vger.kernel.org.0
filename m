Return-Path: <linux-usb+bounces-15235-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 5771C97C72B
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2024 11:38:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03DB01F288A8
	for <lists+linux-usb@lfdr.de>; Thu, 19 Sep 2024 09:38:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9EFE199FD7;
	Thu, 19 Sep 2024 09:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l4HshIq3"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7705219D072
	for <linux-usb@vger.kernel.org>; Thu, 19 Sep 2024 09:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726738708; cv=none; b=pzKWJmo/UI3uBTHtsjJbPLkCYalFqhJ5XhWCzRmGaaqn4TpqPFZrK4yX8wv72eCzGIckR3PqxkkcbsltPwZYs2g29uqrpPe7qvvty4XlwigKOxyPRyuL/hi+SIOroqJHls940CX3lmM05kofiUeFLf0Vlt0M71xz0IA4HBn8rro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726738708; c=relaxed/simple;
	bh=6zgIlf2g4FasRB9SZXjDti0mnh5q9PH51K4Miuw73eA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lLAqw+cUUvd8Uy6mK0C1RWFoBB2Mw4O7sYBot+E/VgMzmdpBMBz0wvI7RB5PZqP4XNNZyJ5yQysO/fjjlKJiedH+QmbAQ3Qk3LCXOQRf+fKIqG7rBRuRIvpu5nirX3BaJ/tOyBBXiyUP8g91WTa+jJ3bHlcEdilwCrajPcwJAM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l4HshIq3; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726738695; x=1758274695;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=6zgIlf2g4FasRB9SZXjDti0mnh5q9PH51K4Miuw73eA=;
  b=l4HshIq3ENTAALapfannG6xUsw3KhWk+p1ggfnVv2ASZRwA7BXnA4kOG
   CEmrraYFNvcssSG4WbiWrp1v6uxdG3tJYh35UnKv8qkwE8Ektkpgu5x5g
   QOEUYezMZE6Ht9s6K3KFD3Lo7+OOe8n83xrgfi4+98G+LfQ1+jYl+z1v4
   HL2uXf8DI7rolCnNgDRpAaDZ3zMt7LyA6hRYXgGjvBBbp2E4v1KsO8EHk
   AC9ORLOGArMOSExDQ7UB0Nu6PR+O/myIUbjmgt+cGsMdljomY1EjcLLIt
   2r1Uh2TtEeeQbhBflwiOhGDwAx18117fqdS7tGFp8V3VY/6gGg4SCvbnP
   w==;
X-CSE-ConnectionGUID: F3tSyI+OTgSSEmJSghVvyQ==
X-CSE-MsgGUID: elgHhSX+SGSR5N2sPXik9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11199"; a="36819144"
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; 
   d="scan'208";a="36819144"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 02:38:14 -0700
X-CSE-ConnectionGUID: ldBceI2yT+upVN9vD1az3A==
X-CSE-MsgGUID: u8/7oFQkSsutQR0x0zrhGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,241,1719903600"; 
   d="scan'208";a="74855169"
Received: from kuha.fi.intel.com ([10.237.72.185])
  by orviesa004.jf.intel.com with SMTP; 19 Sep 2024 02:38:11 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Thu, 19 Sep 2024 12:38:09 +0300
Date: Thu, 19 Sep 2024 12:38:09 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: =?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee@kernel.org>, Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Pavan Holla <pholla@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Subject: Re: [PATCH v6 6/8] usb: typec: cros_ec_ucsi: Add netlink
Message-ID: <ZuvxAQmMsnIYZMTP@kuha.fi.intel.com>
References: <20240910101527.603452-1-ukaszb@chromium.org>
 <20240910101527.603452-7-ukaszb@chromium.org>
 <ZuGkMiE3sHOpo/Ci@kuha.fi.intel.com>
 <CALwA+Nb6zWe-WOgcu8-ni5OCx9XxerVhi76fZze2KP_kmFVonA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALwA+Nb6zWe-WOgcu8-ni5OCx9XxerVhi76fZze2KP_kmFVonA@mail.gmail.com>

On Sun, Sep 15, 2024 at 12:08:45AM +0200, Łukasz Bartosik wrote:
> On Wed, Sep 11, 2024 at 4:09 PM Heikki Krogerus
> <heikki.krogerus@linux.intel.com> wrote:
> >
> > Hi,
> >
> > On Tue, Sep 10, 2024 at 10:15:25AM +0000, Łukasz Bartosik wrote:
> > > Add netlink to ChromeOS UCSI driver to allow forwarding
> > > of UCSI messages to userspace for debugging and testing
> > > purposes.
> >
> > Why does this need to be cros_ec specific?
> >
> 
> You're right. Netlink does not have to be cros_ec_ucsi specific.
> Would you like to have netlink in typec_ucsi ?

Does it need to be netlink? We would then have tracepoints, the
custom debugfs interface, and this netlink interface.

I think this information could be exposed via trancepoints (unless I'm
missing something).

Br,

-- 
heikki

