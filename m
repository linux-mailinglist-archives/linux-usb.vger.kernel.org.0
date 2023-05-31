Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26128717F63
	for <lists+linux-usb@lfdr.de>; Wed, 31 May 2023 14:00:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232788AbjEaMAn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 31 May 2023 08:00:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232018AbjEaMAl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 31 May 2023 08:00:41 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C56CE9D
        for <linux-usb@vger.kernel.org>; Wed, 31 May 2023 05:00:40 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2af2b74d258so62156401fa.3
        for <linux-usb@vger.kernel.org>; Wed, 31 May 2023 05:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685534439; x=1688126439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c5tw5jKXhx1AN3glZKf4m5NIIJQ1wFgD9x6nVPIynFo=;
        b=EIb+Aw7jjV0siLWukPaDS6ED1a+JMrKuUaoHW9ZGkZk07IKynXtrvTPaMB2oF7H+W2
         QwWEiF/+2DoJDIooKINYmZADzhY9rW5YL+zB8EuCUgIuLScV4r1kUcYjHqnzQaBnarN6
         LKTNZd88CBYDtqeeGqDSDS3uQr29TWyjdFtZZMUu166m5w2+LJ3XMBzQcUX6NExzPBdk
         aaTpDeUUJkjZE2EAbiLDCBUr8nrHINYj61KQfnmeoaw5Gc65v3783r0qliZOaOXlSMdS
         Gmo4wypVI5i/X9RyWQHQx9BIqKYji2iv6rLIJvxe/2GROyQ+DSrw3WfmifUg8UKqTWn6
         QGPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685534439; x=1688126439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c5tw5jKXhx1AN3glZKf4m5NIIJQ1wFgD9x6nVPIynFo=;
        b=kFE1JXyfJRR67jNVxOd6/bA1RpRGJLcQUxAzd1pshShbQ4uWU5Zn/RI6y/Y1b0Mb42
         WzZjXtZiEsP3/fGzQ+HET7h3MA59/tqQ7jrIIhcA5NMV4AZjH7zCgb6qFF6eEmIh0re2
         3OQnB9hGyWTc7Vdx7hQmHMG7EzcXlEAnlhApLtDzjfmH+02N7co3hMCSyjXo7fTiptWz
         r6I4F/xbnUq1PMDsFjU41Z/Fs1mWgiD8hCAwWdPpAPqw535alWHiKEauQiyWhpYTNQXI
         TOHw9Xn0iI+wK7zzYL5rfEwZHrCMpe3qXY5h/UCmc2yxjhlrQ5ZSLTFOBZ3GXitSVAKD
         dOEA==
X-Gm-Message-State: AC+VfDyhMCA61b7F5w22r+25vqSfC72Jr7s1XtMWX2gV/cHajkx4Z0Gh
        ucuBz7uUEVCDIcvCHOgqThigmQHkx70AsitCt/E=
X-Google-Smtp-Source: ACHHUZ4OTAOfc8kZJy1STWOQGHu3PSJ9m0ftyNkdqhsG1MZgUAsV9JgkwGMxwg9iHVeYGj6FGOep5pd7C7XDldjeFck=
X-Received: by 2002:a2e:9098:0:b0:2aa:4550:916c with SMTP id
 l24-20020a2e9098000000b002aa4550916cmr2842019ljg.53.1685534438890; Wed, 31
 May 2023 05:00:38 -0700 (PDT)
MIME-Version: 1.0
References: <20230531090645.5573-1-mika.westerberg@linux.intel.com> <20230531090645.5573-4-mika.westerberg@linux.intel.com>
In-Reply-To: <20230531090645.5573-4-mika.westerberg@linux.intel.com>
From:   Yehezkel Bernat <yehezkelshb@gmail.com>
Date:   Wed, 31 May 2023 15:00:22 +0300
Message-ID: <CA+CmpXsrqNUdF5Td7Caa4Vr3i9hui+eRULr+_XRuehmkQ95U=g@mail.gmail.com>
Subject: Re: [PATCH 03/20] thunderbolt: Identify USB4 v2 routers
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Gil Fine <gil.fine@linux.intel.com>,
        Christian Kellner <ckellner@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 31, 2023 at 12:06=E2=80=AFPM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> diff --git a/drivers/thunderbolt/tb.h b/drivers/thunderbolt/tb.h
> index 2bda2816ff47..e27fcdf50581 100644
> --- a/drivers/thunderbolt/tb.h
> +++ b/drivers/thunderbolt/tb.h
> @@ -955,7 +955,8 @@ static inline bool tb_switch_is_tiger_lake(const stru=
ct tb_switch *sw)
>   */
>  static inline bool tb_switch_is_usb4(const struct tb_switch *sw)
>  {
> -       return sw->config.thunderbolt_version =3D=3D USB4_VERSION_1_0;
> +       return FIELD_GET(USB4_VERSION_MAJOR_MASK,
> +                        sw->config.thunderbolt_version) > 0;

Does it make sense to reuse the function below i.e. `return
usb4_switch_version(sw) > 0;`?
