Return-Path: <linux-usb+bounces-36980-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GJW4Js4z+mlLKwMAu9opvQ
	(envelope-from <linux-usb+bounces-36980-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 20:15:42 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id E7B514D28A5
	for <lists+linux-usb@lfdr.de>; Tue, 05 May 2026 20:15:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AB478302C5C8
	for <lists+linux-usb@lfdr.de>; Tue,  5 May 2026 18:15:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BFA248A2D1;
	Tue,  5 May 2026 18:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cHkFC6KO"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7690E3C5540
	for <linux-usb@vger.kernel.org>; Tue,  5 May 2026 18:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778004936; cv=none; b=GJFYBDHjf7YIM+E2k9L4dgTVp5R+6ygHLb/OUrsjkmqK4yUld2rTPXfK34T6wTgnmtz6TnjLZMdYEjZmoPNixYt0s9txH5uWggF92Fb31t6/wIQGCRCwIof3PrZ3+xFj0HQplIYEQjke6cTjPISJ4fwEZfa1v6lPILkLhJkTDjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778004936; c=relaxed/simple;
	bh=Fvrf56zIpDoyp0ymI4zysnOLw48mM1lICxB/cw9uTsY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bVD3ZI07b71RbwZk1NfKb80Mh16a5NlbZJZrOHC++xrL/EPFYI7YH1KtPcEm6awOLOJ4JrmW195BJiTNRjBMFwFVNrWIt7dGiUa9fMbkFx9LYwnuh5P/OBo/rrf+vDreb0ihNNYQ19u63H112QkQF8iR0YP+Nnpg7A0E+sauVfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=cHkFC6KO; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7dcd689829eso5030328a34.3
        for <linux-usb@vger.kernel.org>; Tue, 05 May 2026 11:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1778004934; x=1778609734; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ETXFyGjM6fzwZQL1DErnQaqDelKDbjTQSxjQFgvXNiU=;
        b=cHkFC6KOQNE2U0rcrN3LfSB4xlQ2cV3YlQQHdTlcBZdqR51GUcGqoUdBa4NHJgSgJ4
         Eu9MOgOifefKR6kfyeF8vxg4kB74RsbRC6VYGUCkdHyM3FR1TEXrp31x+vZr7E4gE1UF
         8VyK2+gtkbj5zEQ5FmukOnWYYoymV2Lv6mbd4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778004934; x=1778609734;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ETXFyGjM6fzwZQL1DErnQaqDelKDbjTQSxjQFgvXNiU=;
        b=Mb8niP0BBfmBDbLC84oMBMSR7CpffxMtbEWDFuIOHlMMyU/83S3nrnbLPc2pr2BY0/
         kw9cFid9S6k3T2b0DSgzVuvfiSKMBfLZfREKvZQadLpWCPWA8sfHd5YeRCOdPQREenyP
         LRPe2Cp+Upu7xE0VgPXJA0GDaLzfYijinV8KN1/BqxeI+OIR//FUo3/mdT4A0Icgi4f4
         CBtUvSYHgXyBObeKwl1E8zRvCeNFwcOhDccLA/YUgVdxp42RsInNhjBd3WdUdNYZ6+gE
         mAAqE37wa1VSOL/kPvBj/7x5oawDGocEXLBgXTnT2cyJqAIWnnsLeCAI702urnjBQnNr
         k8bg==
X-Forwarded-Encrypted: i=1; AFNElJ/5JC5rBEp8kDk8erC7CqBDdHasP0VSdvqzOZVMp7M2X/6Ul/kRqr/MZgV81daTyc9yO/Cvq6Bsj8A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwG+7fsrYIPj2QqDKkbB96wy6le7zVTBsjboW2E8QpXvbaZItyM
	+4GJJSSZJfxMvjpx5GxfVnTcptyfDJFTE20XO8+MNeNc5HhmYl5UdtvB97uhfTcWEA8=
X-Gm-Gg: AeBDieujCurAJC+GyXz/SHNRAHF+39KlqK4nytlPRpZJs3juhRy1U9Kuujfyt1Pa2ss
	zdXVH5BSKdwxVTBUPU2kdd/s9KLWU2EWeBRirsDooulrJKv+zCtrVV5/GlVRhasxsNta58XzxwL
	jzekzx3UWH8g6b6kun2D1zalPLrRKotf7WVRc0XCt/GMdvfo76HBO7umsozIOkKgeKrwQh8RhHl
	BlHXQiqH6euqDfR2sipysyOa8CxrQlYjD3Urcf3cieV/ayatdxUbFNkNi5/9Qmkhj7z7+yPe0/v
	hfAwYH22UffrpKtUL0m5ZUcs84kU20M+hWoBiiCrvwxholfKMts3RIWP+a1+rSdNUmDhf99AKjG
	MbILeN61HPms7sXDc0uhRBqT87fS2LTPEfyxK5Wwiej6fsxPvIUnQrL8TVK3UPyBAsNEoA4Vcn8
	xnpkzwpwwMZ5SglXoP8/GuqvqoEiaJ6BasNLl1X8DCO6SO/PlNT3dm
X-Received: by 2002:a05:6830:4123:b0:7dc:1615:7b52 with SMTP id 46e09a7af769-7dee148195fmr9169749a34.26.1778004934454;
        Tue, 05 May 2026 11:15:34 -0700 (PDT)
Received: from [192.168.1.14] ([38.15.57.99])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7deca7e475esm10282500a34.7.2026.05.05.11.15.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 11:15:33 -0700 (PDT)
Message-ID: <c14bfdfb-0366-485e-90a9-20293ed126b5@linuxfoundation.org>
Date: Tue, 5 May 2026 12:15:32 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] usbip: vhci_hcd: fix NULL deref in status_show_vhci
To: Adrian Wowk <dev@adrianwowk.com>, valentina.manea.m@gmail.com,
 shuah@kernel.org
Cc: i@zenithal.me, gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20260414010050.158064-1-dev@adrianwowk.com>
 <20260414010050.158064-2-dev@adrianwowk.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20260414010050.158064-2-dev@adrianwowk.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: E7B514D28A5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linuxfoundation.org,none];
	R_DKIM_ALLOW(-0.20)[linuxfoundation.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linuxfoundation.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[adrianwowk.com,gmail.com,kernel.org];
	TAGGED_FROM(0.00)[bounces-36980-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[skhan@linuxfoundation.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[]

On 4/13/26 19:00, Adrian Wowk wrote:
> platform_get_drvdata() can return NULL if a VHCI host controller's
> probe failed (e.g. due to USB bus number exhaustion). status_show_vhci()
> checked for a NULL pdev but not for a NULL hcd returned by
> platform_get_drvdata(). Passing NULL to hcd_to_vhci_hcd() does not
> return NULL - it returns a pointer offset of 0x260, causing a NULL
> pointer dereference when that value is subsequently dereferenced.
> 
> Add a NULL check on hcd before calling hcd_to_vhci_hcd(). Move
> status_show_not_ready() above status_show_vhci() to make it callable
> from the new error path without a forward declaration.
> 
> Signed-off-by: Adrian Wowk <dev@adrianwowk.com>
> ---
>   drivers/usb/usbip/vhci_sysfs.c | 52 +++++++++++++++++++---------------
>   1 file changed, 29 insertions(+), 23 deletions(-)
> 

Looks good to me.

Reviewed-by: Shuah Khan <skhan@linuxfoundation.org>

Greg, Please pick this up.

thanks,
-- Shuah

