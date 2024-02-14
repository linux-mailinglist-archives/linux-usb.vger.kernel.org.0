Return-Path: <linux-usb+bounces-6387-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DC02785409C
	for <lists+linux-usb@lfdr.de>; Wed, 14 Feb 2024 01:04:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 51CE31F226C4
	for <lists+linux-usb@lfdr.de>; Wed, 14 Feb 2024 00:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8F5A33CF;
	Wed, 14 Feb 2024 00:03:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="RFc+zHDD"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A323A17E9
	for <linux-usb@vger.kernel.org>; Wed, 14 Feb 2024 00:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707869015; cv=none; b=pvf4z1nQHt8eAF4+SU48CUPeRR9VwSizjoxK+DaPLke4sLYi6vGmAhV2KkEd6eieFTQ+jBKB8CbDG6OOWnbVz7njo7Dvc/G0/7kfWZvjLSb2qwfPfONjhJaW1bXEz/aih4fKcyD8fxBUn6zDaql8TnbP//6HvCY4GIHvv+FWY3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707869015; c=relaxed/simple;
	bh=LUHwCmgFvsLI2w7Qfq1pAeSWXQrKo7dao4Gqpb0bey4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bGfrLYPjWFqWal7xBpL84kezqEK4W4TRBV9ATwl1x6KbercH0TfAHcWKpDKL9+mwAPCKvwWRbAg+gxHUo0zbyjg6b2C+cmiQhlRMrYY+ZY4kKSRImki5UGeZTF0WdSzWhppOJ4hS5ItsmFlH8LruBAW6ofohsp4WqNE5lfdRtr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=RFc+zHDD; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d10ae127ffso14420761fa.3
        for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 16:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1707869009; x=1708473809; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LUHwCmgFvsLI2w7Qfq1pAeSWXQrKo7dao4Gqpb0bey4=;
        b=RFc+zHDDHNHZPYY860JMcUjw1ieTPl0k3wPCGB1xgdl+6Whc110soGGTgVZNSfGmPO
         yYh5oG756OHA0+czTTUDsGKrEkOvy4nWfmlDrs6Z8w+uLNmkdqTUsGyKSbXyy7WJ4/L/
         8gbaVfoe1VuKUfWF8OyGCF2nH9a7BaGY0nmAg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707869009; x=1708473809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LUHwCmgFvsLI2w7Qfq1pAeSWXQrKo7dao4Gqpb0bey4=;
        b=EgxrA/dYtHcytSl/FCBaF45viUMpqLMX+E6IM4nKpP8JBsx7wl5nwx0PhVmaF0lbt3
         ReYb676POt3q8bb/xB/g5coFyx31ouZq0sNTnVc2YJqVeWXEs5gnI3E6U1cWLNml3zLi
         o0YMc1lYr99g88orey+uwgmYLIvEfVfabqlfOrVP7n0FVHdNVFJYu0oA1DFeVrI3fZsb
         I1qLusOBMMNihZtyXuoRh2/onLWNxJDmUZoOVH8oqIbM7Ldchf+361vqDRmGcxhOrnvf
         6+EbWYFYIhu6GYyeVxD9zgjg4OEKn5UQzppP33FIhV1TtE8SwB7D6NBZGI9Uf4WPM5nn
         vvRg==
X-Forwarded-Encrypted: i=1; AJvYcCUZfTqtxmyEN/VHpJ8UJznlQenBqtxyZdZWpp7899LJOS873bBkE1vyv2ahsn+ayPQyPz/qQYfIMzooaLbxlTanv0qylD6C16ly
X-Gm-Message-State: AOJu0YxeS1EgbTbpEQBqFp6FUw/WUgzCUhTI95L378K7sQBtf7gOwpV7
	m1JLJkT0FC5U/gD7zDqXEJDTjp/g7BTWuifPCzUnrgwsG2d/aN0pNsuPtSwdi0spK1z31uJFbj3
	ZhtGo
