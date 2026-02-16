Return-Path: <linux-usb+bounces-33382-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4ONtD4sjk2kX1wEAu9opvQ
	(envelope-from <linux-usb+bounces-33382-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 16 Feb 2026 15:02:51 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D155E144630
	for <lists+linux-usb@lfdr.de>; Mon, 16 Feb 2026 15:02:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 890F6303FAB0
	for <lists+linux-usb@lfdr.de>; Mon, 16 Feb 2026 13:58:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A519E255E34;
	Mon, 16 Feb 2026 13:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Orl3VpCZ"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3371229BD87
	for <linux-usb@vger.kernel.org>; Mon, 16 Feb 2026 13:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771250315; cv=none; b=CxKmWAUfuaxPjKtgmViIeZs5DJyJGQUnnzyDbxUS7cJRnj7nNXOxd1FolbmBw4R6L/jOqKF+uvpGr7kX8CgQwj4F+DauWKRR4B7MVkHMBZMwscvv3cx7MUJm/3eHgRvm9HYWlgiRzVgMaJPzW4OcIpJ1oniFGhSwSbsUhVAuTyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771250315; c=relaxed/simple;
	bh=JudCYDKTAao9yvz1obQeEFLjpJHRjDhkH80IAq3x6uY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PB/lL7FO1zsGpsfI4jzJoh3ttaBS2Xcp26I2AYVADXuIqWkqKCKcggLl6yTuO0huZyZ2j8t9k/ovkGen4ENMD626AXnZYn1LY6BpktPgMuvunQS7z0bedbIUO2E2QACmVhuMWgleW/LF0EAlJsDv7xqk2OY2PJ/I8ZM8WdCnlgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Orl3VpCZ; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-59e60b3ccdfso4485773e87.0
        for <linux-usb@vger.kernel.org>; Mon, 16 Feb 2026 05:58:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771250311; x=1771855111; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rUcAGLQZkv/PTBs//eYKKwXahaszOterbl1vVyU8vuo=;
        b=Orl3VpCZVgtxL7MpZh1NnWlx2fyQTWtrIKVH6nsudChRBkNWr52BLzHjewFb5rb7pN
         HubWuhvIET2AZmou4zCDw210uFqVfcuH209nQuWT3wKo318bb2jWFzmRN/mplBEPQE8O
         J+AIN3NaN0Tyy9367E9yuKF9bus9tUPDTIZVEsmksjb4WnpF/G1Q6B4JMeRi9E5WLate
         q1jCL8jtPY1PynwXqrTlDx2HbtzBgR4zc9qSYs8WuWL7bF8b7h/EEXOsuyGuaeRpsLOu
         5XTN/OIYNYSllIFsYDHuOGlAVo/ZU5fCcjorQnbtIoLnkcJcu064QyRdIVbpiPGBhK5B
         IknQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771250311; x=1771855111;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rUcAGLQZkv/PTBs//eYKKwXahaszOterbl1vVyU8vuo=;
        b=lB7JistiefHheiYYW6q1PXxhfWi3J4FECHGtUjpIFBY66A2LFGUPMNvySG+iKuEO04
         32CgW6veiKC62LvYtT2Isbk0ob4xGoHvkawTEpgNhpvEu2cBZCBqi6+Md7EP6MGUl+n7
         2TggWq0meoV9/1+7tnq7bhTha9UHKWOQg5RU2LdAl8jaJDFmmUy6AhZsb3rFDC5YZ6uC
         rstXv2jZHt+suDXgbPnBvG6X8Yt5t9Q+RpoOhbvHfoNA/q10jGVWqVxINd+5EiYfcD5y
         jBfEd8RjkkUyeQpbU8zqCcHNL0zfaIXXcuRHc/43M5E5kYnubKq/fnzcxjxl0XO2QS9V
         Ab3Q==
X-Forwarded-Encrypted: i=1; AJvYcCWFS7PBo/qy6NWtt3T0zll49uDTpOfIiMr3SkU8Rm34/3HfIJp9mwhrEsb42hPjbO7dIxow1Y1nTjE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQnsd3MrPykzzrwjTaihv/DJZ3rfrYazO4tkHbvYVIz8w2BV0D
	IqXkLrbTCv/coqwIK04PbrD3w3T7yji1OqmTQBQiFU9xhXV7V4Y/0lIh
X-Gm-Gg: AZuq6aL5hITXrXGUIAYFRuk7TL/xosRK3E551ttwmeUMFA7wl9ib3Pni9EPO+0mfkv0
	x+LNjVuMoPKZwquRfZr1VKGSU0RAUmMcQ9nNt6Kg0JhshFg5Ds4j0TpvCN4J9RSqkxinQJT0QT+
	r57BRVGLTskGnaeTg06WF50pFDG1QGd3BRiYrxbJ/QaGOanKyVzoIqGFSM4VLaCwXdAyhwZZe4s
	XHreR1TEs9CZCoYMSX5hW7xk4k8YahayMwgLjW87nvYj8YQ7w0fNi2+sW/+ARElOe/b/Cz2TwWg
	j/OSjR27lMjkHjyeG5XxmGWTsqE9Tma+IOn6DYl4/g2wBfQM41fB5RhlV0WUEl1nGjP6h7b4opY
	VYIbsw2nBTI7VVC0bClM9RvgoC3qFUe8JiilA3qc2dDE0WEQ6MSRmyZNwM4QQk4Wi7XomI2wITO
	9GXqxVPQxcOSW/p2tSzEsSH2YN0Wde8taJPWcj/J/eDWs=
X-Received: by 2002:a05:6512:145a:10b0:59f:6db3:1526 with SMTP id 2adb3069b0e04-59f6db316f1mr1715840e87.10.1771250311130;
        Mon, 16 Feb 2026 05:58:31 -0800 (PST)
Received: from [10.38.18.54] ([213.255.186.37])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59e5f5b2223sm3224103e87.79.2026.02.16.05.58.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Feb 2026 05:58:30 -0800 (PST)
Message-ID: <5d889f66-7697-4a39-beed-33ace693a1ef@gmail.com>
Date: Mon, 16 Feb 2026 15:58:28 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 4/6] lib/linear_ranges: Add
 linear_range_get_selector_high_array
