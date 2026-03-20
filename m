Return-Path: <linux-usb+bounces-35257-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YPDZLw2FvWnQ+gIAu9opvQ
	(envelope-from <linux-usb+bounces-35257-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 18:34:05 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 6017C2DEB59
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 18:34:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5487E31DE374
	for <lists+linux-usb@lfdr.de>; Fri, 20 Mar 2026 17:28:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 48DDF3D3CE3;
	Fri, 20 Mar 2026 17:27:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="Aj0/GUUL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-oa1-f98.google.com (mail-oa1-f98.google.com [209.85.160.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBCF3D333D
	for <linux-usb@vger.kernel.org>; Fri, 20 Mar 2026 17:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774027659; cv=none; b=PLfGrnbbc8Yy/ulZu16aL/u965gNmS44WFtXChXr/gv9ENthgQC816tPyqDFxJfn2TymUGxcCE8cD5RTFYfs7ncCRK0du1V4Q3Ro6pY8z3gzaQpk65sXdCd0SZtpSYH6Fje3WaK60R3OJ41iG/Gkhs87gYlj3iDSxSq46fGTULI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774027659; c=relaxed/simple;
	bh=qXaKkb5BgZZUerzHkUgfDMUEywCtZJ+sYDJixcWJZf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lET0ntzP+TfCv2DI6wrQ/3ipIAjHZusPfBoL3ha4CUQkzBOceN3tmVNvG7G0BF5Fu3rbWWIWcZZU+gI3yozcBYj5VNnwcHvosnyKF8Gmgeh74+nHcNJVXBZt0k9PN2/DYM6g9IVu7srwKSFlSiC5C2t4GoH++Agt901ytdWdjEY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=Aj0/GUUL; arc=none smtp.client-ip=209.85.160.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Received: by mail-oa1-f98.google.com with SMTP id 586e51a60fabf-40438e0cba6so1556018fac.1
        for <linux-usb@vger.kernel.org>; Fri, 20 Mar 2026 10:27:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774027656; x=1774632456;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:dkim-signature:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CKP71x/++4pQvq3tI+ULuQpkGb0IP0GOE4TwGEhpRlU=;
        b=SLZY3jXNQHL1sVMtC6UrTKIhbTCqdv4uWE3SpeTiHk4FFLcINx62qzhVpsFvL0P0VA
         fmHfLAgYwDJ0rEWdc00d3H01Ph7iShP5tJk4S7MyzGeqA334rYBR22osd2pWqO2y8CqQ
         p1eTSeqjtHmYVww+53hQ7JeXhWuIk0VJyOZMavWuIaNI4rHn/n60nL41c7CKKTrqZunb
         aGJ/UPjZq1PLPDty1ta5f34bIsyAO9QRUyX5TMeP+SlQZ1bnzp5dJB5BSQFC9JmrzBfv
         PtOCzzQR8XeL4nQ0N9nQ74wzwJDRof34Dol8W67WRB9xwKYBsmVeUasLBZB7x7ZvKfXl
         Z9jA==
X-Gm-Message-State: AOJu0Yxt1HCS88JumsfOoJlPKoOUy21k5jDBDyISdREFJxGdZaNnJH1W
	nwJONLguaDHKDtewYBTlPCt60xRNSaP8lz4JfQJI2Cg4k/Y6Zq1SnZ0uu3pGPvh2rxNna2MEAnI
	JQ8BpeY6RZlIEWerO2EMIWpFrJj3DMVtaxwXh1BMfCxBDNj2l4zy/Peuol8b/oel7N+5pp1g5bQ
	6edfKn9xxfh+vwCsOU3/p+/oDa6IrJKhaXS8XhSw4F/j8+NCy+hAZiFQp1ItxKf6KE1vf5Gu5dr
	MHYsr3ynwyB5vOErxQY
X-Gm-Gg: ATEYQzxs/EsVUTcyCX6djurI12bJwT+1xIUUhM1XMecYodMHwtbF9VHcwH9B3VXoR41
	6uediINsAb1E+ohfP2YepTQicy1WGUC44P5fV+ZmDUlKfcUX4vQqhJ04bXJgtFqzC3W/wf0gyuJ
	bjejZBiQJ5WyvgD8derA/5f4xk1t9KJCgb+ZzTJO/9Oh860NCzWqYcWmYir3fxvgl7VPUyo8VdW
	EnGo4dnfzyO393+qb5SMHGxhdqaTYtqVPC8WXz0oXTxlpifblYjqDUs/hnhYHT/KqlUxZQIiytT
	383S5Tt4vaLsf0ZrxHaN6panHWlpCNzLvyiI5pwMi+eELOmLM+M5HxJFf1oewtpjtaiB2HV3OCC
	YJB/HJf9IZULlnXtlIJWU70VYYr39s0BmYo8OkB4H1txcdsbTezSvoLXK9cnv1PhPwz1zgt8H9E
	qjnd0EkPgep/LKOo0XqmQ2UOCCD8nrC5Wc/jiYugDJ0GdVfQBlVBejmabLZve9WFT7
X-Received: by 2002:a05:6870:b05:b0:41c:a7b:a8d2 with SMTP id 586e51a60fabf-41c10ee86f4mr2421809fac.5.1774027656360;
        Fri, 20 Mar 2026 10:27:36 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-102.dlp.protect.broadcom.com. [144.49.247.102])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-41c14e0a584sm409650fac.13.2026.03.20.10.27.36
        for <linux-usb@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 20 Mar 2026 10:27:36 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb706313beso339069185a.3
        for <linux-usb@vger.kernel.org>; Fri, 20 Mar 2026 10:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1774027655; x=1774632455; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=CKP71x/++4pQvq3tI+ULuQpkGb0IP0GOE4TwGEhpRlU=;
        b=Aj0/GUULVrLAJj9Iiq1n+tO5pxlMIqRn8IIcAS8ZZIeNoR+6JDvvfz9EHqohF1/Fwl
         dh0Tifklvm5BWTEzbQQL7CAMAAFaj1jSJDGu/CcYiWP0QDoVeW4EFDmf+q79U4GjUFuA
         kTV/7+vxr/JsQ9shlnWSPKy9PUI+gDt9pRXBo=
