Return-Path: <linux-usb+bounces-32605-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MEFbFbI/cWnKfQAAu9opvQ
	(envelope-from <linux-usb+bounces-32605-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 22:05:54 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0295DC83
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 22:05:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 30A1C50E6E1
	for <lists+linux-usb@lfdr.de>; Wed, 21 Jan 2026 20:38:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C0823F0765;
	Wed, 21 Jan 2026 20:38:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CE2/R3+H"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2F03E9F7A
	for <linux-usb@vger.kernel.org>; Wed, 21 Jan 2026 20:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769027926; cv=none; b=Kem2EctGFfPwjnW0dLHlTA64fQG3z0oo92oQrD8i4bFirOTTS74eMg3yi+t0NmOj4y9yVuZxm3u09dRDJ+9Pdjubbq+kHQbue4WsBkuiOpASfsbas0y+smn89x8KvEmNgXJAuTXp9w89/DJBT3yGMKYbNcf8zkhXT99g8yVvTsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769027926; c=relaxed/simple;
	bh=2RKckPP5ngNyoE4+uH2QyzCEd/ggvt9mkG1KPdRphWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pY0Rfgtaa/jDQSRS+2h7oDGTE8oNRtWJtKh6QPQuF79rYBVUwQFVtyrKjzKkvoQix9gCB2sfzFmPy7lHTTDM4jF0TKjLcKt4nbkymsmvm0yBdfZe0grQ2xS6j7+VpbizVwUCCWx1Nc4rQYwUzS/zlPCswL7W7mkOMBH418RT4r0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CE2/R3+H; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-59b77f2e43aso1837111e87.1
        for <linux-usb@vger.kernel.org>; Wed, 21 Jan 2026 12:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769027923; x=1769632723; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=519MuNYkMTKdDB+LqzWyS62gm9pjLZ7z4kHuairXCLQ=;
        b=CE2/R3+HJR539/kg9vK4DLawey+vf6ymapjtDBO4nDK0RomB/I2h4qPraBNaVgJZ8i
         cZ1QCqMmKIdN8KsVugDFpg8peE/3qJkvRNPH7p6T/PgUcfrCRbxn88JdWMTc7aDug3+r
         1lJENIXxZooQiMcX6iwmxfLxPdNrG2CuFJj6j4h99YNBpp7KCh5UwGkCBsnP0ZriV0Wt
         XfiHXONT/6pNvcIOZ+tvtz24xLrpBAdJ/WDU2dBLBo8R0cRYS7nRT2/bO7oMfMiGkJRP
         YfCxS0wEnrUZFYfGbtDZuHDbjupJf7BLq1+9DguPwKhhdsL/8qChkYfjGBxw27T4XTc4
         MMLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769027923; x=1769632723;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=519MuNYkMTKdDB+LqzWyS62gm9pjLZ7z4kHuairXCLQ=;
        b=rM6yfIudIwy0XdlEhlqSaNTmrmMkVuXddLEUkzQOtNnc6g/DB4Sgdn2GOP/MVzJcFy
         45DGQusXNVV3Hp9chRojpirDbONWwO8HhUbh4Hz8sLXtxEHf9maE9Lo+TBmJd7wVJTu1
         rao2eUxy9pm/5y6AjM0FIWKlqxc6BSDlUx1DSMcnuAN8TP2LwxEWbjb3lCZCl+7KB70+
         VoXNQJCAIClPuCkZsWrQAErSAcVRyv5/1KDLglonPlt8s8QxKT0SAWEyj692D3Y3uFyc
         yhJomXazxPQv6ioHc/Iu5LeWUo9CkxDWXVHRoVk9+/7GJZbhyyqs3fSAVGgixT2B5XbJ
         N/ig==
X-Gm-Message-State: AOJu0YxZAB7QDB4wN174HNY4A31RguhvTv5kKeyduAEcK8z0Pfdtk8np
	jxfXbYq1EJEKJ4EngnxgDbEFonh/oRDCdSP8flc41hFGobLil9ao2zeM
X-Gm-Gg: AZuq6aKEH7M5GyDYWK8uv2rKlpmx6xehS3rU5ppQSKeU+bex2bH8AmvHoOucjrk4wJW
	Qb0ImKVkL0VZbxLRkhbc4CsnGnqN9D0s8/gYCyYmEauUfV2ktvp+D13olQxAce6mKWJyPhL7QOm
	3j6L3ZKczIn39+wX+Ng0AIFazPWaC2pB67Ov26Gurh0BxcmimSaRd/3kZY6R7LBnsJ6rn+qmXrD
	kAfWopSMMI1PAa1geHLx0TkHsSwGrnwyYWi1FU3tySCpX6om1SpZkHi3xoRsQL2q5ndyf5XNqeT
	xp+D/z7IcLSZgiZCHuuYu3//SO8mnIef1Fi27T8tU6wxP1yys41WiLLd4YpdMOfOMuvlhMvtJAO
	qC7rFbq9PAwL5nwYFz0VGF6oIPhmURPL23EWJUq246xl8dr1Eo4IRcw6cIgZlKlkzrBLnrRqjgM
	L32uz3imeSK1vsLTA7XW5fe5lcnlbE/URc87B0i6JVU0M3ikYsTIPP9fivZoVkmYbrNx6iCw==
X-Received: by 2002:a05:6512:1c5:b0:59b:9c8a:d8bd with SMTP id 2adb3069b0e04-59dd7be09ecmr143195e87.6.1769027922389;
        Wed, 21 Jan 2026 12:38:42 -0800 (PST)
Received: from ?IPV6:2a00:1fa0:427d:cc56:f2e6:a773:dc06:ac10? ([2a00:1fa0:427d:cc56:f2e6:a773:dc06:ac10])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59ddd446adbsm343e87.100.2026.01.21.12.38.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 12:38:41 -0800 (PST)
Message-ID: <aef9a040-aa24-40f2-83ae-44d2c74dc759@gmail.com>
Date: Wed, 21 Jan 2026 23:38:39 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usbip: Reduce CONNRESET message noise in dmesg from stub
To: Shuah Khan <skhan@linuxfoundation.org>, valentina.manea.m@gmail.com,
 shuah@kernel.org, i@zenithal.me, gregkh@linuxfoundation.org,
 ignacio@hernandez-ros.com
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260121163721.11933-1-skhan@linuxfoundation.org>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <20260121163721.11933-1-skhan@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.46 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-32605-lists,linux-usb=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linuxfoundation.org,gmail.com,kernel.org,zenithal.me,hernandez-ros.com];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:7979, ipnet:2605:f480::/32, country:US];
	FREEMAIL_FROM(0.00)[gmail.com];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sergeishtylyov@gmail.com,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: AE0295DC83
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/21/26 7:37 PM, Shuah Khan wrote:

> stub_complete() prints informational messages for each urb unlink
> filling dmesg. Change the message to dev_dbg() similar to vhci
> reports the CONNRESET condition.
> 
> Reported-by: Ignacio Hernandez-Ros <ignacio@hernandez-ros.com>
> Closes: https://lore.kernel.org/all/0101019b92e81c20-09906fb4-d5e8-40a6-9192-ab693eef4179-000000@us-west-2.amazonses.com/
> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
> ---
>  drivers/usb/usbip/stub_tx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/usbip/stub_tx.c b/drivers/usb/usbip/stub_tx.c
> index 55919c3762ba..4cae452bfadb 100644
> --- a/drivers/usb/usbip/stub_tx.c
> +++ b/drivers/usb/usbip/stub_tx.c
> @@ -55,7 +55,7 @@ void stub_complete(struct urb *urb)
>  			 "stopped by a call to usb_kill_urb() because of cleaning up a virtual connection\n");
>  		return;
>  	case -ECONNRESET:
> -		dev_info(&urb->dev->dev,
> +		dev_dbg(&urb->dev->dev,
>  			 "unlinked by a call to usb_unlink_urb()\n");

   Please re-align this line for it to start under & again.

[...]

MBR, Sergey


