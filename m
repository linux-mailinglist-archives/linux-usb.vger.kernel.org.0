Return-Path: <linux-usb+bounces-20855-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 26554A3D669
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2025 11:22:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 918383B55FF
	for <lists+linux-usb@lfdr.de>; Thu, 20 Feb 2025 10:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C21CD1F12E9;
	Thu, 20 Feb 2025 10:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="AN6xyaBQ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71CCA1F0E31
	for <linux-usb@vger.kernel.org>; Thu, 20 Feb 2025 10:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740046970; cv=none; b=pFZdvOVEC2Gt0n+g8i9MFTQrnt/P2WjrkbiXTxdQF/r4xTpwWsYMezIuHARt8Z4oGXL7ryX6tAI3AwU7ybL8POgNwz/LAjkzlKFQyUv6P+SJeR/4QUu49PhHYRbFLHkQTn/VzqmHcZtMWy8bSip2hjMgmUe5JgocQl/A4SW0iQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740046970; c=relaxed/simple;
	bh=dwV5C1T08uCJyhf61xNHGbLrnXfynaFJ/L/Ujo0Xy28=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g5nVKWT+cMtUFfT2kOEGc+uMHLuwbbA5WJMjf/C5D6+IXQk0lsbHvhWoZO/8Ci7/Qbab4i22uVq2129OLGZP9jBsIpS2GJuG+KA1Ji3/s2T0BP2VsuAnQaxgM9CLn+JtdgkyvaP87tSK5iZg2yyGZHqpHYu6gqe7QTbzBkXxmXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=AN6xyaBQ; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43996e95114so4479605e9.3
        for <linux-usb@vger.kernel.org>; Thu, 20 Feb 2025 02:22:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1740046967; x=1740651767; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mdJ1tjXDGbz7fnnLGr6p9xq7nJI8m1bb43amubJ0qpU=;
        b=AN6xyaBQmi9zBQcVep+o0zVfgKluhdmta3a2sU90KfgCm5Kfjp1sT/3Jbmh4tlaAxw
         NgWxJUcR4LdAIxqSrMUYRoxyWh3G1pUYQds0foLS+dJPQybkMKgq/la0xZvOJRDrBokl
         bQo17+XbHm6MJ0gycY1BkfKhSdnkHmPqfemN2nQph9V3jqEPPlyop6JXKK4+iQFbtf/J
         GtiyN8gDwRSZpY2Usno9vkxZFtxUNyJwNLgzAzopxMCJ/aJM+DRNdsgFjhheXATGlmTd
         YOs8Nw+nmrOZIEMQ824ZwlxNA/LP3x+Bj96sR0yaWH10wLb/Rh+p5ky3ZLaHGeEcTcWQ
         3zDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740046967; x=1740651767;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mdJ1tjXDGbz7fnnLGr6p9xq7nJI8m1bb43amubJ0qpU=;
        b=QkwAvsfXFkrHBruI/yqYmTpX6iiWNRZjPnX7LO5VTYQUJ/03rfNoyEDJucLBaZEBx9
         kzSv28bG+lcgL3zkVtGaxgd5DjHawftq5aEna4/hf37/o5PCgC9Cu8GZUGfVC/24sGIF
         cE9QlFm4j5Q4WN/UFx7iyxjiYOlNy9DxCYB5HxgGub3pFHx8yNTRtydfvm7G20Yi4yCw
         gSt1cTypy83eCwL+DkjNkE07x5mVOATAfZ+pQ2KuWG+5VBMEyjhOMFE7W6ZLVoy9Its5
         T3wa8ka625WxyF2H3kV1RfOc4CZELGpA7/0HS3v+Xch0XfkkNgb6sn1YxoBocJjXK2iJ
         0peQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQBDDNJzAOSjrlKup/jneZSBSz7hXMsrRuVPNHY+ynXVbphO4OLimYtbj0aMobdMoJK9xTA9zlE4c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbwRrmS7sm2YqjPa07J3upW+QhiBhf9J9Ivyw0tSCXJ0kk275G
	B3BZ4NXh4qmsBrijjnTlQdgkYTWX2J9QY75GG2F6gEQzLKgI/FXExqvGleg5EN0pbPseYskCzIb
	L
X-Gm-Gg: ASbGncvg7/FzFzr/Bvj5/oRx7Y9gngjzIFQpPW51NuVMYQ9aRLLr1+/EHysaU8Pfmyd
	9RHNoHBhGSPa1LdDiuPVcI7PL66XcWpHZLSCa+/Ib9az/I30E9GNUtYrc74yJjw6uXCSHkT/EQj
	ShF8nSbJcXhSUPnuU7+/Us0FtG3j2eQexy2KU9gr4GwpwxMd4yi13eOHgl5dmSgJ2VtZ38c1amv
	vlIaGQcdcfTLlQBpdQJrsHv9eX+maCs/Uo8MIofokXkMpTLLSVZRPfSf0O+N8ZymjPnSpmfbrjw
	uSAM/mt544w0auljfyzXTnkVh0egO9xk2WjJ0ivPuFE1Oce+3wHe7fk5bg==
X-Google-Smtp-Source: AGHT+IFNBKicqin94xs9R9bvB+x/bbDZRuNAbanJhmggJELPLRHyKJNVbt685+Z4xzMPELU/nUfw9w==
X-Received: by 2002:a05:6000:1fa5:b0:38f:4fa5:58ce with SMTP id ffacd0b85a97d-38f4fa55a25mr10752304f8f.6.1740046966694;
        Thu, 20 Feb 2025 02:22:46 -0800 (PST)
Received: from ?IPV6:2001:a61:136c:cf01:505d:b6ac:9103:aec6? ([2001:a61:136c:cf01:505d:b6ac:9103:aec6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259d65bcsm20344688f8f.65.2025.02.20.02.22.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 02:22:46 -0800 (PST)
Message-ID: <6d14b473-6d26-4b9e-88df-2532b0c88565@suse.com>
Date: Thu, 20 Feb 2025 11:22:44 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: core: Add error handling in usb_reset_device for
 autoresume failure
To: Wentao Liang <vulab@iscas.ac.cn>, gregkh@linuxfoundation.org
Cc: stern@rowland.harvard.edu, christophe.jaillet@wanadoo.fr,
 mka@chromium.org, make_ruc2021@163.com, javier.carrasco@wolfvision.net,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20250220095218.970-1-vulab@iscas.ac.cn>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20250220095218.970-1-vulab@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.02.25 10:52, Wentao Liang wrote:
> In usb_reset_device(),  the function continues execution and
> calls usb_autosuspend_device() after usb_autosuspend_device fails.

This can only fail if the device needs to be physically
resumed. In that case you called usb_reset_device() while
you weren't supposed to. The purpose of the call is to keep
the counter elevated in order to disable runtime power management
temporarily.

The code is older than helpers to elevate the count. The correct
fix would be to use them rather than handle an error that cannot
happen.

	Regards
		Oliver


