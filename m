Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1E45C8EEB3
	for <lists+linux-usb@lfdr.de>; Thu, 15 Aug 2019 16:52:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733192AbfHOOwX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 15 Aug 2019 10:52:23 -0400
Received: from mx2.suse.de ([195.135.220.15]:59030 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730558AbfHOOwW (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Thu, 15 Aug 2019 10:52:22 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id CA029ABB1;
        Thu, 15 Aug 2019 14:52:21 +0000 (UTC)
Message-ID: <1565880737.5780.12.camel@suse.com>
Subject: Re: dwc2 / Raspberry Pi - hardware bug for small transfers results
 in memory corruption
From:   Oliver Neukum <oneukum@suse.com>
To:     Jonathan Bell <jonathan@raspberrypi.org>
Cc:     Minas Harutyunyan <hminas@synopsys.com>, linux-usb@vger.kernel.org
Date:   Thu, 15 Aug 2019 16:52:17 +0200
In-Reply-To: <CAPHs_JLkWmgvWJPyBdugFPfgPMpyeQL1bQe3VLru4BTf9L+iag@mail.gmail.com>
References: <CAPHs_J+G0jR5dMg1gVD0z60Zf4oZBikx6P9+B99-TA6m29DWGA@mail.gmail.com>
         <1565866530.5780.4.camel@suse.com>
         <CAPHs_JLkWmgvWJPyBdugFPfgPMpyeQL1bQe3VLru4BTf9L+iag@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Donnerstag, den 15.08.2019, 12:41 +0100 schrieb Jonathan Bell:
> On Thu, Aug 15, 2019 at 11:55 AM Oliver Neukum <oneukum@suse.com> wrote:
> > 
> > Am Mittwoch, den 14.08.2019, 16:59 +0100 schrieb Jonathan Bell:
> > > As reported by one of our users here:
> > > https://github.com/raspberrypi/linux/issues/3148
> > > 
> > > There is a bug when the dwc2 core receives USB data packets that are
> > > between 1 and 4 bytes in length - 4 bytes are always written to memory
> > > where the non-packet bytes are garbage.
> > 
> > Hi,
> > 
> > in which function does that happen? If your buffer cannot handle 4
> > bytes I cannot see how it copes with teh DMA rules.
> > 
> 
> In drivers/media/usb/uvc/uvc_ctrl.c:uvc_ctrl_populate_cache() and friends.

OK, I see.

> The UVC driver passes in offsets into a struct uvc_control as the
> "buffer" that usb_control_msg() fills.

Not quite that bad. It passes a pointer into the middle of a buffer
used at different offsets for the transfer. This is technically allowed
as long as you never touch the buffer while a transfer is ongoing.

That is an accident waiting to happen. Please make a patch using
a bounce buffer allocated with knalloc() in
drivers/media/usb/uvc/uvc_ctrl.c:uvc_ctrl_populate_cache() and friends.

	Regards
		Oliver

