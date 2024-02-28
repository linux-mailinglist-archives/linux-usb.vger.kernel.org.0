Return-Path: <linux-usb+bounces-7255-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C0F186B483
	for <lists+linux-usb@lfdr.de>; Wed, 28 Feb 2024 17:17:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8B1E0B2AEB4
	for <lists+linux-usb@lfdr.de>; Wed, 28 Feb 2024 16:15:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A94E6EF05;
	Wed, 28 Feb 2024 16:13:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JoVUtBFI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 573096EF01
	for <linux-usb@vger.kernel.org>; Wed, 28 Feb 2024 16:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709136816; cv=none; b=ZDzT4+1DGB7bCjmRTXnMpXzL9C4TeSzTbHx8stg61IQPDwyvU/OSyhpCEmaUcKUM6EeFCFfz8SQozFB/47KtmXz0cxsOz3aRhFYX4UwNftTgwdwjiAJ5a+OYh5C8WdVtBU+J3OJ85K3N53Zc0Nan+4tjHbn3XizCQLH6ju1wYxo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709136816; c=relaxed/simple;
	bh=UXQYgweCzqHDWLN2agJa0jubYiisrMuCRI823sfxrls=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CwGurCAbgDFCCEjCgqKWNGFXMM2nSxTTlPsCpEMoLLXHhObBcMuPg+OqD2/azWQRnuP+yk8eiJ+wDPl+Mrz2UqQ8XoTp/JzX4X7mg85u+i5A320F2cFi0tKhqKVYq/HXwaZlSLupR3igYH+1zkSVURjOlMuCWrOV6s+qw25569M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JoVUtBFI; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-7c7b8fb8ba6so211546739f.2
        for <linux-usb@vger.kernel.org>; Wed, 28 Feb 2024 08:13:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709136812; x=1709741612; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8fcQ/IAWznRjXpStxlQ01G1Kz8L7H9BnNsQbERo5eec=;
        b=JoVUtBFI597vn9R571PNRnez6js/OM2w3aGNSa0TC/U3ov2plXKyZnBWaDG0Qcqwar
         +bN+TMNRr1PPtc54ypYJTCWT1Hd6UR1uCC7vgFTorbeGAwrvdWUhklywWvNqyURX8ytQ
         2uFSgq/phdjxBxPYk94MHJOBas3uJ4fJrHVew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709136812; x=1709741612;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8fcQ/IAWznRjXpStxlQ01G1Kz8L7H9BnNsQbERo5eec=;
        b=V08mcigcuC+bcuRqy2wS6UyQB8nu1g2JSpBGAVJjWHzqiGanhmRz2lKRE6GNBNdgF4
         1nXtVBbWVKxaJN7P7tMcfryC/TPrJciPD8Ms4M/9OmnCAv6KwWDHCHKIK3pbFLkY2pNo
         JMcvAMla4BmVxelTEI4eb6BZz40r7b9ANivsyoC33St87aI3GCUryYJlkj9vmKvt/PxD
         jHFdD9DUagetbsas6jYDKY+H/l1Ahw9mBYI5dmm9vwRUo7bzWd3u+Sy/mSkQ9t3UC4Up
         pX4ZfafatXP/g0HtDxR4Na1E2gi6n0hc57NHYygnK9olISLQSOXQJKmgFg+XGu3lkODw
         yzyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVa0m6qD3Q8S24YClW/lIw3p0FJAWJFwzj9h2Je2hbagZaID3aGAYLxQCyWEgyEhQaZAAIKMTcruiw9BvZHCRv6TsDibeBjhCBr
X-Gm-Message-State: AOJu0YwMa++83tEeIuYvxzjoRwNSmdrZwUNzFX7JOahb17fuArKrgI31
	U429/L8F3PUnnTqWzDXIvXmu3pRF6/BFvHp/OKgZRgHWrcaIQ9/xL8AqD5aL/w==
