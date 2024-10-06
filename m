Return-Path: <linux-usb+bounces-15779-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AB904991F54
	for <lists+linux-usb@lfdr.de>; Sun,  6 Oct 2024 17:25:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CC0F91C21131
	for <lists+linux-usb@lfdr.de>; Sun,  6 Oct 2024 15:25:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED80717BB0A;
	Sun,  6 Oct 2024 15:24:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tPIp/nZI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13DE13635D
	for <linux-usb@vger.kernel.org>; Sun,  6 Oct 2024 15:24:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728228296; cv=none; b=dlKU3QPT/wgwtrUw68IgFDYRN4cfwEMQ2UjIP1cEpngO/ct7M/FmqVYmuUYkUTwSJ8cvP80XZxoAKHhEMZzW9xlrcCsIocbhEy0aBB/jGTXEneBsDKuxb8e7LW9Jud5ktPcLm1Y5ZuwRZSR7+bgsD0tmgyLmCdDfNiHxAqOSTPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728228296; c=relaxed/simple;
	bh=Ddw5/PI06BBB+5QwUVlAEzwgRmfx8TzJX9+qsstiV9I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H7c8T4xlHjcrgtgJy/scq/SEr7tBmk1XbvXF0/AfOTP0J8EbElBPPU3ruWgxfeaYcxqJMxpgNNq5owdQDtrSMem7eJwjivBjOyetY2nzOoA78b9trYq+hSNuXAJlWYRMYVeTiHfmg/FHzGeVthMOqFcpIBjBeMSOFxxcwnoxrf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=tPIp/nZI; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5389e24a4d1so4350567e87.3
        for <linux-usb@vger.kernel.org>; Sun, 06 Oct 2024 08:24:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728228293; x=1728833093; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WpxzUFBpM6jj79F7ZqgEaOqBGXguLzjUAwq2RqwFc74=;
        b=tPIp/nZIFnbUr1wynDjqonxXW5m+0AtF4uuBrUTNV8vOfR3MAU2fTSP8nF/uoF5dNB
         VjuiHLvZlU3c61AsulOueGLa/NuzrFMzl6jXS7jibRSM8UmnJHfSXzdd0FhJ0MPCKKOR
         L3rLM9CteyvqcWiBhlN4nmzJabdU0knrzgIrBQNDQSr1+oGOXISOZvsFSYPQIyhUNt7t
         DCldHW+eBbDGcn33q2INh2BbYsp6SSK5hgHDY+cuQK81ia5yCa76q5283tDRdpQbsNeP
         Ll1XEH6TOAR+rqjcgsu3AnvfdvmRgU9r0E+JnNkyHxfZdgMZO9eJa3bXzGBsjqGO5pn2
         Nnhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728228293; x=1728833093;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WpxzUFBpM6jj79F7ZqgEaOqBGXguLzjUAwq2RqwFc74=;
        b=SIbCk/kZrJJAwOz6q2wQ6AlxYo5b+iW5YVIEXLKursZZPbQVtQbjNYMbnnmrVB+wQG
         sFtK86Vn5Ri3/pFzm5bdzDCv9JwAwcLkkNMUeJVZNCBjMmnsxt4fMyk44hn+mr9MNlZy
         hbnCuD0qb7fkRCH02mMhO3ZMfNrFIouIR/qqhEU2DNDulDmV2tsBC6O3j5eu9IlQ5yIn
         86G+F8V+QvGLjcJ4ykXk/UdxvWXkRqvwVoM6YZNCGdl+yE3xy6qNiqRmcjvDJ5DXA1gC
         ExYO/LMZd5bu+Gwk8BGmbKSzdZ/Org9Fd2zV1CLFdIxH7ZTiiOr/0RkaqBbHknQQDqTi
         3P2g==
X-Forwarded-Encrypted: i=1; AJvYcCWUSiI0cwhmZQkx4Dk3Q6TneVobLKYHh5BqpSEZr+Tcrfof+g75mB5QxsHVR6yCAPqEMik6vMlFIk0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGQ7sCReKInWoM7OK8SnRh9pZvdXf9+hyju0TqycONogBUHsa2
	gXIrBlzktyQiimgtKT46DK9nH5Nmh52cfT0Bwry91fbtwymmqtqNDxUH1tTTgF5tIhr1hQngvk/
	NPEKuSz+k
