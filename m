Return-Path: <linux-usb+bounces-34623-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8G9BLKf1sWkeHgAAu9opvQ
	(envelope-from <linux-usb+bounces-34623-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 00:07:19 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF0F26B241
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 00:07:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6E9F63094F99
	for <lists+linux-usb@lfdr.de>; Wed, 11 Mar 2026 23:05:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48F6A39EF1D;
	Wed, 11 Mar 2026 23:05:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D2xCPE0s"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875F839EF23
	for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 23:05:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773270352; cv=none; b=BsiaFgxifHPEWNt38cz9/CZ8/Q6nDex+XBuiBSdoBIpJAN5Hyi5gMMWYgaa+IV16wmu9hp5DVwHZ/mosfMaYCm774P63Z3hjOmYUpVh8ARu7ZPCR4/qaQ/3vARiOSc8eteUEVhpiw8seisprrGCsRDbHze2mbx9ZnagH7lnOFuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773270352; c=relaxed/simple;
	bh=rfKuOzvHe5vBbX9keVb//BJgX5e9Vh2x9YeAvZCPoVM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nrIITfwaDnjzyhikrZXwEmGUi3o7IzUBtPHanbmmW6gA+ayZzaqUCDCha4JD5xNKORZuZgLHFAIwNCQSmHAWzxh/IQmnFUHXi4kQr09N22oqRNhi9LXxAYa61q5D0K98WwbMpyKT8/t6ITOH5zzyOQaB9tjYcFvwxUGjjjbwGa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D2xCPE0s; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-661cfb9f3aaso484593a12.2
        for <linux-usb@vger.kernel.org>; Wed, 11 Mar 2026 16:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773270350; x=1773875150; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZNc95yBeQgjpi9QO4APmDLhPk0cXt4A6W6yy8C9WSLE=;
        b=D2xCPE0s5zyDyTGigNQ1MakKhNaOmsWBNhdiUDFHTgziagAYK6laDimkgs/DL5udfk
         JIiFK+Rys2O91h2E2DRflOHdsKhDT0PagNm7+it5sXbFAMxDLKLiJyY+wOZ8anieq1zg
         Nkbfzjr7qdV4/FSNKZP48EyQzxya3yroet99O3l5TVjo7ZytP1UuStM817+TU4lYJL5f
         +oD5b+K//UdKxzLpBSi3ovbE/4lIqWVrQWKooVqN913lMfQ1/UEzCUdCoifgYHdTUSHL
         dAlp3da+RKne9aN3/SrOS+7R8/rK1Ww8UrmkJmNEDstIyn4ZY03ciBeTEO58M9iq88NE
         DtMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773270350; x=1773875150;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZNc95yBeQgjpi9QO4APmDLhPk0cXt4A6W6yy8C9WSLE=;
        b=PVcvYYPfPqZWz/WK8f/3MUmS2VwdfNNB47Hd5LQIrW2TBjf0ji8LpGtBoxP+BWJcGM
         yh9Ep0x7/eOfe+eLg6lFfa9stGk4DvSRAQiNPhEvruz82dlqtApIrzAc2tKBQlzDG7La
         eeKVYfMwcHFiIDqq2ypOi9ye7lgbqE4FqTx8wGebfl3N+Mb7/UdQtKnIu1ge+xjQ/4Hk
         SGsGS9uNjRsAKomSDao1edGiZH8bJqN5TmQlHQdh6vdOUocHzPT0On8xXqcH/L1BnUQm
         hQkaaiE5CFdXhQVTbYiOTWqZ+x0D/BD71aQGea5K61yKHn9V/KoUJiX3PY5JiyjgU7om
         GRXQ==
X-Forwarded-Encrypted: i=1; AJvYcCX8Ae3oV67Kc54P9Cb61bJ+DHkY4+rT2U/68hCiDqabkzDGgQmbAgoFq8xkC9b9pXHgunEk2bMmh28=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNozuhBv+qM+nrxLZzvsNtUDmZ6iJTFGD5u7pMKT7suQmCpl/J
	NrCXBEN+EjKEFxrgjgWDBOGwrG/zchsgBZk2W226f4SpDBIJXX2A7akRo0kPXJDSv4g=
X-Gm-Gg: ATEYQzzM2S7ZXdVUIujzrRayi6IGOqeMsdSjfe7PF3jOMwkKVq6fJ+gxNCIRmfrGm/M
	1w0xQcr5+1BdtpXQwWrDNgE9t7BC8JdyUuwt2yEx6YYXVNlRv0tpwPReFQ74UPkFjp4OlEHBdES
	Zo82XMeSP8+wsmIfPie10Ubw2LnbI929fdI+GltMEB90n48/ArOEhdhDQeDLVJ5baCDDkrh7IAs
	eC51pJzP8OQ+gwph7lYY1flamlfyi78HjAlGOuNX63DaLl3mIIJKEAyOwCMRYJSnvHDOHR08xrR
	J+ltGZUHO+L6hTOOmpL2WAz7J4PtJIh+knEUxdnEhn+YPL73wduOQ1bwvrnqk9UhEAc93A5fEUP
	Ezm1/e9rzGeOVg6sH8QXkqTY8ufYxUNxqzBJ3QzwIprJPpjg6eajxmuksfirzkTSeJvWwpaMzvl
	A6BFA+SUkNJe32dSh3dINcDZd+fgBEeT8R5g==
X-Received: by 2002:a05:6402:f24:b0:662:bd56:3ba3 with SMTP id 4fb4d7f45d1cf-66319ee4b53mr1755231a12.31.1773270349747;
        Wed, 11 Mar 2026 16:05:49 -0700 (PDT)
Received: from [192.168.0.101] ([109.77.88.70])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6634ead9972sm279788a12.0.2026.03.11.16.05.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Mar 2026 16:05:49 -0700 (PDT)
Message-ID: <1bc80b89-5b09-4042-a61d-698884febded@linaro.org>
Date: Wed, 11 Mar 2026 23:05:47 +0000
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 2/2] usb: typec: qcom: Add support for shared USBIN
 VBUS detection
To: Alexander Koskovich <AKoskovich@pm.me>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260308-qcom-typec-shared-vbus-v1-0-7d574b91052a@pm.me>
 <20260308-qcom-typec-shared-vbus-v1-2-7d574b91052a@pm.me>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260308-qcom-typec-shared-vbus-v1-2-7d574b91052a@pm.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34623-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: 6DF0F26B241
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 08/03/2026 23:20, Alexander Koskovich wrote:
> +	if (IS_ERR(pmic_typec_port->vbus_detect_gpio))
> +		return dev_err_probe(dev, PTR_ERR(pmic_typec_port->vbus_detect_gpio),
> +				     "failed to get vbus-detect GPIO\n");
> +

I'd prefer if this was bracketed since it is over more than one line.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod

