Return-Path: <linux-usb+bounces-3706-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7F4803CAA
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 19:19:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D08201C20A55
	for <lists+linux-usb@lfdr.de>; Mon,  4 Dec 2023 18:19:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 478722F848;
	Mon,  4 Dec 2023 18:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="aVw1RKlX"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCA57CA
	for <linux-usb@vger.kernel.org>; Mon,  4 Dec 2023 10:19:22 -0800 (PST)
Received: by mail-il1-x134.google.com with SMTP id e9e14a558f8ab-35d626e4f79so1781285ab.0
        for <linux-usb@vger.kernel.org>; Mon, 04 Dec 2023 10:19:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1701713962; x=1702318762; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dBNv3IbWjBVpXKO0KWS/oZmgI8ueyLpWoqPSPTS7jmA=;
        b=aVw1RKlXrDKEN0YrryTeh/rTuxdOqB2pOzFua2DZTCVv5uAlE97wXwb9ko3uKAABoM
         gsHAzWccKhmMX2ze4YeMY19VPpB2ps/2blXMhQYSfGyfWHD0iERHRDLJZbYJ575CrWgE
         X1GprKRlB4PGgmceUMzrpmothSZwlBPYVmXKw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701713962; x=1702318762;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dBNv3IbWjBVpXKO0KWS/oZmgI8ueyLpWoqPSPTS7jmA=;
        b=P6G9cAirI1DZlwrebPJY2p1aNlZPAvvw0HJNDULpBBBfSbLqgBRSWFtRoV5QuQ62mv
         qjURf1NEMvTtpU+iqPaP7mt5jndFheF4zCkNGaZuEBfz+VhyQYV7gkOcBSe0YDGFDFiN
         CKrHmYE3w42vA3nA0pO517MjDLEx/3YPGowtmuBtJMOtjlMc/G64VCsy18CEDO4LAKL1
         kQYQfPOsdi+ZMWILNBxewe4USZ+ms2NnyZPf5lurK8hCe+5Hah5901QElWNxowBzhED1
         kCkGvHdhK76SnZsTq+ORRIz4BPLHDnAYZrkANIp77ELX7Vz1vMp1ZAqDfrpD0VhDV6dP
         9NXg==
X-Gm-Message-State: AOJu0YyG/D23knao5WaUdKD5YKe5FA6nbW5LLCyCzAOX33ktCJvRejQ0
	/2nkNTJi103BdKgZV7UwUh32dw==
X-Google-Smtp-Source: AGHT+IFMDZKhGaKgWVoGSb6Btx7wquC0v9+rJdeAZcJBVDCP41JQU98ri/DZPxY0fVPGXjqX0iOIYw==
X-Received: by 2002:a05:6e02:2167:b0:35d:4688:e9aa with SMTP id s7-20020a056e02216700b0035d4688e9aamr14115886ilv.1.1701713962134;
        Mon, 04 Dec 2023 10:19:22 -0800 (PST)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id bg15-20020a056e02310f00b0035d30f0675csm51564ilb.5.2023.12.04.10.19.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Dec 2023 10:19:21 -0800 (PST)
Message-ID: <834f187e-a469-4457-b4fa-6a6eb0419ea8@linuxfoundation.org>
Date: Mon, 4 Dec 2023 11:19:21 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] usbip: Don't submit special requests twice
Content-Language: en-US
To: Simon Holesch <simon@holesch.de>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20231130231650.22410-1-simon@holesch.de>
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20231130231650.22410-1-simon@holesch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/30/23 16:10, Simon Holesch wrote:
> Skip submitting URBs, when identical requests were already sent in
> tweak_special_requests(). Instead call the completion handler directly
> to return the result of the URB.
> 
> Even though submitting those requests twice should be harmless, there
> are USB devices that react poorly to some duplicated requests.
> 
> One example is the ChipIdea controller implementation in U-Boot: The
> second SET_CONFIURATION request makes U-Boot disable and re-enable all
> endpoints. Re-enabling an endpoint in the ChipIdea controller, however,
> was broken until U-Boot commit b272c8792502 ("usb: ci: Fix gadget
> reinit").
> 
> Signed-off-by: Simon Holesch <simon@holesch.de>
> ---
> 
> Changes in v3:
> - handle errors in tweak_* routines: send URB if tweaking fails
> 
> Changes in v2:
> - explain change in commit message
> 
> Thanks again for the feedback!

Looks good to me.

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah


