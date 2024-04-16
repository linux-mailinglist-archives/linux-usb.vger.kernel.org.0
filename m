Return-Path: <linux-usb+bounces-9394-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 051338A6E68
	for <lists+linux-usb@lfdr.de>; Tue, 16 Apr 2024 16:35:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B4F6A2842FD
	for <lists+linux-usb@lfdr.de>; Tue, 16 Apr 2024 14:35:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2E3F1311A1;
	Tue, 16 Apr 2024 14:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="czGt5a0D"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3A8130E4E
	for <linux-usb@vger.kernel.org>; Tue, 16 Apr 2024 14:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713278027; cv=none; b=XsyndZWMEKQbAz23oQqJzNBLm/dQkl5MTcjoMmpNvaebkY4z9B345uUlpbSg1lei3DmCnmBbx1X3qXUQrOIBUdrLP/36jMk1QZnuO/fq9GtN5K/0yp7Ce8nRFWXFJ5q5/2NOhx062Z5tjUfS8zpl9Dbkhj3SSwjuzjTB2SpNxpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713278027; c=relaxed/simple;
	bh=FUyv0NtfjWgQR6OUBvhEgz4KRfytTZXEfryXpJkG4jE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tn3m7ROQyGeJv3wUy+FeJiCBye4xZ0Y6Bb1HUFDw2agnE/dM/D+JOR5O4gnuo2NkImCtJBrvXYvg9xDFMCuM1wD5qeFUM7Kf7uIUjXwrG3LCpx3mVr4sPFySO32kkvdbBg8Wdi8uyR2LPwUvYONSu2kp6trsLacM7iyaCtDHv8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=czGt5a0D; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2da888330b2so44414301fa.2
        for <linux-usb@vger.kernel.org>; Tue, 16 Apr 2024 07:33:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713278022; x=1713882822; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c+9nPjOVu5Pf5mma6CPtxz0axFmvz1ttoYWLOCI1v/I=;
        b=czGt5a0DwOl83Zbn4NKU/IK2/IP39vVqczik2HdZk+PlEyvSEExDWz97SJjJ0h7xXo
         itw1nuMB3k7MBqMmS69mQpE9lYDeR3Q06+asvmMCBSbYPvhiVghLpF6BVqfQF2Ej6Zrh
         rKnU/qUerTtTXuG85fR2K8nBuKYnCwma4X3hT2eQfraDSqafwE95oJoblIkuhYWOAtKD
         eZrw0eA/vNnGg6VayM+SQkPUOm7a6ouqNGbVQ1oGxMr0VPMMGIA8/rxXbmi0SfYGSObv
         5d53k1dfkVNbmueO8vtfXI97J3TYiHIb4PLKPQw54jxvIcduRkUv4E4naeCtWVZPc5Mu
         XzPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713278022; x=1713882822;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c+9nPjOVu5Pf5mma6CPtxz0axFmvz1ttoYWLOCI1v/I=;
        b=QMXILFNS+sNMRRVhkL9ZJUDoLGaon1jr1PWWLaQUTvBWGVsMdvkZNnznarxWnyRvlF
         t72/fpEUpQonhEaBUiKM8kUTt4W/11w00E9sAgLD7NazH30U0U5RUjMCOa0tfMc+dvCD
         +mFHMTZ4XKDyL6ttInmIjBAMmT8p1r3ISz0RLgaxPHSmluUI8qsUQZRElgYkG3HYsXM3
         VTIcQ2XrVgJEoH8YAgFn4Ph28t3FDtnR1Hq3aj5MnZ0p59Qf12vZWLNIo1gllVhWNua3
         Fa40kedKWtkT3O26GzsE+dKcCtUUBNhd4pKYaVmS7RWJBp3jmEWfpOgaoISUvpeGT/9p
         rGKA==
X-Gm-Message-State: AOJu0YwI6odGYx+9v4qTQn4oUNHGC1aDtmLIHK2sC7f5aO/Sz7bb783W
	vohZlWiFQsDdNq8xv1hxsEj9eardYHlKx3rJU7fCiFLFA2bnz9/ZuvDaVTolEDU=
X-Google-Smtp-Source: AGHT+IGL+ME3YooCYObcuCO1LfAPA5J4bnpf8IzOPa6orBn1PpHGOydAs/es6+R5/yPtPUtVbGF1LQ==
X-Received: by 2002:a2e:908c:0:b0:2d4:5370:5e8a with SMTP id l12-20020a2e908c000000b002d453705e8amr10336108ljg.22.1713278022601;
        Tue, 16 Apr 2024 07:33:42 -0700 (PDT)
Received: from [172.30.205.49] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id y1-20020a2e95c1000000b002d2d1c11703sm1587994ljh.76.2024.04.16.07.33.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Apr 2024 07:33:42 -0700 (PDT)
Message-ID: <1545d3fb-88f3-44e7-b981-610df6bdf6f7@linaro.org>
Date: Tue, 16 Apr 2024 16:33:40 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] usb: typec: ucsi: glink: check message data sizes
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240416-ucsi-glink-altmode-v1-0-890db00877ac@linaro.org>
 <20240416-ucsi-glink-altmode-v1-3-890db00877ac@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240416-ucsi-glink-altmode-v1-3-890db00877ac@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/16/24 04:20, Dmitry Baryshkov wrote:
> The driver gets data from the DSP firmware. Sanitize data size before
> reading corresponding message structures.
> 
> Fixes: 62b5412b1f4a ("usb: typec: ucsi: add PMIC Glink UCSI driver")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

I think more backstory would be beneficial here.. Does this happen often?
What are the consequences? What are the causes? Can there be one-off invalid
messages, or does that mean the firwmare has entered some unstable state?

And I suppose, if answer to the last question is "unstable state", are we
doing something incorrectly in Linux that causes it to happen?

Konrad

