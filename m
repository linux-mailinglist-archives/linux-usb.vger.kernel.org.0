Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D69FC221ECB
	for <lists+linux-usb@lfdr.de>; Thu, 16 Jul 2020 10:44:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728347AbgGPIoy (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 16 Jul 2020 04:44:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727106AbgGPIoy (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 16 Jul 2020 04:44:54 -0400
Received: from mail-lj1-x243.google.com (mail-lj1-x243.google.com [IPv6:2a00:1450:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2676C061755
        for <linux-usb@vger.kernel.org>; Thu, 16 Jul 2020 01:44:53 -0700 (PDT)
Received: by mail-lj1-x243.google.com with SMTP id s9so6183699ljm.11
        for <linux-usb@vger.kernel.org>; Thu, 16 Jul 2020 01:44:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cqThJOJm2KQFceq+P2unFnnFk2Bh3klDOvK6O7M43nE=;
        b=NqcCp4frCBAGJJUzfEc2Oxy5ElWXWwaIjU2bx0QEpKeKOYWuVHQ8TPBMLqGujNx4wq
         aynrp1wIUOk0sPmWmYQXiJsjCXJ1kfyZT+ZHYOwJTYOMfwrIhtvQbol5UyJdq+/VvwoD
         8DmILZgcWV8wkUsg1AjD+HGDzvLC+v1aiVfXih+6GGnOSArCzj+GSwYha0GUWFOoZicb
         eAekfTr+lao2bisPL89RLddHOFEz8Zb+W2gu8x4hsgSUdoBkSA4elHQ5hnry6tfAroP8
         uN6+eDz9VwfFkKM6MBMVq96TrguDC2+3h0EsHKfcdigCfaY5XS/lcLg8tcXCf2g1Bu1X
         qGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cqThJOJm2KQFceq+P2unFnnFk2Bh3klDOvK6O7M43nE=;
        b=hYNgFsHwMMJFWwzQq5oBQe2UPHYU31P4/lHCqu76YrMMbubGIYNDFSrsPAw/QtdOvl
         6f8VGUvIlFF9Rkn+OYoUzEZtb0ezTUeA3H8tUDiRrCBCNR6YJNcbxkp2ftAw1tAaLGZs
         JGRV4jjTNP4LjxDAFozoYKu9e+vpAc5iiWP1R0l7QCIwGUyhSMK46foTy+6hMMpFuScm
         LugEnpU2eKcKkUgTgUZ5QZDaoeBx1sBqqPVoD1vIYEPsqPv3S1nsfOo4lXjtOzVuDi6G
         H/PQvGS7DcYjKSH3VQ9IuEP6DLkTCsDwyBaXfCrlepmyR5jhTXi2hBZDLc2SLuHEcTft
         eEMw==
X-Gm-Message-State: AOAM531ZgfOA8wiDZWhiiq9iTYNFCDd1xanpN+cvgwVpAn8vEgEcA47G
        6uW3IbY38qV5pBaAO74104tMkn6JiRe8nnRTyapj4Q==
X-Google-Smtp-Source: ABdhPJxHP+o0Mh+bT2HFZ0d/AQ/giAHe5P1GdSts9xsjk0eCA2HrZXcNHYLv1BMnh8puTnOq+ArA2wt8x9Q/478AV4U=
X-Received: by 2002:a2e:810a:: with SMTP id d10mr1438333ljg.144.1594889092217;
 Thu, 16 Jul 2020 01:44:52 -0700 (PDT)
MIME-Version: 1.0
References: <20200627111029.513642-1-linus.walleij@linaro.org> <20200702145716.GX3703480@smile.fi.intel.com>
In-Reply-To: <20200702145716.GX3703480@smile.fi.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 16 Jul 2020 10:44:41 +0200
Message-ID: <CACRpkdZiO2t8pkt7tFMMzCgHYAiioGc_LY2R3iz=i=wGWF-8Bw@mail.gmail.com>
Subject: Re: [PATCH] usb: gadget: pch_udc: Convert to use GPIO descriptors
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        linux-usb <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Jul 2, 2020 at 4:57 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:

> > Andy: your input would be appreciated, this kind of code
> > customizing random embedded Intel systems is deep water for
> > me, so this is just a rough guess on how it should be done.
>
> Linus, I have set up the device (it's actually available as Minnowboard v1) and
> will look at this.

OK whenever you have time, there is no hurry.

> For time being there is a patch you need to fold into this (sorry, it's mangled):
>
> (Explanation: GPIO will be locked with request_irq() call)

I do not understand this, sadly. gpiod_lock_as_irq() will be called
indeed, but we are requesting it as input and keeping it as such
so this should be fine?

Yours,
Linus Walleij
