Return-Path: <linux-usb+bounces-3734-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E2655805462
	for <lists+linux-usb@lfdr.de>; Tue,  5 Dec 2023 13:38:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F2CC1C20BFA
	for <lists+linux-usb@lfdr.de>; Tue,  5 Dec 2023 12:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D00F65C098;
	Tue,  5 Dec 2023 12:38:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="DTLwHBOS"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30FE010F
	for <linux-usb@vger.kernel.org>; Tue,  5 Dec 2023 04:38:09 -0800 (PST)
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-54c5ed26cf6so5462844a12.3
        for <linux-usb@vger.kernel.org>; Tue, 05 Dec 2023 04:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1701779887; x=1702384687; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Dxm8cerVHymNLIIrywRDORm8w9Eawb1cpkE5aBevEHg=;
        b=DTLwHBOSOXIaPGD9Yyn20z65aflaAuQJIVcKEhY0VwpSg2/eAT+dv6QtmbSuRtiAYY
         mfYtwa2r5SwuwGkO7hJ8vnKJ7FescPHmdtlU55F9TyhvixsEos1zRdWIrdkaET+5KC70
         swr+Em6Law2SKwzrTlGEKskvwlLxtvre7KUD1H7zu4st03noEWIEx4cooDT99AADy4Yu
         b40I0Z5OEipf6X7EA9tau3xp2UkB+qXt3dDaw7yDZN4okvX7BHrU1Qif39AIpVj8M5KW
         pjUS0bzbSZH2KkOCOZXfEyIXA5DahkWCX83df/fIWDimzJ51mVD/LNNhmfBLP5HLyvre
         NRJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701779887; x=1702384687;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Dxm8cerVHymNLIIrywRDORm8w9Eawb1cpkE5aBevEHg=;
        b=U+djvG+K3tr3Y2rgrDRwObmdY9DOGESqhD+4K/xdG1SI6TdHUvMb7ee6HZ0GIKFgaj
         Zl/hoaVF0JnG3/F95yF2uEDNZRTeERlIwHi9Q+zSsKVV/Ex7ypTVEylHNvDpucC+9ESX
         Kdj50VazpVy1VQuqh+3ssIjlPNMkxUjU5MIkXegOPoJFkFgabQ+x3axlSzDEKcI52+Aa
         +RCCT+82FKxmpV1e6jociHcGf9XNSg3xPX1tvrFUR/0SgzQZWlMIaaW335kjuC+Lf+zq
         lFBXmbBTEA5YFJYaPIyqoOqMAfvJQUZ5uZahT8f774hGWNQ2zgsUGFBgPnYmP48hc/cE
         FF3g==
X-Gm-Message-State: AOJu0YxTiPnzleFSCVPgkfWKYLba89f0TRC3+6pb8wxyq5dTut9zdg/W
	9WUhjOOA5AexJglHv9yB7cvH+A==
X-Google-Smtp-Source: AGHT+IHz6Whtq7gsdxTeh+8RkemlaakPqiKWSDcBOixi5hwhbYseHH84f0himdhYJsvvyVIZpEKg4A==
X-Received: by 2002:a17:906:3bc9:b0:a19:a19b:55d3 with SMTP id v9-20020a1709063bc900b00a19a19b55d3mr421863ejf.99.1701779887717;
        Tue, 05 Dec 2023 04:38:07 -0800 (PST)
Received: from ?IPV6:2001:a61:1362:9c01:78ff:1f81:1ea8:d077? ([2001:a61:1362:9c01:78ff:1f81:1ea8:d077])
        by smtp.gmail.com with ESMTPSA id r25-20020a170906c29900b00a1cbe52300csm491575ejz.56.2023.12.05.04.38.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Dec 2023 04:38:07 -0800 (PST)
Message-ID: <a13fc273-20ee-4027-9508-7e8e93a9cd29@suse.com>
Date: Tue, 5 Dec 2023 13:38:06 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Question regarding CDC NCM and VNC performance issue
Content-Language: en-US
To: Hiago De Franco <hiagofranco@gmail.com>, oneukum@suse.com
Cc: davem@davemloft.net, edumazet@google.com, hiago.franco@toradex.com,
 kuba@kernel.org, linux-usb@vger.kernel.org, pabeni@redhat.com
References: <df7a9e1e-3399-4ebe-bfcc-4cb0ac164f99@suse.com>
 <20231205122204.10556-1-hiagofranco@gmail.com>
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20231205122204.10556-1-hiagofranco@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 05.12.23 13:22, Hiago De Franco wrote:

Hi,

> During the ping, nothing changes, VNC continues to be extremely slow.

I was wondering whether you ping itself has bad delays.

> I switched from NCM to ECM for testing purposes. On ECM, everything works
> seamlessly without any issues. It appears that the problem may be specific
> to the combination of NCM and the Linux host machine, as the setup works
> fine on Windows.
> 
> I'm curious if there are issues with NCM and small USB packet lengths.
> The VNC application tends to send numerous small packets (1514 bytes).

1514 is a standard ethernet packet. What is wNtbOutMaxDatagrams on your
device?

	Regards
		Oliver

