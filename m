Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65866463E99
	for <lists+linux-usb@lfdr.de>; Tue, 30 Nov 2021 20:27:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243183AbhK3Tap (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Nov 2021 14:30:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343490AbhK3Tao (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Nov 2021 14:30:44 -0500
Received: from mail-qk1-x731.google.com (mail-qk1-x731.google.com [IPv6:2607:f8b0:4864:20::731])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DDD8C061574
        for <linux-usb@vger.kernel.org>; Tue, 30 Nov 2021 11:27:25 -0800 (PST)
Received: by mail-qk1-x731.google.com with SMTP id de30so28109136qkb.0
        for <linux-usb@vger.kernel.org>; Tue, 30 Nov 2021 11:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Zhu7LAAt42GwVCn41NBsaDZ8N7JIc/jb7VBfBfFikEU=;
        b=SDHRVKj7k6/xlHAutrcHrgGNMusQmEC3xI7Uj41ymQqmDtLpMaOWK17TIrRcpSfs3w
         1HsVUPEFbRhdWViHysD+HZtOtlSGvprLaaXE1F21wt/Ze/ArNgfW1LYbazRGxRmmA8qg
         a5z6DoR5sPrQd5qYDFJLVnorIM70MeCxG4G+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Zhu7LAAt42GwVCn41NBsaDZ8N7JIc/jb7VBfBfFikEU=;
        b=DhpwxT0XQ95X4DCBjz9BUAxi5tXM5O16b2hek4xl8uT9jLiDzQVD+Ks+ZDlszXKhF6
         2x5LwvehGuBssP4CC/eJiBIRz8yLz4RDGgfbykNKjzFWE9k5qJXPDhn0OPFQwZ/wKLuq
         0VWeGygncU8KyEdqp8e7Cep5pVQ61QOZYbx4JuWQH3wKx4g27pB3BZaG5ol2gnpXULfV
         zVn0WkVV43P4mtLJpcg54KIQH67NcUSJfscGvpJhsdmEE1TLWuosGigK5bcqa9xMj2re
         eHxh3fI4N0N0vufuFbuUu1R8VDJFLrmr8dt6vwOJRkBCglV0fUqEatY8XsNfy1vUT4IP
         AcHg==
X-Gm-Message-State: AOAM532hbr8kbowYim5ZnSYKb2IFoH7QfC9XkjjXmGuzUhOAg1s7+vfF
        KW+8k7GNvnCDvRb45oeD8fzZ+eNuVT8w2luxbh//0Q==
X-Google-Smtp-Source: ABdhPJyazy1Oz6rvUCQvBvVD/YoPQmQoxYhYhXwjVjB0k8Scn64cFhpt2+U2tX6ahDW3K+hTRTspgrttW5bmAu401og=
X-Received: by 2002:a05:620a:468a:: with SMTP id bq10mr1454756qkb.541.1638300444232;
 Tue, 30 Nov 2021 11:27:24 -0800 (PST)
MIME-Version: 1.0
References: <20211124231028.696982-1-pmalani@chromium.org> <YaCrnMAEXnG+VO6d@kuha.fi.intel.com>
 <YaYFDwsw2hKdJrGj@kuha.fi.intel.com>
In-Reply-To: <YaYFDwsw2hKdJrGj@kuha.fi.intel.com>
From:   Prashant Malani <pmalani@chromium.org>
Date:   Tue, 30 Nov 2021 11:27:12 -0800
Message-ID: <CACeCKafjOFvVaPBu7OQS-M30hWjooNBFL9-rzqTz3i1ZKEa7Ew@mail.gmail.com>
Subject: Re: [PATCH 0/4] usb: Use notifier for linking Type C ports.
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
        wonchung@google.com, bleung@chromium.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Chunfeng Yun <chunfeng.yun@mediatek.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        =?UTF-8?Q?Noralf_Tr=C3=B8nnes?= <noralf@tronnes.org>,
        Rajat Jain <rajatja@google.com>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Heikki,

Thanks for taking a look at the series.

On Tue, Nov 30, 2021 at 3:03 AM Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:
>
> Hi Prashant,
>
> On Fri, Nov 26, 2021 at 11:40:49AM +0200, Heikki Krogerus wrote:
> > On Wed, Nov 24, 2021 at 03:10:06PM -0800, Prashant Malani wrote:
> > > This series resolves the cyclic dependency error which was introduced by
> > > commit 63cd78617350 ("usb: Link the ports to the connectors they are
> > > attached to") which lead to it being reverted. The approach here is to
> > > use a notifier to link a new Type C port to pre-existing USB ports
> > > instead of calling an iterator of usb ports from the Type C connector
> > > class. This allows commit 63cd78617350 ("usb: Link the ports to the
> > > connectors they are attached to") to then be submitted without any
> > > depmod cyclic dependency error.
> > >
> > > The final patch removes the usb port iterator since it is no longer
> > > needed.
> >
> > This is not enough. Build the Type-C Class as a module and the USB bus
> > statically, and the links will not get created.
> >

I see. I suppose it is academic now (given your follow up email about converting
port-mapper to component framework), but would reversing where the
notifier block is i.e,
have usbcore expose the notifier registration API instead of
typec-class, resolve
the issue? That would mean the dependency is the same as what it is right now
in the code, right (typec -> usbcore)

> > I'm not sure you actually achieve much with this series, and I'm not
> > sure this approach will ever fully solve the problem. As long as we
> > have to declare API, we will have the circular dependency issue on our
> > hands. But there are ways to avoid that.
> >
> > There is for example the component framework (drivers/base/component.c)
> > that I've been thinking about using here. In this case it would work
> > so that you declare the USB Type-C part as your aggregate driver, and
> > everything that is connected to it (so USB ports, DisplayPorts, TBT,
> > etc.) would then just declare themselves as general components. Could
> > you take a look at that?
>
> I'm preparing a patch where I store all _PLDs in the ACPI tables, and
> create list of devices that share it. I can convert port-mapper.c to
> it and the component framework while at it.

Great, thanks. We can help with testing once you have a patch series
to share.

Best regards,

-Prashant
