Return-Path: <linux-usb+bounces-35345-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CLKQD36SwWnuTwQAu9opvQ
	(envelope-from <linux-usb+bounces-35345-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 20:20:30 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A612FC18A
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 20:20:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E0BA4301D4DC
	for <lists+linux-usb@lfdr.de>; Mon, 23 Mar 2026 19:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E46935AC33;
	Mon, 23 Mar 2026 19:20:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="FXmZwx5g"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-pg1-f225.google.com (mail-pg1-f225.google.com [209.85.215.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14CE35A939
	for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 19:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774293623; cv=none; b=Ln+CKEONe1HAchDkb+BURITYjfRJ/X5jBrJQqkLrQ+3pqdhm+3Ih2uIWlAeRlnwN3gbYM4XPDq18qu0R11kp01i7zKc8JVbOXt39H1NZUt2++8bWxpKFyCXbTJIzcZDUz/fSD5NQil4kaQLOSad01MmdypzQfCcGd+A2KGp5Zb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774293623; c=relaxed/simple;
	bh=5j2acjUK9qWE3CdK5ZDcVXTvKZ3aXiXIMMGHyMU8NzE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mQj/wEFG8rKmeaB2rQGw3XMtl2+/7saORjfvARR9EnPbWNcc+HcmcfXqix+bGT4XIl4kFiAgOMZ/B9rvIqrzVLoPjnJCZ4Wnoeu4noi4xGzBXrVBmg5UcnI2zo8gHQqyGsvZvXy/HW4n/pKIpgBgCgs5TF3sjWVV+uLbO5xqed0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=FXmZwx5g; arc=none smtp.client-ip=209.85.215.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-pg1-f225.google.com with SMTP id 41be03b00d2f7-c73fbdd9b53so1410361a12.3
        for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 12:20:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774293621; x=1774898421;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gCb6FHMzlP/DUW4L50D2E01C/t7DNtpTd37SVqfd3Kg=;
        b=l1crSEpRGVrbC77u2kv4+UcCLWXClXNjaC8rfUGpG4mkOjXuHWuGfWKsIJgbCWa8ns
         Q8opO+N9fpZGZyptwqNbmKOWUeu56sm6aztJf8YotCRkOOStQ2O6+5MUek/82Vkn4U5b
         zGWhkifglJyJVPXHi4qKshJWx933z0vObOiGYJ1nJdMMPdJITS7dylDVLNSuhd+Kj97+
         Iy4s1YYtqhWRMJro7PRMuzwcRwjjl4aqJc++ZvO18fCI7GO5pOZRaHQU1DvDGm3J0nmj
         Pdw8oRFK2Kdrj3guodqlzOTU3qaQOddadvWkIfSuQoyt8sgdASZsZiJ4RhCxdeL3DFHX
         mY5A==
X-Forwarded-Encrypted: i=1; AJvYcCU19uEyXRnYjEecYsXJjjqzhS6Mu+x8fUrc9gZZmnBAjhYCreYeecMS83465mD7ncCJYkuum2Rc5v4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzafOtF/wFU5yB+3rDOa4PkKM7/pUHLDfovdiI3VWoFr6ReiG5V
	GafJj4zbrUnVM//AFWPZMHTmEKJe7GmPeCTKCg+0biBumklmfVXVioqcn/Xx0sz6ia2w7ztkIgH
	/IFfmGE2dFUSRd68KmUJWzYz84BChdryAYGE4AoKhAg3bhSXAp2onjxzRNPoxKt6JqCbu629U3o
	s7dQqotyL0Ts9FuaESh21ze1OhuTPaIV6LZjBGhWt4epg7wiRNL8bcabwIL3hu9oam+6pUW3YzE
	psQfHeH3o9XwAIyEjvj
X-Gm-Gg: ATEYQzyoAx0bJZU5xHOP8mUliGuXFpYoYgUjPeZrFvvbLybFl8KR/qn8DOmx8kHlqpZ
	R4a7KEK+RKMaqpRj4wXqF/JDbCUfNxbzdBRs/0xZ8rVcnfLkI079anCbs7GJf0bE+6xvBZi0wme
	DUCFDlXFw981n4vkft8+b+8o+JC5cBr/Vypr2x4D4j8KwsuPb9ZzpUt9zCPdXRyvAJgGiiKQFw4
	lcFU+9cxpSCyt/Ptegqbwvgu/RSLJGMgzEW/jfMbCX8KIus13H9x6k09sTJUujuCwGFWNWg+cIy
	tlZz+zYD0yGAX0Mt9vfiX9vg9pshih4dy+OVxdIaI5tszFqx2QvnQFIf5gX1S9d4L6XpBBP0P1F
	sbh+V03LXnm4l4Ia71KCaelpWt32llf/jPg8N1Kw25+IOuvZ6wJac2HQ5rMQUqM2lm5D0yTtPpp
	qqi4kIEZZCgTMZXyugDB87CISAkLIdqgT755W5KE94Hqg4ahpKFa5DiZvt7iV2KFP5
X-Received: by 2002:a17:903:2449:b0:2b0:5ec1:97c1 with SMTP id d9443c01a7336-2b0827107e7mr137130925ad.7.1774293621079;
        Mon, 23 Mar 2026 12:20:21 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-102.dlp.protect.broadcom.com. [144.49.247.102])
        by smtp-relay.gmail.com with ESMTPS id d9443c01a7336-2b0835d9320sm15162685ad.30.2026.03.23.12.20.20
        for <linux-usb@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 23 Mar 2026 12:20:21 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-128d59030d0so2130782c88.0
        for <linux-usb@vger.kernel.org>; Mon, 23 Mar 2026 12:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1774293619; x=1774898419; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=gCb6FHMzlP/DUW4L50D2E01C/t7DNtpTd37SVqfd3Kg=;
        b=FXmZwx5gRfbo58meQ0yW1SzbAXQYuW2WSfwaldENucIYSvcor+4h5uDW9DC8sS5ys5
         7fRmraK7h3lvc9E6K9JcuBUMtfnqVVVBbbZi9lWrF1jRgIF138ZUTm10y8DE/tPUlQWN
         umgskz2LPXXznJkPywbxrKoeJu86MFtNK2GgM=
X-Forwarded-Encrypted: i=1; AJvYcCV/g9tbU9tFn4WaN3mYuB3fv5FNPlCqD+OOSChoU04kchKUKpYqXaFmTLoEOmzoUYL0rK1qIP22r4M=@vger.kernel.org
X-Received: by 2002:a05:7023:b15:b0:125:be41:db5b with SMTP id a92af1059eb24-12a726f897cmr5885433c88.42.1774293619364;
        Mon, 23 Mar 2026 12:20:19 -0700 (PDT)
X-Received: by 2002:a05:7023:b15:b0:125:be41:db5b with SMTP id a92af1059eb24-12a726f897cmr5885420c88.42.1774293618766;
        Mon, 23 Mar 2026 12:20:18 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a734bbbc5sm9925004c88.11.2026.03.23.12.20.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 12:20:18 -0700 (PDT)
Message-ID: <89a5cf0e-444a-42d3-b7cb-49ce2560995c@broadcom.com>
Date: Mon, 23 Mar 2026 12:20:17 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: gadget: bdc: validate status-report endpoint indices
To: Pengpeng Hou <pengpeng@iscas.ac.cn>, justin.chen@broadcom.com
Cc: alcooperx@gmail.com, bcm-kernel-feedback-list@broadcom.com,
 gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260323121730.75245-1-pengpeng@iscas.ac.cn>
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
In-Reply-To: <20260323121730.75245-1-pengpeng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[broadcom.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[broadcom.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[broadcom.com:dkim,broadcom.com:email,broadcom.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,iscas.ac.cn:email];
	DKIM_TRACE(0.00)[broadcom.com:+];
	FREEMAIL_CC(0.00)[gmail.com,broadcom.com,linuxfoundation.org,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-35345-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[florian.fainelli@broadcom.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: A8A612FC18A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/23/26 05:17, Pengpeng Hou wrote:
> bdc_sr_xsf() decodes a 5-bit endpoint number from the hardware status
> report and uses it to index bdc->bdc_ep_array[] directly. The array is
> only allocated to bdc->num_eps for the current controller instance, so a
> status report can carry an endpoint number that still fits the 5-bit
> field but does not fit the runtime-sized endpoint table.
> 
> Reject status reports whose endpoint number is outside bdc->num_eps
> before indexing the endpoint array.
> 
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Reviewed-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian

