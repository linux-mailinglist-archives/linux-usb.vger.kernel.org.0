Return-Path: <linux-usb+bounces-18434-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3699EE838
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2024 15:04:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0115C1886D1A
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2024 14:04:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C2D8215048;
	Thu, 12 Dec 2024 14:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="vHlbzoge"
X-Original-To: linux-usb@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F32772144A6;
	Thu, 12 Dec 2024 14:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734012236; cv=none; b=KTe5ze0A4R+SKi4p/hpyk+k8ETGk5hDlye7tWM0aQZsNFeapUADwROYAKVCwhbVDvZdsZsPYeGCQXQgP+Z+moTpA6RXPZST0VjLExAk+xLSowHsRd7EDj526BxyosnXQlGZYyQJ1F7To6s6bA/yJuXJ2UuBZ748ROfTzk+Nr1K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734012236; c=relaxed/simple;
	bh=RwtzfrPgR+g/blsfFtT/l41WEnQqeAhHntjypzkaLTs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RJwInIIzyMJduAB2HrLxbJ9IH6c+bnT9k7NreWqjxuzlmkYlqSN5ghXZl8xcQ0qiiLUMWNW3rIn9sHNipY8gM5z/orRM4Nxi3NYzjfw6r9vHMwQOB5P+0cEN7CIG2R0720D3P3HU3o+IGMakJftRYAD4I1vJwpPGj+Seksjb5sI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=vHlbzoge; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B301C4CECE;
	Thu, 12 Dec 2024 14:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1734012234;
	bh=RwtzfrPgR+g/blsfFtT/l41WEnQqeAhHntjypzkaLTs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vHlbzogekbAqnZnb9pUkvpFxqeidulY32SZTrJWnmJkOkf9I2nt6hrKKRNffmSU00
	 wyuceU41VyaeyFABFtDW5JvDTD/C0tqUSxN+GzP1yc8JMa+4BmGwNJnKyNMzmIkAWj
	 HbuVtPY3hjbgwtJl+/BmQgA9Jffz/xyOonf8R0sM=
Date: Thu, 12 Dec 2024 15:03:51 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	Yunke Cao <yunkec@chromium.org>
Subject: Re: Annotating USB device Location in DT
Message-ID: <2024121204-underarm-last-97ae@gregkh>
References: <CANiDSCtZrWAbH14fqoSq9OKv8oV30Df6AnvWGCw3gdWHT3RBrw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCtZrWAbH14fqoSq9OKv8oV30Df6AnvWGCw3gdWHT3RBrw@mail.gmail.com>

On Thu, Dec 12, 2024 at 02:42:34PM +0100, Ricardo Ribalda wrote:
> Hi all,
> 
> I'm working on a way to annotate the location of a USB device within a
> system, specifically whether it's "user-facing" or "world-facing."
> 
> There's precedent for this type of annotation:
> 
> - ACPI: Uses the '_PLD' property for this purpose
> (https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/06_Device_Configuration/Device_Configuration.html#pld-physical-location-of-device).
> We already leverage this for MIPI camera sensors
> (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/pci/intel/ipu-bridge.c#n265).
> 
> - Device Tree : Has a property for this within
> video-interface-devices.yaml
> (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/media/video-interface-devices.yaml#n386).
> 
> I propose adding a similar property to usb-device.yaml
> (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/usb/usb-device.yaml).
> 
> The ultimate goal is to have this information consumed by the video
> driver and exposed to userspace via the V4L2_CID_CAMERA_ORIENTATION
> control (https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/ext-ctrls-camera.html).
> 
> What do you think about this?

I think you should copy what ACPI does here, as long as it doesn't
conflict with the existing video-interface-devices.yaml definition.
Will that work?

thanks,

greg k-h

