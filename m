Return-Path: <linux-usb+bounces-13902-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7E095BC2B
	for <lists+linux-usb@lfdr.de>; Thu, 22 Aug 2024 18:43:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BB1E5281A7A
	for <lists+linux-usb@lfdr.de>; Thu, 22 Aug 2024 16:43:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2B6A1CDA3C;
	Thu, 22 Aug 2024 16:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="hgqDK1MK"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 973EE1CDA1B
	for <linux-usb@vger.kernel.org>; Thu, 22 Aug 2024 16:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724345021; cv=none; b=bn/9CBoPjS1xdfeWD2zutvvANhtwDdT0rvztzfEQ6eJudaYKM2zfy0yL0+7h8MXMSWxQbt+0fiQQCHssGcOb92B0LM5mCsDzQQFt25rvqfCRELuoluXE3pnH972j3yWv/Hsr8ibc+f3VORRxnUSWLgVXO6D62vMRlm/VJmzhB9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724345021; c=relaxed/simple;
	bh=vUV+6eQAPuNrLhvow2mnEQrXqT4STDw6iajrWO5TyOY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rTP9hGDwhBk3ESlVZTnNOSJjwtzBIg37FD6/Nv2rkUC8QrhXfmGOva2qZsNVP7F2EGS3ZJSOOPPOZsUfF9Ej9hi7dPQrlqQHBwNZwAZ9mtRX5RtIenJWWLxzgtAATwI3StwtQRImZnxCnHpjUMW0D+BkjP/jOKhuCe1/LfmKTEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=hgqDK1MK; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-44ff7cc5432so7542771cf.3
        for <linux-usb@vger.kernel.org>; Thu, 22 Aug 2024 09:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1724345017; x=1724949817; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CPKTbaL/FXWM3w7cKHQVTv5E900J5Zpuy86Fh8cTkTA=;
        b=hgqDK1MKFx629kulPWT20zkt9EtMjrg2YqW/iIntvFQs3qUia/NK1N6gEe/NPbwrfN
         YAC54wr5gGNW3xbxWBv/3l4x3oDvaD6YHjmzd08BwaEPZGsVcP+XekGvay6Gzb793EZK
         ItzF2dPePjHOGBw6mPC5TMyAHK2E1rFg1fAro=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724345017; x=1724949817;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CPKTbaL/FXWM3w7cKHQVTv5E900J5Zpuy86Fh8cTkTA=;
        b=d5ooSoslAzHhTUVyo6UQ6HYYGMdesvjOby1fqLnyQGZyIw+2rdV+oMFqAKIWlm2G1Y
         qndpZYiAC93ca5yfD4VaT74sVu/GW23SgNOu2oWXSDjYicXy014DbF62PVq1SRionzW4
         TnE8R3pY/ESi/cRUmPGEaJWRRPURvOuXbMEPzwGeU5ML2L42j5OROfcGG0PD/nS5snT5
         uCNNPBCNs86Tvw7c0cLuiKs9TWlwYKannZWjeXm5GPwdea5vk4nzT0ieK68Ha3Bpe3uB
         FAryzLqIeFnggzf8vglkEDuRCbx33d2V9cLQYMmL/94NE3R0tbYq7jrM2Dex1UFQgZYC
         RAfw==
X-Forwarded-Encrypted: i=1; AJvYcCXq6ik3yd5psTc+YOgAcPF0eM8MZNs//r0gHvJxMwcZq8uMjzBwg4+hPaQrmh+JQ25NsbphCSjBD7M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUK/8dFQb72J/SUY4CSuV18mUDNZQ4oy8OR7d3bRWKWa/98kE9
	w4RUAxTDdals/MkwUiQ1gWxkVg4De46gIsLqSdRLh7wjv9BIgJK+3ewm2YgrLA==
X-Google-Smtp-Source: AGHT+IEYJJwdiO3Jqfsdb3UAdLIpYety34m3zyGBgW4qPYBS7AMDrTw8J9qY1DAMEaAZwqZQYR8DpQ==
X-Received: by 2002:a05:622a:22a0:b0:446:59ab:5695 with SMTP id d75a77b69052e-454ff8ea1f8mr24628841cf.54.1724345017277;
        Thu, 22 Aug 2024 09:43:37 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-454fe1c5646sm8295381cf.94.2024.08.22.09.43.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Aug 2024 09:43:36 -0700 (PDT)
Message-ID: <4d66fe35-0e91-4252-96d2-95d8c94968db@broadcom.com>
Date: Thu, 22 Aug 2024 09:43:34 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next 2/4] usb: misc: brcmstb-usb-pinmap: fix module
 autoloading
To: Liao Chen <liaochen4@huawei.com>, linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org,
 alcooperx@gmail.com, bcm-kernel-feedback-list@broadcom.com,
 heikki.krogerus@linux.intel.com, stern@rowland.harvard.edu,
 justin.chen@broadcom.com
References: <20240822130113.164644-1-liaochen4@huawei.com>
 <20240822130113.164644-3-liaochen4@huawei.com>
Content-Language: en-US
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
In-Reply-To: <20240822130113.164644-3-liaochen4@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/22/24 06:01, 'Liao Chen' via BCM-KERNEL-FEEDBACK-LIST,PDL wrote:
> Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
> based on the alias from of_device_id table.
> 
> Signed-off-by: Liao Chen <liaochen4@huawei.com>

Acked-by: Florian Fainelli <florian.fainelli@broadcom.com>
-- 
Florian


