Return-Path: <linux-usb+bounces-18438-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id B663A9EEB04
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2024 16:20:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F1287188B45C
	for <lists+linux-usb@lfdr.de>; Thu, 12 Dec 2024 15:16:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD644748A;
	Thu, 12 Dec 2024 15:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="tRPwBkMM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f195.google.com (mail-qt1-f195.google.com [209.85.160.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76F6221C17D
	for <linux-usb@vger.kernel.org>; Thu, 12 Dec 2024 15:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734016510; cv=none; b=tHzWd2Ejxgk2N8gPBzYHPT6urKKeQWi+5FKEFFE8Y648RqJ+/1hxHpgtQ7zNJS7FHVUPItOA2YiidScECFTmoPGzSBe8/xYndFPa6YYh4yAU3tCuhXXpbW2DqkdcER4I2TX1ucrekD2OxJL3cFAY9Jk63ik8SEgtQwxh3VtQl2M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734016510; c=relaxed/simple;
	bh=GrfsWjLIPusKw6Raeypc+nvGcUAzhBV1ynxPoT4V3xo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dOjuciPIoitvTECp+CJ/bDZig5gghs7Ya3h4MleCl/xhui8qCSzYVjy8Wag1WwkLqdW5LG6+KC5GT/+RBswLgyVfRfVLIPd0LX5NHip1Ijr6FTYxhTd0HJeXAB+u8JZpDKwbFdgHTT9d8k1bEhgamcM2woggn4D/LQVyF8NuIrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=tRPwBkMM; arc=none smtp.client-ip=209.85.160.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qt1-f195.google.com with SMTP id d75a77b69052e-4679d366adeso4914431cf.1
        for <linux-usb@vger.kernel.org>; Thu, 12 Dec 2024 07:15:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1734016507; x=1734621307; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+QueczT4v5WPUe9DJ9xRbw+92u2kMqx1VEhRTE5FkPc=;
        b=tRPwBkMMVz9HOsyx4kdIlKfziub1uyz8RTUCLJbiv3XB7MbfsTSGrFlWOvszwv6oWF
         zidRrDdjitSqUFoYOYDlZ3LG5UNo5mVCM/b27yVSkcfaEH5xQ8kzNScrVgg0V9pDMQE9
         p0KhEYSQsOY9uDtJhwD3RPzGJvnPoMbWuexQcqkezSgi3ejEDTAXuPY4dnri9iPQ8sjt
         eNRokDZVArIp+Js772lR78n+TebzQKcvcq1K29HPp58zza21rGhR3got4kZUUI7slOXA
         DLKf4RXhBQTVap/uQ9pG5aJ83xDNnIRGfcPIFJsYGldR2pHMeCieM2V4LD9wvZkGGDWO
         tRMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734016507; x=1734621307;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+QueczT4v5WPUe9DJ9xRbw+92u2kMqx1VEhRTE5FkPc=;
        b=GALCA4SN2dGWcDUvGErOcuq3ZjfGeMH+Xwgi36SBLlAcegLZDDSl/PkdX2qux+zyIq
         NqK05Algn49oedHBBbaBFRjy264D0pH58ly49m3QpUYayDyZCZYTyinaj9GI0GevwcBB
         93wwDYq1gn7DQ7L641V5O8E1FvqFB8H3aVMxjE0JSI7Pn1bSQ941OLG7LYoQHDGQ/yr6
         8LL3g0hodxRHYu8VPnrxttjFLFr/UsrmDMfJcLYgF+J4nvKa2OQzp10UMkzA1coz+sDO
         FK0j9e9vYdvM0hywTvhFgt8JJBqgXaewInPsKarN9SQkuxKWdUc7a3CE4aJAt6Y/VQ28
         4bug==