X-Google-Smtp-Source: AGHT+IF/VtxzFoMcpznCdgAfPuARd0pMsINYif0A4fXJ7UWIBFB2SMpH2WyFgInTFSgxc5Q1p9rDcg==
X-Received: by 2002:a6b:e41a:0:b0:7c7:ead3:d8a0 with SMTP id u26-20020a6be41a000000b007c7ead3d8a0mr5164129iog.2.1709136812326;
        Wed, 28 Feb 2024 08:13:32 -0800 (PST)
Received: from localhost (144.57.222.35.bc.googleusercontent.com. [35.222.57.144])
        by smtp.gmail.com with UTF8SMTPSA id h2-20020a02c4c2000000b004745680ef83sm2325134jaj.123.2024.02.28.08.13.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Feb 2024 08:13:31 -0800 (PST)
Date: Wed, 28 Feb 2024 16:13:31 +0000
From: Matthias Kaehlcke <mka@chromium.org>
To: Javier Carrasco <javier.carrasco@wolfvision.net>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Helen Koike <helen.koike@collabora.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Russell King <linux@armlinux.org.uk>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 1/8] usb: misc: onboard_hub: use device supply names
Message-ID: <Zd9bq5hLj3Pv5ZHa@google.com>
References: <20240228-onboard_xvf3500-v5-0-76b805fd3fe6@wolfvision.net>
 <20240228-onboard_xvf3500-v5-1-76b805fd3fe6@wolfvision.net>
 <Zd9TLL0IM08Wh63i@google.com>
 <2bbd5eae-f963-40d6-a827-1c273ef5b211@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <2bbd5eae-f963-40d6-a827-1c273ef5b211@wolfvision.net>

