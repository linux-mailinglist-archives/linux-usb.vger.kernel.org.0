Return-Path: <linux-usb+bounces-2546-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB5C97E1350
	for <lists+linux-usb@lfdr.de>; Sun,  5 Nov 2023 13:20:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5C9EE2813D6
	for <lists+linux-usb@lfdr.de>; Sun,  5 Nov 2023 12:20:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BFD49BA46;
	Sun,  5 Nov 2023 12:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kvFKGvDi"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAEBDA92D
	for <linux-usb@vger.kernel.org>; Sun,  5 Nov 2023 12:20:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0176DC433C8;
	Sun,  5 Nov 2023 12:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1699186847;
	bh=nQCPKoiL86PquqP03bmYGRZaX44iahecjuk/oHtKZsE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kvFKGvDiMpm/d/CbjaOEMGPCASA9Sy+hG2nweVBF4x0iSfEQn8b4VkI232LZezXmu
	 PjgvsI0kfgTEGMVm1GpTqL8nDa31rRmd3n6iLbnqyc9B2KwQUOAg0BkYCW1Wz63Y3b
	 BkpwkLoihaiANmuhcZQRpQ8xyXklWdg+SNtxsbkg=
Date: Sun, 5 Nov 2023 13:20:38 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Fabian Melzow <fabian.melzow@gmail.com>
Cc: linux-usb@vger.kernel.org
Subject: Re: 0bda:b812 USB "3.0" WLAN devices only report a maximum of 480
 Mbps
Message-ID: <2023110540-unseemly-mobilize-9e82@gregkh>
References: <20231105130215.2b669c8b@ping>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231105130215.2b669c8b@ping>

On Sun, Nov 05, 2023 at 01:02:15PM +0100, Fabian Melzow wrote:
> Hello,
> 
> I have three USB "3.0" WLAN sticks (https://i.imgur.com/zSg5s0d.jpg)
> which are all based on the Realtek RTW8822BU (<=780 Mbps with IEEE
> 802.11ac) and use the same vendor and product ID 0bda:b812 and have the
> exact same output of "lsusb -vd 0bda:b812".
> 
> These devices should report 5 Gbps for USB 3.0 in the Binary Object
> Store Descriptor, but don't do so.

Why do you think these should report 5 Gbps?  If the device descriptor
does not show it, there's nothing that we can do about it in the
operating system, sorry.

> Maybe it is possible to add a software fix for this hardware
> problem, so I report it here.

What exactly is the hardware problem?  What is not working "properly"
for them?

thanks,

greg k-h

