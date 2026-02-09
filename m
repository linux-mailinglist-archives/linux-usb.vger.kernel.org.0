Return-Path: <linux-usb+bounces-33203-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yIypC1b2iWl7FAAAu9opvQ
	(envelope-from <linux-usb+bounces-33203-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 15:59:34 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id C767D111552
	for <lists+linux-usb@lfdr.de>; Mon, 09 Feb 2026 15:59:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id A059B301DD8A
	for <lists+linux-usb@lfdr.de>; Mon,  9 Feb 2026 14:59:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A904737D126;
	Mon,  9 Feb 2026 14:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GCn7TNxA"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E2E37C106
	for <linux-usb@vger.kernel.org>; Mon,  9 Feb 2026 14:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770649164; cv=none; b=Fx8PwQkmcKWp5Xvq8e7sES74OJ9P9jkm/8xzYzI85L1uhMsbPdugYAgr7I6TrkJwk4IWaiAtHFgEX/eArwRUMGX0073V+UtwP2FRQtvPyj4A7OrFOBsSUEHl0D/+vvdQVxkyK9I6NtH25RgEb1yrZQbCPtlmGEE2e3d+IJ3UX+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770649164; c=relaxed/simple;
	bh=WLVJv5ugIhf3VIIc7NthdDs9sjWvcntd5T03Up5qFVk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=CKzNTTMnfoUFtwFifqvQXJEY/Zt2uFt1jTxAt+meAxuQvQOQeWtSgytsOeKtXjOdA+SSBg38Qkwn1Uirm5Ma7wItYXhi3axQt6IAGLwBkRF1zVIw7FR9JDGf/Pbsfjsxg464LtCCTqLzVBKeOBsIX5tSL5UufSNs57nhx1awuoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GCn7TNxA; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so46090175e9.1
        for <linux-usb@vger.kernel.org>; Mon, 09 Feb 2026 06:59:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770649162; x=1771253962; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TzlX62O2iHtDoc/wlp70TM/0Ovim/AGV2yahkY72zas=;
        b=GCn7TNxAhV7JVuZCQEXpIBPGk0F78lMJmLJMuOJgNtwmeNNbnh9PLCRgx8++yQNWTq
         BlczZkEtZTRiGASZvD1akuZrsEQVayDAcUD1yY+6exZENMCXQXdSAwh1mzh75FccSHwa
         pR/LFdCzQuIBQ8F2BdOfzRyBnVMq7/lWUc1THzkyoOFsE28kSX5IrS/WtynoaCwyMoyH
         hr7UPLMuS217FHUjTs9dS6+8XF+vLiUAG0WeOG/MkleX3WjSWZq+thky6hYNOdOQZX2n
         p70Xh8VJF/LyzhRxNp20dhfGK1ogOfrzI+3EVG+oQKdg4PKOG81g/IfonGk6jHSIu+Mh
         tekg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770649162; x=1771253962;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TzlX62O2iHtDoc/wlp70TM/0Ovim/AGV2yahkY72zas=;
        b=N7nD/TsVAI0Gzt3N6OokJNoVGm5Ly9AD5XtqsR5JDAqI1BDwszf2fXlkJj0SDynaor
         KqvmuKK3U3OcuFPAhLsws0vFy0PBSQQJxG+eKVvOrFOl9sJceM+J251Hu9i4R30BMTqj
         FHkfO81J5/zfWKC/rM8+U8CXg5AEiZaxgImoujfcJ2kbLZkPMYTyXggMtRlwmhFedxRl
         G8cQzU88qg2nMBsdpp8Xk9tHKuq08gcNCu/FN462uzjZ27DXwjtwmIX12odXM267LjpC
         M+OnTfYdSkW6YRW/xR4vysYPtdzWlfT++c0c58mYnbaneiXNw5PZGFbq2acJtxAGESHP
         oSlA==
X-Forwarded-Encrypted: i=1; AJvYcCV0UZ4DLUJaNKKt2XRBeA7sD4QlEyBigVX38WKL7+pLrE8cClSSZ30Yi89iKd788MBWUa1CMknTQmM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyqsKTK1ezGviO7NkxPEcYTSDi8kbiXdUOujZGz/Z8ljLv5+cR
	PEUnUQ9E7dSGFn9J/tweCtxvIyd//k89kguyEm/zqI9qs+zjfk5v+g2h11EguvNwu0U=
X-Gm-Gg: AZuq6aJOQIB9tGrEdrY/kRFHZT74r2BWNfkm5mXgFDRLmmdzlV5PURZ4nFFjewqQybJ
	6d8kCrDgPPiEiqgN3epdBw4swo/VM2wksdg8vzxxgBT2/KvSTs7s3VoLHOkSuy6QWpp0I4tB+kX
	JdKj2tIN9EpvW8buRxrH/mj69kHOhvc+G+m3K5paVf530JcvutJh1b2tkpb0PlTORgUfgwc58A+
	NA3mD4AY676XlPM8GZNKoDGFdSc74J7uq4OG6kg3MCgbIZKaN5DdWWpDtWbGALAZcYzrVFUqnCS
	sM3Gmugnsozb3iUPvS7iMzO3sCNoU1QvrY2R9X6FwSJBm/47f4S8sqe/Ho4TY5yoXvswAPDAYiQ
	q4AaiGoZStg8MaJuFM3t1/5gr/0wWs88Qir0TRKTu6siolaUf3Gca1/ZiXXhAZ7wI/fTKoBUls/
	hau1R1OgWZYMMhfgWmLP2WKhvqW8Mz8B8uYJsyX4kRtlrrmECOg1iXa2Eix9mK7wo=
X-Received: by 2002:a05:600c:8719:b0:482:eec4:76d with SMTP id 5b1f17b1804b1-4832021b461mr184052445e9.17.1770649161961;
        Mon, 09 Feb 2026 06:59:21 -0800 (PST)
Received: from ?IPV6:2a01:e0a:106d:1080:44e3:9198:bd5d:a3f? ([2a01:e0a:106d:1080:44e3:9198:bd5d:a3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4376bd5a074sm10377353f8f.11.2026.02.09.06.59.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Feb 2026 06:59:21 -0800 (PST)
Message-ID: <b46da4da-93aa-4213-ad75-ec7709008b95@linaro.org>
Date: Mon, 9 Feb 2026 15:59:20 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v3 4/9] pci: pwrctrl: generic: support for the
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>,
 Bjorn Helgaas <bhelgaas@google.com>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-arm-msm@vger.kernel.org
References: <20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-0-5b79c5d61a03@linaro.org>
 <20260206-topic-sm8650-ayaneo-pocket-s2-base-v3-4-5b79c5d61a03@linaro.org>
 <fbxbnou5mdlhaq5dpxr3wdzmjetwdp7auaaqeunc67tgk5ej2m@cnnkr2pcwy77>
 <a4e55e91-0e03-4e63-8542-d8ad61b38906@linaro.org>
 <o6e5qygss55p6npjgaicxffsqdpv7kojgidr46zinsvfpxfxug@vn67nq4k6jzk>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <o6e5qygss55p6npjgaicxffsqdpv7kojgidr46zinsvfpxfxug@vn67nq4k6jzk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[linuxfoundation.org,kernel.org,glider.be,gmail.com,google.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-33203-lists,linux-usb=lfdr.de];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:mid,linaro.org:replyto,linaro.org:dkim,linaro.org:email];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	HAS_REPLYTO(0.00)[neil.armstrong@linaro.org];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[neil.armstrong@linaro.org,linux-usb@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb,dt,renesas];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: C767D111552
X-Rspamd-Action: no action

On 2/9/26 15:49, Manivannan Sadhasivam wrote:
> On Mon, Feb 09, 2026 at 03:00:02PM +0100, Neil Armstrong wrote:
>> On 2/9/26 12:30, Manivannan Sadhasivam wrote:
>>> On Fri, Feb 06, 2026 at 03:50:32PM +0100, Neil Armstrong wrote:
>>>> Enable the generic pwrctrl driver to control the power of the
>>>> PCIe UPD720201/UPD720202 USB 3.0 xHCI Host Controller.
>>>>
>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>> ---
>>>>    drivers/pci/pwrctrl/generic.c | 4 ++++
>>>>    1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/drivers/pci/pwrctrl/generic.c b/drivers/pci/pwrctrl/generic.c
>>>> index 08e53243cdbd..4a57a631362f 100644
>>>> --- a/drivers/pci/pwrctrl/generic.c
>>>> +++ b/drivers/pci/pwrctrl/generic.c
>>>> @@ -73,6 +73,10 @@ static const struct of_device_id pci_pwrctrl_slot_of_match[] = {
>>>>    	{
>>>>    		.compatible = "pciclass,0604",
>>>>    	},
>>>> +	/* Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller */
>>>> +	{
>>>> +		.compatible = "pci1912,0014",
>>>
>>> No need to add the compatible to the driver. Just use the existing compatible as
>>> fallback in the binding/dts.
>>
>> ???
>>
>> Sorry but this is insane, in no world a standalone PCIe USB controller could be qualified as
>> compatible as a pciclass,0604 slot.
>>
> 
> AFAIU, 'compatibility' implies that the driver can safely fallback and would
> still work. If we add dedicated compatibles for each endpoint devices, then we
> will just keep adding forever. Powering up a PCIe slot and an endpoint device
> are conceptually same.

We're not speaking about driver here, but about compatible string which describes
a device, a PCI endpoint and a PCIe slot are 2 very different devices that are
nowhere compatible.

> 
>> Technically it would work just fine, but "compatibility" has a meaning....
>>
> 
> I view compatibility interms of device operation, not device as a whole. But
> sure, I could be wrong. If the DT maintainers say so, I won't insist.

In the actual way it's defined _today_, the "slot" and "endpoint" power up schemes are
compatible, but I hope the slot bindings will get much more features to describe the
real world slots power properties. And no, endpoints will definitely not have the same
features as slots, using it as a fallback today is an error.

On the other side, adding a "simple-pci-endpoint" compatible that enables any supply
and clock would be a good solution, if the DT maintainers agrees of course.

Neil

> 
> - Mani
> 


