Return-Path: <linux-usb+bounces-28613-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 98E6CB9C2A4
	for <lists+linux-usb@lfdr.de>; Wed, 24 Sep 2025 22:40:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F012819C5A35
	for <lists+linux-usb@lfdr.de>; Wed, 24 Sep 2025 20:40:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68055327A34;
	Wed, 24 Sep 2025 20:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LezvN7pK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com [209.85.166.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E64322A02
	for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 20:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758746420; cv=none; b=lxVSHynU2jR7VKyFglRla5M7ifaMgkMaJqg8w+wYZmIXKwtDFfrUJEiFN3NG8QsghSK1KdkZHvjgjM3EpycUGOc+HOiVZUXZThZ3rqtHp80elyIfPlbhsypnBH2t0eK47NzXFu99GSt9DGyUZZL8J7ZtZ/wszLh2O9OLVkFpOGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758746420; c=relaxed/simple;
	bh=GT1Z3zQ5tXrk46UXjX5RxfRkN7haq4MDk3g9uLlBYwA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fKa2orvK9lBFSKakpxXcrZLGyy+7jAU6EG2LwtLWiy7odtnhSp8zpgk+ynd/tl+tt9lGSQljmGTF1SobWAmPDBtcgxKivc0sFgAOQaXRgAysvj5MGcK1pRs5607eCHO57Cp05FpsZYSvc3jH/GjNdfHfUpqaXNPm3kPcWqSV5uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LezvN7pK; arc=none smtp.client-ip=209.85.166.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Received: by mail-io1-f46.google.com with SMTP id ca18e2360f4ac-8935b53bb14so13676539f.0
        for <linux-usb@vger.kernel.org>; Wed, 24 Sep 2025 13:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1758746418; x=1759351218; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9PDdGlP7wUqpVFvBq+vcD4g0qwNo+YCXe03tGr3XqXM=;
        b=LezvN7pKxzIth2tp1hq18bdbNdrD4EkwKMS6ncPYB85jfoFjVHSbYTbf06PRAD/9z5
         7wceSrsCoTHUTMIEgiuvu5hus4/QBfqxEoMrVzxM2XAv9mw0OMg6qSV/uKwjmpFrzBz2
         yp2qCPEETxXHt4Pdzldy9FxBihFYrBvq9gsew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758746418; x=1759351218;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9PDdGlP7wUqpVFvBq+vcD4g0qwNo+YCXe03tGr3XqXM=;
        b=KN1ILxItXRO3+lcrSOfirECun/02hd3D4kajwMneUB4jxpDb/1e6FRVqz4/cyVjoOC
         pr5wEZ8lBo3RwEvFHu7xJbWdO3tow9ezXfPw+nOZ5jWieNETbl4l3fGXPia41T6E9KbT
         4jmxwEHsCgoJ7f0y3MWaZTXeYZ1tJOWyogeP2ZecDx2TLwVn/aD/ywXNToiAy7m5GUf2
         Q3D1yW5taCraauq/RuxdBXFJCfB6CLIQ829YoxCp1FZpAPIFJAZfmcKdd0Kr+s/d5E6t
         Ivp64Ki1HZ5lN688uaZOw/zlc8asr0hdjCYaraxI5+FvYBnsslJ5OcIcjGdm9yka7hjO
         eA0w==
X-Forwarded-Encrypted: i=1; AJvYcCUGU4K5dbxU/0aktO3WA5mSdeJC1UAnp+uSeuJ9L6FbVmsIsq6/CusPpNCovUWL0oAICwgb3JK2LyI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlVnJ16cIzVPuXUImlydX2qpM1fiCJ1Wxl439GamfEelPf7UwL
	uRA7CqmRkerS3NEV5IodchUbmjpbwTPehs5jbpkjqu6A6L7UCSa7eFLlSUVHgWmgMFo=
X-Gm-Gg: ASbGncsMT85YjkyiM/DGSeb/7F582ZILdEuib0fmKOqNcLP++3kwUXm15DXT4fV9jJj
	QXiZaBRJ98AXCmHWkkGO8aX6BT6ZoWQHEnZYlo/qVVMbYeRchuA+SHN6DcPIUkgx2cNmNc9qlcP
	XVLj8mSH2YrmFMZlfpPfkKeG2HG67xDHWdMxZabC8t/HR5b0FJtfR6uhu9kyqTu0YBpn+7a9q5+
	GOLhufI5iEnueNSK3gMLsXqdGaooAHQpJ6k9f3OrHvh4PGDpGwDXAC5I1HyZj7PDM7H7x4GqR7T
	nr4vkKfxxRZrBouyDmuIm7roNtPU947J+Tc0dlY074Md2A2zIxQU3JBGFGfLyfzUlf4HCNiKAhk
	y01sHniha8XJH05kfk5p70JsOHa/ROhFHWu0=
X-Google-Smtp-Source: AGHT+IEl66KjPbfHgezvX7WogNWPlR6drYL1cc+80f/7wHyxzxceno/Pv/D4A/ViWYjgRD45h23gsA==
X-Received: by 2002:a05:6602:2d88:b0:89a:8809:1767 with SMTP id ca18e2360f4ac-901509454b7mr162008239f.2.1758746418319;
        Wed, 24 Sep 2025 13:40:18 -0700 (PDT)
Received: from [192.168.1.14] ([38.175.187.108])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-9040fcf19eesm797539f.22.2025.09.24.13.40.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 13:40:17 -0700 (PDT)
Message-ID: <4cd10eda-945c-4bd6-a077-1d9a104dba6c@linuxfoundation.org>
Date: Wed, 24 Sep 2025 14:40:16 -0600
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/17] usb: vhci-hcd: Switch to dev_err_probe() in probe
 path
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Valentina Manea <valentina.manea.m@gmail.com>, Shuah Khan
 <shuah@kernel.org>, Hongren Zheng <i@zenithal.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: kernel@collabora.com, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>
References: <20250902-vhci-hcd-cleanup-v1-0-1d46247cb234@collabora.com>
 <20250902-vhci-hcd-cleanup-v1-16-1d46247cb234@collabora.com>
Content-Language: en-US
From: Shuah Khan <skhan@linuxfoundation.org>
In-Reply-To: <20250902-vhci-hcd-cleanup-v1-16-1d46247cb234@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/2/25 05:56, Cristian Ciocaltea wrote:
> Replace pr_err() calls in vhci_hcd_probe() with dev_err_probe(), to
> simplify error handling a bit and improve consistency.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---

Acked-by: Shuah Khan <skhan@linuxfoundation.org>

thanks,
-- Shuah

