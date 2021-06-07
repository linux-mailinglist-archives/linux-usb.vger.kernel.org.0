Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 789F439DBC0
	for <lists+linux-usb@lfdr.de>; Mon,  7 Jun 2021 13:53:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230175AbhFGLz0 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Jun 2021 07:55:26 -0400
Received: from mail-ed1-f44.google.com ([209.85.208.44]:41696 "EHLO
        mail-ed1-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230097AbhFGLzZ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Jun 2021 07:55:25 -0400
Received: by mail-ed1-f44.google.com with SMTP id g18so17980842edq.8
        for <linux-usb@vger.kernel.org>; Mon, 07 Jun 2021 04:53:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NkT0qRHDK83AwCG1o0yHKyzYeQZeAEBfrbSqUE5BCWM=;
        b=ahses5GZ0Bf+SGq2RXntVXxm6+T+nttMEFLrbBfx0UF2N+is1OxXoV6YVa88IhDXgJ
         wZarI6kEBOwletzzvK2089uiMH+I3qa26S7/dnl2WAuDWzm58u1Lpf6jtzDH3pwJSbgN
         mmuM4OaEdMansrqAOTRj4lSle6n1WB8UHsR7cXtvbNORSbImufcJt1YjHo8YcjUaQRFF
         D5aHKF+c4KpHmawSvfKDvUqiPAmGBtWFU4S1sKuKQVVVUUQ/D3gSLhku9VHux9XjRpe5
         +s+kkhwDr9vEWS7bb6vRZJSkmTOqQ5HT4e/6YtcEuA75vY+5O3kwgZ33wpQcDK8aXh9L
         Yfbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NkT0qRHDK83AwCG1o0yHKyzYeQZeAEBfrbSqUE5BCWM=;
        b=s+H3q4xDlK3Rim6Wfm+ZKs6zxoJf0tLyTHxlIOZo8GwoEKrGED7VirnYCfCycaHfge
         CibosfWJRgo227Uf9z3HjupYlyYT7eEw1/kEIa3i//vpSb+Uc5mroEAE1p+p0P0FUx/c
         t578iD+ruxQT923diKCK+pc6tH4/40B2C7OACHtKjP7Zl/POfAwa4LoGl6gxH3hdWrXT
         HTXGpiJATzfHyGATTsGw9qxRdMMyQQx2N+b7j7NDGqe1+DfAYFrCJe/zQLP85+nLCQCP
         TivLOwl2rDxQSfNdwMt5mTLR3uulNmK5VmI2Q7hwiOHzbonG6f9kQVrJnCgZZoO9CPk1
         CUSg==
X-Gm-Message-State: AOAM5330jofKRI9qoBlqFqtAiIdo8Egdqb6JiVhTeGyiMrduu5nMehvN
        4dSU9eH9Yj/ZwHV8kCjYB29lelqLbh2ZFzdNr1s=
X-Google-Smtp-Source: ABdhPJzkkKtiZbVXtyiy/EKFdp286OOH7WOHvsYA5QhjMZH+WmwZ23OmzT9l9eq4TAIe2unWR+o5vk04F3eOnEvXnIU=
X-Received: by 2002:a05:6402:1771:: with SMTP id da17mr15580485edb.31.1623066742635;
 Mon, 07 Jun 2021 04:52:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210607110030.38664-1-mika.westerberg@linux.intel.com>
In-Reply-To: <20210607110030.38664-1-mika.westerberg@linux.intel.com>
From:   Yehezkel Bernat <yehezkelshb@gmail.com>
Date:   Mon, 7 Jun 2021 14:52:06 +0300
Message-ID: <CA+CmpXs3B-5KPzBjmyEtpY0or+0B_KHyeguFCqXuVitbqkHJug@mail.gmail.com>
Subject: Re: [PATCH 0/5] thunderbolt: Support for Intel Alder Lake and improvements
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     linux-usb@vger.kernel.org, Michael Jamet <michael.jamet@intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Andreas Noever <andreas.noever@gmail.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        kernel test robot <lkp@intel.com>,
        Gil Fine <gil.fine@intel.com>,
        Azhar Shaikh <azhar.shaikh@intel.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 7, 2021 at 2:00 PM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> Hi all,
>
> This series adds support for Intel Alder Lake which is the successor of
> Tiger Lake. The integrated Thunderbolt/USB4 controller is pretty close to
> the one found in Tiger Lake too.
>
> In addition there are few improvements for issues reported by Dan Carpenter
> and kernel test robot.
>
> The series applies on top of thunderbolt.git/next.
>
> Azhar Shaikh (1):
>   thunderbolt: Add support for Intel Alder Lake
>
> Gil Fine (1):
>   thunderbolt: Poll 10ms for REG_FW_STS_NVM_AUTH_DONE to be set
>
> Mika Westerberg (3):
>   thunderbolt: Bond lanes only when dual_link_port != NULL in alloc_dev_default()
>   thunderbolt: Add device links only when software connection manager is used
>   thunderbolt: No need to include <linux/acpi.h> in usb4_port.c
>
>  drivers/thunderbolt/icm.c       | 20 ++++++----
>  drivers/thunderbolt/nhi.c       | 71 ++-------------------------------
>  drivers/thunderbolt/nhi.h       |  2 +
>  drivers/thunderbolt/tb.c        | 67 +++++++++++++++++++++++++++++++
>  drivers/thunderbolt/test.c      | 22 +++++-----
>  drivers/thunderbolt/usb4_port.c |  1 -
>  6 files changed, 97 insertions(+), 86 deletions(-)
>

 Reviewed-by: Yehezkel Bernat <YehezkelShB@gmail.com>
