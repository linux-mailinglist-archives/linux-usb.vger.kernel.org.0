Return-Path: <linux-usb+bounces-14659-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B30296C579
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2024 19:31:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C5C09287175
	for <lists+linux-usb@lfdr.de>; Wed,  4 Sep 2024 17:31:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D9DE1E1303;
	Wed,  4 Sep 2024 17:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HbSk9DEp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DEC55464E
	for <linux-usb@vger.kernel.org>; Wed,  4 Sep 2024 17:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725471076; cv=none; b=KnkdySRDFUIHsfDaqLcr5kI7t3vRC8mQNG03gq7VR3/K9etaRA0fcn52FZKQ4gJfe7vYP8fj1nZkUikR/wTRDWVvtZpXQrl8y8MUcmdIY2MM8f/GkOiUKBF/SdPf1JaraJSE3v33FxnahZsAaxdAs+dFkL5HxHYxFuoA8WajYYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725471076; c=relaxed/simple;
	bh=RKgfQXVWlZXjiM1K3YnuZMJiQQHQBFEhAmUzEgpTM/Y=;
	h=Subject:To:References:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=gpQozO5evSJegkO4/9io2pb9ZxV42tVPq+4H4tbOxgg8e4jZatwt7iL+fjiNtRQ5QyWVUjC8AZ+w26p2/Jr3QcZmx+lzBdiq3cum5eNWfn6MGz5I7v0sxs1r2A49y/BpwPb7OrUhYHOFR3vxMEmajSwAFxgj6uZc9SOwoGGBnYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HbSk9DEp; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5356bb55224so466559e87.0
        for <linux-usb@vger.kernel.org>; Wed, 04 Sep 2024 10:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725471072; x=1726075872; darn=vger.kernel.org;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aqnq8WcUTln0N3g8ZFlYWkehgufVNFSQBTEUvbLsqcU=;
        b=HbSk9DEp+Fd6LJ4I8GOEEZIZxh6OXCvxX5ZH1LBXb/JeEvdNV/c5a2q6oRO0A/hFRz
         SstsRD4D+FbjP/G5V0IELVR1Dy2lWh0Xfp6tg5Ka+82M47EagucviZ/bcgwCVoqbKCDX
         vHCZ5oo+IURFnzDeD6Ly5HdY9mPs46yiTs+viBOCvwy19ZhCK7MWxN8XmMU3HFAXihJv
         smwVwzRa/hzHYrRnKXZE+l6SRNAB6qM4JMqVX3T/EBrNshJ6vButw1bWL7GEkT9z8Z6b
         clcKeoVRBRuPUU0So1a5rcSl4In8RlCNKE0w0lgPFoqpp2Ur1qqdFFh0kOKR8DlXmmyB
         qvhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725471072; x=1726075872;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to:subject
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Aqnq8WcUTln0N3g8ZFlYWkehgufVNFSQBTEUvbLsqcU=;
        b=J2nNfLYVXFIV3LiCJC43W53al/QYnry/aY+OpAtyuNt4cZhPeK7P576uryB4z79Uqa
         woeaGRaHPqNjPJKKkiUBW+efH0XzEE/HxoGhJQTt3j2f/2rRiOKM3mvean8zYc1GON2U
         BP4qH2ox3StUxvjaOHZWeKlT9K1ZZlMt75WUM5WYq+O0XnnTQw1J2SaYcQGHq0KF0dRj
         M1bd7u5kJ7YhKa4p+hHNyh19LNZS3qgxGX7ZjJbQ/cd7GtSgZhYjh8BSMuWHj22I4/dw
         oOnr7TYJ0KYm2cLXmcLRzxNDaPtMoabYSfaV2qD1jj+crxQTFs3XbP+/wM9lEILwvhqK
         BRqg==
X-Forwarded-Encrypted: i=1; AJvYcCXMCDF87IN4149oLVLrFPC5dWI1e/+EbXgJFAn1Qx0hRigUt242kTwpJ9YL6mytRmqQrJT1ndG3mj8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRFOA1aUZHKerH8uHra2+NzBLE9x3uAAQxjiZIppsQRT7AFmE3
	4d/7AvI32EuxmHR13GtRQpM/SMSKqmFGQXF95TjCsmCJ4dCkXuaUsE1JNQ==
X-Google-Smtp-Source: AGHT+IFzlLS8Gy/DD7s5xQijdHdXgg5vtrmaNOLqtcwLeTNTra9d0eJi3IvmbdQsWxOjJyXRma2Svw==
X-Received: by 2002:a05:6512:3e26:b0:533:43bf:565d with SMTP id 2adb3069b0e04-53546b45292mr12590265e87.27.1725471071828;
        Wed, 04 Sep 2024 10:31:11 -0700 (PDT)
Received: from [192.168.1.105] ([31.173.83.151])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5354079b713sm2458017e87.11.2024.09.04.10.31.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Sep 2024 10:31:11 -0700 (PDT)
Subject: Re: [PATCH] Revert "usb: gadget: composite: fix OS descriptors
 w_value
To: "Vrastil, Michal" <michal.vrastil@hidglobal.com>,
 "stable@kernel.org" <stable@kernel.org>, "balbi@kernel.org"
 <balbi@kernel.org>, "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
References: <AS8PR05MB84857AB3DC49395AEC7C235990932@AS8PR05MB8485.eurprd05.prod.outlook.com>
 <AS8PR05MB84851190CC1941157ED33D7D909C2@AS8PR05MB8485.eurprd05.prod.outlook.com>
From: Sergei Shtylyov <sergei.shtylyov@gmail.com>
Message-ID: <9bd8ff3f-263e-3676-7d28-cef055aad76f@gmail.com>
Date: Wed, 4 Sep 2024 20:31:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <AS8PR05MB84851190CC1941157ED33D7D909C2@AS8PR05MB8485.eurprd05.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 9/4/24 6:01 PM, Vrastil, Michal wrote:

> This reverts commit ec6ce7075ef879b91a8710829016005dc8170f17.
> 
> Fix install of WinUSB dsriver using OS descriptors.

   Installation. And driver. :-)

> Without the fix the drivers is not installed correctly
> and the property 'DeviceInterfaceGUID' is missing on host side.
> 
> The original change was based on assumption that the interface number
> is in the high byte of wValue but it is in the low byte, instead.
> Unfortunately, the fix is based on MS documentation which is also wrong.
> 
> The actual USB request for OS descriptors (using USB analyzer) looks
> like:
> 
> Offset  0   1   2   3   4   5   6   7
> 0x000   C1  A1  02  00  05  00  0A  00
> 
> C1: bmRequestType (device to host, vendor, interface)
> A1: nas magic number
> 0002: wValue (2: nas interface)
> 0005: wIndex (5: get extended property i.e. nas interface GUID)
> 008E: wLength (142)
> 
> The fix was tested on Windows 10 and Windows 11.
> 
> Fixes: ec6ce70 ("usb: gadget: composite: fix OS descriptors w_value logic")

   12 hex digits should be specified here...

> Signed-off-by: Michal Vrastil <michal.vrastil@hidglobal.com>
[...]

MBR, Sergey

