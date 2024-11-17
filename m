Return-Path: <linux-usb+bounces-17657-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6EB9D0478
	for <lists+linux-usb@lfdr.de>; Sun, 17 Nov 2024 16:18:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EA9828204B
	for <lists+linux-usb@lfdr.de>; Sun, 17 Nov 2024 15:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 20DD91D95B3;
	Sun, 17 Nov 2024 15:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="hBH9FqhT"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D35C2ED
	for <linux-usb@vger.kernel.org>; Sun, 17 Nov 2024 15:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731856727; cv=none; b=UFSwG5Q8Rz4PbPJNbNgcVaxOtoM2ToVm3lXXsBorF0OhIz8ePZTETNE+yaxSEVPn7lx2+dFMhXvvV9gtsO0g2gMdN7P6gqPsApnlY6ges0d6QI/5zzE/Ufhyh9hv+qRG49mV38hdKyw/yTTsXdsUL9DEyrYEW8ya0pa+i7gHVuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731856727; c=relaxed/simple;
	bh=A3Y1VPSR2tBt66ItUfNx6b8IZBDbeWm1eBj5C4Qee8g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I0aPeYj/yto+jDb3TFtBWaJU1V39RvXrt40OuGMggE0BFY3qQWcaFvckLqHJwYzzp3B7M3v+oWFLBiF1sgVc5rcDqaPWnETb1mnRokUVo6bJXuolmecLeWLtL5LMZHsA0wwHRaNNrV10NrMVQ3xc6FCuhl1zjv03tposKE28U8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=hBH9FqhT; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7b1b224f6c6so108840085a.3
        for <linux-usb@vger.kernel.org>; Sun, 17 Nov 2024 07:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1731856724; x=1732461524; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=reI+Fsse4urmMnvSxA388VE7DvEBSJUHhA3f5I4eWkU=;
        b=hBH9FqhT6gVyyVXemNSkLyfpfmUdTrHDU0yLTjQbPw3BjMXJ4/IdTOrJFjg72Br71b
         5yH8m6f2XI9L/TC3s9LeHfM/8IuR4aMhc6hC1dEIOIAePmrDiJ3GJkdoGKz9IervmQ+S
         S0V4X6c65yWNu+2mkSPxFAYovRvXgxjPTIdip5G9p8/s9Vy4g1Im+3ei2hQZUaCLUUHy
         7/j37pFAFsnn6zLQr9UfpHPonBBSl7sBSxzm99nN8Y+b8vUNpgvfM6jFSTjdPpboMdCu
         3Oc725Ojg1iPn3BBB7JB33P1/kxY97bWO05bF+IpJ7+apJPOBgClWdiGnomNoDkHMJXV
         hdxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731856725; x=1732461525;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=reI+Fsse4urmMnvSxA388VE7DvEBSJUHhA3f5I4eWkU=;
        b=lVRCAswARp870+VdcgeXTWJgzNKamqWHs8oeP+o56RNMEdY6u5k0mfBiaLkpTcXxIw
         a1TWuCy6ucvEMBPLVLkCAiC8MhIFhnIMiqynJhMeqrcPKA2ND27hVQ2O6dwPzemeB6lC
         Wz2pmEdQaV71z08MyV5wCLWjL0Jvd1KERgkD043YQi0Hvw4Nkf/jVq9TUUCvl0sSkFDt
         3YFLl+dn/c0Dt4lFKcENfz/MyoOvLwBKcG2QHvhpgAkO6yIc95kP0PyCBhdfxD91hvxw
         s7zLOuKLqNbj8tJyA+9hjlrhp+fkHPAM8ndqvPczqfXeNX3aSTqZXynImioLubV41Vws
         W9Ow==
X-Gm-Message-State: AOJu0YxC+9JjggOuEPmvkRXGXpSe1qSwQQ3pP1qy5N1kYezxu/ZMoceS
	XitsGAvxQ/B+fVjOsULtzwwOlGd2eWs+mWfZihiCKdZO/YIGlKrn2NiXFdo7ug==
X-Google-Smtp-Source: AGHT+IEG1JIa9cljwnGia/ZZR9Gio5ypxpTzcCZMH9UIoO9zOsPq/Ro4wtF0pZWOlIYF6p0AgCbGuw==
X-Received: by 2002:a05:620a:1a0a:b0:7b1:49d3:29c7 with SMTP id af79cd13be357-7b3622c6a4cmr1235837085a.2.1731856724725;
        Sun, 17 Nov 2024 07:18:44 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::24f4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6d40ddd356dsm22160376d6.126.2024.11.17.07.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Nov 2024 07:18:44 -0800 (PST)
Date: Sun, 17 Nov 2024 10:18:40 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Markus Rechberger <linuxusb.ml@sundtek.de>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: Highly critical bug in XHCI Controller
Message-ID: <50f730ae-4918-4dac-88ec-b3632bee67e7@rowland.harvard.edu>
References: <3905c1c88695e0ffcfabf700c06dd7223decef8d.camel@sundtek.de>
 <dd4239c7b0538e1cd2f2a85307c73299117d5f0e.camel@sundtek.de>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd4239c7b0538e1cd2f2a85307c73299117d5f0e.camel@sundtek.de>

On Sun, Nov 17, 2024 at 08:44:16PM +0800, Markus Rechberger wrote:
> Basically the issue comes from hub_port_connect.
> 
> drivers/usb/core/hub.c
> 
> hub_port_init returns -71 -EPROTO and jumps to loop
> https://github.com/torvalds/linux/blob/master/drivers/usb/core/hub.c#L5450
> 
> I'd question if usb_ep0_reinit is really required in loop which is
> running following functions:

You mean that usb_ep0_reinit() runs the following, not that the loop 
does.

>     usb_disable_endpoint(udev, 0 + USB_DIR_IN, true);
>     usb_disable_endpoint(udev, 0 + USB_DIR_OUT, true);
>     usb_enable_endpoint(udev, &udev->ep0, true);
> 
> this is something only experience over the past decades can tell?

It _is_ necessary, because the maxpacket size of ep0 may change from
one loop iteration to the next.  Therefore the endpoint must be disabled 
and re-enabled each time the loop repeats.

[Now that I go back through the git log, it appears the only reason for 
exporting usb_ep0_reinit was so that the WUSB driver could call it -- 
see commit fc721f5194dc ("wusb: make ep0_reinit available for modules").  
Since the kernel doesn't support WUSB any more, we should be able to 
stop exporting that function.]

> usb_enable_endpoint will trigger xhci_endpoint_reset which doesn't do
> much, but crashes the entire system with the upstream kernel when it
> triggers xhci_check_bw_table).
> 
> I removed usb_ep0_reinit here and devices are still workable under
> various conditions (again I shorted and pulled D+/D- to ground for
> testing).
> The NULL PTR check in xhci_check_bw_table would be a second line of
> defense but as indicated in the first mail it shouldn't even get there.
> 
> 
> 
> As a second issue I found in usb_reset_and_verify device 
> https://github.com/torvalds/linux/blob/master/drivers/usb/core/hub.c#L6131
> 
>         ret = hub_port_init(parent_hub, udev, port1, i, &descriptor);
>         if (ret >= 0 || ret == -ENOTCONN || ret == -ENODEV) {
>             break;
>         }
> 
> hub_port_init can also return -71 / -EPROTO, the cases should be very
> rare when usb_reset_and_verify_device is triggered and that happens.

If that happens, the loop which this code sits inside will simply 
perform another iteration.  That's what  it's supposed to do, not an 
issue at all.

Alan Stern

