Return-Path: <linux-usb+bounces-37641-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GEBxDqmMC2p1IwUAu9opvQ
	(envelope-from <linux-usb+bounces-37641-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 00:03:21 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 96C48574351
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 00:03:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 6E9C33049977
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 21:59:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 972BA39DBFA;
	Mon, 18 May 2026 21:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OFAp756H"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15C827E049
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 21:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779141594; cv=none; b=I7D/qXFrKsXS+P9U55uejztIOYs5UGu+3eamRScAKyGWGm5Jc4pQSAHoeM/wdXUN+e55/CHRFrkk1/9OAMu41DTGNMqnMpndxz2BLLKYwwkFtq7wdHRJWS48Wgq5U2xhpndAT75B2zkrSQjm0KW4No6/UkvTirl8NK4VD1llHkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779141594; c=relaxed/simple;
	bh=pClFKjIWZQ1zZVeTOv9fsiA7SSfT3UZ9//G9B6WjWFU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DkwyaRLCdVrUI6mZpMMuijk1KetyWeNwcZSafasrdaLtYFm/hBiqM7AH21FZpHYhKhELp2kcTR2nMGxbL2wF1nTeZHXgRYniB7Hct02oqimqE94FeRMgw9f/RdjSVh28i0X8DSXQso6oB2j2GGBRdb8Kjt0Ks95+jGm5eqNfDLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OFAp756H; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488a8ca4aadso27448455e9.3
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 14:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779141591; x=1779746391; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+V9ld2nee8ACYFa7NLoWrrJwhU2JSDigOdRdNnPmeM8=;
        b=OFAp756Hy8Qt7JLliRlr/2KvaQMyhDtw3GLm91oUwCRsOKhmful8ENdlf34OJ0QjCG
         Dkz/rx60jE/OWEh9lHMKBoRSd9LPKPAvK5Swv4sFeY/TDhx5+Hb4u2eerd36r/eukZJV
         5X6U3hVCUEsLl57yVdXfUQ3TisrEhb7boWJu+O69UaIY1NDYVZR0zU5XdAHgSMW1eMCO
         wPj/XkqrDSpNBdv/PRR+p2HW6IXA9lziTXZ2rVXm80+fdS+QmseERM4Zm2ZZaToRqGUy
         i00S1QKnb91VumcMIgYUQppTBkZTUsh4h4BwT67iMDzidEZAGse/Tywclgt9RbxUBDR6
         czrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779141591; x=1779746391;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+V9ld2nee8ACYFa7NLoWrrJwhU2JSDigOdRdNnPmeM8=;
        b=m91/vUGhz1d7TwBw1rKOPi62uzNSeX7M/DqesH8hNB6Topti4GnGKm6uAkfOw0+Rv2
         ZobEEOKXpNGVtW6S8jDbqwNP6V6Mu4bft3Qh6Z+PkOqPMRgUTulKgo3MH13jncJQ4v7P
         5347TryTIxElNFAQqng1NJPJUfmn47zbIXhjDHIy5GfRF4DFWMh8O7k1ab+Kevh7Y1ku
         kKbGkkJiPeE8U0P88qfqfrvZjiJPslyXCjEpho+ubihAdzVWM8PYk3Hh6q7sqxA87dWn
         HJLB/KYOXRwx2heINN73LBHcpTc2AuFqwML94KrzLlzS2UyOhB/3PrgjVZhRBapE5kAo
         1DpA==
X-Forwarded-Encrypted: i=1; AFNElJ9zdgB/45sfkVx8TQMpr1YKq0qKEqIwEgdZh/Tl7VYXNFojlIF5hMWy/SEAqVA2QxxW0/hVN5/Eaks=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfYD/RCzGvKbdzp0LSoUYqMNnBGto4vPHf5O0T/2wB2e6AKHAf
	HE7hiZ3ZODAPhO180EwJLIFG2BrzA6lgGGjFIGqSMRwM+lyqXnqJ1A0sr4iVl9DxyEc=
X-Gm-Gg: Acq92OFUcgx0VeOO3zSW/xltqCmeh6z5itUB61P9McwjQcQPvU81OfY6rO7i7E+o620
	QSRARE6aFAJl1xwDQeo726V7DZjoPr2CtdYKtqIgkZ6S0zQ6Ph7PakZjQrXQraIu4x350HPZckQ
	hIPdnla+IKi7wXXM/PH0JnDxHf7fDdnGfd/wfRYiKvLiPY3krwg+p+5kRfMGV9tfvZVfE9NP9Sm
	TsMBSorzxR0ODvhmxyI3ZFvJJ/O9dCJXQFzzhhAEXdF1+FkfbvOsJwFfK0m2XOojeyezCTuMdt8
	+P4SDS+kb5P2K3pmwmhWF4Al4j1jG1r4/qdxBxg9/rrNGfuk0jwbgBjIeDBqtZWav4+ZlyS5B1U
	PPlxrHia/zEj+vN5kwPbYGEadhngcwOv1U2cucRe59XOsy9xur2DfbD8QvNErQpCkSgJb8ZiA8N
	3HDlyezTawsiVuCbfqnZAE96FbI253hhNX
X-Received: by 2002:a05:600c:198d:b0:487:5c0:671f with SMTP id 5b1f17b1804b1-48fe60e552cmr296639285e9.9.1779141591184;
        Mon, 18 May 2026 14:59:51 -0700 (PDT)
Received: from [192.168.0.35] ([64.43.40.255])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe5694fbfsm488709605e9.6.2026.05.18.14.59.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 14:59:50 -0700 (PDT)
Message-ID: <918adf8c-14d0-4d9b-93d8-d34592aa04a9@linaro.org>
Date: Mon, 18 May 2026 22:59:48 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] usb: typec: add Qualcomm PMI8998 USB Type-C
 role-switch support
To: taygoth <taygoth@gmail.com>, linux-arm-msm@vger.kernel.org,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>
References: <cover.1779127507.git.taygoth@gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <cover.1779127507.git.taygoth@gmail.com>
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
	TAGGED_FROM(0.00)[bounces-37641-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,quicinc.com,linuxfoundation.org,linux.intel.com,linaro.org];
	RCPT_COUNT_TWELVE(0.00)[16];
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
X-Rspamd-Queue-Id: 96C48574351
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 18/05/2026 21:22, taygoth wrote:
> Power Delivery is not implemented. The PMI8998 PDPHY block at offset
> 0x1700 is register-identical to PM8150B and could be wired through
> the existing drivers/usb/typec/tcpm/qcom code in a follow-up if PD
> negotiation becomes a requirement.

So in this case why not implement your code as a new instance of of 
type-c phy in the existing TCPM driver ?

---
bod

