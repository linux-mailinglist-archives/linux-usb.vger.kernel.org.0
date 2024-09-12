Return-Path: <linux-usb+bounces-14994-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4876B9765CF
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2024 11:38:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 11D7C28634C
	for <lists+linux-usb@lfdr.de>; Thu, 12 Sep 2024 09:38:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21CAE19047C;
	Thu, 12 Sep 2024 09:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="FeNtmR3D"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67491922CE
	for <linux-usb@vger.kernel.org>; Thu, 12 Sep 2024 09:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726133840; cv=none; b=ggxKd8hy/3VM+fjZcr9sixYuIbSKIRB1rlkhFr6oZaiagNE4cA9PYLmT513s4BF8gLza3HNLrqnKnLmkRLaTpR/Zh+kjXE2W8aEupkamXceQtWEdsxpGrChJar07Ky9/6iSfpNWHQrsnzIgd/gLy21dwm8cpdSgS61AuRwv/ZJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726133840; c=relaxed/simple;
	bh=4NchE+gXpDJKpNCBtXE9qdeVGRvkSqAV+nX+Jhl6J7Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LuoKqykhW7MXfTM5PeAG5JTv2loiuhthDNzU3CPC1zeNW7jicisD7h9ZcBU0eSYtRV6oclXMFZw8j1h3pMlWyQWsH6W8yd3f5IS3xbtGCjTtUQxguexy5gxYe+viAwNRgYh1WSIMmfwTtRXfJADi6JElEb5jhacNl4+FBrNWRr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=FeNtmR3D; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-371ba7e46easo626506f8f.0
        for <linux-usb@vger.kernel.org>; Thu, 12 Sep 2024 02:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1726133837; x=1726738637; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eQfDu/Uq1qhOxhhOrTZrsOruIabtnoNo1q0fsLPIwno=;
        b=FeNtmR3DdeZF/J/fv+XF/m1oibZ0K1K83EPkkpj9fSPSfFOLCtJqHshctR3aru390C
         uDnpabTVp9BpBIy1YCFKWWd5fy1PE2rxiyn1YFVKnBC4Zme2zVdVpfscTFDp73gtM02y
         mhf9nIPgwj8bJCHOeI2TrEXxemRYteSlYhjhKMPVq57fHxBreIHfUAFVb7/H5fhwoqzb
         dUQQ38K/7toPXwRmJBKErpH+vR9ab9pAIiAGe+vZ0wyYsQ+BnQgoKTj0VvIp59SHfP2l
         vNdqM1uxgtUCKigQ9qarCU6s3tO9jv4Em2TSrNIl07IUt4BuxpkCflnlPfsBVW9r9nu4
         A6iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726133837; x=1726738637;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eQfDu/Uq1qhOxhhOrTZrsOruIabtnoNo1q0fsLPIwno=;
        b=hheAbltqvGnlOwyb5yDp7UaRK6cF0pdbPX2YCNgh4VLtPZrA2xKAScaeD0pNt0jftF
         rYW2pirhXc/b5ZlntQEAvl6rJK6NxOW7lpYiU4PHiYEotDVYWPOX8MWnCR4o7ReKIQXW
         M6IsUiEr5TQCibehuPcP8rwqGnHC1OPBhJzLgqQfGjdeM4akeFfxP4tF9eS0GpDAJ8Hu
         9Cc1IAQ8bH77jamL+KhSUwOxndkDEdhyGHkq6NBGuHQzrXi59RRkqfc4jfDLqqt5qa6o
         DrjbVQOkFRTUpMYR5d+szHJy3o5B31p7VbZ4/TsP8+B7Ta7qAD3gcOYqiL18W6+6M3yW
         qXqQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0b5wv+beXW3NCitgMsx5bCmB2IJPpXAxo3N2wavy3X2+Ml2fyS5O4lSDBkkqNOt19/ySNndfrZk8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsbkL0/Nmvud17iD1nNDmLaI/3hIE9yQxQL95kSSIueevw6/+5
	7+85VGVoUDc89zhFuU08t9KWRZWRh7mtLeTkn4k6J1z07JBX2oDjU7lIMS4zQZI=
X-Google-Smtp-Source: AGHT+IHvdvU1R4UhhqiuLsjbgn2hoIwX2iplRd79sFPQd6lGt8CUtB6PHGgcnRdAyT6Kvo5KmkOcEg==
X-Received: by 2002:a5d:6743:0:b0:371:6fba:d555 with SMTP id ffacd0b85a97d-378c2cf40bamr1273609f8f.18.1726133836388;
        Thu, 12 Sep 2024 02:37:16 -0700 (PDT)
Received: from ?IPV6:2001:a61:13ca:eb01:f47c:2f3f:7fd9:e714? ([2001:a61:13ca:eb01:f47c:2f3f:7fd9:e714])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378956d35dasm13771057f8f.67.2024.09.12.02.37.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Sep 2024 02:37:16 -0700 (PDT)
Message-ID: <bb1cbc3d-fc46-4d0f-90b3-39b25f5bc58e@suse.com>
Date: Thu, 12 Sep 2024 11:37:14 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv2 net] usbnet: fix cyclical race on disconnect with work
 queue
To: Jakub Kicinski <kuba@kernel.org>, Oliver Neukum <oneukum@suse.com>
Cc: davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org
References: <20240905134811.35963-1-oneukum@suse.com>
 <20240910154405.641a459f@kernel.org>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20240910154405.641a459f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11.09.24 00:44, Jakub Kicinski wrote:

Hi,
  
> I have sort of an inverse question to what Paolo asked :)

This is getting interesting.

> AFAIU we need the double-cancel because checking the flag and
> scheduling are not atomic. But if we do that why the memory

Right.

> barriers? They make it seem like we're doing something clever
> with memory ordering, while really we're just depending on normal
> properties of the tasklet/timer/work APIs.

Good question. I added this because they are used in usbnet_defer_kevent()
which can be used in hard irq context. Are you saying I should check
whether this is actually needed?

> FTR disable_work_sync() would work nicely here but it'd be
> a PITA for backports.

So should I use it?
  
> Also - is this based on some report or syzbot? I'm a bit tempted
> to put this in net-next given how unlikely the race is vs how
> commonly used the driver is.

Having found the thing with the random MAC I decided to look
closely at the driver for overlooked stuff.

	Regards
		Oliver


