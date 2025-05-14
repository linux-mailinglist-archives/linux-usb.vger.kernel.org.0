Return-Path: <linux-usb+bounces-23949-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3C4AB6AE4
	for <lists+linux-usb@lfdr.de>; Wed, 14 May 2025 14:03:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 428444C110E
	for <lists+linux-usb@lfdr.de>; Wed, 14 May 2025 12:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAC9827602A;
	Wed, 14 May 2025 12:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RadBnhL2"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3C2221D94
	for <linux-usb@vger.kernel.org>; Wed, 14 May 2025 12:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747224187; cv=none; b=BslKzYE8K9ntBpRlbhpTgfqxdKPhT1oj8eeA7+JoysG+zTR41CF2UxQEuK7D75xd464vMEHCgMF7RvhKFOCKVwpezBSEqsP3/WxpYNZnVquv4m3NteXpw27sOQwJeyu6nhq+nStjEPqdzGbrha6XKmm6aE1LGl2VzDpChtpwQOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747224187; c=relaxed/simple;
	bh=/e8//jJKlmMJhf7HEe8UWUZ4y+Z1knUyOL/nhb2jnn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UT3XuCvg8UiGawMibtAbakcix18Eb+/65p1HG6NgnjRJShS+qOgLhZ/5KnmE5qWQE7RlWdTlH9h6/7hRiPpbDuFTKDsMUyrf5hRKEAJ07U4yx56saK5Z7a3pqLQHxJ4dr5GuvUUbgCCSmsaG3SLGHbxsoXyCXQyQTsI230bCdCo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RadBnhL2; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a206845eadso2314385f8f.3
        for <linux-usb@vger.kernel.org>; Wed, 14 May 2025 05:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1747224184; x=1747828984; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hJGh2mXF0bVKVAybwQr/GYWPBqGm+3NY+8wJULgeKPE=;
        b=RadBnhL2WnNmApiYwGsce552ojTkAbUn/N6z04ianTlZ2E8gHDfyqJJpj1iSCNUDlm
         OsH7xtM70WU+NZc7cwh55dlRMW/bVD1vWN0+OH8RU1k9gWJ+zXuxQMC3nNftZ3jfbgUj
         B7aaUAjr7SfFiXna0+SLcMooXUI7az8Xx1qCVVTU9ze/0h383mMNbdUz5J1BtF4vCdTj
         POamBA7Xg8EmcXv2CFigT8H45m751RC4vcBCAWjG1gTsdx+t1R3zNlr3E/DwI7gZLK1Z
         4IJKAa7nhl2h9w/lJW8TuFBbq1gzxPlvQEx625JFGs63TZoY7vP9tV1ldvX4S1t4RU6K
         8cLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747224184; x=1747828984;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hJGh2mXF0bVKVAybwQr/GYWPBqGm+3NY+8wJULgeKPE=;
        b=hjClAg0sKNeZfelkVVLXJghrB6P+V13DaI8Q2iPObRiS84aMRmc/aFGJiaQq4x2dEB
         yYeJjfNS/QpefiFfUB9Rz4VA8uQ+uHgZlc5unN6veA4HI/Vca37HA9O8FAPIZDu4a9c4
         iFDjHeO8+eOi4fP9D2YWlzfWSNx6vm1Snz8NC3ffjqpgMRh1Cd1sCkMBgXJh9TgXizqz
         BAbcYnZUwUkD25hKGU0lH5ndaoB8O+wN7dCjRTxJ7i5cP8JnGnKbTNypH52dOf3TLmBw
         O3EmNcvwKDftCmp63bv/4PTVek4suvfvSgsDN2s7VHGTMzE5ycMEVuDLIgbfzAYzRddX
         389A==
X-Forwarded-Encrypted: i=1; AJvYcCXwxE0cNxrNzwJdA++yEIxzgXIEA5NMJQD/kC7ouKSSoz1DSQLu0VOySogS91LJ9OpVIjD4dPmwO6Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyK6B/UYOdFNnrKxvBFclS3EOhhuAzXvCEAytB5HWKKpo65d+d
	rRMFy1LZVUVdn8he+oQ7Hwo8sZP7UgFNYKQE+ieh+Ukp9T6hDNUYw6LH8GRFr1s=
X-Gm-Gg: ASbGncvSmGaAlQkz0WDcqJY84sitg9szxyfQqbHGJdxk85RYwwIBwPHRozs68PiwACc
	peKN9CaWchuAPddag0tZLgfKkoEvg21YERAPTDSGGZp5y/3gZKCcBGwYs5N70r++qa0UTUAoyXf
	PnbBEa+4D5c73xiF25PdDDjs/gEQmhIMDYeE0ziwvQfHqSwtxDakKx3PnMtrkpccWsTCfFH2EJW
	zXET/WUQgcwXzHYPW0gLvvwpX7kmwhOAsUyrwFj0SiDu6j10JSPixrszHy4A79ezdmhev04SPz+
	pczT9zjZOpM/RzBZcwKbUxAvnHL353sEWJQmZGu8oJVCW229JB2br2xOaIrN2ZY+0DXigm4RaEW
	Qygd3C5eT3Ci8rqGfAQ==
X-Google-Smtp-Source: AGHT+IGKQtN51SEzKvrvqBsrqzHJrZTVdAS+jHalaaHKYdeZQjK3ee32ZN36I3wBOBBB+9FoxsnP/g==
X-Received: by 2002:a05:6000:2a8:b0:3a2:3c51:f4a1 with SMTP id ffacd0b85a97d-3a34969ad98mr2532288f8f.7.1747224183605;
        Wed, 14 May 2025 05:03:03 -0700 (PDT)
Received: from ?IPV6:2001:a61:133d:b101:9ea2:16fa:3380:8e40? ([2001:a61:133d:b101:9ea2:16fa:3380:8e40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58ec8f1sm19200761f8f.26.2025.05.14.05.03.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 May 2025 05:03:03 -0700 (PDT)
Message-ID: <7419cfbc-1269-46fc-95b9-502e6fe23226@suse.com>
Date: Wed, 14 May 2025 14:03:02 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] USB: core: add a memory pool to urb for
 host-controller private data
To: David Wang <00107082@163.com>, Oliver Neukum <oneukum@suse.com>
Cc: mathias.nyman@intel.com, gregkh@linuxfoundation.org,
 stern@rowland.harvard.edu, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250512150724.4560-1-00107082@163.com>
 <20250513113817.11962-1-00107082@163.com>
 <51fe78fb-5d73-458f-b3d1-fc84cd6c5869@suse.com>
 <484fe5f7.9d28.196cea2c6db.Coremail.00107082@163.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <484fe5f7.9d28.196cea2c6db.Coremail.00107082@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 14.05.25 13:51, David Wang wrote:
  
> I am not quite sure about the concern here, do you mean somebody create a urb,
> and then usb_init_urb() here, and never use urb_destroy to release it?

Yes.

> 
> That would cause memory leak if urb_destroy is not called......But is this really possible?.

I think a few drivers under drivers/media do so.

	Regards
		Oliver


