Return-Path: <linux-usb+bounces-33897-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGtJEAVSpmkbOAAAu9opvQ
	(envelope-from <linux-usb+bounces-33897-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 04:14:13 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9861E85C7
	for <lists+linux-usb@lfdr.de>; Tue, 03 Mar 2026 04:14:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B880D30A782B
	for <lists+linux-usb@lfdr.de>; Tue,  3 Mar 2026 03:13:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FFCB37CD42;
	Tue,  3 Mar 2026 03:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="bjPVo1dI"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4AB36AB53
	for <linux-usb@vger.kernel.org>; Tue,  3 Mar 2026 03:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772507600; cv=none; b=ZMpXcAT1l69+49Zd49qT9YR5X4czIhl8wdNm1Cdi0hwXIaSncu3zfIac892sNoSwMNCumotYgvphogRtuH0NX2Z9ai5sQjlrmfKapxWu5JEc/ryyUg9n53EJKcAntkVFArxznF0TMUmIirlwCiYyHajWnd8GZHCTtHtCAnopTNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772507600; c=relaxed/simple;
	bh=J/wbZ3lgW3msxO7LaS0KZ+mkgRbUNZk5yqvbBEyMgq4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LAIWRzJzcdnFtYTF3KP62nD5GcF6r0oO1LpplgluAPtq7h3x25VfETxbNpYjigk5Onmc4ss9S0EIkBWEHxXtzFuvBI5rmES4ODZgXKCqBzLD27HvZmBlkPlGU5PHc+mDdxHbOYXJ4cNqqX9tS5LKTAv/XCCvx45GRY66fJyJaz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=bjPVo1dI; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-899ee87355dso26724896d6.1
        for <linux-usb@vger.kernel.org>; Mon, 02 Mar 2026 19:13:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1772507597; x=1773112397; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IPhDnEnpTuhlV04Z4H/JUX4Cviq4H3q8eoCXXmUr+z8=;
        b=bjPVo1dINYMJ3T2SS7HKqm1sdbJ1qrZghDgyh/PHiBOnxTmOtMn3fZwdRZ2ydFBtpY
         q1XkFgRomPRzCW8XTzuzse/Aso+ixNemYIS/hzElFHrLprGcPee0Wvsirxpf+YIAckv0
         cSr5kC8rUiAbSZIoTXDyHi5qrGdu+mDzKnh5VERApskgYQX/ZmvlIdRXvRXlxlfkejiU
         ju/QdgcCA1zHTA9m8HGSDD3mNxs68y/y5ImWLru9ng0/z/wtAKtMVHjYIdi94OgW8G+S
         HkwgSqwSM0/q8L9Dw/r+KGLGwOfBKQdeebVACo3yi1bPh3LrTDvVntB1RsQnAyp+nbDK
         vUEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772507597; x=1773112397;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IPhDnEnpTuhlV04Z4H/JUX4Cviq4H3q8eoCXXmUr+z8=;
        b=gGaCVZea99YoxHodgWFOshqf9F1Y5rdAt7HPGN2tRO5BEqz5D59Jp886HIb4ytWIzi
         TdX7kSMNY7GIkoj3EnKOm0IJmSgGWhvX2wH8hGEWNn0DC4W1RFK0jJPjiEHDcw9e7Wuo
         BYerg7E8uG+H6T41U8RGGZkm7YrYvxmWUhnBRnogAsSHrK9x1m4CeGR6v180DORN8OMc
         gLsjsxqboZhGnCeE8VGdNZ1PL9FWpEizn32lG4/h8OdCEDtC+LBSeYzcLyF4U/mO7ttb
         xSi5Qq9eBOU4jEfmbdQR4tCkl4AMXUmX+49HoAHGR423pacgV5PXOfYkPVQnZWEFPD9P
         jqqw==
X-Forwarded-Encrypted: i=1; AJvYcCXStKPFlh97wd+BMqAjmyimL4G7r5Z0wQyqoERnUjI4Q3LWCedGGaCM4nEsu2Lnj0ZaHgc+XIv6X9o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiJ/vvJ6AxwhzqiGa3aELh/+Gjalg0Or7rSA0hPt+4BZUUoRt3
	N72EU8TIuMokF8g5meDT0DtXtHvpMdxLsI4ZDtJIorTNz6oidFNzOaX7ah1dxjniFQ==
X-Gm-Gg: ATEYQzz/HDmI8scg56s4AJUhksATHyiX9xwVjd+5bOHmOD/w862NgXzdspXCfIUpH2K
	owQm8woYY9r1kiK0gVbMaET79jKvz06pDBmPxXjWMtd54c7aEq+wtOFzhar4YpkhM/OUf+4IInG
	52smVcxYeGrRlMVNdpxlDbSyi0YAEg0ahBtrMOahibb7NbsnW1ytWcyivJYwnZPgqQd4Q6bHJNn
	YV/AFdAiDtA5tFJ2OGOcqMLou8QL+WiFEB8sCH332HvSFZX+VF+IZdw6Fuvu+XIjQFUCQwrphf6
	OGwn3G6Ebnt8y5w2ZbABCYZXbNCyTHr2lnf45Lh6p742lwi7rNs7zLEbeWw6Ufpr4sOcThrS4Ja
	gEFpXRzfX6zb5VK/8i9wjb3pVaaH/8OrhLx2Xf2KPuztMGXiMOsq97vRKURnYzFngeZf5Zbd9V6
	+cXTm+lFU+F8DFtH5iIQWKTky0
X-Received: by 2002:a05:6214:f68:b0:89a:5b:bf51 with SMTP id 6a1803df08f44-89a005bd081mr67949786d6.11.1772507597030;
        Mon, 02 Mar 2026 19:13:17 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::687c])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899f4fb20a3sm52594846d6.31.2026.03.02.19.13.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 19:13:16 -0800 (PST)
