Return-Path: <linux-usb+bounces-19549-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFD9A17849
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jan 2025 08:07:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3FA7D188E540
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jan 2025 07:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C94691C07F3;
	Tue, 21 Jan 2025 07:02:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eTz0Myg4"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29371166307
	for <linux-usb@vger.kernel.org>; Tue, 21 Jan 2025 07:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737442938; cv=none; b=UQcynFxMxxAW5mVjkHSWAgS68HVhc7T598MCfP+EqmfBDDmDv8HFJRhRk1U70sRYJZU2KmfXbTEqeqx/+xvfelcsC7gdPrbkVoTBPY4pnR+kAeiY7doKbA4DcizrVuHM24H4MlElU1+/kEKTPYUtJLvY6ZWXmMiqME7DxvD9ocE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737442938; c=relaxed/simple;
	bh=hqQWsuZCVnBf6dOEcI/6TAcX9yfUR1LOJecgInMOZ74=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uGykVYlqeDH78AVRD+QnMIRTk402hnpDCbOdqN4u5mcHD90UdLSMO2bw00HBcgEVWfw2CD+sRH6bKPfre3/x1Zspm6WrfokfA+k/juQCztZnPR3poeVq9AU0B6jx7SXClyGlyl+W2Vxgc/o4zCEM4uegOdBJmg67DoPpV6xlfuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=eTz0Myg4; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38AC9C4CEDF;
	Tue, 21 Jan 2025 07:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737442937;
	bh=hqQWsuZCVnBf6dOEcI/6TAcX9yfUR1LOJecgInMOZ74=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eTz0Myg46obCb1XxU6WIJZmCr6dpMT/yEe93GEJhHmvwPp7s3TnQqBYTGXDCkFvRN
	 aaIACTkmHlByIHCF3gXPEVjjrWtv+Mkl6e8wWZ80+xy5OiaOvwNJ1r0vkV9LGnhq1K
	 gtE0oLW35emYM7eytSD8ZirOUwppe9MtvclKaomU=
Date: Tue, 21 Jan 2025 08:01:22 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: rtm@csail.mit.edu
Cc: linux-usb@vger.kernel.org
Subject: Re: USB hub code can dereference NULL hub and hub->ports
Message-ID: <2025012150-nervous-john-fb53@gregkh>
References: <95564.1737394039@localhost>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <95564.1737394039@localhost>

On Mon, Jan 20, 2025 at 12:27:19PM -0500, rtm@csail.mit.edu wrote:
> The attached program, which acts via usbip as a USB device or hub,
> causes my linux machines to dereference some NULL pointers in
> drivers/usb/core/hub.c. These are places where udev->maxchild > 0, but
> either usb_hub_to_struct_hub(udev) returns NULL, or the returned hub
> has hub->ports == NULL.
> 
> This is one such place:
> 
> static void recursively_mark_NOTATTACHED(struct usb_device *udev)
> {
>         struct usb_hub *hub = usb_hub_to_struct_hub(udev);
>         int i;
> 
>         for (i = 0; i < udev->maxchild; ++i) {
>                 if (hub->ports[i]->child)
> 
> And this:
> 
> static void hub_disconnect_children(struct usb_device *udev)
> {
>         struct usb_hub *hub = usb_hub_to_struct_hub(udev);
>         int i;
> 
>         /* Free up all the children before we remove this device */
>         for (i = 0; i < udev->maxchild; i++) {
>                 if (hub->ports[i]->child)
> 
> This can see NULL hub->ports:
> 
> void usb_hub_adjust_deviceremovable(struct usb_device *hdev,
>                 struct usb_hub_descriptor *desc)
> {
>         struct usb_hub *hub = usb_hub_to_struct_hub(hdev);
>         enum usb_port_connect_type connect_type;
>         int i;
> 
>         if (!hub)
>                 return;
> 
>         if (!hub_is_superspeed(hdev)) {
>                 for (i = 1; i <= hdev->maxchild; i++) {
>                         struct usb_port *port_dev = hub->ports[i - 1];
> 
> This can see a NULL hub:
> 
> static int hub_set_address(struct usb_device *udev, int devnum)
> {
>         int retval;
>         unsigned int timeout_ms = USB_CTRL_SET_TIMEOUT;
>         struct usb_hcd *hcd = bus_to_hcd(udev->bus);
>         struct usb_hub *hub = usb_hub_to_struct_hub(udev->parent);
> 
>         if (hub->hdev->quirks & USB_QUIRK_SHORT_SET_ADDRESS_REQ_TIMEOUT)
> 
> I've attached a demo that runs into some of these NULL dereferences.
> It depends on being able to run usbip (and modeprobe vhci-hcd).

Great, can you submit patches to fix these issues now that you have a
reliable test program to verify the problem?

thanks,

greg k-h

