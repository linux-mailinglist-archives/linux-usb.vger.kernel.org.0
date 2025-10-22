Return-Path: <linux-usb+bounces-29517-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C6963BFBD80
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 14:28:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 92D2E18C2DA1
	for <lists+linux-usb@lfdr.de>; Wed, 22 Oct 2025 12:29:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AE3C8343D71;
	Wed, 22 Oct 2025 12:28:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="N04xW4y1"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F33727B50C
	for <linux-usb@vger.kernel.org>; Wed, 22 Oct 2025 12:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761136115; cv=none; b=Mdsn5i64wTtSx9PBrP8hhiabgGN/9Lo0eHnQkJTsA/VNUGw7H06JmCs/4mlLlo4b21rNnnTH2MEe+uva5ONoZHO4yb9ie65iwEhtlp2b5HToP6vzn6utch2usdYt/yI4OQfwVB42gOBVfqw1xcYUMCJGzS9vyvEaJLr1INeYiTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761136115; c=relaxed/simple;
	bh=3Wy5tbbBgeG6ETQ8yBIhpGKKhiUwz1VpOh4Gp3T7Tys=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sc/QDbA8mENS8TJV7rBTlDhyf7pH1ekVsr6p5NJ+XYgpiDv+rsu3sayqtvEBs3c3T9haZJ9EQAm9ZKg387aKqe5hoq3YROg9Lb1hAqMr3MGmhcoMqjhXfS3TTBbVo8xkxguHcdkzhuNlVtVCWMvEtdlr2GBTkJfP8vEC8v1xE1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=N04xW4y1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DEBAC4CEE7;
	Wed, 22 Oct 2025 12:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1761136114;
	bh=3Wy5tbbBgeG6ETQ8yBIhpGKKhiUwz1VpOh4Gp3T7Tys=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N04xW4y1YfOpjpSnZpLrFjWCouUAN/hs966FW6QZseB1GgTJGQ94rXfeJxkACL3O6
	 tVX9oDE6BTdiiMrImix5hhXGmStqNzEBm1ZoZjxsb+LAqaqAy5LfRkETnbKOHX0b7d
	 N6Qm+5mhaCoWdVkU26lPNUif+Uk7VxoJIKr64MAk=
Date: Wed, 22 Oct 2025 14:28:31 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: "Ruinskiy, Dima" <dima.ruinskiy@intel.com>
Cc: Oliver Neukum <oliver@neukum.org>, Oliver Neukum <oneukum@suse.com>,
	Maciej =?utf-8?Q?=C5=BBenczykowski?= <maze@google.com>,
	Terry Moore <tmm@mcci.com>, linux-usb@vger.kernel.org
Subject: Re: cdc_ncm driver and NCM 1.1 revision
Message-ID: <2025102259-purebred-amulet-b6d2@gregkh>
References: <6c22b4d5-7d6d-41ab-9b00-9dccf3ec8963@intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6c22b4d5-7d6d-41ab-9b00-9dccf3ec8963@intel.com>

On Wed, Oct 22, 2025 at 03:18:07PM +0300, Ruinskiy, Dima wrote:
> Hi Oliver, how are you?
> 
> You are listed at the maintainer for the cdc_ncm and usbnet Linux drivers.
> 
> The cdc_ncm driver has only had a handful of changes in recent years, as the
> spec too has not been updated for some time.
> 
> Recently, the USB NCM workgroup has finished and published a major revision
> to the spec - NCM 1.1 - with several new features as well as data path
> updates.
> 
> The new revision is available here:
> https://www.usb.org/document-library/usb-communications-class-subclass-specifications-network-control-model-devices-v11
> 
> An "executive summary" is here:
> https://www.linkedin.com/posts/mcci-corporation_usb-if-compliance-workshop-139-activity-7335815355266719744-BAdf/
> 
> There are on-going initiatives to update the Windows and MacOS NCM drivers
> to support the new 1.1 features.
> 
> Do you know of any plans to update the Linux driver as well? I expect there
> will be some inquiries as soon as the first NCM1.1-capable devices appear,
> which may happen already next year.

Patches are always gladly accepted to add new support like this, thanks!  :)

greg k-h

