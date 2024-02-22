Return-Path: <linux-usb+bounces-6897-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C8D985FD08
	for <lists+linux-usb@lfdr.de>; Thu, 22 Feb 2024 16:51:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0519C1F27A7A
	for <lists+linux-usb@lfdr.de>; Thu, 22 Feb 2024 15:51:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCCC5151CDC;
	Thu, 22 Feb 2024 15:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LV71sEZE"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3459814E2FC
	for <linux-usb@vger.kernel.org>; Thu, 22 Feb 2024 15:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708617055; cv=none; b=GTFGPorrfHmCr6srGJ2C9Tu3O1n2DFXXIbMY8vClshwuGOBVWMpAk14uYuzECPGi5BriVgAdAVr1f0p+FKSbgcVKhV4t/DXP5h4R8+gtpKrv5b2uhSJ4gJOIZINWnRFyc7v3Eqctnp0YasTSZynsRdTkfOyy4TJnOCS6zC65El0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708617055; c=relaxed/simple;
	bh=WvXHPDPoYRyZt/1IHEf23DgfclGbcpCUEnZMcKMRw/0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uaH9zL6+z9ELmil7LM6YSs2a9sr3np4J7/2E6mmSnKjwcX9p8C5NpblVB/SSPMItdLtQR/+HND2S5IvjzaCoDzUausvD5TQrfLlLD7ZSK5TZuMYLm1UoUuJMbTUISpNcJ7vVGQyBpYRM+fiKlfxfDZfsenvku6C9958zP+enp8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LV71sEZE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38136C43390;
	Thu, 22 Feb 2024 15:50:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1708617054;
	bh=WvXHPDPoYRyZt/1IHEf23DgfclGbcpCUEnZMcKMRw/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LV71sEZEgWX/4gvHSHmTrTWfXZHolZbJoiBqJr0mJM3JduUdZfPIDIqCd2qluLpgW
	 ud0WlfoZGBaz2cROTfBRJtEkLSLJ5tq0/QykqCVp0WERKhBPWoqiptdq/ibcqqkCtC
	 F+qp2JpPMhAI3mXB/OP5f7K/wAIC8w/1bYoybVPU=
Date: Thu, 22 Feb 2024 16:50:51 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: linux-usb@vger.kernel.org, stern@rowland.harvard.edu
Subject: Re: [PATCH 1/2] usb: usb-acpi: Set port connect type of not
 connectable ports correctly
Message-ID: <2024022230-gusty-tactics-34d1@gregkh>
References: <20240222133819.4149388-1-mathias.nyman@linux.intel.com>
 <2024022238-caddie-fanning-8ab5@gregkh>
 <fc15052f-c5de-0136-484e-c3ac735ae799@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fc15052f-c5de-0136-484e-c3ac735ae799@linux.intel.com>

On Thu, Feb 22, 2024 at 04:46:16PM +0200, Mathias Nyman wrote:
> On 22.2.2024 16.06, Greg KH wrote:
> > On Thu, Feb 22, 2024 at 03:38:18PM +0200, Mathias Nyman wrote:
> > > Ports with  _UPC (USB Port Capability) ACPI objects stating they are
> > > "not connectable" are not wired to any connector or internal device.
> > > They only exist inside the host controller.
> > > 
> > > These ports may not have an ACPI _PLD (Physical Location of Device)
> > > object.
> > > 
> > > Rework the code so that _UPC is read even if _PLD does not exist, and
> > > make sure the port->connect_type is set to "USB_PORT_NOT_USED" instead
> > > of "USB_PORT_CONNECT_TYPE_UNKNOWN".
> > > 
> > > Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>
> > 
> > Does patch 2/2 need this?  If so, why isn't it marked for stable?
> 
> 2/2 alone fixes the real world port peering problem seen.
> 
> This is something I stumbled upon while debugging that issue.
> This patch just makes sure we don't skip marking some unused ports as
> unused due to how we parse ACPI tables.

Ok, so should patch 1/2 go to usb-next and patch 2/2 go to usb-linus?

confused,

greg k-h

