Return-Path: <linux-usb+bounces-36098-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sP+rEoR812mXOggAu9opvQ
	(envelope-from <linux-usb+bounces-36098-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 12:16:36 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id D878E3C9149
	for <lists+linux-usb@lfdr.de>; Thu, 09 Apr 2026 12:16:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 27E1530160EB
	for <lists+linux-usb@lfdr.de>; Thu,  9 Apr 2026 10:16:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DF803859C3;
	Thu,  9 Apr 2026 10:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hABVwwfF";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="cZGwbLtp"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B079D342519
	for <linux-usb@vger.kernel.org>; Thu,  9 Apr 2026 10:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775729782; cv=none; b=Y4am42tKcKtWRYIlJU02s0ahP9uQhZCkIbUzmFA7RdJfE4N5NQN3TeUpUtz8OlbDWPnNgSVLS/QX5erfd30O/7EawNulO3eNtoSimktCwKe9iHDgF1UAHbQzyHw2g3EbC3ihINrvhLBA/LJBvPT2pozt/W2vuV4aBnI+U4tCO7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775729782; c=relaxed/simple;
	bh=tPoH8ZTaoSLNvELAvyvP8MQ/Rt54p7t7LAvAWJqKfs8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c6UaJkCx6CGPVvF2ekKr8i1hbYUQvcIakTV3aYTv4/EbfTb+wMie9wuOIc56tL5xdGcuFogL+HerYfviJDxrUyk90nwms9RZDyivUP33MVPm7oGuP/60CEC3U9CJh6fWXL0pJucX13Dm56rrOe9x6/Qxhpvz8JFrNx2Xry9xwJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hABVwwfF; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=cZGwbLtp; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1775729780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Keu4pEUQjOK9n4bWIn3PAdEj+U9xTzXwK6+g1cFUBIM=;
	b=hABVwwfFRTTOrGutiZ5m4FsyaEpW4K2Wqd1YLFe49CH3Nz38teUIhQ3qupBd7YKodUV2sC
	xZan+5TL0OKCVw3qW0pZOT2c+pfORXyzchhxC6M/yRtUAyl1U74QY3nnOrMjhm4ArfwjId
	TzK0hEk7oJpAx2yrKXjxjCu3Pc7Ay7Y=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-509-rPWbB8cLN5azdk7mdwAT8Q-1; Thu, 09 Apr 2026 06:16:18 -0400
X-MC-Unique: rPWbB8cLN5azdk7mdwAT8Q-1
X-Mimecast-MFC-AGG-ID: rPWbB8cLN5azdk7mdwAT8Q_1775729777
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-43d177fb157so861961f8f.0
        for <linux-usb@vger.kernel.org>; Thu, 09 Apr 2026 03:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1775729777; x=1776334577; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Keu4pEUQjOK9n4bWIn3PAdEj+U9xTzXwK6+g1cFUBIM=;
        b=cZGwbLtpvWToJ7J2HwluoH6kfOj+m0viMuNDSnJvEeGjMZpMooAFRLFfFkc+TfL6PA
         HSJ0cArGrddJTK6sJm38Hwzn4I8hqAQ0LKRpHlwDHNr32ZRRTeVDLW4VeCeZAx6XDvij
         Jc0OUJNu23xXaqfU8zWJiUrgnfQRv6DOM5JqATbORRNBEEpMJ/jOYaanHjEkc6Fksf2L
         QemEa39+sn8Zw+6sns7r1GNbgjKPqdevyjrbm4foA5ld28/LivMop4Ew/mQgfgrlm+9h
         eUPD2hc5Smqxsw2zumnQVipF2JK3LoW5T3cUZD9DfkvtsHHVaaW/k/TWw54sI5TY4MdD
         x68A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775729777; x=1776334577;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Keu4pEUQjOK9n4bWIn3PAdEj+U9xTzXwK6+g1cFUBIM=;
        b=X8V/YIUug02EOsbLPpZKek23GSThKy2yOtw3gSyB0b8S3BQf60/9uVdoJvZNReZE0m
         K7HLeSdTTt88UzCIfx6a1qn1e/V5f0ebYBwkkHv4X1Eg3PE0TFvwLaKbKg9V/kFXP4aR
         M9/qqdDHLkW3Y8iTNgTWTlNryNUYlf0Oh3+4c78wTn/i2jnHEIvoolT/aBzCDiN1/l31
         fERGhabaY+Pl530DolSyjDYVV/HCfuS7zQ7TpzA8cCVE4iV6fIAlPhxP7Q+MNRBc5ur0
         qOcjCpzyYwnASvPYy8tMVH9dtkwUN3JRXF1LwFY/99Y6lMSZQymqnLubDyd11t2Xi7Py
         Ymfg==
X-Gm-Message-State: AOJu0YyVyY7tArTzDbY4Zn0L7ti6KAcv6Hcnbm6W+0fLC2AaHPiHcfaf
	QIpH0SPVkAQ6D5QE7U/Z/cxy8Lfl4l12oErFhJs8HZkDBPm/G44fhiO3gqLGy62630FJDJbNxDp
	kijKC4MORoenCgWTE5wW3qhmb8u4lKMvqBN90tjp8ULFSRgmgWKaidHe8GBdsUQ==
X-Gm-Gg: AeBDievOb3fI5OmuivsHChVQmXvZiUTq2xYrTEyjoM5X9Yf5qnR+aU0ctygxMjc9Wmy
	ye6bEK/uWrZcRrOPr+nBWAPZN+nRodzeodKWZH7rrjEnNLnD6jYIVSDSvWd7uPQUnZVH/dbvmLT
	4zcQ1rMoiixFiNFm9JOhDXpcY/9AgRe8dclnjyOOY+HWQzvYAA9KDhT3kZG4lmyZhM51U9qt9+K
	uA5KjlKH48SG1Xikhsgrpedi4SDgb0fjYlJxiqdXke4eJr5DK9ovTdQamyt6aFB9g9nONs4J0g4
	3ro2ENIPIzOViADEkDXCo3NqKnWBI1J03ibnlpcHf6p8xmARJW25whcWDV2QqzSwB+bygUHWigU
	rqZ0okh5qf5p1utZYmYLqTQHT93wxl+ji+Rfc7fL3ag0vJ2t9ucF7+VSF
X-Received: by 2002:a05:6000:22c4:b0:43c:f66e:f31 with SMTP id ffacd0b85a97d-43d5a18bd4bmr3637618f8f.27.1775729777119;
        Thu, 09 Apr 2026 03:16:17 -0700 (PDT)
X-Received: by 2002:a05:6000:22c4:b0:43c:f66e:f31 with SMTP id ffacd0b85a97d-43d5a18bd4bmr3637585f8f.27.1775729776698;
        Thu, 09 Apr 2026 03:16:16 -0700 (PDT)
Received: from [192.168.88.32] ([150.228.25.243])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f1esm64126034f8f.2.2026.04.09.03.16.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 03:16:16 -0700 (PDT)
Message-ID: <8b324f8c-f4f8-4e90-b5d6-9b87ec3daf2b@redhat.com>
Date: Thu, 9 Apr 2026 12:16:14 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 2/2] r8152: Add support for the RTL8157
 hardware
