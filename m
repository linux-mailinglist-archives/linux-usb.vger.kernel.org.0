Return-Path: <linux-usb+bounces-33236-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2FvyJF70imn2OwAAu9opvQ
	(envelope-from <linux-usb+bounces-33236-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 10:03:26 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BCF01187E6
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 10:03:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63E55304B5B0
	for <lists+linux-usb@lfdr.de>; Tue, 10 Feb 2026 09:03:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D1BA337BAC;
	Tue, 10 Feb 2026 09:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="LthhejpM"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D4B27AC4D
	for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 09:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770714194; cv=none; b=Ma+nuanFdMQUg3awTbCSNgpa2P21ghmVzOX1xQjvEksPMf5qSAL/eWzfG508ZCpCq7qWiTAI55o12/Tsoc4dberk+/JzK/unGD/NoLWPhsPxBriI1rCjBzhmwtpAjYysq74GeGqI7NiaWrtBB1Ic5KcutwWEao6SoEbJKOS0+Gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770714194; c=relaxed/simple;
	bh=tu2bbdz55P3UG94HvrYjp3CCxNOSNq9EpR36XKKOsCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y9jvIyS7UPLC7nb07yue+pmhMiPEqLbxM+YYUJoqjTqirFRcb7ZHslB54yM893xLuesrRwydr3FFHI0F62lUhEb/9A7QgE8RkYlApJGJaB4/xbdYNiLVev7JV7ti9Ul4cu8TMBMZB+o8SQngpBK0JizTsx+zOl0vspfq6ri4YE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=LthhejpM; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-4376acce52eso363409f8f.1
        for <linux-usb@vger.kernel.org>; Tue, 10 Feb 2026 01:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770714192; x=1771318992; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8medDW0oenBrzUBrRSlRJZNIFi9BWTlMqfdHJQvsA/4=;
        b=LthhejpMDX2s29f8Zh7xAgllmH644cTajmKWZWfm+Irwb2oTdt8E/aZ1xZEDoe+3L2
         UioBYDASN7xwAyNdKSCeejiaIzs+R3k4mg7NaV7asuXnAfCM7+j2UH303ntI3G0kQ1CN
         YLtl3ekOTrm/KuQY5b/kR+rY0dSF4MP6XmdQSU8qpIr5SPM23GQKx4rRkskeefx5DAFI
         ncmfS6amHgt4k6vPFSCU5HzknR36fQCcCR3C5f2UFgMrQUmL7b6iE0sgg0IauYkVhzUH
         ixYzGJCCC+AUa2lmAND0zBD8eE/CU+GY77m3p4kJoqjWrErcNeuHSqTQm+Y8aezEqdUM
         ISIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770714192; x=1771318992;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8medDW0oenBrzUBrRSlRJZNIFi9BWTlMqfdHJQvsA/4=;
        b=PCPlqpz2Be8dkFaZfXbw9a9Mun6qRQ3r5FUz+NRuaicZjUGLd1eKHoHFCWcSujHaTo
         /KgjEjkjT15uD8lMsGNcNAKG+3Xyu/OvjDkNwc2poLN7iefu6D8mD7jUCHR+zluZMIW0
         HRMLTe98Ij6yIrfaI/ioWj4P6FJ82p4rnv7GzyMQBFISgC1ARZH7M/87qzQ4vB7pKdvg
         qy22X1jjbHDWViUhowbQrBeAA3dXQzN/fXdvZa293+lgPzb2Plab9wvagijmObDQ9eHN
         fULall7y/Ie6IlzNVIfcwv8I/XsSgxMKgA6GU1BFJXCDKDtQYnlaZTUkQpehuDStv6kd
         zrLg==
X-Gm-Message-State: AOJu0YzShJhC/Z809eI7KL24su1vS6Hklp2+AbiSCD+t8hTTY83DpSYN
	mTlWOWGCKyGlaE9+UkQfXVojZHTzekJBo4odJidWUHighBpfaVbw9Bvi8N1HA96CCfg6+CSJlz9
	VsvKh
X-Gm-Gg: AZuq6aLxBMSo2+YyxEsVurRUEzORohpbGbylPtsycPboRX1eG0s5EQk4tic49WXJ9Kd
	SQcbzJjUUC9M0A9GmK9Jg6GpkTEbD9GwkOzcIEgH0FkxOMiT2Qd1y6xOLFO3yUs7dG55uSQOpUO
	coTY2qCUW4Ox41wfEhBuPhMettlG1E9gj8LwEQTwG5FAcHqqyFT10Hk9oPQCHCqdcVAJwzBl4PG
	NxRDj2X2pCIx8kZYkoMr1LPz0cFlss8MF3Oee6iO2t7mFMP28ZhW1adR/o8g9UQrHFtnDgLmd5M
	uF52bIWrJs9E5RYMduBqapxOm4LUmcqwA1NeNr7X3cZKQjgKgTEYlVRQvZpCNGfvvx1L+7NS+XP
	BDWguWK5dlv7lML2ftKp9u2/DCOlsDzaTtzqxr4BC+43pXLmgr/5AU0rHoFtYuuKexRe7OgGOdM
	UE5wgiWJjwHR2BnmID8oeEIhAi1iADK43vzriz8lxQuc0GFPJd5GYas/kUnyA+92VEHeI=
X-Received: by 2002:a05:6000:40da:b0:437:73a2:2d4c with SMTP id ffacd0b85a97d-43773a22f63mr6469807f8f.13.1770714191710;
        Tue, 10 Feb 2026 01:03:11 -0800 (PST)
Received: from ?IPV6:2a02:3033:271:6136:26bf:3287:7b26:bb30? ([2a02:3033:271:6136:26bf:3287:7b26:bb30])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4362972fc1bsm34702005f8f.28.2026.02.10.01.03.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Feb 2026 01:03:11 -0800 (PST)
Message-ID: <fa1e3282-0559-4ddc-97ec-be07a41ab27e@suse.com>
Date: Tue, 10 Feb 2026 10:03:09 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] USB: usbtmc: Don't accept very long timeouts
To: Alan Stern <stern@rowland.harvard.edu>,
 Greg KH <gregkh@linuxfoundation.org>
