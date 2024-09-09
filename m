Return-Path: <linux-usb+bounces-14851-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C46FF971634
	for <lists+linux-usb@lfdr.de>; Mon,  9 Sep 2024 13:05:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EDE361C22DDD
	for <lists+linux-usb@lfdr.de>; Mon,  9 Sep 2024 11:05:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 020AC1B5821;
	Mon,  9 Sep 2024 11:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ZDujQyy0"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E68A1B5309
	for <linux-usb@vger.kernel.org>; Mon,  9 Sep 2024 11:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725879889; cv=none; b=Wzv7rqMZYsPjLINBVdqT2fiLQKfyQIhQVO9vB3utquMxrsgc4SNS9kOA5kks5nkgEBi1W4pTS64Xoh08XzvAyOJh5lr3wx/JSR9ZiXZGaR8+/oHJsDawym+mirUJKVhjUyyKXVgsUTc7QH5ZNgFEUP5jU6krhVUljpKpAAU4+UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725879889; c=relaxed/simple;
	bh=szTqbfCGzry0H7Py1nmRo5tO1eeQ9ULTLcYO1zLFbLE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tD2+vAsCIN20c2/pN4CHFFs2lGAp5qKfF8ANyYOp21BwfitsHjFnv+YCknFwiH3KcF1n7T/aw+dZsUIaafjtmOV3QOQ5xcX/UVW0W7sgiCBMK1AnxweoDdbJ4EUNAAZovCvX9fZQw7nxCWCNZ0Bah7OW1pkS/iDBTT8f38L0Yic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ZDujQyy0; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53567b4c3f4so4215727e87.2
        for <linux-usb@vger.kernel.org>; Mon, 09 Sep 2024 04:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1725879885; x=1726484685; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R+ACCN4PdLgMnNkEduMHgpyyWq6nTrphJ5WztKFlcaY=;
        b=ZDujQyy0jqGKgZllLssWleh41ElPBH7BRE8fQx+IpxDYZxhSsm+9CrzJZswNMwPu0Z
         hTWZTKMGbGwR2gYsNbYFyShzh3Tvtw4VyLxEVswGrmNDTMgT1TFcmDBkiDb17gNd28PL
         cKadUQXYy1wNTcjxvdR/jDVXgBNo3aFRgoChIZ+NUFTi9hS13z/xTkoNM0jsAqI0CrsC
         p1kgUCNTCIFQnXR56zx1+dDyYPAdNQBdrx2mNI8V3JXY6+VLwchfkkzG1KcHESgCaGLj
         N+H1/Oh7hPt6L2D5XLF3YiLHrHjmDcXqjKg0szGauCRBth+twOujYlE8j4kvfApatJoV
         6j+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725879885; x=1726484685;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R+ACCN4PdLgMnNkEduMHgpyyWq6nTrphJ5WztKFlcaY=;
        b=M7y8hEvj1F5HtjlBaK6ZlLvo+gXuBHcnRI/ujiZBBokLf62vvotNMKHt0fETrlERG+
         YX1WYbcjJ7ccGxUHHactFyiaIiasuqgfx5hvHT//zIBi2aoja6oARZ15QLyoqJFhINth
         3zpmsVNgSSH9ZgR56S739Sk8uxlCNU7G6dJCx9jqgnXMjZRuAjEejlRFoqzJc3HeOlTN
         BSQO9+f1Ad4xX2t/G8mG8Orf6zmuRQx/0T9uQwTDU+ofPqxOYnA9F0CuDqvsazCCb8TJ
         FnYsNyN2G5TGtda+PmnRTxjYxku9ZpjZt0eHSvBY3le137NKwo/tvQdN42lu06kNirVz
         CORw==
X-Forwarded-Encrypted: i=1; AJvYcCVKUxPsb0rZ0IAlTDMsAg+UxmbAyQmbhVBcGgEk9TEbwDP/MotjW9WiV/hPnd3oPgW70u430sI9pjY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBZuZqM+YZyESo2vWva1W4ctNYzuzabX6cD6Ow1X1kSO9Squwf
	CF9qEhqpmRNF5hGJ0Y/l3iQeanJdV9ICT/kRYhuyWbCSdwvc3UowWQrwfMF6OmQ=
X-Google-Smtp-Source: AGHT+IFKSYbNan1yW0bAt7KrzaEur4+mXSdgwQLseUO53131XSZWa6HbJ1TUV4/t81eBc7MSC7ElwA==
X-Received: by 2002:a05:6512:3e0f:b0:52c:dc6f:75a3 with SMTP id 2adb3069b0e04-536587ef21fmr7504017e87.40.1725879884943;
        Mon, 09 Sep 2024 04:04:44 -0700 (PDT)
Received: from ?IPV6:2001:a61:13b3:9201:e68f:3bce:663e:dfa9? ([2001:a61:13b3:9201:e68f:3bce:663e:dfa9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25d64880sm321392666b.219.2024.09.09.04.04.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Sep 2024 04:04:44 -0700 (PDT)
Message-ID: <d15bc43b-f130-4fd1-a758-b19b2dc99d46@suse.com>
Date: Mon, 9 Sep 2024 13:04:43 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] usbnet: ipheth: prevent OoB reads of NDP16
To: Foster Snowhill <forst@pen.gy>, Oliver Neukum <oneukum@suse.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Georgi Valkov <gvalkov@gmail.com>, Simon Horman <horms@kernel.org>,
 netdev@vger.kernel.org, linux-usb@vger.kernel.org
References: <20240907230108.978355-1-forst@pen.gy>
 <mJ-iCj-W_ES_nck94l7PueyUQpXxmgDdxq78OHP889JitvF0zcid_IBg1HhgEDh-YKlYjtmXt-xwqrZRDACrJA==@protonmail.internalid>
 <8510a98e-f950-4349-99bc-9d36febe94d3@suse.com>
 <4be673c9-b06a-4c2d-8b27-a1e91150df94@pen.gy>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <4be673c9-b06a-4c2d-8b27-a1e91150df94@pen.gy>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09.09.24 11:04, Foster Snowhill wrote:
  
> Thus the `ipheth` driver does not aim to be a CDC NCM-compliant
> implementation and, in fact, can't be one because of the points above.
> 
> For a complete spec-compliant CDC NCM implementation, there is already
> the `cdc_ncm` driver. This driver is used for reverse tethering (sharing
> computer's internet connection with an attached phone) on iPhones. This
> patch does not in any way change `cdc_ncm`.
> 
> With all of the above, does your NACK still stand? Thanks!

Hi,

I am sorry for the confusion. May I suggest a reformulation of the
commit message. It reads like this patch is intended for generic CDC-NCM.

I withdraw my objections. They were based on a confusion.

	Regards
		Oliver


