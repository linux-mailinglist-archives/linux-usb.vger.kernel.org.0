Return-Path: <linux-usb+bounces-32555-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MChFNvxb2m+UQAAu9opvQ
	(envelope-from <linux-usb+bounces-32555-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 22:21:31 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F964C264
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 22:21:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id D5EF0A87FAC
	for <lists+linux-usb@lfdr.de>; Tue, 20 Jan 2026 20:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8D953A89AC;
	Tue, 20 Jan 2026 20:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="U8G/F9a7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com [209.85.214.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE593A7F4B
	for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 20:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768939852; cv=none; b=J8HS9Azq0uOrj1To4f7iAEP6Lg+wAqBrwsoOf12qiv2Gw44jr0GrQ8yhnYxH+Ik2Fmqjn7+vZUDRlY0wKcrvkvn3/jK6qQn8YtbCk7VjucHqsJI25TTFe284beMiK8cFEiAUj5zodYhCnRUc05hjojbGP9B8ODAdtoby3xeSXeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768939852; c=relaxed/simple;
	bh=qeRhtAuetfvWCw7JITmcL5/TB7s+YEEcghBWKPAAVrw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TWzIxVpUsKjWTVK7rz0WR9PJJsHVEGA1BklqCBG/HDmaWdkBPs4O5whIaQoHrKI4lHhWiA44byxE6F0vHY5XtE/kwm+r9xXydQ1df4yxVGEMQEOkctVcJOHLVf2F9/65pSsgLJQXV4XfIU7aEEfI1dZ8OQbp+vkuet1Vh2G2DgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=U8G/F9a7; arc=none smtp.client-ip=209.85.214.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pl1-f228.google.com with SMTP id d9443c01a7336-2a0c09bb78cso1554815ad.0
        for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 12:10:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768939848; x=1769544648;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bSkchG3K5RYKWcee9TMscdzqq+UI8fkJoSNx++VuHlU=;
        b=nFwvU0TH0kNG3Hw6mNDsWW8py7AqkdfrbUonxXu60QiwHHXt2XEKMj0TT6R4d41iOr
         pbHaBd6UWRwPRGG83aJ0qksqkaHeRlQ5KvMhfQx08dj4X7e2X4lw+re3aRnwfur3o5NO
         zfRcbe7RxM6cEr54JCEdj+nhK7nm5yMObN4CLXBrJ1n6hjkaoaaTp6DHt4YnXEXWKNsM
         R7FVLrJHQbQZkuaW0JJPQheUk3YxhDKGHFi7P72vVxhgFfal0hBz9DCHy4JMqxDdCI8i
         1oJZ8dilMYBaGZ8Jhu0HMQ6db7Wp8KjjbxiC8yVGqcDR0vwfk09lH0+oqF6PHdOsLA9m
         I1YA==
X-Forwarded-Encrypted: i=1; AJvYcCV+IhhsjyLH1/epHbevpWWYMdqbSsCo7+gDT8E7Hvf+2YPbxFy0BQSI8kaX1zI6533GYrKjdbtQOvE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9aqDh84ccp39gxNnqL8g/AAtWhIMSPJ7eMqyq7nRGp7oW+H9y
	QMG4RAhxmuxCRJZ7NqBbzLr0qEpqO30Zh2aqGaL/2cS5C58LVsluL7SxvHDcEsnwKHh/vcEv9dc
	broGKv5wpfaks7gGNYFuPuDXKqYGydeDdVd3Ah4tsbGjwUlB6Q16TeT+za19W+7gn1gb6lR6sH3
	FzKYeP9naDC+WFC6DkWzywVAWn7Lf8NfAGwX7uoV+vRx6SDQYcQ7QmUrfC6aRA3mzMuAfCNT7t5
	Ep8cLX2mp0ttFvoLpA7
X-Gm-Gg: AZuq6aK/FQrcnYTkO9Gq/OJs4CsZx+thQkXjECYVIgtBunjsbj6iJIXcc3XtQV2BNjs
	yupashbSd4XE8j/0eWTMDbQZRJjj68suR35h6CDGqv8WXWtjgiZAAMqUWOjhKcgjxCrMWfoiKaU
	r2SmQ/50RfJTV1Ccg1spue0SWsuORWy0/GlFo8Uac42qbfwzAyjk8E8sh1vyGvF5Y+W9DScrhrq
	ow1FNRjuhAjTVV8gMZigGjuVv/ad4Wlmcll8vBBFaIurUDASLEhfIrYDExTCvUjtbiH3I7lFsse
	0LpCpB5BHSFCUYB4Qf3OnGd/aEuqMvq71ygbdVknuW/biJbL6QzHoFotGcSHmDpXBa3smNzLHQi
	8M4BS7IM+leXKNtdrm21rQOnWo+NOa/TVKGOOkFZIG/ZWEVwU2jhf4mhrfZ8CLW1bL2LDpvQ+t3
	k9rQ5bgS6O0AVZzHlyAdOVlh0JplRm+ttgcrjxSlj8cRZL9UE=
X-Received: by 2002:a17:902:f745:b0:2a7:9163:8e60 with SMTP id d9443c01a7336-2a7916393a6mr6946525ad.23.1768939848104;
        Tue, 20 Jan 2026 12:10:48 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-2.dlp.protect.broadcom.com. [144.49.247.2])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2a71919672dsm20699205ad.40.2026.01.20.12.10.47
        for <linux-usb@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 20 Jan 2026 12:10:48 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c6a289856eso102556685a.0
        for <linux-usb@vger.kernel.org>; Tue, 20 Jan 2026 12:10:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1768939847; x=1769544647; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bSkchG3K5RYKWcee9TMscdzqq+UI8fkJoSNx++VuHlU=;
        b=U8G/F9a7GlaMMkL2kDfBjVvJBlo2Qrnad+7LAl6qsXCWZZQJosp9y9FGHdEQ1AIqci
         O2bo0fteo2yzBao47yckjrEamcBupZLHSGTHsqy25JcYSVVA7cgikcsM8Lhmydzajka+
         9L9Lgo1ARHD9AgLTgU0VjT6NV/a80ETMq4Row=
