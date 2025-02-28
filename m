Return-Path: <linux-usb+bounces-21185-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E617BA49792
	for <lists+linux-usb@lfdr.de>; Fri, 28 Feb 2025 11:39:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F398E1890F95
	for <lists+linux-usb@lfdr.de>; Fri, 28 Feb 2025 10:39:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C50D725F790;
	Fri, 28 Feb 2025 10:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="CMSeZuDJ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A51BA25DAF4
	for <linux-usb@vger.kernel.org>; Fri, 28 Feb 2025 10:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740739142; cv=none; b=t0SLbDIyKeySVC0i1HEx9UYzmwsXVr3nqzgtXY2fbc9Qg8orKyvT7i/NR+dUUYT5kTkybpQDT+k/doxpd+z5jYSZzVQsRO5urmBxgXwsWde1wgZSi+Arh3l5Yq2mLEIuVQF330UM9QxmjTuwVHvlWYyONoxP7HfNDhLfU8PhRoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740739142; c=relaxed/simple;
	bh=QUNDLB9wIz3SgB5nupTBapjW2yLDITrKMtGbCrusmeI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WmArMpTI5rviX+akptc6cjXMubGl/SEyCMc/eoh4UdCH1w9T1PZvxY805OSAzxFP15f+HxMzwAm745Ev2NHD2OBbUJYyyfxl8YuRAMeNxGh5CQZkfnsmD8Gr/7innb0G2ap1WyGtwTNYE/rBPxOfxYwriNC+fLJH/3D0PSSggXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=CMSeZuDJ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-390e6ac844fso1659395f8f.3
        for <linux-usb@vger.kernel.org>; Fri, 28 Feb 2025 02:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1740739139; x=1741343939; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oG39+hcRe3mRE9YuhXueuN+tcV1/Sxrh6Deyz13CYHQ=;
        b=CMSeZuDJALTJrLrDXO1MaSNxV3UC1hTJpYXe1sp9tFdjIbeYFI7Ls5FhMomMcEARe9
         b25+CK0qxcJFHgPT3EgrzsrqgXuB64t0E82Vasr3nzWOWXs3nql0cb5AZ/8crBpCgMJn
         mUkYvqVsNepeJiOGZ7RD2NxPp0dAbJfxBtBS0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740739139; x=1741343939;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oG39+hcRe3mRE9YuhXueuN+tcV1/Sxrh6Deyz13CYHQ=;
        b=iwetV4MSStKaMSPCkL0jlf/uHBa9vRokuU7SBauzCrmYGotJBZRK4RPcl7MBfYq/VR
         R2TeLNkG44eaL+mdAPp379DyHof+lqwdbik0VvhikkbxWWT06cpolgiPHmSkOa7flie2
         c5zviI2vObWSNELGN5TzJwJF4SQ18rpvStf3nt1nBt9dIryN81op+sveghi5eH1Ky6Q7
         h67vI6xbD/ULR72rgJGLYhvgbeFZto+mPSZPVAZqCN6F6yLo1lD7TaL9a7zhqmC+eujH
         JEQWNf8BU9LkBo9+3UGPa96umZMwMfOCDzNq8as+qx6CnWdMAfuo90BIWjQ67yFwMHsb
         59Ug==
X-Forwarded-Encrypted: i=1; AJvYcCUllUSYCfUZyzo13TnarOR0DmmqehEDVbeX+FkRNLH038q9TyaXiVyJhRxF4v5OgBSveRKSPZrqbQg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSyRA6bYFIHqlLYQ4zfQy4+LzRa4vwMVd2ARPlKAR47X95Vap7
	r75VqDCOZ9OH2jDbXilyvDhBBpnoQYCh1CUEo+FPu5mSm3aoFkBEFcq/mcfrvsk=
X-Gm-Gg: ASbGncuKyGT7s82wxGobrjcj2O/W9QwnLNIJdkro0piQPV43YlW3Fc7fg+itAGihrBi
	HlGhp6MS3ZEWEuE2RqnbJ8mvU4TqIFt9WbGkgtFUqT+f3yiW7pYt946jb6gXq3O1WiTCgNCcTiR
	RUioFHBwLTywZbf9FgilvxkNolt4IrZ1iMU4XYVM9DNGMG3FUKZvPvRqt8g+n9/W91MnyqWVt33
	68G71EYSyI/7oaKS4vB4UyvLORpSNM18IsksFuwWJEix+tEUbA1UNQTP0RdDAJ2u+4Y4xCxfGYD
	gw3mxHc+1Alca57N23dxCAjswvp1gAylbph8+g==
X-Google-Smtp-Source: AGHT+IHKtGVsCgsiQqYoRp4tUgxKTTuuX/6KEMlk0ndg4zFgqUK2TcWKSSYGEO9DYxuDiwTWH64tCQ==
X-Received: by 2002:a5d:64cf:0:b0:38a:8906:6b66 with SMTP id ffacd0b85a97d-390eca2793dmr2679060f8f.38.1740739138696;
        Fri, 28 Feb 2025 02:38:58 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba53945bsm84503875e9.23.2025.02.28.02.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 02:38:58 -0800 (PST)
