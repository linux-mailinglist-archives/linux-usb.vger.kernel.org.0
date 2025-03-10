Return-Path: <linux-usb+bounces-21564-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A408A589E5
	for <lists+linux-usb@lfdr.de>; Mon, 10 Mar 2025 02:20:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C820E169311
	for <lists+linux-usb@lfdr.de>; Mon, 10 Mar 2025 01:20:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34B4B635;
	Mon, 10 Mar 2025 01:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="nSG+fTdE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B5AE3596B
	for <linux-usb@vger.kernel.org>; Mon, 10 Mar 2025 01:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741569639; cv=none; b=FfF1SgCxl4yBZTF28Fz8XGF31/aNlpqkqUG4bssZSCEtaN6aW5wivsUL8ZL1mOCsjfVfdbVRutLItq6OYuEli1dRY0gaXyThvZwzTnOyLGBYusYB/RpnKgaRlrNqEgD0cePTEnYvEgoG6xyPHu1tu+a7jgmkjLjZR2V03WyVTog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741569639; c=relaxed/simple;
	bh=uF1Nt8hkebC8+WmfMXSOBOB54/PAHzKGsbyYq6RuPfk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YoMPGHd/y/zi1CfBF0v1tQE9HsgrZTW2MhbASKiDuQ2hIwVK+wPSunJ7ihR0vmThRyTgcqDBHr9UV54YKPTgc4Jo9c0MxmMi7iKZ/skLjUvoo9hirV9sM3zH67lp0AzI6E4gwRGDvucu7egn3KUbes4lIHRXDy3jaaGr3ewPqRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=nSG+fTdE; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-7c0e135e953so382358285a.2
        for <linux-usb@vger.kernel.org>; Sun, 09 Mar 2025 18:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1741569637; x=1742174437; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dbfLpDom5BLDx11NDBkF0uxb2i0tiAQxGYNhfk1GUVY=;
        b=nSG+fTdE7mjqQRbrODPMDG/imopheuLycAmDKxMZe+nZfRfTrXBNe/dX+YHP0kdr5K
         dRP4HDAwTG1yP/H50gTml8YJeJAUpuMpX/8fwa7FrIIAqekmf5rhAi0Houzo0/oUT3fC
         hX0DDNZf0KhG/RRZK+/ftHtudciSCdoppthVX5yMx2yFQevnrznntoNU9lDmGqEi4va+
         LjdIk86u/TG2Nxh0AQPD43TmNgcswMDZdHBrEQPdif/8J/qjZkdHrmR4QzQMVP9HWD8m
         Kjgys9KhIrqIkgpODJCsMRtjeznS8CE6eRZ5FLMJ5laVj66JREi/tTSYx0XVFb1bQyrf
         /h7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741569637; x=1742174437;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dbfLpDom5BLDx11NDBkF0uxb2i0tiAQxGYNhfk1GUVY=;
        b=WMOXNdE88nEc4ubNBv2+LU0eRhlJ6ocVEfE3W+bkO4EQ1UMda2bfDMsvMro1YFVaqP
         Ix6jJqAmKgQZSPDcFFCTJxd816L9rR0x3hziBUoR/4Oq7DONMD20ybgZz+19hUumZKvD
         3EPWR2pBJuc1Kp0kYYEhuRxZT2swk8RdMJXD/W3NAe1GqXVl0nveAwEW/7ghANG+phVW
         oOeE3ixDgYAelP3VK8fsZzQwL54ReSmzRzgWWlXpcA6gny6PGx716mSDaccFhZs2XUcT
         0eA0GWWajq1f04epoMwOD2BSETCTPl1c0BgOEjRuBNsKBEz8FSw3i56F9yRta+fFxrn7
         xjgA==
X-Forwarded-Encrypted: i=1; AJvYcCUCuMWmgUQruV0hbZf7pmZNWCr9g44fDpR36fyOma2vOv30ksTG1f0ZOw8iu98pLiski/BQAD0Mcnc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw74ejuMOthu4WVPGjUb9LmyFjUODjztSo17oYsVTV3nnh3K/Tf
	6I296UXX7R1KVhnu2r1/p/NXSQSmd6Adl5hgGDIjQ0pBUWoVFeveY4OqdHUY7QBRfrzYOGvgPI8
	=
X-Gm-Gg: ASbGncthIUuIuKDuNOpaS03I5YhQTwYoVyIWwYFhAZuVlcv0bro69omtNURungFIYFK
	9KewQdZ9VkbPHNhN4kybbYsLQpNF4Q1jkNXOUJD4gxY/fUM+qaGHn2tAXCLza4UHjIr9yeExiwf
	8e2WB4qj+e1jcvCpFm0NhY6Oc+LfAdvOa8qy1DDnRJqGRZbXkQPSRqgeQV2cw5gycMbE1Gn5yPq
	g+F1Zjppk8ogJujoUtBUA8iipCK6YxWHlgivzLJwK1DEZTrws797B6Q4m52ysHa8aEZsMC+lPk/
	5KVKtycyrEwpusA/HzJ44o5EwYXm8NWqE8RXaxz4yl8Su+eKuZ7iVQc/
