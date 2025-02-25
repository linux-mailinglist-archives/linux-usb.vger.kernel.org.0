Return-Path: <linux-usb+bounces-21038-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BEB55A4408D
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2025 14:20:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CACB4172C8D
	for <lists+linux-usb@lfdr.de>; Tue, 25 Feb 2025 13:16:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37826269826;
	Tue, 25 Feb 2025 13:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IuQK7vOO"
X-Original-To: linux-usb@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E11820AF88
	for <linux-usb@vger.kernel.org>; Tue, 25 Feb 2025 13:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740489379; cv=none; b=ZXmEDINjEzIN73kE6DVI+fMS8KaMjBiktdTeyUm63qu/jE2hajL0R+eJlEBgMTWmIBF9sZqjAw7syT5IrMMQOWg1zg5C83TFJFpW1Na8NLqjl3mEYYpo190tesnOoNQlBlrNVWK7upVFB0xFLX9uddNaKrg7rthL0LCU7P1fkWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740489379; c=relaxed/simple;
	bh=qOXC1JCfflloHvFEyhnlYF5k9jijq3i5BPgiH4ZFlUc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W+qLvjBA0FI+7LnbJE4EC+VsoB1mc7vAgcqu6bLWXD+Byt4D/q8WtwoFunsUSL2tgN+GN5e9jVYQKTfPxYQwM+YTKLyQLkTWQSCDkTw+1WhXXBaiiIEvvu9QqhyTJ+csjat1cPU/DK2LejGGSDlzadoWvQLm5f9OcFvTjHn3vVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IuQK7vOO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740489376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FDdQ5865PcUkpASowBEaf7MEBhJrkqmHB1ewBf2p/X4=;
	b=IuQK7vOOaiWvHpgqWwclvZoUERpDJR3Vmo331TgYC8FVWh9g9wmucWKnoJPyldsS6zJUNe
	hYVXL5UGZ7lFsSsvOZz2KDgq61KI1qFt6YmkTyuUrm1g9r3Any8HebRY2PdGXhBS13Q1yp
	OnoJLeuOZ/VirPq53Qv/sjgSLcuMFyk=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-65-2SkfFN26PSWpTnnnym1VFw-1; Tue, 25 Feb 2025 08:16:15 -0500
X-MC-Unique: 2SkfFN26PSWpTnnnym1VFw-1
X-Mimecast-MFC-AGG-ID: 2SkfFN26PSWpTnnnym1VFw_1740489374
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-abba6d94ae4so983669766b.1
        for <linux-usb@vger.kernel.org>; Tue, 25 Feb 2025 05:16:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740489374; x=1741094174;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FDdQ5865PcUkpASowBEaf7MEBhJrkqmHB1ewBf2p/X4=;
        b=QhDEwSCqSN/sgx6DGd9JBMp8q9x3wSKj+mm8IlNnQv+3XZnayQQQqk/5RCAxCFyQx9
         EyiPiXk86ko1pkJmvCDYpQAANGL+iMLUe7NAzrA1w+Y0Hk7UfmHMvlbqIdbTO/hBFbaE
         azUv2lSQWQYopznon3VjpKmPWhEeK8pqVT0Ox6hL5/O+ca6W4wb5QaIoJMtopRd9y+zy
         qYC8sAIBeTdFey4AnQoCpiFd0VDqYGHrgkxbs3IEYPWyHWqmbv94zLRO+XXIRVKIhVmd
         keoatbsp/pE+bjfiH8MTpY8wDKBGsBXsciYFfkg8QWwPuBfQ3TBJVwPpGlaKsJVbvE/e
         yOtw==
X-Forwarded-Encrypted: i=1; AJvYcCWNGJiI6cNADHyZnqMrXZ/nNDhR4TkKi5aUNpzm2W08Cox49mi4xW25oj+N/5S1YRJyjL2rZEPvVNc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/upPJRNF6NGMoLhT8RZoTFIG555FIVVacKbhxIgRXZ5r/ktgj
	mm3eNldzxPbjMRZCXxMPwZC/weCjPIayhaQWEFMQUlvnK9J1ySQJl3WjdPik7f4pfnsWOvZFKX2
	I6WuoWOuuLEh5rMqaTZlgFYgaJyhajf/ofD2x1LLv7u5KTpQ0VaES54UeiQ==
