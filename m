Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF2803DCB8D
	for <lists+linux-usb@lfdr.de>; Sun,  1 Aug 2021 14:15:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231732AbhHAMPv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 1 Aug 2021 08:15:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:37626 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231527AbhHAMPu (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Sun, 1 Aug 2021 08:15:50 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B69D261040;
        Sun,  1 Aug 2021 12:15:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1627820142;
        bh=b337yLMU93oCLHMmPJGsSWR+APUTiA0AXSuK+QsueqQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qBSF/DMNPW4WA/IICbAR39WkunP0YBE2pQrsZZ2kWWEZGnIafRXlXIR+M3t0itRJ0
         /lEqTMpC8KWgdKGTXpBHGtBiL59od9HIwflkDzQKzOsHbMtPmdaAyedijTdNNOS0Lq
         diBO/t3teHUc9cKCBzNJeZDB+yXQ9oEgXMrbi6TU=
Date:   Sun, 1 Aug 2021 14:15:15 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     nil Yi <teroincn@gmail.com>
Cc:     johan@kernel.org, linux-usb@vger.kernel.org
Subject: Re: [BUG]drivers: usb: serial: mos7840.c: dangling pointer in
 function mos7840_open
Message-ID: <YQaQU0hkHQRcdjRC@kroah.com>
References: <CANTwqXBzZaPGomgsy00RhgTHvETWEXg_ZiL1ujgKmEU2TUsc_A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANTwqXBzZaPGomgsy00RhgTHvETWEXg_ZiL1ujgKmEU2TUsc_A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Aug 01, 2021 at 05:03:30PM +0800, nil Yi wrote:
> Hi, there is a dangling pointer in mos7840_port->write_urb_pool[j]  in function
> mos7840_open in v5.14-rc3.
> 
> in function mos7840_open err path :
> 
> 717: err:
> 718: for (j = 0; j < NUM_URBS; ++j) {
> 719: urb = mos7840_port->write_urb_pool[j];
> 720:  if (!urb)
> 721:     continue;
> 722: kfree(urb->transfer_buffer);
> 723:  usb_free_urb(urb);
> }
> 
> leave a dangling pointer here,  I'm not sure whether it  can be
> triggered somewhere.

What exactly do you mean by "dangling pointer"?  What specifically is
the bug here?

thanks,

greg k-h
