Return-Path: <linux-usb+bounces-7352-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BDA686CEE1
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 17:24:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47DA11F213FA
	for <lists+linux-usb@lfdr.de>; Thu, 29 Feb 2024 16:24:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 180F86CBE2;
	Thu, 29 Feb 2024 16:19:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="d+aJNMO2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BDD74AEF2
	for <linux-usb@vger.kernel.org>; Thu, 29 Feb 2024 16:19:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709223542; cv=none; b=Hj8c2KBn9f0aGiQiqLExWNHalrB8zZLwUwcXCha1DvDO+j3bSSO32kUdTGieH7hdXVro6D7buH3TPTt1FWB1q2aC4qFURNdXK3lhRKZhbfqGcJN2dTkkynZIslJX5fnzt9OzXiB6RRjenkGwyKmt2I0ySAOxUarl6vyjyZXUxz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709223542; c=relaxed/simple;
	bh=YhuaUfzpQDJP9Vs9GKlifVrtbWHfF96cotaDa7Ud97s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OpOZ8PutKtRrGVAexqDrog2ms4OJHX2xAb93dNwS3Z591e5Zaa3UDYdS1dJt6aWs0frJ96TnM2wuh+/2uko58A0GqI8CCMTUMay20KBBvxtwHzpPqz7ZbjJ5lpR21oP9e1rDjwyG3frDT3UQxUb9hn7hSBdIGn9/l4Si4KImR6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=d+aJNMO2; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-364f791a428so5477885ab.3
        for <linux-usb@vger.kernel.org>; Thu, 29 Feb 2024 08:19:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709223540; x=1709828340; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iDjcaSL55qXYMAB4NoyOKMuTj/7aaFa6rN5hETeg1qE=;
        b=d+aJNMO2scqiwmjNY5/hcZFF+cPVJJgX2N5qgCud0ot9L/01Mszq8p3B53puztCZvB
         5+o3kQ4fJtgJ28dIAnfB7qr8UJBfSYDHTzHMWCnseafU4mmLFCzj7HugWWfnvwLpnirv
         ND6ytKOb+8jk4i/z81eoYDIO6KIOMzjYSNCpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709223540; x=1709828340;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iDjcaSL55qXYMAB4NoyOKMuTj/7aaFa6rN5hETeg1qE=;
        b=lxxrJsJB+WpLmWKVYV1TgebFYBCPtYGZoyrm0xMWYAJymKg4F90p292wx6T9nGo0v6
         sh38inwoirUhg3wF7LmjXXlDTateEvNpItLloHj6RBn9KvTwXgFMvM4Nd5hFXtGTYcr1
         ZRMz+TN7TBXCMg/7HodMvL+pjFh17f+VEkO4xB892nTu3P2qo7S9CN1I/UZCe2fckUkA
         USYwrQuEqsy42RettWBajzA5PQqnFEcGPZKiAcBKS4hxjoo3WTzh3Fg8SpCXfQtSpTRQ
         19rJnCirlEEjzpt9AUimBDmuBmhhCcc4o4NqAXZTacowdqSLn6aj89HI+1lf8VkPW5fF
         yY3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXPV3QqB+NHGSZOXFXrd+zIBFbE4HH9AwdxXp92lLMM98Csp8hdFM8bGGR1U0sA5by/pWBc6oHacHFvOyJymeireW7d7M9GbzRL
X-Gm-Message-State: AOJu0YxJmwJhIB8JaZotsV7Xq+9Grv7Xlx0k2pcJv2cx7miDezVl8QYD
	JuW/g1J2ntqbhiFiuenNwIrPxYFXdtFUa0k+wdcrlXUrwJ0+dT7OhKH3sIDyyw==
X-Google-Smtp-Source: AGHT+IG6SYsudTR8afpmPjLzEt8KXtmaUS4neFhh1HH4JtsY7zddGu+EDbyGNsZuVMQLqJ/dxguupg==
X-Received: by 2002:a92:d404:0:b0:363:c2d4:a365 with SMTP id q4-20020a92d404000000b00363c2d4a365mr2789045ilm.26.1709223540248;
        Thu, 29 Feb 2024 08:19:00 -0800 (PST)
Received: from localhost (144.57.222.35.bc.googleusercontent.com. [35.222.57.144])
        by smtp.gmail.com with UTF8SMTPSA id v4-20020a056e020f8400b00365cdc51c7esm93507ilo.30.2024.02.29.08.18.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 08:18:59 -0800 (PST)
Date: Thu, 29 Feb 2024 16:18:58 +0000
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
Subject: Re: [PATCH v6 1/9] usb: misc: onboard_hub: use pointer consistently
 in the probe function
Message-ID: <ZeCucidYlrO7f-7t@google.com>
References: <20240229-onboard_xvf3500-v6-0-a0aff2947040@wolfvision.net>
 <20240229-onboard_xvf3500-v6-1-a0aff2947040@wolfvision.net>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240229-onboard_xvf3500-v6-1-a0aff2947040@wolfvision.net>

On Thu, Feb 29, 2024 at 09:34:44AM +0100, Javier Carrasco wrote:
> Commit 14485de431b0 ("usb: Use device_get_match_data()") overlooked the
> already existing pointer to pdev->dev 'dev'.
> 
> Use the existing pointer 'dev' in device_get_match_data() to keep code
> consistency.
> 
> Signed-off-by: Javier Carrasco <javier.carrasco@wolfvision.net>

Acked-by: Matthias Kaehlcke <mka@chromium.org>

