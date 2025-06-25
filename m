Return-Path: <linux-usb+bounces-25091-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F0C82AE7E42
	for <lists+linux-usb@lfdr.de>; Wed, 25 Jun 2025 11:59:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F8E51883556
	for <lists+linux-usb@lfdr.de>; Wed, 25 Jun 2025 09:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 041DF2877F8;
	Wed, 25 Jun 2025 09:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="bpDpaVfg"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DB811917D6
	for <linux-usb@vger.kernel.org>; Wed, 25 Jun 2025 09:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750845566; cv=none; b=M/RhESc5zQsJDGNuXJ2R/oxYYAVOf8Cwiw0ovbFQgNjuM/hw1QoUU9XFlbDcVA84yYd9+sfPxLm0w3HPYWIhghGZpqWFoz5cRpqBgHEBvMz59paEXrWReWY98eyQNA8xKwBXrMhUCpCw2xQ3gNS245f3UPsjgfd+Pd2qECVbgPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750845566; c=relaxed/simple;
	bh=cFnBptv+cEjizScxWA4ecMmtuAjgra2P61De7cgQDRQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s19T4VtCPvB7aTG1yHpwm95aIe+jYlpYzkTpPBCihVw4PyZ9WedYBinM7huY2HEr1oiKuokAhDr2qesIX1PCEsQs6H4FyH790vbN7o994cAXw3Mo/vyA/q6v4QSOo0crUdhGqn3unDcpZ2PzTBkhbpCN6evFG/IDupyy2jBduuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=bpDpaVfg; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-60780d74c8cso9810479a12.2
        for <linux-usb@vger.kernel.org>; Wed, 25 Jun 2025 02:59:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1750845562; x=1751450362; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1HkHNQkF6J6bQHOPxz3P6si0rFdmtFlxDkrWkhObb2U=;
        b=bpDpaVfgJcCToznCMG5KgFmTIYQWrYI9jdQWdOjmZuxMp6wANfDwC4w7aGUYRAY7Vw
         YaG2vw6cbRuq8RLbarBfcy9hzBJU2w8K6E9N/dVCOjU4wrscEDKTp8VolWsvJTT/vaBX
         n3f0+G7bwXkqdkT4aRc7eF4V2IA0EaeWbE3+Xba01s9lNRb0VCXroiD4XXBOoZOIDQJE
         mAoMsGRICakcYHWeUNqyQFN9JPE5WsBd6vG5fZlSqe/gK/UryhDPq7Q+jwZ5FrIg08Lg
         eUNovbfpvPHc7eBgd6DECdplWTRPmf3oBMOPB/CQGNFezhq+Fl8/aQ00bUoitmBpBQiR
         fQ9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750845562; x=1751450362;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1HkHNQkF6J6bQHOPxz3P6si0rFdmtFlxDkrWkhObb2U=;
        b=LLJrnc4H5XpT7psBg0SturF56fyGsMUC7gMTyHYjweHRhevbE1NBFN+pn592UHZT4c
         SDCVjaNaqKBw/oYK1HrdnavhPg1PG/l2Iw33mlL3AFemlXLMKEosUbQOSaC3BsBOENGJ
         dpDx2OMwgTC+mnPP6bvjD2iiQ16lb/DmWcIFbVqL89uolmBRmCtCyjPpBktvV+PjyeBo
         +HGjG4UChkZzv8WbqylueXlKN6vAyx4OUKTEIWK9DUK2f0yxWXGRoRw2+7i4VKOiF+TE
         7KY2nvR7hWcAa1AtUwCdQuqaj3yMtyV3AgC87oJZICqb2W6w4Z+FuP/k+ozR68a8gYbG
         oc0A==
X-Forwarded-Encrypted: i=1; AJvYcCXmUbUoaDlxniUGo7chAxL0y6MkvBewq3/h2taU68csDpgsUPGZQ76HlJiwsJSgXzreXhQ6OIc/Yiw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwydmR0PbmRj5TQs3ertIbukYpeaNnpq6ch7gpY6qSmicLBI3Ep
	xEqVCrhfZZ4unsYodEt8G8VBQnekROEBrcJ7DdUwU0NBcNKmdHyu+jaY44vxcyvIKeU=