On Wed, Feb 28, 2024 at 05:02:10PM +0100, Javier Carrasco wrote:
> On 28.02.24 16:37, Matthias Kaehlcke wrote:
> > Hi Javier,
> > 
> > Thanks for moving this patch to the front of the series!
> > 
> > A few more comments inline.
> > 
> > On Wed, Feb 28, 2024 at 02:51:28PM +0100, Javier Carrasco wrote:
> >> The current implementation uses generic names for the power supplies,
> >> which conflicts with proper name definitions in the device bindings.
> >>
> >> Add a per-device property to include real supply names and keep generic
> >> names for existing devices to keep backward compatibility.
> >>
> >> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>
> >> ---
> >>  drivers/usb/misc/onboard_usb_hub.c | 49 ++++++++++++++++++++------------------
> >>  drivers/usb/misc/onboard_usb_hub.h | 12 ++++++++++
> >>  2 files changed, 38 insertions(+), 23 deletions(-)
> >>
> >> diff --git a/drivers/usb/misc/onboard_usb_hub.c b/drivers/usb/misc/onboard_usb_hub.c
> >> index 0dd2b032c90b..3755f6cc1eda 100644
> >> --- a/drivers/usb/misc/onboard_usb_hub.c
> >> +++ b/drivers/usb/misc/onboard_usb_hub.c
> >> @@ -29,17 +29,6 @@
> >>  
> >>  #include "onboard_usb_hub.h"
> >>  
> >> -/*
> >> - * Use generic names, as the actual names might differ between hubs. If a new
> >> - * hub requires more than the currently supported supplies, add a new one here.
> >> - */
> >> -static const char * const supply_names[] = {
> >> -	"vdd",
> >> -	"vdd2",
> >> -};
> >> -
> >> -#define MAX_SUPPLIES ARRAY_SIZE(supply_names)
> >> -
> >>  static void onboard_hub_attach_usb_driver(struct work_struct *work);
> >>  
> >>  static struct usb_device_driver onboard_hub_usbdev_driver;
> >> @@ -65,6 +54,30 @@ struct onboard_hub {
> >>  	struct clk *clk;
> >>  };
> >>  
> >> +static int onboard_hub_get_regulator_bulk(struct device *dev,
> >> +					  struct onboard_hub *onboard_hub)
> > 
> > Let's call this onboard_hub_get_regulators(), it's an implementation detail
> > that regulator_bulk_get() is used for getting them.
> > 
> > no need to pass 'dev', there is onboard_hub->dev
> > 
> 
> Not at this point, though. The hub->dev = dev assignment happens a few
> lines below, but there is no reason not to move the line up. I will
> modify this for v6.
> 
> >>  static int onboard_hub_power_on(struct onboard_hub *hub)
> >>  {
> >>  	int err;
> >> @@ -253,7 +266,6 @@ static int onboard_hub_probe(struct platform_device *pdev)
> >>  {
> >>  	struct device *dev = &pdev->dev;
> >>  	struct onboard_hub *hub;
> >> -	unsigned int i;
> >>  	int err;
> >>  
> >>  	hub = devm_kzalloc(dev, sizeof(*hub), GFP_KERNEL);
> >> @@ -264,18 +276,9 @@ static int onboard_hub_probe(struct platform_device *pdev)
> >>  	if (!hub->pdata)
> >>  		return -EINVAL;
> >>  
> >> -	if (hub->pdata->num_supplies > MAX_SUPPLIES)
> >> -		return dev_err_probe(dev, -EINVAL, "max %zu supplies supported!\n",
> >> -				     MAX_SUPPLIES);
> >> -
> >> -	for (i = 0; i < hub->pdata->num_supplies; i++)
> >> -		hub->supplies[i].supply = supply_names[i];
> >> -
> >> -	err = devm_regulator_bulk_get(dev, hub->pdata->num_supplies, hub->supplies);
> >> -	if (err) {
> >> -		dev_err(dev, "Failed to get regulator supplies: %pe\n", ERR_PTR(err));
> >> +	err = onboard_hub_get_regulator_bulk(dev, onboard_hub);
> > 
> > The local variable is called 'hub', not 'onboard_hub'.
> > 
> 
> Good catch! Actually this patch alone would have not compiled, but once
> the renaming is done, everything is ok again. I will fix this for v6.
> 
> >> diff --git a/drivers/usb/misc/onboard_usb_hub.h b/drivers/usb/misc/onboard_usb_hub.h
> >> index f360d5cf8d8a..ea24bd6790f0 100644
> >> --- a/drivers/usb/misc/onboard_usb_hub.h
> >> +++ b/drivers/usb/misc/onboard_usb_hub.h
> >> @@ -6,54 +6,66 @@
> >>  #ifndef _USB_MISC_ONBOARD_USB_HUB_H
> >>  #define _USB_MISC_ONBOARD_USB_HUB_H
> >>  
> >> +#define MAX_SUPPLIES 2
> >> +
> >>  struct onboard_hub_pdata {
> >>  	unsigned long reset_us;		/* reset pulse width in us */
> >>  	unsigned int num_supplies;	/* number of supplies */
> >> +	const char * const supply_names[MAX_SUPPLIES]; /* use the real names */
> > 
> > The comment isn't particularly useful or accurate. Not in all cases
> > real names are used and outside of the context of this change the
> > comment is hard to understand.
> > 
> > I'd say just omit it, the name of the field is self-documenting enough,
> > there is no need to repeat the same in a comment (as for 'num_supplies'
> > ...)
> 
> I added tthe comment because I can foresee what is going to happen:
> people will copy the names from existing devices, we will have to ask if
> the supplies are actually called vdd and vdd2 in the datasheet, and then
> the real names will be sent in v2. Especially at the beginning, when the
> supported devices are using vdd and vdd2.

It will probably happen, but I don't expect the comment to prevent that
in most cases. First people need to read the comment and then interpret
it correctly, which isn't a given.

> But if you think the field name is self-documenting, I am fine with it
> too. I will remove the comment for v6.
> 
> Thanks again and best regards,
> Javier Carrasco

