Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B401B2EA83A
	for <lists+linux-usb@lfdr.de>; Tue,  5 Jan 2021 11:10:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727923AbhAEKJa (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Jan 2021 05:09:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726171AbhAEKJa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Jan 2021 05:09:30 -0500
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECA0DC061574
        for <linux-usb@vger.kernel.org>; Tue,  5 Jan 2021 02:08:49 -0800 (PST)
Received: by mail-ed1-x52a.google.com with SMTP id j16so30457020edr.0
        for <linux-usb@vger.kernel.org>; Tue, 05 Jan 2021 02:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=M/KePTQoaRtWdHE5nsJRdDr2C4EUk1MjmOtz4ng2Mg8=;
        b=XC4PIfiOTDmrq03e05VQMQ7ktaJRVG6f3kr7xqWvBsfOnaL2W/v+6PuPi3UjM/pvb7
         5HQyQr2qNNqUquEouFVX+guBt+fmlMYLXgXxgUT1b+ZtVYIFPSQZ9S96220CFAfus+gc
         iaB1bju9iaIlX0Fc2sGn00D79MxLusVcPPquD+8OD7BFd5gkkqurqTjPIzjKnPFEvNDX
         RCLXKXoWuXl6vF56tPmqixVMOCe9pPbr8hPz/9eo9x+AY5dvgnU731sAc+ZVnADbDXDk
         z9UHnp4EvGy0B11R45xb/Vq5PuF003Fy7yu8p1CCcpPuFRjWR0wQXtPrKFPTkgLt1NQG
         Bnxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=M/KePTQoaRtWdHE5nsJRdDr2C4EUk1MjmOtz4ng2Mg8=;
        b=mVQZyRs5fps8n9Uefhbk3d1O1M0kOv4fWNV9ijd87qb4MGkxIShC+uvuNBoUrOZQNd
         oez59gL1vXWmoLecceIPOhDKuMB58TcGjerZMYtvmcpuMC2K7SQWudJoyDmE2V+5uq38
         LZmxxni/i0W01pSYOlsjqgjmLiP4rmt4Ke6r81+lFKJ7qecXUnLmuVYI3C1IWVS0jUk0
         zWkDyqmPjxH1BMV0VQCd42X9nNmyv2MeHrSZtbV5EKGOSS8GPd3WUzChC0RfIawCqfXd
         B0a2ty/wNywmfjefMXSjB6Qt51Yfhxf8LNgVQujn4LUxkBTk/nPuTa3MSYjEwSmRxIsz
         7wjg==
X-Gm-Message-State: AOAM5317jm89aKUipmSk5FHO8wXh3X0MYzq/Us9iF7iB4eVZXRnVBf9f
        /D1qgCmfvsoCBY6lp9NTgV+TULfv0J/gm/ES1S0=
X-Google-Smtp-Source: ABdhPJyjmj1/BoRczSRlgHLJ5jKWVClzZg+GSMr12X5UHjNzL6RKVqi7cTHQQx0Qjjv0Evv2MH3oGSpBpknExBOIhQQ=
X-Received: by 2002:a50:9354:: with SMTP id n20mr76569629eda.231.1609841328675;
 Tue, 05 Jan 2021 02:08:48 -0800 (PST)
MIME-Version: 1.0
References: <20210105091908.15290-1-mika.westerberg@linux.intel.com>
In-Reply-To: <20210105091908.15290-1-mika.westerberg@linux.intel.com>
From:   Yehezkel Bernat <yehezkelshb@gmail.com>
Date:   Tue, 5 Jan 2021 12:08:32 +0200
Message-ID: <CA+CmpXuV_rEMqoLL=fTQr=Qk-2bZWq2HezhA3m=mY=rE6ow3BQ@mail.gmail.com>
Subject: Re: [PATCH] thunderbolt: Drop duplicated 0x prefix from format string
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jan 5, 2021 at 11:19 AM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> The tb_dbg() call is using %#x that already adds the 0x prefix so don't
> duplicate it.
>
> Fixes: 9039387e166e ("thunderbolt: Add USB4 router operation proxy for firmware connection manager")
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/thunderbolt/icm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/thunderbolt/icm.c b/drivers/thunderbolt/icm.c
> index 8b7f941a9bb7..b8c4159bc32d 100644
> --- a/drivers/thunderbolt/icm.c
> +++ b/drivers/thunderbolt/icm.c
> @@ -2316,7 +2316,7 @@ static int icm_usb4_switch_nvm_authenticate_status(struct tb_switch *sw,
>
>         if (auth && auth->reply.route_hi == sw->config.route_hi &&
>             auth->reply.route_lo == sw->config.route_lo) {
> -               tb_dbg(tb, "NVM_AUTH found for %llx flags 0x%#x status %#x\n",
> +               tb_dbg(tb, "NVM_AUTH found for %llx flags %#x status %#x\n",
>                        tb_route(sw), auth->reply.hdr.flags, auth->reply.status);
>                 if (auth->reply.hdr.flags & ICM_FLAGS_ERROR)
>                         ret = -EIO;
> --
> 2.29.2
>

Reviewed-by: Yehezkel Bernat <YehezkelShB@gmail.com>
