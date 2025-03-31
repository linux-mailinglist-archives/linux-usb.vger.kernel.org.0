Return-Path: <linux-usb+bounces-22337-lists+linux-usb=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EAE16A768D0
	for <lists+linux-usb@lfdr.de>; Mon, 31 Mar 2025 16:55:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 685AB188EE56
	for <lists+linux-usb@lfdr.de>; Mon, 31 Mar 2025 14:52:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 797EC21CA02;
	Mon, 31 Mar 2025 14:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="SyRK28Us"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D45221C197
	for <linux-usb@vger.kernel.org>; Mon, 31 Mar 2025 14:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743431881; cv=none; b=CYqeBxXOAbtTB1y4XW7045vxpsoBUHThL0JCoxocpCciuKPOtRCjxUr6cMCUZoekLD4cKdFY8eV7X7EyDX25nMMR/RIbgDW2OJwlSp32mUrDkacdyDUCZHQ2gVRBLI0Wyh02bdzgcEPEU1pJxLj7U4+nQwI9NMGq8FE+ofVtT/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743431881; c=relaxed/simple;
	bh=5GuqQsOBQ/wettgqlG9rE0MePw04dSg//SEXlT2WjJc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KV5R7AP9btwGGwT3G9hu2JDpWM9qelrsGV5lJuU6AsXa5mMW7O5ZTF+dx4aCoYu8S0axDlqT9mutdcdb/LRURJHHfCOuirq/nrpnDAwI6k7ZG1C8VL8YvBPAYXhEq7vDTQRT8gj+q5gYNCWjQQuvMxWJC9qE0YQD7zk9HCYgoFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=SyRK28Us; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6e8f06e13a4so55484906d6.0
        for <linux-usb@vger.kernel.org>; Mon, 31 Mar 2025 07:37:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1743431879; x=1744036679; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DE/sAWU5nCw+S23T4Bkv3/flGqA1IFUngSA9Kn4PpRQ=;
        b=SyRK28Usi2ArIPgB99vM7d1JJ+bQ4eTWtb1vo1NVitiiGXyLWmLQO4Ga7n1pVl04lN
         yxEylKVUuwuRM70nTBGy6kp1TCSJ0SkRgq/k/wuelsS106INVH5AujvZswMQ52RmzCZI
         4uC1MCU5LfG0eLguZn1nc/zbeLaA/7w0gABKJvvo8MP9fpx6pvA7EPvgSOHhm+iZDl71
         4vMGzmI5cYL6H9N6h1CODJpeI0DHu0VCoK5Hpeqmkns8WWTyJXRO5chy8MvIigZFuZQl
         xHdH7mCy+1zKSacW/I9Rzri2qeJh9kk+nIum9AKrXotb6oJUCHXhcho7hSnnkX3RCbs1
         ra3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743431879; x=1744036679;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DE/sAWU5nCw+S23T4Bkv3/flGqA1IFUngSA9Kn4PpRQ=;
        b=K5R1zONCYtn9XNAGPFGO+WvmPnvz0cRMgAlRm5w4Fyww8O7ytnlVATUojyamGgTVU+
         PYqrv81AK+cl+JrnVticZc7Hd7atvlfIQTUlps+sin3vffT7/uL6Vf9ZXBw6Wqe3Kh9V
         6vN7dRF+AgNe2DZPBVRzxcPZlG9uyaJr6565zDFtSilwvfaLsjtQFlWHfsrFY9nxoNOo
         SUYFjbzAtIaPoSqRzxmi/f5t6WKv0yKuzAHY1WO6XqzP6+uampnil60OlxVm5G6YTMRb
         Hd+TM41qVl+0l6xXzqt8oIilLE2u8JYQn5bEMp3Rq1n007dYUneTUIhAEq2ZuHQMH8PS
         c1qw==
X-Forwarded-Encrypted: i=1; AJvYcCX7ZR+P4KQDRFMxn/TZBUJTUZu5zpK4mbbaTaiCvEdBT/pPM2jNUEHakSws02cwHqqJlqgvGfe5+d0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFUthvAAu+kMI+EulJm1nG4C+xJpbw4VU5byP9PfXjkgE9DfYb
	TIQJ9iSERjUAGmRAfdF7x8UzvXYsA3mQGEbNAuLabQORzttnIw22SCHM6LZ5fw==
