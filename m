Return-Path: <linux-usb+bounces-37643-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GC2DD5+OC2p1IwUAu9opvQ
	(envelope-from <linux-usb+bounces-37643-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 00:11:43 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E7C574555
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 00:11:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 10E9C300D46E
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 22:07:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23B743A2E36;
	Mon, 18 May 2026 22:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xhczwa/K"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D1D39B4AD
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 22:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779142055; cv=none; b=NWQ6w8piKDBEOQsB0Q4Hunmh8dlH0mGIdMg7mssRmhRVmIpAJhIcvrSkLifGDijaP8DW7oRaMAzTFDud8oyXJqC84Qc5LQu9mmDly+EqSXW7X5D+S2BM90NxHsYRqOqIuy2BS7XHJ6teKoNsPYk25mlbsfZr6MHrNLURYUmQUxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779142055; c=relaxed/simple;
	bh=BB1Y6UYNt+5fsI+CPTJ1sVHNClySS/lhkvDIVefPULg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ilp8yttEMt8eXE4XGFD44eZhqeOs73FulH3LYMrwnTfAZrL2LZbg7XKEmVnRsttPsj9N1Jf+jbz8ssIBYdfDR8llSW8pMh+Z9QwxMnromO5d/BFuIe2BYMFpP9FTYvVIs/D36vuWF/3mgXBHF2VoXQQGLwVTNZCujp85savCPpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xhczwa/K; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4891e5b9c1fso23490485e9.2
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 15:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779142052; x=1779746852; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sGR8lYC7RwoehcYqlTGMusvCrV6UmoJY2p/GFIP4wIE=;
        b=xhczwa/KBcv5kBpNw7gFMObagcrY8MkXyYLJqUb1ILcYZ7VZGJXPP8iLWqnAdpGRv2
         uRyubucV3vQAvYP5Z615H7ZTFS8EnNDsZAvNJMfOu0TQfZfkmRZZZogi5J1HpaDzRL8Q
         IGMC8Uh/kF5WKRfg7eccVKsOvxC1N2cQF5gDuwX7FUh8Tg2EBiPo6faO4L6Vx7hM5reC
         dLNrnaARNnHzmVIg+d0D7N+arK6NrDYGtyyeYKQkRnFaLs2ibUxo5vN3SPohnIB5zuFr
         qSAlb3nSTADqaqM+G+/Y+ifPhTGZB8bwh+z6uexlDRFbGHmIgeVhuIEf2VVH1LSLiHVk
         j+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779142052; x=1779746852;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sGR8lYC7RwoehcYqlTGMusvCrV6UmoJY2p/GFIP4wIE=;
        b=GmI2VDBpurGMqMbiwce1G2BQyqAkNfKG+Hnj1j3irEzlv0AXnNZzlU4wmc7V+4h2Xb
         SFqdZRMu0Nzfx3+d3pfeFd37wLjrKZqvpaPaWjxr6dJq472sX9xoPKEQjzIkgAFKeWk7
         sqm0TYyh6D2vfWHtcL8S8a2Bs4Ou47r+/8Cc52pDHbZcoBc8l/yRm2KTnJ9AyxdOKHCt
         kcDS5xFFJwcpLibrV8ELlqsEH26LZ0lQ9jk8vTuZPxAaP0Bb8FJC2KXWjPEG8U74HRCt
         5CBB4hWxndWFE01gq3wc+BQvGoYjHtgAfrb9V/WtmfrA3OpOU74wKNEtbeP/UDPFPnId
         Gntg==
X-Forwarded-Encrypted: i=1; AFNElJ8rbdq6LVuK9uMm3vvn0abI35MJYwqcC2L1RWLYxkw4XxEv2WOaUatt2Qh3rBUCf72/uYsoepXa4VA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwggoX6iyogNdmEiARgzOJFSXL8kUbnf3G6QL0lNs2uz55hhkvp
	gfL+WKrP2kEOSlmNgiq7xCgEeUz9DJSop5OkdEE0AkRZ7lVtvsGOcM0xEjVf/WnQ7Po=
X-Gm-Gg: Acq92OGFjzJ3p6KAnz3dryB5bSDfRrE0jb/jWFSEDGNVC8sRxzzUS6KcU2hHvbtgXrm
	PeJRFZK9Iz8ONdbb3BuKa9ntJxAdMA4zjJX48vfkWJTF/8ahsPmiDevyxIRz963R5rifrDT6RFI
	N4wiK4R36/DXqq6YX1QlUm3ebELamj8B3P6FM+ca0D2qX96/S0VDUiS68Fg2/OYPaDJHe0oS9WR
	mtekYNUkROz/0B/y92oxqWl+poxF0nOAXCn6ZebWiL77BhF/44POqbGiA7vlxPcWauo1PyLMxhF
	nWljYbtJxJdHY4QDqKaTAdWyGFAfX/Dgq/Hc37lpRa0LMSNmcV0UMNFsvd76XuFUVPpkK/1NYnX
	mOnwzcTjquzP14c/e3WfBkUyFgVS26yMtRQ9eRsenK0oZB9p1BmSnEodbjZFEf24QNmUCTvBXST
	yVsPRw2edf16OYxpZj4FX6jntw/FJURhM/
X-Received: by 2002:a05:600c:8184:b0:488:ffb1:494c with SMTP id 5b1f17b1804b1-48fe60ed790mr252457835e9.12.1779142052380;
        Mon, 18 May 2026 15:07:32 -0700 (PDT)
Received: from [192.168.0.35] ([64.43.40.255])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5694fcasm261653215e9.5.2026.05.18.15.07.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 15:07:31 -0700 (PDT)
Message-ID: <d15b138d-8c6b-430b-bfc3-f410b05e4835@linaro.org>
Date: Mon, 18 May 2026 23:07:30 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] usb: typec: add Qualcomm PMI8998 role-switch driver
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 taygoth <taygoth@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>,
 Luca Weiss <luca.weiss@fairphone.com>
