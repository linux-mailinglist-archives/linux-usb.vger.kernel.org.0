Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 53E6F567457
	for <lists+linux-usb@lfdr.de>; Tue,  5 Jul 2022 18:30:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbiGEQa0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 5 Jul 2022 12:30:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232830AbiGEQaH (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 5 Jul 2022 12:30:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EF481AF05
        for <linux-usb@vger.kernel.org>; Tue,  5 Jul 2022 09:30:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C14F561BFB
        for <linux-usb@vger.kernel.org>; Tue,  5 Jul 2022 16:30:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AC9FC341D0
        for <linux-usb@vger.kernel.org>; Tue,  5 Jul 2022 16:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657038606;
        bh=aQRQTfK/Rd6YeI/kH1ApJs/gjWfPr8CLVdRZp1kXOGw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=VQZeK+KODTw132J4xGK8D9JxfXIfKOuuQ9lN+NaqQRcAwu+enUUO5uLG3bYHdh0wE
         J+2oPh/BODb+NlJ5tNXav4xNcU6qWZc9GWveKj+7AZn+nMaZrQQKDojz2+KV/HkFit
         3pLYo3C2Y53+YrUW9+pwMQX2IdaTv5fCbnzQgMzWxPc85QCAnzPT5LaDD6xW9JGeN0
         X60GtlRxV+1dxD+iNB1CIKmZX6G4p+xBCA6GSBqr+IULI4xj4A5kUR3zj3TPh7NHWy
         w7PbhAYGhh3hCFCm1OOeMpQbuhlVTUzAu6mIiZm8gnJHeOacTWedNpz1ZlkRGTS9nw
         Se2PIFwQ1atkg==
Received: by mail-vs1-f53.google.com with SMTP id q28so12442319vsp.7
        for <linux-usb@vger.kernel.org>; Tue, 05 Jul 2022 09:30:06 -0700 (PDT)
X-Gm-Message-State: AJIora8uHOmNMBji89zE1YbdYGZo6MMvRBu5pUV7IgaJqJwshSgPkRuM
        5bl9vmEMjkb6METR1dYt5se0n05RU8E/Fy37Nw==
X-Google-Smtp-Source: AGRyM1sVtLtjcERxRubM7SzrfUKl6HHgPc94yiLBKPDEt0d6NiAQMFMB2d4xg2djNBPEW9awrYMdYnyf4N/lw/t+Nq8=
X-Received: by 2002:a67:d194:0:b0:357:8ea:5554 with SMTP id
 w20-20020a67d194000000b0035708ea5554mr175401vsi.0.1657038605004; Tue, 05 Jul
 2022 09:30:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220702220355.63b36fb8@Cyrus.lan>
In-Reply-To: <20220702220355.63b36fb8@Cyrus.lan>
From:   Rob Herring <robh@kernel.org>
Date:   Tue, 5 Jul 2022 10:29:53 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+K7MN6kzMshNtBXYsM=1AKyJFL7OQpsevba2xmKz0=sg@mail.gmail.com>
Message-ID: <CAL_Jsq+K7MN6kzMshNtBXYsM=1AKyJFL7OQpsevba2xmKz0=sg@mail.gmail.com>
Subject: Re: [PATCH v3] drivers/usb/host/ehci-fsl: Fix interrupt setup in host mode.
To:     Darren Stevens <darren@stevens-zone.net>
Cc:     linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        Scott Wood <oss@buserror.net>,
        Christian Zigotzky <chzigotzky@xenosoft.de>,
        Alan Stern <stern@rowland.harvard.edu>,
        Linux USB List <linux-usb@vger.kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Yang-Leo Li <leoyang.li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Jul 2, 2022 at 3:04 PM Darren Stevens <darren@stevens-zone.net> wrote:
>
> In patch a1a2b7125e10 (Drop static setup of IRQ resource from DT
> core) we stopped platform_get_resource() from returning the IRQ, as all
> drivers were supposed to have switched to platform_get_irq()
> Unfortunately the Freescale EHCI driver in host mode got missed. Fix
> it.
>
> Fixes: a1a2b7125e10 (Drop static setup of IRQ resource from DT core)
> Reported-by: Christian Zigotzky <chzigotzky@xenosoft.de>
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Darren Stevens <darren@stevens-zone.net>
> ---
>  v3 - Corrected resource allocation in fsl-mph-dr-of.c
>
>  v2 - Fixed coding style, removed a couple of unneeded initializations,
>       cc'd Layerscape maintainers.
>
> Tested on AmigaOne X5000/20 and X5000/40 Contains code by Rob Herring
> (in fsl-mph-dr-of.c)

Thanks for fixing.

Acked-by: Rob Herring <robh@kernel.org>
