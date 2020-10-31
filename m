Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A30182A154E
	for <lists+linux-usb@lfdr.de>; Sat, 31 Oct 2020 11:48:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726788AbgJaKsC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 31 Oct 2020 06:48:02 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:43623 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726697AbgJaKsC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 31 Oct 2020 06:48:02 -0400
Received: by mail-lj1-f195.google.com with SMTP id d24so9600317ljg.10
        for <linux-usb@vger.kernel.org>; Sat, 31 Oct 2020 03:47:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=CYbpGfKqo2ahas0djGHZaq+qm1CqSl1MGVSORoPUwiA=;
        b=nUngT2ffOZWAAVqVRumx5xk0CFMWmAfs4V92JlOQAHtbr6e3cz7WBahadoW++Krg9o
         5w3YDLSC2r6GLDVZtKFsLRXBZMcipH8X9w+H9qCfPGd745kmIgqkREp01YATqZV9I0kv
         pvLnfyHyk2uw1f34k9WBpEMrd5OQGFdSGfFfwjf4Aw/lBMXd65VjO967S7YnktfdjybF
         A/WKjkE3o9x5I7o6jwud7C98hwFUPAxnOW0r//ANSWbhM3yy1164uLLP8dU8c5un5J0n
         hgx9Oqj/xxb2HyE0PHaWdxnHQPgSBZ6FjHXbhn5liDJg9PwrmNLnXD+AKF2BYzuf9Nwc
         0MmA==
X-Gm-Message-State: AOAM5306kdzzdtvxZn7msi0oxi+iImlH9f1+kd/6+K94mlYFVnPxGawD
        CA5G0/5MLqwW1SIzteSoB8Y=
X-Google-Smtp-Source: ABdhPJw0e05TRc/a9z0qzbS6gplF2V20rQBH+hSJ9jxo76hcvCvizgnNyvigyZ1BTaelBMEJyDNFJg==
X-Received: by 2002:a05:651c:10b:: with SMTP id a11mr2846168ljb.49.1604141278937;
        Sat, 31 Oct 2020 03:47:58 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id m132sm876471lfa.34.2020.10.31.03.47.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2020 03:47:57 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kYoQT-0008QY-I1; Sat, 31 Oct 2020 11:48:02 +0100
Date:   Sat, 31 Oct 2020 11:48:01 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Zhang Qilong <zhangqilong3@huawei.com>
Cc:     hadess@hadess.net, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v2] USB: apple-mfi-fastcharge: fix reference leak in
 apple_mfi_fc_set_property
Message-ID: <20201031104801.GN4085@localhost>
References: <20201031101144.45164-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201031101144.45164-1-zhangqilong3@huawei.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Oct 31, 2020 at 06:11:44PM +0800, Zhang Qilong wrote:
> pm_runtime_get_sync() will increment pm usage at first and it
> will resume the device later. If runtime of the device is
> active or has error(else....), resume operation will fail. 

That's not a correct description; pm_runtime_get_sync() returns positive
if the device was already active and that's not a failure (there's
nothing to resume).

Please fix up when resending.

> If
> we do not call put operation to decrease the reference, the
> result is that this device cannot enter the idle state and
> always stay busy or other non-idle state.
> 
> Fixes: 249fa8217b846 ("USB: Add driver to control USB fast charge for iOS devices")
> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
> ---
>  drivers/usb/misc/apple-mfi-fastcharge.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/misc/apple-mfi-fastcharge.c b/drivers/usb/misc/apple-mfi-fastcharge.c
> index b403094a6b3a..9e1ad4536e36 100644
> --- a/drivers/usb/misc/apple-mfi-fastcharge.c
> +++ b/drivers/usb/misc/apple-mfi-fastcharge.c
> @@ -120,8 +120,10 @@ static int apple_mfi_fc_set_property(struct power_supply *psy,
>  	dev_dbg(&mfi->udev->dev, "prop: %d\n", psp);
>  
>  	ret = pm_runtime_get_sync(&mfi->udev->dev);
> -	if (ret < 0)
> +	if (ret < 0) {
> +		pm_runtime_put_noidle(&mfi->udev->dev);
>  		return ret;
> +	}
>  
>  	switch (psp) {
>  	case POWER_SUPPLY_PROP_CHARGE_TYPE:

Johan
