Return-Path: <linux-usb+bounces-22144-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C00CA70E86
	for <lists+linux-usb@lfdr.de>; Wed, 26 Mar 2025 02:36:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7FC473BED94
	for <lists+linux-usb@lfdr.de>; Wed, 26 Mar 2025 01:36:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EEDC42A8B;
	Wed, 26 Mar 2025 01:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dg1xB1Tb"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6B0DF5C
	for <linux-usb@vger.kernel.org>; Wed, 26 Mar 2025 01:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742952990; cv=none; b=fH1dduYlnHrcU7WjoNvhhKh/0Xl94bR4xBsxaIWKbog3Du3kvb0aAaaEKY4YzmHHxEFV2WZ3Wf4D4RTnEfkDJ2b2Cc6+gs+vgVJLRTl546tpUqqvl9WJaXL9ivbRrpLDq/OVAhbxjauVBOgEXUHfr0VbOi93DYHkbVtDKjjTR4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742952990; c=relaxed/simple;
	bh=Wuqab0HdQvHrqnNqC+Iusk+8Hb4mzwihz0ies7iFSF4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V4qMmRDGgvHO4YMyOIWGKfaxq3gHKLP+zSHUQhmRcvS1caEoMENAEGfjwsSSifkIuQv9RVuggPMsbEPldY3lUO1N906ftRUcpooU1yk5JQqo5K6cAcIh5u+5TYj1SQxtVbB/H9Y61X8uvOly7JKwO4Jo++i/waZZkMo+PCTcSi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dg1xB1Tb; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-223fd44daf8so17449545ad.2
        for <linux-usb@vger.kernel.org>; Tue, 25 Mar 2025 18:36:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742952988; x=1743557788; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vABMZ+HMpxHLBqQkd/9ryM8q0OeXXesUVuzdg2k38lM=;
        b=dg1xB1TbYSWbRyHEtndh9wGBu3ru3xWIVIuzezN+lkx7S3JIgE8rWlmr9vEvZYJa14
         FvEEBHp57qGGpetrxd4IEKHhCb6KXU/+3fMH9a/U+2P9CQZN1eO53ZEPwOCNaWNJ6dJQ
         HbQwn400iXzAxEZjrsbPP3+xHaXS+smBDYQ4zcow62kmexBAVnlVcwwz4gdOaTfmAVgt
         GR++0EqesCEqNWNy2+nFQ4skhPYK4+G8mjMZWllyfrYK/zTWh0noYhkwWisVGZJUzYMQ
         AeJ7spvOPL6Fy7lIK2Fdu5ACUePGsjezlhM1OdaqHCix+TCR4NUSoFmlPMXUr4zevA7e
         a2ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742952988; x=1743557788;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vABMZ+HMpxHLBqQkd/9ryM8q0OeXXesUVuzdg2k38lM=;
        b=eRu5oJTsTVcBHPijUCD3SYoVzVzytrHSOFYdoXt3Aio4UQA1fYj0RJ86hbL/m9kEt1
         wRz+OF+kYhW4R4Uz6I0wUcdJrDttnuYA3/MDRk05bZo900WP6XCgAFTsIfCD+ZvHjEFk
         BVJ/5RLa7/KFP6lNNc1HGNeFkp1p+47TjnEz9gLVbABfOjMtLEeyghFgjd4Gd7xfkXwz
         rEzemKIErIBY8ggUQVgmWd1TuUOyALwPecri+ph3NO4LLZoOAhGOoAM/iE3ht8m4Cs9m
         Nmav6WTnrWhB7F2uBAkqg9dbhjLD3ZzweZ2B1xvHXzUskneokjj21Qbla7RcMcBgXk+I
         11og==
X-Gm-Message-State: AOJu0Yzo3/PrxlcBaJsCeru/QzIB7DYXlvuW23BufIQ3RZY2NNPe6uxC
	gSNVKK8gMqCcNIPp1OwCcwOo3bGZXDWmGXMQMHY2IghmsFbkS9dJ
X-Gm-Gg: ASbGncvlSQqCf3lgYBkAvRJWS+ZogHy6XXwVOUyoD/8f6V6eSi/3nglrZeIDAs7jfUC
	fqX9BIxiPvfbmQB/gSQjf6dKVt7S5/3nr25UPZ1OScw94hB34ESrT+1g9pZoLMw/mJOCiLpGKWT
	lx1N4LaOvaw8/CeIqmcNss21uQ+BarGsZALK4mo6oAoFmF9JRRmVldfSd5PG333iVoj76AFNScL
	MhCcTfDW6tUhAlPNaeDxCD16u5WsX+sFja/PgwyHEb8R5PFdAWHy7pYoSIuNUllJfzKXc5KWHcd
	eQJ4xlUE61oDG4qdyB1iLp2jNH1IDbe3ZwGuHdWo7HlGOn2ReGwovJkuSbZW0DYWfA==
X-Google-Smtp-Source: AGHT+IFleCF6JD7yUQUvVL+suuPC+X4CXx1da961r55LLBBVse91F4P3naqO/QmDbxeJRHxWYVvbBg==
X-Received: by 2002:a05:6a00:3916:b0:730:87b2:e848 with SMTP id d2e1a72fcca58-73905a509fdmr10628055b3a.5.1742952988299;
        Tue, 25 Mar 2025 18:36:28 -0700 (PDT)
Received: from [192.168.1.7] ([159.192.164.37])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-73905fab61dsm10949652b3a.30.2025.03.25.18.36.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 18:36:28 -0700 (PDT)
Message-ID: <e36409d1-60b3-4ee5-a4b3-1f5976c8ef0b@gmail.com>
Date: Wed, 26 Mar 2025 08:36:23 +0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: USB: serial: qcserial: patch for adding Sierra Wireless 9x50,
 EM91, EM92 and SDX35.
To: Adam Xue <zxue@semtech.com>, "johan@kernel.org" <johan@kernel.org>
Cc: "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
 Iulian Mocanu <imocanu@semtech.com>
References: <DS7PR20MB4855FE3E27EFAD39D56FF897C6D82@DS7PR20MB4855.namprd20.prod.outlook.com>
Content-Language: en-US
From: Lars Melin <larsm17@gmail.com>
In-Reply-To: <DS7PR20MB4855FE3E27EFAD39D56FF897C6D82@DS7PR20MB4855.namprd20.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-03-21 05:08, Adam Xue wrote:
> Hi Johan,
> 
> This is the patch for adding support for Sierra Wireless and Semtech products based on
> Qualcomm 9x50, SDX35, SDX55 and SDX65 based products (EM75xx, EM91xx, EM92xx).
> Currently, only our products based on Qualcomm 9x30 and older chipsets are supported.
> These products have a different USB interface layout compared to the default one which
> require code changes. The VID/PID list has also been updated for all products mentioned above.
> Please review.
>   
> Thanks,
>   
> Adam
>   
> 

Hi Adam,
this is a NAK of the patch from me. EM9191 (1199:90d3) is already 
supported in the option serial driver and that is also where the other 
Qualcomm SDX based Sierra devices should be included in my opinion.
SDX devices from other mfgr are also supported in option so it makes no 
sense to add more special code for Sierra in qcserial each time Sierra 
decides to change their compositions for new devices.
This is all up to Johan of course who may have a different opinion than me.

Thanks!
Lars


