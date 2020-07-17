Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BA7722337A
	for <lists+linux-usb@lfdr.de>; Fri, 17 Jul 2020 08:16:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726113AbgGQGQD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Jul 2020 02:16:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725904AbgGQGQD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Jul 2020 02:16:03 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5DFFC061755
        for <linux-usb@vger.kernel.org>; Thu, 16 Jul 2020 23:16:02 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id o22so5890405pjw.2
        for <linux-usb@vger.kernel.org>; Thu, 16 Jul 2020 23:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=d9OTxdvf24QIJCOgqfloFbJ1hEJZNMHayv9bSzxo+Rk=;
        b=YF8qd0qxWw+K2lxnkt5EtdrQIhJ4rpp52QgVFrXs+ZPjSgiUAWv1ehgv8aFN22xEr9
         78C5bL8KeAKxvg6Z2BDZQN7zlbf/IbqzTYfofWY3gka2CmYIuwfXDnf6/SjFygkcYHR9
         Q1eWkHzThSUMtjR7CApmUgbEftdqPF+iiE818=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=d9OTxdvf24QIJCOgqfloFbJ1hEJZNMHayv9bSzxo+Rk=;
        b=Mu8xvdwDd0SQSeUOyF6NCvHjssGBRvg1Hc1BKFJPUkko2EDYhHyXeU718MTVhFrxzn
         kBP2mVAjnbh+8BcKbkVcEWgXrQtJv5qlxj6Ud6JiJwFPMKNmnorEMEbF70m5FSYc15Eq
         sreS/Jj33o4LGyNHKmDssEGwa7X82GokUCaFFnYWDJpLlFXUNfZEYWpCv/3e4gupFoPf
         +DtTWePJfBQU0H0gp4PpfYCTnrLGB0ODBX8VO9QV4GTsLbZ9ucDe13c8eMfoOVG8FCLz
         XO/MPZhqQmgGUfs1ukcWcmZGh214XOTYB0DqN21Pck9OL/m/jaI5zORRBnHTXEccoBzI
         nArg==
X-Gm-Message-State: AOAM532u7PC7m8cDdnJ5QFXX5cYiU8FtCi2XNMHIrEk1Bp3Mpif4ls4m
        tojZFwPTRYcd9yPsoJyssHG0EvCeGxQ=
X-Google-Smtp-Source: ABdhPJySWUdWtpblGXA3U/kmuI16fgJdoREjbx1aYKsK26bPHwVYc8LykBeH9a4ggrg37yf/l77vDg==
X-Received: by 2002:a17:90a:eb01:: with SMTP id j1mr8452662pjz.29.1594966562143;
        Thu, 16 Jul 2020 23:16:02 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:a28c:fdff:fef0:49dd])
        by smtp.gmail.com with ESMTPSA id y27sm6931006pgc.56.2020.07.16.23.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2020 23:16:01 -0700 (PDT)
Date:   Thu, 16 Jul 2020 23:16:00 -0700
From:   Prashant Malani <pmalani@chromium.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org,
        Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Yehezkel Bernat <YehezkelShB@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rajmohan Mani <rajmohan.mani@intel.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH 09/17] thunderbolt: Do not tunnel USB3 if link is not USB4
Message-ID: <20200717061600.GC68629@google.com>
References: <20200615142645.56209-1-mika.westerberg@linux.intel.com>
 <20200615142645.56209-10-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200615142645.56209-10-mika.westerberg@linux.intel.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Mika,

Sorry for the late comment..

On Mon, Jun 15, 2020 at 05:26:37PM +0300, Mika Westerberg wrote:
> USB3 tunneling is possible only over USB4 link so don't create USB3
> tunnels if that's not the case.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/thunderbolt/tb.c      |  3 +++
>  drivers/thunderbolt/tb.h      |  2 ++
>  drivers/thunderbolt/tb_regs.h |  1 +
>  drivers/thunderbolt/usb4.c    | 24 +++++++++++++++++++++---
>  4 files changed, 27 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/thunderbolt/tb.c b/drivers/thunderbolt/tb.c
> index 55daa7f1a87d..2da82259e77c 100644
> --- a/drivers/thunderbolt/tb.c
> +++ b/drivers/thunderbolt/tb.c
> @@ -235,6 +235,9 @@ static int tb_tunnel_usb3(struct tb *tb, struct tb_switch *sw)
>  	if (!up)
>  		return 0;
>  
> +	if (!sw->link_usb4)
> +		return 0;
On both here and the previous "up" check; should we be returning 0?
Wouldn't it be better to return an appropriate error code? It sounds
like 0 is considered a success....


Best regards,

-Prashant
> +
>  	/*
> 
