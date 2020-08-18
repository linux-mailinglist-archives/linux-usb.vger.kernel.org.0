Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 95F63248221
	for <lists+linux-usb@lfdr.de>; Tue, 18 Aug 2020 11:44:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726398AbgHRJoI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 18 Aug 2020 05:44:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbgHRJoG (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 18 Aug 2020 05:44:06 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD388C061389
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2020 02:44:05 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id g7so7828747plq.1
        for <linux-usb@vger.kernel.org>; Tue, 18 Aug 2020 02:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eV6Su4YNWFrani0pSeRGvTpqcs48Y5XQME09X6bQzoM=;
        b=J4gg0m29BCXS309+FDzcsgMAIhg+QEKc+kCIldRIaQSI3flp+VUpaLlZlZP+rCoTgg
         1rsKMvN5nTBAoJvVmmLmzcLdRiToAbMfBJ+Pq+ghEenLSOOuh2pDYWhB5DayKWVa5h6b
         KKrbHXn5YsooO7FhYmIku0mHiViV5wAZ/haHwrCrP5toyqm2CWZoiKE2H5cjMpLZbZho
         PCsfXOrl+rX+49VL2oKyN0bYJYpo8PJxzkuy1VD18BzEkJLgXyb9UIHrwPwjh4vybEra
         ECCG5YC2gyhxfQhiHryG8qpWP6k/6CPH6sXmDKSGC5xUcezyHusW335UZxrX76bEV9I3
         WNfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eV6Su4YNWFrani0pSeRGvTpqcs48Y5XQME09X6bQzoM=;
        b=i90f4hn135yGaTN48auJouB8o7VrbKLAKpiMeJsc4OD1BEAsEQzb/BrjBTZ1MebtnD
         HZIe3dDKtPAG+25fZLY2fWrLpBf/hm39NA5SMrax8eOLrcJtuolpV8MXzF5ah86OILbu
         vfZf+fq8mQe9KY3UfzvtONzSy++xABprWnlNQtvrSkZJ22jCEROeEANlFY4ynaHYjDE5
         K+SsRFzkLaMkpYxIDEM20Hf3bG8p0oVACSYPkOZAI0Ts/7aLnYGPtILg4J4IazlW6EXE
         06R7/7N6U1s6Tj3QcXawTzDEFMtt/7P+p0vJjJpN2njOOIhkXsh993XQ3A/oAgcM92LP
         Nf4g==
X-Gm-Message-State: AOAM530u/JGtEBwHObvo4K+SxoJS7m9bWOAgitnxreipBOfSty5T0AZB
        7FxjcGcxYoRP68wicTKb6TbX7HuIYtqeYw6ZVTA=
X-Google-Smtp-Source: ABdhPJzYDH2QSoF8W7YKmTgK3q6NvIrfWvkRQz8n+RpCYeF1D7K+xcHb26Dh4Q/79bFloZOvAL9tEo8cFPkz13AEdTU=
X-Received: by 2002:a17:90a:fa06:: with SMTP id cm6mr16351072pjb.129.1597743843950;
 Tue, 18 Aug 2020 02:44:03 -0700 (PDT)
MIME-Version: 1.0
References: <b5f23591-50c1-f01e-31a0-879eeec3ab3f@huawei.com>
 <20200813182811.GA4035999@kroah.com> <00274550-e14c-79a8-7c6e-aa58ada74fd4@huawei.com>
 <30a8c4ca-64c2-863b-cfcd-0970599c0ba3@huawei.com> <20200814180720.GE1891694@smile.fi.intel.com>
 <20200814195119.GA45072@rowland.harvard.edu> <CAHp75VdMXd3LWLM5ooBsWGZnSXnJBW3R5gH9Cpux0EHmcxjTvQ@mail.gmail.com>
 <20200815015000.GA52242@rowland.harvard.edu> <CAHp75VdCCe=sKuas+sdu__qYVSEO4pKqZ8RGq_Jxaoh91HXZ+g@mail.gmail.com>
 <20200816160550.GB86937@rowland.harvard.edu> <20200817113509.GJ1891694@smile.fi.intel.com>
 <62845ad6-1b09-e391-6b2f-14f2ef2b26f2@huawei.com>
In-Reply-To: <62845ad6-1b09-e391-6b2f-14f2ef2b26f2@huawei.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 18 Aug 2020 12:43:47 +0300
Message-ID: <CAHp75VcDMHAkkYhJ4k53ouQo+wH9mdJQo2kppjJ+imcaiaRbQg@mail.gmail.com>
Subject: Re: [Report]: BUG: KASAN: use-after-free in usb_hcd_pci_remove
To:     John Garry <john.garry@huawei.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Aug 18, 2020 at 11:44 AM John Garry <john.garry@huawei.com> wrote:
> On 17/08/2020 12:35, Andy Shevchenko wrote:

...

> It looks like that function [pci_free_irq_vectors()] is harmless when
> the vectors aren't allocated, so it should be possible to always call it
> always and drop the hcd flags check. But then this pattern may not be
> liked either.

Yeah.

> Anyway, I guess you guys can sort this out. I'm just trying to help
> identify issues.

Thanks for the report, can you test [1] if it fixes the problem?

[1]: https://lore.kernel.org/linux-usb/20200814182218.71957-1-andriy.shevchenko@linux.intel.com/T/#u

-- 
With Best Regards,
Andy Shevchenko
