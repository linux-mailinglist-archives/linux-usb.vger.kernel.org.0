Return-Path: <linux-usb+bounces-7152-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AF2E2869F35
	for <lists+linux-usb@lfdr.de>; Tue, 27 Feb 2024 19:38:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 658A51F2B375
	for <lists+linux-usb@lfdr.de>; Tue, 27 Feb 2024 18:38:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC6BA3E48E;
	Tue, 27 Feb 2024 18:38:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bJJp9EJt"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22C294A2D
	for <linux-usb@vger.kernel.org>; Tue, 27 Feb 2024 18:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709059086; cv=none; b=SKGOD6RyYXmO4K0AYhF77MbC7BJQoZyY0a4GcpOdzt6vWWH7yZfI3LJbdEP/ArXLzl+j2S01h/byyK/fmDNTTwLZ+OJLKRoXbur9wb1RlorTvJhRRqpZU+q0RObmuS2WgIcFy7/XDotsVCdEB+7mslkFTwUWUj2CmTYxH4EiJBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709059086; c=relaxed/simple;
	bh=kESpsdO4FlnESQiL59fX61xhGswvPE38dgcnrNXEDQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BQf1UQ5DxfeDkOycQFoxe5PfbJuTW9aBO4+jLToZedU2ZpHv5cG8AFxa717UWlTqXmecIpHQFg6bimdRmaVATjRKeT+8wwk6K+ydMdit1Z96m2P72to4NCIQCmtJJdV/Xt0omjsHqOM61cLE4BmO1IZVkEsLQR7LY3Xn0T8kxV4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bJJp9EJt; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-365169e0938so213275ab.0
        for <linux-usb@vger.kernel.org>; Tue, 27 Feb 2024 10:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1709059084; x=1709663884; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zaG4Gr4Kx+0i0zsq6oXYlyOK6u158LHOb5Hpg9y9dtA=;
        b=bJJp9EJt0C9GtT/FF6xYbLoDj0BaS1oxph3hsJXy87XlarRb1sV1RO3UV1NfAFSGm6
         yx0snscqczTNlqXsGty1Rz4EjSAYneiG0geLEGPGY4Kh0wzswLQXZVtpXojUXmKiKqtd
         twXpwSNJzrpEFB5J9fTV7MRmL9XNW4THXHvfU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709059084; x=1709663884;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zaG4Gr4Kx+0i0zsq6oXYlyOK6u158LHOb5Hpg9y9dtA=;
        b=Gr5NKXu551sz0x6yKoyyFWHweB9ROnJn+V5RNGHAKU/fQSN6NE0f624bf9mEs3ejPS
         jzA90UDYJCpcQ+AVVrsDjYNaeH9EHtaQqR5NR0r58+ehk88eiC6LwcKyq8yvK/lfdO3j
         ytTDFqEEuQ/ozUKLtf1r65rGFDoZZKDI74zxUUo5TGLl0+rkaJjpGHW9KkXtIrlA9Y1d
         wS0hC71o8D7NMz1rwkQWvKbROit3A/A4rujgOk9fTL3D0zbEKGSOGl6cO6G62+LCyfra
         DzyAhVnSzKpV+T8NfMYPQ7D3GBnktzoR6v7wMIBCoSY0bmMi3BD3KeavZ+5eQRgXTxfq
         hCBA==
X-Forwarded-Encrypted: i=1; AJvYcCWXCENmPNP6dsXoFHl68jGZIb5u6N1TrhdN2gHdHhyUWWYZPnFO2+82jGbr0hJ81SvUsF7QFrFXWURaluN5UC84nOnG5vqBtsf0
X-Gm-Message-State: AOJu0YzJVfZqIlqWUi6MZbc2gJ7qq+tWePCc/3jPklT2hDrDG95Xw2G1
	nEps3qfklgMkKsxscfX1ZIZv7zicQcpyselpxc7V5utO02zLFC1Hr7sf27iUJQ==
X-Google-Smtp-Source: AGHT+IEeZR7+1yyy7wcg6Jz8cOZdq5xTguaXhSCIcOHuTDOZFBcHwqro5Caz+F2LmDujB9cHZH+DyQ==
X-Received: by 2002:a92:cb0b:0:b0:365:616a:72da with SMTP id s11-20020a92cb0b000000b00365616a72damr143131ilo.7.1709059084386;
        Tue, 27 Feb 2024 10:38:04 -0800 (PST)
Received: from localhost (147.220.222.35.bc.googleusercontent.com. [35.222.220.147])
        by smtp.gmail.com with UTF8SMTPSA id f5-20020a056e0212a500b00363ea1209basm2294457ilr.11.2024.02.27.10.38.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Feb 2024 10:38:03 -0800 (PST)
Date: Tue, 27 Feb 2024 18:38:03 +0000
From: Matthias Kaehlcke <mka@chromium.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Bear Wang <bear.wang@mediatek.com>,
	Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Yow-shin Liou <yow-shin.liou@mediatek.com>,
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH 2/2] usb: misc: onboard_usb_hub: Add support for TI
 TUSB8020B
Message-ID: <Zd4sCyPNNjzB5Gre@google.com>
References: <20240227090228.22156-1-macpaul.lin@mediatek.com>
 <20240227090228.22156-2-macpaul.lin@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240227090228.22156-2-macpaul.lin@mediatek.com>

On Tue, Feb 27, 2024 at 05:02:28PM +0800, Macpaul Lin wrote:
> The TI TUSB8020B is a 2-port USB 3.0 hub. Add support for
> this hub in the driver in order to bring up reset, and supply
> dependencies.
> 
> Power-up: Issue a GPIO reset (GRSTz) 3ms after VDD and VDD33 stabilize.
> 
> Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>

Generally this looks good to me, but it should probably wait for
"usb: misc: onboard_dev: use device supply names" [1] to land and
use a device specific supply name instead of 'vdd'.

[1] https://lore.kernel.org/linux-usb/20240220-onboard_xvf3500-v4-6-dc1617cc5dd4@wolfvision.net/

