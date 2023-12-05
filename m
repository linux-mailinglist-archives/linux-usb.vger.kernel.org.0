Return-Path: <linux-usb+bounces-3729-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FD3804EAB
	for <lists+linux-usb@lfdr.de>; Tue,  5 Dec 2023 10:50:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 00D472816A0
	for <lists+linux-usb@lfdr.de>; Tue,  5 Dec 2023 09:50:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A391B495DF;
	Tue,  5 Dec 2023 09:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="UPOag59d"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BF069A
	for <linux-usb@vger.kernel.org>; Tue,  5 Dec 2023 01:50:22 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40c09f5a7cfso24362035e9.0
        for <linux-usb@vger.kernel.org>; Tue, 05 Dec 2023 01:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701769820; x=1702374620; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cBV4B4TbyE8Idb38ySCm9bhGFw3XKWiHtHIiEhuAXKc=;
        b=UPOag59dB5a1aRg/mN/oXnRYQAwioUZqQcuZVliekg+KeF7IPwv+qSQl7PzVmqTNOG
         0KWw7MTQM9rp2VfVV1RtKgcmdS8zicHMTimH/J5ASnaAywfOb1o6C7v8n7okyfxVTOd7
         L/0MibiaCIRho9GFS7bO7kT6dwH8t9btnTyz2zXTunDD4yeSySDqJLgdTI8G1o5G3eyn
         lf1Iidu/0jJwYE203WE9l2HHPGPCBEla8PgmXjdBWTFHWPwFoYGZPzCEguNC5/OwlM2X
         4Y3DeqeLltd0AW6TTzzoV9G+zYe/bOtA49trHScwDGPwzRenjJ+EwIvzAuDcWs2+3au5
         AhUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701769820; x=1702374620;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cBV4B4TbyE8Idb38ySCm9bhGFw3XKWiHtHIiEhuAXKc=;
        b=w9Nuq3EC1QY86EAHCuFJIWJBwHd/HFwe844WSv15f/eR6lQ42OYGDB+DJXkfiT1xcD
         5bukMYDDaRGQOHo6mhJ0XLKNbIzT2d984QXXI4li4ean6TBqzl5AelE11s4C9FacerKX
         DbUiE7aU3XeYxskcjRs7IWnP/1wKN156IMUhKMHvknruHICRV+SEpdX4+ej6XcUFsrvt
         aYByfqPMHeGp67wHCh3OOsElv5nT14s/rhWOjAFcXhT+6iltZ+m67hZsRTNDER8cHae8
         O7nA/+qYZKfvpCDaGNA83aUM1dAFebaKKiQlC7kN3RTqqlzqluGDjUCfWgjIrVbbOquQ
         a3IQ==
X-Gm-Message-State: AOJu0YzwyjLMGOBoyIT/4ncdA6ShU/uoqLo/vfc9gRQG0yYJka+IY+PB
	3/Ug/R0pWRJcIajfXe72kZxPqg==
X-Google-Smtp-Source: AGHT+IG7eAmkxY6rdcw+fjUx2OrqFIBHl11dMIZIv4ptjHXtDNEopEjWv9DDqbkNCB5lNRQVNKo2bw==
X-Received: by 2002:a05:600c:35d1:b0:40b:5e21:ec2a with SMTP id r17-20020a05600c35d100b0040b5e21ec2amr294053wmq.92.1701769820549;
        Tue, 05 Dec 2023 01:50:20 -0800 (PST)
Received: from ?IPV6:2001:a61:1362:9c01:78ff:1f81:1ea8:d077? ([2001:a61:1362:9c01:78ff:1f81:1ea8:d077])
        by smtp.gmail.com with ESMTPSA id d7-20020a05600c3ac700b0040b632f31d2sm13092839wms.5.2023.12.05.01.50.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Dec 2023 01:50:20 -0800 (PST)
Message-ID: <df7a9e1e-3399-4ebe-bfcc-4cb0ac164f99@suse.com>
Date: Tue, 5 Dec 2023 10:50:19 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question regarding CDC NCM and VNC performance issue
Content-Language: en-US
To: Hiago De Franco <hiagofranco@gmail.com>, linux-usb@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Hiago De Franco <hiago.franco@toradex.com>
References: <20231204183751.64202-1-hiagofranco@gmail.com>
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20231204183751.64202-1-hiagofranco@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04.12.23 19:37, Hiago De Franco wrote:

> 
> Has anyone encountered a similar issue before? Could this be related to
> the size or quantity of transmitted packages?

At first thought my gut feeling is that the packet bonding is killing
your performance. What does a simple ping do?

	Regards
		Oliver



