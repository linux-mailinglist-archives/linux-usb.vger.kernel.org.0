Return-Path: <linux-usb+bounces-16231-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 49B6399E94B
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2024 14:15:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BF7B1C22E24
	for <lists+linux-usb@lfdr.de>; Tue, 15 Oct 2024 12:15:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C81D41F7070;
	Tue, 15 Oct 2024 12:13:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V8V1pbat"
X-Original-To: linux-usb@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D26311EF08E
	for <linux-usb@vger.kernel.org>; Tue, 15 Oct 2024 12:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728994422; cv=none; b=UkZc97GyLYwdWFRrHKColfvmq+IwRCsQzTgAzIHIfGcAud5171VzelT0+yvTD0uEJ0/XSunfd1ZSnD4qhagXyqwomRc24I7JNWQNrOi4gxwYNhb4m2tmKV68RltAgPpqXX08mSfJwHtosw9ep4ssezguOZo607G20E3Qmb8CG0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728994422; c=relaxed/simple;
	bh=hcN1wVA8u4ZOReFbc9qb+CjCpeuZKBAKtc+VCaBMNuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eKzeXLwBmbs6AQyssg/dLsinYL29F3A4bCxN97gQpfBoc+3oWgTalCxzTjc99lCrDgUbJyopuTD4QeMWtaa87NganvCFThluxTPr32YXsSdBBF1CgoF4mL5Z14WiaBZFWkT2e4OXXL8tP/AA+ABSoYiWYekTmL3HlImhJypPPFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V8V1pbat; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728994420; x=1760530420;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=hcN1wVA8u4ZOReFbc9qb+CjCpeuZKBAKtc+VCaBMNuU=;
  b=V8V1pbatV/fNQBpqyCUhpV2Q/u8VPdLZIklJ6CP/wuTnMwwgeV40rwYy
   67rlEs2e4iHRtugbkmP1A68yU2U3wiKxcvSGx7UQW6+LePSiDq8ffLoLV
   7dPCbdf7yx4ovUTsIu/KeYVIN5hU2lsxrjLUEzEputqCOImAxCkgSXb7S
   m63YDyAMK7zvGwJZaSMnwFWKkS9+NfydTQIl1BtttVAwpyPbV8T7aoUa0
   BhYO94aW43buuX3mXEtrLFxusGUbzsg1joFFoOTulhnnD9/irq9FolpTA
   xoXfwoTLmq091PvShHVuAcog1AvDU4u2UtqiZ7dDkBdIBm5/GWtxETLPF
   Q==;
X-CSE-ConnectionGUID: qz7ionFURx+y/8iwhjH7Ng==
X-CSE-MsgGUID: FXd+qDYxQyWr79hoVGX4og==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28472537"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28472537"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2024 05:13:40 -0700
X-CSE-ConnectionGUID: LipcZwUjSem3IB2j8D6LTw==
X-CSE-MsgGUID: dBkG2QEySHed/AvkyOd7XA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,205,1725346800"; 
   d="scan'208";a="108670640"
Received: from kuha.fi.intel.com ([10.237.72.152])
  by orviesa002.jf.intel.com with SMTP; 15 Oct 2024 05:13:37 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 15 Oct 2024 15:13:36 +0300
Date: Tue, 15 Oct 2024 15:13:36 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 2/4] usb: typec: Add attribute file showing the USB
 Modes of the partner
Message-ID: <Zw5ccOM8hAfLFd2U@kuha.fi.intel.com>
References: <20241011124402.3306994-1-heikki.krogerus@linux.intel.com>
 <20241011124402.3306994-3-heikki.krogerus@linux.intel.com>
 <2024101149-body-urologist-6262@gregkh>
 <ZwkwXWCD0xval8Wu@kuha.fi.intel.com>
 <CANFp7mXLWhnX2KST-OkWXMQ32RP=eiFYrGfxdgZuvjbpkq4w7Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANFp7mXLWhnX2KST-OkWXMQ32RP=eiFYrGfxdgZuvjbpkq4w7Q@mail.gmail.com>

> > > > +void typec_partner_set_usb_mode(struct typec_partner *partner, enum usb_mode mode)
> > > > +{
> > > > +   if (!partner || partner->usb_mode == mode)
> > > > +           return;
> > > > +
> > > > +   partner->usb_capability |= BIT(mode - 1);
> > > > +   partner->usb_mode = mode;
> > > > +   sysfs_notify(&partner->dev.kobj, NULL, "usb_mode");
> > >
> > > Who is listening for this and what are they going to do with the
> > > information?
> >
> > I'll drop it, unless Abhishek, you guys would have use for it. Let me
> > know. I'll send v4 next week.
> 
> I think you are ok to remove this. We would care about this value when
> registering the partner and when activating a specific USB mode. With
> the latter, we can just depend on the synchronous nature of
> usb_mode_store (i.e. we can check the result after writing to the
> sysfs file).

Okay. I'll drop it.

thanks,

-- 
heikki

