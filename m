Return-Path: <linux-usb+bounces-22165-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5804CA71408
	for <lists+linux-usb@lfdr.de>; Wed, 26 Mar 2025 10:46:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32F3B18978B9
	for <lists+linux-usb@lfdr.de>; Wed, 26 Mar 2025 09:46:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C376A1A23AC;
	Wed, 26 Mar 2025 09:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="EslX+LhK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48C6F189919
	for <linux-usb@vger.kernel.org>; Wed, 26 Mar 2025 09:46:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742982375; cv=none; b=YtBtfznGApltAL/SYOEcKyI5zah40JzY7wTHeyMC9J/d93q5trH1DA/g+1cpJYXe7nhpSbYih19RL50nJXhD1hYRI8r2M1NBgW9L030aI9GmBdtr7xU100yc3krGGpw6bORmDuRRSugrn3oMtR9EZy3RlVFrVgCwjNZ3wt844Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742982375; c=relaxed/simple;
	bh=gJIYGQR+RiGM0XJWCm7NWAzwfhYCn3x9TxE2VX287jg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XBoZG5WWhsuaO6WCtCbFzi3AexqnJp+lMEJw/JhlP63tWWK8f3AZHc6R+RC5JwXHnakDaNGy3si5v+E+6tprZ6Mwqjo+K9adNH5qtTQJqOF3hcBgK1Ws8yl7L6vHxUlzlJL4wmUWr3+jy3Hf/m9EFxjaYHX4Lx8y8rOtDZImLUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=EslX+LhK; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac2963dc379so1112157366b.2
        for <linux-usb@vger.kernel.org>; Wed, 26 Mar 2025 02:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1742982371; x=1743587171; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9/kXXpYh2KweuiB5zHwjY0q/TjqrU3OfimILMTsVvAo=;
        b=EslX+LhKXdrPfZT36eafoi5lnJKtuJIdH0X+vutYf208eI3Um4drcmiL/leOFxKuQ/
         iHL7RHrVkkP6ecOsOAdixpOJn3plizjTP9ohyiHn+vi1HM5ivMEvAysv2FQ1ScXwN3DX
         7cCi+qk7ab5XAQhORW96if/0RQBjIw1cctobq22k+tHJtuipVFOkO3J5jszdeMgF27Gb
         qfEDy79uih87UjqXP1DDo3OON4eFuUumqTd60iWzdBKoPoG/kut6F7XSn39M208dMsS5
         fj5vmRMMk9BR5FleJ6cFPoH/YN8/ZoIE4L/JXG+oDEv1UhdPikKJdOzeulFav8a5GJlT
         U+lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742982371; x=1743587171;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9/kXXpYh2KweuiB5zHwjY0q/TjqrU3OfimILMTsVvAo=;
        b=IV4YoSivE0b6iuR42Vk7Gibn4b/PlfXnmyi3QwC57BesIH0AKqzTb0NdJpSoXX/1X0
         Zps4KzwK+v+XGuL5WhrYu8fFvkJaJe1la03t27s0ylyWp9eXzXdAU9vaD53CEexr/1Ut
         zAzkyiijMFlj2U0ICS+GGDQYPFSMtypfMiBmdXWXObPIaT8BJSj6UMFSkJe9u6QmNltm
         uoDu0mTNnOEDUKI4mI8MzgH3D//+5ACOv17gvG/QSROXfanAsrdTOcI0t6eIMmiORJD7
         OKYlbAhdODY5YPCRrGV4Y9jdcw+4+MH1K9DQ6fyPieMrqKCD5+4+QXMJO5pLD/tBzmcI
         OVEg==
X-Forwarded-Encrypted: i=1; AJvYcCWb6jAcCZZPlRiUP+zaxi+dGLsxkJXaQb8L8SJuBw5OgYqOMchejPyG4I31WGI6jOovZVRBsTzKZH4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaCSK7OB3F3cwtRlDBMuTRrqvd5jtNyCT2Czzk7E8dEALt8ilX
	xD2oDFehqc5FeQV2XLUrwONtcUOzduZrL5IDgGzg1NSNhMgnHoCcfKccVdltqxo=
