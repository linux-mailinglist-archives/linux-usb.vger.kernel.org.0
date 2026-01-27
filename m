Return-Path: <linux-usb+bounces-32783-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mJAxLX2EeGmqqgEAu9opvQ
	(envelope-from <linux-usb+bounces-32783-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 10:25:17 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B9F791A8E
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 10:25:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id CD51B3017C09
	for <lists+linux-usb@lfdr.de>; Tue, 27 Jan 2026 09:24:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17FBA2DA76A;
	Tue, 27 Jan 2026 09:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="L8oO2AK7"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D6072D9787
	for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 09:23:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769505840; cv=none; b=KOkwTgICjnCZy/gEW4IUPfK5Xu2pAVxHjnaXAOXoeKtV1R5M3OgozPbCeo7EdKqV1a27f9gQN6CK7hM1ekUfKL8/oNDKOV0LOTcYBxJhNr3lte8SPK6kgVPZPZFDRQIroOeZh8AS7MNHWZLd3AEbvA0tapFHRlK9lqNVSf/Bc00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769505840; c=relaxed/simple;
	bh=1/iUH8Y51lHdcNvj4qwjV0K0QoMu7X33Yn+rwXhA858=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A3LDQAX4QE72y6jaJOcB5KlsMA/lXhMWZg4DyWSt5Ad7+3BzLCxnnx+MByTPuoOc9Y4P7nGx52V/ZsvJA8y3eI9zNVB8HNgFafbFhMZcIr8mw+05enlOQOE03E0qybsoo+wmbW9zLKQo1s3mOHqBg/2TNoL8hE9Q4YHIsuAlPaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=L8oO2AK7; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48049955f7fso46654265e9.0
        for <linux-usb@vger.kernel.org>; Tue, 27 Jan 2026 01:23:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1769505837; x=1770110637; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1rymuFbvBBtXY/nydGoduhBnxQ6RXb+ltZKTsRxuPdI=;
        b=L8oO2AK7oGrkxWF+I/gEO44Rm/U7Zui59Gy9tJTOt21nK8l4XoRvQTmDzLe3K0zkHj
         y7AC6XwBGX9jQP5IFnBoRpaewQY33f/+3y/WIdPwjrnslfeE88Y9b81ABKDNxdG0ZH7K
         vKR97tLK1RzCTZCACIZ9Jz5w7s9ivKFlKyTTSQh3OjJ8MqdfBQ8RNoMoLNq3KfBQHhqf
         2oM6ISSA77XC3j1pwwDVzr6Nz3mDWPYhRdySklgl/zlnGC7fLW6/+ZWCuz0IrMU3eRWC
         7HJg6QhX92fFTGQZb1AV/I70IA6H74EXV0fve584O647drOiF34covmuVRVB6GArWa8n
         E4QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769505837; x=1770110637;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1rymuFbvBBtXY/nydGoduhBnxQ6RXb+ltZKTsRxuPdI=;
        b=ddvHBPCvmudeR7iRXa/K9PdhkqSNuWyWW1zUEX3Lxh+FGIBgN/l0doIZRy49r9vMvR
         60BQx/2KkHUlBN1ujlh2IfKcJkjHdoXBTnieoszEuNxj4dwA11zFx5plG1W8J1prF7qU
         HVCyCjffTiSyxukWf2nP3D/EN9BnqrN/nEKyctzfGugK1BztdnAEKzMhxisjQh2rd2k7
         ZOW+o4RTOe1Kr4FlSJ6LajktU2qGpFFsvnOpcShqXxurxVxjhA4/Hajfir+ousIV2+xz
         zQSbo2k+uhLg0ibe92B3au7goCvLMUvEUQsRqBwb+CkzOCYYSFMB7uhv6QrqU9PIE6MQ
         gbhA==
X-Forwarded-Encrypted: i=1; AJvYcCV8p0m6piGod3k4w/BXmVvkI07DH1bEVFsDE2NOG6DhfOz2OUi+9LKiMmsra31S3Gum/ra/tyCjxT0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsS9fQ6xOhQxArWbvTiqhM0sVKYbsIOvODNwalb5/vKs6yEyfd
	ZoAvM596oaS7YhZDfGKGe2PZqzwsNI/vHVi9gtqMCxf8GCq6PTkR49I/uVs4G+Nk6C0=
X-Gm-Gg: AZuq6aKZcs+NeM/4NlncWlt0Io16iuRvANDWfcFjQENqBMtgfVU2eriXPGaFQKUeGwv
	za9iROD1d/C0zNjRrKLVeOp1GjD1fLVHu5Z6rmcK+rFdby9SXRK3n2/pTyUdLVIIb1+JeQUXT7i
	beJV5wWuOLbCau5ii3LBPxKtC0BLG01DQvlf4gcVSNVMvzI6mfpzz9kXB/eCQ6fYaMf397ldkY0
	glRsP0VOsJHvHIj8x9A+ufdSaKX5sEIXv543T2BQHghFLxLKzU9VnmDm6wt24K3GuzzsJfKw3Xz
	Phx3TjiZouCi7gJSP0NlZyIKJ4T0xUQE+nYf0qnUUX21RPYB1wV9VPVnvvOruDPDq+tbGXJUA0u
	WLMQVKio26iSHurg11tjM+0EM/yfqDIvOxrPqZ2CTOQkZH1l8xXP837OnvUokA3sJuoA8yKKqxc
	v/Wrmfz0iNBaStvFlRArvH1fkqda96/As55jvQCtbDNkVHUB+h+u9yo5E=
X-Received: by 2002:a05:600c:4746:b0:47e:e9c9:23bc with SMTP id 5b1f17b1804b1-48069c5547amr12943825e9.30.1769505837492;
        Tue, 27 Jan 2026 01:23:57 -0800 (PST)
Received: from ?IPV6:2001:a61:1310:7401:36c8:bb62:3315:2c36? ([2001:a61:1310:7401:36c8:bb62:3315:2c36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c24bedsm35318025f8f.17.2026.01.27.01.23.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 01:23:57 -0800 (PST)
Message-ID: <314effcc-5bf2-47c5-9757-aafd5b47fe65@suse.com>
Date: Tue, 27 Jan 2026 10:23:51 +0100
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 3/3] net: usb: kaweth: remove eth_addr_t typedef
 and bcast_addr definition
To: Ethan Nelson-Moore <enelsonmoore@gmail.com>
Cc: netdev@vger.kernel.org, linux-usb@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
References: <20260125083501.34513-1-enelsonmoore@gmail.com>
 <20260125083501.34513-4-enelsonmoore@gmail.com>
 <9239ddef-c197-4fbd-8e88-691766bda3e2@suse.com>
 <CADkSEUjgRrC9eAQYOkaErd7wyXKkUs7+dG+Q1jz7VbqF+zxwuw@mail.gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <CADkSEUjgRrC9eAQYOkaErd7wyXKkUs7+dG+Q1jz7VbqF+zxwuw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	TAGGED_FROM(0.00)[bounces-32783-lists,linux-usb=lfdr.de];
	DKIM_TRACE(0.00)[suse.com:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[8];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,netdev];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5B9F791A8E
X-Rspamd-Action: no action

On 27.01.26 05:38, Ethan Nelson-Moore wrote:

> Hope that helps you get a sense of how much these drivers are being used.

Hi,

yes I am aware of this. Yet there is no point in breaking
existing setups. I would prefer this driver to get only
clear fixes and adaptions to changes in API that are absolutely
necessary.

	Regards
		Oliver


