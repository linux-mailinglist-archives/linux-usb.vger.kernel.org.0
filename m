Return-Path: <linux-usb+bounces-13260-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E0F4294CB76
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2024 09:34:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F9CC1C226D8
	for <lists+linux-usb@lfdr.de>; Fri,  9 Aug 2024 07:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9BB9176AB0;
	Fri,  9 Aug 2024 07:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BpiwhSN/"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDD91741C8
	for <linux-usb@vger.kernel.org>; Fri,  9 Aug 2024 07:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723188826; cv=none; b=JT3pIoM44Kvr3nY+swvloGLEFvOlZ0DhONxUliAFy5yvxefqOQ/I0O+FE8nLNIyavdb/CuVg+3u0aihlE6H138GbkqW+wBBBkw9j7+2I/8msCGQ8Jq3OCoVDvOSCkbFQwV4gOEt58XaIs2G4EIG2BDCCBYk3paxbCWUx4tfUB00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723188826; c=relaxed/simple;
	bh=Q1mcjuLONqfG7Z4yG6maXMM/vZq+kT84tDgsoE76ncM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=H4CX0OIxW7feQhVZaU7/wtJ4cL3rjJexlAScBJdIne/BUfSvpUF8k9QrDKfF2BuyVYnhjS7/rVwOQBFmhpbxk6UYJ50WvFTZ8HbZFF2IaF8I2Z0V1Tn18gu/6Gin4MdvpwIUexRcz4X02q5y0YObDZld0t54qVMqo1aH3B7JXxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BpiwhSN/; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5a2a90243c9so1607934a12.0
        for <linux-usb@vger.kernel.org>; Fri, 09 Aug 2024 00:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1723188823; x=1723793623; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4SGsldqp+hDlVL8D57BpMZOsCk6Ojm6sVxq8GpmZQ/w=;
        b=BpiwhSN/kz3fDHSkwMfssgDYimhkz0I0/dYS+bU0Go3ZTYi2eqEKvoEVFWFX2OMMSM
         NRyWZAie6FGi8w0yC6klz8yXocNoPosTi0+ZRJGtagjS5mqL0hA8frQEvWdOOM3Kze0z
         jQOgUumghEXKHoYZBMvvF56MX0ASRvsecqQtJEP2nd3maIfNzfRBwePsTfvsTlXos00Z
         RMfKAByM5MJJ45FJciTtiQwy3spiF3QAH3ykFmuy3TjO3zZplMNrYPV6tUOUWrvd5RXK
         amp3BuJtnvrcU6JH1pN6d13JqVMpAHo6f+UkCJUmCnSwRDAkxUIRn2GfWBE1u5JQG1uA
         VTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723188823; x=1723793623;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4SGsldqp+hDlVL8D57BpMZOsCk6Ojm6sVxq8GpmZQ/w=;
        b=OEkplj1nyVgQ6o5+s3Lt1grgo+Jcys+Rp1eVsQ3CmbciuIMUPN5pJdkclpxoRExfIC
         Rqy180O3SkOiaZiCNCJXMAR+4NxA4yxudMV2PQAoKrmAexFwHpFg1v9Y6tACaXiZZfHf
         0G4vrVLwBkh4SuJZZ2/FsM6wnGAlKgnRsC09fX8GAiPq5AEIGBQKIlWh0CUDMMJFVjLp
         coSc2aUAPVwFjsjuOWnbIRk08cdtc4in85V4co7ARQZ8PPLw7a1WpWM8xZNpQ7oEetvE
         63ZpDeaJjtkc7FM4PH3ePDGnqzrfBb7D3+2bdD9m7fZoFttNYbMW8KvgYn1DbpdbS8Ee
         IWkg==
X-Forwarded-Encrypted: i=1; AJvYcCXG4x8qqusMtRansNXi194xe3hwUUfjtUZ2MtARpFNXi3TdCK8WOd0z1N0I1FGLlHSvHaog4xdsKvs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwExodt8tplW3Oys2NKIDPVo7YEmLDlHFY208oqiWwcy62BayNG
	J1IydgpLrp/0PXRbjnkj+cfB0+dJPBSl9aKgnBRKxV43VQL5fEhSaggrYotvles=
X-Google-Smtp-Source: AGHT+IELDFmoH9CY6TfEHd5HnEe1eK9/Z/OJypNEf5K4kh+1tYHH0J0ihVr3o6pUtepvwBsIlOXlUQ==
X-Received: by 2002:a05:6402:34c4:b0:5a1:1:27a9 with SMTP id 4fb4d7f45d1cf-5bd0a5bde68mr563842a12.18.1723188822374;
        Fri, 09 Aug 2024 00:33:42 -0700 (PDT)
Received: from ?IPV6:2001:a61:137b:5001:be5a:c750:b487:ff1b? ([2001:a61:137b:5001:be5a:c750:b487:ff1b])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bbb2d34a69sm1293037a12.70.2024.08.09.00.33.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Aug 2024 00:33:42 -0700 (PDT)
Message-ID: <4345f70a-4d82-42b5-a607-d93db02ffb9a@suse.com>
Date: Fri, 9 Aug 2024 09:33:40 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] net: usb: cdc_ether: don't spew notifications
To: zhangxiangqian <zhangxiangqian@kylinos.cn>, oliver@neukum.org
Cc: davem@davemloft.net, linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <1723109985-11996-1-git-send-email-zhangxiangqian@kylinos.cn>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <1723109985-11996-1-git-send-email-zhangxiangqian@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 08.08.24 11:39, zhangxiangqian wrote:
> The usbnet_link_change function is not called, if the link has not changed.
> 
> ...
> [16913.807393][ 3] cdc_ether 1-2:2.0 enx00e0995fd1ac: kevent 12 may have been dropped
> [16913.822266][ 2] cdc_ether 1-2:2.0 enx00e0995fd1ac: kevent 12 may have been dropped
> [16913.826296][ 2] cdc_ether 1-2:2.0 enx00e0995fd1ac: kevent 11 may have been dropped
> ...
> 
> kevent 11 is scheduled too frequently and may affect other event schedules.
> 
> Signed-off-by: zhangxiangqian <zhangxiangqian@kylinos.cn>
Acked-by: Oliver Neukum <oneukum@suse.com>