X-Forwarded-Encrypted: i=1; AJvYcCXloFeBxZnD8Q3kedl1bB3Zf93J2zzOr2T0XNLRV5byR88fMvsitbI3fyZdUkiHaF1shmwYoNLjMz8=@vger.kernel.org
X-Received: by 2002:a05:620a:1911:b0:8c5:33da:219f with SMTP id af79cd13be357-8c6a651dc32mr2067960685a.43.1768939846853;
        Tue, 20 Jan 2026 12:10:46 -0800 (PST)
X-Received: by 2002:a05:620a:1911:b0:8c5:33da:219f with SMTP id af79cd13be357-8c6a651dc32mr2067958185a.43.1768939846429;
        Tue, 20 Jan 2026 12:10:46 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71d5b93sm1089721085a.23.2026.01.20.12.10.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 12:10:45 -0800 (PST)
Message-ID: <947c20fe-5def-4c2e-acff-5da76bde3f9e@broadcom.com>
Date: Tue, 20 Jan 2026 12:10:44 -0800
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: bdc: fix sleep during atomic
To: Justin Chen <justin.chen@broadcom.com>, linux-usb@vger.kernel.org
Cc: swboyd@chromium.org, chunfeng.yun@mediatek.com, balbi@kernel.org,
 gregkh@linuxfoundation.org, bcm-kernel-feedback-list@broadcom.com,
 alcooperx@gmail.com
References: <20260120200754.2488765-1-justin.chen@broadcom.com>
Content-Language: en-US, fr-FR
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20260120200754.2488765-1-justin.chen@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[broadcom.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[broadcom.com,reject];
	DKIM_TRACE(0.00)[broadcom.com:+];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[chromium.org,mediatek.com,kernel.org,linuxfoundation.org,broadcom.com,gmail.com];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-32555-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,broadcom.com:email,broadcom.com:dkim,broadcom.com:mid];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[florian.fainelli@broadcom.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: B5F964C264
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 1/20/26 12:07, Justin Chen wrote:
> bdc_run() can be ran during atomic context leading to a sleep during
> atomic warning. Fix this by replacing read_poll_timeout() with
> read_poll_timeout_atomic().
> 
> Fixes: 75ae051efc9b ("usb: gadget: bdc: use readl_poll_timeout() to simplify code")
> Signed-off-by: Justin Chen <justin.chen@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


