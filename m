Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E594A651465
	for <lists+linux-usb@lfdr.de>; Mon, 19 Dec 2022 21:51:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232782AbiLSUvo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Dec 2022 15:51:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232674AbiLSUvN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 19 Dec 2022 15:51:13 -0500
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com [IPv6:2607:f8b0:4864:20::935])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F138D12A90
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 12:49:33 -0800 (PST)
Received: by mail-ua1-x935.google.com with SMTP id d1so1371698ual.11
        for <linux-usb@vger.kernel.org>; Mon, 19 Dec 2022 12:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=8tVwqhBd9WrUEVcokm03nya2VEvh1CGdtbU6YyAGtA4=;
        b=MnmCpzBECMDDhtwaoc3yhPhxY89r0Hr1fzV5xBe0ETW4gFvQFaJ31NSwW7JfA8JZEI
         D7/SVoLcmh2oZZmdkpO3q0sPXlA6TwzdlowxsD37vFiibnWPk/WGyPZ58cLLg7ebmV35
         R7uUoTU3AZKe7pc1AFsPo21NK+xFcnNAsKcrCpJA6W7FxrM/YRNDph7dG+XlnjTmqwpf
         17zXU374OzqVEu71umGd0cKODaDMF3NwFisz0n5S4gqLusxGFkJe19OhutrVJDlkdvV6
         vKmMjVVLOGEFP+vMXLdzXZLuLYmCa1o5xAtAEn8/LKvgdma/32bQeeWR6YLKqaskK7gZ
         bJYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8tVwqhBd9WrUEVcokm03nya2VEvh1CGdtbU6YyAGtA4=;
        b=MNWl8nhFTW1RxIJvfa5f4Vr+CBM+Qx11EHAsKXs8SP1ENATEOKllamz/CQec4BNnd0
         0XKTdFhkf4cUaR/nLNB1OTGd/tivnEjf3fHztD1Y9SU2UVsJ0L81m+PifIqotb19aL43
         74pQYtxB84MLX7XnKyHwTefYUukTbU50eP7h0RPLvloRYQsL3mNJi0+O7omxs35O1GhP
         725WHo6yuQ1DJTy4BPLM+C5fV8hgRoSONddasGd8XHMq08xy6cf55vVpR/v01liWCIBx
         dM943elUN/r4kg7z5tUVQ/064PNUWADNh1FV8xa100OgVL3c8j4Ua24I7leial0zyx1S
         9ddA==
X-Gm-Message-State: ANoB5pltKWyeTWh/BxBvBMkmUvRdM8S0y5P722LUBkAZWAypBCM0BhGL
        8GMyA5REkW0ujejdcqYtthL91PM9NmDCoNjwN8dijg==
X-Google-Smtp-Source: AA0mqf5jAa4/yU9XdonLaWXZFMkupivcGxl+vw6h5P7R3kVzoaGd6CRUVXlhyBkLnXTdBGSKfyYxu/AgTeK8bROQ9B8=
X-Received: by 2002:ab0:7e89:0:b0:42a:c56b:8050 with SMTP id
 j9-20020ab07e89000000b0042ac56b8050mr3603084uax.108.1671482972933; Mon, 19
 Dec 2022 12:49:32 -0800 (PST)
MIME-Version: 1.0
References: <20221219191855.2010466-1-allenwebb@google.com>
 <20221219204619.2205248-1-allenwebb@google.com> <20221219204619.2205248-11-allenwebb@google.com>
In-Reply-To: <20221219204619.2205248-11-allenwebb@google.com>
From:   Allen Webb <allenwebb@google.com>
Date:   Mon, 19 Dec 2022 14:49:21 -0600
Message-ID: <CAJzde06FdTuj4HbZ+tAuOzFPY3C9XUMEKk-MVNj+E6z8r61uyA@mail.gmail.com>
Subject: Re: [PATCH v9 10/10] docs: Include modules.builtin.alias
To:     "linux-modules@vger.kernel.org" <linux-modules@vger.kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Cc:     Luis Chamberlain <mcgrof@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Please disregard this patch. I updated the commit message and this was
hanging around in my outgoing directory afterward.

On Mon, Dec 19, 2022 at 2:46 PM Allen Webb <allenwebb@google.com> wrote:
>
> Update the documentation to include the presense and use case of
> modules.builtin.alias.
>
> Signed-off-by: Allen Webb <allenwebb@google.com>
> ---
>  Documentation/kbuild/kbuild.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/Documentation/kbuild/kbuild.rst b/Documentation/kbuild/kbuild.rst
> index 08f575e6236c..1c7c02040a54 100644
> --- a/Documentation/kbuild/kbuild.rst
> +++ b/Documentation/kbuild/kbuild.rst
> @@ -17,6 +17,12 @@ modules.builtin
>  This file lists all modules that are built into the kernel. This is used
>  by modprobe to not fail when trying to load something builtin.
>
> +modules.builtin.alias
> +---------------------
> +This file lists all match-id based aliases for modules built into the kernel.
> +These are intended to enable userspace to make authorization decisions based
> +on which modules are likely to be bound to a device after it is authorized.
> +
>  modules.builtin.modinfo
>  -----------------------
>  This file contains modinfo from all modules that are built into the kernel.
> --
> 2.37.3
>
