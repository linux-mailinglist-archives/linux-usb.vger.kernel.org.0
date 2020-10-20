Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 323AB293AEF
	for <lists+linux-usb@lfdr.de>; Tue, 20 Oct 2020 14:05:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2394210AbgJTMFy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 20 Oct 2020 08:05:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2394185AbgJTMFy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 20 Oct 2020 08:05:54 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 558E9C061755;
        Tue, 20 Oct 2020 05:05:54 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id gv6so859876pjb.4;
        Tue, 20 Oct 2020 05:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6pE8pTonRToQddOZg/u1PNWwK6GOXIW5xxXD0YKxIB8=;
        b=lbx7N+wMyJ4WWvUgtd11j3UwKxRv41qSLjM9YvcelPHP329aHu8/+HaJDTgidJ+d45
         dAR2cN8Ek24prEV+KXLkU52TrsR8zMg4WgMGsTSj8K+D68zizdUOkBT2ToOiLVTRia8C
         0qUzD7WUG1RXrb5Ofw3rkjH0fBd0DkkIcpVkaaH9UhA+wyGEsT2ZcF/Fq8u39f3o2f3i
         aOUn+4znT+l7wf7dXKwFARrtb86T52jZOZ4DtCmOcl4grmJ6IRqGI2Q0pqsAyh+85w6E
         2nHdSoUICN9278wfAXIYOJ2sxQ1P4PbQG9jpOtialUMGskGZd36fb7k0vh2Odf/tE40l
         U8cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6pE8pTonRToQddOZg/u1PNWwK6GOXIW5xxXD0YKxIB8=;
        b=efjyrejpT/an/6rAD7YMKBc35YBXTjhHNZKKcKJNqDd4btXGTXnEZf9ULj+Mdi2wtO
         LbkMvFhiqLNkY7ICRy8fWJuACxB8F98ftnfVkNnSrglfQh2KCsBjMM9obQla8vL38TNV
         LkPxkSq4QzCCuavIx0v7Qn3jIq4NMzu5RJnio7deUwU/8mGjeOyV6cM6ump31t5iWldD
         mtrhqbrAVpbAPXBa2O9TVYLtjt1hDltsGpnhRMvfIWqbL+uJeTb7ptnExDTYe+qbGuFj
         UxfNMBwglFndHA3sAIAQUq9NlCLgxl07I0b6tf32K9txGqzoCUJdPZsV/Ak9lG7dvx4P
         bjCw==
X-Gm-Message-State: AOAM531r6SA7kKNyM4RaqzNwiDyAIVgkbiY4vaEs1cEGqVEKkUm+Xt5m
        N+1t81S2uoDjxESpHIFLQ+h3uHoPTkMvfTz/Atk=
X-Google-Smtp-Source: ABdhPJz1IV+xEWmx4K4LDUCCK7DLtU6A8W2Db9XqylJ2KQxhPBpCGEYuQwmBOGyagAZQl72VKacbcYKviXFVhl8Qj2s=
X-Received: by 2002:a17:902:aa8a:b029:d3:c9dd:77d1 with SMTP id
 d10-20020a170902aa8ab02900d3c9dd77d1mr2718759plr.0.1603195553901; Tue, 20 Oct
 2020 05:05:53 -0700 (PDT)
MIME-Version: 1.0
References: <1603098195-9923-1-git-send-email-jun.li@nxp.com>
 <1603098195-9923-2-git-send-email-jun.li@nxp.com> <20201019122516.GN4077@smile.fi.intel.com>
 <VE1PR04MB652805416A0A85E45FFD106E891F0@VE1PR04MB6528.eurprd04.prod.outlook.com>
In-Reply-To: <VE1PR04MB652805416A0A85E45FFD106E891F0@VE1PR04MB6528.eurprd04.prod.outlook.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 20 Oct 2020 15:06:43 +0300
Message-ID: <CAHp75Vf4Z+=EN6xAoXgJ1uJDGhOG3NC8Un1yH=zhPW8GLgRCNA@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] device property: Add fwnode_is_compatible() and
 device_is_compatible() helpers
To:     Jun Li <jun.li@nxp.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "rafael@kernel.org" <rafael@kernel.org>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "lee.jones@linaro.org" <lee.jones@linaro.org>,
        "mika.westerberg@linux.intel.com" <mika.westerberg@linux.intel.com>,
        "dmitry.torokhov@gmail.com" <dmitry.torokhov@gmail.com>,
        "prabhakar.mahadev-lad.rj@bp.renesas.com" 
        <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        "laurent.pinchart+renesas@ideasonboard.com" 
        <laurent.pinchart+renesas@ideasonboard.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>, Peter Chen <peter.chen@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 20, 2020 at 2:35 PM Jun Li <jun.li@nxp.com> wrote:
> > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Sent: Monday, October 19, 2020 8:25 PM
> > On Mon, Oct 19, 2020 at 05:03:13PM +0800, Li Jun wrote:

...

> of_device_is_compatible() will return positive value on match, and 0
> when no matching,
> fwnode_property_match_string() will return 0 if the property was found
> (success); and negative error code on failure.

Thanks for checking this!

-- 
With Best Regards,
Andy Shevchenko
