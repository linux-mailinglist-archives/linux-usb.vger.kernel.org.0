Return-Path: <linux-usb+bounces-33862-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wAYuGppapWlp+AUAu9opvQ
	(envelope-from <linux-usb+bounces-33862-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 10:38:34 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E2B1D5A6E
	for <lists+linux-usb@lfdr.de>; Mon, 02 Mar 2026 10:38:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1F4C3300FC49
	for <lists+linux-usb@lfdr.de>; Mon,  2 Mar 2026 09:37:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 11F9638F63F;
	Mon,  2 Mar 2026 09:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XutU1V5Q"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD1AB38F625
	for <linux-usb@vger.kernel.org>; Mon,  2 Mar 2026 09:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772444221; cv=none; b=hI/gRVatvljSN3TyVhcsBsSgQ4xLN7ICwgxE9huzsWit69b9k0stFqJ7Juxtsnf7y4Wy6cAZoHHoyeY27AsKSemkBAtM6/EqnvDRDWg971nKzLa78lxzuWRVtKKJIXJrT7+LWg69fQMyJQG+g7QAdeGfGA9SoUpaUv3OTWAd/Ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772444221; c=relaxed/simple;
	bh=/NOp8y06KChdk8LJ/vG6dQWQel7PeHlNho48yaYgYOQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qD5pEXhmf0Ajra4hlVtgJSoEAyvVEQjLVxICuifmLwbQGGU6rfQQnZ+sFUiiIExF0VkJh5u3dkSDloCEec7i8j5TA2Ov1I8PKQL/CCfJaBAruAx4wkwaIiGle1LFOKjVNHk+K8MZnlzPoZjFcW1gUCvRuY5Kh3EEQXNTaRGUQ/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XutU1V5Q; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-b936331786dso448303366b.3
        for <linux-usb@vger.kernel.org>; Mon, 02 Mar 2026 01:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772444218; x=1773049018; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HzEgCqxvjH+3BmwidCaHmyf6O+HU7TyRw9v2I7ODIxw=;
        b=XutU1V5Q5Iu1/2W1UMiol2gQZrYuaAtSCmZDHH3RHTDXQxQIr0z9i9g5cUmNHq7zhl
         Yc3AYY/QD2m3WN0VwBivrUmgNqL95izZsLhd2UxMN1/iPbHZQ86jRTYM+ptF2+5J3bXo
         sDEiFZV/XWHarTwN+qsKYdP11Dcxql2YXZjF1pyiA58MB5bEVobbomlkpFKSzV+u9aV8
         PPEQS61djCwxSEVrmcun997xNDe/c2JoHP3YIo/YHab0lCAFwHo8VuNmXsrOGcDj67kk
         bg/fvhovREns26oj81U9psuqofhx8abj2GjL0CnKQ2dfwW1OLP9MS9PGJyjSfIK6xMkl
         bRUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772444218; x=1773049018;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HzEgCqxvjH+3BmwidCaHmyf6O+HU7TyRw9v2I7ODIxw=;
        b=IE3WYvC8xRzNkM1rpfduUdZjADdDnmgcVTRsGut6pyF6daIXpV98aK0cl/Re+vvmf7
         IYt3rlXJ+E3WzpvFCDEPWnyTB1u9xvwuLojNWWgvaiF9gOOj2OnJLYaWR4JNo0nXxVIG
         YqI7X/bomoehRMDXBNbag72t7Y1Uhj9GzeeNmmfMKXxmcKKDJTNYMehYq2282EaEeyVV
         RDA2Z92j5GhUb0DjJ3zLgIg1putvtVeAF0ym5YUJ8XwqstCj6AO9t/wajqqgB6mkzken
         Z9bnYdKb1RM/t9zP+JlU5nBAkFEULuil9jCvqPRZjTvvysKSnZYsJf8hkBh7hNGLlXSZ
         kEjw==
X-Forwarded-Encrypted: i=1; AJvYcCWXgcBoH1ueFP0rX+F0/Zw1ioJcg18QvmdY6pkZw1ZGF/Ht/cHqberUfWz1ZrwBEsoJrrg0U716zB0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxUkkaVReYB9hc62fTQES+7NCKUa2dVxzlOLQkhYt+5i8FaZWAi
	fSf5BU83lzNTKflBo26umvTnh/kawXWWWYETigLJ7RKfqHBp6gLbDcje
X-Gm-Gg: ATEYQzypnuherC1aYxqVmESPM9SmvJ39aeBzAhe0Va0/5PICbawBSn7K1Tysqm7e+k0
	BiciMnVBZwem+wcnSbO80nv+qrGbybHwGOPvn1htU9P6MgJ9lOlh9ID+bRyX+XKoyMAKIbBAeE8
	1jaD5S5SosbuGsWHQrWAGpLqu5cPuUEXRu//IN+aFiOKJspwKpLTNz5h/Wv7EhKY776uvj0I/NF
	baCNYjQb+jJoymknsLao2oxdbOeXX8PPKnZ/4+4DgqBhYfgenGCxLrk53GUewqykDKyWMG42Y8Y
	izPxW8+JEuvYkR8X4vDwKnn9mxYfedsaBdS82thM7pVIsstDPNOhM4LY81xWwrWD/repoPnekOp
	T2EimXUs1WRwypXQEnZz5M+0lwxTgu2sGKYYHq9XMpaGCA2X08038wsomB9VcxX9ruU5CSmOLAO
	9tfRcnpWWzdR7yJIR2dX6otnpPTCA=
X-Received: by 2002:a17:907:6d11:b0:b8f:9636:9acc with SMTP id a640c23a62f3a-b9376386bbemr716057866b.17.1772444217797;
        Mon, 02 Mar 2026 01:36:57 -0800 (PST)
Received: from [192.168.0.102] ([46.53.247.255])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b935aec7091sm452340666b.58.2026.03.02.01.36.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 01:36:57 -0800 (PST)
Message-ID: <cd1506b7-0438-4505-946e-4fc90961d3e3@gmail.com>
Date: Mon, 2 Mar 2026 12:36:56 +0300
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 7/8] platform/chrome: cros_ec_typec: Thunderbolt
 support