X-Google-Smtp-Source: AGHT+IGYpP/ltEpYgCuJVhtsbF5RU5a5itNpplTHReTjyB5WUbE5DsxEsxHUc6mLYoktA86rEcLYsg==
X-Received: by 2002:a05:620a:8904:b0:7c5:48bc:8c7d with SMTP id af79cd13be357-7c548bc8f29mr1037403485a.36.1741569637053;
        Sun, 09 Mar 2025 18:20:37 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:681:fd10::7929])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c54b68cb47sm171152985a.2.2025.03.09.18.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 18:20:36 -0700 (PDT)
Date: Sun, 9 Mar 2025 21:20:34 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Colin Evans <colin.evans.parkstone@gmail.com>
Cc: eichest@gmail.com, francesco.dolcini@toradex.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, stable@vger.kernel.org,
	stefan.eichenberger@toradex.com
Subject: Re: [PATCH v1] usb: core: fix pipe creation for get_bMaxPacketSize0
Message-ID: <2b37aad4-d9ef-4dd3-98ea-02a00d1ad993@rowland.harvard.edu>
References: <Z6HxHXrmeEuTzE-c@eichest-laptop>
 <857c8982-f09f-4788-b547-1face254946d@gmail.com>
 <1005263f-0a07-4dae-b74f-28e6ae3952bf@rowland.harvard.edu>
 <cf6c9693-49ae-4511-8f16-30168567f877@gmail.com>
 <04cb3076-6e34-432f-9400-0df84c054e5c@rowland.harvard.edu>
 <bf0fda83-d97d-4a50-94d6-a2d70607a917@gmail.com>
 <73963187-6dcb-480d-ae35-2cee11001834@rowland.harvard.edu>
 <dc8894f5-8960-4e0f-93ff-47f305cd902e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <dc8894f5-8960-4e0f-93ff-47f305cd902e@gmail.com>

On Sun, Mar 09, 2025 at 09:57:21PM +0000, Colin Evans wrote:
> > In theory, turning off power to port 4 might stop all the events from
> > being reported.  You can try this to see if it works:
> > 
> > 	echo 1 >/sys/bus/usb/devices/2-0:1.0/usb2-port4/disable
> > 
> > Alan Stern
> 
> Thank you, that is very helpful, for a couple of reasons.
> 
> "Machine 2" is a new build, so if (as it sounds) the motherboard has a
> hardware problem, then I need to
> look into returning it.
> 
> BTW- it seems I spoke too soon about the USB stick suppressing the error.
> After a couple of reboots with
> it in place the problem re-occurred. It does seem that connecting a hub
> (switch) is the  only way
> to reliably stop the error. The switch has a bunch of wiring connected to
> USB peripherals and other
> machines. I would have guessed that might make the likelihood of picking up
> electrical noise
> actually worse, but that seems not to be the case here.

It may have something to do with whether the attached device is USB-3 or 
USB-2.  Hubs are both (or are USB-2 only).

> "Machine 1" is several years old, it's actually the guts of the same PC that
> was upgraded to make M/c 2.
> It's not usable, or sellable, with this performance hit happening. I have
> tried all the external USB ports
> on this machine and not found the failing controller, my guess is it's going
> to be one that supports
> some of the on-board USB headers.

In fact, the port in question might not be attached to anything, or 
improperly grounded, or something like that.

> I had been looking on the web for a way to shut down the problem port, or
> worst case the whole hub,
> however all the Linux examples I found worked by either-
> 
> a) Preventing the loading of the driver for the chipset, by type. However
> that would kill all ports supported by
>     the same type of controller, and this motherboard has multiple
> controllers of the same type onboard.
> 
> b) Shutting down a port by searching for the connected device identifier.
> However in these cases there
>     _are_ no connected devlces, the fault happens when the controller is not
> connected to anything.
> 
> Hopefully the command you recommended will do the trick, I will let you
> know.
> 
> Would I be correct in thinking this would need to be run at every boot, some
> time after device enumeration,
> or would it need to be run after every re-enumeration of devices after a USB
> device is connected /
> disconnected? Not sure how to achieve that.

At every boot.  It doesn't have to be after all the other devices 
are enumerated; after the USB controller itself is enumerated will be 
good enough.

> I very much appreciate your help in identifying the fault. Thank you.

You're welcome.

Alan Stern

