Return-Path: <linux-usb+bounces-32654-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CIruONibc2nNxQAAu9opvQ
	(envelope-from <linux-usb+bounces-32654-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jan 2026 17:03:36 +0100
X-Original-To: lists+linux-usb@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FBB37821F
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jan 2026 17:03:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 06666302DB42
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jan 2026 16:00:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E41829993E;
	Fri, 23 Jan 2026 16:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="uLnyk5bo"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f68.google.com (mail-qv1-f68.google.com [209.85.219.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7B326A0A7
	for <linux-usb@vger.kernel.org>; Fri, 23 Jan 2026 16:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769184052; cv=none; b=E2AFVIATpQkLmJ7wPs9iB4SmVRpqbsnwuXCVSmAdTrX8QyICxa9CI9QH0skJWYuXJH7F7vyOwjWAzm/Ot+JWAvCdJAZAzd3E4N84Qs6ptXxG10znFR/WzJmul2jruG1l5ju7zNufTDfeJw5vAEZ1dEtjUb6blVw9aex6YZSRIxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769184052; c=relaxed/simple;
	bh=DRTh5kLinWDD45bO2y1YZd6fzdRivfxa++H3eTR2sDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LGMbWDrK/35xw96W/9wn9BQl9hSgIjAMjGzjDlMc75Pb8IQoBzBGprcx3ya+srl+yQPEoqbDxRH9iRcU9rOGbgL4v727ZaktSiBl6SjZR+/KK4/7Oet8nxZdgtYTHgbvayVWR3+k/ORrDeGth4PO3GxcP/bDPlCUDseZSMNCRDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=uLnyk5bo; arc=none smtp.client-ip=209.85.219.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f68.google.com with SMTP id 6a1803df08f44-89478e429afso21730376d6.1
        for <linux-usb@vger.kernel.org>; Fri, 23 Jan 2026 08:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1769184050; x=1769788850; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tbgs/soIu+eibdSNslmcS3pb7h/cT9c+jJp5P01redw=;
        b=uLnyk5borGnbmys5H0rqkGxGj60g6iA8jhE1hwxQX8ShQovPBJo0aroaHwopjfoAp6
         ZKsYqVeKtSC1vifc8KSrIKjn4Bgk/m8tL0WiKEp8UpfSWh+PBBceCVeKFFApXuKTQaaC
         w52svpRVy32K8HCa1cB0t4kGWecx6dwXIpYFAU+JFkngdLJtL4Sw1hoErm+GC1XU4j3w
         V2YD+NibXaKWg6CKjV81ab795GEJTZR8avNjigN/6X4G8RuW80q8KbHDVAvxSajJbbX6
         EExJXdNKtJnIZ+CcpknJk3xj5ox5S8kAxL7w+gS6QhdJQd2JzbVaVxPAkCv4fD5J2IeK
         +9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769184050; x=1769788850;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tbgs/soIu+eibdSNslmcS3pb7h/cT9c+jJp5P01redw=;
        b=X9XSE1G9u5qCurFwOG8LYRgcPyI3ZrPjb3rIJ8EsbhnTvrxMRkHhj8JULvkJ9HNcH1
         mAy4xyvRyJEtzKEumhRSQIGUGEFLIW++z0KJGOseMJ9TpYkJDezI2cGIPb5p8elUneWv
         nGh7TP46/dfflXJvJklKMT8ICIZd0WSiFBKlUGYHECoJl6+PgfPIgxQ+g33/9gYYZl2d
         OyIbYMeUzPEqnaStz9H2H/YZ7KvZmmpavQ1+LKs3gx/RyD9A2Hna9792qdIud9w+YwZd
         dDGkathb8ewdbxA9v/LlDkOdO1JcSXyv9GuUNrwkUBzhgWhDJOyNwMlnpayhHVGAZM19
         7aWA==
X-Forwarded-Encrypted: i=1; AJvYcCVQmJ4MSw8aqEX3D8hAdcluWoar/PCTZLkQbNNXkZjNgZBX2jr+JfrQNdEUP4rJdXDYtmcp3wbVPQU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWc2sArGdfgHuvuqlQrRTVCDViIlnxCxq+8w+mBiVvoWjCXFcx
	DavNTZuO5UcpQfpJy+4GvzOynXWd0n+i/CH2E0g+Gw6fPrru1NR1dNePrH2JhXLi2Q==
X-Gm-Gg: AZuq6aJwiMLIYK0PQk+KiR3sOh+0pIbHE+lFUoffHGVmvIDpBDvP7+bRYwcJ2RyIrLR
	xcDN7Yk7nZCES92KUREciCWkrQ4r6FhgiQz91e2Gw3wRQalGXfzGrMiI2Vb8GV/fWmAzwyAeV82
	woWyefmEwh+431akT6E4Ke+6+KLvdsmMdWEfzjHwYbO5PSGn1br6HYBocIC2zzL0ra7sw+A/aGp
	HMRI2zVV7h4NYiWy0n1u1omocnJieUv9ziEquIHVP5yoxq1l5nhKSj207p69R2AtGJiWY8WSTIG
	vFcv33Ioee2GCPiBaFO9A7i/p39JGY6wrGH1Iy5xsxt6iDXrBwas2WR28WGd3V3W626jWqUV3c0
	JRIRIAOic0eJbhjQNg+Vd/6Uu4ry2MaY4Xr0y6vJkHUPgpeWwcmtLm4FgGPNgleWJRJZk08NXZP
	LmZUn8A7A7jgL8
X-Received: by 2002:ad4:5c85:0:b0:894:60de:d208 with SMTP id 6a1803df08f44-8949022f817mr47585436d6.64.1769184048048;
        Fri, 23 Jan 2026 08:00:48 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d03:1700::7dcb])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89491850435sm20083836d6.24.2026.01.23.08.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jan 2026 08:00:47 -0800 (PST)
Date: Fri, 23 Jan 2026 11:00:44 -0500
From: Alan Stern <stern@rowland.harvard.edu>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] usb: gadget: f_mass_storage: Add a prefix to log
 messages