X-Forwarded-Encrypted: i=1; AJvYcCU9QYD2tkU/MC9Z9sje3p9/wuTK0EyvWQT1rgTXzVKT0eUDVugewhmtJgGWDiyeDe5OQsS+m4VIAm4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXierbZ7O5l2VrKfSvSjml+CuYujlwWbzTVad7XHGOTzvJvB+N
	gb66KGk546EpERum7pt/QXTAfciFlCc41c8m0h0He7YkC7Sb0KYXJBpSYjfM4p9gEzsAgxpiViD
	LTgiw
X-Gm-Gg: ASbGncsTyhCpxeo+EraVSfH2t1WKR5/YYWn5PB6OhDcjeoSJhBc7s44BHyGGlh2w0nE
	u7rQpq8e2iWG4ovvFxUXFT9jRlen8yPcn2Gaqb7cSgrexHnZEFg9mVDhZtm3fflUVraaVHsYhZ8
	AYyKcDDS9Hz8DLTq6KFWXwAL9Nx7oaeXXcdCz+kt/S6QkleSxsESd7BRk+FWUmtmNVvnyHMfwIa
	HNK7jz6B6f3MJd/xZnJ1ZUvSh6nrupS/cD0zlYN20+r4riROSWWoD6D0yTWE3g8cAO0y0Zmdrk=
X-Google-Smtp-Source: AGHT+IEX1+vtdRYivaMdh57Ns23aKPia+eXC/bmevwgnS7fdyda+F+pkRFepqoVy7rThXlcNWuPf0g==
X-Received: by 2002:a05:622a:134c:b0:467:7076:37c7 with SMTP id d75a77b69052e-467a157fcd0mr10877391cf.22.1734016507367;
        Thu, 12 Dec 2024 07:15:07 -0800 (PST)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4678bd09768sm18216901cf.36.2024.12.12.07.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Dec 2024 07:15:07 -0800 (PST)
Date: Thu, 12 Dec 2024 10:15:04 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Ricardo Ribalda <ribalda@chromium.org>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, Yunke Cao <yunkec@chromium.org>
Subject: Re: Annotating USB device Location in DT
Message-ID: <8ed67e2e-6b15-43a3-b031-0e36a782428e@rowland.harvard.edu>
References: <CANiDSCtZrWAbH14fqoSq9OKv8oV30Df6AnvWGCw3gdWHT3RBrw@mail.gmail.com>
 <2024121204-underarm-last-97ae@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024121204-underarm-last-97ae@gregkh>

On Thu, Dec 12, 2024 at 03:03:51PM +0100, Greg KH wrote:
> On Thu, Dec 12, 2024 at 02:42:34PM +0100, Ricardo Ribalda wrote:
> > Hi all,
> > 
> > I'm working on a way to annotate the location of a USB device within a
> > system, specifically whether it's "user-facing" or "world-facing."
> > 
> > There's precedent for this type of annotation:
> > 
> > - ACPI: Uses the '_PLD' property for this purpose
> > (https://uefi.org/htmlspecs/ACPI_Spec_6_4_html/06_Device_Configuration/Device_Configuration.html#pld-physical-location-of-device).
> > We already leverage this for MIPI camera sensors
> > (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/pci/intel/ipu-bridge.c#n265).
> > 
> > - Device Tree : Has a property for this within
> > video-interface-devices.yaml
> > (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/media/video-interface-devices.yaml#n386).
> > 
> > I propose adding a similar property to usb-device.yaml
> > (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/usb/usb-device.yaml).
> > 
> > The ultimate goal is to have this information consumed by the video
> > driver and exposed to userspace via the V4L2_CID_CAMERA_ORIENTATION
> > control (https://www.kernel.org/doc/html/latest/userspace-api/media/v4l/ext-ctrls-camera.html).
> > 
> > What do you think about this?
> 
> I think you should copy what ACPI does here, as long as it doesn't
> conflict with the existing video-interface-devices.yaml definition.

Right.  While the notions of "user-facing" and "world-facing" might make 
sense for cameras, they do not make sense for arbitrary USB devices.  So 
they shouldn't be part of the general USB device description.

Alan Stern

> Will that work?
> 
> thanks,
> 
> greg k-h
> 

