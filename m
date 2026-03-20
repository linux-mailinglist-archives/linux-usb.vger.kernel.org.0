Return-Path: <linux-usb+bounces-35247-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CHI2BDccvWnG6QIAu9opvQ
	(envelope-from <linux-usb+bounces-35247-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 11:06:47 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 699A92D8793
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 11:06:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 44E7E3091CBD
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 10:03:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7C17367F23;
	Fri, 20 Mar 2026 10:03:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NBS2DpqK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E22F3563F0
	for <linux-usb@vger.kernel.org>; Fri, 20 Mar 2026 10:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774001027; cv=none; b=Sfy4l9IpRJJseIl/UcFSOgs5iJn7ZEJFHdQbHykAwY1jutfLJXm69RpE6qcqfi0m0eYNuejKAuddMgmzodB7NZU6D/fkt6d43vW9lvFb9CmtJbCRocWuq7O1cbwD2/rVZLXrIK9d6G+YzPovFAj+LJh9kdeGLWA9Ie+Jy6v/LAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774001027; c=relaxed/simple;
	bh=56ptuFV6vKuqQtRYvbY1Sa1x02snZLdIibVK2WtkLD4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tdMW48A4uVhHObQ0cYiFLBl9QWzPPQbIkZa2sif0P5QFjnMhAQWiEFIlBtaNuxF6XAdCxF6WMpE0X4Q+wNstkBiZNR22JWV4dYvQiXsYQcj8lKc2kWqKE+OHMC2rpoqmfI9bqjm+8A82Q0cSrguHh/xIzJ1xiNyVQRk4x67n82Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NBS2DpqK; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48541edecf9so19113455e9.1
        for <linux-usb@vger.kernel.org>; Fri, 20 Mar 2026 03:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774001024; x=1774605824; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8PECkdzxQUdMWnA4pDWLZe22ZFUxdMUPX+0kBZcNa+Q=;
        b=NBS2DpqKvwzvDrt/G6WWQ2lEzIu/q2rwtTeY+WusxH0Q5Yc/U1iW0+chUHILsKfKXw
         t/e0PLsYPq+JxEsRUA6n0Zqce4X3Jjml+T85PkAS+RUL9uqZ4gzm8bseM+DHnB/OD/3F
         eYgAR3VtvgFCWB28xj6euUxfFNyJl4Poe00CWU+NTf+8kIqXU9VNKrEmQTw++eg5f0nI
         h/iY2RhpYyjbIETT7CJJg8ONMC9OVQt+OEjeuxoP7kAY6N83Difz6cFu629BFDEDEoDa
         +iFLRJMNOzr05Bo/cYSah1DIRMU4KthZy23N5fYarUIGzdSCIOaLEeYxYH6ZPoR+EIgR
         fVsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774001024; x=1774605824;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8PECkdzxQUdMWnA4pDWLZe22ZFUxdMUPX+0kBZcNa+Q=;
        b=UQOIYBwNinc+nM7zTO8uJ65k6HDW2R3iaWbfMIyggkUVGaA39zVC/p/AZdKVVnZWaZ
         mF0K89LRjtjm+fzbKemV+7mYlravqk0JKmucdpulRcX8JNOC5xcHWe+2teZad7AKr9HD
         JdJQoxKEnZS+ECvPkDpmeXAhcyNZVDYHqCBb2hFag5CMDTcIGHxhd0b6xCZtIjn54MhD
         DDZsfK2WSxAeQgJPdT+Ed9eL2gLlSa5NExHR5HxxbgTtL1u3kt+1VZjDfqtIDpz9o3Y9
         57lWijpLY5wGCj88HZjB0664h0ZnQ3ZQjRPkXPQ+cVEPjzuyzbNEk+guHstvd78u+a55
         RD1w==
X-Forwarded-Encrypted: i=1; AJvYcCUav6rrS2V4uD1jYs5+8eyBm1Bu2EyFWGHudxetS55t2zxDjAsIw2xujLK5h/4GxbWIYiEUM0+QcoA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6T3V1fh3472oRUxATirdxtIWxhV7BRAB9IknvfN4rEjqDHCX6
	+Iwscr8MLdp8ovL66sfT7bG66qB1Nm5qDpF7C8BfDSbCk9HXsffomdn8KPPsauBBrOs=
X-Gm-Gg: ATEYQzye5DOJlqkYbJCLwjCiiOX8qUfYziH0z7UvvqFRfed3sA4TM+XAdZ6uJLtc9q5
	wrhIKaePFqH0yengnUMo8qb5+Mrw0CT7r9zrlye5ZngE2iMPI9MVFpt9wYbnZdX9eK4ydwoN76p
	egSbmE8SgOP2fc4wVUG8OuGyF/v0RlfHuD0Y0w43Yv7XHcNbHJX1bqdQdfjKJnmYwF9p3Tu+uRz
	+Mz1x975HVSYljvStrDIm+Pd3Jfr43rz3wTc6t8ecg1ce+rkUZ5O6tNlXae5bsR5ueu8E6Ixg8l
	3bv8FgX8SUNeod/jREu5tbbM6j1WCbWrPbwe9vIzAdyf1UQFblzzXocD5YcEsCCh98DjzIxpuID
	FCxURDYm442Atdayd1cxgjlT7X8NXl404NyYDhBvTRa5ggSNLJpyFIsRK5Px3pKU6O/YOHF/CKt
	Z/jFjNr0XhrkI8L7np7mlyHs1JDA5AfyHTv5Ar
X-Received: by 2002:a05:600c:820e:b0:483:7903:c3b1 with SMTP id 5b1f17b1804b1-486fee12c91mr37811065e9.20.1774001023684;
        Fri, 20 Mar 2026 03:03:43 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.207.215])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486ff1db4aesm15557435e9.7.2026.03.20.03.03.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 03:03:42 -0700 (PDT)
