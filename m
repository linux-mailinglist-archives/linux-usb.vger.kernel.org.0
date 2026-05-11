Return-Path: <linux-usb+bounces-37266-lists+linux-usb=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-usb@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFhMI9LjAWoEmAEAu9opvQ
	(envelope-from <linux-usb+bounces-37266-lists+linux-usb=lfdr.de@vger.kernel.org>)
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 16:12:34 +0200
X-Original-To: lists+linux-usb@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C5FC50FD5F
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 16:12:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 931F030509A2
	for <lists+linux-usb@lfdr.de>; Mon, 11 May 2026 14:05:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5205C3FB7DE;
	Mon, 11 May 2026 14:05:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qd69i+O9"
X-Original-To: linux-usb@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF2303FB05D
	for <linux-usb@vger.kernel.org>; Mon, 11 May 2026 14:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778508325; cv=pass; b=L5cMeCrurMThqT4LafigaXOPoKa+AJtSOp2j+akFUJfTIPchKLowu3iwn2+wXrDl+EpvaW2ookeOsR08t6j9CRnLqr2GA2JmIoje51pmHp9gBlgn+JyO+8AAHB4ZptkzKxpOZgVxJNMnJsi8FvSHuwvYhvBHFy68XktlYBTTo7s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778508325; c=relaxed/simple;
	bh=FyBLSBZ7hNhVkjO/zSnSGEvlOg1Vr2+XpoAgSkY3z8U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cYpG819sxeaMg+NUSTrG7Zz4g5I2VFYcPKzun5+CXH54WQC0ZK7V9XnVd7GltcXs4Ge1jccKwary/12leAtXLrqRaS/lqg+ph1GkazgiRkMV+CF28L2NDM6yyFPXRkNc5BDwCZVY3ahP+ubRMElHQZPw+6LuZFCja2dTFiSN554=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qd69i+O9; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7bd5c773ef3so43099397b3.1
        for <linux-usb@vger.kernel.org>; Mon, 11 May 2026 07:05:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778508323; cv=none;
        d=google.com; s=arc-20240605;
        b=C+C1XEBSjwA9y7yZ1VB2NApk3UZMxFDGwoXi5gQIOHHLFLX8sn3H6OZ726Vo13be8+
         xBhIi5sV5r5TThuTE5rkivFQo4cu+aEqyU4/cG8hD07miqP3FowW2N7IP3WHfB5C9Yi3
         CJCP+culOeepoy6Sv/xAgj5gmoq2AZT23IJ8aAdxeIGrqmLE6qEgB8k5ZBOBm897j2ez
         Z0f6tzh8FsHdAQFAtVtNgtYiCj2KD+TU9iww/faJlJltLk905GKcKYSNG5iE7lBZ/08G
         gT7uDCwTZZyrMRkt7khg4wF8pQ4tdVoDUwH0iRdXd2Y/hWq6BLzPgj5WKJUGEOv9x/EY
         qtLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=r5NMXAS4+ZKW+xqccXrFy4JcKzWY5f2WjQmSFVnrvmE=;
        fh=cH23+gLBJ8YC44sOIcFryF5+dvY837FQAMZAvJhTX3o=;
        b=hKJbcsVCJJV9dt4c2jnPmERBL7an+PqTUaCbNYRhyoX+Ki55wAFMuJmtPx7iI4GvrS
         0BH2FTID4lu0NFGdJ9BV7VdWkX6zeuUss4glr2Cef99BfFlLsFGBtvq9LkUt6QEdM43e
         GKbTOG1I+kKbBcRBoE5vgsVJBVJj53jf/jpU/HtF7+6LMn5eSlvdk1jq0Niab2+Yidz9
         dhjAJIsd4bV0SjlrBP2swSjC5mG7GEU2EjV4uAkiojhKWToeMr+J268QhYim5jWIxXHk
         YPUCce5o9ssdJbBbHXiHDRh4gIVTkI9SokNbpwdJ3hetV6OlToLCTnRm4rVD5XYeddrU
         MCbQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778508323; x=1779113123; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=r5NMXAS4+ZKW+xqccXrFy4JcKzWY5f2WjQmSFVnrvmE=;
        b=Qd69i+O9ADvp32Pxkbh+QuMdpJRyaTf3Un78PZ/s6vWgZ8ug4OhUoTWQ/Utx0c/zII
         fND6wQzddTvdUz+6onxOWLewONrQAejB1PFF5HTJl5KObGWJnzVlmeM2Rx8IaeTuWK+M
         wdZzZoV5OwebWsAZ2nCX9CjukmglqF4m1ntgW45RwvG/B7ey/DuYpaevV+lzHei6EJqd
         12QOcoGtYK6Ay4Crr932oVQG0yyIjed+MnWU+g1MCiORbHtX4cEKuCy13lmCmUtlButd
         UwB2dgXSCUBZ5u6QiCHZrytVmPryf8He4x/L79AGHBCaR1PAfmjryAzZB7bCmTfyp2ns
         l5rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778508323; x=1779113123;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r5NMXAS4+ZKW+xqccXrFy4JcKzWY5f2WjQmSFVnrvmE=;
        b=rcG0nLcngOcK1XO96zVpw959TEbRMahAtNSMp2dTCkqcQxOh1K2RIsjgApl41QP1pP
         GQyz4HftuYuambRWGM9x4+3ilqCweb8JXdBrn9NbbVRBTnoPU8QYvdwcoW/qLjDjnna5
         ynICLhhPUYZK+LP/tGQg1nKZE1UjoRoVrTwE9lHgjLr/rS2uA7dN2AW1PSUP2z+ncy++
         aDWmdtT4VJ8aTws2Om9tR2Uk3ufgRCqTk7p/KpJXNDU46pxH9U17KEuSKOnCga7LZyb1
         mrGwTJeY8i1O9lS3Zl++rplVgrMX8MTpn4c4Dqh45tK6wys7ceytM3LX26Mw0UY8ev+2
         jB2w==