X-Gm-Gg: ASbGncvfVXLNifLXCi9bV/kCphQZ43PS6wAt5SrCPZsiGnd2U9zbe4qF6pC4zYfoS7F
	Ea9Ye2+HvFM5bcX267ABoI1j7mqLxvyiJs9yL2kV4I9NmhMq3HocmI5vQZF/V4wuDHnw2DqJOFb
	kHp+eW6ZXUYMf6Kd4+7Ic0U3x4O+t6goFbottAijyeY2yZGa5Osb7HdAE8BRojPVRZUzwrb2J5L
	N1eotFeSt2eoWo0g+pJ5FT7skSUp5ja8pbgxzCKFA/JZ5dRtg4JQaB3xkbj0iG/GVjsaunuGjmN
	uZPy44KC3ATWYZciI1wsAGLD8nj+SiKal3PfYRky8t6u8FGCPjA6KyzlhUjpVj9Ld+iAmNH9UUj
	oAKOZCaGFO7yU0ZjwguhcUCr9Q5wO
X-Google-Smtp-Source: AGHT+IG1ZjETG8I5bt+vYaSkcyoOGGYtm+H7RyWj9p0Bpq15R/4ZBu1T0KeziY6socGnAfBD/EZ5tA==
X-Received: by 2002:a05:6402:40c5:b0:60c:5853:5b7f with SMTP id 4fb4d7f45d1cf-60c58535dabmr924882a12.32.1750845562427;
        Wed, 25 Jun 2025 02:59:22 -0700 (PDT)