X-Gm-Gg: ASbGncuZAeUxtVb1SabX/dQJyeSLS+ikBC333IHfPcLw2Wj+sSTb6ubhV+ylVSZbZvT
	9Z85o+iEl+R2GX7QQy772UUuVCuXh03zq7EPVr+TPwmza/NAtOAxbtE1PHvKoOK5WHl/nw/J5EN
	gM1lS3xuBYrKzoYuwz4osxGwBq6DDTUwprmZguIpAwcmxQJPLYkEGcC1mtHI/6YL7OOJPkFAE8r
	lIymnqdMuYbn0CzfAcmVzxhjkzE1jZxFAribYNpDWClWOHokXHA72SxykTWEwKx+aziZMwxdtEC
	dy7RaC/J39DFXYffJo9XvsvjRNprbyTOmIjCI8vSB0k+q9jyNyHleqtn6UH7iWR5d1UqnTUBS/G
	hlvIfYdxJUcFa0hll3a57LH/hlMwSm7wKER1ZrVi007flKut6sD9Patd4fNiqF1y7cQ==
X-Received: by 2002:a17:907:96a5:b0:abb:c647:a4bf with SMTP id a640c23a62f3a-abc09ab0c3cmr1650992266b.23.1740489374202;
        Tue, 25 Feb 2025 05:16:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF8Huvoo7UhuX++Bwcz+4yYSyekZGfuo2owJoX/ZLlbS2CDtchThnK8UMzHdJHp9qhhK5TgUQ==
X-Received: by 2002:a17:907:96a5:b0:abb:c647:a4bf with SMTP id a640c23a62f3a-abc09ab0c3cmr1650987466b.23.1740489373819;
        Tue, 25 Feb 2025 05:16:13 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abed1d5529dsm143348466b.53.2025.02.25.05.16.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 05:16:13 -0800 (PST)
Message-ID: <a98547f0-f125-45dc-8bb6-a154ad78f672@redhat.com>
Date: Tue, 25 Feb 2025 14:16:12 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/7] power: supply: core: convert to fwnnode
To: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Sebastian Reichel <sre@kernel.org>, Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Linus Walleij <linus.walleij@linaro.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Chen-Yu Tsai <wens@csie.org>,
 Matti Vaittinen <mazziesaccount@gmail.com>, =?UTF-8?Q?Pali_Roh=C3=A1r?=
 <pali@kernel.org>, Paul Cercueil <paul@crapouillou.net>,
 Samuel Holland <samuel@sholland.org>, David Lechner <david@lechnology.com>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Sebastian Krzyszkowiak <sebastian.krzyszkowiak@puri.sm>,
 Purism Kernel Team <kernel@puri.sm>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Orson Zhai <orsonzhai@gmail.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Chunyan Zhang <zhang.lyra@gmail.com>,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <20250225-psy-core-convert-to-fwnode-v1-0-d5e4369936bb@collabora.com>
 <20250225-psy-core-convert-to-fwnode-v1-7-d5e4369936bb@collabora.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20250225-psy-core-convert-to-fwnode-v1-7-d5e4369936bb@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Sebastian,

Thank you for your work on this.

A few small remarks inline / below.

On 25-Feb-25 12:21 AM, Sebastian Reichel wrote:

<snip>

> diff --git a/include/linux/power_supply.h b/include/linux/power_supply.h
> index a785742f97721e7e70d0e4c17a1ded7b985acb6d..9afde8c04efc72691c81a373d8dd03477b4efd7e 100644
> --- a/include/linux/power_supply.h
> +++ b/include/linux/power_supply.h
> @@ -805,7 +805,7 @@ static inline struct power_supply *power_supply_get_by_name(const char *name)
>  { return NULL; }
>  #endif
>  #ifdef CONFIG_OF
> -extern struct power_supply *power_supply_get_by_phandle(struct device_node *np,
> +extern struct power_supply *power_supply_get_by_phandle(struct fwnode_handle *fwnode,
>  							const char *property);

this function now no longer is DT/OF/open-firmware specific, so I think it should be moved
outside of the #ifdef CONFIG_OF block now ?  The same goes for the devm variant I think
and the implementations of course also should no longer be "#ifdef CONFIG_OF" .

>  extern struct power_supply *devm_power_supply_get_by_phandle(
>  				    struct device *dev, const char *property);

Regards,

Hans



