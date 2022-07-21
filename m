Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2DE6757D73C
	for <lists+linux-usb@lfdr.de>; Fri, 22 Jul 2022 01:06:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233181AbiGUXGy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Jul 2022 19:06:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229501AbiGUXGy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Jul 2022 19:06:54 -0400
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B195F8C8F6
        for <linux-usb@vger.kernel.org>; Thu, 21 Jul 2022 16:06:52 -0700 (PDT)
Received: by mail-yb1-xb34.google.com with SMTP id 7so5417888ybw.0
        for <linux-usb@vger.kernel.org>; Thu, 21 Jul 2022 16:06:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cTLhFXIHh0SUJ25wVZJw+HP2iRwlWac00C5bdTV0xrE=;
        b=Xt7u6/rOiGa+WA9iGb4wzxgW9oSlxQmy0TfcioYyZgrNHiaMaxK43LSDcX+jm+toCt
         BftxvGaSkf/vWCRkRra3CYO0XCUv+vLYYXVP4NtLQ1ycggMa2fGznwGYx0w1YWaC5Qw+
         67kjByBYZY+F13k+7ab9cDWqazn1S+jCVav1NLA3HLV0A/tXeEnsuwD3jn0GCLLGZ3dG
         Bv6vW2CQWegScocZeE705+IKMCsz07ps1p9hi4r6mC+okJVMha/GGhDaXXH5j0sdJff4
         JWzTL6UWF8/kfhyDpcViaIrAlUMC9s2g2dDdOtjy8IijPe8P7v7CfAyDg2vVJWLOxNFg
         gC9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cTLhFXIHh0SUJ25wVZJw+HP2iRwlWac00C5bdTV0xrE=;
        b=28L2lPBDQ1GjBGAscE3H0jng41j4m8K3DTZUI9hI+uccmuld+tju6iQK/meFHUbT2b
         ltS+TfM2joAWMaWXXh3PBtKkO5sYduC5VQROHwgWgFST0mlan19MZbkiOIvhGccVOYt1
         y7YgUtQoWBB+6yWR19fQxaCTUhog21svOW29xC1j38pDLq8NSnpFRM+jT75Cq2IQVh7l
         7S/WB8excH03vzpAYL4G6N1W0mcXL0/c8WTfHxn+Xb+m38FBkLZegdePWkm5sIi8k8on
         WKKbY3irRhlnM18WiSuT+vlPlnrtCC30V1Q2V8tHW1Io3sB55FIcpA7SjiT3lMT4XLkn
         vnvQ==
X-Gm-Message-State: AJIora9Bgv+EV+CBm8xigM1iXDHiXbYiVXzLT+NRIA+cVffqTUU+DcUT
        +yi+tRm3G0O9V/3qz7oGYTUNIZNDUpV62B8vbiMeLcVnOYM=
X-Google-Smtp-Source: AGRyM1uioPfGAyKMjHvvfN8AQOo9jULB0onEsOaXUuTW+LG1Vcj3oj+HzMgmiVdk0RUHy1+As357+DdWUA9o0m+XKng=
X-Received: by 2002:a25:8384:0:b0:66f:ad5a:a7b9 with SMTP id
 t4-20020a258384000000b0066fad5aa7b9mr777236ybk.352.1658444811762; Thu, 21 Jul
 2022 16:06:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210714061807.5737-1-martin.kepplinger@puri.sm>
In-Reply-To: <20210714061807.5737-1-martin.kepplinger@puri.sm>
From:   Saravana Kannan <saravanak@google.com>
Date:   Thu, 21 Jul 2022 16:06:15 -0700
Message-ID: <CAGETcx-rfcP9dFSstf7PKmc2W3kWRLCMRGz8uCvJxo-OpFpjgw@mail.gmail.com>
Subject: Re: [PATCH v2] usb: typec: tipd: Don't block probing of consumer of
 "connector" nodes
To:     Martin Kepplinger <martin.kepplinger@puri.sm>
Cc:     grandmaster@al2klimov.de, gregkh@linuxfoundation.org,
        heikki.krogerus@linux.intel.com, rjw@rjwysocki.net, kernel@puri.sm,
        linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        Android Kernel Team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jul 13, 2021 at 11:18 PM Martin Kepplinger
<martin.kepplinger@puri.sm> wrote:
>
> Similar as with tcpm this patch lets fw_devlink know not to wait on the
> fwnode to be populated as a struct device.
>
> Without this patch, USB functionality can be broken on some previously
> supported boards.
>
> Fixes: 28ec344bb891 ("usb: typec: tcpm: Don't block probing of consumers of "connector" nodes")
> Signed-off-by: Martin Kepplinger <martin.kepplinger@puri.sm>
> ---
>
> revision history
> ----------------
> v2: (thank you Saravana)
> * add a code-comment why the call is needed.
>
> v1:
> https://lore.kernel.org/linux-usb/20210713073946.102501-1-martin.kepplinger@puri.sm/
>
>
>
>  drivers/usb/typec/tipd/core.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
>
> diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
> index 938219bc1b4b..21b3ae25c76d 100644
> --- a/drivers/usb/typec/tipd/core.c
> +++ b/drivers/usb/typec/tipd/core.c
> @@ -629,6 +629,15 @@ static int tps6598x_probe(struct i2c_client *client)
>         if (!fwnode)
>                 return -ENODEV;
>
> +       /*
> +        * This fwnode has a "compatible" property, but is never populated as a
> +        * struct device. Instead we simply parse it to read the properties.
> +        * This breaks fw_devlink=on. To maintain backward compatibility
> +        * with existing DT files, we work around this by deleting any
> +        * fwnode_links to/from this fwnode.
> +        */
> +       fw_devlink_purge_absent_suppliers(fwnode);
> +

Hey Martin,

As part of a series I'm working on, I'm looking into deleting
fw_devlink_purge_absent_suppliers() and having the driver core figure
this out automatically.

So I was making sure all the current uses of
fw_devlink_purge_absent_suppliers() would automatically be handled by
driver core. But when I looked at this usage of
fw_devlink_purge_absent_suppliers(), I didn't see any "compatible"
property in the "connector" child node. So, I'm confused how you had a
problem without this patch.

fw_devlink would have created fwnode links
between typec_pd and usb_dwc3_0, figured out it's a cycle and have
stopped enforcing the "remote-endpoint" dependencies.

Can you give me more details please on why you were having a problem
without this patch?

I'm looking at arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi as an
example because you listed it in your v1 patch.

-Saravana

>         tps->role_sw = fwnode_usb_role_switch_get(fwnode);
>         if (IS_ERR(tps->role_sw)) {
>                 ret = PTR_ERR(tps->role_sw);
> --
> 2.30.2
>
