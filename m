Return-Path: <linux-usb+bounces-11785-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4052891C48E
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2024 19:15:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DF5361F21A5A
	for <lists+linux-usb@lfdr.de>; Fri, 28 Jun 2024 17:15:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C110C1CCCAD;
	Fri, 28 Jun 2024 17:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="eqv5eF6l"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFD323D0
	for <linux-usb@vger.kernel.org>; Fri, 28 Jun 2024 17:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719594933; cv=none; b=qzeQYJuPC79CSt9Ep/WRiFdm8CxIXk2Oou/O2sYm9K9p9CSUbctd4sAXEzWq9XS37obIvMVdt32QIHcQyY2wk0f3/ICfxvJGoolMW3U8HS/8wsW0YS14531pkC5s/jmA6e98qb5w2rYuet+bN3e28WU5cvjV4seXJxeQq3Urdv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719594933; c=relaxed/simple;
	bh=4IwJjCbkcI9ioxglHRz/ZJAYJoonlFehzoAB1ceYFLA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=R39WmnuYGST+8fO/I55j5hBbRGyVhnsJLvRat+Gn0dTTE5l1pk6Apeeyeqe2nyAccccVqqo9ZmfmlHqaEh2PuTFkHiP6sA6SolYDaHO9ZLaZpCCTqvGKh6grfIFgOQrXKsIdK/PtTzrqWZDC/Pj6u7xJ36yO/FlWE2jly7fkmoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=eqv5eF6l; arc=none smtp.client-ip=209.85.166.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f42.google.com with SMTP id ca18e2360f4ac-7f59854ace1so1592739f.2
        for <linux-usb@vger.kernel.org>; Fri, 28 Jun 2024 10:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1719594929; x=1720199729; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=D/j4eGhOaAY3yoztRoWYvbEMIVafpbJK0SZsDiA+E4k=;
        b=eqv5eF6lVH3etrZni/X5gtf/vgXSXgisVKSDJruVnkWLlcr45AmgVYwygBXfD1JV6q
         Gp+Dutlwc1VqLQO4365zwukVeHeuk4BO3v3or8fMngUxOaGxYGHDOJgbGlzjQYl9hrFP
         h7q+TWSmJsixewXbmJq5yNB9yPJ5qPptlcNOo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719594929; x=1720199729;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D/j4eGhOaAY3yoztRoWYvbEMIVafpbJK0SZsDiA+E4k=;
        b=rA9nZ1E3GtXBhcmOidGgiKR3NGrVRlsQKPNXGDqcDUtxBkuPLSyd7SVwcZA8DUHv5P
         VanFRDEFrLANZAENkO0P9b9qeFydzxm1SZm+HGILHINdfKfmdrtdg9RnhHocoddgRPi+
         WC0RvR8jCKUbmSW5l9VH68YHWqUKPMWkB6Q0oBTnQmqRr0UtJijDchBu7QxhUwp8tcyy
         zfdDDjlgocNWI3EVmI7PyX59J7+Hf9olsK/jbBx+BHevtPem9U11XsPGSPrWNeI6jt5v
         Edetdf40cynO+BDIPu3/bvby4y0XxJ9OjLu9ReOSLFmXSGmyNYmbWllCtHCWLJfe9stW
         gYWQ==
X-Forwarded-Encrypted: i=1; AJvYcCX3unfdEfUk9SOmPqaoRwXrKZfM/K+sRDjbyreycKiAS6jIFX3x8Ubz0pl6T38bJTY2rScWubI5fd8fUVoH5r8/27RNuhZ5PS9b
X-Gm-Message-State: AOJu0Yz+hiQ4VhO0BhOHd4etm0NrA5Z/g59nm9VAZmWA7GfHhps/3fZj
	Zn8+pXPczcNWJq0oP/XyMV2Dq/p26wH1KA/VIjhB8LL2aMOA4L1EDEg5itbNmeI=
X-Google-Smtp-Source: AGHT+IEvoWVb/REB+KdFAMwhK7nALye46Ii+qf/gBh4MtnSRuqaBh9+CBE69BXuZPghz8H69rs6kIA==
X-Received: by 2002:a5d:984e:0:b0:7f3:9dd3:15bf with SMTP id ca18e2360f4ac-7f39dd317famr1616390939f.0.1719594929314;
        Fri, 28 Jun 2024 10:15:29 -0700 (PDT)
Received: from [192.168.1.128] ([38.175.170.29])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-7f61d112dbcsm57549439f.46.2024.06.28.10.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Jun 2024 10:15:28 -0700 (PDT)
Message-ID: <8c94fa65-780e-44d2-8e75-5cdc51cee9f6@linuxfoundation.org>
Date: Fri, 28 Jun 2024 11:15:28 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH] usb: usbip: remove unnecessary cmd variable
To: Xiaobo Liu <cppcoffee@gmail.com>, valentina.manea.m@gmail.com,
 shuah@kernel.org, i@zenithal.me
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20240628104616.16441-1-cppcoffee@gmail.com>
Content-Language: en-US
In-Reply-To: <20240628104616.16441-1-cppcoffee@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/28/24 04:46, Xiaobo Liu wrote:
> There are two redundant if conditions that can be simplified to directly use pdu->u.cmd_submit.
> 

I see you sent the same patch twice without indicating that it is a
resend with a change in subject line.

How did you determine this change is necessary?

> Signed-off-by: Xiaobo Liu <cppcoffee@gmail.com>
> ---
>   drivers/usb/usbip/usbip_common.c | 10 +---------
>   1 file changed, 1 insertion(+), 9 deletions(-)
> 
> diff --git a/drivers/usb/usbip/usbip_common.c b/drivers/usb/usbip/usbip_common.c
> index a2b2da125..74a01a265 100644
> --- a/drivers/usb/usbip/usbip_common.c
> +++ b/drivers/usb/usbip/usbip_common.c
> @@ -568,17 +568,9 @@ static void correct_endian_ret_unlink(struct usbip_header_ret_unlink *pdu,
>   
>   void usbip_header_correct_endian(struct usbip_header *pdu, int send)
>   {
> -	__u32 cmd = 0;
> -
> -	if (send)
> -		cmd = pdu->base.command;
> -
>   	correct_endian_basic(&pdu->base, send);

Did you check what correct_endian_basic() does and why
it is important to check "send" and assign "cmd"

>   
> -	if (!send)
> -		cmd = pdu->base.command;

It is necessary to assign the command after calling
> -
> -	switch (cmd) {
> +	switch (pdu->base.command) {
>   	case USBIP_CMD_SUBMIT:
>   		correct_endian_cmd_submit(&pdu->u.cmd_submit, send);
>   		break;

This patch will introduce an error. NAK on this patch.

thanks,
-- Shuah

