Return-Path: <linux-usb+bounces-28988-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A48BC2ECC
	for <lists+linux-usb@lfdr.de>; Wed, 08 Oct 2025 01:12:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 661344E9CD3
	for <lists+linux-usb@lfdr.de>; Tue,  7 Oct 2025 23:12:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69063259CAB;
	Tue,  7 Oct 2025 23:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="d3X0o8Px"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10890253B67
	for <linux-usb@vger.kernel.org>; Tue,  7 Oct 2025 23:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759878749; cv=none; b=RphBrh1BuyW2B1ySXrS3I7pQR5388UAC6HQ7h3VCo046VzVizAVTsakiZB7+20CxpdGVxNOKR60dyJPFGcgNLg8tUSPXZ/u7T54qfolTqVuLJ0jT2bwKo/8X9aJ8rphZUfPgb1rCKLVBsg5Ryy9Z1OFqPO6rNzsWZNuH0gAK9Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759878749; c=relaxed/simple;
	bh=LYxloqWp+rfXRlEq06plD6k/4izTNXPA//5vY/5v7zA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ewzgG2S9IcVgewLHXFi75SS9U7HekI+yFrjjXgGwN5PqD++GBiS/S5ngJHnPukOdIaEi9Lr4MU87mhNH4spp+gk6nlBUnbCdAIzxpf3R/ekXRZ+n/Prj+kV163m5qGWbnK0zBXySkauTrsk5ZyF73AVHEhJJy3cqZF8WyzecXPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=d3X0o8Px; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-937b40137b4so15668539f.0
        for <linux-usb@vger.kernel.org>; Tue, 07 Oct 2025 16:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1759878747; x=1760483547; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=K8kpMiXXJQSMMYU5aHc0Qxvu9JF3/gOGS+jVYyvkF1s=;
        b=d3X0o8Pxk1Pw+NTe3VjnPgak1zPh9Qzoz/BmeZIumFkHANqNdx+g6gzk/YcqWP5QfD
         +jx6O2/otbbGSLg/Or0hMEjgjq9p4SlBiVh8q6GENDrE+xOBc+McpTXp+z4I+0eZ8xMJ
         GPDUj00GgPclvPnZDSgb1NZPb3MxO7tlFRkm4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759878747; x=1760483547;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K8kpMiXXJQSMMYU5aHc0Qxvu9JF3/gOGS+jVYyvkF1s=;
        b=k6QN+qinwe4mo79ZcXEP+sesajTiQHHfccwkgC4nntUPqBbQ0rz6SfDkJzP5QeKOah
         w7rnydok/kuRamkZFniYNnwm3FMxe15gNLAFTKEbIMT3iLBq8NeqViWWuRvXY4KLoyUn
         4mPOkTKzoI5Y7vGAdgkWUg9wFAdHOhbu3POUwBqtzuSj7jMyom8r+q2kwlxtVtnkjhye
         46N25jO77ja1UBUrEMl39Gh6ypV+3KWqWfD1OdhSZuPhvPKDOkb5tz4dnpJ178pWLakP
         aBttb9FwqJXWDp5pB+IpiUC4WRJQmIj6D30qNwYkfZGJKaJUUz0hxunQgg5guLkfLhKL
         ertA==
X-Forwarded-Encrypted: i=1; AJvYcCVskV87Ds/JzP8Tr5ABF37lYdpKEmW0D+0F6rPHWk6hRA6rVzizmZrr9ENZP2P2BPcWm6Skdg/HS1k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsT2/FK/FiFKnP4JleYZN6EzKEvuiBV35qp5lDsfbeAU1ZpLRb
	yZZq+eHdmCAOX5wYIf0vhyjW4jSWiE5ck9+VjWZhwNC5ytXPhWxxoKcflvPjUlYU7lU=
X-Gm-Gg: ASbGncvuWEHHUlnU9Alg4RQODpXeKdLtGHvhQzy9Uj6v51zep/SzbRayn5KtotYWHn+
	3R66Iai0uSqTtNDNZ77RMkrGE1bFhdbCylVvkVAparuuCWiF6iab3mVuL3Fu4as2fzsF+5HZ1GS
	GMfoa+Q7Q4lYjfKB+hCuE7/7u8UxsMf6kBP/ubf1PgGEFLIA2zCVxhNb6Pi2kexlBsfE8EWEC5S
	z+UG4FOR69ml6RMirF/wVNF1FjQvTd3H0b8ayyXzvvuJD7adB4hShol8t/MvkgeZTkv8FhFpUYT
	rG6S1WVMwcDTnsF5GH/fJ+UQZH1U3zDoTNCWMQ5qtQhYscwKrUByJ0ckWF3vC9uyu5ARGLtiO4J
	OjnNxkQMaLSBUXWbexeYZES0op/oCR2QbeFlu0cr6mezmCshdEDz+6UZCgmGncrc079ps6A==
