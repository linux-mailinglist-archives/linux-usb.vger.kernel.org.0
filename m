Return-Path: <linux-usb+bounces-35270-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2E9TKl9kvml3OQMAu9opvQ
	(envelope-from <linux-usb+bounces-35270-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sat, 21 Mar 2026 10:26:55 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5942E4635
	for <lists+linux-usb@lfdr.de>; Sat, 21 Mar 2026 10:26:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 42E58302E86F
	for <lists+linux-usb@lfdr.de>; Sat, 21 Mar 2026 09:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6152F35A3AD;
	Sat, 21 Mar 2026 09:26:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WX8GM81p"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50EE40DFAA
	for <linux-usb@vger.kernel.org>; Sat, 21 Mar 2026 09:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774085209; cv=none; b=ccucGvYoKZOTc6EUI+/r6y6nYIAvaT9MnwWHTtl/TnxQttaEDEg8s3Md3i5bcCGc9waEkcVGXsoUkQU24TNQkuAR/51HdLXY/oSH7vxWxLeUsoXq0PmLLqbo9fV/PfECWN7qEsWReSSyxD5+oFJZaLszrbgKjKpxidAtNQPLi4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774085209; c=relaxed/simple;
	bh=IjV7qX4ccBsM3ChH43NfqmDcSs7MVK3lpBXhpayjVcA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lKv2HgRCI38J4ti62mA8ZJeItVeSKV0gbNbdYS0npHuOqM3kI9f83p9zxHrvZvpvOR58uQ5/n3Y0wcxPDEnIORO0/YgOEtTEhF84c4xulCfrg7fJ7hoiiA/fyAZ/WSBxminMpT37v2tajXoyOtCknspYbE0TukANCc9CzM/pEyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WX8GM81p; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-439bcec8613so873064f8f.3
        for <linux-usb@vger.kernel.org>; Sat, 21 Mar 2026 02:26:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1774085206; x=1774690006; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X1TOoLUJxkp4sw93jZx3T1maGYjZf7Y/+WTbiMaYD0Y=;
        b=WX8GM81pqnm1/vOOhhVSRVnFCt1QXRQG90HrCwBVop0DAOnTO5Pis1bOsrx6leen6L
         2yQLb3S/38lhMs6BEvu/JzOIo2JFEUbT5/SWAy3GUyfPOnP7kBdXAv2mrYgeLrdGOR/s
         WFkpOCEKV/WPeiwRz79kCSZ83Uxs0dkK9uo6L1PDIBircMn5ZKgcrj5r8heePlxl+0oV
         pH+eYD855+2Fj+tKJd1ZKlb6+s+UjwFEVXO/iLqKgjhauIB9jwCMRSB/vPt/8hY2lWqC
         t164ew4YQFM2QgJC79Oxt7BwY/iDRQXkNzvpEI0KqU3eBxI+8OwtzzRTT7AYbWMyL1fp
         JRQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774085206; x=1774690006;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X1TOoLUJxkp4sw93jZx3T1maGYjZf7Y/+WTbiMaYD0Y=;
        b=HTH4IQ10pewRSlXE5pKnCJaiN4S5fgQyKFhHFTyAG1PzkGdyvmMtyiiC/Zr+rLIrYA
         Apzza02VtgQqBQiIpxDU6X+jAXxRVjwN9hLtLM1Q1LWWcldHWaIZD20R8Sr4+N/udnSq
         JwCfHwnr5lt3Q/RQL2eFTRbZmfKhcio8nnEFrlN9qkHhPwpeE/2wjiFX9pA6T15g7gnf
         fy9odSABb2JMtf2NovhIWLwhZbJDLL965CV8pWwwxjxlefmBCX3O0r6VipU7qm8xlzuv
         MZj5dZJmo7D484W7AyUgGRkahVWA6EO5Bs1EpL+ozTXPgJRiuiHoHD7MF3jBmRscBbHk
         NQkg==
X-Forwarded-Encrypted: i=1; AJvYcCUJD2Das3fGPxnm+j1F2Ex2hwCLJpnFPmsRcrYUm3WVQfuDxPqqQArQRIqWnQVdyL5KTYn5RmQ6VIA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFJivcZTFqtq0+VDanU+mMVYVnxlW8L342r5HdYCcHxCaBy3SO
	P9IcAZXFdz1PG74Z6K0ARNNMOHZsJdZF0tWagXbQDIFXJCCGqx0FiGr8NAWEESzZ0c8=
X-Gm-Gg: ATEYQzy0aVsV/XJizvEubeLc2Vg3urTeNNlOlT+nBVRweJ1f4Pug48MrEaRMwqVDr5a
	5NcM7Fn1JT7T4+MfuVdJbPQNERy1DdbTNqbd0/A5s+433Zg9mA8JL4dc7yIDAkp12ZQJ4aBk6fd
	5mB0niZeDxf/HbA3USH51g1IBT8SfJz1AvhF4pkqZJjh/qBpnaMXLBMhWLnCPtec6fjyFNwIFzx
	GnuRWQJqhuWNH3QPzB1MjdlB/w7Jfrtfxvusqu46i9zKZEM4FPUra18TIQVZjfC8Q8AqTDBuxAv
	rH7YMA7ICFuqzbKOj0SnPGBff3SKq4xymkSgdNHkJtIPCQZP1hnT5h33wku1U2MQN2+aqw7AvaF
	keB0vHrwgXxIXIS4m8CWzy7sVaPqnXo9dpbJQ8YYskCjdbn1EQxmAEB6kk5PcSGA3MiyTGqlCTm
	PQ4vUmkD3O7bHyzGmyOoIju60FhXRMhSXX9jtrGR0WSZeTsH5519jDZthFdW00oWujuA9ZKZV+U
	QtaWQwWxkzj8z4NZW6toUL/eGX3
X-Received: by 2002:a05:6000:24c5:b0:439:cb10:dfcd with SMTP id ffacd0b85a97d-43b64286f98mr10247525f8f.39.1774085206053;
        Sat, 21 Mar 2026 02:26:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:81c2:60b3:ff00:9a5e? ([2a01:e0a:106d:1080:81c2:60b3:ff00:9a5e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b6470393fsm13896329f8f.17.2026.03.21.02.26.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Mar 2026 02:26:45 -0700 (PDT)
Message-ID: <6c3829c4-3e1e-41ee-b969-820948d10611@linaro.org>
Date: Sat, 21 Mar 2026 10:26:42 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: usb: document the Renesas
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
To: Marek Vasut <marek.vasut@mailbox.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Marek Vasut <marek.vasut+renesas@mailbox.org>
References: <20260319-topic-sm8650-ayaneo-pocket-s2-upd-bindings-v1-1-84e4ef564022@linaro.org>
 <CAMuHMdUACGC4rdXfvO-N-cgNAEzhczB0VYbMoxZMyazSAp6jWg@mail.gmail.com>
 <c8d878e2-8ce8-4526-9dbc-96e4f42be4cf@mailbox.org>
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-GB
In-Reply-To: <c8d878e2-8ce8-4526-9dbc-96e4f42be4cf@mailbox.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,gmail.com,vger.kernel.org,mailbox.org];
	TAGGED_FROM(0.00)[bounces-35270-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,mailbox.org:email]
X-Rspamd-Queue-Id: 2B5942E4635
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Le 21/03/2026 à 02:36, Marek Vasut a écrit :
> On 3/19/26 10:22 AM, Geert Uytterhoeven wrote:
>> CC Marek (for Sparrow Hawk)
> 
> The upstream supplies to which the USB controller on SH would attach are not described in SH DT yet, and they are always on, so I don't think we need to describe the controller in SH DT yet, do we ?

Indeed, not necessarily, describing it would be required for power control and eventually to describe usb hubs as subnodes if they also need reset and power control.

Neil

> 
>> On Thu, 19 Mar 2026 at 09:49, Neil Armstrong <neil.armstrong@linaro.org> wrote:
>>> Document the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller,
>>> which connects over PCIe and requires specific power supplies to
>>> start up.
>>>
>>> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> Reviewed-by: Marek Vasut <marek.vasut+renesas@mailbox.org>


