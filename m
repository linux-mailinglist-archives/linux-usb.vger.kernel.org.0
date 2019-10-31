Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2AE1EB206
	for <lists+linux-usb@lfdr.de>; Thu, 31 Oct 2019 15:02:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727738AbfJaOCU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 31 Oct 2019 10:02:20 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:39130 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727589AbfJaOCU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 31 Oct 2019 10:02:20 -0400
Received: by mail-qt1-f195.google.com with SMTP id t8so8687966qtc.6
        for <linux-usb@vger.kernel.org>; Thu, 31 Oct 2019 07:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9U8kV4D1Gg2A+dDVYNi7eEXaajntxly6FVxq8PhLcdA=;
        b=MFhD2wZSjoiCf2oSfDk42E+jGqzAy7v6kfuam3bIrjnt5nUXUsiKhcZ+m0YK2dm/EE
         okwgygJXx0BVhlTZUuupLxV6ra4sdoECJPru+6oySp6tupOYCj6VZ5aEyR63z0NS4QgZ
         q09y0sx5ciefinzgPtpDPKq6OkKuMwSCTwl4CCOEPa49bweu8i8AT1LAT47hbRiAOrue
         5aSwsNRRRX3cDy9BpjtIPEfb5dZS/e3hkdHWQJvVf6jIRILt19H9ZjAeROLAQoxb74yT
         m9inFpREciAG5DaY2pOHDLDSWqEBibcSDfAbPMTDgJkSl3n0RKEZcp5/hTxzv8u2C7dg
         33fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9U8kV4D1Gg2A+dDVYNi7eEXaajntxly6FVxq8PhLcdA=;
        b=o2wWWcNpDR6WqXExPUcnX9e13FRnIFJvSjw7K789B76EgNUyws1trxDnZgcjg0z50f
         6y6EJFbmXWiVSSxFRZ/t0D0VmL0/WQa3Iv7x43iGmyNyB0TWmR/hUN5hWce0WBLLRA1J
         FNBDG/LBwOt/x2dZzjTOZ14VxWsDCkXVYUqW9rvCDL3bvK+72aAoRiyuzZOO2m11rs49
         0wkv1hncKE3mv4/3ECpR0k3B+Lup+GJc/1G4Rp55QeXfKfGKxgcZAteBsnlPtuB9dnve
         tx2GaLDb5ybJD2PHDEDHGeNyyH+s2dCUSiAvz8Csw4Jfjfm5wugTlg9Q3kF8SejCIxEK
         EM0g==
X-Gm-Message-State: APjAAAV/REXRpYer4Ln/adIjICEdZBsNGdf5oSHd+7pjIhzKK+zVK/eN
        B5CRynGWvxWMQzT1iEqPi4L5yVh89BP2/GNeQ+c=
X-Google-Smtp-Source: APXvYqz8s2rhb/E9s0n5S/5K6nTXSWurkgqJi1TBdzTROz2l+e97qSBc9wCRc9lQ9zFJF4hBeprXkShnMaSBegCLfIE=
X-Received: by 2002:ac8:7608:: with SMTP id t8mr5573256qtq.356.1572530539199;
 Thu, 31 Oct 2019 07:02:19 -0700 (PDT)
MIME-Version: 1.0
References: <20191028182254.30739-1-pgwipeout@gmail.com> <20191028182254.30739-2-pgwipeout@gmail.com>
 <10419898.gYlDFaIxON@phil> <CAMdYzYqex=xoXR+Xhg=LNwEa0hobbSghRzj8AkmVOSNhp7x1-A@mail.gmail.com>
In-Reply-To: <CAMdYzYqex=xoXR+Xhg=LNwEa0hobbSghRzj8AkmVOSNhp7x1-A@mail.gmail.com>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Thu, 31 Oct 2019 10:02:07 -0400
Message-ID: <CAMdYzYpgjV7AwbF97gs7amuh6WGu0Mbzv_-ziWOZTYX0qe6rsQ@mail.gmail.com>
Subject: Re: [PATCH 1/5] phy: rockchip: add inno-usb3 phy driver
To:     Heiko Stuebner <heiko@sntech.de>
Cc:     linux-rockchip@lists.infradead.org, linux-usb@vger.kernel.org,
        katsuhiro@katsuster.net, Robin Murphy <robin.murphy@arm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Oct 30, 2019 at 1:46 PM Peter Geis <pgwipeout@gmail.com> wrote:
>
> On Wed, Oct 30, 2019 at 4:15 AM Heiko Stuebner <heiko@sntech.de> wrote:
> >
> > Am Montag, 28. Oktober 2019, 19:22:50 CET schrieb Peter Geis:
> > > Add the rockchip innosilicon usb3 phy driver, supporting devices such as the rk3328.
> > > Pulled from:
> > > https://github.com/FireflyTeam/kernel/blob/roc-rk3328-cc/drivers/phy/rockchip/phy-rockchip-inno-usb3.c
> > >
> > > Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> >
> > What happens on plug - unplug - plug?
> >
> > I remember what kept me from pushing the usb3 stuff for rk3328
> > was the usbphy breaking hotplug after the first unplug.
> >
> > Did this get fixed?
> >
> > Thanks
> > Heiko
> >
> >
> It seems to have been corrected, at least partially.
> The hotplug issue may have been resolved by [0].
Other possibilities are two commits [1], [2].
One disables usb3 autosuspend, the other adds a linestate quirk.
[1] https://github.com/FireflyTeam/kernel/commit/1758c75d334c7b321a86708797541e05e9301ec5
[2] https://github.com/FireflyTeam/kernel/commit/65bfd30a169c880da359a6dfef032b670457debd
>
> On my rk3328-roc-cc board, both USB2 and USB3 work correctly for
> hotplugging with this driver.
> I did encounter some odd behavior with the USB2HOST port, where it
> stopped reading FS devices when this was loaded.
> I'm wondering if we have a common clock problem or some other
> undocumented shared dependancy.
>
> Robin encountered some odd behavior when unplugging a USB3 device, the
> controller didn't recognize it for a while.
> I don't have that problem, but I don't know what board she's using.
>
> [0] commit fb903392131a324a243c7731389277db1cd9f8df
> clk: rockchip: fix wrong clock definitions for rk3328