Cc: USB mailing list <linux-usb@vger.kernel.org>
References: <237c76a9-fcf5-418b-a3a7-51929af1d69f@rowland.harvard.edu>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <237c76a9-fcf5-418b-a3a7-51929af1d69f@rowland.harvard.edu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_ALL(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
	TAGGED_FROM(0.00)[bounces-33236-lists,linux-usb=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MIME_TRACE(0.00)[0:+];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	RSPAMD_EMAILBL_FAIL(0.00)[stern.rowland.harvard.edu:query timed out];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,harvard.edu:email,suse.com:mid,suse.com:dkim,appspotmail.com:email]
X-Rspamd-Queue-Id: 3BCF01187E6
X-Rspamd-Action: no action

Hi,

I am terribly sorry to be only critical today.

On 09.02.26 21:00, Alan Stern wrote:
> The usbtmc driver accepts timeout values specified by the user in an
> ioctl command, and uses these timeouts for usb_bulk_msg() calls.
> Since that function will reject timeouts that are too long, change the
> driver to reject ioctls setting the timeout to a value above the limit.
> 
> If it turns out some users do need very long timeouts for these
> messages, we will have to remove the limit and rewrite the calls to
> usb_bulk_msg() to be interruptible.
> 
> Reported-by: syzbot+25ba18e2c5040447585d@syzkaller.appspotmail.com
> Closes: https://lore.kernel.org/linux-usb/8e1c7ac5-e076-44b0-84b8-1b34b20f0ae1@suse.com/T/#t
> Tested-by: syzbot+25ba18e2c5040447585d@syzkaller.appspotmail.com
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> Fixes: 048c6d88a021 ("usb: usbtmc: Add ioctls to set/get usb timeout")
> CC: stable@vger.kernel.org
> 
> ---
> 
>   drivers/usb/class/usbtmc.c |    9 ++++++---
>   1 file changed, 6 insertions(+), 3 deletions(-)
> 
> Index: usb-devel/drivers/usb/class/usbtmc.c
> ===================================================================
> --- usb-devel.orig/drivers/usb/class/usbtmc.c
> +++ usb-devel/drivers/usb/class/usbtmc.c
> @@ -34,6 +34,8 @@
>   #define USBTMC_MIN_TIMEOUT	100
>   /* Default USB timeout (in milliseconds) */
>   #define USBTMC_TIMEOUT		5000
> +/* Maximum USB timeout (in milliseconds) */
> +#define USBTMC_MAX_TIMEOUT	USB_MAX_SYNCHRONOUS_TIMEOUT
>   
>   /* Max number of urbs used in write transfers */
>   #define MAX_URBS_IN_FLIGHT	16
> @@ -2014,10 +2016,11 @@ static int usbtmc_ioctl_set_timeout(stru

You are doing this for the generic timeout.

>   	if (get_user(timeout, (__u32 __user *)arg))
>   		return -EFAULT;
>   
> -	/* Note that timeout = 0 means
> -	 * MAX_SCHEDULE_TIMEOUT in usb_control_msg
> +	/*
> +	 * Impose a maximum limit to timeouts because the wait in
> +	 * usb_bulk_msg is uninterruptible.
>   	 */
> -	if (timeout < USBTMC_MIN_TIMEOUT)
> +	if (timeout < USBTMC_MIN_TIMEOUT || timeout > USBTMC_MAX_TIMEOUT)
>   		return -EINVAL;

Limiting the range.

>   	file_data->timeout = timeout;

This is, however, used in multiple places. Among them
usbtmc_generic_read(), which depends on a device actually
producing data. That uses wait_event_interruptible_timeout()

I am afraid you will have to check in the specific ioctl
or recode the wait in it.

	Regards
		Oliver

  


