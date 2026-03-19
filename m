Return-Path: <linux-usb+bounces-35140-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFxSHs30u2moqgIAu9opvQ
	(envelope-from <linux-usb+bounces-35140-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 14:06:21 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCB92CBA3B
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 14:06:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 75DA53016B2D
	for <lists+linux-usb@lfdr.de>; Thu, 19 Mar 2026 13:06:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 49C071F91D6;
	Thu, 19 Mar 2026 13:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="YWikQxcz"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E553CCFC7
	for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 13:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773925572; cv=none; b=M3APRBtP44EU7NaCw2aWL8GikAkMokaOruSSsK2s3jWrNDVgnSTQSMYHQM7yXGebm7qYj8F2BVzhsIywAxm8YtkRBL2mG4nHNpJwSGqE9ovnD3e3IZ2rWPTm53iV5WPxoc6Mw7mAV9KUhxXSGtGUCJYsZFOm9XOfGD9FY0LUoqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773925572; c=relaxed/simple;
	bh=uI8DKe6yybTdOAZ7CocZogbKQO+mTy+ZZeY4VMmED1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hlixiuG/asdhAWxXZdksOvslWAZMBhRRhIdHS0SkAt6uH+yxM1FG2NX6sjMAi+LAoHKvp3NE7rQGiEpraJLabGQHufMQlwAmJUdiS7RWUllpTLyfEv51WYjwEAVIdqUT4tQkKLV1QGrH/fCcIb491bGB738fC2kmkfBiWYCaf1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=YWikQxcz; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4852c9b4158so5808915e9.0
        for <linux-usb@vger.kernel.org>; Thu, 19 Mar 2026 06:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1773925570; x=1774530370; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9dXn52GKln/hDK24WGIxCij2hW/EwPXvaYgcOBpB028=;
        b=YWikQxczqQOmV8GX0thCD6wKgMX/ntipjFkomhXg5cPNR/+cZD1vvIn4mbDfv5h+4N
         IF7rIzoeoNJvq1t1SBQZY1bU4uU7SLkQM33S/ZtRZa5DvwpTynPnrVS1DxshgDa875la
         yyCBepKKTyPZfj5+PtC8NdjxD/HWH7ij1u5zYQw5OVlZTSFnaujLZ9I53i3UVBq2Y7D5
         KdmdltamUQonmdvOcNmXgprfnWTYAMhG+Qtp5TWQCjrqZorekICW00OdkgeZwq2pbiSa
         3gjAcRlhqLZQG+XOGatf390J7menm6gUIVbEgfoeDxTDRIX2ou8chU0AQa4JfoE0xCHZ
         60nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773925570; x=1774530370;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9dXn52GKln/hDK24WGIxCij2hW/EwPXvaYgcOBpB028=;
        b=PrJ80bh2YToWZ4Frf8Me3r1q1kYmuwKG1fnT2nfVVNa45p65fF1xpS58gmIu5txer+
         Zw/NAiIMk/0EsS0SQov10qRqBsY4KZg6wSjpZtbDAkIPay1VEemJpKdNFvyRcNkaEZ8n
         1j+R3D+XGq9XHzhAVX6iF15Nk96PPs6mn296ERMq6qUgzN518A7dOp4L89l9R20aVd7f
         hQMsIhuhD2FKhaycs6OR9Zdb6hOtcqRbKjNTdknl2WPEscuw/JMW1SnkxIYY8PXD+j4l
         cwSMSRzrs+jnTy87tuzJ7U1kqAbwwZXb21Pc53lXEyC+GEcHutVV8Xz2XptUjzpLY7EK
         6mZQ==
X-Gm-Message-State: AOJu0Yxx2ORTEoBamp47DTb1oygsmh4Q0psBLyv/kXnlm8LTn9fxC896
	+QVQFn24bgilDaZZh5GL5nOpsCGzsSMFHkiDjzx/27/PC7Yj+BaKWOr9Wmww3A3lIEU=
X-Gm-Gg: ATEYQzygYlNCXgsvEoSIDyKiBIcV8XEWPnRoxmlhzRPKL7BkoDT1M4zAUovDBD1jroR
	qmN5svtcP08zFD52Y1no4aSyoLPLbwHojgJD74KRwpejGBPawx3ator7QEnu+8HHXDUV7W7KfNK
	weZjVl9boI4qcT5/UWTht55rURKIPkpa8CK7Y9BDmDZXlk1bMkn3IckykXJ+t8IIOc46olZTrEJ
	s2gfmDoRNPE4ShXWVxcHZfxXgEJ5zI5RvsnqmTXRqTecKIMbCsQms3t5co6WwecdBr03TbO+3UL
	Y5xkDrg5mBr/33BhnsmWB+ifRnU25ChCfwDlp/GQOitK8/eAIfceBcgwZJmXCXYsr7kFW9NQxOR
	ceDutVBkYmUFxpd2ruEZ4SDDVwSt+CJuo4B3WbDSLiPxT34C+GcB54Xbthk0psWGKwfxyMbcLee
	t8UjUllJlrukRlt2rIoj2lbXpVWM9vFwVlhbhytoxwONRbNDPy87sWLFd8IITQXSalpg==
X-Received: by 2002:a05:600c:1e8c:b0:485:3f58:d84 with SMTP id 5b1f17b1804b1-486f456f7fcmr119406445e9.32.1773925569524;
        Thu, 19 Mar 2026 06:06:09 -0700 (PDT)
Received: from ?IPV6:2001:a61:1301:b601:321d:fd64:6ebf:9f7d? ([2001:a61:1301:b601:321d:fd64:6ebf:9f7d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f8c2911asm67731735e9.3.2026.03.19.06.06.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 06:06:09 -0700 (PDT)
Message-ID: <ab1c2aa5-5037-4583-8c07-57385e0ca42b@suse.com>
Date: Thu, 19 Mar 2026 14:06:02 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] USB: uapi: add BULK_MAX_PACKET_UPDATE
To: Greg KH <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org
References: <20260317092244.1464921-1-oneukum@suse.com>
 <20260317092244.1464921-2-oneukum@suse.com>
 <2026031809-wobbling-sedation-1208@gregkh>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <2026031809-wobbling-sedation-1208@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-35140-lists,linux-usb=lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[suse.com:+];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:dkim,suse.com:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 6BCB92CBA3B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 18.03.26 16:10, Greg KH wrote:

  
> Should have USB_ as a prefix.

Roger 
> And what is 7?

I have no idea. These things have becomes messy. As
you can see some values have been used twice and
sometimes we use USB_DEVICE as a prefix and sometimes USB_DEV
although both are for devices.

I can try a full cleanup, if you prefer that.

	Regards
		Oliver


