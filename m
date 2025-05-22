Return-Path: <linux-usb+bounces-24243-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B565AC166C
	for <lists+linux-usb@lfdr.de>; Fri, 23 May 2025 00:07:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9738D3B617F
	for <lists+linux-usb@lfdr.de>; Thu, 22 May 2025 22:06:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2ABEC267B7B;
	Thu, 22 May 2025 22:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="A7epSZXr"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0660D1FC10E
	for <linux-usb@vger.kernel.org>; Thu, 22 May 2025 22:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747951622; cv=none; b=PfakQviY2pgFGmyRGbLVoLTKHojNHGh0h330SlYILXaSmqID8T8BIlN0z0pWGHFCUjuxG4jf58o7GCsZmwcBRyDE83/MTjoF/xo1Q3aAMsQHu9RltaRWbL6J2V2UQ4u0UdUPOiS17xsTub1d6BQ1HdDKTuSjXSRqk9UgDomex2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747951622; c=relaxed/simple;
	bh=+ziH4L1fj/WawKBmygBQqGSjMGlJL0h/8JxKq/2EZ3I=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:Cc:
	 In-Reply-To:Content-Type; b=EzHp5/xKn5TQdSDMjDiZ6D3wygTzrnKaAW0vSnly12eEiplfvP3nMOrmcn+aGDv1ysY8gmvK4L8QKvJsUMtwa0InKtRLvi7isf+JFtsXHoN3cTTfZxgqT0b/Ajs6TzSFltS5ZjDFUoMOk6GkFu0hq7Djp5CfnOsJ5W4gyxFScbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=A7epSZXr; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-85d9a87660fso975483439f.1
        for <linux-usb@vger.kernel.org>; Thu, 22 May 2025 15:06:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1747951619; x=1748556419; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BjFkOmkoXjep+mNz63KtTRRsGFoUbqDZNEb6wb8W2k4=;
        b=A7epSZXrdz5bGtwgpY+Ed7Z63HUSGCiGzdfAwSnVae+s5hALvZVBRlBF34PFo3cZ1U
         DgM4JW9AdInWEwa09TxudVTzQEYXKEyIt0M0AkACKGawMFwGCTnjVRTUWYWIelWQhEDd
         gqypzE6yRWOSQgRfs1OWe0m9h87+xQ2OeJxyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747951619; x=1748556419;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BjFkOmkoXjep+mNz63KtTRRsGFoUbqDZNEb6wb8W2k4=;
        b=wlelU2WhwmEeDSdq/pKw3QT2zX7vMSZ+wP4AlqLn4bouWZwvQNcBlpWQujxmho8DXn
         BHU8e9SFsPgkaiOkRTe2WeM8KWXRLqaqUnsL3UbYPXsv+Ay2EfSfZTozbR5Bzf4OlfUc
         1B17iOzUV2cv/QOgOU4Dyg19p2rFD3L4vj7YQEN3PZCERAbCqO0sHMEnCtX+ryMOLm9H
         aaneppigxNq+LRUX66XhI7eEbKOAzOonTpr5ilyIS+3b5lvPHAUMAufiDJi3TabqGbDO
         0VsIAlDAd63rh/ZwbryfcwYlx3BZkUzadQVmVoFJm2fYjqPKnPGelZwv3968/EzQm4OW
         0csg==
X-Forwarded-Encrypted: i=1; AJvYcCUQQwt4/yWUK9vBdTBnVKQ2l+w4Wp/rrLr3NRvLe0kElx+v5rtTldD0ERB037IdLF5AJtTJ5wJlFgw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9An1jSxrcWmV4TFUCaRK/8Lsp1qi75Z4pCGJwkhsS77BnRuWo
	cG/a42cJ2K7CNa4WZrqQtahulxNILATGlqQ4Bi9lhxWbCZKNplEl8uSUZ2vc8JUGvVn6CmFNowB
	qrfdJ
X-Gm-Gg: ASbGncs1YbD4lFUOOS9VlSc4a0GVRbH4VwV+b75Nc+i/uRY97loEp9aUmadeVi5QS+5
	oWq/LL3nyPa0MN2M8A1Xw4zwmxUAJidcYgk93mNFZ1CRVB8CeOtpfDfYR2l8HIo7tf5Z6FcUiw6
	/EB1AhNl9rSViJ81xAxPF3iUBG2JOU+ysYtqb2+IDfFPHNiWxVuJ8k4wfFy3uvIPUiheToNhtSo
	UKooq2Yxz6TkmlxSU/mxL1mfCAIEDPbTF5bxUGgxGmR2MVs9j5DUrZDyOo8xGO8/BI3uQoTKbD3
	AsrvHX/s16xoly1PzLhWYS3gU2vPE3EbNBMpddFDno/CPvbVP4KYIFxfq4fpEA==
X-Google-Smtp-Source: AGHT+IHuxdB18+eFzu0MuxSpLm5bE3m7S9ea+jPvS7YM6qPOcn1YFf1He1Vhv/3ovbWij13zWCOvQw==
X-Received: by 2002:a05:6e02:3184:b0:3dc:7b3d:6a37 with SMTP id e9e14a558f8ab-3dc7b3d7069mr149741775ab.8.1747951618986;
        Thu, 22 May 2025 15:06:58 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3db843cfa19sm37638285ab.5.2025.05.22.15.06.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 15:06:58 -0700 (PDT)
Message-ID: <1d5ec639-74b4-42d0-af2d-7b505ad65f70@linuxfoundation.org>
Date: Thu, 22 May 2025 16:06:56 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] [1/3] usbipd: enable SO_KEEPALIVE socket option for
 accepted connection
To: Vadym Hrynchyshyn <vadimgrn@gmail.com>, valentina.manea.m@gmail.com,
 shuah@kernel.org, i@zenithal.me, linux-usb@vger.kernel.org
References: <20250516075204.7950-1-vadimgrn@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
Cc: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250516075204.7950-1-vadimgrn@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/16/25 01:52, Vadym Hrynchyshyn wrote:
>      - If usbip client does not close a TCP/IP connection to a daemon
>        gracefully, the daemon will keep this connection open indefinitely.
> 
>      - The issue is that the client cannot attach this device again
>        until the device will be rebinded on server side by commands:
>        usbip unbind -b X-Y
>        usbip bind -b X-Y
> 
>      - usbip client enables tcp keepalive by calling
>        usbip_net_set_keepalive from usbip_net_tcp_connect.
>        usbip daemon now enables this socket option too
>        for accepted connection.

Please check a few change logs to for the correct format.

> 
> Signed-off-by: Vadym Hrynchyshyn <vadimgrn@gmail.com>
> ---
>   tools/usb/usbip/src/usbipd.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/tools/usb/usbip/src/usbipd.c b/tools/usb/usbip/src/usbipd.c
> index 48398a78e88a..d89633d8f799 100644
> --- a/tools/usb/usbip/src/usbipd.c
> +++ b/tools/usb/usbip/src/usbipd.c
> @@ -119,6 +119,7 @@ static int recv_request_import(int sockfd)
>   	if (found) {
>   		/* should set TCP_NODELAY for usbip */
>   		usbip_net_set_nodelay(sockfd);
> +		usbip_net_set_keepalive(sockfd);
>   
>   		/* export device needs a TCP/IP socket descriptor */
>   		status = usbip_export_device(edev, sockfd);

How did you find these problems - Also this series could use a
cover letter explaining the changes - how these problems are
found

thanks,
-- Shuah

