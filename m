Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD0192C3D1C
	for <lists+linux-usb@lfdr.de>; Wed, 25 Nov 2020 11:01:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727498AbgKYKAi (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 25 Nov 2020 05:00:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727362AbgKYKAi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 25 Nov 2020 05:00:38 -0500
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com [IPv6:2607:f8b0:4864:20::e44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1133CC0613D4
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2020 02:00:38 -0800 (PST)
Received: by mail-vs1-xe44.google.com with SMTP id m62so904983vsd.3
        for <linux-usb@vger.kernel.org>; Wed, 25 Nov 2020 02:00:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UAU7DB+mb8v9k4tnEC8FYKRtl3QD5RFsk8nkbaMp2Qo=;
        b=jbbExdOZQ/8Fx0boq19k+MRfmRPBLBsbMai+6/BpVRa0Scr4U+ZCHeR+g7OS9XrCCO
         dQe2+yQipdj/NQgJAsg3DP7oT3EVRY9w70ZRG8ou33vT+gpkuvQbIjz9Cw2/WAXzfARK
         C4+HeisFQytGv2jx0GkDA5M8+D9mzj07nV0pnHOJnUm6Puo74nipH1H26BsrGr32CdFL
         z4NYdvEizYeC0RibpNEtYExOl3xUd/qDt9lN+pmgtmdW9muhwqnVfG5EI919j9ItIBHK
         LMQua9LguaDxwDzLXiVyvZbEAeesjowX5ZrqOqpJHa0/BKv2ypgqm4wTNnf2OYuW3K+e
         uV4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UAU7DB+mb8v9k4tnEC8FYKRtl3QD5RFsk8nkbaMp2Qo=;
        b=cNiAECx2rm/2ZslRsvA2OjJHRt5Zq5AazqTTxGBNSlME/vZXIEroQ+0eR5RLK+wg26
         pUAtix3AYH/Z2PSUvMxSqdIpCVkrJCfvQzH2Vw5cXA0/jC4nkscFgmDeJ8ks6SPfshaq
         YMhjeW9AIDSC7Ar6qAAnVzkGbcS1ezJ6YWyQyn7T7YN2J9FZrJP3VqfrPhzoGGBHWZMm
         FrrOIC2or+7q49dICZlIIBoXBZVC/cZZHt91oNmRgSk88rL8GvmsYLKxjtfZklcVi333
         BrwaaVh7LlWZu7SbLAhs+5vUS755Ejl4SNu7euA9ovkBfZV7ER9/IP64S5xpcy3EtCFV
         YiLA==
X-Gm-Message-State: AOAM530QofAWud2ISPTgUeEgchY0b0jnBf0RipDfWnweIkRUhDT8jCih
        9a/g33Tt6xOKYrLRHpU1OAaxIx+LU0pSQ5fOjjq1W6th1qE=
X-Google-Smtp-Source: ABdhPJzIE+0+tOX+W4kpbaCj/+092Iy5UwjqJXSgVfle950ym/25GYO9mtzt8jXl/pbWZNI0m/ZMEe0y8E5gevMLAew=
X-Received: by 2002:a05:6102:ce:: with SMTP id u14mr1318418vsp.10.1606298437300;
 Wed, 25 Nov 2020 02:00:37 -0800 (PST)
MIME-Version: 1.0
References: <20201124094155.10510-1-gciofono@gmail.com> <X74mk/lw2NYJ78jq@localhost>
In-Reply-To: <X74mk/lw2NYJ78jq@localhost>
From:   Giacinto Cifelli <gciofono@gmail.com>
Date:   Wed, 25 Nov 2020 11:00:26 +0100
Message-ID: <CAKSBH7Gha4rwacF-gE26x9pTsAgeV3ASvb+BYm5Xz_B3jN_BqQ@mail.gmail.com>
Subject: Re: [PATCH] option: added support for Thales Cinterion EXS82 option port.
To:     Johan Hovold <johan@kernel.org>
Cc:     linux-usb@vger.kernel.org, Lars Melin <larsm17@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Johan,

On Wed, Nov 25, 2020 at 10:40 AM Johan Hovold <johan@kernel.org> wrote:
>
> On Tue, Nov 24, 2020 at 10:41:55AM +0100, Giacinto Cifelli wrote:
> > There is a single option port in this modem, and it is used as debug port
> >
> > Signed-off-by: Giacinto Cifelli <gciofono@gmail.com>
>
> Thanks for the update (and thanks for the review, Lars).
>
> Using the option driver for just a debug port seems like overkill, but
> ok.
>
> Some form issues:
>
>  - When updating a patch always include a patch revision number in the
>    Subject prefix (e.g. "[PATCH v2] USB: serial: option: add ...").
>

technically this is a new patch, as I have changed the name, but I was
reserving the v2 for the actual MV31 patch that I will send in the
near future.

>  - Include a short changelog below the "---" line so we know what
>    changed since the previous version.

ok

>
>  - Try to follow the convention used by the subsystem for the Subject
>    prefix (i.e. "USB: serial: option: add ...").

ok. Should I re-submit this patch?  Do you prefer v2 or v3 for a new submit?

thank you,
Giacinto
