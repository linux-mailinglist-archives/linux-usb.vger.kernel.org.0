Return-Path: <linux-usb+bounces-7362-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D2486D387
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 20:43:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A1C511C20DD8
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 19:43:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C92CD13C9E1;
	Thu, 29 Feb 2024 19:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nyDsyHcU"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com [209.85.166.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE91613C9D6
	for <linux-usb@vger.kernel.org>; Thu, 29 Feb 2024 19:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709235825; cv=none; b=qS9SQxEogCIhh5vWUnhDQjWPu/K6OTAyhyHLEzZgtKVD3zDCyaOQSKRSnxDrJuUbZ0n32GsMecuY3+ioj0VpPdvYMYw5uT/s7dz6YvGqQVhBxr+DJlLooUj2JlKmJAH254X5aRZFzwAWxA7AiO/aKinrpDkozJZOUXa78Tmu5cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709235825; c=relaxed/simple;
	bh=7Zq+gh4T8LIelYKBo/Vnz3ml4VoKW5MNYt5ad4EfTjs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UKk1lqhacfVnK7jskvzvTOFUYN48UMuREeG10y/If/TTOmoF3XBJc2xlc1/RYoZ7pkqfFURKAOCDd7AU9k8z74bPPWT+mH9fwSTSyAlNPD1L7FIpzXqgxlMmUDZv4JXgvb9d/8QJTl5XHGzZ05mesbM4cDIlb/rY7gL5ojKOxJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nyDsyHcU; arc=none smtp.client-ip=209.85.166.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-io1-f49.google.com with SMTP id ca18e2360f4ac-7c7476a11e0so72771839f.3
        for <linux-usb@vger.kernel.org>; Thu, 29 Feb 2024 11:43:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709235823; x=1709840623; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vPzWpf0KRKzJfNNxm1xP82WyABEHBYT/ScSU2rL7CkM=;
        b=nyDsyHcUmMAfzQuBxW2XM7VbPdoencgSUn5MNRoW9Z1X5QfAC+Vb28k5kmroFuLjDW
         trSEfSYKClTca60YkN3Awsy9pA/W3wRiAZMBrCTc9oWjVRe4lpNOZ3NC+Iq8pMLWtZG0
         hvfqPlp7D3wufkTBhrp3YvhuDcneIO572dFKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709235823; x=1709840623;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vPzWpf0KRKzJfNNxm1xP82WyABEHBYT/ScSU2rL7CkM=;
        b=olUwmOj/B9d1+xsxfdlM2rwppRQ/pbZEejO87q/k8K10+EJrmAKEhpogHTVJ+DpVBx
         Fw0VIprMRG6y2ylaGaN4RSOCXf6A8HKdUY2SyHpMt7Wo12eBWRzeZHcEXErvEcrWc+Ns
         U5hyFhLhf+VpSddD4jUl1PrpmUTaig8BXvhwp83GfMdbHl7RsGccEhmq3pExnGMS8es5
         wfkxLdQ5XhfA08GCyq9QUvIWK8wQ0wnorNi78+z/h/S7UDUUIqP6s2nILxUMkRIONWS+
         lXQVVWcr9lgXqg9o+SeNR8mDV+M0FPMA/aOUiHw7YOoF8iSkeCM33G4aGMUV/c4EdAyx
         5PeQ==
X-Forwarded-Encrypted: i=1; AJvYcCUkfZ9jSScbweWkx9NZ4kDsPtIYHPVs7B9giqitUDdUgsit4/ZyE1II99m6nH72Te7IHLkpSR6CMwQ9QN7I89kh1iCRFpNVbhIb
X-Gm-Message-State: AOJu0YwzADS70O+gL+nkuLg5LZJo7AONsDi/jJpO8Ym3RMAw2ExzvI2m
	y6UfLjK1DuZrZy8W83eOcnMI/6KbPm4RbmegnucZJFNzXQXey7q7IqowAL2TRA==
X-Google-Smtp-Source: AGHT+IFs9wvs5pOAkDdWryJuttZydoEKEVDVwn8LfV2HYXPgDEXsihSPEp+kjzLHY+xQ9IiRbWM32w==
X-Received: by 2002:a05:6602:2c48:b0:7c8:1437:4b07 with SMTP id x8-20020a0566022c4800b007c814374b07mr2416906iov.20.1709235823176;
        Thu, 29 Feb 2024 11:43:43 -0800 (PST)
Received: from localhost (144.57.222.35.bc.googleusercontent.com. [35.222.57.144])
        by smtp.gmail.com with UTF8SMTPSA id m8-20020a0566380ac800b0047472bc0182sm465429jab.63.2024.02.29.11.43.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 11:43:42 -0800 (PST)
Date: Thu, 29 Feb 2024 19:43:42 +0000
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
Subject: Re: [PATCH v6 6/9] ARM: multi_v7_defconfig: update ONBOARD_USB_HUB
 to ONBOAD_USB_DEV
Message-ID: <ZeDeboeqDe88gKj2@google.com>
References: <20240229-onboard_xvf3500-v6-0-a0aff2947040@wolfvision.net>
 <20240229-onboard_xvf3500-v6-6-a0aff2947040@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240229-onboard_xvf3500-v6-6-a0aff2947040@wolfvision.net>

On Thu, Feb 29, 2024 at 09:34:49AM +0100, Javier Carrasco wrote:
> The onboard_usb_hub driver has been updated to support non-hub devices,
> which has led to some renaming. Update to the new name accordingly.
> 
> Update to the new name (ONBOARD_USB_DEV) accordingly.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>