X-Google-Smtp-Source: AGHT+IHZkGx4QcHLn68zBGg7y9N4IR216ATFxZnXWjA71nd3QSdDpL5IKc2kTHaVztPeM5a8jl0PNA==
X-Received: by 2002:a2e:9bc7:0:b0:2d0:d209:122b with SMTP id w7-20020a2e9bc7000000b002d0d209122bmr696105ljj.6.1707869009192;
        Tue, 13 Feb 2024 16:03:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX5YmFiB/BYzCwkqiUVFJ+rrRxYe5g5ljwRI2Se/rSowuSm4Taf1E31UmIsXCmbsvsF+ZXoMCK2uWkIjRA7CO3amw7K/nkpMT9o
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com. [209.85.128.50])
        by smtp.gmail.com with ESMTPSA id f19-20020a056402151300b005611fc0cc11sm4161828edw.43.2024.02.13.16.03.27
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 16:03:28 -0800 (PST)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-411d9e901dcso42195e9.1
        for <linux-usb@vger.kernel.org>; Tue, 13 Feb 2024 16:03:27 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVYo/7KRT483dmif1tKDBkBgVk0sEKZQw2rOQma42bMErgMiLpJMtn1+vg4AVYQFx9WG+40JHHuL9Le2yeShUbKiCzF7qS+MHl0
X-Received: by 2002:a05:600c:519b:b0:411:e5c1:9b2a with SMTP id
 fa27-20020a05600c519b00b00411e5c19b2amr21434wmb.2.1707869006878; Tue, 13 Feb
 2024 16:03:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240210070934.2549994-1-swboyd@chromium.org> <20240210070934.2549994-5-swboyd@chromium.org>
In-Reply-To: <20240210070934.2549994-5-swboyd@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 13 Feb 2024 16:03:11 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UuunNnXJ0kAzRPVy0DX7Wv2eQOa-fMJQ-aKtaGnyQaQA@mail.gmail.com>
Message-ID: <CAD=FV=UuunNnXJ0kAzRPVy0DX7Wv2eQOa-fMJQ-aKtaGnyQaQA@mail.gmail.com>
Subject: Re: [PATCH 04/22] usb: core: Set connect_type of ports based on DT node
To: Stephen Boyd <swboyd@chromium.org>
Cc: chrome-platform@lists.linux.dev, linux-kernel@vger.kernel.org, 
	patches@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	Pin-yen Lin <treapking@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthias Kaehlcke <mka@chromium.org>, linux-usb@vger.kernel.org, 
	maciek swiech <drmasquatch@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Feb 9, 2024 at 11:09=E2=80=AFPM Stephen Boyd <swboyd@chromium.org> =
wrote:
>
> When a USB hub is described in DT, such as any device that matches the
> onboard-hub driver, the connect_type is set to "unknown" or
> USB_PORT_CONNECT_TYPE_UNKNOWN. This makes any device plugged into that
> USB port report their 'removable' device attribute as "unknown". Improve
> the connect_type attribute for ports, and in turn the removable
> attribute for USB devices, by looking for child devices with a reg
> property or an OF graph when the device is described in DT.
>
> If the graph exists, endpoints that are connected to a remote node must
> be something like a usb-{a,b,c}-connector compatible node, or an
> intermediate node like a redriver, and not a hardwired USB device on the
> board. Set the connect_type to USB_PORT_CONNECT_TYPE_HOT_PLUG in this
> case because the device is going to be plugged in. Set the connect_type
> to USB_PORT_CONNECT_TYPE_HARD_WIRED if there's a child node for the port
> like 'device@2' for port2. Set the connect_type to USB_PORT_NOT_USED if
> there isn't an endpoint or child node corresponding to the port number.

The above sounds good, but then I look at patch #18 ("dt-bindings:
chrome: Add binding for ChromeOS Pogo pin connector") and patch #22
("arm64: dts: qcom: sc7180-trogdor: Wire up USB and DP to
usb-c-connectors") and it makes my Spidey Sense tingle.

Specifically, I _think_ if a port is "hard wired" that can sometimes
tell the system that the port is a bit more trusted. In the case of
the "pogo" pins on detachables, though, I don't _think_ there's
anything that prevents someone from making a "pogo to USB A port"
adapter and then you could plug anything you wanted into the pogo
port. If there's any extra trust given to these "internal" ports a
nefarious attacker could presumably abuse that trust for the pogo
pins.

I have no idea if this is a realistic concern or not. I'm about 95%
sure that hardwired "PCIe" ports get extra trust and get "deferred
IOMMU flush" enabled and, in the case of PCIe, that actually is a real
security hole. For USB, though, I think the system is more isolated by
the USB host controller so I'm not sure that there is any extra trust
given to "hard wired" ports. ...so maybe the answer here is to just
ignore my rambling. ...or maybe the answer here is that everything is
fine but patches #18 and #22 should be modified not to cause the pogo
pins to be considered as "hard wired" since they really aren't...


-Doug

