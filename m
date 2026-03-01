Return-Path: <linux-usb+bounces-33846-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qD6FET9rpGlegQUAu9opvQ
	(envelope-from <linux-usb+bounces-33846-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Sun, 01 Mar 2026 17:37:19 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A68A31D0A8D
	for <lists+linux-usb@lfdr.de>; Sun, 01 Mar 2026 17:37:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 6BE35300DA6A
	for <lists+linux-usb@lfdr.de>; Sun,  1 Mar 2026 16:37:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0ACE2336EC5;
	Sun,  1 Mar 2026 16:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kDNx6L3A"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEDF2311C36
	for <linux-usb@vger.kernel.org>; Sun,  1 Mar 2026 16:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772383029; cv=none; b=gqrWoicnForfEE8kZaGmFZG5fBsqIL0mSPeXH0atYwK+XqwReZyBOt3nM+//PKGA0zo4CGyfduA3ZUrZuOdmgATqUOhXkFcSRQcEQCD178p69iyZh9tEDAsvA7XwdXXIcKXsFtwMrHqaL9TKTFtTWRd6rpShN00HoYUTTZuNkxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772383029; c=relaxed/simple;
	bh=oFJcuj7s/WSXgtE/fyI6JR5pN5bvxBGTF/OtY3SgvWI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fzOA6z8NSR8JCqxIOh36x1bpvm/AggmtRkaOXhAjyc87R+AD4gKKB+Af4t6zuwSiB0UhYBZzfdHD8oM5zYOmwtijrWoJMMVpUPCvm9JAwcex3FV7BeGoCkS1mvL4GFB8ZmEl8LsjNVf2M6A+8HOvCb0XLNwZJz8Lp0gOG/iqJtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kDNx6L3A; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-389e4330e32so53216051fa.0
        for <linux-usb@vger.kernel.org>; Sun, 01 Mar 2026 08:37:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772383026; x=1772987826; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=chfWZCrwegHuS+IaibQUlGs9qTPZhd3l1r8kvwtttAg=;
        b=kDNx6L3Ax7ZNiHAXoFgPYfjHo+XPySUCg3BzU/Idcb0hQ30z5jgwRGSxLZw8afL6iu
         S6IYYknitwHBxK+ML9LvAjTQkZNvIQJEXCANgJDTYkGzYvpddiwdQEa2lksrEUfDRbYa
         NFFaiYFp7zNr/XmfjG2OsBPNoX6hGqM0Ms3RiEc9OWu+TH/ynn3LoLdXW3FYMPp38pxF
         lciytcc6CVMEQh24THT8Kp0GjO09CskLCVji79wjZGRMVJwfwgDptoe5757BSXbTnH4f
         6pF+GDnNcmU88wkpIp7r2x/bcfuUuqAQUOjU4eEM6ZB9VJcViho6FTWcF2o9HN6HL5J1
         lIfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772383026; x=1772987826;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=chfWZCrwegHuS+IaibQUlGs9qTPZhd3l1r8kvwtttAg=;
        b=MCyGb51cyjEd1OyaJrTVJ5eaL7tiNZzAiNxJ255VqMwFCgxzhrGDN+lOZjhKmk2Ctx
         OcwEF67MI+v4FiL30tAPNXKOLHTP8JnUj2nDaTPACwCy9ujPXgapKpclG7OqbRTcrHL6
         vcRFLEtQSfRQJlDXbFJvdc7zVg3kKRveGPXvw4m0Pqe7uNC6rj0K0/jO2+vEmpi4yEyu
         i6cTSCfazNvrtJBJqcKKTzpvUDs9+xybelXf7GZSAF9agBfs3ND6SywC8lXmpiGxAMAb
         8JfQ/aiypichOyUud2q8M1DLDktjGun9Y3pjPtLLvJJdjoHz8WFTQq8Ow2UJAhZ3kaAO
         0nKg==
X-Forwarded-Encrypted: i=1; AJvYcCWfq5Sn2/ZST2jP3hMjirB7u6cikiuvGa4Cxu7RTEHofgU9CsgqTjhBA/U/w1GSCmn/nvix1hti1QI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwE0PdK4VKSltei33K9fY8Pl2cIFNXSfRkz+JoybF77GwhQZA0u
	rkUTzmcOclKrfZnoZuQ7Rc2uMwC5H/6JhIDsQUhpSnXjCCOEHGNI2I9s
X-Gm-Gg: ATEYQzw97xrnl1+I1RYORhzwNHATHxwSLwFRrCk4OMUQaJf/btbFdxPChcDQlOV4ca3
	Qlk2Iw9+k6zAFLODq9Bp0T1oIkkviD/a2IM/Cl+t6xnDdgVwRLQN/lbVbH1V8O28Xx0Q9rqetzW
	Ij7Kdo3O3HxYBhczYrYh9aHQQrfvNe5G8+cpCPSEDBqY8bjdfV0Tq11us23qTlCTdEoA97JQf01
	eg5eeV4C/K3MM5iGriM600+w63r/bmTylc00vTs5xbhOJ4LsLxKiEjt7qOQVVfoYU9P8j2sxj9A
	JJ5NSQ2CEDIAsphl1+rhdM+0svC4nU9/qlMVD+qRfe6IbHkKiY4Xtma0KQtG/7MySXBINrMA1JA
	a8iGr9XtXYfDdtwtspIBCG/pc1br4fiKihG2bK5VyOo8zBElC+6C1co+ZBbTwKhrGcxA+bzzEqK
	IsVbo93AbVffZZHhiA+kjP/UsGlxEZNqUNf/VFxM64Oue2f4UJFl+DyGnwtUvGg4yeNeLmKJk+c
	R53
X-Received: by 2002:a2e:914d:0:b0:389:fb69:9e65 with SMTP id 38308e7fff4ca-389ff356058mr42360521fa.31.1772383025715;
        Sun, 01 Mar 2026 08:37:05 -0800 (PST)
Received: from ?IPV6:2a00:1fa0:45b:6e70:24a:6543:9307:8962? ([2a00:1fa0:45b:6e70:24a:6543:9307:8962])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a115bd2384sm1095553e87.10.2026.03.01.08.37.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Mar 2026 08:37:05 -0800 (PST)
Message-ID: <554c1dc9-cb75-4777-ad98-97243808245d@gmail.com>
Date: Sun, 1 Mar 2026 19:37:02 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] USB: pxa27x_udc: check return value of clk_enable
To: Zhaoyang Yu <2426767509@qq.com>, daniel@zonque.org,
 haojian.zhuang@gmail.com, robert.jarzmik@free.fr, gregkh@linuxfoundation.org
