Return-Path: <linux-usb+bounces-7575-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 49C24872925
	for <lists+linux-usb@lfdr.de>; Tue,  5 Mar 2024 22:09:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B93D1C22FCC
	for <lists+linux-usb@lfdr.de>; Tue,  5 Mar 2024 21:09:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F12AA12BE83;
	Tue,  5 Mar 2024 21:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zV7ArLKA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAC07129A99
	for <linux-usb@vger.kernel.org>; Tue,  5 Mar 2024 21:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709672963; cv=none; b=iECQiw9p1V3/jOdcTj3KgD2miEGxgGUJcwj/zkBnNd5UrqKdu/oQEusciCpx76vFBfnuU67uw82ons/x5Aj2O1bjWYy9ZezwS4CcE5z1yK9XLtRuBcVyjMBQy7qbJ/rJvaXQc0ZWCPq2dXBdTGVB00iRen14t+I7wc9sIZrTepI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709672963; c=relaxed/simple;
	bh=jJZTR3ZQLE6TxtB1On0qTLLClIpP1eKZkTdZYogVliU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=SNTJHwvfcCWZqVKxiGxEvSKDXW4RW5SKAqHx1RV9u0QV65hN6a1NTKwqyYLqACNGU3M04/ZyLjRIMUhKNvNokuGGynKh58WBoGyy4nwV8WdKVRW4ZQ+epbrkhDPcP05K4obrKq2vZLG2UZ/Li3FW4aMaTYmPJb00x/Rw9ZHhWfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zV7ArLKA; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5133d276cbaso5272469e87.2
        for <linux-usb@vger.kernel.org>; Tue, 05 Mar 2024 13:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1709672960; x=1710277760; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jJZTR3ZQLE6TxtB1On0qTLLClIpP1eKZkTdZYogVliU=;
        b=zV7ArLKAoCh5MB0KLgHepIpJFsdn8mIHnoOQ40I7AzejVd4ym49pD9XQ7Fc3mHqGOS
         +1wzK+OqvCGQiioY4RvV9Je5IZkKD2dxV6F+8RPKrE/PiEX4fad5OZ/OBAaL0KW6e/Ob
         o5xXo4lRrdNc5vEvXYK/242jcqiM3A3C6pK/mItwibqcy/L1OcCgtLU/pBUKiXKLGxdB
         KMqoE7Mwo+Gl2mvKuVz1J2no/McpmM+Y70BvqBtJnjfOKgFCOSJaQfybA7XbZyT8PdFD
         /xy0/3/6C9H7NzVReln8j//BTeNXjfp32pXRsetvZ+9Sfz+9AN/SWfLwvTJqe8yeTi0a
         3Kdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709672960; x=1710277760;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jJZTR3ZQLE6TxtB1On0qTLLClIpP1eKZkTdZYogVliU=;
        b=SvHrHLjASpgZ2yce3qp4+2+TNmPrM9Ke0398VKkRhnL/NAc1VB03zrG3bA2Rr+GZi9
         x8ij7tJd7QO4zID3L9T+oNA6ocecfGmVsR/1qCEyULe2EWS8KRqc6PxXLMFPD3KU+fAA
         qhsBQJ/by/08/+CIPlGLyWC4whwmKa/TM5zMW5AnlGQYs8YHWdilGNGv4OYxCRA4rhSR
         qSiXclwYGReGPph0IEw6FrZJsAcNqdbH2vnXlrrmC3XO3Svpnln4gdGK5sF8BJmKyqiw
         LFx22Nd+zswNdhZHzo6bpK5Jm2UwSuMMtVMsQtsAeABuZ0dulHKH5d1FKK3AhO7DKSjh
         iwhA==
X-Forwarded-Encrypted: i=1; AJvYcCWj3menl2e6DeyrikhZ2b1X2y4JSLKZgAmLSR4L6bnH2Eww6/61LKDoUqNxCHErJ0xTNcCYbAwqvL/3EchbtN9qGgfaQRzymFah
X-Gm-Message-State: AOJu0YyGmW/nkXkDvopDVS8Mx2e+4iXGOg9yQz7LTt0CZ/go+WG6ReI8
	fJb48lGfSrX1P5VqnalECt7n7FlzDVW4grhopUlRopQ5qeya612tnAZTDfXKroc=
X-Google-Smtp-Source: AGHT+IE8CGigUxA1HCYfZiHbYBgeAldb7dQWGONv4ACnT65GTfW31N+bM8GawaFuCe4uzmmOQ4YDwg==
X-Received: by 2002:a19:f803:0:b0:513:3fa4:3f22 with SMTP id a3-20020a19f803000000b005133fa43f22mr2145235lff.35.1709672959846;
        Tue, 05 Mar 2024 13:09:19 -0800 (PST)
Received: from [172.30.204.154] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id g13-20020ac24d8d000000b0051316ccc5besm2300433lfe.269.2024.03.05.13.09.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 Mar 2024 13:09:19 -0800 (PST)
Message-ID: <1697b03c-56ab-4e8b-a268-f9ceeed91c31@linaro.org>
Date: Tue, 5 Mar 2024 22:09:18 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/3] Enable firmware-managed USB resources on Qcom targets
Content-Language: en-US
To: Sriram Dash <quic_sriramd@quicinc.com>, andersson@kernel.org,
 vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 gregkh@linuxfoundation.org, quic_wcheng@quicinc.com,
 Thinh.Nguyen@synopsys.com, p.zabel@pengutronix.de,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, quic_psodagud@quicinc.com,
 quic_nkela@quicinc.com, manivannan.sadhasivam@linaro.org,
 ulf.hansson@linaro.org, sudeep.holla@arm.com, quic_shazhuss@quicinc.com
References: <1709657858-8563-1-git-send-email-quic_sriramd@quicinc.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <1709657858-8563-1-git-send-email-quic_sriramd@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 3/5/24 17:57, Sriram Dash wrote:
> Some target systems allow multiple resources to be managed by firmware.
> On these targets, tasks related to clocks, regulators, resets, and
> interconnects can be delegated to the firmware, while the remaining
> responsibilities are handled by Linux.

Aside from the comments you already got from others, please change
[RFC m/n] to [PATCH RFC m/n] so that your series isn't filtered out
out maintainers' inboxes due to the missing PATCH keyword..

Konrad

