Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 638326C2AFE
	for <lists+linux-usb@lfdr.de>; Tue, 21 Mar 2023 08:04:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229971AbjCUHEL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Mar 2023 03:04:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229642AbjCUHEK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Mar 2023 03:04:10 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07341D30D
        for <linux-usb@vger.kernel.org>; Tue, 21 Mar 2023 00:04:09 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id k37so4937937lfv.0
        for <linux-usb@vger.kernel.org>; Tue, 21 Mar 2023 00:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679382247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7tbyVoCIUkuwnDzcG32W4OdMDrXEIavgnsGn9li74v8=;
        b=yChraET9/arxywpaBm0uIpGnJjZC7VyiDllMVup03dJnlPiufNi9e3Nzj2lf+ZHniA
         sfwe1q/uW22fPn+PDlUaZSzwboQs/dLxeD6coJsXjg1Vc6agsTpqORr3LtFwF6JzIPwS
         bqM9PvVbLgTH5uQBOty43tuqXiJXsgs4tN907D7qyHAw+cT2oOYwX7soOdk+dRUe1u5H
         5rA5sBjs4q/+BUOf9PhruG/zel79U8rHZVf54CyRIyAXuyRBJoDYrXZAHiEZ7OZBa87E
         Odw6OVcnAPoed2CfhtSRhJgjoCweO0W2ieWzkyFD8CzN+/R9DNN9s9h4WXnPc4u+Ydme
         JK/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679382247;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7tbyVoCIUkuwnDzcG32W4OdMDrXEIavgnsGn9li74v8=;
        b=0k9W9MhikyZujnbF7tiqOUgpTsaI4vgn2C9hA8Ad0zHy5W+XXTa7ev8nOUxLobdPx8
         KS3KsTJtr7Lg2wGQs1G0Lm99wobphNPXicQUOKhTAhaoO79mAkVK81LubN3w0xqPHH/l
         O+OTs11WWxSMN9ikmhPWSz9NdJLaSv1OYfc3C+Y5u10pnMsXDJ8zAyqVAWRCzY11roUi
         1RWgkkJeKzpyGMBsTbJFfhQVsdblHkHQIwsoAacTevbvmRhNrEjq3ATBFyKhFZ4GXZcu
         Xayn+N0t0IlBrvkQMrCTI0W5T91kiPEWIQ53iIZG5qMNmrX8fiPiIedmBUpRex6rfSdf
         FhoA==
X-Gm-Message-State: AO0yUKUfv5KmhewNOzfkXCMoYrpebrmuWwRwWC80VAF2PDOLk++lN/qx
        M0eeYltfZW0Q1WKi0K2iUoawONCX38XH3CfMkekMzxu9YdEnJ8hE
X-Google-Smtp-Source: AK7set9T3I8GA2uJOUQygr+w4BX+oII8CcfEQqUcpktFtsWlC8MeRy03+La5618HVmKpwn5tRsvyiGGX13XsEv0bYdA=
X-Received: by 2002:ac2:41c6:0:b0:4d5:ca43:704a with SMTP id
 d6-20020ac241c6000000b004d5ca43704amr476391lfi.13.1679382247216; Tue, 21 Mar
 2023 00:04:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230319133732.1702841-1-trix@redhat.com>
In-Reply-To: <20230319133732.1702841-1-trix@redhat.com>
From:   Jun Nie <jun.nie@linaro.org>
Date:   Tue, 21 Mar 2023 15:05:07 +0800
Message-ID: <CABymUCMha=XE_=LDNXiJDzhNCpGU4bckuNkoCAmb_bWO8bPu0w@mail.gmail.com>
Subject: Re: [PATCH] usb: typec: tipd: remove unused tps6598x_write16,32 functions
To:     Tom Rix <trix@redhat.com>
Cc:     heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org,
        nathan@kernel.org, ndesaulniers@google.com, sven@svenpeter.dev,
        agx@sigxcpu.org, Jonathan.Cameron@huawei.com,
        u.kleine-koenig@pengutronix.de, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Tom Rix <trix@redhat.com> =E4=BA=8E2023=E5=B9=B43=E6=9C=8819=E6=97=A5=E5=91=
=A8=E6=97=A5 21:37=E5=86=99=E9=81=93=EF=BC=9A
>
> clang with W=3D1 reports
> drivers/usb/typec/tipd/core.c:180:19: error: unused function
>   'tps6598x_write16' [-Werror,-Wunused-function]
> static inline int tps6598x_write16(struct tps6598x *tps, u8 reg, u16 val)
>                   ^
> drivers/usb/typec/tipd/core.c:185:19: error: unused function
>   'tps6598x_write32' [-Werror,-Wunused-function]
> static inline int tps6598x_write32(struct tps6598x *tps, u8 reg, u32 val)
>                   ^
> These static functions are not used, so remove them.
>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/usb/typec/tipd/core.c | 10 ----------
>  1 file changed, 10 deletions(-)
>
Reviewed-by: Jun Nie <jun.nie@linaro.org>
