Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 442CA25BD47
	for <lists+linux-usb@lfdr.de>; Thu,  3 Sep 2020 10:29:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728288AbgICI3H (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 3 Sep 2020 04:29:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36994 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726162AbgICI3G (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Sep 2020 04:29:06 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27AEBC061244
        for <linux-usb@vger.kernel.org>; Thu,  3 Sep 2020 01:29:05 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id b12so1752791edz.11
        for <linux-usb@vger.kernel.org>; Thu, 03 Sep 2020 01:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MkgfKqpmK5F4lrS1kMdDMUcxxCZATJ/vjg7L4tBCQVs=;
        b=ST63G1FzPBhep5q4K5omMeaKUC9JusJAr+r2Vu2anFrrD4293M43fWlHp6iH3Ye8eO
         l6Z0qMcxG0Ss+Lq5B+JFMRvlk3ey8kR5iNhDT1wMfli0/X7x851zce1Z/8QRN6cvnHIX
         XuWvBoaDeCmwFtnfxrfa41ho3SofBPYK9yhSyTlKB8wyaCP8k6gWPMbwpf9bFN3K/fxk
         FLAl4AD0N2fmuqpeLdkOZJY4yU0fTTZ/t/WfDuG5MTsiGzeKN0Wf1W04ac5DGMZ2jXO+
         wLirTP53dxaUVE8jy+H1WThvuY99U+gsjGcQWabyr4p5EG1fDEemu2tXULppGVKK4Oxx
         slbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MkgfKqpmK5F4lrS1kMdDMUcxxCZATJ/vjg7L4tBCQVs=;
        b=XGdxifnKbtK0eZDkc2dPj13IPlgZe4bbrjEVxbcI1e3Ogui2o56ToQ6WvE69QN7Zu5
         rZxgjFeBNsGtCqNePAVI/cUbqMxcVdwMQEo8doRmkeoIcB++aCTGuq5ozFVX6XqMDwt+
         PdG8AD+Y3hjz733tK75IjW6u0lwbRneLhXXIahi+6xP7KFoTAayWIh1VFrds9DFb6S+p
         uQSkXPW7RZSTXhX3GmJGJHKZUnMUCoyqHYUzM2pm/Rqy+7T4xudOWmXcmbrrlQcCiFM/
         9soB5bB5z6n/Mh8f3LerzWnolOAnjXzg7tlx43idfSzhKyhP+Irn8952aCqqXWVmZb5t
         D6lA==
X-Gm-Message-State: AOAM531LB01JGOgQ3hcnlS56scQvSoJ5Ne/zVHFxZFq3C+H2N6MjT3Dg
        IHuf1wKFlxW99Al4KOXtdG0+xajGzHWDOHU01ZQ=
X-Google-Smtp-Source: ABdhPJxrOdYhvfhXPnegnPDLg9zgFJj8ev74CdIGpANcBe6uFrEHI7KxQLR1sZTMxyXNvmZ7Us/fE16IJa0zJiUGO9o=
X-Received: by 2002:a50:8f44:: with SMTP id 62mr1983680edy.3.1599121744561;
 Thu, 03 Sep 2020 01:29:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAGnHSE=4YNGTeoxQj+Hjy_EtRanhc-EEdiO_i8MRaLq1mKUCUw@mail.gmail.com>
 <20200903075639.31138-1-tom.ty89@gmail.com> <20200903082017.GB2166291@kroah.com>
In-Reply-To: <20200903082017.GB2166291@kroah.com>
From:   Tom Yan <tom.ty89@gmail.com>
Date:   Thu, 3 Sep 2020 16:28:53 +0800
Message-ID: <CAGnHSEnSHD4P5D4EE+g55htoNhxKmS_V0FekNXAsJMDXBr=igg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] usb-storage: fix sdev->host->dma_dev
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
        Arnd Bergmann <arnd@arndb.de>, cyrozap@gmail.com,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hmm, actually the older versions were pretty much an entirely
different approach/patch (not involving fixing the dma_dev at all).
Should I just resend without the "v3"?

On Thu, 3 Sep 2020 at 16:19, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Thu, Sep 03, 2020 at 03:56:38PM +0800, Tom Yan wrote:
> > Use scsi_add_host_with_dma() instead of scsi_add_host() in usb.c and uas.c.
> >
> > When the scsi request queue is initialized/allocated, hw_max_sectors is clamped
> > to the dma max mapping size. Therefore, the correct device that should be used
> > for the clamping needs to be set.
> >
> > The same clamping is still needed in the USB drivers as hw_max_sectors could be
> > changed there. The original clamping would be invalidated in such cases.
> >
> > Signed-off-by: Tom Yan <tom.ty89@gmail.com>
> > ---
> >  drivers/usb/storage/scsiglue.c |  2 +-
> >  drivers/usb/storage/uas.c      | 17 +++++++++++------
> >  drivers/usb/storage/usb.c      |  5 +++--
> >  3 files changed, 15 insertions(+), 9 deletions(-)
>
> What changed from the previous version?  Always include that below the
> --- line as is documented to do so.
>
> Please fix up and resend.
>
> thanks,
>
> greg k-h
