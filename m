Return-Path: <linux-usb+bounces-37651-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OFxQB3+lC2qRKQUAu9opvQ
	(envelope-from <linux-usb+bounces-37651-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 01:49:19 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AEE575279
	for <lists+linux-usb@lfdr.de>; Tue, 19 May 2026 01:49:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B7779306FC79
	for <lists+linux-usb@lfdr.de>; Mon, 18 May 2026 23:44:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F00333F36B;
	Mon, 18 May 2026 23:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ccsrn69V"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D20E33D6EA
	for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 23:43:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779147798; cv=none; b=Mi/tA7tRFYybI9OIbFZ+L+pweHL6xXztuRCiyY/Qwxw9DhB4vqkYyfJOxOfQyQI7bXhA9K1FNjonyUlicioEGIUcRQmxuaAKnBPNCuPH1hNvEwiCn5l0LztlL8TXRDM4o1wWOpmpycv9ryB192zDY9u4ZYMTq4GcXtjxAOPpcsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779147798; c=relaxed/simple;
	bh=ebvesQ8qFlXiPs2rj2qY2O62rXHnvh6W40TORpD1fUg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nadusdij+Yk3Xht5Kjfnt6RVtHQVgY5Eux1hYnt5p9digSgypqMG2lVqV5JVUK3OOgeYoCVhRtz1FfoNxwiRok0HXgl9KT5XyoYcS9lanWjsJxrnyJO4GLJj74yNFyARjMu0Xd3i1zazmdB5mhwQvq3UNWeTY+ipoeg2e21d8x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ccsrn69V; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so20958695e9.2
        for <linux-usb@vger.kernel.org>; Mon, 18 May 2026 16:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1779147795; x=1779752595; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZEoPrUHKxysLWOASnPxB7i564xWUA+RRCTSF/dKDla0=;
        b=Ccsrn69VKHwxYPp+RUGCy8T3gGSPytVDFcv4W1QpogcqETajHsEJsC+dghGqHNMCj8
         y5rWTYdrqIS6P/dMF1l0LvrJvuaVPoAhds4GcRJvPWyS1ollmSHNW7EjL7h5KJopKnP/
         fvJIPjSVVIeAhLwAULACwYtKUj9Az0aA4dNxwWt/cxIeX30j74o+HA0uSrHSAifWGeQ7
         Wu1sGc37l7kssKj+K/rWsFq4zvjBDmoJ9m7GfHiJeR65FMeQ0ZulRR1sNoWo9DLKXHvR
         E6BqEgklMuDCMPY95kM2nst5+jm52/XtQFEf65uyaaePRNoMOUlAYArvLehFAfdz3Evr
         JO4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779147795; x=1779752595;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZEoPrUHKxysLWOASnPxB7i564xWUA+RRCTSF/dKDla0=;
        b=QY8EWPq4cM3VPXbtU8TblVtD4f8j4WR8QSMeLQiAVPcqaPFSmfYYETPAjVOM8BXNSh
         qfYxtKIIILlhtBk4jDs0oRnjUCezREigsoYvXsgWoUXxlTrY4UlaGPRRaBXzG7PIsHfm
         zwb2BH3UdGSR+aNWlAxWcZhgzjHg99dXVFEhOjGIdcet5LDqwfeECO6I0IvsVkETCkRu
         uLgadrLj2xCRChFrfvlE1DlGJfiQhCGoDmzo/Abm21/ztNw1rfAq8plfxveWsGchn6BP
         TZiGdz7V+Mun+Dqpvd7Pc4vfYfsfcSKRku6JA7Jy3q5ICSK75rOBX8mtlOjtBrhhA51c
         0Zog==
X-Forwarded-Encrypted: i=1; AFNElJ9jtplpg2v18vTRNsdYitrMO1R7SWikmsuF9nARgndot/lxBFltAWmX96Dw4RVQWMdLVmu6YGd51ww=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXbhOOm1NzXZTf4KO99tDWA2R7SsM5Z82ubG1Znd6XPVvZ/sxu
	QUX4+XGNtcaYivzSoWQkhjYx9kPsAGwQnqsVYdpxeFxq4Y5oFHOzq3d1boK5vR+zGX4=
X-Gm-Gg: Acq92OG6Wui7EFmUKTf32BnJJdTrwa8h+gJoKxS3aQzdd0dLAQ6hALd+RF40Tz5jMjB
	6q7v+b7tgdSVUCTvU/OqlBOi8mF0gpyWhKGHHHqUh2ZmHTpWiuHq127VgV5d1KEnBbNzHU1vywh
	BB3mngjBFytlf1MHrvcQrKz2Yi8icQxYNNpWcCV/xbQqlol16Fj4vyw4zCL0u2soHpAJkSpBo24
	In8yLktaQk2KETpyzjAHH+07oF+VR3MCBdm+y3joJr9VJH3cmJ6OC98k7yjehhSjBiCcOm2gXZM
	Imv+8842NbCLy4/FIcAvqhz4Ils3ykwpY0lceLjjyJXeXK/0Fav6cyhEBSRWhOUu8lSncdT7PcM
	zIEUgRzne1JaikYbBS612iithKsH04vfA0mtITj8l+Z+nZ4hr4nqDXCKYHSGZw2xUsneZSm9oZ1
	SWvm8WxJLDMWESTb1aqBiEsVnxBsdL26OfVgixojr4Jcs=
X-Received: by 2002:a05:600c:34d4:b0:48f:e230:c3fa with SMTP id 5b1f17b1804b1-48fe6626a58mr269207245e9.32.1779147795601;
        Mon, 18 May 2026 16:43:15 -0700 (PDT)
Received: from [192.168.0.35] ([64.43.40.255])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ed30110sm44562460f8f.13.2026.05.18.16.43.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2026 16:43:15 -0700 (PDT)
Message-ID: <ee9061ea-8f70-4b54-af87-420179da9c06@linaro.org>
Date: Tue, 19 May 2026 00:43:13 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/6] usb: typec: add Qualcomm PMI8998 USB Type-C
 role-switch support
To: =?UTF-8?B?0JzQsNC60YHQuNC8INCk0YPRgNC80LDQvQ==?= <taygoth@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
 Wesley Cheng <quic_wcheng@quicinc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Casey Connolly <casey.connolly@linaro.org>
References: <cover.1779127507.git.taygoth@gmail.com>
 <918adf8c-14d0-4d9b-93d8-d34592aa04a9@linaro.org>
 <CAFPzRonyVt9Kd+Sc0ooNz8By6b-Zr_jHr0sBXv-M25dQ0w9Cjg@mail.gmail.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <CAFPzRonyVt9Kd+Sc0ooNz8By6b-Zr_jHr0sBXv-M25dQ0w9Cjg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37651-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,quicinc.com,linuxfoundation.org,linux.intel.com,linaro.org];
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
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 07AEE575279
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 19/05/2026 00:37, Максим Фурман wrote:
> Three shapes for adding a second port handler to the existing driver:
>    (a) extracted ops -- pmic_typec_port_ops with chip-specific get_cc /
>        get_vbus / set_mode / set_vconn / start_toggling, refactor PM8150B
>        code into the ops, add parallel PMI8998 implementation
>    (b) parallel port file -- keep PM8150B code untouched, add a sibling
>        source file with the same tcpc_dev callback surface
>    (c) per-chip register table + per-chip decode helpers in the same file
> 
> Bryan, do you have a preference? I'd rather match your taste than guess,
> since you'll be maintaining the merged result.

Taste - loaded with honey, chilli and salt please chef and add the whole 
clove of garlic....

My feeling is sibling file but please use your own taste/discretion.

---
bod

