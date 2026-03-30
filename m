Return-Path: <linux-usb+bounces-35691-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OD3bCe+yymkX/QUAu9opvQ
	(envelope-from <linux-usb+bounces-35691-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 19:29:19 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 658C535F4E5
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 19:29:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5C2453044B8D
	for <lists+linux-usb@lfdr.de>; Mon, 30 Mar 2026 17:26:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 496673DD504;
	Mon, 30 Mar 2026 17:26:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="dJ5NwMQL"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688213DD51C
	for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 17:26:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774891600; cv=none; b=AwqttDF9CztK9z4/dPxavoeaJdcL/muj5Z5MBAE1/Oi9Uk83q8TVr5wEbXZWh2dL+YxHNufeQZtaXv/W/sVGqKus276DpkxuZWuAnr030zvoUyvJ3PAqrZvmeC9LeGy6bfOk+Hw5n86Xge5XhDjH67U0BXFF2VW9VtoZ4MTd6UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774891600; c=relaxed/simple;
	bh=Azf9t9LLMEluFtDRi2U0rirw+r6OKxYM1c6Otzc4+3I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WcRivO8a3uz0olVz2Hk9kzZP308qnYnyX9SaD3QR2QG2SF4yeIbG2cpv7ood6TpON2V4OyWmawisz9f0mLJgvRPNwwlNHf43ZQPANa445jJ6ftpsgkLaki63oUgT4ZyvAm65WEu30PTWBNdIq2cWq5S8OMA0hZ8ccChyGgLVoBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=dJ5NwMQL; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-486507134e4so55003275e9.0
        for <linux-usb@vger.kernel.org>; Mon, 30 Mar 2026 10:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1774891598; x=1775496398; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lQ4Qre2xZc/I28s/3C4XOR6vzlzaxw3SBjpFEsksT/M=;
        b=dJ5NwMQLCDgAHLqvn9AgDiV0smkwBPhxKR2Up1vD4+6716E+VuPSGokFWnc39axQjk
         nHwg6SHynspLYetd2ZA80sKOSeF5/ktUz3fO75PsPeCTADPZlRWO07NeA/8x8ULGbi4h
         bu0fth5kXCSdv0rBVbiUU76ufjxjH1azGNktjBh90C1tI68LZaFRamBCtn2RxMwuLYPm
         LfUMyz2olPaMSQpPf6+cWSBx6w2Tj8NBBWZM7dLJzcSTT2ZVZN9PhERsDLBMEUToZ9E3
         5Sa6lB04IawiI9RUVDEmkBce0USd2h6eMOjT/9Br6rWvnkx0NFYKEbsnzpjiy4qGof+V
         zZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774891598; x=1775496398;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lQ4Qre2xZc/I28s/3C4XOR6vzlzaxw3SBjpFEsksT/M=;
        b=dQzkmzjeWZtm1R39/ZlUoLasxOnSOQX50av5VVv47v/BoK6bPIUxrKqNJ+mIqT/iF+
         pyo87rjQKcbEBxXhxzrgv09++hWlKLzHk5LTR7IDJKaCN/HtVMrlNoeRML+NxAWztRUv
         d4TPWJVsYNhXsesZvxgmACXhRDeiEY8AanJ5Dk2loVxJMLUCLgoXuL9kUplfRblB7eY8
         7fFqZr+aQLgyDnP8qXaaHZkdOARBQddoH7szrH9XN2oEQe995+k/RwskYAOzEYhbjHpq
         RFBn9Rm6U06sz0EshV3upvlWYIkzA85Ypi8VD33wevMVoDoIrOCyS5DUAjfbEGlFQP+u
         9e5g==
X-Gm-Message-State: AOJu0YwPDVH7P/xYl+W7gc52GmjrR34lfohq8Qm7VKSlgABpYQUvsRf7
	smGahed+zGXyJiOPZYWZkHYY3Tu1sz2hsr4tQJf2BR5o6lKsyR9aS6M/FFuiQsGExs4=
X-Gm-Gg: ATEYQzwHVc4B/0qwCIhwWDxQFaEeaclGzLUmFWI90B0ek1oXuaJLd9d+s0BB6OWg1D3
	22nH0mMw/yAxIMX6mZS/F1kNEHhSDlxix0QWGLm/mxE0FnxLSjiSM9fF3au8VH1PMPRFpnct0yN
	m36zCTSfHHdZGIlJDk4vNLPGFpOLeBEw65/vCWRsEocbn5EnlhtOPqPREdKoiugROT9XLPTAX86
	PWwWj215dB8R/6D9BX+WMdOv4mEvoDUdDgqwlgXt0h37OSqIf4biyK3qJGaGntms/H8TjBxaXbo
	j/A7YMRtohfOofYQY4tEKsmxklOhYGiBumxDC3WgbD4k5eOe2FsvN120MKSbGCP23kIJdsup9wS
	dm/WkuVaLI32AJpZOwSewq+B1wAg56bIuFDNbSSOU9URHUQvJon7LaFSlNk+GEHtVCPHP5NotZ2
	qlJ4XLmpYqufLAvSDeKcDiYNWppMMVek4xuFyt2xy3WRg9LafWALixZRWZkaJ9v9kvWQ==
X-Received: by 2002:a05:600c:8b88:b0:485:2c61:9459 with SMTP id 5b1f17b1804b1-48727d83bc5mr222279745e9.8.1774891597796;
        Mon, 30 Mar 2026 10:26:37 -0700 (PDT)
Received: from ?IPV6:2001:a61:1373:4b01:cc61:7bc9:bea5:a415? ([2001:a61:1373:4b01:cc61:7bc9:bea5:a415])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf21eb95fsm22449089f8f.12.2026.03.30.10.26.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 10:26:37 -0700 (PDT)
Message-ID: <59336d5a-28b5-4f34-b598-3d7beafbaf3b@suse.com>
Date: Mon, 30 Mar 2026 19:26:36 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: misc: usbio: Fix URB memory leak on submit failure
To: Felix Gu <ustc.gu@gmail.com>,
 Israel Cepeda <israel.a.cepeda.lopez@intel.com>,
 Hans de Goede <hansg@kernel.org>, Sakari Ailus
 <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260330-usbio-v1-1-7141b6dc612a@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260330-usbio-v1-1-7141b6dc612a@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[suse.com:+];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,intel.com,kernel.org,linux.intel.com,linuxfoundation.org];
	TAGGED_FROM(0.00)[bounces-35691-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 658C535F4E5
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 30.03.26 17:47, Felix Gu wrote:
> When usb_submit_urb() fails in usbio_probe(), the previously allocated
> URB is never freed, causing a memory leak.
> 
> Add usb_free_urb() call to properly release the URB on the error path.

Hi,

the driver uses goto to unwind. Could you use the existing code
with an additional label defined?

	Regards
		Oliver


