Return-Path: <linux-usb+bounces-14845-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A5F697127B
	for <lists+linux-usb@lfdr.de>; Mon,  9 Sep 2024 10:47:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 55BEA1C2245E
	for <lists+linux-usb@lfdr.de>; Mon,  9 Sep 2024 08:47:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2FEA1B2519;
	Mon,  9 Sep 2024 08:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fKEiFbNp"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BA091B1414
	for <linux-usb@vger.kernel.org>; Mon,  9 Sep 2024 08:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725871637; cv=none; b=PATPgas1A8/dgYvoXIo/5MVxMVggPgOLc0Wa0iO21U6l86fnRElwzFtrlziHsQ5qSNGkhBGERdpN7sk78d+XVHkZbS0CG6GpkQ30zmoLDg7firAAt4aJlQ+Gs87riGqADSHRT2cjjxNxcsnun/SGjuPPdmMZhe1jVMYLqafRdeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725871637; c=relaxed/simple;
	bh=67DL9UktAXzrHcrFumAZEwLE/YCzi76PqdEqAACbucc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BuTfeypEbrZ+CZSNG1Xeb4ORmDTrIz+FBz+/w9GgICfAtnFbp5nAset/aTTQ/vbNhtB3R4bNLFUqVVLPT1HlTGYPgsC3Q9swcedmeklxxZ8bxvuBilji96Lzx6V0NTWD1MVa81eGtuXT59ndgPpw69+k+eOD0tIQ8Jisa7aB8Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fKEiFbNp; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-374b25263a3so2288323f8f.0
        for <linux-usb@vger.kernel.org>; Mon, 09 Sep 2024 01:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725871633; x=1726476433; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eRhD01m5pD4Tx0VdaioM7TI5h41AeXLRmUnW4jKsLv4=;
        b=fKEiFbNpdKnHeWCQAEjSiK9f5vLDjY6of7/XOJO/quo/VzpsvtL2dLXs+wyIlcVMfg
         oQVnN35reSYT2yGwXA+zK/tUD8vIiaiURkg8MmGB4aEe+yavZYooua1ScW+CqGk9JRkY
         0r++UYddvOFHr6Q2aWOL9wQgpGvYRuO1AmYKqUYkuVS3RLJ4cqZpH5FSdCU93mFjXk1g
         +yP0AAoMKfxmgVGCEzeihoei5+F+mow7TjQzxwrj6MHnWNREUE5CR+cAQeZKsau8JdAK
         bJLeMC5U8+w+piK+PpHL5Dgks8Bt+/bK88UvRHCTtwlz9Owsij+UkVvmX64Vku9UBclM
         TaHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725871633; x=1726476433;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eRhD01m5pD4Tx0VdaioM7TI5h41AeXLRmUnW4jKsLv4=;
        b=SqPILWkQ5ZJZO5UL0ZBlismgYzNQP/eTw6cc85XwjQGRmJ+8C+Qzv1PPDeQnno4gRd
         qEj+I3JXd7CWuln61CifTBCKCwzzI+2p+GaYFzJlIICWYLFNrnFScV2MuEflCE1wxgIh
         EfLylkKPZ6OtlvBYsXZh7iRpzCw3Thn0Kj2zxm3Ki6bUSh+4b3fRkjcVfWfLOqHb0ZPF
         aphFu/Eg9r0CkiRSUrGT6hRM63gRYQ7e80edhnkcXb/Drqj42cOgv9bI3tK+PwqdknU3
         S+4yB1e0YQ3+5pCSb90D7FwxmwFWy0N0BoxMoG+wwP7q/hlPFpbmr6jJxOLCyFQ+/ecs
         kYhA==
X-Forwarded-Encrypted: i=1; AJvYcCW8iBXk8mTJ0LQ5wup+RFspcVbJrZuQgYoQFSejVwOldm7AUcZcx4Pyui64Fxvrs2HMV7E1kz1gqns=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd3jiYs8cqPk7FtztoOAtkT7qLzDCqp6CLZvBz/NroHSbjDlgF
	GkJrPlDcFFhc0bnphkVu12MrGdzDZjTlaFSa9VVmcdDAppodG9/DBVFmduZpsnU=
X-Google-Smtp-Source: AGHT+IHuH34xXlzk7fHHJpOQQ6kyrzNVVCI5+xfxdmnh0PKudIfQ/+z8O+v3Q2sgfq3jECYDUsY0AQ==
X-Received: by 2002:adf:ec06:0:b0:374:b6f4:d8d1 with SMTP id ffacd0b85a97d-378949edc6bmr4108900f8f.13.1725871632820;
        Mon, 09 Sep 2024 01:47:12 -0700 (PDT)
Received: from ?IPV6:2001:a61:13b3:9201:e68f:3bce:663e:dfa9? ([2001:a61:13b3:9201:e68f:3bce:663e:dfa9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3789564a340sm5421316f8f.24.2024.09.09.01.47.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 01:47:12 -0700 (PDT)
Message-ID: <8510a98e-f950-4349-99bc-9d36febe94d3@suse.com>
Date: Mon, 9 Sep 2024 10:47:11 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] usbnet: ipheth: prevent OoB reads of NDP16
To: Foster Snowhill <forst@pen.gy>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Cc: Georgi Valkov <gvalkov@gmail.com>, Simon Horman <horms@kernel.org>,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org
References: <20240907230108.978355-1-forst@pen.gy>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20240907230108.978355-1-forst@pen.gy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 08.09.24 01:01, Foster Snowhill wrote:

> To address the above issues without reimplementing more of CDC NCM,
> rely on and check for a specific fixed format of incoming URBs
> expected from an iOS device:
> 
> * 12-byte NTH16
> * 96-byte NDP16, allowing up to 22 DPEs (up to 21 datagrams + trailer)

I am afraid this is an approach we must not take. We cannot rely on
a specific device's behavior in a class driver.

This is a NACK.

	Regards
		Oliver