Date: Mon, 2 Mar 2026 22:13:13 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: UAF Researcher <fanwu01@zju.edu.cn>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: renesas_usbhs: fix race between device remove and
 ISR
Message-ID: <db402599-e105-45d7-82b1-0216b6f5e729@rowland.harvard.edu>
References: <20260303004550.67219-1-fanwu01@zju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260303004550.67219-1-fanwu01@zju.edu.cn>
X-Rspamd-Queue-Id: 8F9861E85C7
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-33897-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-usb,renesas];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,rowland.harvard.edu:dkim,rowland.harvard.edu:mid,zju.edu.cn:email]
X-Rspamd-Action: no action

On Tue, Mar 03, 2026 at 12:45:50AM +0000, UAF Researcher wrote:
> From: Fan Wu <fanwu01@zju.edu.cn>
> 
> In usbhs_remove(), the pipe array info->pipe is freed by calling
> usbhs_pipe_remove(priv). However, the interrupt handler usbhs_interrupt()
> is registered using devm_request_irq(). The devres cleanup, which
> includes freeing the IRQ, happens after usbhs_remove() returns.
> 
> If a hardware interrupt fires or a pending ISR executes after
> usbhs_pipe_remove() but before devres cleanup, the ISR will access the
> freed info->pipe array via the usbhs_for_each_pipe_with_dcp() macro,
> leading to a slab-use-after-free.

...

>  drivers/usb/renesas_usbhs/common.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/usb/renesas_usbhs/common.c b/drivers/usb/renesas_usbhs/common.c
> index cf4a0367d..404220ceb 100644
> --- a/drivers/usb/renesas_usbhs/common.c
> +++ b/drivers/usb/renesas_usbhs/common.c
> @@ -815,6 +815,10 @@ static void usbhs_remove(struct platform_device *pdev)
>  
>  	usbhs_platform_call(priv, hardware_exit, pdev);
>  	reset_control_assert(priv->rsts);
> +
> +	/* Disable IRQ before freeing resources to prevent UAF in ISR */
> +	disable_irq(priv->irq);

Don't you also need to call synchronize_irq(priv->irq) here?  Otherwise 
there still could be pending interrupt requests that will be handled 
later, causing the use-after-free problem.

Alan Stern

