Return-Path: <linux-usb+bounces-9007-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D15789B3D4
	for <lists+linux-usb@lfdr.de>; Sun,  7 Apr 2024 21:32:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C85D11C20E54
	for <lists+linux-usb@lfdr.de>; Sun,  7 Apr 2024 19:32:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 164773D988;
	Sun,  7 Apr 2024 19:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B/zEKiSd"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 047C83D3AC
	for <linux-usb@vger.kernel.org>; Sun,  7 Apr 2024 19:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712518325; cv=none; b=coVl/a4SWdskUIwNWuPopUkf3RfgS4f2yevGMg/8odwoucOI2jWnZulvem6utjp1ig/MiDcASDvToSp5Ot4yXIkZHIRvJKjsVWtz+GHWuVNFS0KlhSjEDUtIn3OxyqOpy/xusl2Iqg9eOJOlkedFp34twQQPks10F6Xrs6VBMkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712518325; c=relaxed/simple;
	bh=54i7tPfHaBIpN+pRMkBLaE8r9/vY3iGtE8mQf/9PNys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KFHOlug7or+p6SxG9Cnv8VyAnXyF4o5uzblCw0S/H4QE+V2iqLQzAymhA7RHStu1TS3xbaBo9ZAMSvGA0XFkwYXV5KXb6w0BSST4oZkq8+vefQ6qalOzcFS0PcLkJeiXIAsFaH9Qwh7JqhQ3rGUqaic2oRsC37Z5/P0VpImcIIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B/zEKiSd; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4166d6dab3dso1931915e9.0
        for <linux-usb@vger.kernel.org>; Sun, 07 Apr 2024 12:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712518322; x=1713123122; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MZrhXovmX2pkJmHm1RyzDo75MIZ4Fr5A/qwgibhsNVk=;
        b=B/zEKiSdlW0HMoyJDn3nRz/mupZQVSt0jKmHz1w51nHOaELfscic0tgcUZgJmcO7Pe
         gFeQgPHD0dmtGJjOaMZi1j+map9zxUeBHNvFScScueOxGk2+seWwynQ1PbdZm197nQWx
         CKxbLstWS9nwzEgZbX7fND+GxCd5siqZ2hWuOJAgQhwBiKBUdwDAN29qDslcnRmB2lVC
         UE0rQ7BJCsbnSxbLeGQLNfAGSzhh4BR68wEC0Emw4VRPZB0y0QV+FJx9OyniV0Ca1qnA
         2wtpPkSIR79WBCeaex1uHyc3uqE2hgye6Vy5HEh9OL6YPqP+NIGkhxEU05RZMtfhY4UO
         zrsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712518322; x=1713123122;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MZrhXovmX2pkJmHm1RyzDo75MIZ4Fr5A/qwgibhsNVk=;
        b=LeEmfDQjqRBKSJO0lcf6o6DQiRklZFWqToQhNrgYxPreD6Ts0J+3RMJ0xZDqKcb0wf
         PR4n3R1B/ranZbEKJNtAB206M+QzX/85UP03LXRoFTTI1tVdNi2odvEpfd1DdBzAdCqJ
         XhZX9bdEqgIMmq0jZ2Fa2SGOZ5MF4fwrF/ssQcwQWJSO/Kcr93Ney4whmg8vBfjjk9Bf
         uxtCLKEF1jeRtO1V3VRAC4mih52r/ohcuKhpbqKX+qbsWdcbH5xNWOM1i0cjKAqRBb2R
         ar/aR8ta9MMk6n9ZTG67w3r4FTRn9Wr6Uftql332itfipp1DtwE1/Unj7QE7RCIXHmzX
         yWRg==
X-Forwarded-Encrypted: i=1; AJvYcCWB8wHO8ScprV0oGEdV9KNIC5En6AmRx2j1C01/EYBKlvgH92D0sGWECZhzdW1aKwm/1rJvkYw2Xn6wsotj4UI4JvHDNyytahXy
X-Gm-Message-State: AOJu0YxShCV6FEechzfnQt6SLrNLR88J9G5DGqgd2H5hqEG+P2537qe4
	yshxpI8jBvCoufWzmAONOZQs2ND0rTQi0xVLb2dsy9F+2pXQE2PVnrrtq7cVM4Y=
X-Google-Smtp-Source: AGHT+IEgW2dJnqjQ0m1gkRuqandK0mxDnrYAKBZAPVDNQkYt5AlfNzoXXsJSZr5MpCXSrYxp7U2j6w==
X-Received: by 2002:a05:600c:1e1c:b0:416:6bd7:cd88 with SMTP id ay28-20020a05600c1e1c00b004166bd7cd88mr595041wmb.8.1712518322330;
        Sun, 07 Apr 2024 12:32:02 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id jg1-20020a05600ca00100b00414688af147sm13990151wmb.20.2024.04.07.12.32.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Apr 2024 12:32:01 -0700 (PDT)
Message-ID: <c9948be1-4700-4aa5-9a63-10dc215fcff7@linaro.org>
Date: Sun, 7 Apr 2024 20:32:00 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: typec: qcom-pmic-typec: split HPD bridge alloc and
 registration
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Caleb Connolly <caleb.connolly@linaro.org>,
 Johan Hovold <johan+linaro@kernel.org>
References: <20240405-qc-pmic-typec-hpd-split-v1-1-363daafb3c36@linaro.org>
 <c1899fae-8669-485a-95bd-0e76738a1187@linaro.org>
 <CAA8EJppBE8xdmc6zQ2VLLPSzmtNq-+03H5skqbnLmLZ8AqSBfw@mail.gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <CAA8EJppBE8xdmc6zQ2VLLPSzmtNq-+03H5skqbnLmLZ8AqSBfw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07/04/2024 16:08, Dmitry Baryshkov wrote:
> Basically, if for some reason (e.g. because the TCPM returns an error
> to one of the start functions) the drm_bridge is destroyed, the DRM
> driver isn't notified about the event. It still keeps the pointer to
> the bridge pointer and can access freed memory afterwards.

Hmm, my concern/question is about the TCPM code triggered by an IRQ 
firing here, racing with the bridge code.

If you're happy you've reasoned about that and it won't happen, then 
apply the ACK with the commit log fixed alone.

---
bod