Cc: linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <tencent_05D6B6FBD5DE2A537EBE395A85B021506009@qq.com>
Content-Language: en-US
From: Sergey Shtylyov <sergei.shtylyov@gmail.com>
In-Reply-To: <tencent_05D6B6FBD5DE2A537EBE395A85B021506009@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33846-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[qq.com,zonque.org,gmail.com,free.fr,linuxfoundation.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sergeishtylyov@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qq.com:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: A68A31D0A8D
X-Rspamd-Action: no action

On 3/1/26 7:23 PM, Zhaoyang Yu wrote:

> clk_enable() may fail according to the API contract.
> Previously, udc_enable() ignored its return value.
> This patch checks the return value and logs an error
> without continuing initialization if clk_enable fails.
> 
> Signed-off-by: Zhaoyang Yu <2426767509@qq.com>
> ---
>  drivers/usb/gadget/udc/pxa27x_udc.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/gadget/udc/pxa27x_udc.c b/drivers/usb/gadget/udc/pxa27x_udc.c
> index 897f53601b5b..69fcecaf6061 100644
> --- a/drivers/usb/gadget/udc/pxa27x_udc.c
> +++ b/drivers/usb/gadget/udc/pxa27x_udc.c
> @@ -1696,7 +1696,13 @@ static void udc_enable(struct pxa_udc *udc)
>  	if (udc->enabled)
>  		return;
>  
> -	clk_enable(udc->clk);
> +	int ret;

   Please don't declare variables amidst of a function. IIRC, the Linux coding
style doesn't allow for this C++-ism...

[...]

MBR, Sergey


