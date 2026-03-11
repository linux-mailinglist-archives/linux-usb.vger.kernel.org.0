Return-Path: <linux-usb+bounces-34620-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sJRlMh/0sWl7HQAAu9opvQ
	(envelope-from <linux-usb+bounces-34620-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 00:00:47 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 6571026B075
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 00:00:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 4FDA4306464A
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 23:00:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA88539DBC4;
	Wed, 11 Mar 2026 23:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OL9MztPI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A3039BFFE
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 23:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773270009; cv=none; b=Tm6IRRrfxT2En1ObjWZA7Tv6XRYX2n5vkV+DjtnmLqu1mltP7Vki7t0blugJvZTlDZvZdmt/rNiOqeZ6Lt0nTybnhvZ6+alL/2kSQGLMmQiw7vSgBK0bLHbKRw/l9bnvj/GRDPcynIL3tMcSsFW569T8r9RohRTbTZ5gi8+3LVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773270009; c=relaxed/simple;
	bh=s5AopRXpE8NhdcWEB4P5k4k323BPvt9P2y6xxrqlwUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lJ7xtU8Jov5Klev3z0nxiMovwwBKf5SNro/lTGgeLc8U0MFvflgL/MNkCne34hx+qL08g42+brvPyF1aF/Ro6VSynoK4MpfLc5MNTEDDDgoRnHOijsKrdVkJ8DgM7gIe/YQjLW8OBFmavFZAxuTSSKOjZtr4Gs/UzjsgmlZW4uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OL9MztPI; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4853e1ce427so3846555e9.3
        for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 16:00:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773270007; x=1773874807; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IUwcwJen0TL6VZ/9cqC89GRV2b+O9DeXb1am5MEKIGs=;
        b=OL9MztPI27Lbb2PCyEGbBSGc4gbQMIxPbD6gx7YFZkf8HS569sTIK0UpuebVS1R8gv
         XspKYykMp1P7oexRwBGyZzlxYPdD5kmEIEYgiCrGq9oeB/zI7v17FVczfSy+BN0fFe4n
         F3qnKlYEcTM2+cDh+WcUs3piNLikucUIAQLbjwO2HE7TdDgWI9wFWH/aNCXkM2lRjrTE
         ux4o9aiVptYlDQP2tTxtteHM8lNqrbJgWoHr8ga4ZXm/f0tI1qfD2h36AgrnljhB1qGm
         OG5T1qUbWOogWhrAqvxnELI0j7q6dhstbX27NqWigQiUDIwqNAGlcVuht196yyCfpfr+
         UC+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773270007; x=1773874807;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IUwcwJen0TL6VZ/9cqC89GRV2b+O9DeXb1am5MEKIGs=;
        b=SXy/Aq83QP7Bkt4VSOMIKO2jGjXpiVUzGA4h/CYTKPzo1TwPQziEGvD6zmrJaJATpF
         fwGINpflgGTBKPsuDuqjROa8NjOMXo1xNltfaebiHALvOB1ulUwuwhV/ekcGndZdSgD4
         vOQziDVYdqWGOmQ+lcTPoyVWBSLfY23VXk6eYQ2BljjdPhUKOptDHxWvrXE9Dte3c3V3
         7Kq/nD6zPpb1uZKKhoYAuKLW7rnPSE2PtlUlVCXdZopH0TjeWCMBObCuyn51/3BoCXOY
         zawb8QYfgA6uoc+sxBMq/h22mqYkXbM2Mvh0B7pZOGORGEKWhXzlYAZ+NFYlSnX7DjDA
         5lJQ==
X-Forwarded-Encrypted: i=1; AJvYcCVthhBdIqqGoGD0a1ypHbB45Ww9CY5hgh3qOBNIpc4ob+Sped7tU3fc8DZN9fZG32WvCSjy86oaiSI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOOXbnaFHC4n6+BMIKc0ivra4WCHu8eBAb5vFtmjlUyJ6QZKY5
	JAZf5JRxcZn29cruwWzM42UE74OitMH4loEXwkd0twUFVgfdTmkz9SdQMpiwTyx3CoY=
X-Gm-Gg: ATEYQzzMQD+MGEk0TrcTFQr9ghsf3BD1vXa/VuCnG0kGUl1Um5KdcEjz2gTtwAatSvx
	emHXu+Rpx5vyIi0OO9YrqOT1k2elhPVfVx8DcVDQzTXmdDWQTJkw+kKWzv7XxhLMDntGZE3sWFK
	zmCMCQosFP2pNS1nH28NMQOGGq1LQY43pW8gH9KHKsMw8ka6Q0md+MJShu2BpywMIHEjIg0u2LC
	f+5vhVTStwYyE9411cgelLGTEhmqHIPbddfw7FhI8U5LKqtdcJ08uFZfs/ETyoX9Tp+QeFn2Wdo
	N/76VwvsGpJyNJzFX+5xRndniR5z/Ffvyr0LHSPE6wd2cNE4djVmzBOuxrD/QvopJD85zoCzDTH
	8ztOX341fnb+8M8yYxuO4YUHODjdxUTUzhL9OO/YGJjzQ2adkOj7+bmGSCFCk3bG0KGwbS00MPz
	n8444S1Aq32rDvIUXEqT3nlzOjKf+LqhnfQQ==
X-Received: by 2002:a05:600c:6305:b0:483:703e:4ad9 with SMTP id 5b1f17b1804b1-4854b100b22mr79689175e9.19.1773270006630;
        Wed, 11 Mar 2026 16:00:06 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.88.70])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe20c473sm2699459f8f.24.2026.03.11.16.00.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 16:00:05 -0700 (PDT)
Message-ID: <89771dba-ffea-4f56-8bec-df54eed441bc@linaro.org>
Date: Wed, 11 Mar 2026 23:00:04 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 0/2] usb: typec: qcom: Add shared USBIN VBUS detection
 via GPIO
To: Alexander Koskovich <akoskovich@pm.me>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260308-qcom-typec-shared-vbus-v1-0-7d574b91052a@pm.me>
 <920ae606-3d7d-4f61-9d11-bd970abc5177@linaro.org>
 <v4m49h-DK1i8hRbJZVhc1GwDH7oBTRgeXg0hIE8chXTULQuFFfSibjXs19m5E4srNt4852h-x_YcxMoPaUjzPqmwYHI8-tRc2-X2DaIKI-A=@pm.me>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <v4m49h-DK1i8hRbJZVhc1GwDH7oBTRgeXg0hIE8chXTULQuFFfSibjXs19m5E4srNt4852h-x_YcxMoPaUjzPqmwYHI8-tRc2-X2DaIKI-A=@pm.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34620-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: 6571026B075
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 11/03/2026 17:37, Alexander Koskovich wrote:
> For the bottom port there's an independent boost converter

Ahh..

OK for some reason I read your mail and thought that the PM8150b was 
sourcing VBUS for both ports, after realising you had a RT1715 aka 
reading your cover letter again.

So much for my research on how to make that esoteric setup work.

---
bod

