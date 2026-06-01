Return-Path: <linux-usb+bounces-38234-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kCzmOZ1RHWpfYwkAu9opvQ
	(envelope-from <linux-usb+bounces-38234-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 11:32:13 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCD161C7AA
	for <lists+linux-usb@lfdr.de>; Mon, 01 Jun 2026 11:32:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D58283009550
	for <lists+linux-usb@lfdr.de>; Mon,  1 Jun 2026 09:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EB1F38F24B;
	Mon,  1 Jun 2026 09:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="BhUJG7S5"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E6E138D687
	for <linux-usb@vger.kernel.org>; Mon,  1 Jun 2026 09:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780306105; cv=none; b=oTJ/VMCNotIonAIiAnUOixaJV9f65I9qJQ0snxP20XZtKp8o8/UV0lMTlsGtthqoF7tFL+JX5PNC21KrymEFXTCo+zdFrYPTRW9evahiaXB5CdT3D9H8qcVStDMCS1QGyHJEYREp354FI1STWg+PdBvK+fL0cmaEEIKp6twuRqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780306105; c=relaxed/simple;
	bh=qISxukj7bP07a0oMVYPi40wIojakpTlqaZuFlY0WimM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N2QkuaNQvGw2mhmR3J4AbTudhe/7F3/vssoDeubkw2XkfBMIrKa+gIV8BMx2XVLqoe/4FXe/XcyBeH64vTIIsFFCY+KIawD4khtBpuzQkmOHGeO1krdY5KnrDrbnE1K+MM8hAJUawpQeUnnf9wAa8tojHK/lx3h306k1OPTjuNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=BhUJG7S5; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490a7678b2dso9345575e9.2
        for <linux-usb@vger.kernel.org>; Mon, 01 Jun 2026 02:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780306102; x=1780910902; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MGW5eCjxumclxYE0q+PF/dXhex12Mz/P7wWLTIvBVz4=;
        b=BhUJG7S5d9/7c56qDBvrWlaoSZHAn8D+aLI05B29y5ui3OhUdqCGN633laismLgbxb
         daX10QQ83aFgsFWBITOTZ/66cuKPqtyvT/on0onz8LJ1v3KGR3XUjoQdjHpvWd7sOGrj
         2G5+rB3/Xjt22S1aetqvgvz6Q5BzryQ9Ax0EtEL5qbnmGWswNT61mkZmIC3SfgYRqU8P
         4BqH9wECHRVwkNgqWQLhm9rSyL1PuqsANK1JZ+uymzpQv+X85TN+ZN7w3JF4vX3ApV16
         pAs3opglOIRIOniouIXDmAh1tBZcAg7LI8uhEQno5C8ZwJh38GIKwqfgQk/i+BnTfsqA
         i87Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780306102; x=1780910902;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MGW5eCjxumclxYE0q+PF/dXhex12Mz/P7wWLTIvBVz4=;
        b=EIKOf03p0qjUyQ/noHVV/cVlcsc7t2ASV/dRFMvzcEgtnc8LJ3az4y1PlX+jfCWpuu
         9B1xHfXecDLrFMvXTMBeTrvmOfteb8vXCMBatPq3it65FvFU5HC7qQc+qYl+zM+P7W0E
         3Q/Yub5dlIMLA/0O7Kg88C496Iget8HbYOq4oIZ1Fq/lgTs5BonCOraOZK7AuN3FFg67
         90IzQY48rKr55sU06a2/CkPSJcPy9YTZZvX/dsoswEJL0ekXARswoFBxIxtVOd1I1FAE
         IRbJlcvXxQo37AKc+9qhJPNYg7U+niUrcQz1AkUpOSyZD3iWvABXrYAxNxkPfdOlbeng
         2AtQ==
X-Gm-Message-State: AOJu0YxQfjH0cf7scikVz6tgxBnZHymS8qgmGGlv2ZWDCbAkpMSnwTKS
	H63PvmuD4z9v3whyoV0dA9SWNzswBZ6q2BEplNUaDtElQDydIzO6ge779ExqxKvM90k=
X-Gm-Gg: Acq92OFiJmeL5/1uzpSCty/jpTWhh547ov4AFuWVpJ5TtoWY4WBLjZ5ZUBb/13ILjai
	8TQ5iUheUXQYp4ZbJiySwXIBqPnZGMIN/SGRg75J0eLv4iheYNbnHhdJVHPvJzPP/smYnkoGECs
	gPXDEM2TqoT877V18gAMTQlgYHtaQFzubAKH/DU0dnv1UQCrHSBeByexQ2X0e6bjidzvpRDbU8j
	9iC8qCOavEKSf2zsPAi8ibGg07jNClf4Q4zAGG/pctKAsd79vFw04yQNLS1ci0YAEzX3ZYckGtc
	zBNGr9ZsWwCj8pfhkVBcoIS9apHFJLMznwRdiibSAvSzsrKOCg3ygzQgA4U7mcjvFNidbo4aIJm
	s/b9DZnRHUFDJNfLgS0c4CLuJ5Hp42e4GnyrWso1728AQnfSC1dsR7PB5doYeJPTF1861E2HfHu
	VJv5feDsnsGABlJ/dNqEdSSAyDfYOp3AQp91czdHk6R4piZMHgLqPYGbuTSn7w9XVK+s5rxVHpW
	dzJPEFT6GrsRUM=
X-Received: by 2002:a05:600c:c492:b0:485:3abe:ab86 with SMTP id 5b1f17b1804b1-490a2900efemr194615805e9.4.1780306101883;
        Mon, 01 Jun 2026 02:28:21 -0700 (PDT)
Received: from ?IPV6:2001:a61:1306:db01:79ea:665d:fc20:ccf3? ([2001:a61:1306:db01:79ea:665d:fc20:ccf3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6a0e42sm230764555e9.8.2026.06.01.02.28.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Jun 2026 02:28:21 -0700 (PDT)
Message-ID: <23089596-0e0a-4492-b95a-ec982ac5dc93@suse.com>
Date: Mon, 1 Jun 2026 11:28:20 +0200
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] usb: misc: ldusb: fix ordering of usb_deregister_dev()
 and usb_set_intfdata()
To: Junzhe Li <ginger.jzllee@gmail.com>, gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org
References: <20260601075524.136957-1-ginger.jzllee@gmail.com>
Content-Language: en-US
From: Oliver Neukum <oneukum@suse.com>
In-Reply-To: <20260601075524.136957-1-ginger.jzllee@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[suse.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[suse.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-38234-lists,linux-usb=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linuxfoundation.org];
	DKIM_TRACE(0.00)[suse.com:+];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[oneukum@suse.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:dkim,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo]
X-Rspamd-Queue-Id: 5FCD161C7AA
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr



On 01.06.26 09:55, Junzhe Li wrote:
> In ld_usb_disconnect(), usb_set_intfdata(interface, NULL) was called before
> usb_deregister_dev(interface, &ld_usb_class).
> This opens a race window with usb_open() in the USB core:
> 
>    T0 (ld_usb_disconnect)               T1 (usb_open)
>    --------------------------           -------------------------
>                                         fops = usb_minors[minor]  [t0]
>                                         /* fops still valid here */
>                                         file->f_op->open(inode, file)
>                                           ld_usb_open()
>                                             dev = usb_get_intfdata() [t1]
>                                             if (!dev)
>                                               return -ENODEV;
>    usb_set_intfdata(iface, NULL) [t2]
>                                             access dev->mutex [t3]
>                                             /* dev is NULL! */

Again, no:

         dev = usb_get_intfdata(interface);

         if (!dev)
                 return -ENODEV;

ld_usb_open() checks for NULL

>    usb_deregister_dev()
>      usb_minors[minor] = NULL   [t4]
> 
> Because t0 precedes t1 precedes t2 precedes t3 precedes t4, T1 can obtain
> the file_operations pointer for the device (t0, while the minor is still
> registered), then continue into ld_usb_open() where it calls
> usb_get_intfdata() and gets NULL back, leading to a NULL dereference.
> 
> The intuition is that the global exposure to the 'usb_minors' should be
> disabled first, so that subsequent nullification of the interface data
> pointer can be regarded as a local cleanup.

No, these drivers use intfdata == NULL as a flag to indicate that
a device is in the process of going away. The order is disconnect,
together with the rwsem, makes sure that ld_usb_open either finishes
and sets the flag for a device being open, or gets intfdata == NULL
and returns -ENODEV.

The order should not be changed in these drivers.

	Sorry
		Oliver


