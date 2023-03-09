Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FF296B2C9C
	for <lists+linux-usb@lfdr.de>; Thu,  9 Mar 2023 19:05:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230016AbjCISFf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Mar 2023 13:05:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229706AbjCISF3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Mar 2023 13:05:29 -0500
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC76A64241
        for <linux-usb@vger.kernel.org>; Thu,  9 Mar 2023 10:05:26 -0800 (PST)
Received: by mail-pg1-x52a.google.com with SMTP id bn17so1568981pgb.10
        for <linux-usb@vger.kernel.org>; Thu, 09 Mar 2023 10:05:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678385125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F0ABrZm/laoJveDOwjUgnffZfJ7ABmuxocnfWkNK1LQ=;
        b=Ib5A+VKJ9AXsDTMUML0lAyCo2bqRQgJEGgzIdcZWg56TYbo0NjME+67h1B+jIoRgTH
         9nF9p9VxDberc1h0DAdi1WUNp48qKLqCIegf14XI2/Ve+tb/+NJRNikf8Thlyt4aMARU
         P2Em94wS8lmVGlodo8MuPf7/Kv83aZQbN3B0tuvcMvtsimwK2zX4UXZ/0VKmQ3/6Iuyu
         48SQZcaJGgXEBIH3+5o6IFFV8PGbTBxjS7qO2zJnevwsVNMuGR3E9fzZWXa17/QkdiIZ
         ouCLVIXOBJDckdSU6DG3uWBcM4tlri+npZrhfyPhPny6i2hTzHdvb7giNhR+MBeJviVb
         S03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678385125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F0ABrZm/laoJveDOwjUgnffZfJ7ABmuxocnfWkNK1LQ=;
        b=E1M0azfdzGTp1J2UOQQXQ/UUlT35+3TVGPj32ipcrHycSUKl9X3FkQcBHD9xXZHDv+
         X7QeP8u4Zi3FGBl9059j/2Sr749qk0N5jPZwNELSS6dTz9ek3/7oG4ysqvkMt4+wF63t
         phArEOnhAOgDfbSupjLn7c6hakX5/+RKqW4+UXJb7+UPNzmmMrc5BU2rImvLpCHxvDLS
         pJb7s1IW0Y4/sIWQXb+wR/gOpFVFtC8pzU6XFvMW5Hdv5BVtuF1Ur6h956iMntL+tmnu
         EO/XeAWnoZh5gntQ8hY1vv36TDktp78tGpJVYxYqlgG1xYCmrOVMq1VDZZoVp4aMlAW+
         WGvg==
X-Gm-Message-State: AO0yUKUYqMVyy9/0y5/rSTIT39mmvjql02fC3i0fKjIPCis9fmYzLk9w
        cyKYNjPm1JHQ8CTx3HQRifFXMjWOgzAQAgo495OC5Q==
X-Google-Smtp-Source: AK7set92xctTDshGXs7o6XU97WD5hd+EVosmSQEaNti+rPIQop4SET3skwXSjtatn9JSUpARwMLWeA2lKCRK0bniSTE=
X-Received: by 2002:a65:680e:0:b0:503:912f:d116 with SMTP id
 l14-20020a65680e000000b00503912fd116mr743400pgt.3.1678385125388; Thu, 09 Mar
 2023 10:05:25 -0800 (PST)
MIME-Version: 1.0
References: <20230301214952.2190757-1-saravanak@google.com>
In-Reply-To: <20230301214952.2190757-1-saravanak@google.com>
From:   Saravana Kannan <saravanak@google.com>
Date:   Thu, 9 Mar 2023 10:04:49 -0800
Message-ID: <CAGETcx_DTHW4-WMK4qRhvhxiunUB2f79cpXSfQ1x-hifZQ+tgw@mail.gmail.com>
Subject: Re: [PATCH v1 0/4] Remove use of fw_devlink_purge_absent_suppliers()
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Len Brown <lenb@kernel.org>
Cc:     Yongqin Liu <yongqin.liu@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Martin Kepplinger <martin.kepplinger@puri.sm>,
        Amelie Delaunay <amelie.delaunay@foss.st.com>,
        kernel-team@android.com, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Greg,

Don't pull in this series please. It needs more testing from the folks
I cc'ed and it's already breaking things for Martin. This needs more
revisions.

-Saravana

On Wed, Mar 1, 2023 at 1:49=E2=80=AFPM Saravana Kannan <saravanak@google.co=
m> wrote:
>
> Yongqin, Martin, Amelie,
>
> We recent refactor of fw_devlink that ends with commit fb42378dcc7f
> ("mtd: mtdpart: Don't create platform device that'll never probe"),
> fw_devlink is smarter and doesn't depend on compatible property. So, I
> don't think these calls are needed anymore. But I don't have these
> devices to test on and be sure and the hardware I use to test changes
> doesn't have this issue either.
>
> Can you please test these changes on the hardware where you hit the
> issue to make sure things work as expected?
>
> Yongqin, If you didn't have the context, this affected hikey960.
>
> Greg,
>
> Let's wait for some tests before we land these.
>
> Thanks,
> Saravana
>
> Cc: Yongqin Liu <yongqin.liu@linaro.org>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Martin Kepplinger <martin.kepplinger@puri.sm>
> Cc: Amelie Delaunay <amelie.delaunay@foss.st.com>
>
> Saravana Kannan (4):
>   usb: typec: stusb160x: Remove use of
>     fw_devlink_purge_absent_suppliers()
>   usb: typec: tipd: Remove use of fw_devlink_purge_absent_suppliers()
>   usb: typec: tcpm: Remove use of fw_devlink_purge_absent_suppliers()
>   driver core: Delete fw_devlink_purge_absent_suppliers()
>
>  drivers/base/core.c           | 16 ----------------
>  drivers/usb/typec/stusb160x.c |  9 ---------
>  drivers/usb/typec/tcpm/tcpm.c |  9 ---------
>  drivers/usb/typec/tipd/core.c |  9 ---------
>  include/linux/fwnode.h        |  1 -
>  5 files changed, 44 deletions(-)
>
> --
> 2.39.2.722.g9855ee24e9-goog
>
