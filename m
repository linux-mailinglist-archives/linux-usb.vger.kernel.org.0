Return-Path: <linux-usb+bounces-21722-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CD94FA5F7E1
	for <lists+linux-usb@lfdr.de>; Thu, 13 Mar 2025 15:22:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 84AF119C336B
	for <lists+linux-usb@lfdr.de>; Thu, 13 Mar 2025 14:22:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EFF34267F45;
	Thu, 13 Mar 2025 14:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b="NvnPuq0m"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E2C2673A0
	for <linux-usb@vger.kernel.org>; Thu, 13 Mar 2025 14:22:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741875747; cv=none; b=IZAHgZYA+4HlpZTo6+ZqwRHTmc9WcStQ7La61oEGpdaC1i31VOpIgoF8MPSPrJfLtaUMWQsv5X+G9ASIKLMPelT9KzVPUjsiCKYRppDM+lxHrJDEDSlRgbHpn3saK5RZVV8LqCD5ZnGVrXmvsoSFIJSU968aRWJCZ9Y7As9PQjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741875747; c=relaxed/simple;
	bh=mx+ztSbmRgAFulMzSRVIlYBkkBsbHQC4KCocxQlBjlw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RBr7jFbqgGO8u7Vh6BCC/Nh5uqrqw3oGwoleCBi4qiOkfHqgd+R5276tCqJ8WUsm5Hsh/Qww24xoxm0VPv9M2pZiMt/4JS0pLSK3smKyfMPRkGYd6CVt6Yb8iMyK/MjPK8PdWmbZAB7AZl04yOd3maVe5Xzdrtc47KjjHdvHaFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch; spf=none smtp.mailfrom=ffwll.ch; dkim=pass (1024-bit key) header.d=ffwll.ch header.i=@ffwll.ch header.b=NvnPuq0m; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ffwll.ch
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ffwll.ch
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43bb6b0b898so9442545e9.1
        for <linux-usb@vger.kernel.org>; Thu, 13 Mar 2025 07:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1741875744; x=1742480544; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pM9ItXxbsRlMEhlDKad/ZxzQCO48bgp8mPNSaz0V580=;
        b=NvnPuq0mS6RtKpucmuYXFjgVQUuKh5qb8t5GKowhi5pKt71O8F/2KZAUt/2ihoyvSm
         lg0ML1xP6fE/9v8/B83wSIAveZBslN3fcfo6xtru365/k0iSifAfC2Xt8dNx03Cm4r5K
         l3wb4gIYhMjScaDtPzAGeYoAv8HtWARolOUbw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741875744; x=1742480544;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pM9ItXxbsRlMEhlDKad/ZxzQCO48bgp8mPNSaz0V580=;
        b=kUSxuvU180O59JkdZVwqHAAra39TUJOhkQ+Qz6j57fjAfQ/D8lOfl/QMCsVzdy9ol8
         RiuOjJP62O3vWKkkFG63JpO+2PsRb2Il/Q5x7+Cmj+G6h1D0NCXafgLR779IvpiTXN4J
         4k06Bnu6XP7aOi6Hx9Dt8laoJBX//XL45iHuA7Y45G9L0547qyM6wMB4Jxrn692xv+nl
         NfcniHBJbaTyfgg5lHsZoyWTsBv+ivmN843EYSjdXdDhAqF9ptVpff8a8u0WgSG6IdMG
         0Kw9dPg+xnR1p5BH8zAlQ87+GsEkWn9qVpvtehcvsbHA/fhg8zeomM+Xogxscl5vbghq
         oLJA==
X-Forwarded-Encrypted: i=1; AJvYcCUXItjNWH8t1O0f4o7bgVhGJELpv0wZe2JJ8WSTfQg7OgIJ26Cr4F/YLPKTR9xdlIwGRKopIinHXDQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxF38KyHWMU56Fdfa8Uo3Qrnr+Y74ilU7O0J0dQ7+UoTPIN0xei
	q2xu2zSrzOSH7GdQlvgUp72uNIOmt2p7082EcrSD6oPxUJo0Zeh4bOWA2OZSduc=
X-Gm-Gg: ASbGnct0NR3UOSUydoinLSrcKFOeGUdiCVwHi0rgv88Qck85X/yXmJxjBKxKuTuykbf
	K5OzERhGsuzx0qPIRXV7AjUltlwhSauwR9/+bLj23f4WxQV4tm88QfF93AXpYwsx10lAPBpewGu
	8JsBfQxJfm7Slq5tiShmwAykJWLpo6c4Zr3GcSxjFmESNtnRdJc7SZlAlknOm48tsyLxFqD1JPA
	SGsmF1H9RyO796BLdYGJNuMbh0h5+OOfMuG8HTyYpAvNXOh4OqwnkU+4N7km617tORjokf4ijoI
	ydc6Jz3AuX0QW50VnR2CYMEx4q1JurfcRxgIcO0UaPG6NC5msWDY0xSq
X-Google-Smtp-Source: AGHT+IGjO4FsKbB+Ux6992aYb86YlYMAwm8+sVMZZjUkcAqImTiqnQPTNezrkwgHZ00JdE+45W8X8Q==
X-Received: by 2002:a05:600c:4f14:b0:43d:7a:471f with SMTP id 5b1f17b1804b1-43d01be7e4bmr125481115e9.18.1741875743785;
        Thu, 13 Mar 2025 07:22:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-395c7df385bsm2245584f8f.4.2025.03.13.07.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 07:22:23 -0700 (PDT)
