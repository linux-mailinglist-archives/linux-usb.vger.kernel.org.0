Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9C1C6523E9
	for <lists+linux-usb@lfdr.de>; Tue, 25 Jun 2019 09:04:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729705AbfFYHEl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 25 Jun 2019 03:04:41 -0400
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45536 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726712AbfFYHEk (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 25 Jun 2019 03:04:40 -0400
Received: by mail-lj1-f194.google.com with SMTP id m23so15057676lje.12
        for <linux-usb@vger.kernel.org>; Tue, 25 Jun 2019 00:04:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ByZZFMZXXihQ/r/ZfOnH84lgq6trN1GGzmT7+dbQW1k=;
        b=HYFrxLUBSXeWmPVFUuUvE/JtRHBNJMfDsQ8RyWVlKmW4Zrfi1Om4/ALLpx5hGxUTxj
         bxMNraPjaKP7lnRiv4/jIGCN0jkioa7ThCC/JcPAP0z3mYiJJYt4KlOQimCN52mzW7i7
         Yd0pwpcBlYh+0n/csaIC3f/brGvfd2IkuIUc+N2HUnHvntBPU63HszshNVZQHk1zk3GQ
         N8LGHmEgIDwG4/2zs/ViOnL6Ft/svBwH4oLWhu3R944ihxfh++4i6iN7SHaUySmomEIo
         L2HuqqcfmlLSuJ+ndTUIHghODrl3ZSrIiqg7/MIQvytbB0d1VpxnPyyAJFUtcyI1sfNT
         NUww==
X-Gm-Message-State: APjAAAWbSMTTfXM/yrwMwMYTkz6eE97MWobegNV79fkDCA2LJ5U+DTFt
        ZeLqyp17c72cUvMqoxr3l9I=
X-Google-Smtp-Source: APXvYqwiU+RGGb16Nf/U6bmShx4ZpDpOGV+M/zVithVdGybTT0tNOP9KfYSh8xvdFWc0MMBM6Q/2Rw==
X-Received: by 2002:a2e:7c14:: with SMTP id x20mr4524827ljc.56.1561446278869;
        Tue, 25 Jun 2019 00:04:38 -0700 (PDT)
Received: from xi.terra (c-74bee655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.190.116])
        by smtp.gmail.com with ESMTPSA id x79sm1808982lff.74.2019.06.25.00.04.37
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Jun 2019 00:04:37 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.92)
        (envelope-from <johan@kernel.org>)
        id 1hffVM-0004XU-70; Tue, 25 Jun 2019 09:04:36 +0200
Date:   Tue, 25 Jun 2019 09:04:36 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     johan@kernel.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH] gpss: core: no waiters left behind on deregister
Message-ID: <20190625070436.GC14867@localhost>
References: <20190624083323.11876-1-oneukum@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190624083323.11876-1-oneukum@suse.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 24, 2019 at 10:33:23AM +0200, Oliver Neukum wrote:
> If you deregister a device you need to wake up all waiters
> as there will be no further wakeups.
> 
> Signed-off-by: Oliver Neukum <oneukum@suse.com>
> ---
>  drivers/gnss/core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gnss/core.c b/drivers/gnss/core.c
> index e6f94501cb28..0d13bd2cefd5 100644
> --- a/drivers/gnss/core.c
> +++ b/drivers/gnss/core.c
> @@ -303,7 +303,7 @@ void gnss_deregister_device(struct gnss_device *gdev)
>  	down_write(&gdev->rwsem);
>  	gdev->disconnected = true;
>  	if (gdev->count) {
> -		wake_up_interruptible(&gdev->read_queue);
> +		wake_up_interruptible_all(&gdev->read_queue);

GNSS core doesn't have any exclusive waiters, so no need to use use the
exclusive wake-up (all) interface.

>  		gdev->ops->close(gdev);
>  	}
>  	up_write(&gdev->rwsem);

Thanks,
Johan