To: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
 heikki.krogerus@linux.intel.com, tzungbi@kernel.org,
 linux-usb@vger.kernel.org, chrome-platform@lists.linux.dev
Cc: akuchynski@google.com, sboyd@kernel.org, pmalani@chromium.org,
 badhri@google.com, rdbabiera@google.com, dmitry.baryshkov@linaro.org,
 jthies@google.com, Benson Leung <bleung@chromium.org>,
 Guenter Roeck <groeck@chromium.org>, linux-kernel@vger.kernel.org
References: <20241213233552.451927-1-abhishekpandit@chromium.org>
 <20241213153543.v5.7.Ic61ced3cdfb5d6776435356061f12307da719829@changeid>
Content-Language: en-US
From: Dzmitry Sankouski <dsankouski@gmail.com>
In-Reply-To: <20241213153543.v5.7.Ic61ced3cdfb5d6776435356061f12307da719829@changeid>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-33862-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dsankouski@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chromium.org:email]
X-Rspamd-Queue-Id: B6E2B1D5A6E
X-Rspamd-Action: no action



On 12/14/24 2:35 AM, Abhishek Pandit-Subedi wrote:
> Add support for entering and exiting Thunderbolt alt-mode using AP
> driven alt-mode.
> 
> Signed-off-by: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
> ---
>
(...)

> diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
> index 1bcaa7269395..1ac5798d887f 100644
> --- a/drivers/platform/chrome/cros_ec_typec.c
> +++ b/drivers/platform/chrome/cros_ec_typec.c
> @@ -303,18 +303,19 @@ static int cros_typec_register_port_altmodes(struct cros_typec_data *typec,
>   
>   	/*
>   	 * Register TBT compatibility alt mode. The EC will not enter the mode
> -	 * if it doesn't support it, so it's safe to register it unconditionally
> -	 * here for now.
> +	 * if it doesn't support it and it will not enter automatically by
> +	 * design so we can use the |ap_driven_altmode| feature to check if we
> +	 * should register it.
>   	 */
> -	memset(&desc, 0, sizeof(desc));
> -	desc.svid = USB_TYPEC_TBT_SID;
> -	desc.mode = TYPEC_ANY_MODE;
> -	amode = typec_port_register_altmode(port->port, &desc);
> -	if (IS_ERR(amode))
> -		return PTR_ERR(amode);
> -	port->port_altmode[CROS_EC_ALTMODE_TBT] = amode;
> -	typec_altmode_set_drvdata(amode, port);
> -	amode->ops = &port_amode_ops;

The last usage of port_amode_ops is deleted here. Is this a mistake?
AFAIU from kernel docs, port_amode_ops needed for alternate mode driver 
to send vdm messages to partner. Now, when it's unused, how does 
alternate modes work in this driver?

> +	if (typec->ap_driven_altmode) {
> +		memset(&desc, 0, sizeof(desc));
> +		desc.svid = USB_TYPEC_TBT_SID;
> +		desc.mode = TBT_MODE;
> +		amode = cros_typec_register_thunderbolt(port, &desc);
> +		if (IS_ERR(amode))
> +			return PTR_ERR(amode);
> +		port->port_altmode[CROS_EC_ALTMODE_TBT] = amode;
> +	}
>   
>   	port->state.alt = NULL;
>   	port->state.mode = TYPEC_STATE_USB;