Date: Fri, 28 Feb 2025 11:38:55 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Louis Chauvet <louis.chauvet@bootlin.com>, linux-kernel@vger.kernel.org,
	Lyude Paul <lyude@redhat.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Mark Brown <broonie@kernel.org>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Robin Murphy <robin.murphy@arm.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Zijun Hu <quic_zijuhu@quicinc.com>, linux-usb@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	=?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
Subject: Re: [PATCH v4 0/9] Driver core: Add faux bus devices
Message-ID: <Z8GSPwC7hqFFwAVi@phenom.ffwll.local>
Mail-Followup-To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Louis Chauvet <louis.chauvet@bootlin.com>,
	linux-kernel@vger.kernel.org, Lyude Paul <lyude@redhat.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Liam Girdwood <lgirdwood@gmail.com>, Lukas Wunner <lukas@wunner.de>,
	Mark Brown <broonie@kernel.org>,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	Robin Murphy <robin.murphy@arm.com>,
	Zijun Hu <quic_zijuhu@quicinc.com>, linux-usb@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	=?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
References: <2025021023-sandstorm-precise-9f5d@gregkh>
 <7d196a91-220a-41a5-8577-198b436d8440@bootlin.com>
 <2025022719-papaya-resample-0b59@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2025022719-papaya-resample-0b59@gregkh>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Thu, Feb 27, 2025 at 07:30:29AM -0800, Greg Kroah-Hartman wrote:
> On Thu, Feb 27, 2025 at 02:06:21PM +0100, Louis Chauvet wrote:
> > 
> > 
> > Le 10/02/2025 à 13:30, Greg Kroah-Hartman a écrit :
> > > For years/decades now, I've been complaining when I see people use
> > > platform devices for things that are obviously NOT platform devices.
> > > To finally fix this up, here is a "faux bus" that should be used instead
> > > of a platform device for these tiny and "fake" devices that people
> > > create all over the place.
> > > 
> > > The api is even simpler than the normal platform device api, just two
> > > functions, one to create a device and one to remove it.  When a device
> > > is created, if a probe/release callback is offered, they will be called
> > > at the proper time in the device's lifecycle.  When finished with the
> > > device, just destroy it and all should be good.
> > > 
> > > This simple api should also hopefully provide for a simple rust binding
> > > to it given the simple rules and lifecycle of the pointer passed back
> > > from the creation function (i.e. it is alive and valid for as long as
> > > you have not called destroy on it.)
> > > 
> > > I've also converted four different examples of platform device abuse, the
> > > dummy regulator driver, the USB phy code, the x86 microcode dvice, and
> > > the "regulator" device that wifi uses to load the firmware tables, to
> > > use this api.  In all cases, the logic either was identical, or became
> > > simpler, than before, a good sign (side note, a bug was fixed in the usb
> > > phy code that no one ever noticed before).
> > > 
> > > Note, unless there are major objections, I'm leaning toward getting
> > > patch 1 and 2 of this series merged during this -rc cycle so that all of
> > > the individual driver subsystem cleanups can go through those subsystems
> > > as needed, as well as allowing the rust developers to create a binding
> > > and get that merged easier.  Having patch 1 merged on its own isn't
> > > going to cause any changes if no one uses it, so that should be fine.
> > 
> > Hi all,
> > 
> > I have a maybe dumb question regarding the patches 3..9: do they break the
> > UAPI?
> > 
> > With a platform device, the drivers appear under /sys/bus/platform, but with
> > faux device, they appear under /sys/bus/faux.
> > 
> > I ask because I found out that one (see my reply to [2]) of the main drm
> > library expects to find all the devices under pci, usb, platform, virtio and
> > host1x buses [1], so at least for the vgem and vkms driver, this library
> > will be broken (it will not crash, but previously detected devices will
> > suddenly disappear).
> 
> Why does a userspace tool want to walk bus types?  Shouldn't it just be
> iterating over the userspace class type instead?  classes are how
> devices are exposed to userspace, not through a bus.  That way if there
> is a new bus type tomorrow (like this one), code will just keep working.
> 
> What does the tool actually do in the platform device's directory?

Yeah this should work. In the past, mostly for historical reasons (pci
enumeration in Xserver due to everything being userspace drivers) this
wasn't the case. But modern drm drivers should go hunt for a compatible
drm_driver name, enumerating all drm devices of the right class (legacy
aka display or render or accel), because that string name is the uapi
promise for the driver-specific uapi.

Anything that uses generic drm apis like kernel modesetting shouldn't
care, unless you've managed to hard-code your device path in your config
somewhere. But almost everything does automatic setup nowadays, at least
as a fallback.

Plus vgem and vkms are mostly for validation, that stuff we can fix
without annoying real users. It's kinda like breaking debugfs, which you
need anyway for running most of the igt testcases.

tldr; I'm not worried, and if something breaks we need and can fix it.

Cheers, Sima
-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

