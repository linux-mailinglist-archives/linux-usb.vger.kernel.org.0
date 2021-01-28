Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC44C30785A
	for <lists+linux-usb@lfdr.de>; Thu, 28 Jan 2021 15:42:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231782AbhA1Ok6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Jan 2021 09:40:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231752AbhA1Okv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Jan 2021 09:40:51 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 521E0C061573
        for <linux-usb@vger.kernel.org>; Thu, 28 Jan 2021 06:40:11 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id p15so5622089wrq.8
        for <linux-usb@vger.kernel.org>; Thu, 28 Jan 2021 06:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=+FCpLlBLKoAPY0nBQYoaAdclDkrBVjv8RXDy9FJ+nx0=;
        b=olBtYaPtV05qxPuYLEnAuhUoFKXj+MwoVlrdmY97FASPr7e8F/bk71HDoMRqon43Kj
         R3rHyifGOQy5qsu0ehuACwerOnAPsh9wdInR902/Hdh/9mPOIysTdDNGUu/IPewxqFnn
         mEKWZsJE8c5tjgGhlLecnj4I7t/SQKxn0dDARBT0AA0Rmmly58DQQoBGyQ0iLbJiNIfv
         ds+Uly3G7rmxeTJAZyqqBGxTrvnLHEUXYCWUhOEfcJA47m+IYXgOtG5oqkXv5EPyHpvc
         zi+bhQcHp47NWY3JvCORqI3ea2QJpikg1MeOukJirbjDavMAlehQUBt9wCQg+7NSD4WE
         UnNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=+FCpLlBLKoAPY0nBQYoaAdclDkrBVjv8RXDy9FJ+nx0=;
        b=R71dl4jIUm4wC8VFsyHQus1QkFBrTFzTz+ri2kD+z0TH/zft8XVX1rv6diMY1k7zzE
         sa509nSTi8h/3DjHwYHGQtb54aVrbBOJtR7LL37tsARhrFjo4zHF1IKDOAC2SP1y+LPj
         h+gYOFm/O4/GRupDccV+9XL2pTt3eFT1FSzCYXJrAEKW0FD+QvAQmoUN56vssi/9M5lb
         V+mpSRmQoRV67WNDDsNRnoDDzA+x++7hM1EXx9xvg4qixfcZJ+1yWcexeo2ny53bSJwS
         91U10mrt0twtmDwLBtPqB7nQMmynCFW0boPCWkov+K5WB4EN5qK4FOfDZZvCOWTFKblB
         OrQA==
X-Gm-Message-State: AOAM5305f/LvhthDfEnvXH7C91muyKJj6RaKrBs8hQYxPGSnXC+brGe5
        DI2aIjz4V96LVFO8NOaOER7jcMCuYzo58LSJ
X-Google-Smtp-Source: ABdhPJzAk/8irjQN0E3L+SRBM2QF7Xzs6F9WlK0m7ZH2cE4JCAfjHnB6lOzF1ASgzc0yNevMjvtnxg==
X-Received: by 2002:a5d:6045:: with SMTP id j5mr12579738wrt.365.1611844810012;
        Thu, 28 Jan 2021 06:40:10 -0800 (PST)
Received: from dell ([91.110.221.188])
        by smtp.gmail.com with ESMTPSA id d2sm7849599wre.39.2021.01.28.06.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 06:40:09 -0800 (PST)
Date:   Thu, 28 Jan 2021 14:40:07 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH 2/5] thunderbolt: eeprom: Fix kernel-doc descriptions of
 non-static functions
Message-ID: <20210128144007.GL4774@dell>
References: <20210128122934.36897-1-mika.westerberg@linux.intel.com>
 <20210128122934.36897-3-mika.westerberg@linux.intel.com>
 <20210128131111.GH4774@dell>
 <20210128142251.GU2542@lahna.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210128142251.GU2542@lahna.fi.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 28 Jan 2021, Mika Westerberg wrote:

> On Thu, Jan 28, 2021 at 01:11:11PM +0000, Lee Jones wrote:
> > On Thu, 28 Jan 2021, Mika Westerberg wrote:
> > 
> > > Fix kernel-doc descriptions of the two non-static functions. This also
> > > gets rid of the rest of the warnings on W=1 build.
> > > 
> > > Reported-by: Lee Jones <lee.jones@linaro.org>
> > > Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> > > ---
> > >  drivers/thunderbolt/eeprom.c | 13 +++++++++++--
> > >  1 file changed, 11 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/thunderbolt/eeprom.c b/drivers/thunderbolt/eeprom.c
> > > index 63c64f503faa..dd03d3096653 100644
> > > --- a/drivers/thunderbolt/eeprom.c
> > > +++ b/drivers/thunderbolt/eeprom.c
> > > @@ -279,7 +279,9 @@ struct tb_drom_entry_port {
> > >  
> > >  
> > >  /**
> > > - * tb_drom_read_uid_only - read uid directly from drom
> > > + * tb_drom_read_uid_only() - Read UID directly from DROM
> > 
> > Just an FYI: the '()' aren't required per say.
> 
> Right. I have been using them in this driver so I thought it is good
> idea to add them here too while at it.
> 
> > > + * @sw: Router whose UID to read
> > > + * @uid: UID is placed here
> > >   *
> > >   * Does not use the cached copy in sw->drom. Used during resume to check switch
> > >   * identity.
> > > @@ -520,7 +522,14 @@ static int tb_drom_read_n(struct tb_switch *sw, u16 offset, u8 *val,
> > >  }
> > >  
> > >  /**
> > > - * tb_drom_read - copy drom to sw->drom and parse it
> > > + * tb_drom_read() - Copy DROM to sw->drom and parse it
> > > + * @sw: Router whose DROM to read and parse
> > > + *
> > > + * This function reads router DROM and if successful parses the entries and
> > > + * populates the fields in @sw accordingly. Can be called for any router
> > > + * generation.
> > > + *
> > > + * Returns %0 in case of success and negative errno otherwise.
> > 
> > What's %0?
> 
> It is 0 but marked as "constant" in the output.

Interesting.  I wonder what it actually does.

Not sure if it's just my eyes playing me up, but is the font slightly
different for items marked as const:

 mm/memblock.c: https://www.kernel.org/doc/html/latest/core-api/boot-time-mm.html

Anyway, either way:

Reviewed-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