X-Gm-Gg: ASbGncuVoPJ9NoBb6sqyDSjjjUQODdzTdfjmre18udbhUp7QQKODqHBeEuR2jetb8sq
	IS5pM7gfbL5M4W6x07ljRWI211ItFBnHUVUfg72DbPlxxijp6bIvYsINxvT9PeKBQnHUbxm9Faj
	JDxkxOmlJBp+TkwEiJu2iKg7K7kms4db2YnWKgXzsjRzsQaslNOs6iMqLV8VHJSS4JQoARDbMD4
	8NTQOoMeAZjFjjKJWb3HfdudUYdZFaLdoVSSeyH9zHnDtEdi1mQpGDg0W4bzgPTlMORb7JZ0mfO
	+MmaMmP8GAtueqQ6d0yiNE7tnZFWPMsP8YGxPDEcs/ZVULY869ipMu5D9DEYTus=
X-Google-Smtp-Source: AGHT+IHE+whbE87lsI1UQ/QzTdYVOSsbIWuODpn6hXAsvKFRJxfvxGSxHa3ir5a/Dc5qV7S2oJPI/w==
X-Received: by 2002:a05:6214:1252:b0:6ea:d503:6cfd with SMTP id 6a1803df08f44-6eed527fd89mr124796916d6.19.1743431879146;
        Mon, 31 Mar 2025 07:37:59 -0700 (PDT)
Received: from rowland.harvard.edu ([140.247.181.15])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5f768e744sm505959485a.48.2025.03.31.07.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 07:37:58 -0700 (PDT)
Date: Mon, 31 Mar 2025 10:37:57 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Oliver Neukum <oneukum@suse.com>
Cc: gregkh@linuxfoundation.org, bjorn@mork.no, loic.poulain@linaro.org,
	linux-usb@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 2/4] USB: wdm: close race between wdm_open and
 wdm_wwan_port_stop
Message-ID: <1fc14a6e-c77e-4030-bb62-6f6d5bb18d63@rowland.harvard.edu>
References: <20250331132614.51902-1-oneukum@suse.com>
 <20250331132614.51902-3-oneukum@suse.com>
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250331132614.51902-3-oneukum@suse.com>

On Mon, Mar 31, 2025 at 03:25:02PM +0200, Oliver Neukum wrote:
> Clearing WDM_WWAN_IN_USE must be the last action or
> we can open a chardev whose URBs are still poisoned
> 
> Fixes: cac6fb015f71 ("usb: class: cdc-wdm: WWAN framework integration")
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/usb/class/cdc-wdm.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/class/cdc-wdm.c b/drivers/usb/class/cdc-wdm.c
> index 12038aa43942..e67844618da6 100644
> --- a/drivers/usb/class/cdc-wdm.c
> +++ b/drivers/usb/class/cdc-wdm.c
> @@ -870,8 +870,9 @@ static void wdm_wwan_port_stop(struct wwan_port *port)
>  	poison_urbs(desc);
>  	desc->manage_power(desc->intf, 0);
>  	clear_bit(WDM_READ, &desc->flags);
> -	clear_bit(WDM_WWAN_IN_USE, &desc->flags);
>  	unpoison_urbs(desc);
> +	/* this must be last lest we open a poisoned device */
> +	clear_bit(WDM_WWAN_IN_USE, &desc->flags);
>  }

This is a good example of a place where a memory barrier is needed.  
Neither unpoison_urbs() nor clear_bit() includes an explicit memory 
barrier.  So even though patch ensures that unpoison_urb() occurs before 
clear_bit() in the source code, there is still no guarantee that a CPU 
will execute them in that order.  Or even if they are executed in order, 
there is no guarantee that a different CPU will see their effects 
occurring in that order.

In this case you almost certainly need to have an smp_wmb() between the 
two statements, with a corresponding smp_rmb() (or equivalent) in the 
code that checks whether the WDM_WWAIN_IN_USE flag is set.

Alan Stern