Date: Thu, 13 Mar 2025 15:22:21 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
	Jonathan.Cameron@huawei.com, airlied@gmail.com,
	aleksander.lobakin@intel.com, andriy.shevchenko@linux.intel.com,
	bhelgaas@google.com, broonie@kernel.org, dakr@kernel.org,
	dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
	lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, louis.chauvet@bootlin.com,
	lukas@wunner.de, lyude@redhat.com,
	maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
	melissa.srw@gmail.com, mripard@kernel.org, quic_zijuhu@quicinc.com,
	rafael@kernel.org, robin.murphy@arm.com,
	rust-for-linux@vger.kernel.org, simona.vetter@ffwll.ch,
	simona@ffwll.ch, tzimmermann@suse.de
Subject: Re: [PATCH v4 9/9] drm/vkms: convert to use faux_device
Message-ID: <Z9LqHcj4n7Dd8A-H@phenom.ffwll.local>
Mail-Followup-To: Greg KH <gregkh@linuxfoundation.org>,
	=?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>,
	Jonathan.Cameron@huawei.com, airlied@gmail.com,
	aleksander.lobakin@intel.com, andriy.shevchenko@linux.intel.com,
	bhelgaas@google.com, broonie@kernel.org, dakr@kernel.org,
	dri-devel@lists.freedesktop.org, hamohammed.sa@gmail.com,
	lgirdwood@gmail.com, linux-kernel@vger.kernel.org,
	linux-usb@vger.kernel.org, louis.chauvet@bootlin.com,
	lukas@wunner.de, lyude@redhat.com,
	maarten.lankhorst@linux.intel.com, mairacanal@riseup.net,
	melissa.srw@gmail.com, mripard@kernel.org, quic_zijuhu@quicinc.com,
	rafael@kernel.org, robin.murphy@arm.com,
	rust-for-linux@vger.kernel.org, simona@ffwll.ch,
	tzimmermann@suse.de
References: <2025022643-scouting-petticoat-492b@gregkh>
 <20250311172054.2903-1-jose.exposito89@gmail.com>
 <2025031218-oxidize-backing-e278@gregkh>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2025031218-oxidize-backing-e278@gregkh>
X-Operating-System: Linux phenom 6.12.11-amd64 

On Wed, Mar 12, 2025 at 07:22:07AM +0100, Greg KH wrote:
> On Tue, Mar 11, 2025 at 06:20:53PM +0100, José Expósito wrote:
> > Hi everyone,
> > 
> > > On Tue, Feb 25, 2025 at 02:51:40PM +0100, Louis Chauvet wrote:
> > > > 
> > > > 
> > > > Le 25/02/2025 à 12:41, Thomas Zimmermann a écrit :
> > > > > Hi
> > > > > 
> > > > > Am 10.02.25 um 15:37 schrieb Louis Chauvet:
> > > > > > On 10/02/25 - 13:30, Greg Kroah-Hartman wrote:
> > > > > > > The vkms driver does not need to create a platform device, as there is
> > > > > > > no real platform resources associated it,  it only did so because it was
> > > > > > > simple to do that in order to get a device to use for resource
> > > > > > > management of drm resources.  Change the driver to use the faux device
> > > > > > > instead as this is NOT a real platform device.
> > > > > > > 
> > > > > > > Cc: Louis Chauvet <louis.chauvet@bootlin.com>
> > > > > > > Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> > > > > > > Cc: Simona Vetter <simona@ffwll.ch>
> > > > > > > Cc: Melissa Wen <melissa.srw@gmail.com>
> > > > > > > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > > > > > > Cc: Maxime Ripard <mripard@kernel.org>
> > > > > > > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > > > > > > Cc: David Airlie <airlied@gmail.com>
> > > > > > > Cc: dri-devel@lists.freedesktop.org
> > > > > > > Reviewed-by: Lyude Paul <lyude@redhat.com>
> > > > > > > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > > > 
> > > > > Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > > > 
> > > > > > Tested-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > > > > Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
> > > > > > 
> > > > > > Thanks for the modification, it seems to work.
> > > > > 
> > > > > Should this patch be merged through DRM trees? drm-misc-next is at
> > > > > v6.14-rc4 and has struct faux_device.
> > > > 
> > > > Hi,
> > > > 
> > > > I was not aware the faux-device was merged, as it is a new feature, I
> > > > expected it to reach drm-misc-next on 6.15-rc1.
> > > 
> > > I added it to Linus's tree just so that DRM could get these changes into
> > > their tree now :)
> > > 
> > > > I plan to merge [1] today/tomorrow (well tested with platform_device), and
> > > > then I will submit an updated version of this patch (only trivial conflicts,
> > > > but never tested with multiple VKMS devices).
> > > > 
> > > > [1]:https://lore.kernel.org/all/20250218101214.5790-1-jose.exposito89@gmail.com/
> > > 
> > > Great, thanks!
> > > 
> > > greg k-h
> > 
> > Testing this patch again as part of some IGT tests I'm working on,
> > I noticed that, applying this patch on top of the latest drm-misc-next
> > triggers a warning at drivers/gpu/drm/drm_gem.c:571, in
> > drm_gem_get_pages():
> > 
> >     if (WARN_ON(!obj->filp))
> >             return ERR_PTR(-EINVAL);
> 
> I don't see how the faux bus change would have anything to do with a
> filp as that's not related as far as I can tell.  But I don't know the
> drm layer at all, where does that filp come from?

Yeah that filp is the shmem file that backs gem bo. That's very far away
from anything device/driver related datastrctures. If this is a new
failure due to the aux bux conversion then it would be really surprising.
-Sima

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch

