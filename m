Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DC0B190B57
	for <lists+linux-usb@lfdr.de>; Tue, 24 Mar 2020 11:46:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727148AbgCXKqH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 24 Mar 2020 06:46:07 -0400
Received: from mx2.suse.de ([195.135.220.15]:56948 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726563AbgCXKqH (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 24 Mar 2020 06:46:07 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id 3918FAC50;
        Tue, 24 Mar 2020 10:46:06 +0000 (UTC)
Message-ID: <1585046753.7151.18.camel@suse.com>
Subject: Re: Fwd: BUG: KASAN: use-after-free in
 usb_hcd_unlink_urb+0x5f/0x170 drivers/usb/core/hcd.c
From:   Oliver Neukum <oneukum@suse.com>
To:     Kyungtae Kim <kt0755@gmail.com>, linux-usb@vger.kernel.org
Date:   Tue, 24 Mar 2020 11:45:53 +0100
In-Reply-To: <CAEAjamtTnn+BZAshQ7=DQ7QdRHO83AbHeZP3xY1CpSzmbaHPDQ@mail.gmail.com>
References: <CAEAjamtb2Kbn0He5O++=d_HCG1eQvLnGGbcVUOQ76+NfDiNybQ@mail.gmail.com>
         <CAEAjamtTnn+BZAshQ7=DQ7QdRHO83AbHeZP3xY1CpSzmbaHPDQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Montag, den 23.03.2020, 02:18 -0400 schrieb Kyungtae Kim:
> We report a bug (in linux-5.5.11) found by FuzzUSB (a modified version
> of syzkaller)

Hi,

thank you for the report. Is this a reproducible bug?

> In function usb_hcd_unlink_urb (driver/usb/core/hcd.c:1607), it tries to
> read "urb->use_count". But it seems the instance "urb" was
> already freed (right after urb->dev at line 1597) by the function "urb_destroy"
> in a different thread, which caused memory access violation.

Yes.

> To solve, it may need to check if urb is valid before urb->use_count,
> to avoid such freed memory access.

Difficult to do as the URB itself would be invalid.

I am afraid there is a race in here:


        if (test_bit(US_FLIDX_ABORTING, &us->dflags)) {
                /* cancel the request, if it hasn't been cancelled already */
                if (test_and_clear_bit(US_FLIDX_SG_ACTIVE, &us->dflags)) {
                        usb_stor_dbg(us, "-- cancelling sg request\n");
                        usb_sg_cancel(&us->current_sg);
                }
        }

        /* wait for the completion of the transfer */
        usb_sg_wait(&us->current_sg);
        clear_bit(US_FLIDX_SG_ACTIVE, &us->dflags);


What keeps the request alive while usb_sg_wait() is running?

	Regards
		Oliver
> 
