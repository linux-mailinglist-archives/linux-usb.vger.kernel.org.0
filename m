Return-Path: <linux-usb+bounces-33552-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SPqqDfA5nGlCBgQAu9opvQ
	(envelope-from <linux-usb+bounces-33552-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 12:28:48 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 60534175822
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 12:28:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id B27E830221DF
	for <lists+linux-usb@lfdr.de>; Mon, 23 Feb 2026 11:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B402B36165B;
	Mon, 23 Feb 2026 11:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JdhfICLj"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87EC53612F7
	for <linux-usb@vger.kernel.org>; Mon, 23 Feb 2026 11:28:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771846120; cv=none; b=amxEyyi/kB3YVGRZu0pPUDJrY7IJsKUwQHNo6NYNUHkDerUBiJpSgvsUk3OZtNQ5O4iuJEc1oWxreORL7td5SHIGMfkTCVbxxF9v1iaHom4pAHtkXnQ2cYJtO5zBKJaTnWiFGj66LDIn/Mm7DlVcDj4XDZELRpjiDy2rI78ZuW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771846120; c=relaxed/simple;
	bh=iSHHhMjMZF7RXJsBUUXnux7uDb9JH64aVuAfJn7+uUI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ig5j1cpn3/sNErhmb9ikxnNnSEJtkgMWggUWGD+QkCShHJsWdb8YeRmCXyuZD5Lhvd0rLVui6c7ZFIjCJmiXQTkAT1PCa3IVeVeWQPsXGjzDaiNtB/0ASnwrMCyqbksykJt1CI9QkuAPWbyBr3g2vv6rlQeqLiTUFsxX5D0n1yI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JdhfICLj; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4807068eacbso33319695e9.2
        for <linux-usb@vger.kernel.org>; Mon, 23 Feb 2026 03:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1771846117; x=1772450917; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vw1XJzi7PNud+gbo9kf7Wo2OGF9SzPqZe0XTmLwxs4A=;
        b=JdhfICLj4VtdiVo6AF/CNwu9tZfOrGloqAQo0/88Eopu7qwrTQroBpwwwMg8PbQtP9
         2RgBlkm/geGaOz00QsFkgPKmj3Cbg35ozQjTAJtU+DKH7YDWI4W1Szf1ApeyEFPyxM1U
         bPeUXtZ5pepabTbgpeVgbyQNpYuWJPENPqh4ZBsZYwdI4+8+lARzrHtaGT9b3XspdFcU
         Ga1HBdVJSb9h7u7eYz97bWwEPcu3KjLQJDiEN+/vzdAZSIR8qmBWBlL2f5durvKu+nZA
         jFBCrJl0t0eUevaomZpemCVkgOrsrCxLDV1nrC0FC7Rp8fAdDUQQFsW4aRafVop5DgMy
         tZqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771846117; x=1772450917;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vw1XJzi7PNud+gbo9kf7Wo2OGF9SzPqZe0XTmLwxs4A=;
        b=HBW8/pAbEm+gStNGpiWiSgleBjuXy/jnKCByeYg2E+ifsdElNiwt8djdNVZBM+fNJ0
         gNamihcCpLG3Wqy+RObedIC++jQaM1TbhaCvCiVz2C6MX6HvN5BUWX5BSt2Yg604hU7f
         NAik3BwkuIScKjnNVGjc3azVZZj5T/XcjYgrIUawlnkxKnH4bN5fEJSdISe2udj2gbx5
         3pdSQqrCtQnN7oQWWID95V8gYh/csUKzxK8X8SmJ693zObN7HYwkchJvbh9YMD0z9Lc9
         xb54N6AhOD4VH0hdjcSH2P1moFVEtaDLBtXmTLFMvW42ClONlzMlFOqqH5IcagDTqdlh
         6k5g==
X-Forwarded-Encrypted: i=1; AJvYcCUdzb6WtjFLQaOgMEtgVybf3f+0hBocikO3zluMu5YMQR+0vYqmvCXdMuoJrnRJ7FMh6oS/3OfDwoQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEuwLAlI0tyt8q80AQP4mutCGp/Phf6J9OoE5tYQ5pdkWFBKRa
	rU/sDHNAGx91cxBpR1Q1KkCblEQerk/BVzGxQHZguLYCCSIkdZFua8q8L4DitSlFTew=
X-Gm-Gg: AZuq6aKlzAi4iXFu9xzzKiopTjBW4u4f5dMmb0DCrnd0RPl6l7fOPi1neeNLtMXPwnl
	NYUKXUOrdO/H1sEM7OBsE/6QyMLndNPJXddQu2StYsodjuoY31p7AkL1hXVRmrB2yUWQFrdTuFZ
	6dgMzbPM8p9koLR630UlRQnF5QAh5/PH+Xp3WFE2Q10yTsvg8On8CKbEf8iU6A39HMTzxWmdIAI
	T8cauY2blBAIl8zlpHNxiNsUJzLRLgiyQ83ZcKPliKiN94JsOQbkYtbQjTPKFi6hStqXw/Glo20
	oivgew4hL5En2c1bhhHdSPA6flU/BstVUKMBM7R9AWPBoaHTF+TTjZbrm0kFWL2vLqIEatnuuTA
	Qz7L0rXjmE1WWZSKPqkd/hUnLjPA3hpGQSZnHszBt/CqjwlCyV4p/s0UOAQ5rhdgezKl65rMpFx
	Dh/F8yK+Hw4GXeT3ECbaauUMm6QbkR2M6EIT3AJXQGkVbVE4uH666vuK1bcqBe3ZFE5yY=
X-Received: by 2002:a05:600c:190f:b0:477:9a28:b0a4 with SMTP id 5b1f17b1804b1-483a95574c5mr137098695e9.0.1771846116804;
        Mon, 23 Feb 2026 03:28:36 -0800 (PST)
Received: from ?IPV6:2001:a61:13fe:e401:a6d6:a7a0:a277:a99e? ([2001:a61:13fe:e401:a6d6:a7a0:a277:a99e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31b3d88sm281193455e9.3.2026.02.23.03.28.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Feb 2026 03:28:36 -0800 (PST)
Message-ID: <04778e0c-e15c-4acd-ade2-5cb8dc4319b1@suse.com>
Date: Mon, 23 Feb 2026 12:28:29 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] usb: misc: uss720: properly clean up reference in
 uss720_probe()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, stable <stable@kernel.org>
References: <2026022327-exhaust-constrain-e21d@gregkh>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <2026022327-exhaust-constrain-e21d@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33552-lists,linux-usb=lfdr.de];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linuxfoundation.org:email,suse.com:mid,suse.com:dkim,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 60534175822
X-Rspamd-Action: no action

Hi,

On 23.02.26 12:17, Greg Kroah-Hartman wrote:
> If get_1284_register() fails, the usb device reference count is
> incorrect and needs to be properly dropped before returning.
> 
> Cc: stable <stable@kernel.org>
> Assisted-by: gkh_clanker_2000
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>   v2: properly clean up the previously allocated resources by jumping to
>       the error path and not just retrning directly
> 
>   drivers/usb/misc/uss720.c | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/usb/misc/uss720.c b/drivers/usb/misc/uss720.c
> index ec8bd968c4de..54107bf280df 100644
> --- a/drivers/usb/misc/uss720.c
> +++ b/drivers/usb/misc/uss720.c
> @@ -735,8 +735,10 @@ static int uss720_probe(struct usb_interface *intf,
>   	 * here. */
>   	ret = get_1284_register(pp, 0, &reg, GFP_KERNEL);
>   	dev_dbg(&intf->dev, "reg: %7ph\n", priv->reg);
> -	if (ret < 0)
> -		return ret;
> +	if (ret < 0) {
> +		usb_put_dev(usbdev);
> +		goto probe_abort;

This jumps to probe_abort, which calls destroy_priv() indirectly
via kref_put(). Either that works, which would mean that you must
_not_ do a second usb_put_dev() or it does not, in which case the
earlier error handling for parport_register_port() is incorrect.

Either way, there is a problem.

	Regards
		Oliver


