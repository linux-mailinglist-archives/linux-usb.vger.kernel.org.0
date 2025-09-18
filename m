Return-Path: <linux-usb+bounces-28278-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C343DB83F00
	for <lists+linux-usb@lfdr.de>; Thu, 18 Sep 2025 11:57:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 844753B2241
	for <lists+linux-usb@lfdr.de>; Thu, 18 Sep 2025 09:57:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D71542DEA78;
	Thu, 18 Sep 2025 09:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sKuOqGtS"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 502932D9EC9
	for <linux-usb@vger.kernel.org>; Thu, 18 Sep 2025 09:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758189473; cv=none; b=hlpPLkcKjBaB0SjJp4ECyTNMdFTcI2vJhd+FTanEJghBDpBFBsDr6xCEevTeZ2WY1gBaaqpowFTWTldSjB8QZdirDSYaJBSWelgXNw3q5ftcR+5nvdqagJWJGPK3T6SwUUHqewaLVLEDgl6D3qwQfrnyd5dDCferM703u6zNFJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758189473; c=relaxed/simple;
	bh=hCB+xD+f1sW1LVtMuKVP8csrsYm7SA30t29RfBKXyV8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dYytMZ5Nrom/eJaO3DK1gCvRBTLS+NXa/vRxc9dL94i65qxRSSz5CcXo8KIKwodAqQHFIgAKwI2P94e4hbtXSJ42aIZxjkkbLqJ0uEUXzNOCdJwoPPAhdh/taiT8+SwTPqWUyuUCll/23wo5vmRtFtigeun2eprQUCcxdezd97k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sKuOqGtS; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD125C4CEE7;
	Thu, 18 Sep 2025 09:57:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758189472;
	bh=hCB+xD+f1sW1LVtMuKVP8csrsYm7SA30t29RfBKXyV8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sKuOqGtSl4pYOv6fsgqFIxTuVH6BwJNg8NRzxEP+j6evZb6Yz+ccboMTGtHqTKGkY
	 A+gTVX7FhePlT7c26aKBGdl6n5EBHaN6ulxDgwedd3mFUsNcN8y8WOPCcVk6+bzZkU
	 cxPV48KPVdWnmeKnVDBRFu6QX/lvDs0hz2+HTqvDxrnyC+A6+mOFEEjsevMZebOYUn
	 1M600TLmUOcqaPCRrCu8gVB+7XDluAoWu/6VnAgklTm8/gge2PdAweGylVPZQ/UB8W
	 UAezQgYGHMS1kRQzp5liWzuKSoIbVyGiJISsEKhk/iYIa99qKBQkl3rtk195rQgfFe
	 6RBj6BhXCxS6g==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1uzBOc-000000005sM-3HMB;
	Thu, 18 Sep 2025 11:57:47 +0200
Date: Thu, 18 Sep 2025 11:57:46 +0200
From: Johan Hovold <johan@kernel.org>
To: Michael Wyraz <michael@wyraz.de>
Cc: linux-usb@vger.kernel.org
Subject: Re: [PATCH] Add Marvell ML352 to drivers/usb/serial/option.c
Message-ID: <aMvXmhXgSt-yFxxb@hovoldconsulting.com>
References: <aFJzdxe_ykNw6cP_@homebase1>
 <aFLM7jZBEk6a7W-k@hovoldconsulting.com>
 <d12635f9-9706-4dbd-8adb-d673c6a77202@wyraz.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d12635f9-9706-4dbd-8adb-d673c6a77202@wyraz.de>

[ Please avoid top-posting when replying on the lists. ]

On Fri, Sep 12, 2025 at 08:54:51AM +0200, Michael Wyraz wrote:

> sorry, I totally missed this mail. "usb-devices" is not available on 
> that device. Hope this does it too:

Sure, thanks.

> lsusb  -d 1286:4e3c  -v

> Bus 001 Device 002: ID 1286:4e3c ASR Mobile Composite Device Bus

>      Interface Descriptor:
>        bLength                 9
>        bDescriptorType         4
>        bInterfaceNumber        0
>        bAlternateSetting       0
>        bNumEndpoints           1
>        bInterfaceClass       224
>        bInterfaceSubClass      1
>        bInterfaceProtocol      3
>        iInterface              5 Mobile RNDIS Network Adapter

>      Interface Descriptor:
>        bLength                 9
>        bDescriptorType         4
>        bInterfaceNumber        1
>        bAlternateSetting       0
>        bNumEndpoints           2
>        bInterfaceClass        10
>        bInterfaceSubClass      0
>        bInterfaceProtocol      0
>        iInterface              5 Mobile RNDIS Network Adapter

>      Interface Descriptor:
>        bLength                 9
>        bDescriptorType         4
>        bInterfaceNumber        2
>        bAlternateSetting       0
>        bNumEndpoints           2
>        bInterfaceClass       255
>        bInterfaceSubClass      0
>        bInterfaceProtocol      0
>        iInterface              8 Mobile Diag Interface

>      Interface Descriptor:
>        bLength                 9
>        bDescriptorType         4
>        bInterfaceNumber        3
>        bAlternateSetting       0
>        bNumEndpoints           3
>        bInterfaceClass       255
>        bInterfaceSubClass      0
>        bInterfaceProtocol      0
>        iInterface             11 Mobile AT Interface

>      Interface Descriptor:
>        bLength                 9
>        bDescriptorType         4
>        bInterfaceNumber        4
>        bAlternateSetting       0
>        bNumEndpoints           3
>        bInterfaceClass       255
>        bInterfaceSubClass      0
>        bInterfaceProtocol      0
>        iInterface             11 Mobile AT Interface

The device has five interfaces and the serial driver should only bind to
the last three so you should use USB_DEVICE_INTERFACE_CLASS() and only
match on the vendor class (0xff).

Please also include a description of what each interface is used for in
the commit message. Including a compact usb-devices output (it's just a
script you can copy to the host) would be good. Otherwise you can add a
link to your last mail in the archives:

Link: https://lore.kernel.org/all/d12635f9-9706-4dbd-8adb-d673c6a77202@wyraz.de/	

> Am 18.06.25 um 16:27 schrieb Johan Hovold:
> > On Wed, Jun 18, 2025 at 10:06:15AM +0200, Michael Wyraz wrote:
> >> Add the device id of the Marvell ML352 to option.c so that the
> >> device is recognized as usb-serial device.
> >>
> >> Signed-off-by: Michael Wyraz <michael@wyraz.de>
> > Thanks for the patch. Looks good, but we may not want to bind to every
> > interface of the device.
> >
> > Can you please post the output of 'usb-devices' for this device? I
> > assume it has more than one interface, do what each interface is used
> > for?

And remember to update Subject when sending your v2:

> > If you end up resending, please use the common prefix in Subject, for
> > example:
> >
> > 	USB: serial: option: add support for Marvell ML352
> >
> > (e.g. as can been seen by running 'git log --oneline' on the files
> > you're changing).

Johan