Received: from ?IPV6:2001:a61:1387:7b01:1baf:e0d0:c695:846a? ([2001:a61:1387:7b01:1baf:e0d0:c695:846a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c2f468468sm2331921a12.41.2025.06.25.02.59.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 02:59:22 -0700 (PDT)
Message-ID: <e028a659-9535-4cf9-92c1-373f72fae3cf@suse.com>
Date: Wed, 25 Jun 2025 11:59:21 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/4] usb: core: Introduce usb authentication feature
To: nicolas.bouchinet@oss.cyber.gouv.fr,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Alan Stern <stern@rowland.harvard.edu>,
 Kannappan R <r.kannappan@intel.com>,
 Sabyrzhan Tasbolatov <snovitoll@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Stefan Eichenberger <stefan.eichenberger@toradex.com>,
 Thomas Gleixner <tglx@linutronix.de>, Pawel Laszczak <pawell@cadence.com>,
 Ma Ke <make_ruc2021@163.com>, Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Luc Bonnafoux <luc.bonnafoux@ssi.gouv.fr>,
 Luc Bonnafoux <luc.bonnafoux@oss.cyber.gouv.fr>,
 Nicolas Bouchinet <nicolas.bouchinet@ssi.gouv.fr>,
 linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org
References: <20250620-usb_authentication-v1-0-0d92261a5779@ssi.gouv.fr>
 <20250620-usb_authentication-v1-2-0d92261a5779@ssi.gouv.fr>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20250620-usb_authentication-v1-2-0d92261a5779@ssi.gouv.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 20.06.25 16:27, nicolas.bouchinet@oss.cyber.gouv.fr wrote:

> +/**
> + * usb_authent_req_digest - Check if device is known via its digest
> + * @dev:		[in]  pointer to the usb device to query
> + * @buffer:     [inout] buffer to hold request data
> + * @digest:     [out] device digest
> + *
> + * Context: task context, might sleep.
> + *
> + * This function sends a digest request to the usb device.
> + *
> + * Possible errors:
> + *  - ECOMM : failed to send or received a message to the device
> + *  - EINVAL : if buffer or mask is NULL
> + *
> + * Return: If successful, zero. Otherwise, a negative  error number.
> + */
> +static int usb_authent_req_digest(struct usb_device *dev, uint8_t *const buffer,

How can buffer be const if it is used for output?

[..]
> +struct usb_auth_cert_req {
> +	uint16_t offset;
> +	uint16_t length;
> +} __packed;

Endianness?


> +/**
> + * usb_authent_read_certificate - Read a device certificate
> + * @dev:		[in] pointer to the usb device to query
> + * @buffer:		[inout] buffer to hold request data, caller allocated
> + * @slot:		[in] certificate chain to be read
> + * @cert_der:   [out] buffer to hold received certificate chain
> + * @cert_len:   [out] length of received certificate
> + *
> + * Context: task context, might sleep.
> + *
> + * Possible errors:
> + *  - EINVAL : NULL pointer or invalid slot value
> + *  - ECOMM  : failed to send request to device
> + *  - ENOMEM : failed to allocate memory for certificate
> + *
> + * Return: If successful, zero. Otherwise, a negative  error number.
> + */
> +static int usb_authent_read_certificate(struct usb_device *dev, uint8_t *const buffer,
> +					uint8_t slot, uint8_t **cert_der, size_t *cert_len)
> +{
> +	uint16_t read_offset = 0;
> +	uint16_t read_length = 0;
> +	uint8_t chain_part[64] = { 0 };
> +
> +	if (unlikely(slot >= 8 || buffer == NULL || cert_der == NULL || cert_len == NULL)) {
> +		pr_err("invalid arguments\n");
> +		return -EINVAL;
> +	}
> +
> +	// First request to get certificate chain length
> +	if (usb_auth_read_cert_part(dev, buffer, slot, 0,
> +				    USB_AUTH_CHAIN_HEADER_SIZE,
> +				    chain_part) != 0) {
> +		pr_err("Failed to get first certificate part\n");
> +		return -ECOMM;
> +	}
> +
> +	// Extract total length
> +	*cert_len = ((uint16_t *)chain_part)[0];

Endianness


> +
> +/**
> + * usb_authent_challenge_dev - Challenge a device
> + * @dev:				[in] pointer to the usb device to query
> + * @buffer:			[in] pointer to the buffer allocated for USB query
> + * @slot:				[in] certificate chain to be used
> + * @slot_mask:	[in] slot mask of the device
> + * @nonce:			[in] nonce to use for the challenge, 32 bytes long
> + * @chall:			[out] buffer for chall response, 204 bytes long, caller allocated
> + *
> + * Context: task context, might sleep.
> + *
> + * Possible errors:
> + *  - EINVAL : NULL input pointer or invalid slot value
> + *  - ECOMM  : failed to send or receive message from the device
> + *
> + * Return: If successful, zero. Otherwise, a negative  error number.
> + */
> +static int usb_authent_challenge_dev(struct usb_device *dev, uint8_t *buffer,
> +	const uint8_t slot, const uint8_t slot_mask, const uint8_t *const nonce,
> +	uint8_t *const chall)
> +{
> +	int ret = -1;
> +
> +	if (unlikely(buffer == NULL || slot >= 8 || nonce == NULL)) {
> +		pr_err("invalid arguments\n");
> +		return -EINVAL;
> +	}
> +
> +	// AUTH OUT challenge request transfer
> +	memcpy(buffer, nonce, 32);
> +	ret = usb_control_msg(dev, usb_sndctrlpipe(dev, 0), AUTH_OUT,
> +			      USB_DIR_OUT,
> +			      (USB_SECURITY_PROTOCOL_VERSION << 8) +
> +				      USB_AUTHENT_CHALLENGE_REQ_TYPE,
> +			      (slot << 8), buffer, 32, USB_CTRL_GET_TIMEOUT);
> +	if (ret < 0) {
> +		pr_err("Failed to send challenge request: %d\n", ret);
> +		ret = -ECOMM;
> +		goto cleanup;
> +	}
> +
> +	// Complete the challenge with the request
> +	chall[1] = USB_SECURITY_PROTOCOL_VERSION;
> +	chall[0] = USB_AUTHENT_CHALLENGE_REQ_TYPE;
> +	chall[2] = slot;
> +	chall[3] = 0x00;
> +	memcpy(chall+4, nonce, 32);

This may be worth a definition.
> +
> +	// AUTH IN challenge response transfer
> +	ret = usb_control_msg(dev, usb_rcvctrlpipe(dev, 0), AUTH_IN, USB_DIR_IN,
> +			      (USB_SECURITY_PROTOCOL_VERSION << 8) +
> +				      USB_AUTHENT_CHALLENGE_RESP_TYPE,
> +			      (slot << 8) + slot_mask, buffer, 168,
> +			      USB_CTRL_GET_TIMEOUT);
> +	if (ret < 0) {
> +		pr_err("Failed to get challenge response: %d\n", ret);
> +		ret = -ECOMM;
> +		goto cleanup;
> +	}
> +
> +	pr_notice("received challenge response\n");
> +
> +	// Complete last part of the challenge with what is returned by the device
> +	memcpy(chall+USB_AUTH_CHAIN_HEADER_SIZE, buffer, 168);

The 168 comes whence?

> +
> +	ret = 0;
> +
> +cleanup:
> +
> +	return ret;
> +}


> +/**
> + * @brief Check that the authentication can resume after a sleep
> + *
> + * @param [in] dev : the usb device
> + * @param [in] hub : the parent hub
> + *
> + * Possible error codes:
> + *  - ENODEV : hub has been disconnected
> + *
> + * @return 0 if possible to resume, else an error code
> + */
> +static int usb_auth_try_resume(struct usb_device *dev, struct usb_device *hub)
> +{
> +	// Test if the hub or the device has been disconnected
> +	if (unlikely(hub == NULL || dev == NULL ||
> +		     dev->port_is_suspended == 1 ||
> +		     dev->reset_in_progress == 1)) {
> +		return -ENODEV;
> +	}
> +
> +	// TODO: test if the device has not been disconnected
> +	// TODO: test if the device has not been disconnected then replaced with another one
> +
> +	return 0;
> +}
> +
> +/**
> + * usb_authenticate_device - Challenge a device
> + * @dev:		[inout] pointer to device
> + *
> + * Context: task context, might sleep.
> + *
> + * Authentication is done in the following steps:
> + *  1. Get device certificates digest to determine if it is already known
> + *       if yes, go to 3.
> + *  2. Get device certificates
> + *  3. Challenge device
> + *  4. Based on previous result, determine if device is allowed under local
> + *     security policy.
> + *
> + * Possible error code:
> + *  - ENOMEM : failed to allocate memory for exchange
> + *  - TODO: complete all possible error case
> + *
> + * Return: If successful, zero. Otherwise, a negative  error number.
> + */
> +int usb_authenticate_device(struct usb_device *dev)
> +{
> +	int ret = 0;
> +
> +	uint8_t is_valid = 0;
> +	uint8_t is_known = 0;
> +	uint8_t is_blocked = 0;
> +	uint8_t chain_nb = 0;
> +	uint8_t slot_mask = 0;
> +	uint8_t slot = 0;
> +	uint8_t digests[256] = { 0 };
> +	uint8_t nonce[32] = {0};
> +	uint8_t chall[204] = {0};
> +	uint32_t dev_id = 0;
> +	size_t ctx_size = 0;
> +	int i = 0;
> +
> +	uint8_t *cert_der = NULL;
> +	size_t cert_len = 0;
> +
> +	if (unlikely(dev == NULL || dev->parent == NULL))
> +		return -ENODEV;
> +
> +	struct usb_device *hub = dev->parent;
> +
> +	// By default set authorization status at false
> +	dev->authorized = 0;
> +	dev->authenticated = 0;
> +
> +	uint8_t *buffer = NULL;
> +	// Buffer to hold responses
> +	buffer = kzalloc(512, GFP_KERNEL);

Should this not be cached for comparison after resume?

	Regards
		Oliver


