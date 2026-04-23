Return-Path: <linux-usb+bounces-36428-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WsNWNSKv6WnhhQIAu9opvQ
	(envelope-from <linux-usb+bounces-36428-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 07:33:22 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2618C44D496
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 07:33:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 73362302617C
	for <lists+linux-usb@lfdr.de>; Thu, 23 Apr 2026 05:33:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7A7F39280D;
	Thu, 23 Apr 2026 05:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eclql12N"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD8A12EBBA1
	for <linux-usb@vger.kernel.org>; Thu, 23 Apr 2026 05:33:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776922396; cv=none; b=PgKCbmh7gMKBVcCkFp9kEG1VPgKxYYFVMrAtpnpUfCi1KfIiTjHDTz6ksZ3t9niXNWZ/EmJE9V91D6RWsZp0hqMX4DCLzmOH1H801WiWBftDMT9FGzlU4qbt9FdT5LC81omA+61RYqF9eqsZSD09JMcmZydLZCEQBGoFcTLFnsA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776922396; c=relaxed/simple;
	bh=VM/a6gHi9Mh9+zg4N3zvhOpeMg3/kPxk13VglI5qr24=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=f/QTzjJJGIcjaq4YdqTTo2ECd3WoRmwCwoCXpXH8m3LDwkCLiGx336/xDfQUtrYV37Gwrgp9R5rmlEuiSt7gIuinHVQo69IgGtS8x0zsZlp/yBKCOV3C4MxKXCRPeHgzCTxxrhh0GXuGX62rGMoT0wN2ZpDNFMWBcm3sEdsDK3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eclql12N; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38e7d984096so68691131fa.2
        for <linux-usb@vger.kernel.org>; Wed, 22 Apr 2026 22:33:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776922393; x=1777527193; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wf/gH/waSg+x2h4OWKNCFAXJUlVj/0mZpJ2jusFD61k=;
        b=Eclql12N/XtICps35KzNBGEY9Jm4/VXDZalAFzNdVNsfOVJnZxfaekJ6yw58+G9KrW
         BfQoW+r6DHwAV+0TikAFd7/TcVmoz8yl8WFZzrmTAZePNVALvqKW8AfP4F4yNj0d6RK6
         GzYxUl1TC23mXyjBD+lHtNtpH2CpqWz/YjH+Z+j8EjwQ4wX9J+Ar8+vswLt/m4bMCxJM
         7ZXEYGEn0qVLSAztb+kLdE/0vxkta4sD4359Pyfm5XQP093xQj2WegFasNoyLzIJ2vOH
         Rmew2brnUQJ5ukxzIAYbzT2aSov7DjX5DtSxBr08oKnKzUyfXvr7Cq50PDAVxrPYmAGe
         KI4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776922393; x=1777527193;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wf/gH/waSg+x2h4OWKNCFAXJUlVj/0mZpJ2jusFD61k=;
        b=JPzJ7gp8a/UVvYnlOSJ4wOfBG48BnpGpmDtNHoWzn2o6dqyJGfjPcuaZBFa1kpIe9b
         fptj4i4mcxuHy/phLE+4lDTjf+FJ2ADnpbPPniBR9OiO9UPRqv9kpziL/vchMzY/oa9R
         u5zuL7+uNCyX/VEtka4D4kDCYUH0lYXaZ36Af462hRr6KAstmOuHfTyPSFq89Q6sD7Tz
         +EQEJHE6+XOng0Jb6I045UYcLERVmBkz3C/rosW1Cspr6J8smYBlu6cOeD8hUiYG9s8W
         3Z0MDQ+1G2LBWVCRSSpqB3GlbfVEbvstfS4tKY+5WFnzANbJzdt6O3ERzDt3lOpqnk/T
         C9OA==
X-Forwarded-Encrypted: i=1; AFNElJ+GCLfIf785wW9eykyqcAtvC7ltLeVnhfYy26kc1flX/kDWcyaN1sImFWRt6eAxVy3pgWBaVOpkw3E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3rhG2W39KHCp1xSOeDjrif8uj7Y9eqrJ48w3HgD7r6PFu8BsC
	yVPLUOVmZ9VESLKLNv5xGfCOcdwyXQgC8FNdvUtjdQv4eDKF0csrjfEvkF1luQ==
X-Gm-Gg: AeBDiet26+W1J9CdUxe5J4dbsAyuYQ9ihKfBoZdviQqch9TDdTpGQC0bpgO/XX0ubAn
	IJ1QGYaa/T2g2nLQuFl9l3ufQYdEe+K/U/hyCzNXfyXQI4izuB5Q7SvLr9Rv2rqQa1X3hopA2Sr
	u24yL5r+E3h7+J1J9o4hGGL2A2nB6F378xue7OzYL+70D2M1ikqNRA/dKkvY2EgBSMVPyRceYEN
	n09r7AnezX34K6crZx2NM4yyLM/0NOkq7alCGnD+d/GUTE9zNrPZmDP3lWoB/5RNRsGY8/oZQf3
	nAzK8EVikpg4hVMlBnS9eUpFkg20CIv7NwhCwHKITiF5y+p6nc+Zokneme2gfkvftw3dEeKtNZY
	4ATmh/R6ryrHecASM4NyRFpgCWMyg84yT2b+C3zGlhHB1B00zzu9PdZhPgghX1vPMY6UhBN7uar
	U9x8VwOUOLPZoIjIoEaqwZ7nscC5bSofO2dQ6oSMcc1WE=
X-Received: by 2002:a05:6512:31d5:b0:5a2:b4c3:d88c with SMTP id 2adb3069b0e04-5a4172cc178mr9654762e87.15.1776922392819;
        Wed, 22 Apr 2026 22:33:12 -0700 (PDT)
Received: from foxbook (bfh75.neoplus.adsl.tpnet.pl. [83.28.45.75])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38ecb5f65absm39719351fa.11.2026.04.22.22.33.11
        (version=TLS1_2 cipher=AES128-SHA bits=128/128);
        Wed, 22 Apr 2026 22:33:12 -0700 (PDT)
Date: Thu, 23 Apr 2026 07:33:07 +0200
From: Michal Pecio <michal.pecio@gmail.com>
To: Heitor Alves de Siqueira <halves@igalia.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com,
 syzbot+abbfd103085885cf16a2@syzkaller.appspotmail.com, stable@kernel.org
Subject: Re: [PATCH] usb: usbtmc: Allocate enough space for interrupt-IN
 buffer
Message-ID: <20260423073307.2b81543c.michal.pecio@gmail.com>
In-Reply-To: <20260422-usbtmc-iin-size-v1-1-5dc44b4389aa@igalia.com>
References: <20260422-usbtmc-iin-size-v1-1-5dc44b4389aa@igalia.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20251104];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-36428-lists,linux-usb=lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[michalpecio@gmail.com,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[7];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,abbfd103085885cf16a2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[syzkaller.appspot.com:url,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 2618C44D496
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Wed, 22 Apr 2026 19:22:09 -0300, Heitor Alves de Siqueira wrote:
> The USBTMC driver allocates the Interrupt-IN buffer according to the
> wMaxPacketSize value obtained from the USB endpoint. If a USB device
> advertises a small enough wMaxPacketSize (e.g. a malfunctioning device
> or an endpoint constructed by syzbot), the buffer will not have enough
> space for the mandatory headers and will trigger an out-of-bounds read.
> 
> Fix by ensuring the driver will allocate at least enough space to fit
> the headers for Interrupt-IN packets (bNotify1 and bNotify2).
> 
> Fixes: dbf3e7f654c0 ("Implement an ioctl to support the USMTMC-USB488 READ_STATUS_BYTE operation.")
> Reported-by: syzbot+abbfd103085885cf16a2@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=abbfd103085885cf16a2
> Cc: stable@kernel.org
> Signed-off-by: Heitor Alves de Siqueira <halves@igalia.com>
> ---
>  drivers/usb/class/usbtmc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/class/usbtmc.c b/drivers/usb/class/usbtmc.c
> index bd9347804dec..22efa74008f8 100644
> --- a/drivers/usb/class/usbtmc.c
> +++ b/drivers/usb/class/usbtmc.c
> @@ -2452,7 +2452,7 @@ static int usbtmc_probe(struct usb_interface *intf,
>  		kref_get(&data->kref);
>  
>  		/* allocate buffer for interrupt in */
> -		data->iin_buffer = kmalloc(data->iin_wMaxPacketSize,
> +		data->iin_buffer = kmalloc(max(2, data->iin_wMaxPacketSize),
>  					GFP_KERNEL);

This changes OOB read into uninitialized memory read, which syzbot
may complain about again next week.

More reliable fix would be to reject such devices if they are illegal,
or make the driver not read beyond wMaxPacketSize if they are legal.

Note that the driver never worked for them properly anyway and returned
data from unititialized memory or page faulted.

>  		if (!data->iin_buffer) {
>  			retcode = -ENOMEM;
> 
> ---
> base-commit: 70c8a7ec6715b5fb14e501731b5b9210a16684f7
> change-id: 20260422-usbtmc-iin-size-f1aaf04a6c4c
> 
> Best regards,
> --  
> Heitor Alves de Siqueira <halves@igalia.com>
> 

