Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C4EB42912BF
	for <lists+linux-usb@lfdr.de>; Sat, 17 Oct 2020 17:46:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437440AbgJQPqT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 17 Oct 2020 11:46:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2437369AbgJQPqT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 17 Oct 2020 11:46:19 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B857EC061755
        for <linux-usb@vger.kernel.org>; Sat, 17 Oct 2020 08:46:18 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id t25so7707273ejd.13
        for <linux-usb@vger.kernel.org>; Sat, 17 Oct 2020 08:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=r2WbkMY6GBWuEsxZGxO/yMT9CWDwanc+cLQHeWo85DE=;
        b=atS/E69wIS0wjlbku3p4TsjGHsLOLuJHqNh9bfMSM09mWpNR5k7ux/U4IoxBe8ZIwP
         ZduJVHBiuuuknZHcAdsSC2PBGNiY3Ma94uuZ7FBe9h5/IcjfwNZSlSetgaDRKTjBDtcp
         1P1icC9XyqQAclRZpVwW1EPR/behrB3yHlJ1u9QulFxDpHN6/EtzVP0fYnhmo/aaICic
         Hmkx9YSnT4tdMPvaM/BuBiTt9lggfWC0+iKU3awtFvQpInSNdJOZGoE5crx3IgMGsVkZ
         zv1bMWLotW/POvZdapy1nF4u60yq4YRFS7/9niJdGb2P7r+z6q+NNE2QIElyP7CuD/4V
         cbcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=r2WbkMY6GBWuEsxZGxO/yMT9CWDwanc+cLQHeWo85DE=;
        b=AcSF58iPrtokk8ZdJhIG4fg8vxUV8jXzKh8sNdEUlfVSXW3jn78zGHDkKOkxWZIsiL
         B+ATtyu95WY+QpbNuxQoebEl5ire1ApbtUFoN3vIxP0u9DNAEIAVhd/ScrDFc/kC3d63
         Y+Y+hMowNGyhp5WOcjq8CrJOoQ2wazE/CUkWVtOAe4J4DODU6A0wQLJc8aE6SyAwc2J9
         7nVO4hcPDy+S8nvqAa8wkfwhGfUXNslwJndPtfHbUGnBfjqGK4V9c2e8xoUOtL6FoQzR
         YM3C0L4QdA5CW1G/l6z/lrQRhn2TpEXTToY4lacF/g8u7MzjQy4r0LdLd/64ti6c2AFi
         D7yQ==
X-Gm-Message-State: AOAM530kkoRGhi+0FgbkOSZQDuhOklbbiVZ6cQgBZ77lrw0TsL6iTRUF
        xXiV1p5RPAepJCpzhDggy7FPioZTmPiaSje4YjU=
X-Google-Smtp-Source: ABdhPJz2OnkL487rmsKk1eQHz4J90Z5Y3P27gcqHAooNAWNt9TbTh6MKJwaZg+snC+ldj6ArhIEwgVVfxO5O3l2SBvE=
X-Received: by 2002:a17:906:1a10:: with SMTP id i16mr9053020ejf.162.1602949577368;
 Sat, 17 Oct 2020 08:46:17 -0700 (PDT)
MIME-Version: 1.0
References: <c5e3148d-63c6-17f6-f4f8-1491ce8e6775@kernel.dk>
In-Reply-To: <c5e3148d-63c6-17f6-f4f8-1491ce8e6775@kernel.dk>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Sat, 17 Oct 2020 17:46:06 +0200
Message-ID: <CAFBinCAqwDPQ-dZVfV8kv777mqhSthbH7O7HMUpp6hy1KJLRhA@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_warning=3A_label_=E2=80=98error=5Fdebugfs=E2=80=99_defined_but_n?=
        =?UTF-8?Q?ot_used_=5B=2DWunused=2Dlabel=5D?=
To:     Jens Axboe <axboe@kernel.dk>
Cc:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Jens,

On Sat, Oct 17, 2020 at 4:57 PM Jens Axboe <axboe@kernel.dk> wrote:
>
> Hi,
>
> There's a new warning in -git if:
>
> CONFIG_USB_DWC2_PERIPHERAL || CONFIG_USB_DWC2_DUAL_ROLE
>
> isn't set in the .config:
>
> drivers/usb/dwc2/platform.c: In function =E2=80=98dwc2_driver_probe=E2=80=
=99:
> drivers/usb/dwc2/platform.c:611:1: warning: label =E2=80=98error_debugfs=
=E2=80=99 defined but not used [-Wunused-label]
>   611 | error_debugfs:
>       | ^~~~~~~~~~~~~
>
> which was caused by this commit:
>
> commit e1c08cf23172ed6fb228d75efc9f4c80a6812116
> Author: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Date:   Sat Jul 4 00:50:43 2020 +0200
>
>     usb: dwc2: Add missing cleanups when usb_add_gadget_udc() fails
thanks for pointing this out! It seems like v2 of my patch was picked.
v3 [0] had this exact issue fixed which has been found by the kbuild
test robot
I can send a patch adding the #ifdefs so it can go into a for-linus
tree with a Fixes tag for the above commit
is there anything apart from that which needs to be done?


Best regards,
Martin


[0] https://lkml.org/lkml/2020/7/27/1429
