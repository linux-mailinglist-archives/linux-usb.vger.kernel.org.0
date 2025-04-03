Return-Path: <linux-usb+bounces-22508-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CE8A7A332
	for <lists+linux-usb@lfdr.de>; Thu,  3 Apr 2025 14:58:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCFDB1756D2
	for <lists+linux-usb@lfdr.de>; Thu,  3 Apr 2025 12:58:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62E7B24E004;
	Thu,  3 Apr 2025 12:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="QWVrWoRA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B9C24CEE2
	for <linux-usb@vger.kernel.org>; Thu,  3 Apr 2025 12:58:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743685090; cv=none; b=L1FcFht4uduYz1cn/S7LFXxpALyIdhqR/J/4FevOhQ5eYvh+BjrNnW0BnVAwGlj13g7upmI2rjsVMTFBaXQCq2KA439MkgjD0jH+IWc1741DQiqzOjGcek/ogwUunnL9KbZxwJUfF9fkzGXOJn1cMHnfQvTh+kz4mmcEnXag/r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743685090; c=relaxed/simple;
	bh=5lZqUDo6retLEYQq8f/IujxgSO3arSNp20tkYnFXMk8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=N9HjKB5Wn6zW9sO2/2fHdTWgAFUrB4gV++7LAV04kSW0zs12A5JUcdAFjn/tx6swf54LIIgscpPNY76V3oshRERtbUQAwxx2KD9IEu7pbfCkqqRiaHFsPLNcdYPwOeEazRa+tmNTGXa4yZnuRz0I1I7JiAYuCMywIXfr9U8SC0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=QWVrWoRA; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39c1ee0fd43so780999f8f.0
        for <linux-usb@vger.kernel.org>; Thu, 03 Apr 2025 05:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743685087; x=1744289887; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VGSVVdKSkkVyYLkY9/8lMMVLNLq3M4C348aXpcVXaeQ=;
        b=QWVrWoRAeBAGBk4RMtXIX4XN6Hh0nFlj4Vb6rhgBTItZEd4eCG7D+Z8jwLQlZXfAvh
         1dBMrbUDJ7QHc9dES0t77pm8ykJnKMtU4Ypol/XWNHh1TfSc6QH0xIWQwqnQBzHaxgaa
         /x4Qsv2OPxBTp98nNlQbTEQrp7x+m/dUNGZSf8QXMxrAiMSPACiym6DvVqgvcLh0vrOj
         bHFZfzfyIydmDPALV8ExG5MaqS4P6UC/zq12FHIkgIENdTuQw1qV7SXGjKWJHiNTu9W6
         2qQ6UWxe50tiGIOnXtsO6nTtRKT3RFxys26YnOvl0El5uNz2SQvKDExpOWlrDc9VNbGn
         DJOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743685087; x=1744289887;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VGSVVdKSkkVyYLkY9/8lMMVLNLq3M4C348aXpcVXaeQ=;
        b=GUmqSoT/ogR4foKjfsuB/pP3L5SAWi/LeHFE4phDB8c5wsJ6Kuho2rSPSJqagHoHSC
         jrtGd1wEj9Nj5xtKvEg7hMvjgDvTc4AqF2/fm1RP2AIQL7uxkMGfGiYXcBfqvQNBJcmM
         uL8bvmgSHKrdqR0kkfQNHD7p7LHd7xyVuZOXzuwe9PUz+N3Jba+SL1gHBRvFFb+YLMzS
         AXwVVxYIIMaVS7ZvuZbpXw8OWuxiGioPrbWSs7xxjT5TMKdyzOswDwsr8Cp3k76Pg5TW
         /N8f07EHco4BM9FhtLXJg+UKKSzw/KUyLDBTR9j50uZCI+BnCNX3RVaArcYJ2tapj/Zu
         XLzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEtT3ytPHlHx+HydFEOhAZ04VIQ8cFR/d0sfnAgTIOsQBKnzcoSwugov7LWi6gcrNFSK07GCtrQnk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz37Gn+J4YYt+L1QoXaJgs0cG5y+LGFmaGuhXi4+v2Del6DOa+B
	eIm46QfbDIfoT6OJnEn+QIWmUtJwlcklZTjLHrJgODrCkrQdD4uf95Ri+d5WSes=
X-Gm-Gg: ASbGncud8y56m0KBH2iW6MJ6OrlnuLmYxVxhqnl7fLZh/bLsgSujerpIK8fwgHcy0oY
	oHGavUD8+S3h8H0son8R4m9aXQCPgJ5EeJwQzcwXX1rivpSSjgxIH1FjWNIdh59vp/xoMwGoaXL
	ahV5SccJbBVX2ktz4nKiYwos61MU5ITod8OE6eBWjHHhQHVv+ALV+rW8gjlVIhQGhWe9fNH3wix
	qbokqUgZm/9aKbNwts5BHQDtF1WUW+53L3tx5+/e4c9Wvx5iG6e3OyVjFoNQO12zDBHHbR9vw7R
	6ekiknw+QdYwJ4oeKjuSlLxLFyFLEKpk0bqKk6/k4CHcYZXzOZcjyO6fd5vujNDBZbC0p0S3Gdh
	1KfrggxiJMo9s
X-Google-Smtp-Source: AGHT+IHhf9OtXbh563A5vCjBU6R0fi7IKUcWNJ7VxTX/ybtcLH+h8VNDon2gEMcL/OsmtqQ3EV6SsA==
X-Received: by 2002:adf:ef90:0:b0:39b:fa24:950a with SMTP id ffacd0b85a97d-39c2f94be58mr1810329f8f.36.1743685086874;
        Thu, 03 Apr 2025 05:58:06 -0700 (PDT)
Received: from ?IPV6:2001:a61:13de:3001:df6d:4862:3a59:9c90? ([2001:a61:13de:3001:df6d:4862:3a59:9c90])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1795782sm21077425e9.26.2025.04.03.05.58.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 05:58:06 -0700 (PDT)
Message-ID: <6f6b48cb-6b9d-4637-9dd0-4464c4b795da@suse.com>
Date: Thu, 3 Apr 2025 14:58:05 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Handling incoming ZLP in cdc-wdm
To: Robert Hodaszi <robert.hodaszi@digi.com>,
 "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 =?UTF-8?Q?Bj=C3=B8rn_Mork?= <bjorn@mork.no>
References: <bd07dc48-d6f5-4a95-9dc4-c738640349d1@digi.com>
 <ade69712-836c-4cd9-ba79-79b2d97fba83@digi.com>
 <dc8500a8-df6a-45d4-8ce3-1dad4b8f2413@suse.com>
 <a9bc14f2-7f07-44c0-96fa-0616402792e7@digi.com>
 <d1a9bfca-0c94-4770-b5a9-c7d0432dd476@suse.com>
 <e73dd429-55c1-499c-82f1-f9553ce06cda@digi.com>
 <28a5c207-6c2e-42e1-9568-2f949554026e@suse.com>
 <8de930f3-2e87-443d-9e8f-9d6f16f7a399@digi.com>
 <3296aaff-a591-4fcd-b421-9cfcc6291d2b@suse.com>
 <898977f7-3882-4ffe-8833-c44f06914337@digi.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <898977f7-3882-4ffe-8833-c44f06914337@digi.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 03.04.25 13:49, Robert Hodaszi wrote:

> 
>     +    if (length == 0) {
>     +        dev_dbg(&desc->intf->dev, "received ZLP\n");
>     +        goto skip_error;

Please use a dedicated label for this. No need to retest length

Otherwise it looks good to me.

	Regards
		Oliver


