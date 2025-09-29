Return-Path: <linux-usb+bounces-28768-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8AFBA8709
	for <lists+linux-usb@lfdr.de>; Mon, 29 Sep 2025 10:45:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 968347AA5B5
	for <lists+linux-usb@lfdr.de>; Mon, 29 Sep 2025 08:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FECE27A46E;
	Mon, 29 Sep 2025 08:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ST/ESEZu"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DF1E625
	for <linux-usb@vger.kernel.org>; Mon, 29 Sep 2025 08:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759135525; cv=none; b=pqynDH5vPsfrWXV5MNPnQXVpnhLwgaHVt5DccAReOEQyhHwjzBSwYRsAnDUMDH15/5vWKbpuxqxPchzS93/DoYpFxr7CePjVdhTvozR/42a/NWsKzcHpu5tQR3wrFbvuu1q6k2dj3kJrmtT1BfvkSX6x9JCReqUwPJzN+XBEUew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759135525; c=relaxed/simple;
	bh=JA5RcchFYlhuPWUk0QU0LXC1hOJDFmGNvkc+GbXI3SE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AB57emSJ1Lw6u5FPChU1A246LJFUJJMgDR3SSr56KA5UOnp8e38MSmN+02y54cXvpC2hEE76/J4pXOvfDOEyyacDuj3nPOg37mngbhiuW/UYrSPudPMsfXp2fkxmY+Mbgn83M92tinho+IYcWZQBqQ264DUAu+JHOZdplDroxqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ST/ESEZu; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b346142c74aso834250066b.2
        for <linux-usb@vger.kernel.org>; Mon, 29 Sep 2025 01:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1759135520; x=1759740320; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JzgdahQX7CpJGFCwerveyZDbQ9cci5T/X+7S64lDTAg=;
        b=ST/ESEZuHtRKND2eHFIjgGbniHnBJ819SB+lliLLxqNrGtp+6ifk8tyMBZC/Pxjoqz
         4sD9SJ2PExnnhlkcdMH3KDN9Qgb0gcleKb8XK2POebZyb6ILKdkhcWo9s9uFKOIkuvAG
         tG7yNaGmPmhhZ19qg9YlG/gPRm5e3nBiZzmLTgybtOk/Bl3XerCQKHxJD9hxPF0qSVON
         T+3nGi921CFFNsvpc5P2zyQRnd7mvCgb9aX9YHO0wcInxs+hXgKcHlYCOMlLL2B3Aj8L
         SBmM+PrTpgdpRpM4N9ZPTfmQ21bQiXgw/+Vzo8Ry76crmlgQF/4GofqMavj7hrS3P3XZ
         dQ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759135520; x=1759740320;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JzgdahQX7CpJGFCwerveyZDbQ9cci5T/X+7S64lDTAg=;
        b=hYv5GWZ+mPEWjuBtzhjBK7g1sMiR/jfXTyAO351JiHPGA/5i9ZOUr5Ue6GjyyfNZ1s
         PVQr8ZH8Gq+9D7cMTat+femyBgfEWeycCPYp0UwXpZnFNs4xVyttunu6N6IU+N2+nmtT
         dCPIVlxWV/RdLi8A42JaYBESUzIx6A0TJcNQ2/SCCZ31EymO13ZhVawkAJwDT3pBcQPF
         L1OAWMZZnM8I1R31bTtJYUhmWBeNIn2IN21x+X232nYjG9IxRzUuzjgXW4emMQy1+rfG
         Dzsm4GL+Sxk/wQgn4iiFdmGyK74DwWF2LHIbnJnJ+fl2p2+fvglCsHBj5lJzrG8DgD+X
         to5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXL9ZMWBErvirzibSzxEaYrssutvn8rIPJoFNiNUPrGqXEAIof9cDLa1lgNhJtmA+rN/zgC5c6TNCM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxznCadqFuhTQcj9NQMA1dSJ4YcRIkAabG0SnCaFAXBC/oYXW6f
	4AhX+h1EoWmXSnqxl6ORKtjJKbnkVwZZbpTbItmWs0QJE3stIOg7WnClgcr2HWMrtT4=
X-Gm-Gg: ASbGncv23D35TioCeurCMynXL8nFtiKHZ/5sgR63MLIO8yhyEiTWq2SmOEg4Az6pPmk
	l9db8vohfvecLW7lKX89r79qFIUOp+PJYVxl20MuTXeF2p5Ovh9Jq5XJvMYnanG5QVeGKcPPSO5
	oK73DVhgZPL31iDxdywyoBmcQ46wVDzCM9X0hxp8MEmS9j/acl4z0aWLq8rM/iwuoFZIMxTq6l+
	Igbbu/L8kMCD+i65E8mLZepY003AtHgA6WtC+h1ldik8cexq5izXqRJ60KgorcoV4u/nh2T3AT8
	U4c+GtU6WUJTbU7XISVfQA6qcnoWnod7yIvg7ogoQ9gpg6O7lTRQZdZtt+F+TIgYZROHvsl/Jk4
	/RTEX5aGDPh4Tj/QxWL1ucM2pFj1IokU+mWINoeB97KGkcnbSIaN9+qGUtarQSQfroagE5wo18q
	Y6CQ==
X-Google-Smtp-Source: AGHT+IEv4AziFZ1Nh8lMEPO0Ww5j1EhMHxyQUOxBTv+gGU/fjEeiR6fpWcDmVWpjseN1umlDr3eTdA==
X-Received: by 2002:a17:907:7b9e:b0:b04:6546:347e with SMTP id a640c23a62f3a-b34baf43cd6mr1653315966b.51.1759135520413;
        Mon, 29 Sep 2025 01:45:20 -0700 (PDT)
Received: from ?IPV6:2001:a61:13a1:1:4136:3ce:cdaa:75d2? ([2001:a61:13a1:1:4136:3ce:cdaa:75d2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b3545a98300sm862948966b.106.2025.09.29.01.45.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Sep 2025 01:45:20 -0700 (PDT)
Message-ID: <c9e14156-6b98-4eda-8b31-154f89030244@suse.com>
Date: Mon, 29 Sep 2025 10:45:19 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] net: usb: support quirks in usbnet
To: yicongsrfy@163.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org
Cc: marcan@marcan.st, pabeni@redhat.com, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, yicong@kylinos.cn
References: <20250928014631.2832243-1-yicongsrfy@163.com>
 <20250928014631.2832243-2-yicongsrfy@163.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20250928014631.2832243-2-yicongsrfy@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 28.09.25 03:46, yicongsrfy@163.com wrote:
> From: Yi Cong <yicong@kylinos.cn>
> 
> Some vendors' USB network interface controllers (NICs) may be compatible
> with multiple drivers.
And here is the basic problem. This issue is not an issue specific to
usbnet. It arises everywhere we have a specific and a general
driver. Hence it ought to be solved in generic way in usbcore.

Nor can we do this with a simple list of devices, as we cannot
assume that the more specific driver is compiled in all systems.
An unconditional quirk is acceptable _only_ if usbnet would
not work.

Please get in contact with the core USB developers. The problem
needs to be solved, but this is not a solution.

	Regards
		Oliver

Nacked-by: Oliver Neukum <oneukum@suse.com>


