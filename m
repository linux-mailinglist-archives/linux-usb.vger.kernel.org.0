Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A6245D558
	for <lists+linux-usb@lfdr.de>; Tue,  2 Jul 2019 19:33:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727050AbfGBRdj (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 2 Jul 2019 13:33:39 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:38468 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbfGBRdi (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 2 Jul 2019 13:33:38 -0400
Received: from lelv0265.itg.ti.com ([10.180.67.224])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x62HXax1076702;
        Tue, 2 Jul 2019 12:33:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1562088816;
        bh=jJt2O4ZjhRQkHi9yXofxN7jfMiav968m938Q3F3wSR0=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=l/bkEEibeU5UJSGc4K/5lpqqez1z+v1WO24Q3wQydPKTPimoF++kqQGVSnv8YMeoQ
         iKabra84CTfSYny3ECtbs2nXFVa2CfyGSQm3CEwVVQ/KFbMaW0MUS+Klc2hqZZlIWj
         IcgptF33aN7NxfgQLKHckisxNi788WV9Gvm+Sbbw=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
        by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x62HXaiU029088
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Tue, 2 Jul 2019 12:33:36 -0500
Received: from DFLE103.ent.ti.com (10.64.6.24) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Tue, 2 Jul
 2019 12:33:35 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Tue, 2 Jul 2019 12:33:35 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x62HXZmV072144;
        Tue, 2 Jul 2019 12:33:35 -0500
Date:   Tue, 2 Jul 2019 12:33:35 -0500
From:   Bin Liu <b-liu@ti.com>
To:     "Matwey V. Kornilov" <matwey.kornilov@gmail.com>
CC:     Greg KH <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        "open list:MUSB MULTIPOINT HIGH SPEED DUAL-ROLE CONTROLLER" 
        <linux-usb@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 0/6] musb: Improve performance for hub-attached webcams
Message-ID: <20190702173335.GA2724@uda0271908>
Mail-Followup-To: Bin Liu <b-liu@ti.com>,
        "Matwey V. Kornilov" <matwey.kornilov@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        "open list:MUSB MULTIPOINT HIGH SPEED DUAL-ROLE CONTROLLER" <linux-usb@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20190403185310.8437-1-matwey@sai.msu.ru>
 <20190614164554.27679-1-matwey@sai.msu.ru>
 <CAJs94EZy7HD-ge8vKGSeMMS+WYw-U=Zxw9gXMLoobpYX6rVt4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJs94EZy7HD-ge8vKGSeMMS+WYw-U=Zxw9gXMLoobpYX6rVt4A@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Matwey,

On Tue, Jul 02, 2019 at 08:29:03PM +0300, Matwey V. Kornilov wrote:
> Ping?

I was offline and just got back. I will review it soon. Sorry for the
delay.

-Bin.

> 
> пт, 14 июн. 2019 г. в 19:47, Matwey V. Kornilov <matwey@sai.msu.ru>:
> >
> > The series is concerned to issues with isochronous transfer while
> > streaming the USB webcam data. I discovered the issue first time
> > when attached PWC USB webcam to AM335x-based BeagleBone Black SBC.
> > It appeared that the root issue was in numerous missed IN requests
> > during isochronous transfer where each missing leaded to the frame
> > drop. Since every IN request is triggered in MUSB driver
> > individually, it is important to queue the send IN request as
> > earlier as possible when the previous IN completed. At the same
> > time the URB giveback handler of the device driver has also to be
> > called there, that leads to arbitrarily delay depending on the
> > device driver performance. The details with the references are
> > described in [1].
> >
> > The issue has two parts:
> >
> >   1) peripheral driver URB callback performance
> >   2) MUSB host driver performance
> >
> > It appeared that the first part is related to the wrong memory
> > allocation strategy in the most USB webcam drivers. Non-cached
> > memory is used in assumption that coherent DMA memory leads to
> > the better performance than non-coherent memory in conjunction with
> > the proper synchronization. Yet the assumption might be valid for
> > x86 platforms some time ago, the issue was fixed for PWC driver in:
> >
> >     1161db6776bd ("media: usb: pwc: Don't use coherent DMA buffers for ISO transfer")
> >
> > that leads to 3.5x performance gain. The more generic fix for this
> > common issue are coming for the rest drivers [2].
> >
> > The patch allowed successfully running full-speed USB PWC webcams
> > attached directly to BeagleBone Black USB port.
> >
> > However, the second part of the issue is still present for
> > peripheral device attached through the high-speed USB hub due to
> > its 125us frame time. The patch series is intended to reorganize
> > musb_advance_schedule() to allow host to send IN request quicker.
> >
> > The patch series is organized as the following. First three patches
> > improve readability of the existing code in
> > musb_advance_schedule(). Patches 4 and 5 introduce updated
> > signature for musb_start_urb(). The last patch introduce new
> > code-path in musb_advance_schedule() which allows for faster
> > response.
> >
> > References:
> >
> > [1] https://www.spinics.net/lists/linux-usb/msg165735.html
> > [2] https://www.spinics.net/lists/linux-media/msg144279.html
> >
> > Changes since v1:
> >  - Patch 6 was redone to keep URB giveback order and stop transmission at
> >    erroneous URB.
> >
> > Matwey V. Kornilov (6):
> >   usb: musb: Use USB_DIR_IN when calling musb_advance_schedule()
> >   usb: musb: Introduce musb_qh_empty() helper function
> >   usb: musb: Introduce musb_qh_free() helper function
> >   usb: musb: Rename musb_start_urb() to musb_start_next_urb()
> >   usb: musb: Introduce musb_start_urb()
> >   usb: musb: Decrease URB starting latency in musb_advance_schedule()
> >
> >  drivers/usb/musb/musb_host.c | 132 ++++++++++++++++++++++++++++---------------
> >  drivers/usb/musb/musb_host.h |   1 +
> >  2 files changed, 86 insertions(+), 47 deletions(-)
> >
> > --
> > 2.16.4
> >
> 
> 
> -- 
> With best regards,
> Matwey V. Kornilov
