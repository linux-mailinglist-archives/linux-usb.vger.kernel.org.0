Return-Path: <linux-usb+bounces-9395-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ADBB8A6E71
	for <lists+linux-usb@lfdr.de>; Tue, 16 Apr 2024 16:36:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CF90E1F233C8
	for <lists+linux-usb@lfdr.de>; Tue, 16 Apr 2024 14:36:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA5017BAF9;
	Tue, 16 Apr 2024 14:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Aj1AmpYE"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 626AF12CD91
	for <linux-usb@vger.kernel.org>; Tue, 16 Apr 2024 14:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713278098; cv=none; b=X8TidFj89y/Gk8qCAjzUNaAm3TGkkTRPFk60+CqHO4P7Bat1wFxM3GKpym6bmfayhJKtwvP68TJ3MQw1AMOn7y/hWC5RdVp/te8LrinTBUuiTf9QTMX3xgEiHl7mYRNK7l/L5qQX4Zcqr+BXoQNdkb6Y/2HveCvw/ztXRfbiZOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713278098; c=relaxed/simple;
	bh=9gWEqpeQ44KAT26aG8dQwX9JQ/Rx+NiPE+QCZt7ZX80=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dRFAO0gl/mpg6vm8eG+wEnK7aefanS7Q9Jrbu6KcunqUkuHg8d0AJDRVz8K7YHvAHmnUiWCFYq3+neMMr+bL2JiB+vaFd2zwSx6mFmp/RgrD0D0COCLYpvwXm6gYRoFbeVn1bjFgwsFLflbzQf8fNIgccdJjMdNkULb9A1ZSu6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Aj1AmpYE; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2d6ff0422a2so55666351fa.2
        for <linux-usb@vger.kernel.org>; Tue, 16 Apr 2024 07:34:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713278093; x=1713882893; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UsftWv75jPp8q+uPwfqAdrYpSmyrP3n9PngY1U3XH1s=;
        b=Aj1AmpYErLKiIiVuMej+Ahfwd0EQnGloXGdLTPx9s5aDFZnL6zPuVXuf5gqG/U30yZ
         InctDQSJCGLYsOiimH0jtJfFNvxrR8EtVT8TvVh7OV9572RFoK6LHUXKYsknRNaUKEeP
         7lqFSit+aBIC7qfQTgpCoYiDQDkBF0WOk6A/gpJ+d8mKn94l5/5eR3Ydvq0WFUyTKcLn
         NogyJZ3FMl7tGIEemvzUHi75qEWIb3yQjAB13P1mmUDyq4UytjL3RNBzvGjXk5Svpa5R
         r/mzF1f3XqY4jqWTsMnCF+gFPCmgKrPSqT0Ob1krIxWkxWdkF9Mii4NWwylFyrEIXC1A
         mpsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713278093; x=1713882893;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UsftWv75jPp8q+uPwfqAdrYpSmyrP3n9PngY1U3XH1s=;
        b=L8aMYWIODlC+oYthUut9eEWWvXa8TPjDp9o5eIQTvBefuYVsnW+KdsJXdHm1EbLwKx
         ey0wvrx3vJHiO9T8dZTOTo5L7ub3ZtkNaCZIcUVqSHNfhPAJ+plOJcXWPL2EHa27jZ+y
         M6ffwfmaqbaHvzJE5832dTGGKCYYFIDnzxhEaY+pGawqoAl2srVSQrZV1YMQwURnEciV
         0MICFfo+bumTkobNq7100WverY0vYRzSLEAAMhW+1ppUHZkFiQrxFj3VOJU9p/2RCz01
         ZBiZNluqdGiF6fIeTqYX3r4HdHZ8NxfS2X4XDZljxiROdiNCZxCCvynr9sEXVisfKD3M
         u/ow==
X-Gm-Message-State: AOJu0Yz5DRSMpH/MrbJz56STNRTOSPiU5DYsM1A69CKFP1acc1SSV0li
	BU1MxYWOAyMTA8S7l4jf/Z3AEWc70U0321fJCOxXbfRaFTb5WffpDEQ2XdBNaAo=
X-Google-Smtp-Source: AGHT+IFchFdCnQlrtXB4f/SFQaCb1JAvuZa4jE2HDMoyWfZXlpIWyk3eg9eZ4xr4mPAhjC7hOBDeTA==
X-Received: by 2002:a2e:9b49:0:b0:2d8:df61:9c6c with SMTP id o9-20020a2e9b49000000b002d8df619c6cmr8444196ljj.20.1713278093557;
        Tue, 16 Apr 2024 07:34:53 -0700 (PDT)
Received: from [172.30.205.49] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id u12-20020a2e2e0c000000b002d9f87402e3sm1426372lju.51.2024.04.16.07.34.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Apr 2024 07:34:53 -0700 (PDT)
Message-ID: <b26d5942-6085-445a-bf17-068f1fbcfe71@linaro.org>
Date: Tue, 16 Apr 2024 16:34:52 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] usb: typec: ucsi: glink: use le32 for message data
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20240416-ucsi-glink-altmode-v1-0-890db00877ac@linaro.org>
 <20240416-ucsi-glink-altmode-v1-4-890db00877ac@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240416-ucsi-glink-altmode-v1-4-890db00877ac@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/16/24 04:20, Dmitry Baryshkov wrote:
> The message structures as transferred by the PMIC_GLINK use le32 for
> data encoding. Correct struct accessors to follow the lead of the main
> pmic_glink.c driver.
> 
> Fixes: 62b5412b1f4a ("usb: typec: ucsi: add PMIC Glink UCSI driver")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

There are a couple of if (resp->ret_code) occurences, but zero is zero
no matter the bit order, so that works out

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