Message-ID: <9fd83508-5985-44fc-ae26-2960d575df9e@rowland.harvard.edu>
References: <20260123142221.14285-1-jszhang@kernel.org>
 <20260123142221.14285-3-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260123142221.14285-3-jszhang@kernel.org>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[rowland.harvard.edu,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[rowland.harvard.edu:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[rowland.harvard.edu:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	TAGGED_FROM(0.00)[bounces-32654-lists,linux-usb=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[stern@rowland.harvard.edu,linux-usb@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	NEURAL_HAM(-0.00)[-0.995];
	TAGGED_RCPT(0.00)[linux-usb];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rowland.harvard.edu:mid,rowland.harvard.edu:dkim]
X-Rspamd-Queue-Id: 1FBB37821F
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 10:22:20PM +0800, Jisheng Zhang wrote:
> Similar as last patch,

This is not a good thing to put in a patch description.  Once the patch 
has been merged into the kernel source, nobody will know what the "last 
patch" was -- it refers to something in a mailing list, not something 
available to people reading a changelog in Git.

Alan Stern

>  add a prefix to log messages so that users can
> convienently know where's the msg from.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  drivers/usb/gadget/function/f_mass_storage.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/usb/gadget/function/f_mass_storage.c b/drivers/usb/gadget/function/f_mass_storage.c
> index 94d478b6bcd3..d7ae076705c4 100644
> --- a/drivers/usb/gadget/function/f_mass_storage.c
> +++ b/drivers/usb/gadget/function/f_mass_storage.c
> @@ -168,6 +168,8 @@
>  /* #define VERBOSE_DEBUG */
>  /* #define DUMP_MSGS */
>  
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
>  #include <linux/blkdev.h>
>  #include <linux/completion.h>
>  #include <linux/dcache.h>
> -- 
> 2.51.0
> 
> 

