Return-Path: <linux-usb+bounces-34710-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GECIH+was2mDSAAAu9opvQ
	(envelope-from <linux-usb+bounces-34710-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 20:58:36 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9A8278635
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 20:58:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 415B6311D65E
	for <lists+linux-usb@lfdr.de>; Thu, 12 Mar 2026 19:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7ED2A39BFF7;
	Thu, 12 Mar 2026 19:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="iFv/MSry"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-dy1-f228.google.com (mail-dy1-f228.google.com [74.125.82.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8178391823
	for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 19:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773345512; cv=none; b=KLMWcd179jPJnxsIjypY3YcxEbPRrgZrd3Q0aIrW4QBGVrzkiAiT3+TlnehbSniHL0pqluAXjtAQRkPKQGO1uNsyYj9HvYrtWWRxKiq1M0UeZIwKTNtvzPU50lk7GsCw9DUF9tfr5h678G5grQj94i0cw133d8o24zWJ7QV/CkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773345512; c=relaxed/simple;
	bh=vbMFUARzvp0PfCNYC5bSDWR25U2vCKBs/6MNeisjnr4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ETINBzNnGDdKQCZsDZz+/LEzDTNbPjGgy/8IHjRvAN6XCLE98Ugkp0efPjhtzA1rEYRBYCwGaMvOFQ2V0D7WVyT4gQ4trggNuoP0JHALCkauGgA+UKTupt18p+m2wPwlobi2kAD7e+ZcXr86qaarZkOslpxE7GjZvqBZgdI51/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=iFv/MSry; arc=none smtp.client-ip=74.125.82.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-dy1-f228.google.com with SMTP id 5a478bee46e88-2be1b5fe11cso2305947eec.0
        for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 12:58:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773345510; x=1773950310;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aH33HXDgBLC0TDGsvudSNDusu5GHwaK9ZezTEAleW0g=;
        b=gHblP9Bf9Qma3eRXpQC2SnC9BOWt18p94yA8DIPauZBXFO/J+3Jtcr9QGWREshlemi
         dJoGUUnC7QZpfG00O69YZX+9yG1GuBzPpWCgg/vgtxVM9R1bPfgSVRkPM8HyaFIvMJl5
         p31eci1TYe7aYOPewW7iTMW/G9LXIdTxpGncPRff3oLPUqcp72w9Uyo4bfWcHyYKodjd
         J0wlp69cRxs3JqCw4PfEntX6hhcP8YXEZ2PTIfdc7GMpAfm98EqMEu9ygdgD5p0Yi4EM
         Vk+8/WMj9z6fVL6nwSxMO/dRXnbOqnmUucBPRlYbiQNWYTKFmOGC/63Q2XsDLHVnwfc5
         EhHA==
X-Forwarded-Encrypted: i=1; AJvYcCXH/D6xgeVl7lc8gKcq1KTeHCn2Ai4ZzXU5aOic82myTU27IN0If9kACbAFeEQdoOROHdh4bATQp+E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yytm001zwRHhhasQgr1X+Oag9u5OgiyGbzK3O4PqHLEkOBpl+9V
	Ebgk9+VCV4FI6d4GRKGHWH7cO6yms00pVSlk0KCEIvhlIO2lRyUDLtx47dcrGojUvUREPeYBvH4
	SIdpD0Qma0ien3+C5GVE7pgjZCaTwg6BijD45ynPASPorHmK3psenNURrCC2RhWRum3QrmVusuX
	fOkj6LPvVYMtq1dBS4WbOq2nhssqq4fSuCqkdZzVOrRvfkSCbYKSURhnsKWFc2fwPtyMWP9bl3X
	lm7JrYZH3703pla5aLM
X-Gm-Gg: ATEYQzzMC42MK2gkdu/A2+Uj9Kpaagop3zQAxlY2n5oMphYB5WnpzyeG6gTX0qaz1Ht
	3vZlQwC/whP+cy/Ug1OKGz+CuFCnsi/Y4XwJNcV563elVvRs9+1aH5OP1Ed8G6R7CwwwkWk00cg
	Kfq+KKcBS7NeDA0FXJVNGgp3b9mKyk4ZcimDphu6aarlDNgj4e0LUOjFYWEnlU//ooOs35i7jDt
	eresJQ5iPLMKTRJs+wCXlsjPIOThsq1I4ncnJAahzGJ9fZxl6M+NrAN6pUyZncRMd9Bzdh1e8FI
	diNkMo6yiq2tgeujaItj19d2j87AFjbx2kcjitLw/aOiZCsKbilUt2rIpqaLesNdK/R4U1traFc
	TEnUORqZlvMHuQaikHrgDExw0I490ELrWzGO+IL7wD8QiU79cAzW1RkfzpPLYvB9Ok6vxFrmF9r
	IK/pnYPJiLCgk+JU8JCNvsMdF6ydgrBu39ibuwEVAzFTntIdo2RaCEyDRUvV9jm3Zc
X-Received: by 2002:a05:7300:6ca0:b0:2b7:13f5:43ac with SMTP id 5a478bee46e88-2bea5441b1bmr484388eec.15.1773345509760;
        Thu, 12 Mar 2026 12:58:29 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-117.dlp.protect.broadcom.com. [144.49.247.117])
        by smtp-relay.gmail.com with ESMTPS id 5a478bee46e88-2be8aa60fbasm477588eec.9.2026.03.12.12.58.29
        for <linux-usb@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 12 Mar 2026 12:58:29 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-128e8ac314eso568761c88.1
        for <linux-usb@vger.kernel.org>; Thu, 12 Mar 2026 12:58:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1773345508; x=1773950308; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=aH33HXDgBLC0TDGsvudSNDusu5GHwaK9ZezTEAleW0g=;
        b=iFv/MSryE0zDC1LGmNPj0pFK1pIO4egFeHEHzV3vNCfZal7ePouQSk4HhwMvVtC1pD
         vAQndB51KOprbkH4Ac/+53zA9M8u45xtF9eVW2gRZYt7zu3TfvaapTAZRuUttHmjLk4k
         RRQHGxeV/N+U6/IRHs5qlPBceRbvGNRB6cBHo=
X-Forwarded-Encrypted: i=1; AJvYcCVP2VeVIzpeWjtX7Q84wtW6hYijy7xbMZFbeMz/jlGDpzd+7sXG/d6zY23dauMfqKNiHIdccbh6Vzk=@vger.kernel.org
X-Received: by 2002:a05:7022:404:b0:123:3488:899f with SMTP id a92af1059eb24-128f3df165bmr327788c88.32.1773345507810;
        Thu, 12 Mar 2026 12:58:27 -0700 (PDT)
X-Received: by 2002:a05:7022:404:b0:123:3488:899f with SMTP id a92af1059eb24-128f3df165bmr327772c88.32.1773345507235;
        Thu, 12 Mar 2026 12:58:27 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-128e7b4839bsm10390373c88.0.2026.03.12.12.58.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Mar 2026 12:58:26 -0700 (PDT)
Message-ID: <1e31c714-ae8b-4d4d-95ec-b431606c5450@broadcom.com>
Date: Thu, 12 Mar 2026 12:58:25 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: ehci-brcm: fix sleep during atomic
To: justin.chen@broadcom.com, linux-usb@vger.kernel.org
Cc: bcm-kernel-feedback-list@broadcom.com, alcooperx@gmail.com,
 stern@rowland.harvard.edu, gregkh@linuxfoundation.org
References: <20260312190825.3596757-1-justin.chen@broadcom.net>
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
In-Reply-To: <20260312190825.3596757-1-justin.chen@broadcom.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[broadcom.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[broadcom.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[broadcom.com,gmail.com,rowland.harvard.edu,linuxfoundation.org];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-34710-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[broadcom.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TO_DN_NONE(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[florian.fainelli@broadcom.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: DC9A8278635
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/12/26 12:08, justin.chen@broadcom.com wrote:
> From: Justin Chen <justin.chen@broadcom.com>
> 
> echi_brcm_wait_for_sof() gets called after disabling interrupts
> in ehci_brcm_hub_control(). Use the atomic version of poll_timeout
> to fix the warning.
> 
> Fixes: ("9df231511bd6 usb: ehci: Add new EHCI driver for Broadcom STB SoC's")
> Signed-off-by: Justin Chen <justin.chen@broadcom.com>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

