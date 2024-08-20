Return-Path: <linux-usb+bounces-13711-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9219580D6
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2024 10:22:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2B34D1C231EF
	for <lists+linux-usb@lfdr.de>; Tue, 20 Aug 2024 08:22:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF3D718B472;
	Tue, 20 Aug 2024 08:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JaqxX9g8"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9443717B4ED
	for <linux-usb@vger.kernel.org>; Tue, 20 Aug 2024 08:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724142078; cv=none; b=LFK/eGzt3kTgMYBpg56VLU7J9S8hZB7JpAZEcwBf35lNtdbFJsCr7Co/oVB5fETVUrnbdH4zoJ6EfHc1hZP1KeQSaloaWr94IUG7mJQGwRrJNPJCn/6Fr+qtrjsiqYaCGLPhnUKnrTjlkWAcwTIgFrw3SNUykuwFnWgI0z2odt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724142078; c=relaxed/simple;
	bh=o8MrEUd5M2Gu8KypNHZU9u1pS5gdjyw19lhXla6B7po=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GeBs34EGQY4NLEDdhBKQX9AJQxyvL1aiUEThh893htIzse3i5NKU4kG2Lbj7Avop9fIxghHDZF+8VdF2weWKqBiDylf0x624SjzbX9WzXyPTq0yzqwhn1CXryzNJImC9ZOncVS8jS/V6cNLX6NiX7TPyVX0fQRjpzTsrRnTt7mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JaqxX9g8; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-371a6fcd863so1951719f8f.1
        for <linux-usb@vger.kernel.org>; Tue, 20 Aug 2024 01:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1724142075; x=1724746875; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DK7xKT5QiLIyWpzl0HT94Urloq/3djnO1+ZdzfVqpLM=;
        b=JaqxX9g8F7I3c9emEI31oZsiQExVjj04ySr4/DImVnNpP08A4xHFspb/ttMZSfDxB9
         YXpEvMyhXLN7JD//WtN7K9f+9bNtL7/k3SJdHSODWoWQyGcrUyAEz32XGSKaVi3RJ1Tx
         KNh9GlAkmTThU/pGhLF4r03k9AbAPmBQEEx/93rbb3DON+ZaSbtoSLQVxlUgSZvJ6bXt
         OJcDQOL2qDHcv00xC1UW3Gvbw/ZR1Roo/LHukD6/M5vrSrKr5YEs67SML1ZDGqjkYqL3
         ytW1j+eYJVN+eJj1BdnYw1lBukr7ueEzYgMTVszA10jbQpI3r+y0wqhWI0LdTyuf5+f1
         Hv6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724142075; x=1724746875;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DK7xKT5QiLIyWpzl0HT94Urloq/3djnO1+ZdzfVqpLM=;
        b=Wc5q2drbx5x9qYJH02fJfQcqZyIBpjS3nnHvzjpTjQ6N7IIiWf4nV6lJR5QI5Dqg3v
         Q4C4T94P7HMpUjqsWYFXUx/fSbBalzMfVmJLaSiYLZ4J5ZfC29t8fN9bqQ3v1KdjK98J
         ZxoQrFb2a6rHmxxKPDA4iOodixxaecPx+PhrkWpP4881PK5Z8WhfPqFPt4wxbJsWs/Tv
         xAGy2QP2Xx59/vMWfOejUQYQHSrmJrGCW+FbiQKjaWfFnwith4fkoonM+P6dP/UFdC+o
         QBwbcTGcUTKSzeyiDBMDgPok0w15X1JlCtUXNbVdOlnVA68IFANqu84dtoo+yTBARssT
         nLHg==
X-Forwarded-Encrypted: i=1; AJvYcCX68kHUC8neLNxc4rW2/aBWv1MfPBBCW4Lpv5DjJoygFBBO8y2otimSJpyUcW08svWtL33jaR9iDL0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzPmV41xBJraeV2E2bQuaNHsfqdn5b7vCsgAElFK5Drh9Yriv60
	kd/t+pUQKuYM6n0Xbac+SweefUGMhOqRWpRdqOnPEkv65AzTs27eUqLvKFna/sY=
X-Google-Smtp-Source: AGHT+IFfCic8OEGMweFYZXCw5OpXMNxeLZKvnaf95xbyXG3CHg33opQAkZz0NNj6BlAlwK4stFAZ4Q==
X-Received: by 2002:adf:f843:0:b0:371:8eea:24b4 with SMTP id ffacd0b85a97d-371946d5dd2mr7577443f8f.61.1724142074333;
        Tue, 20 Aug 2024 01:21:14 -0700 (PDT)
Received: from ?IPV6:2001:a61:130c:6601:848f:4ba9:91cb:3485? ([2001:a61:130c:6601:848f:4ba9:91cb:3485])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-429eea70115sm130843145e9.36.2024.08.20.01.21.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Aug 2024 01:21:13 -0700 (PDT)
Message-ID: <22bd911b-b328-4536-92bc-e5d89d0eb9ab@suse.com>
Date: Tue, 20 Aug 2024 10:21:13 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC] USB: ipeth: race between ipeth_close and error handling
To: Foster Snowhill <forst@pen.gy>, Oliver Neukum <oneukum@suse.com>
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org, gvalkov@gmail.com
References: <0E5elkMIg5-dqmrTakb-xo6Yx_VnD_6Fc1Wud6LijP3iooYsrIjbLHxx2m9MVKe1conEc0Tjke_LjHS4mToF0A==@protonmail.internalid>
 <20231121144330.3990-1-oneukum@suse.com>
 <40b8002c-927c-434f-a82c-73443e0207f7@pen.gy>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <40b8002c-927c-434f-a82c-73443e0207f7@pen.gy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 01.08.24 21:42, Foster Snowhill wrote:
> Hello Oliver,
> 
> Thank you for the patch and patience!
> 
>> ipheth_sndbulk_callback() can submit carrier_work
>> as a part of its error handling. That means that
>> the driver must make sure that the work is cancelled
>> after it has made sure that no more URB can terminate
>> with an error condition.
>>
>> Hence the order of actions in ipeth_close() needs
>> to be inverted.
> 
> The change looks reasonable to me. It's been a while, but do you perhaps
> recall how you stumbled upon this? Was that a proactive fix, or was it
> in response to an issue you (or someone else) encountered? Basically
> wondering if this is something I could test/reproduce.

Hi,

sorry I was on vacation. I think I looked at the driver because of
an unrelated patch and saw this issue. That bug type is not exactly uncommon.

	HTH
		Oliver