X-Forwarded-Encrypted: i=1; AFNElJ/RAwe9qxGyNo5L4blUSQs1lHoKoAduD7ZILOzRBFHn7s0+2sP85axzPIylWjBn/gOKpzG3Ol3BZX4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTeFqlLlnVt4biE/n1lL7hKVAndoiEwNymqmGbbUuiDkF2QwSf
	h3nJOKjdmgyVLmOW108vKgvA5oDOvohhI/EOSQk8lLpinD5rVBgomiROCOt2SFydzLJp7K14jvJ
	QJOQ70rp0cYWSz8L2QcQqTu5BVf07BzxZ3T0V/0GuHQ==
X-Gm-Gg: Acq92OHfO8ZuR13Zhkcgat+AsBDBAr50lXLW1hXyTD2bMGTH6ZH5/gzLwaf6vrXhQtm
	Z4GfCyYwDtWomYzkutqI0HmRzpJ06vadWOKl94VVtZCIHOWTPi8A86IrUkedaupbpvxQMJXviea
	APB+lQpmda9/821muS9SoDyQ8hCCtTexODIRacJABJ4mwVFr6f/qbAR2kUwQ30HRyV2S5YABPcA
	t+ZJCkGuQsvi20bxJqwQh7i+zCtWkaQ9H2Hxwf2+H01y1ZhE9RgOb7kN1DXKk9XQdnmSX0OSvrN
	FJYvOv+RyPgNIIuSO+0=
X-Received: by 2002:a05:690c:660c:b0:7bd:6432:daa with SMTP id
 00721157ae682-7bdf5e9d4d7mr253386017b3.27.1778508322803; Mon, 11 May 2026
 07:05:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-usb@vger.kernel.org
List-Id: <linux-usb.vger.kernel.org>
List-Subscribe: <mailto:linux-usb+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-usb+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1776080528.git.sean@starlabs.systems> <95a293902585bd43c6857b79bdcdb8be692ff687.1776080528.git.sean@starlabs.systems>
In-Reply-To: <95a293902585bd43c6857b79bdcdb8be692ff687.1776080528.git.sean@starlabs.systems>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 11 May 2026 16:04:45 +0200
X-Gm-Features: AVHnY4JEFLkDhtjbzsGFfUGYFgE_s22UpVwHZIgmGXAQCxyohGxow3JwqZ-VRJs
Message-ID: <CAPDyKFo+wJ3LZ4hFj0WqKpjfcioXkZJ94gtDO_Xbx99=Lyeujg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] rtsx_usb: hold runtime PM during transfers
To: Sean Rhodes <sean@starlabs.systems>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Ricky Wu <ricky_wu@realtek.com>, 
	Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, linux-usb@vger.kernel.org, 
	linux-mmc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Rspamd-Queue-Id: 0C5FC50FD5F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=2];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-37266-lists,linux-usb=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ulf.hansson@linaro.org,linux-usb@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-usb];
	RCPT_COUNT_SEVEN(0.00)[9];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linaro.org:dkim,starlabs.systems:email,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Action: no action

