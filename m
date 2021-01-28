Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F31F3076D3
	for <lists+linux-usb@lfdr.de>; Thu, 28 Jan 2021 14:12:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232004AbhA1NMM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 28 Jan 2021 08:12:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232123AbhA1NLz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 28 Jan 2021 08:11:55 -0500
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F925C061574
        for <linux-usb@vger.kernel.org>; Thu, 28 Jan 2021 05:11:15 -0800 (PST)
Received: by mail-wr1-x433.google.com with SMTP id s7so2350934wru.5
        for <linux-usb@vger.kernel.org>; Thu, 28 Jan 2021 05:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=p89sIKfrJZb5p4nNLBeJ1zlTJanQ4X35C/ZraD3H0OM=;
        b=gVUT0VOdYh6NrtV53olio1bDXw58tMbhm6tsGuw/vertw7XYrp4+DEJzu3tLejTg5x
         uO6nddahVg8o6oZfld32wNS4uYdWLJMiMX/XE+91HGY9oX673B94KX/lm6fb6CJ5+rCU
         UG2E5aZcuFqGCoGo8X+HRJyHGqCGutNWPxYM9cUHkhvWSCjcVEsM4L9NTIkphBTVMlMw
         5/Dbpq5nbJt1L4rc9py/t5LN97nL+k8q2NAHyRKBylJXzCJpeL1gCamygYJYrOsPRSaQ
         lYxfWcxnj9Qnpy2SMjt60ygf0QYDgHe3noBNBwqEqr8+4CJZRJJh/c0iXwWXoPoEs+vW
         GMYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=p89sIKfrJZb5p4nNLBeJ1zlTJanQ4X35C/ZraD3H0OM=;
        b=cxo+bt0VDXNz3tFIBZNJepTMWw2Cy0RVAaxL7FfzqTYc7gNN1DY1RoyQ7E+1Vlkpdh
         Zla5eqa1SfWKPcMUGHSnsHibuSKvgPk7d5yqe4p9iNMcmaGT4RCzLDEFL+IDYrvSas2N
         jtoux+o3ehL5KFBhSrkzq1AswODBPRfFYODshdQ99yEkfYygcDtVhXkZqRhKDGULziUp
         lqwBXbeWZa76B5y3UMIExoSc67aMLIE/Thiy5OUb0pYH5tr/yEeW3sklzHLFXa48CdrI
         c8Yy/eU5TELcFVHRqswQFwBYSgvnc2pnKO6efsS8zlCaJo8TTjVsoHiGWCENeTIW/foM
         UpNw==
X-Gm-Message-State: AOAM533A16RuEfSMiMg3PorMxeq4w7VpRY06AbUeLA6mG0jBtY/k1BWx
        Hsei3paRd7YgRmtEXsgqAlWfZw==
X-Google-Smtp-Source: ABdhPJxnNytLa1IcWCze58EG/y5pYjbw89IRCIFcY0ABBpzEvVu68ZVQhyPxodt732UZJ9EwsHSN+Q==
X-Received: by 2002:adf:ec52:: with SMTP id w18mr16149429wrn.65.1611839474215;
        Thu, 28 Jan 2021 05:11:14 -0800 (PST)
Received: from dell ([91.110.221.188])
        by smtp.gmail.com with ESMTPSA id m8sm7034958wrv.37.2021.01.28.05.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 05:11:13 -0800 (PST)
Date:   Thu, 28 Jan 2021 13:11:11 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, Yehezkel Bernat <YehezkelShB@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Andreas Noever <andreas.noever@gmail.com>,
        Lukas Wunner <lukas@wunner.de>
Subject: Re: [PATCH 2/5] thunderbolt: eeprom: Fix kernel-doc descriptions of
 non-static functions
Message-ID: <20210128131111.GH4774@dell>
References: <20210128122934.36897-1-mika.westerberg@linux.intel.com>
 <20210128122934.36897-3-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210128122934.36897-3-mika.westerberg@linux.intel.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 28 Jan 2021, Mika Westerberg wrote:

> Fix kernel-doc descriptions of the two non-static functions. This also
> gets rid of the rest of the warnings on W=1 build.
> 
> Reported-by: Lee Jones <lee.jones@linaro.org>
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  drivers/thunderbolt/eeprom.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/thunderbolt/eeprom.c b/drivers/thunderbolt/eeprom.c
> index 63c64f503faa..dd03d3096653 100644
> --- a/drivers/thunderbolt/eeprom.c
> +++ b/drivers/thunderbolt/eeprom.c
> @@ -279,7 +279,9 @@ struct tb_drom_entry_port {
>  
>  
>  /**
> - * tb_drom_read_uid_only - read uid directly from drom
> + * tb_drom_read_uid_only() - Read UID directly from DROM

Just an FYI: the '()' aren't required per say.

> + * @sw: Router whose UID to read
> + * @uid: UID is placed here
>   *
>   * Does not use the cached copy in sw->drom. Used during resume to check switch
>   * identity.
> @@ -520,7 +522,14 @@ static int tb_drom_read_n(struct tb_switch *sw, u16 offset, u8 *val,
>  }
>  
>  /**
> - * tb_drom_read - copy drom to sw->drom and parse it
> + * tb_drom_read() - Copy DROM to sw->drom and parse it
> + * @sw: Router whose DROM to read and parse
> + *
> + * This function reads router DROM and if successful parses the entries and
> + * populates the fields in @sw accordingly. Can be called for any router
> + * generation.
> + *
> + * Returns %0 in case of success and negative errno otherwise.

What's %0?

>   */
>  int tb_drom_read(struct tb_switch *sw)
>  {

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