To: amitsd@google.com, Sebastian Reichel <sre@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, =?UTF-8?Q?Andr=C3=A9_Draszik?=
 <andre.draszik@linaro.org>, Lee Jones <lee@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Badhri Jagan Sridharan <badhri@google.com>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Peter Griffin <peter.griffin@linaro.org>,
 Tudor Ambarus <tudor.ambarus@linaro.org>,
 Alim Akhtar <alim.akhtar@samsung.com>, Mark Brown <broonie@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 RD Babiera <rdbabiera@google.com>, Kyle Tso <kyletso@google.com>
References: <20260214-max77759-charger-v6-0-28c09bda74b4@google.com>
 <20260214-max77759-charger-v6-4-28c09bda74b4@google.com>
Content-Language: en-US, en-AU, en-GB, en-BW
From: Matti Vaittinen <mazziesaccount@gmail.com>
In-Reply-To: <20260214-max77759-charger-v6-4-28c09bda74b4@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33382-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mazziesaccount@gmail.com,linux-usb@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,dt];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: D155E144630
X-Rspamd-Action: no action

On 14/02/2026 05:12, Amit Sunil Dhamne via B4 Relay wrote:
> From: Amit Sunil Dhamne <amitsd@google.com>
> 
> Add a helper function to find the selector for a given value in a linear
> range array. The selector should be such that the value it represents
> should be higher or equal to the given value.
> 
> Signed-off-by: Amit Sunil Dhamne <amitsd@google.com>
> ---
>   include/linux/linear_range.h |  3 +++
>   lib/linear_ranges.c          | 36 ++++++++++++++++++++++++++++++++++++
>   2 files changed, 39 insertions(+)
> 
> diff --git a/include/linux/linear_range.h b/include/linux/linear_range.h
> index 2e4f4c3539c0..0f3037f1a94f 100644
> --- a/include/linux/linear_range.h
> +++ b/include/linux/linear_range.h
> @@ -57,5 +57,8 @@ void linear_range_get_selector_within(const struct linear_range *r,
>   int linear_range_get_selector_low_array(const struct linear_range *r,
>   					int ranges, unsigned int val,
>   					unsigned int *selector, bool *found);
> +int linear_range_get_selector_high_array(const struct linear_range *r,
> +					 int ranges, unsigned int val,
> +					 unsigned int *selector, bool *found);
>   
>   #endif
> diff --git a/lib/linear_ranges.c b/lib/linear_ranges.c
> index a1a7dfa881de..c85583678f6b 100644
> --- a/lib/linear_ranges.c
> +++ b/lib/linear_ranges.c
> @@ -241,6 +241,42 @@ int linear_range_get_selector_high(const struct linear_range *r,
>   }
>   EXPORT_SYMBOL_GPL(linear_range_get_selector_high);
>   
> +/**
> + * linear_range_get_selector_high_array - return linear range selector for value
> + * @r:		pointer to array of linear ranges where selector is looked from
> + * @ranges:	amount of ranges to scan from array
> + * @val:	value for which the selector is searched
> + * @selector:	address where found selector value is updated
> + * @found:	flag to indicate that given value was in the range
> + *
> + * Scan array of ranges for selector for which range value matches given
> + * input value. Value is matching if it is equal or higher than given value
> + * If given value is found to be in a range scanning is stopped and @found is
> + * set true. If a range with values greater than given value is found
> + * but the range min is being greater than given value, then the range's
> + * lowest selector is updated to @selector and scanning is stopped.

Is there a reason why the scanning is stopped here? What ensures that 
the rest of the ranges wouldn't contain a better match?

The logic is now different from the 
linear_range_get_selector_low_array(), and I would like to understand 
why? It'd be nice if these APIs were 'symmetric' to avoid confusion. 
Hence, I would like to know rationale behind making them different.

> + *
> + * Return: 0 on success, -EINVAL if range array is invalid or does not contain
> + * range with a value greater or equal to given value
> + */
> +int linear_range_get_selector_high_array(const struct linear_range *r,
> +					 int ranges, unsigned int val,
> +					 unsigned int *selector, bool *found)
> +{
> +	int i;
> +	int ret;
> +
> +	for (i = 0; i < ranges; i++) {
> +		ret = linear_range_get_selector_high(&r[i], val, selector,
> +						     found);
> +		if (!ret)
> +			return 0;
> +	}
> +
> +	return -EINVAL;
> +}
> +EXPORT_SYMBOL_GPL(linear_range_get_selector_high_array);
> +
>   /**
>    * linear_range_get_selector_within - return linear range selector for value
>    * @r:		pointer to linear range where selector is looked from
> 


-- 
---
Matti Vaittinen
Linux kernel developer at ROHM Semiconductors
Oulu Finland

~~ When things go utterly wrong vim users can always type :help! ~~

