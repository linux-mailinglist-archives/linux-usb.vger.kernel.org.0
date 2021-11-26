Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E89A545EE26
	for <lists+linux-usb@lfdr.de>; Fri, 26 Nov 2021 13:36:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377611AbhKZMjj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 26 Nov 2021 07:39:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235185AbhKZMhi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 26 Nov 2021 07:37:38 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1BD0C08EAEE
        for <linux-usb@vger.kernel.org>; Fri, 26 Nov 2021 03:58:49 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id y7so6592666plp.0
        for <linux-usb@vger.kernel.org>; Fri, 26 Nov 2021 03:58:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=w3TeLcsAA8MSerIRK90mCY/GETm9H7iaGcCMB+3Akr0=;
        b=LePXyX/P8fz5hHNibVVZB2r5tP2GuaCIlvDnec3AxoKvNQ+JZH7YatTggVHFQUmFeD
         gdsmNb+e77CQtbHoszkT6g1OQWFp1rb7X/FVXVQ8DZYN6qdu4rLJNzZRl7YYAr4xbCcz
         pFmup+uH0PnbCtcSncZ0lQVe/bDa+BsdiW6NV0+Ra/XuxljUrPeFH1GEpxalxRo8xegY
         znELRTjAGsaHK4vdQ4gzWUFfNs1MdVxbHuki2Xo1bpAteVz7yWQRykvRHXW2pVCCbZ3x
         gAqpCRYY/9ND/oH4rUhQZhdT0whr88/gG+cBZelmcdzeSEJQ8BMQx4pOQxKQUhJWaqdO
         cltw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=w3TeLcsAA8MSerIRK90mCY/GETm9H7iaGcCMB+3Akr0=;
        b=2jU1/x3IYUVNeMmC5bHA0W66MTAUDK2pNiCU1zgdmGWoHSAZcTtUqhd5Cxawjy3qmu
         VqoDVjBjMZCBfP316BRncnEb3vySMvcZElr1MR2HxWwBVUDG2x/80vi1WiqC+NIqi+mQ
         O1YZTqa2EEb8F0Oejy34QazEArj9ac6nKAlvRAHbqdWWV01AEfQW1yVgdZdjRQdsr8v8
         zt0/mWzqZAnj+LcTPiFEfXsGzqBdfpsUmOFfAvHFjcRXtVq8KLhH3bix6BdMeokljDns
         +NDrVksR5dXoWvgczZnXg4G+kRRN7otlMjHA9cSuxpCdx3vny3iLpw18GZeR9jKRyvH+
         amXA==
X-Gm-Message-State: AOAM533v1fAFzQviDpNHBFh6ZCRN17jpvnIThXuV5QqNraSszraViOC5
        WQDILKQ3/05LpmeCZfG+pR+xGsmLA3lIRvuRPNI=
X-Google-Smtp-Source: ABdhPJzkdc0EcCxuLAfsqGiqaoeDNx2hDiDZ3H9tr3ypEGvXwiIYa63TSv/KEbwkdzgDMONW+e18Myony5swDp/M0S4=
X-Received: by 2002:a17:90b:1bcf:: with SMTP id oa15mr15198809pjb.161.1637927929439;
 Fri, 26 Nov 2021 03:58:49 -0800 (PST)
MIME-Version: 1.0
References: <20211125143821.16558-1-gil.fine@intel.com> <20211125143821.16558-2-gil.fine@intel.com>
In-Reply-To: <20211125143821.16558-2-gil.fine@intel.com>
From:   Yehezkel Bernat <yehezkelshb@gmail.com>
Date:   Fri, 26 Nov 2021 13:58:33 +0200
Message-ID: <CA+CmpXuK0Z_cZFYJ9JwqqY_kjWXm9L5_jOZ1=S2ZR1buycWqFw@mail.gmail.com>
Subject: Re: [PATCH 1/7] thunderbolt: Add TMU unidirectional mode
To:     Gil Fine <gil.fine@intel.com>
Cc:     Andreas Noever <andreas.noever@gmail.com>,
        Michael Jamet <michael.jamet@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        USB list <linux-usb@vger.kernel.org>,
        Lukas Wunner <lukas@wunner.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
> index 3fae40670b72..0205361ff89a 100644
> --- a/drivers/thunderbolt/tb.h
> +++ b/drivers/thunderbolt/tb.h
> @@ -89,15 +89,24 @@ enum tb_switch_tmu_rate {
>   * @cap: Offset to the TMU capability (%0 if not found)
>   * @has_ucap: Does the switch support uni-directional mode
>   * @rate: TMU refresh rate related to upstream switch. In case of root
> - *       switch this holds the domain rate.
> + *       switch this holds the domain rate. Reflects the HW setting.
>   * @unidirectional: Is the TMU in uni-directional or bi-directional mode
> - *                 related to upstream switch. Don't case for root switch.
> + *                 related to upstream switch. Don't care for root switch.
> + *                 Reflects the HW setting.
> + * @rate_request: TMU new refresh rate related to upstream switch that is
> + *               requested to be set. In case of root switch, this holds
> + *               the new domain rate that is requested to be set.
> + * @unidirect_request: Is the new TMU mode: uni-directional or bi-directional
> + *                    that is requested to be set. Related to upstream switch.
> + *                    Don't care for root switch.
>   */
>  struct tb_switch_tmu {
>         int cap;
>         bool has_ucap;
>         enum tb_switch_tmu_rate rate;
>         bool unidirectional;
> +       bool unidirect_request;
> +       enum tb_switch_tmu_rate rate_request;
>  };

Match the order of the documentation and the struct members?
