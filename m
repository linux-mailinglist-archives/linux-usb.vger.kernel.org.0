Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 16F8B65CE56
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jan 2023 09:30:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234014AbjADIaz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Jan 2023 03:30:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229590AbjADIae (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Jan 2023 03:30:34 -0500
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com [IPv6:2a00:1450:4864:20::12d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEFF81C12F
        for <linux-usb@vger.kernel.org>; Wed,  4 Jan 2023 00:30:08 -0800 (PST)
Received: by mail-lf1-x12d.google.com with SMTP id g13so49371069lfv.7
        for <linux-usb@vger.kernel.org>; Wed, 04 Jan 2023 00:30:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vcOE6eT95HsPyVhSphz+MMwh1DHfxEYE80xC0UOz9oU=;
        b=LRgR95ydJ89Rd6nd9TsDUWl+S3YF7qmZHwffc3GTBQ1CUsXeS52SVLM71Mb6x1D6x8
         5QGnDI0C2Ox3C136HiSRiE4naHox6VSrZUTnr9n6v3/e9fa+nP1+V25+Ndyd1RPWFYfx
         C7QuqNwbmYrBvpugCzJ6vexYexzL5vHL/l6iSUz/EziHNBxw0lGa/x7yFlRffUT4Lo9s
         9iU0FcOlravSYPmhto66z6sQFVvheabwz+BfHERoHdlrwAEhyd+ugEw3Z+EMCliUbiWT
         F47Mq3Ho6rtvROGR7NHPfKHp9RVtRavFlI08Bp1VAHh9a7/95Fmpssxsf2+1z+q7p0us
         XFCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vcOE6eT95HsPyVhSphz+MMwh1DHfxEYE80xC0UOz9oU=;
        b=E5yxSn73tkiwPDo1DE/4dsTgA5QmuMW1Qcl6yykV11Pb76FEMzLXJI28pzdxK76ope
         sUY3smQrrpfBQpqpnDHzc9rp7gEv4TTxAkcAH25bl6gc+oOy2Zyfv+t52ftB4hfpv0p7
         bI9Cer2nN72G6TfTRdXyf+x/MxsTY9LzvsxiwInvctytyB5RfvCs0TUJ5UJ5LBErCk8o
         wvIiEdIoN/2MbL6TikOvkUvPcnZIjF1TIhme7ZsR3fkIhsA9NkF+zS2PFNiVlhguNzwA
         8VMC01v7vCezLrGnTB1k/urqytlUfsNOKJuBNotO6G0Sqd4OxlLYZnhngkjJz2dq4hSn
         BUwQ==
X-Gm-Message-State: AFqh2kq/xPlbtkNSEWoAs+ZLPbyJuX1HpuBJPAo3Y2EupOAfneOiChXI
        4LkkOy1r9BzIcdxp3GdlsP+CJ9bQkmsoYLdndKk=
X-Google-Smtp-Source: AMrXdXuw/xwoA5YNtQFqKCn1PxLZXeAbso9+A/ZLqCVqlUrbNH3z9Vi456h8za2FDYBQJi/a7D6ryBKaHMvnzYoWigo=
X-Received: by 2002:a05:6512:2017:b0:4b4:e438:e77c with SMTP id
 a23-20020a056512201700b004b4e438e77cmr3219156lfb.132.1672821006421; Wed, 04
 Jan 2023 00:30:06 -0800 (PST)
MIME-Version: 1.0
References: <20230104080601.45562-1-mika.westerberg@linux.intel.com>
In-Reply-To: <20230104080601.45562-1-mika.westerberg@linux.intel.com>
From:   Yehezkel Bernat <yehezkelshb@gmail.com>
Date:   Wed, 4 Jan 2023 10:29:45 +0200
Message-ID: <CA+CmpXuaK7d1pgV4JAmdU+8M_n89WU8S+YXYB6T7tFJraWy3YQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] thunderbolt: A couple of fixes for v6.2-rc
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Utkarsh Patel <utkarsh.h.patel@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 4, 2023 at 10:07 AM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Hi all,
>
> This series includes a couple of fixes for issues found/reported.
>
> Mika Westerberg (3):
>   thunderbolt: Do not call PM runtime functions in tb_retimer_scan()
>   thunderbolt: Use correct function to calculate maximum USB3 link rate
>   thunderbolt: Disable XDomain lane 1 only in software connection manager
>
>  drivers/thunderbolt/retimer.c | 17 +++--------------
>  drivers/thunderbolt/tb.c      | 20 +++++++++++++++-----
>  drivers/thunderbolt/tunnel.c  |  2 +-
>  drivers/thunderbolt/xdomain.c | 17 ++++++++++++-----
>  4 files changed, 31 insertions(+), 25 deletions(-)
>
> --
> 2.35.1
>

Acked-by: Yehezkel Bernat <YehezkelShB@gmail.com>
