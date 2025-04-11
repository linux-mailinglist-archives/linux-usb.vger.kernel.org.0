Return-Path: <linux-usb+bounces-22975-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E74A4A85F2D
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 15:38:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7AC4544106C
	for <lists+linux-usb@lfdr.de>; Fri, 11 Apr 2025 13:34:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E6711AA786;
	Fri, 11 Apr 2025 13:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="AB4kYOjG"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C671F5828
	for <linux-usb@vger.kernel.org>; Fri, 11 Apr 2025 13:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744378365; cv=none; b=C7u9cT9jAGNN6hHByv/iCjH/6HOdB+n1D8CyeN0Z6IpDYd1Nqgw6S+OxpvsYxSllwCPiOVfi0dKZMduGFalufnFUz5tKTN98HWgGjQnRugYaYvpU5zCbrwqANPucWx2J/9qflc62xHEHZg+zs/vS6sPnHZyi+utz4ojRpZF/IcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744378365; c=relaxed/simple;
	bh=MZVxMmDkiFSXjVRJNNkrhkJlUN93Ava1/DzXk572XC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Aj1nTwPIzt16U80akhsy4bLHtvw42SV+8MtsPWjEa8RhoJESR4w84RWpJzUi5kWkkGhjd7HeJ/tjbKy56tvVC6q9XeJmUvjtweGTiR4BtNcg/4vm+fcek7SsJxKudgRhZmIxi3bZDyzvLVnWzSgi6N/Cp5Nke+/5saB6YmwcCT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=AB4kYOjG; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2241053582dso27242595ad.1
        for <linux-usb@vger.kernel.org>; Fri, 11 Apr 2025 06:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744378361; x=1744983161; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IbIVaZg1KTEytG74iCEwD7bcscUv9siCSknWzupnAMA=;
        b=AB4kYOjGZSh+GY7J8GjdWChYnQGWQp39qOAS5IYZV96oRXJ9iZ7BXVT8eWqWvb174J
         JC88lQZ1rSTdJExySs6b/YowMjmr0+Vo7GNYfP+xSMu2CGb2Sfb7PYTBXGtiv1NcwPZO
         rfp4LJFQyiN6JxiuFHOIS4Y/OYCqSuRgt2/FXnscVcIH3liw61u5ISmeD6fnbGJpST7x
         DVm4eU0PLbvrWQ2pRHL8UUcEe56R4PJY7OwWtM89RDjxbBFeAJ+l4oRgLbqR1g/mbtDU
         zGvSh0xGR0rhcU5DebCPPGKoD9SSa4Tzz7PCG5GJb64Ik4sxSqul/ZEVaDFkwL3r2plS
         grcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744378361; x=1744983161;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IbIVaZg1KTEytG74iCEwD7bcscUv9siCSknWzupnAMA=;
        b=cYngJmxhqvcmET4TTd0/CaPn6c4uW2L340EmqedLwyMoEgnAZWhM2aLd/uhVkEv9oU
         Av9vWpdm9A2IZWI6vYgW/KhuLrNvTJq/+nSI5eZzVAD10ChWZr09qssbiWATA9DAyLVt
         AD+oqNmKLIq4rUvecHWYdP2m0/3vX2iWmI9Jd/3qxys4W0lG+D3GrxuZu7cjlrJuVl5y
         4hjuuSVZzNGRlKBe/ow7wNodI3HNM6JUFQgwVdzFdeABwawN9ei8Dm4mkKyquRIDQY19
         QdIU0QSx8TGzrlC39QdeDhyvjALYsuFgN9d6pRRBD6gpt1BA3TZ7oRB+JE4Ya/Nx6UHR
         1/gA==
X-Gm-Message-State: AOJu0Yx0gZGkezReargyDZmIj1z23pbXG9w2rQNApivkscVMg1YzaA1I
	egXfwdJGLRcxRHPGHyKGEE+goJQLyr18Nj/Kgv4xqbNKI43jSH/LKmTMaGzcs3Xb9hofNNKGESq
	NNiU=
X-Gm-Gg: ASbGncsNUqVpe26BhM43cxhfkRKQEHay3dGA9VEFa3iZvVu0Lrd8+mJ4HKnX3Es16TS
	5MPARXs4WXkPDM8naxsY4ZL+I7WrB037fFaDdCKHAaSqPVOTARdJLjU4jl8i5zC0vm6swB9zC4g
	TOoJxlJ92deqly/3+MeCcUkrpNWb/YhlY3h0XLF1656t6kfdGVeHvSZ8XfvKSNLiq01Ts4uvmAu
	BblF87B1hyY5SLUUMQeLEBGaGgcTmnjl8Qw1yDa07pz8JaYWJHI1/zHJ1cnQl9ovldGt+bOxhKn
	9UNicf8A4Dj8QC1YBaCNCuS+H3mH4HdnSYmvyy2O54or5Rwq8UIDaQ==
