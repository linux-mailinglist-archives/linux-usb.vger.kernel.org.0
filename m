Return-Path: <linux-usb+bounces-15785-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DFBC991F9A
	for <lists+linux-usb@lfdr.de>; Sun,  6 Oct 2024 18:22:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 951BE2821CA
	for <lists+linux-usb@lfdr.de>; Sun,  6 Oct 2024 16:22:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68FC2189912;
	Sun,  6 Oct 2024 16:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uMZyUNav"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13EDA1F94A
	for <linux-usb@vger.kernel.org>; Sun,  6 Oct 2024 16:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728231770; cv=none; b=R+sfpl1yaZtX5xPggzdO/YPTKsk27x1akkrj9Ru8wz2jkgTtBXzFkjQKYKTJ5W5ad4uT0EgWuGZJEArMTN8tVIbWgXDpRazOIzuVsdcTEWb6iBBC8lfi4z5dArxU9RBhAn/K4k/hwcSg38rzhmFSoI9Qc8MYOrkLeApTm7yTlmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728231770; c=relaxed/simple;
	bh=viKXFe9rwFVPQhkSvXltIk/5DxSgaR0V4n8F88bTBuk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=spRzm+NVX+0sdSVyQAVKBNZtUe0Uffge58KP4JRIYpuGitwbulCDzxMU0D3e+xxRtr87vOZmQu3oTk/nlcuqkizoMe/BB8H8hcX97wfZ6GAfsN8p6XAXrv1ijxl8tEbbTqIXB42uKNujrtgm8CLv5j20gSvBa1uxJRGPFe7cKzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uMZyUNav; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2fac47f0b1aso40937241fa.1
        for <linux-usb@vger.kernel.org>; Sun, 06 Oct 2024 09:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728231766; x=1728836566; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=FlMGsxUft2XmtJyk/9i7NF6F3cKsl8atIsydbNxJwl0=;
        b=uMZyUNavmrmaKI0SzFEF6aR7erpLBhpSoV6OhZAORIBkY7iyWPKeHueKS+sB3HAr7Z
         WD2fvbsOtGucj2PKMRcsK62po4t63I1Pyl3YONK+QCzLNaDCVy3YYa6i8zF1axs3i2/0
         iP1/kLrUftCG5otdo4CWQRFKXWoEwfzCuEF80qNjYCPjC/vtbjvy5wNZuPpgudLH5nVN
         eiiBP9I6ejW0c87cO+DEo/86KV2Mkxd/p1jqnAbBAR4qPfAjnQhjnLrewSUGSSHg78zm
         3N2IqQ3JbMWduiGWjV2hNSbI3reYdqGDGBaC517IHqnH9bHNkfjgB3p4QAwBgL8kJ1FL
         Mqlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728231766; x=1728836566;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FlMGsxUft2XmtJyk/9i7NF6F3cKsl8atIsydbNxJwl0=;
        b=t82FEUnguY6d0GK40ZnpYbpZPEQOoJ6nzExeEBFrPniGVAiIZaf3j9LjLJHpEdRj6L
         Z8qzZT1aAJP9AyN4i3xkolNKElH8Uke2kMSEQzVPs+3inZ6xE5r1kEJ7zAHIDLdlsv3R
         8Xd30PZOrr5lWx68WSY5e/sFy5tCqbInnYuQP4clGDQ5TFF3GEPdud0u5sZ+pHJO2L5x
         OkpEa8SnkZ04psCpgCGkVxoiwq8854VMymdTL7e2qB4HR6iNfZz897KZGcAaK8mx+PlJ
         39Z1l2LTREqnyDZK6fDxedZsXURe+e5nanroqACrypu/G5ca149xXPAhggq+omtbyen+
         YzcA==
X-Forwarded-Encrypted: i=1; AJvYcCVt8yQsQe8H/Dzpq2rgl5aIeo66rjrlqDe0romVhtBQSrgvP3Jk31hTF2pQJx+Aa7rG3TdrReBgC9M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdyWJClTEwvr/TAjvo9B4v2k4ur21o6u+ztTlPCW4DMYUD10TC
	L+8m6FRT0Ij9b7v8rjtyeQcbs4vX3Ba7R+T6MiOXgKjHg37oBt67/AxS25fAYO09tZOauUMLcPA
	FCrWAvcsc
X-Google-Smtp-Source: AGHT+IFhCPQWOqtR7iXY9UrM7U/wrZkIGepswy+ln+YZTQyTY5YADuNQR8zb2P75ujSh290q0vD1Bg==
X-Received: by 2002:a05:6512:3a89:b0:52f:cc06:c483 with SMTP id 2adb3069b0e04-539ab86afdfmr4620703e87.24.1728231766032;
        Sun, 06 Oct 2024 09:22:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539afec8441sm565012e87.89.2024.10.06.09.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 09:22:45 -0700 (PDT)
Date: Sun, 6 Oct 2024 19:22:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>, 
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>, Benson Leung <bleung@chromium.org>, 
	Jameson Thies <jthies@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v1 2/4] usb: typec: Add attribute file showing the USB
 Modes of the partner
Message-ID: <quqy7fpn4e5hrikekfjirnid2joskyezzj72jgfkz2t6th7z7o@tknlic5vlywq>
References: <20241004140440.1882311-1-heikki.krogerus@linux.intel.com>
 <20241004140440.1882311-3-heikki.krogerus@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241004140440.1882311-3-heikki.krogerus@linux.intel.com>

On Fri, Oct 04, 2024 at 05:04:37PM GMT, Heikki Krogerus wrote:
> This attribute file shows the supported USB modes (USB 2.0,
> USB 3.0 and USB4) of the partner, and the currently active
> mode.
> 
> The active mode is determined primarily by checking the
> speed of the enumerated USB device. When USB Power Delivery
> is supported, the active USB mode should be always the mode
> that was used with the Enter_USB Message, regardless of the
> result of the USB enumeration. The port drivers can
> separately assign the mode with a dedicated API.
> 
> If USB Power Delivery Identity is supplied for the partner
> device, the supported modes are extracted from it.
> 
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> ---
>  Documentation/ABI/testing/sysfs-class-typec |  14 +++
>  drivers/usb/typec/class.c                   | 123 +++++++++++++++++++-
>  drivers/usb/typec/class.h                   |   2 +
>  include/linux/usb/typec.h                   |   5 +
>  4 files changed, 140 insertions(+), 4 deletions(-)

I think the use of port->usbN_dev is racy and not always obviouos.
For example  on Qualcomm devices I ended up with no partner's
usb_capability and just 'usb2' in usb_mode even though the partner uses
USB3 mode. Maybe it's better to hide usb_mode completely if we can not
properly determine the actual mode?

(On Qualcomm devices there is no working ACPI, so there is no USB <->
typec correlationship (yet)).

-- 
With best wishes
Dmitry

