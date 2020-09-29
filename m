Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE3D227BB9D
	for <lists+linux-usb@lfdr.de>; Tue, 29 Sep 2020 05:40:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727403AbgI2Dk6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 28 Sep 2020 23:40:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726961AbgI2Dk6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 28 Sep 2020 23:40:58 -0400
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com [IPv6:2a00:1450:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0FF4C061755
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2020 20:40:48 -0700 (PDT)
Received: by mail-lf1-x144.google.com with SMTP id u8so3836575lff.1
        for <linux-usb@vger.kernel.org>; Mon, 28 Sep 2020 20:40:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=j3D1z6Yz/WRvxBjfJreG5gH7wRy7sFlCKCFZBnP7d6k=;
        b=IRctrcsbz/0dhmAhCTXldON6PcvVRUDBXIFkPpHkwWWACgp+OXFS75GGyucm6bJPXE
         SnYG8JJC5vBE4+Vn7OjmMaX7NNU9PcH6ICfqpqTr2lH7IYZ9GVUyLcuYWuvICFRGjIHv
         p7ceQLuPMf5GPARl/Wl9x2YPWTR1RRCTpG9TBLi7sWnyCq9TsZ03icCdWQPWo7iaCZp3
         V1C0qar6faTUJ+15XBdvN31rVLFsD3mLQJpaMNsqpZ7PJg7EMzVzQ2kEK0TdL0PRjU17
         rsZ/5y0FH1kdL7Sz+chK3RqxDf95D5lYfPLuisdFGXQqxWoLKOB6t1AqvPIwFIekov57
         ni7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=j3D1z6Yz/WRvxBjfJreG5gH7wRy7sFlCKCFZBnP7d6k=;
        b=bX7mpNb3/N/BnwCvxT2e3RxvjDFZ5nd0Oh5vP0RXoyCE60JvMHKio8PlWN3YOwvkgk
         c7TASsdqSgGHKNlJYjp1J3IdI63tpFls9m8Fu7icRtFDtkYbHRbUr/JQ1j0kZAVPKQRj
         PtShRRPNvNsk7sBsew5xewDwgKSgKG6f22qquFdRLudPW/7IJ5ArH/KhIKS9hWxytknd
         kYC5aE+wZ9Ub5o4GgAUau/Paa+C4OcWhnc4xEPqh/bAjImjAIwsQVWF/AkHZXW+B5/KT
         XuWsmdctQoViGtWXWn8EQ8ZE42a0gBVdJ7HrSYG+49A/def2NwRGJbCh7UF64OAefx0t
         k2UA==
X-Gm-Message-State: AOAM531MJZyP3dnlKtw1DGpwxiQQ/qd1uOH7VEnA8u9YrR8kXy5wNUyO
        gWnbWztGgBBeHDkFnIGEi+02Q7IsAlAdgzt9BBs=
X-Google-Smtp-Source: ABdhPJx2s1xG8wOQFlM0dYN+T/ArMe7PFSbw7CwK6kd142ox7YBUmvrSD1JY9bZK4RORO5vreqcp56/0aBiK0ka9IVQ=
X-Received: by 2002:a19:8142:: with SMTP id c63mr417926lfd.175.1601350827865;
 Mon, 28 Sep 2020 20:40:27 -0700 (PDT)
MIME-Version: 1.0
References: <20200910091130.20937-1-peter.chen@nxp.com> <20200910091130.20937-2-peter.chen@nxp.com>
 <87ft77eisu.fsf@kernel.org> <AM7PR04MB7157E8B31971129B3E5113968B390@AM7PR04MB7157.eurprd04.prod.outlook.com>
In-Reply-To: <AM7PR04MB7157E8B31971129B3E5113968B390@AM7PR04MB7157.eurprd04.prod.outlook.com>
From:   Peter Chen <hzpeterchen@gmail.com>
Date:   Tue, 29 Sep 2020 11:40:15 +0800
Message-ID: <CAL411-oSXmabZ06TB4sZNhbbPsk3fz6St=QRDzDpc2T=Hg3dfw@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] usb: cdns3: gadget: using correct sg operations
To:     Peter Chen <peter.chen@nxp.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "pawell@cadence.com" <pawell@cadence.com>,
        "rogerq@ti.com" <rogerq@ti.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        Jun Li <jun.li@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 24, 2020 at 5:35 PM Peter Chen <peter.chen@nxp.com> wrote:
>
>
> >
> > Peter Chen <peter.chen@nxp.com> writes:
> >
> > > It needs to use request->num_mapped_sgs to indicate mapped sg number,
> > > the request->num_sgs is the sg number before the mapping. These two
> > > entries have different values for the platforms which iommu or swiotlb
> > > is used. Besides, it needs to use correct sg APIs for mapped sg list
> > > for TRB assignment.
> > >
> > > Signed-off-by: Peter Chen <peter.chen@nxp.com>
> >
> > fails to apply to my testing/next
> >
> > checking file drivers/usb/cdns3/gadget.c Hunk #1 succeeded at 1099 (offset 1
> > line).
> > Hunk #2 succeeded at 1165 (offset 1 line).
> > Hunk #3 FAILED at 1176.
> > Hunk #4 succeeded at 1221 with fuzz 2 (offset 1 line).
> > 1 out of 4 hunks FAILED
> >
>
> It could work now, I think the possible reason is you have already applied other cdns3 patches during
> these two hours. My git log likes below:
>
> ca71afbe0c52 (HEAD -> felipe_testing_next) usb: cdns3: gadget: enlarge the TRB ring length
> 50599e28f626 usb: cdns3: gadget: sg_support is only for DEV_VER_V2 or above
> ed1e5b0fe5b2 usb: cdns3: gadget: need to handle sg case for workaround 2 case
> 95c952507262 usb: cdns3: gadget: handle sg list use case at completion correctly
> 9d45b67cf0c3 usb: cdns3: gadget: add CHAIN and ISP bit for sg list use case
> 28e5fd2c3fae usb: cdns3: gadget: calculate TDL correctly
> f57692f1a9a4 usb: cdns3: gadget: improve the dump TRB operation at cdns3_ep_run_transfer
> 5f94832916b5 usb: cdns3: gadget: using correct sg operations
> bed7c9e9a5aa (felipe/testing/next) usb: dwc3: gadget: Rename misleading function names
> 3d7ce113c2d0 usb: dwc3: gadget: Refactor preparing last TRBs
> 43365b1e90af usb: dwc3: gadget: Set IOC if not enough for extra TRBs
> ea52ca3fdefb usb: dwc3: gadget: Check for number of TRBs prepared
> e6ccecf58b1b usb: dwc3: gadget: Return the number of prepared TRBs
>
> Thanks,
> Peter

Hi Felipe,

I have still not seen these patches on your tree, would you please
help to queue them for v5.10-rc1?

Peter
