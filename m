Return-Path: <linux-usb+bounces-2548-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4377E138E
	for <lists+linux-usb@lfdr.de>; Sun,  5 Nov 2023 14:11:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D1C161C2096B
	for <lists+linux-usb@lfdr.de>; Sun,  5 Nov 2023 13:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA82EBE5D;
	Sun,  5 Nov 2023 13:11:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="VR8srdr7"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4205EBE4D
	for <linux-usb@vger.kernel.org>; Sun,  5 Nov 2023 13:11:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 360A3C433C8;
	Sun,  5 Nov 2023 13:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1699189868;
	bh=f3tAoxlXPtB73QJ4FMpBtJFaUePv690lCN7xyl+CGGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VR8srdr7r9/lfw6vvOTx7TY8JUsa3KuaFXxEVQytd1ZKNG/iMyJhb27k6YiyN2qAt
	 QJEpZCWfJsAl4RGxBAbBNDHZdkSRD/lef2x68rLDyX+faRLl8951l3aNAX+M2f1q4I
	 bG3WtkeAVJe7cyBr4P42ImzHjd699gb6iBiwgeaY=
Date: Sun, 5 Nov 2023 14:11:02 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Fabian Melzow <fabian.melzow@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: 0bda:b812 USB "3.0" WLAN devices only report a maximum of 480
 Mbps
Message-ID: <2023110534-fester-schematic-818a@gregkh>
References: <20231105130215.2b669c8b@ping>
 <2023110540-unseemly-mobilize-9e82@gregkh>
 <20231105134909.6c3f28d1@ping>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231105134909.6c3f28d1@ping>

On Sun, Nov 05, 2023 at 01:49:09PM +0100, Fabian Melzow wrote:
> Am Sun, 5 Nov 2023 13:20:38 +0100
> schrieb Greg KH <gregkh@linuxfoundation.org>:
> 
> > On Sun, Nov 05, 2023 at 01:02:15PM +0100, Fabian Melzow wrote:
> > > These devices should report 5 Gbps for USB 3.0 in the Binary Object
> > > Store Descriptor, but don't do so.  
> > 
> > Why do you think these should report 5 Gbps?  If the device descriptor
> > does not show it, there's nothing that we can do about it in the
> > operating system, sorry.
> 
> Thanks. I don't look at the USB specification for USB >2.0, which
> was long times ago and then only for a user space program and thought
> that it at least theoretically could be possible to set the device
> speed at some kind of initialization.

There might be some vendor-specific way of doing this, and then the
device resets itself, but other than that, no, descriptors are a static
description of the device's capabilities.

> > > Maybe it is possible to add a software fix for this hardware
> > > problem, so I report it here.  
> > 
> > What exactly is the hardware problem?  What is not working "properly"
> > for them?
> 
> All 0bda:b812 USB-WLAN-devices seems to only operate at 480 Mbps,
> but have a WLAN-chip which supports 780 Mbps at maximum.

Are you sure that those devices really can run at 480 Mbps?  Perhaps the
chip can support higher, but the firmware on the device, and the other
stuff in the device does not?

thanks,

greg k-h