X-Google-Smtp-Source: AGHT+IEz2NN9I4YEcGZDTK1sMn0DbRO+Jpbp85v+1I8NHlwSLv9mIX9SsVNIPu8OUzXhMi6soAaKRA==
X-Received: by 2002:a05:6512:2313:b0:539:8c02:64d5 with SMTP id 2adb3069b0e04-539ab873368mr4286410e87.27.1728228292618;
        Sun, 06 Oct 2024 08:24:52 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539aff28f10sm549816e87.303.2024.10.06.08.24.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Oct 2024 08:24:52 -0700 (PDT)
Date: Sun, 6 Oct 2024 18:24:50 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	linux-usb@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	kernel-dev@igalia.com
Subject: Re: [PATCH] usb: typec: altmode should keep reference to parent
Message-ID: <ywdn3gf3vx2xlew75pvahx4ye3ciq5y7mapmbc2uoonfyeanow@oj4gilgq5mkx>
References: <20241004123738.2964524-1-cascardo@igalia.com>
 <Zv_23J-1U5pZ6rgT@kuha.fi.intel.com>
 <Zv/43ewc3n5aSEUO@quatroqueijos.cascardo.eti.br>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zv/43ewc3n5aSEUO@quatroqueijos.cascardo.eti.br>

On Fri, Oct 04, 2024 at 11:17:01AM GMT, Thadeu Lima de Souza Cascardo wrote:
> On Fri, Oct 04, 2024 at 05:08:28PM +0300, Heikki Krogerus wrote:
> > On Fri, Oct 04, 2024 at 09:37:38AM -0300, Thadeu Lima de Souza Cascardo wrote:
> > > The altmode device release refers to its parent device, but without keeping
> > > a reference to it.
> > > 
> > > When registering the altmode, get a reference to the parent and put it in
> > > the release function.
> > > 
> > > Before this fix, when using CONFIG_DEBUG_KOBJECT_RELEASE, we see issues
> > > like this:
> > 
> > Let me study what's going on in the drivers code. The children should
> > _not_ be cleaned first before the parent. I'll have to come back to
> > this on Monday.
> > 
> > This really should not be necessary.
> > 
> 
> Well, they are likely not. But driver core API states that either way, you
> should keep such references. And one way to test it is using
> CONFIG_DEBUG_KOBJECT_RELEASE. That delays the actual release/cleanup of the
> struct device, so:
> 
> 
> > > [   43.572860] kobject: 'port0.0' (ffff8880057ba008): kobject_release, parent 0000000000000000 (delayed 3000)
> > > [   43.573532] kobject: 'port0.1' (ffff8880057bd008): kobject_release, parent 0000000000000000 (delayed 1000)
> > > [   43.574407] kobject: 'port0' (ffff8880057b9008): kobject_release, parent 0000000000000000 (delayed 3000)
> > > [   43.575059] kobject: 'port1.0' (ffff8880057ca008): kobject_release, parent 0000000000000000 (delayed 4000)
> > > [   43.575908] kobject: 'port1.1' (ffff8880057c9008): kobject_release, parent 0000000000000000 (delayed 4000)
> 
> 1) children (port1.0 and port1.1) last reference are put, but their actual
> release is delayed 4s.
> 
> > > [   43.576908] kobject: 'typec' (ffff8880062dbc00): kobject_release, parent 0000000000000000 (delayed 4000)
> > > [   43.577769] kobject: 'port1' (ffff8880057bf008): kobject_release, parent 0000000000000000 (delayed 3000)
> 
> 2) parent (port1) is put, but release is delayed 3s.
> 
> Just in the order you would expect, but because of the delays:
> 
> 3) 3s later, port1 release is called and it is freed.
> 4) 4s later, port1.0 release is called and it refers to the freed parent,
> port1.
> 
> Having the references, what happens now is:
> 
> 1) port1 is put, but this is not its last reference.
> 2) port1.0 and port1.1 are put, cleanup delayed 4s.
> 3) 4s later, port1.0 and port1.1 releases are called, but now they put the
> last reference to port1.
> 4) port1 last reference has now been called, cleanup delayed 3s.
> 5) 3s later, port1 release is called, then freed.
> 
> No UAF in such case.

Usually we don't use this config option, maybe I should also start using
it for some of my tests. Nevertheless the description is pretty clear
(although it might be better to add it to the commit message).

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