References: <cover.1779127507.git.taygoth@gmail.com>
 <6fedbcd344505b63de72037f69ea94f916255f03.1779127507.git.taygoth@gmail.com>
 <zm7buc6djok2743bs6ghvlr3bpc4lld4qpgs3ggwjsy45f4l75@kua4xtj6b3wd>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <zm7buc6djok2743bs6ghvlr3bpc4lld4qpgs3ggwjsy45f4l75@kua4xtj6b3wd>
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
	TAGGED_FROM(0.00)[bounces-37643-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,quicinc.com,linuxfoundation.org,linux.intel.com,linaro.org,fairphone.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[linaro.org:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: A1E7C574555
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 18/05/2026 22:45, Dmitry Baryshkov wrote:
>> No software TCPM state machine is used because the hardware handles
>> the Type-C protocol natively, and the PMI8998 interrupt topology does
>> not expose the granular per-event signals the TCPM code path expects.
>> Power Delivery is not implemented in this driver; the PMI8998 PDPHY
>> block at offset 0x1700 (register-identical to PM8150B) can be wired
>> up by a separate driver later if PD negotiation is required.
> I think TCPM / PD-PHY is (more or less) a sensible requirement. Without
> it you can't negotiate higher power modes or AltModes support (which
> means no DP).

If the PDPHY is register compatible  as stated then the PD part is very 
close.

Looking at the pmi8998 STATUS_REG_4

- VBUS_STATUS
- ORIENTATION
- ATTACHED

are all driven. So I believe it would be possible to bring the pmi8998 
into - along side the pmi8998 logic.

@Maxim have you looked at that as an option ?

I believe Casey and Luca? both worked on that.

For preference I think we should try to land pmi8998 into the existing 
TCPM logic though, as another TypeC port handler within the existing logic.

The important signals above, appear to be driven.

---
bod