Message-ID: <90dc434a-42a7-4719-8006-0b141d281ac7@linaro.org>
Date: Fri, 20 Mar 2026 10:03:41 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: typec: qcom: Add support for per port VBUS
 detection
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Alexander Koskovich <akoskovich@pm.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260312-qcom-typec-shared-vbus-v2-1-99ed9e500947@pm.me>
 <1fd9048c-b0c0-451a-a6f7-e5474352d118@oss.qualcomm.com>
 <pvmxnx7fmcdli5qoanmo62mmoxd2vslh2ujbka4cfmxyo4hxl6@dueec5hukqi5>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <pvmxnx7fmcdli5qoanmo62mmoxd2vslh2ujbka4cfmxyo4hxl6@dueec5hukqi5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35247-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,pm.me:email]
X-Rspamd-Queue-Id: 699A92D8793
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19/03/2026 19:57, Dmitry Baryshkov wrote:
> On Thu, Mar 19, 2026 at 02:26:00PM +0100, Konrad Dybcio wrote:
>> On 3/12/26 7:16 AM, Alexander Koskovich wrote:
>>> This is required for devices (e.g. ASUS ROG Phone 3) where more than
>>> one USB port can act as a sink and both share a single USBIN input on
>>> the PMIC.
>>>
>>> Because the PM8150B uses USBIN to determine VBUS presence, a charger
>>> connected to one port causes the PMIC to falsely detect VBUS on the
>>> other port, preventing it from entering source mode.
>>>
>>> For example, plugging a charger into one port prevents using the other
>>> port for a flash drive.
>>>
>>> Fix this by adding support for the vbus-gpios connector binding so the
>>> driver can use an external GPIO for per-port VBUS presence detection
>>> instead of the shared USBIN register.
>>>
>>> Signed-off-by: Alexander Koskovich <akoskovich@pm.me>
>>> ---
>>> Changes in v2:
>>> - Dropped RFC prefix
>>> - Remove redundant vbus-detect-gpios, instead use existing vbus-gpios from usb-connector (Dmitry)
>>> - Updated cover to better describe scenario where this change is relevant
>>> - Update comment for EN_TRY_SRC to make more sense
>>> - Skip vSafe5V poll too not just vSafe0V
>>> - return gpiod_get_value_cansleep (Konrad)
>>> - regmap_update_bits -> regmap_set_bits (Konrad)
>>> - Get vbus-gpios per connector (Konrad)
>>> - Add bracket to if (IS_ERR(pmic_typec_port->vbus_detect_gpio)) (Bryan)
>>> - Link to v1: https://lore.kernel.org/r/20260308-qcom-typec-shared-vbus-v1-0-7d574b91052a@pm.me
>>> ---
>>>   drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c | 53 +++++++++++++++++++++-
>>>   1 file changed, 52 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
>>> index 8051eaa46991..a8f6687a3522 100644
>>> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
>>> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_port.c
>>> @@ -5,6 +5,7 @@
>>>   
>>>   #include <linux/delay.h>
>>>   #include <linux/err.h>
>>> +#include <linux/gpio/consumer.h>
>>>   #include <linux/interrupt.h>
>>>   #include <linux/kernel.h>
>>>   #include <linux/mod_devicetable.h>
>>> @@ -176,6 +177,8 @@ struct pmic_typec_port {
>>>   	bool				vbus_enabled;
>>>   	struct mutex			vbus_lock;		/* VBUS state serialization */
>>>   
>>> +	struct gpio_desc		*vbus_detect_gpio;
>>
>> I'd like for this to include the word 'secondary', since it's not obvious
>> that if an external GPIO is at play, we have two ports connected in this
>> uhh non-standard fashion
>>
>> perhaps just secondary_vbus_detect_gpio
> 
> In theory it can be used even if we have one port.
> 

That's true.

Its quite common in OTG devices to have VBUS detect GPIOs.

---
bod