X-Received: by 2002:a05:620a:7011:b0:8cb:4ba9:ccec with SMTP id af79cd13be357-8cfc80ab00bmr558649485a.72.1774027655275;
        Fri, 20 Mar 2026 10:27:35 -0700 (PDT)
X-Received: by 2002:a05:620a:7011:b0:8cb:4ba9:ccec with SMTP id af79cd13be357-8cfc80ab00bmr558644985a.72.1774027654659;
        Fri, 20 Mar 2026 10:27:34 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc8fc7dbcsm208788085a.21.2026.03.20.10.27.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 10:27:34 -0700 (PDT)
Message-ID: <be887a5d-ec3c-42a4-9682-d16d29a2298c@broadcom.com>
Date: Fri, 20 Mar 2026 10:27:32 -0700
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: ehci-brcm: fix sleep during atomic
To: Justin Chen <justin.chen@broadcom.com>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, bcm-kernel-feedback-list@broadcom.com,
 alcooperx@gmail.com, stern@rowland.harvard.edu
References: <20260312190825.3596757-1-justin.chen@broadcom.net>
 <2026031801-spinster-scraggly-7504@gregkh>
 <df80ab6c-69fd-4473-ac1f-2819e5d01e1a@broadcom.com>
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
In-Reply-To: <df80ab6c-69fd-4473-ac1f-2819e5d01e1a@broadcom.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[broadcom.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[broadcom.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,broadcom.com,gmail.com,rowland.harvard.edu];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35257-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[broadcom.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[broadcom.com:dkim,broadcom.com:email,broadcom.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[florian.fainelli@broadcom.com,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 6017C2DEB59
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 3/18/26 09:31, Justin Chen wrote:
> 
> 
> On 3/18/2026 7:14 AM, Greg KH wrote:
>> On Thu, Mar 12, 2026 at 12:08:25PM -0700, justin.chen@broadcom.com wrote:
>>> From: Justin Chen <justin.chen@broadcom.com>
>>>
>>> echi_brcm_wait_for_sof() gets called after disabling interrupts
>>> in ehci_brcm_hub_control(). Use the atomic version of poll_timeout
>>> to fix the warning.
>>>
>>> Fixes: ("9df231511bd6 usb: ehci: Add new EHCI driver for Broadcom STB 
>>> SoC's")
>>> Signed-off-by: Justin Chen <justin.chen@broadcom.com>
>>> ---
>>>   drivers/usb/host/ehci-brcm.c | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/usb/host/ehci-brcm.c b/drivers/usb/host/ehci-brcm.c
>>> index 888e8f6670d2..5e3156f94cc6 100644
>>> --- a/drivers/usb/host/ehci-brcm.c
>>> +++ b/drivers/usb/host/ehci-brcm.c
>>> @@ -31,8 +31,8 @@ static inline void ehci_brcm_wait_for_sof(struct 
>>> ehci_hcd *ehci, u32 delay)
>>>       int res;
>>>       /* Wait for next microframe (every 125 usecs) */
>>> -    res = readl_relaxed_poll_timeout(&ehci->regs->frame_index, val,
>>> -                     val != frame_idx, 1, 130);
>>> +    res = readl_relaxed_poll_timeout_atomic(&ehci->regs->frame_index,
>>> +                        val, val != frame_idx, 1, 130);
>>>       if (res)
>>>           ehci_err(ehci, "Error waiting for SOF\n");
>>>       udelay(delay);
>>> -- 
>>> 2.34.1
>>>
>>>
>>
>> Why is something that has been around for so long just now suddenly
>> being seen?  What changed to trigger this?
>>
> 
> The edge case occurs in rare occasions and predates my time maintaining 
> this driver. So we just so happened to run into it recently in our 
> tests. Guess in the past we just never hit the edge case with the 
> warnings enabled. I had the same question when the warning was reported.
> 
> Will fix the Fixes tag in v2.

The other thing is that recently enabled CONFIG_DEBUG_SLEEP_ATOMIC in 
our builds which is how this got caught, it was not the case before.
-- 
Florian

