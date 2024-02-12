Return-Path: <linux-usb+bounces-6243-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC8B8516F0
	for <lists+linux-usb@lfdr.de>; Mon, 12 Feb 2024 15:21:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C8C9AB2BB1F
	for <lists+linux-usb@lfdr.de>; Mon, 12 Feb 2024 14:17:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 016D13A8EB;
	Mon, 12 Feb 2024 14:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="OrIAwbC4"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFBE3A8E0
	for <linux-usb@vger.kernel.org>; Mon, 12 Feb 2024 14:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707747419; cv=none; b=cc4mPn9rOXFPyvko+QC/4R6FAj23Fk2Ix/HSKfabVMY9i9B/6PYad3bXoy5pHyTFSo3IS7dUmiqKKRNuNp+K3E+oIFHqj67Rx7o4bhehpc9JTy9Ocqk7uG67ilqwk48SwCr/S8rgMJ/RworItL25FGT24NOO6qZKF41Tcrs7zDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707747419; c=relaxed/simple;
	bh=8kRHptmmpnm8HWSq0s3ZuMGFbwYQ3ln2dEW9RaP1xJc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CWxpS7RFVV+CQ1lAPbr18DuaENRaSFalAClnj7YkLrG3pY8yi1xbKiAO3HUmwM71pqeCe7Yp4vNdljzUgHsRxD4DGuE0GH/eBpCqhZLVLNCX7QFHaX7kk2tROnqa9cDzPygqEq+nhZOylT26S9s8G9omDJUZz6iiEMvEd6g2DRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OrIAwbC4; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-51186925925so1578255e87.0
        for <linux-usb@vger.kernel.org>; Mon, 12 Feb 2024 06:16:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1707747415; x=1708352215; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0gDnGjAbPGV4bO48s099lNG4thniJY6a+za8Cv05+Co=;
        b=OrIAwbC41WfwD1JK7GT5nBNs+h6CRkmSBEjm6ljOK5p2VGjfpr81YqZV38U8e5zrsI
         oi92tPd/eqX9FbpKB5PuSDJIW8uAFxP2me0CkmtLSUdfFDrgz6Vh7QU2CVw+SwTssawN
         42TBY2c7B9b0pQ9Whz756ZGpZxLYZIZC4snA5XlwJE1uzuH87jG/UP1Gx0DmMpfDRJBG
         TWvevdKBE4aCtOQ5RLvU9IdjAJyVCxNIVW4Y5N8xZOGL0MWUmL/OScev9GxvvdAFBSU/
         DeU2HFd3zbWKxuHmdou5opPSkTDxcwhmE7a6LVokCVG53CwTGWR9MQK4DoVugJhE8eLl
         SErQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707747415; x=1708352215;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0gDnGjAbPGV4bO48s099lNG4thniJY6a+za8Cv05+Co=;
        b=odBMydQVft9JsgQu9s0KCq6qaSkj4l7jnM4e5cImgvH4qKooPmn8c2Rp0J3EaYB7Nr
         pZWOaLTPV6kk9dgn7au6GlEOKfC1zdlA/mnL/oS+qVHdDl+ixTvkyFhOnavH7PN51LLl
         d9FXmF3k0mU8qvTRw4B5E/n6ht7TibL6sur1q6jm3xQeFxWq8RWemaP478pMe0MrHkf5
         al6mjqLIkfTT+EJNxSyJQvJ9sdfj28jwu4P7SPInie0ZNIwd/hBsG/N5iOWMnLXHy/F0
         YDz0kQLmRE2gzRe58MsotUblArrgsBXPjkTmrT+fXajJXnCfZDjqW7Jj7h3fo4D4bvl5
         iWCA==
X-Gm-Message-State: AOJu0Yz70/1fm1ta2OVM7v8KOcSczsU5q/tw71I1So8lr0jqwJqQItQw
	8t1hp22Ysar2wR3lm+mC54S7Zs9p2df3qf6l9zm2Q/EouMAtrFVp/neJykaa+nA=
X-Google-Smtp-Source: AGHT+IFjql+I4tIQMgBXmxiAyH29FUO+0cRjxxDRQ9n96cwTRzx6Wo6CJdZjCSc2xIb+fWpEfsF1dQ==
X-Received: by 2002:ac2:47fb:0:b0:50e:937e:b00e with SMTP id b27-20020ac247fb000000b0050e937eb00emr4518926lfp.46.1707747415327;
        Mon, 12 Feb 2024 06:16:55 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVTJlh/eNDk+g1xgMlFXugqxY/UGt6jxLx4m2Jdj1o1PQgZg1TWnAAld5DFfQKv+KYaTMY8hs+z45fNZMKRCVY7//JwdcmdjtXfw7sat1VeL2i+MFXDiGKxohs/OXqVf3N6sEv2Iy+DhrRUyn6lvTNbvkiepdhvXVxD70v/ELX9WiOPhO5MzQ==
Received: from ?IPV6:2001:a61:1366:6801:b2db:904d:e0b0:46ec? ([2001:a61:1366:6801:b2db:904d:e0b0:46ec])
        by smtp.gmail.com with ESMTPSA id g19-20020a05600c4ed300b004103e15441dsm8982099wmq.6.2024.02.12.06.16.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 06:16:55 -0800 (PST)
Message-ID: <cf529310-233a-466d-ade8-e0de4e20a794@suse.com>
Date: Mon, 12 Feb 2024 15:16:53 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: common: add driver for USB Billboard devices
Content-Language: en-US
To: Niklas Neronin <niklas.neronin@linux.intel.com>, linux-usb@vger.kernel.org
Cc: mathias.nyman@linux.intel.com, heikki.krogerus@linux.intel.com,
 gregkh@linuxfoundation.org
References: <20240206125623.1208161-1-niklas.neronin@linux.intel.com>
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20240206125623.1208161-1-niklas.neronin@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06.02.24 13:56, Niklas Neronin wrote:

Hi,

this part should be part of uapi regardless what
you think about the rest of the driver.
Could you make a patch for that?

	Regards
		Oliver

> +
> +/* Struct for Billboard Capability Descriptor */
> +struct usb_billboard_cap_descriptor {
> +	__u8	bLength;
> +	__u8	bDescriptorType;
> +	__u8	bDevCapabilityType;
> +	__u8	iAddtionalInfoURL;
> +	__u8	bNumberOfAlternateOrUSB4Modes;
> +	__u8	bPreferredAlternateOrUSB4Modes;
> +	__le16	VCONNPower;
> +	__u8	bmConfigured[32];
> +	__u8	bvdVersion[2];
> +	__u8	bAdditionalFailureInfo;
> +	__u8	bReserved;
> +	DECLARE_FLEX_ARRAY(struct {
> +		__le16	wSVID;
> +		__u8	bAlternateOrUSB4Mode;
> +		__u8	iAlternateOrUSB4ModeString;
> +	}, aum) __packed;
> +} __packed;
> +
> +/* Struct for Billboard AUM Capability Descriptor */
> +struct usb_billboard_aum_cap_descriptor {
> +	__u8	bLength;
> +	__u8	bDescriptorType;
> +	__u8	bDevCapabilityType;
> +	__u8	bIndex;
> +	__le32	bwAlternateModesVdo;
> +} __packed;

