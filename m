Return-Path: <linux-usb+bounces-9396-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 84DE18A6E81
	for <lists+linux-usb@lfdr.de>; Tue, 16 Apr 2024 16:37:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4180C286643
	for <lists+linux-usb@lfdr.de>; Tue, 16 Apr 2024 14:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D841812FB39;
	Tue, 16 Apr 2024 14:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T2PTdqBM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7DE12F5B4
	for <linux-usb@vger.kernel.org>; Tue, 16 Apr 2024 14:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713278215; cv=none; b=VK/9mRcCtwvm1ury+g8fsB5C9xUPQBNwfYK54L8uokyhAhKNZqKfFKSJQsANgmad30yWhhup4/HA+fpqDP5WVk/Uh6LxLepAc7+mrAG7jCdfAMor5m5ZcoPLKeYKr+D20W3mEMQkFVoe9pYT2n6dYOi2kWsIpH2yDvvy3CsJnx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713278215; c=relaxed/simple;
	bh=ltPhve9DV3rQjCi4jUr/vTyyhzIxc2vfuMkK2VbQK/U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rJq8uGMoJDx2rrjpnW7zhdPbTgwc4ur7ONO2FiZ9+4BvhM2s6Z63O7ExxN4EwtpuA4Be/gpHqPbDz3LXg2HTo4KqNu8CxqodVTW/MXcGZcINb4csHVRNMmSb6k2Oh75rxPJc3jo0VTs1GXQI6AnvNYB8AMeo2MN+LP6g/8RVFxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T2PTdqBM; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2da84f93c99so23896191fa.1
        for <linux-usb@vger.kernel.org>; Tue, 16 Apr 2024 07:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713278212; x=1713883012; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CzxNkkSDo+X3qz7VnDROj1uU4Maa9FIfJRwpKhOpNp4=;
        b=T2PTdqBMKkQasDoV1R/sT8EEYl3TbJ7n0M24jOGI9WZKYWPZP2xctOsjXugpWiigCT
         iu9gDDHi/XllDJ9niY0HBiPPT7h/umVdz7HMnZsfPjoSAMyYyFJLXS4qqxXwuex/VeCW
         /SbPehHxQZGEXu/7JYNXSYNM2YEDtK73zpQhR5KRjmlYYQFICp1XW/KbBblP9aD3mygE
         npl9pjQAyZLPm51bofDdIICek3gNCGLFJ1xNEhseZdt4/RAx9eX+Ta7X8FyNVxmJ/TjM
         aC4cRwRVf5OsmQe1xP2ycHeaNG58DJLfsGLU2MgSSbFHspGRHyL1kr6Ruc9To9RNl3Xm
         bR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713278212; x=1713883012;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CzxNkkSDo+X3qz7VnDROj1uU4Maa9FIfJRwpKhOpNp4=;
        b=MSF6sV2MZN+guTqsCDPxvJImrVTyxsEya9oDVcAV5DTkvZalS9cqAmgGBMfqt4Ubt+
         U9GZIKvoQ6KuB/yATdUCjS9Tp1T8yMF6deaxESKlo1R5Bxa1FyCdZhovXxA0pd3d8GIm
         WJJH2u6fTs3oeM2IJGDgzhhBaCiLfrhYNULwp6+U0QZ6QRaMqrwemIn01EsteJq+bFHM
         ++WXHiVdqLD41e+xuFb+7cprFuFMHQTBE+XbuB2h14siyietEMqcw0NqOX8QVZy9P+Og
         vPgUzU5lszDmkjumKOxp9WqWiI8RqpqFNzNd6RhukBEkwUAyyjwdsrpjoLHW+3RnhNEy
         sAhg==
X-Gm-Message-State: AOJu0Yyi/pev8XAA9ObSX7THzFiB9zG9xqJDAkpxZcsO+Lt90jnwirND
	M4N32XReQ33unM0m/RAXZaSQO9nSXC3BpSxWmZlfPwtSmv2rRCE235zbiDyKGLYUrxVVBC8R3ZB
	MFg0=
X-Google-Smtp-Source: AGHT+IEV8OOpIqaDgfXAYxwo5mdAH7Yt8IjgQoRSwEn7+byhG6+Hm46ZjAWVB/Tf99onqLXDOM2bTw==
X-Received: by 2002:a2e:b98a:0:b0:2d8:7320:e36a with SMTP id p10-20020a2eb98a000000b002d87320e36amr8720600ljp.17.1713278212060;
        Tue, 16 Apr 2024 07:36:52 -0700 (PDT)
Received: from [172.30.205.49] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id b11-20020a2e848b000000b002da6fb7ce36sm696853ljh.135.2024.04.16.07.36.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Apr 2024 07:36:51 -0700 (PDT)
Message-ID: <80a8b7d4-2dd6-42a9-8305-81a93ba5e6bc@linaro.org>
Date: Tue, 16 Apr 2024 16:36:50 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] usb: typec: ucsi: glink: simplify notification
 handling
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240416-ucsi-glink-altmode-v1-0-890db00877ac@linaro.org>
 <20240416-ucsi-glink-altmode-v1-5-890db00877ac@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240416-ucsi-glink-altmode-v1-5-890db00877ac@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/16/24 04:20, Dmitry Baryshkov wrote:
> All platforms except Qualcomm SC8180X pass CCI in the notification
> message. Use it instead of going back and forth over RPMSG
> interface to read CCI.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Are we sure it's reeeeallly just 8180?

Konrad