To: Birger Koblitz <mail@birger-koblitz.de>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>
Cc: linux-usb@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Chih Kai Hsu <hsu.chih.kai@realtek.com>
References: <20260404-rtl8157_next-v7-0-039121318f23@birger-koblitz.de>
 <20260404-rtl8157_next-v7-2-039121318f23@birger-koblitz.de>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260404-rtl8157_next-v7-2-039121318f23@birger-koblitz.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36098-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[pabeni@redhat.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D878E3C9149
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 4/4/26 9:57 AM, Birger Koblitz wrote:
> @@ -6534,8 +6842,11 @@ static void rtl8156_up(struct r8152 *tp)
>  	ocp_word_clr_bits(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL3,
>  			  PLA_MCU_SPDWN_EN);
>  
> -	ocp_word_clr_bits(tp, MCU_TYPE_USB, USB_SPEED_OPTION,
> -			  RG_PWRDN_EN | ALL_SPEED_OFF);
> +	ocp_word_clr_bits(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL3, PLA_MCU_SPDWN_EN);

AI review notes that the above leads to 2 consecutive:

	ocp_word_clr_bits(tp, MCU_TYPE_PLA, PLA_MAC_PWR_CTRL3, PLA_MCU_SPDWN_EN);

with slightly different formatting, likely C&P error?!?

I think this is better handled with a follow-up, if needed, as I don't
see any possible issue out of it.

Other AI comments look not relevant.

/P