X-Gm-Gg: ASbGncuihv9npIj13c+0hrI9jZVR8BbnYFUcLjSo6k536OF/geEJBz69ZWbF3z/p4L6
	DzyBms7fuVY+nH31lH7noSVjeT9PDovX8u4cyeHba7IMTgbEyCksK2hcDVG/k3cHNKg8plfwPxw
	CVViq82CHqCeqRL4s9tjGTlG14KIN/t8IvyLx3zru+es7W8qefYuPvt5DkC/yNlZtJL1sScryZH
	ZJoRNRipcGmkmGtZjus+M5Z3Y1Rtd0AtvUwU/ra09jmcWoRgBxtuDzzFjWEj0yo7JGeqhOaLHa9
	VY6a0/U3MD3asBdgGbf6fdqFGtn7CE9tD9hHLP2rJDlAtdksPdOcmqtfXtVVVwY1KBxt9gRDEWn
	P/I8uN6LEOu0p
X-Google-Smtp-Source: AGHT+IHx/kCnyQhbohYhyZQ+ypuL87ESt4h+TC7om1KV6AWAGl0sRqBA5fm81htRzwYvpmm4nlJCag==
X-Received: by 2002:a17:907:3dab:b0:ac3:3cfc:a59a with SMTP id a640c23a62f3a-ac3f26b18e4mr1876478266b.45.1742982371410;
        Wed, 26 Mar 2025 02:46:11 -0700 (PDT)
Received: from ?IPV6:2a02:3033:273:9b44:1f61:c513:306b:cf0e? ([2a02:3033:273:9b44:1f61:c513:306b:cf0e])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac3efbdca5dsm997614466b.137.2025.03.26.02.46.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Mar 2025 02:46:11 -0700 (PDT)
Message-ID: <59f34bce-1069-446f-92ee-934cbad3d7ac@suse.com>
Date: Wed, 26 Mar 2025 10:46:08 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] net: usb: usbnet: restore usb%d name exception for
 local mac addresses
To: Dominique Martinet <dominique.martinet@atmark-techno.com>,
 Oliver Neukum <oneukum@suse.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 Ahmed Naseef <naseefkm@gmail.com>
References: <20250326-usbnet_rename-v2-1-57eb21fcff26@atmark-techno.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20250326-usbnet_rename-v2-1-57eb21fcff26@atmark-techno.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 26.03.25 09:32, Dominique Martinet wrote:
> commit 8a7d12d674ac ("net: usb: usbnet: fix name regression") assumed
> that local addresses always came from the kernel, but some devices hand
> out local mac addresses so we ended up with point-to-point devices with
> a mac set by the driver, renaming to eth%d when they used to be named
> usb%d.
> 
> Userspace should not rely on device name, but for the sake of stability
> restore the local mac address check portion of the naming exception:
> point to point devices which either have no mac set by the driver or
> have a local mac handed out by the driver will keep the usb%d name.
> 
> (some USB LTE modems are known to hand out a stable mac from the locally
> administered range; that mac appears to be random (different for
> mulitple devices) and can be reset with device-specific commands, so
> while such devices would benefit from getting a OUI reserved, we have
> to deal with these and might as well preserve the existing behavior
> to avoid breaking fragile openwrt configurations and such on upgrade.)
> 
> Link: https://lkml.kernel.org/r/20241203130457.904325-1-asmadeus@codewreck.org
> Fixes: 8a7d12d674ac ("net: usb: usbnet: fix name regression")
> Cc: stable@vger.kernel.org
> Tested-by: Ahmed Naseef <naseefkm@gmail.com>
> Signed-off-by: Dominique Martinet <dominique.martinet@atmark-techno.com>
Acked-by: Oliver Neukum <oneukum@suse.com>