X-Google-Smtp-Source: AGHT+IE219zNoKn3fh+pOBnc+bKK/oYYiCeFX1H1Q2omwPngcEIUDeJOIyhovIuIh4nrPifTAu4SgA==
X-Received: by 2002:a17:902:d2d1:b0:223:f928:4553 with SMTP id d9443c01a7336-22bea50bb7dmr41681885ad.44.1744378361438;
        Fri, 11 Apr 2025 06:32:41 -0700 (PDT)
Received: from ?IPV6:2620:10d:c085:21c1::10a1? ([2620:10d:c090:400::5:3722])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b654a2sm48943865ad.49.2025.04.11.06.32.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 06:32:41 -0700 (PDT)
Message-ID: <dab8e91a-a751-4307-ad21-31d3539963da@baylibre.com>
Date: Fri, 11 Apr 2025 15:32:37 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: gadget: f_fs: Invalidate io_data when USB request
 is dequeued or interrupted
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Thinh.Nguyen@synopsys.com,
 Frode Isaksen <frode@meta.com>, stable@vger.kernel.org, jassibrar@meta.com
References: <20250331085540.32543-1-fisaksen@baylibre.com>
 <2025041139-sedan-liquid-de35@gregkh>
Content-Language: en-US
From: Frode Isaksen <fisaksen@baylibre.com>
In-Reply-To: <2025041139-sedan-liquid-de35@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/11/25 3:08 PM, Greg KH wrote:
> On Mon, Mar 31, 2025 at 10:53:50AM +0200, Frode Isaksen wrote:
>> From: Frode Isaksen <frode@meta.com>
>>
>> Invalidate io_data by setting context to NULL when USB request is
>> dequeued or interrupted, and check for NULL io_data in epfile_io_complete().
>> The invalidation of io_data in req->context is done when exiting
>> epfile_io(), since then io_data will become invalid as it is allocated
>> on the stack.
>> The epfile_io_complete() may be called after ffs_epfile_io() returns
>> in case the wait_for_completion_interruptible() is interrupted.
>> This fixes a use-after-free error with the following call stack:
>>
>> Unable to handle kernel paging request at virtual address ffffffc02f7bbcc0
>> pc : ffs_epfile_io_complete+0x30/0x48
>> lr : usb_gadget_giveback_request+0x30/0xf8
>> Call trace:
>> ffs_epfile_io_complete+0x30/0x48
>> usb_gadget_giveback_request+0x30/0xf8
>> dwc3_remove_requests+0x264/0x2e8
>> dwc3_gadget_pullup+0x1d0/0x250
>> kretprobe_trampoline+0x0/0xc4
>> usb_gadget_remove_driver+0x40/0xf4
>> usb_gadget_unregister_driver+0xdc/0x178
>> unregister_gadget_item+0x40/0x6c
>> ffs_closed+0xd4/0x10c
>> ffs_data_clear+0x2c/0xf0
>> ffs_data_closed+0x178/0x1ec
>> ffs_ep0_release+0x24/0x38
>> __fput+0xe8/0x27c
>>
>> Signed-off-by: Frode Isaksen <frode@meta.com>
>> Cc: stable@vger.kernel.org
>> ---
>> v1 -> v2:
>> Removed WARN_ON() in ffs_epfile_io_complete().
>> Clarified commit message.
>> Added stable Cc tag.
>>
>>   drivers/usb/gadget/function/f_fs.c | 5 +++++
>>   1 file changed, 5 insertions(+)
>>
>> diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
>> index 2dea9e42a0f8..e35d32e7be58 100644
>> --- a/drivers/usb/gadget/function/f_fs.c
>> +++ b/drivers/usb/gadget/function/f_fs.c
>> @@ -738,6 +738,9 @@ static void ffs_epfile_io_complete(struct usb_ep *_ep, struct usb_request *req)
>>   {
>>   	struct ffs_io_data *io_data = req->context;
>>   
>> +	if (io_data == NULL)
>> +		return;
> What prevents req->context to be set to NULL right after you check this?
>
> thanks,
>
> greg k-h

Nothing really, but the race is really much shorter. We will try to redo 
this code, but that will take some time.

Thanks,

Frode



