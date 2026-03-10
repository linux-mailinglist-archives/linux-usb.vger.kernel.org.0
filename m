Return-Path: <linux-usb+bounces-34503-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uIu1AXySsGkukgIAu9opvQ
	(envelope-from <linux-usb+bounces-34503-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 22:51:56 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C7F25881E
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 22:51:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id AF41F30288F5
	for <lists+linux-usb@lfdr.de>; Tue, 10 Mar 2026 21:51:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17B933EF649;
	Tue, 10 Mar 2026 21:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="agrDekfh"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA4736B05F
	for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2026 21:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773179505; cv=none; b=PIqUvzJaJ5Lf3nZnFJUHq9IzP036M0sdEetIMaab8VHsJpK+BUpDtHf9Z4ssdsY3U+Keq0Qm4tft6r9CXPKy3BxpBEcPJ6Nz5kTkbQNxmi1SCtYJd8YfK5374WyRINPbe2JV1x6xuIjcfwScpOKUPx6/n/xtWfXMsttPSVFurfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773179505; c=relaxed/simple;
	bh=5jFwpdm4F865nFToowbZNNLOqXArLK8lbWEAUbeUW1I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BWC1bp/o4kPJvaDWEhz/wZ+3IrmzzhP3617XyjUZnscKZdIs9ZjlqntaQZd2j9jzLoebZafulWcA0yRDewWbxqeIZ6fboHYgxHvWsrvCZwCMucs+3P+YvJujBPljKOljZJ9wMtYX3zTCGWuK7T9Dl8SUPycAZ2xCYazWkDmQEsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=agrDekfh; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-89a1d7cc7f0so59584846d6.1
        for <linux-usb@vger.kernel.org>; Tue, 10 Mar 2026 14:51:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1773179503; x=1773784303; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=L1vUhAEqcvWgjmawKDwZyP12GKPpRd3m8G2VHGenhtM=;
        b=agrDekfhGyn84snMnaTOrjCVaaYaLMJuTIDtVeMb8Ej+iVXArWLdlQp20vWTATMEQO
         js6xptErlDXnt/glcGY579KEm/HUR4t30dLWhEtw3IbfflFOGEj3OEk0Y1k7fuZoQryL
         +3e7WqALqCulVU9wTx8aTfRlaBi7/7lvNQoAU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773179503; x=1773784303;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L1vUhAEqcvWgjmawKDwZyP12GKPpRd3m8G2VHGenhtM=;
        b=JwGSpxsqTUvr6V6DF7nS8avKe40mcVVIJmT793IMtTKHDzG62NQo0FASh7VkzUzjc3
         52XNccSSFGzx6VJZc+aLzdwa6JDzJ0RjPkzfYUgTNKfGPNlulTDQDoLSSlzEm0p73qEw
         wUPUA1/yzlnorsj6c7e01kMTOnr8XWKz3ItqL1RJu/GEvUdUtm1biq+tuup7qwfCkKUC
         QOyES24T9P0Ww5F65quO715YN68WV6fO2xpw+lBJcVK2l+113sUcJF2KuF/Qxe0XT5EA
         AlwmIYZn7kOBDzLdCGdSURaOqV0KZoWZPYoBLKtPCKgpekazjjG4MUe5O1CZFhjkuRwP
         lruw==
X-Forwarded-Encrypted: i=1; AJvYcCWZ+uXFVTX5XeNTKitHd+KP5mMgAy175qqsvocFVXW3OQi//UjIZ9j38njVXpo2bwfKfp/LC5wWYz0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9EL4sfSZDjel4Nck21D1HszSyYr3H1FpJKFdWCw+ShNJziV50
	+RZK0wzqhvs3QYqDIMjOU8bSGjmX8oAltvfmUBEmjVXYVcnS4nONidy9UHcHudKRYrA=
X-Gm-Gg: ATEYQzx7Hg6iPr1Ps8otkAw823ii2F2B42+V5aIRTdkF1QUJPMUXasXfSvh9hDCuMUw
	/uLqrVTZXcOLJxCGFjYO6TtCOHA9PqlsUOwDRnEPPU0eS2m0glh9U7tzFcGQHenRCaLLxeEquMV
	aVl8NMNGu6hhEO+JdX7ormj8tSijQ4cuVa/ohxKbl1cDDgJi5+4Hr1z3cvarSvnENs91QER7tNR
	1f972VpzHXP8Kh3E3A0xNCKpcQIIk41DPAtQT+heSQ7whFHAf4mu1fQCEmILs/d/MB7AimHx3pO
	eF1433CrduRTbq9KvwFAVH5NGdSXDXCjgxQY7LxefqX9xHOUXKRGyht5/SW3JYZT2o9L41U9hls
	ml0sKoAZgjjfD7a/H+v4h9Xiyhgvra62mKkmtQqQwJ122knwidU2xtVU9d/ZUUKawUhnATtROqb
	1R7vazUn8FjJz2xGM0aI1GGSNCMR1S3qmNcSk=
X-Received: by 2002:a05:6214:242e:b0:89a:321:a198 with SMTP id 6a1803df08f44-89a66a8affdmr2399896d6.45.1773179503269;
        Tue, 10 Mar 2026 14:51:43 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a65d2160asm2176056d6.52.2026.03.10.14.51.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 14:51:42 -0700 (PDT)
Message-ID: <55fcc500-afa5-4ee7-bde8-c5eec6932764@linuxfoundation.org>
Date: Tue, 10 Mar 2026 15:51:41 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] USB: usbip: drop redundant device reference
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bastien Nocera <hadess@hadess.net>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20260305133851.2952-1-johan@kernel.org>
 <20260305133851.2952-3-johan@kernel.org>
 <9d727cd2-701e-4c5b-9646-82874f2d0a4a@linuxfoundation.org>
 <aa_X1qNsCGll04zj@hovoldconsulting.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <aa_X1qNsCGll04zj@hovoldconsulting.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 04C7F25881E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,hadess.net,gmail.com,kernel.org,zenithal.me,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	TAGGED_FROM(0.00)[bounces-34503-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[skhan@linuxfoundation.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,linuxfoundation.org:dkim,linuxfoundation.org:mid]
X-Rspamd-Action: no action

On 3/10/26 02:35, Johan Hovold wrote:
> On Mon, Mar 09, 2026 at 02:26:03PM -0600, Shuah Khan wrote:
>> On 3/5/26 06:38, Johan Hovold wrote:
>>> Driver core holds a reference to the USB device while it is bound to a
>>> driver and there is no need to take additional references unless the
>>> structure is needed after disconnect.
>>
>> In this case it is necessary for stub driver to hang on to the reference
>> to maintain exported device status.
> 
> But the driver does not hold on to the reference taken at probe after
> disconnect returns. The stub device itself is even freed at disconnect
> and cannot be used to release the reference.
> 
> Which exported device status are you referring to here?

I am referring to the device status that usbip host exports to
the client side. The interaction between host and client is
handled from stub rx, tx, and also event handler.

Having the reference to the device helps so the device sticks
around until the stub driver no longer needs it so we don't see
use after free type issues.

thanks,
-- Shuah