X-Google-Smtp-Source: AGHT+IGu2C2rb/V6BrxyE0/dvetUkGb+YtcqnfEQKJvkL8n0a1v0cyHBXoHB5VxQmwUA8x5ORvzLkw==
X-Received: by 2002:a05:6e02:152d:b0:42d:8217:2c6b with SMTP id e9e14a558f8ab-42f7c36b822mr71320735ab.8.1759878746969;
        Tue, 07 Oct 2025 16:12:26 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-57b5ebc8400sm6513539173.42.2025.10.07.16.12.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Oct 2025 16:12:26 -0700 (PDT)
Message-ID: <34639f0e-4af0-4fc0-8368-07b9119d6cde@linuxfoundation.org>
Date: Tue, 7 Oct 2025 17:12:25 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: Fixed protocol translation in
 usb/storage/transport.c
To: shihao <i.shihao.999@gmail.com>, gregkh@linuxfoundation.org
Cc: shuah@kernel.org, linux-usb@vger.kernel.org,
 Shuah Khan <skhan@linuxfoundation.org>
References: <20251003083124.17072-1-i.shihao.999@gmail.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20251003083124.17072-1-i.shihao.999@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 10/3/25 02:31, shihao wrote:

What happened to the commit log. What are you fixing here?
How did you test this patch?

> Signed-off-by: shihao <i.shihao.999@gmail.com>
> ---
>   drivers/usb/storage/transport.c | 41 ++++++++++++++++++++++++++++-----
>   1 file changed, 35 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/usb/storage/transport.c b/drivers/usb/storage/transport.c
> index 1aa1bd26c81f..4dd6bfa86c23 100644
> --- a/drivers/usb/storage/transport.c
> +++ b/drivers/usb/storage/transport.c
> @@ -718,12 +718,41 @@ void usb_stor_invoke_transport(struct scsi_cmnd *srb, struct us_data *us)
>   
>   		scsi_eh_prep_cmnd(srb, &ses, NULL, 0, sense_size);
>   
> -		/* FIXME: we must do the protocol translation here */
> -		if (us->subclass == USB_SC_RBC || us->subclass == USB_SC_SCSI ||
> -				us->subclass == USB_SC_CYP_ATACB)
> -			srb->cmd_len = 6;
> -		else
> -			srb->cmd_len = 12;
> +		/* Protocol translation per SCSI opcode group */
> +                switch(us->subclass)
> +                {
> +                case USB_SC_UFI:
> +                case USB_SC_8020:
> +                case USB_SC_8070:
> +                case USB_SC_QIC:
> +                         srb->cmd_len = 12 ;             /* ATAPI/UFI devices always use 12-byte CDBs */
> +                         break;
> +
> +                case USB_SC_RBC:
> +                case USB_SC_SCSI:
> +                case USB_SC_CYP_ATACB:                   /* Determine cmd_len based on SCSI opcode group */
> +
> +                         if(opcode <= 0x1F)             /* Group 0 */
> +                         {
> +                                 srb->cmd_len = 6 ;
> +                         }else if( opcode <= 0x7F)      /* Group 1 & 2 */
> +                         {
> +                                 srb->cmd_len = 10;
> +                         }else if(opcode <= 0x9F )      /* Group 5 */
> +                         {
> +                                srb->cmd_len = 16 ;
> +                         }else if(opcode <=0xBF)        /* Group 6 */
> +                         {
> +                                srb->cmd_len = 12 ;
> +                         }else if( opcode <=0xDF)       /* Group 7 */
> +                         {
> +                                srb->cmd_len = 16;
> +                         }else{
> +                                ;                       /* Leaving cmd_len  value unchanged  for  0xE0–0xFF vendor-specific*/
> +
> +                         }
> +                        break;
> +                }
>   
>   		/* issue the auto-sense command */
>   		scsi_set_resid(srb, 0);

thanks,
-- Shuah

