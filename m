Return-Path: <linux-usb+bounces-16230-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C88399E936
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2024 14:14:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA47C1F24712
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2024 12:14:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A77F71F12E2;
	Tue, 15 Oct 2024 12:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YS5gVRyO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD7E1EBA0A
	for <linux-usb@vger.kernel.org>; Tue, 15 Oct 2024 12:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728994355; cv=none; b=r9ORCl5kjXheabf5GJ6A8J2uhzVhZObvNFqycWt7cuodXlSaShjn27K6/7ExV89JIoq2n2wJAfvpS2djwPO++PjptxKl/SJJZGTYJoN1UQpIVaZtowgn9nHCoymz1ssSWEnvJvEYMdfkh6dWxLO4CtvDXs54hpYm+Jyy/vGBB38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728994355; c=relaxed/simple;
	bh=kOPCwHZuLHCix8J0l1ASzg+/n3Z8S8YiN6ISgVS/n8Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XJxxyckw2alsdconJe5hg0MQVRKBI0cVr5x9VQN4PvMcg/3zgUrScPslsbbOqhbrvLg2Mk87372BcPzJ2RxNmJiQcs3roAAH7zbwXLDBDPadQ9udxYgb7xoBUyIo8LIrz4lWVykk/r45DZW2NTJSgiUfUQ0prGE4u7gtvOendUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YS5gVRyO; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728994354; x=1760530354;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=kOPCwHZuLHCix8J0l1ASzg+/n3Z8S8YiN6ISgVS/n8Q=;
  b=YS5gVRyObW9y2Oqg+Ivi3di9oS0J5jaR3MrNF31QgCaudWCSs09Ux1Lb
   bKRresw+1f50wFHqbWr7D3H46XpWRA0ORbBZDjrx7aNgPiXnqrJeXE98t
   oZfrnAg9PuOmC51JqPuNDAJ/bUig89pp7PwK+QJPWOnuRk6qvyvyQHtd/
   DM3llbdlS2dVAeZHER6M1X+/4qg1xZp3ubCLIu4VXVIJa7pmU3CmPEKrF
   wibSA/sQeG0jXCMTAkrNhtJk86UeSTKkMZj6A8NiOw+SkjZY2rJH8+IO0
   NT1E5R0cwiRGzZKB45rYkKDa6e8yqQfdXfK4WLFTL79lTaJeviBB3k8g0
   A==;
X-CSE-ConnectionGUID: ZmVC+lmPQl+fad2f4aBq+g==
X-CSE-MsgGUID: I8W97l71TFi8pNXQ2yoJ/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28172919"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28172919"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 05:12:34 -0700
X-CSE-ConnectionGUID: 6dKvTPEgT1WTxNcede5tAA==
X-CSE-MsgGUID: eGmKZi6wSq2cmKyn1N4CaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; 
   d="scan'208";a="82665238"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa005.jf.intel.com with SMTP; 15 Oct 2024 05:12:30 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 15 Oct 2024 15:12:29 +0300
Date: Tue, 15 Oct 2024 15:12:29 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 1/4] usb: typec: Add attribute file showing the
 supported USB modes of the port
Message-ID: <Zw5cLZkRtvyaCzJE@kuha.fi.intel.com>
References: <20241011124402.3306994-1-heikki.krogerus@linux.intel.com>
 <20241011124402.3306994-2-heikki.krogerus@linux.intel.com>
 <2024101155-goes-demote-f6f6@gregkh>
 <ZwkvJkOZHvvLMxvj@kuha.fi.intel.com>
 <CANFp7mU3NPEio2NE3TRXf1C_Ckd-5wPbxnvRnNSjRyTozKDPEA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANFp7mU3NPEio2NE3TRXf1C_Ckd-5wPbxnvRnNSjRyTozKDPEA@mail.gmail.com>

> > > > @@ -240,6 +251,7 @@ struct typec_partner_desc {
> > > >   * @port_type_set: Set port type
> > > >   * @pd_get: Get available USB Power Delivery Capabilities.
> > > >   * @pd_set: Set USB Power Delivery Capabilities.
> > > > + * @default_usb_mode_set: USB Mode to be used by default with Enter_USB Message
> > > >   */
> > > >  struct typec_operations {
> > > >     int (*try_role)(struct typec_port *port, int role);
> > > > @@ -250,6 +262,7 @@ struct typec_operations {
> > > >                          enum typec_port_type type);
> > > >     struct usb_power_delivery **(*pd_get)(struct typec_port *port);
> > > >     int (*pd_set)(struct typec_port *port, struct usb_power_delivery *pd);
> > > > +   int (*default_usb_mode_set)(struct typec_port *port, enum usb_mode mode);
> > >
> > > Naming is hard, but usually it's "noun_verb" so wouldn't this be just
> > > "mode_set_default"?  We know it's usb :)
> > >
> > > But why default, why not just "mode_set"?  or "set_mode" given you have
> > > "try_role" here, but then you have "pd_set".  Ick, I don't know, it's
> > > your code, so your call, nevermind...
> >
> > I think I'll just change it this back to the way it was in the last
> > version, and drop "default" from the name.
> 
> What's being set underneath is what USB mode to enter on the next
> reset or attach -- i.e. the default USB mode to enter. So appropriate
> naming here may be one of usb_set_default, usb_set_next. Dropping
> "usb" makes less sense vs dropping "mode", which could also refer to
> alternate modes so I'd prefer we don't call it mode_set.

I'll keep it the way it is now. This is kernel internal stuff, so we
can always change it later.

thanks,

-- 
heikki

