Return-Path: <linux-usb+bounces-15333-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A00398392E
	for <lists+linux-usb@lfdr.de>; Mon, 23 Sep 2024 23:43:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 08EC61F22027
	for <lists+linux-usb@lfdr.de>; Mon, 23 Sep 2024 21:43:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2796F84DF5;
	Mon, 23 Sep 2024 21:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nu9eSSmn"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8E983A09
	for <linux-usb@vger.kernel.org>; Mon, 23 Sep 2024 21:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727127813; cv=none; b=DltQyhzaev12NK09L3IY+e6sjiWkx+d7QqQ4IxmF0H5HU/O5TagDCTkqEROIVeV3SRSLCyNJ7eoRAuOHj/rtlepLSasLMSyQ2SuC92zgePvS7FbjHwfI0At6EAtTRE78jxOmmRaPYg3ZNRhqvFDbkFLYohBLCE2qRA77hDfSemU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727127813; c=relaxed/simple;
	bh=okkRFY8RfzSdIpKjFnMzEfSppfhHZcOGLUhJIfuYOqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=K5kHF15NKlOdt3I/h+4wTr4ZKXHYMkX247Zeu8NfbC0xykkm2uhibtYQerjZ3EYhzzy062ejSDAnYfV1tvkzQoqmRpSkdCsge/BLCwjPwaN9DJ7hedfHV34FHSb581LLXwWYd/zdRjKbcJnJWPeaaDO/x7Ltq/FiV7op0UBubik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nu9eSSmn; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37a33e55d01so3649331f8f.3
        for <linux-usb@vger.kernel.org>; Mon, 23 Sep 2024 14:43:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727127810; x=1727732610; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=okkRFY8RfzSdIpKjFnMzEfSppfhHZcOGLUhJIfuYOqs=;
        b=Nu9eSSmnS03J9cTdte/Vt+/J83E7UOJ5gYvxVfFnX5lvIyi+v2hPVW3rUmi7iQqoAZ
         6dJN2W+UTne+C2ns1P509xvGQc629b515RkKCcJELGG0FtC3/SZ/WFh19B2s8MDWK9JE
         T2kEIu61/Uy+3KSm/79g/SppSU6PKrNz78aXe6lx7pUcqqZ7M/9YSjqjuc9bEnXe98LV
         jawObyJyHoDhanRoLfCOZfSoYuPdVogxFe7qzEmBr3HBXpBAdEd0DLHDWXZLF5zgn1cA
         m2V1yd6Ngne9ttqMr1+bbTNYmANGI5uMs1I68Jri3yNWDFtMVoC+0qoUZr19us1NhDBe
         IxFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727127810; x=1727732610;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=okkRFY8RfzSdIpKjFnMzEfSppfhHZcOGLUhJIfuYOqs=;
        b=X3rSsMld1ncTb+e0JYtJfNKsAeH4psGyUsPef9VrBLeWTHv+Oo0YW4R3uQiPhpl4jh
         qA4NQNOrUd/oTFB96QRrT2FaQPKM8B/rZHy1j3diVNrOoZOee1S/MSgk49GKuFE9lfuD
         ihAYr6ZBjgNK7ng+dkk9p0a/T4zO/Y4AMiaWZSwmHah47tp5J/EfwmZkW1TlEu+MYXeP
         UdMb2lSTNDeLLhuGMlGi+Rk4Vc3Vt3/17Z+J89lGb7FAqe4Bj2XvRTe+yKRBYdnvlIjc
         Z7jfqPpczQK5GbZQeaqMBiBJSBbX1djVkiNxg8NjLE7PLdsooAwdJz9h/bBEk/TvmUNe
         Mmbw==
X-Forwarded-Encrypted: i=1; AJvYcCWdz1ZgOvXzhtpSO9oV2rKhAu9KEzcUpx+4S928wS8ASsaUBXw2NmezV4aZxvaI1/JYwd1i56tBR1I=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGt5VvC9EHEvZ6seNqT3rhBRvoIu6hyOLDPckBQl/aw7sGJhdj
	J5Fe0YGBaD08eOQZQmnEk44ffm/LVbE7Uz4Obme5cZv5ufOI7YfM
X-Google-Smtp-Source: AGHT+IGWjoMFIf2lJ6hWSBvDalhqqpDi6zHDItRIKA6JNO/uteNs99W9Ly9RYy77jaIMqF0rLrLgIA==
X-Received: by 2002:a5d:6a11:0:b0:378:a935:482 with SMTP id ffacd0b85a97d-37a431bee5bmr5536228f8f.58.1727127810124;
        Mon, 23 Sep 2024 14:43:30 -0700 (PDT)
Received: from [192.168.1.190] (71.red-81-33-253.dynamicip.rima-tde.net. [81.33.253.71])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cbc2a8bedsm54563f8f.19.2024.09.23.14.43.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Sep 2024 14:43:29 -0700 (PDT)
Message-ID: <0c51aa7d-a86b-490b-bf7c-0894b43d6652@gmail.com>
Date: Mon, 23 Sep 2024 23:43:29 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: Fix problem with xhci resume from suspend
To: Sergey Shtylyov <s.shtylyov@omp.ru>, Greg KH
 <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 Mathias Nyman <mathias.nyman@intel.com>
References: <20240919184202.22249-1-jose.alberto.reguero@gmail.com>
 <77fbfb75-2b6c-d7e3-f53b-42bea0f544c4@omp.ru>
Content-Language: es-ES
From: Jose Alberto Reguero <jose.alberto.reguero@gmail.com>
In-Reply-To: <77fbfb75-2b6c-d7e3-f53b-42bea0f544c4@omp.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

El 19/09/2024 a las 21:22, Sergey Shtylyov escribió:
> The subject doesn't look well yet, consider s/th like:
>
> usb: host: xhci-pci: fix problem with resuming from suspend
>
> MBR, Sergey

I look at it in the next version.

Thanks for reviewing.

Jose Alberto Reguero