On Mon, 13 Apr 2026 at 13:42, Sean Rhodes <sean@starlabs.systems> wrote:
>
> Hold a runtime-PM reference across bulk transfers, and mark the device
> busy afterwards.

Why isn't it sufficient to let the mmc host device (child device) and
its corresponding driver to manage runtime PM reference counting?

As soon as the mmc host driver is requested to power-on the card via
its ->ios() callback (set to sdmmc_set_ios() in
drivers/mmc/host/rtsx_usb_sdmmc.c, it bumps the runtime PM usage
count. Therefore, the usb device should be prevented from being
runtime suspended as long as a card is inserted. Isn't that
sufficient?

>
> When runtime PM is already in progress (e.g. from rtsx_usb_suspend()),
> avoid forcing a runtime resume from within the PM path by using
> usb_autopm_get_interface_no_resume() unless the interface is already
> runtime-suspended.

Why is this needed? What problem does it solve?

>
> Signed-off-by: Sean Rhodes <sean@starlabs.systems>

Kind regards
Uffe

> ---
>  drivers/misc/cardreader/rtsx_usb.c | 38 ++++++++++++++++++++++++------
>  1 file changed, 31 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/misc/cardreader/rtsx_usb.c b/drivers/misc/cardreader/rtsx_usb.c
> index f65acf4d1164..c8badd0db87b 100644
> --- a/drivers/misc/cardreader/rtsx_usb.c
> +++ b/drivers/misc/cardreader/rtsx_usb.c
> @@ -12,6 +12,7 @@
>  #include <linux/usb.h>
>  #include <linux/platform_device.h>
>  #include <linux/mfd/core.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/rtsx_usb.h>
>
>  static int polling_pipe = 1;
> @@ -65,19 +66,42 @@ static int rtsx_usb_bulk_transfer_sglist(struct rtsx_ucr *ucr,
>  }
>
>  int rtsx_usb_transfer_data(struct rtsx_ucr *ucr, unsigned int pipe,
> -                             void *buf, unsigned int len, int num_sg,
> -                             unsigned int *act_len, int timeout)
> +                                     void *buf, unsigned int len, int num_sg,
> +                                     unsigned int *act_len, int timeout)
>  {
> +       int ret;
> +       struct device *dev = &ucr->pusb_intf->dev;
> +
>         if (timeout < 600)
>                 timeout = 600;
>
> +       /*
> +        * During runtime suspend/resume callbacks, avoid forcing a runtime resume
> +        * from within the PM path. The device is still active when
> +        * rtsx_usb_suspend() runs, but usb_autopm_get_interface() can block when
> +        * runtime PM is already in progress.
> +        */
> +       if (pm_runtime_status_suspended(dev)) {
> +               ret = usb_autopm_get_interface(ucr->pusb_intf);
> +       } else {
> +               usb_autopm_get_interface_no_resume(ucr->pusb_intf);
> +               ret = 0;
> +       }
> +       if (ret)
> +               return ret;
> +
>         if (num_sg)
> -               return rtsx_usb_bulk_transfer_sglist(ucr, pipe,
> -                               (struct scatterlist *)buf, num_sg, len, act_len,
> -                               timeout);
> +               ret = rtsx_usb_bulk_transfer_sglist(ucr, pipe,
> +                                                   (struct scatterlist *)buf,
> +                                                   num_sg, len, act_len,
> +                                                   timeout);
>         else
> -               return usb_bulk_msg(ucr->pusb_dev, pipe, buf, len, act_len,
> -                               timeout);
> +               ret = usb_bulk_msg(ucr->pusb_dev, pipe, buf, len, act_len,
> +                                  timeout);
> +
> +       usb_mark_last_busy(ucr->pusb_dev);
> +       usb_autopm_put_interface(ucr->pusb_intf);
> +       return ret;
>  }
>  EXPORT_SYMBOL_GPL(rtsx_usb_transfer_data);
>

