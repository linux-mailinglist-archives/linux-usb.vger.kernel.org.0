Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6E8172861F
	for <lists+linux-usb@lfdr.de>; Thu,  8 Jun 2023 19:18:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236631AbjFHRSP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 8 Jun 2023 13:18:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231589AbjFHRSM (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 8 Jun 2023 13:18:12 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2B00269A
        for <linux-usb@vger.kernel.org>; Thu,  8 Jun 2023 10:18:11 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-514ad92d1e3so8483a12.1
        for <linux-usb@vger.kernel.org>; Thu, 08 Jun 2023 10:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1686244690; x=1688836690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vDGJ99Zbvrff4LqU/6lh95oEzEn3622rMSfjHzCbu0g=;
        b=f6Cb11oZJsfaVoKrAOCwpY4luQNk4WtzcsJD3NpK4HcjuzLGFv8Qn0nVVkYcAt3YQO
         /GguEHG5/6Ciw6V0sxvsE+xgu9U78oX4n/R7zouR/ZfWxrDorLYLQbNjNQlxJYB/YEIo
         zsDx/2CpZdJS1RBKIuoNNv/v4y+7T2pTUOyiI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686244690; x=1688836690;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vDGJ99Zbvrff4LqU/6lh95oEzEn3622rMSfjHzCbu0g=;
        b=P8ZVq7hSSXn0v/4zY87jNhsu+3kj6p4tEwzN1QWjqy9iojiXGOTU54nKohifJaI2rj
         Xn6CF7edEdjYy2MrV4ogdtLE5ZMiHLtBUERB9V4LvJ33ieDwfsA7kkfhLPzY8Mh9nxaP
         iOg0pfk2cGOEfzZ+zYr416cqQwsC1QkICwUI7GuhTyyxxSiQJ4oakEffQP8scTeg0G0t
         QEKMiX4kO2ltQJxjc553YL2r9Y7R47HyHMy0DMZBDwriDGaEUQBzMLbNKGaKiPMnQ8GR
         BobQIG3IICJqMITbcGgn5EXIQHVq4dGPe8AyISdJWFAqhf70K8mqNSjZqyKcQ5AqliWN
         Ljdw==
X-Gm-Message-State: AC+VfDz2Hd/n4u6ELYH9qLwSyRunbmb7LVlpdGAhZsnxSm3u5Q4d3ix+
        ZJAQ6cHewDxBcD+nrQj0Q3vXJvFdU0tbbCYA0HJpLg==
X-Google-Smtp-Source: ACHHUZ7LnAAPd+n2rpNyF896j1yJ47ZJuGHoeoyJVboMWkxLuA+OFTUpuzR/cGSdfJ12VJS5hHRMpYRIf6VVVm6pAD8=
X-Received: by 2002:a50:8e5e:0:b0:506:90c4:b63b with SMTP id
 30-20020a508e5e000000b0050690c4b63bmr168316edx.4.1686244689955; Thu, 08 Jun
 2023 10:18:09 -0700 (PDT)
MIME-Version: 1.0
References: <2023060611-coach-entitle-d4e4@gregkh> <20230607193328.3359487-1-pholla@chromium.org>
In-Reply-To: <20230607193328.3359487-1-pholla@chromium.org>
From:   Benson Leung <bleung@chromium.org>
Date:   Thu, 8 Jun 2023 10:17:58 -0700
Message-ID: <CANLzEksUYyzNsBfRiFjeqC482evg+TLt1S5Y4_83Dag0Ktx-Fw@mail.gmail.com>
Subject: Re: [PATCH v2] usb: typec: Fix fast_role_swap_current show function
To:     Pavan Holla <pholla@chromium.org>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        pmalani@chromium.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-9.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        USER_IN_DEF_SPF_WL autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Pavan,

On Wed, Jun 7, 2023 at 12:33=E2=80=AFPM Pavan Holla <pholla@chromium.org> w=
rote:
>
> The current implementation mistakenly performs a & operation on
> the output of sysfs_emit. This patch performs the & operation before
> calling sysfs_emit.
>
> Fixes: 662a60102c12 ("usb: typec: Separate USB Power Delivery from USB Ty=
pe-C")
> Reported-by: Benson Leung <bleung@chromium.org>
> Signed-off-by: Pavan Holla <pholla@chromium.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
>  drivers/usb/typec/pd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/usb/typec/pd.c b/drivers/usb/typec/pd.c
> index 0bcde1ff4d39..8cc66e4467c4 100644
> --- a/drivers/usb/typec/pd.c
> +++ b/drivers/usb/typec/pd.c
> @@ -95,7 +95,7 @@ peak_current_show(struct device *dev, struct device_att=
ribute *attr, char *buf)
>  static ssize_t
>  fast_role_swap_current_show(struct device *dev, struct device_attribute =
*attr, char *buf)
>  {
> -       return sysfs_emit(buf, "%u\n", to_pdo(dev)->pdo >> PDO_FIXED_FRS_=
CURR_SHIFT) & 3;
> +       return sysfs_emit(buf, "%u\n", (to_pdo(dev)->pdo >> PDO_FIXED_FRS=
_CURR_SHIFT) & 3);
>  }
>  static DEVICE_ATTR_RO(fast_role_swap_current);
>
> --
> 2.41.0.rc0.172.g3f132b7071-goog
>


--=20
Benson Leung
Staff Software Engineer
Chrome OS Kernel
Google Inc.
bleung@google.com
Chromium OS Project
bleung@chromium.org
