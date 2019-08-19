Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5A076921CB
	for <lists+linux-usb@lfdr.de>; Mon, 19 Aug 2019 13:02:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726947AbfHSLBc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 19 Aug 2019 07:01:32 -0400
Received: from mx2.suse.de ([195.135.220.15]:33044 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726550AbfHSLBb (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 19 Aug 2019 07:01:31 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id B2147AEB8;
        Mon, 19 Aug 2019 11:01:30 +0000 (UTC)
Message-ID: <1566212487.5663.17.camel@suse.com>
Subject: Re: dwc2 / Raspberry Pi - hardware bug for small transfers results
 in memory corruption
From:   Oliver Neukum <oneukum@suse.com>
To:     Jonathan Bell <jonathan@raspberrypi.org>
Cc:     Minas Harutyunyan <hminas@synopsys.com>, linux-usb@vger.kernel.org
Date:   Mon, 19 Aug 2019 13:01:27 +0200
In-Reply-To: <CAPHs_JKF0JPQh2+wzS=cMTOLb+xpBnT=RQh4Xc8EJQu_XyuhPg@mail.gmail.com>
References: <CAPHs_J+G0jR5dMg1gVD0z60Zf4oZBikx6P9+B99-TA6m29DWGA@mail.gmail.com>
         <1565866530.5780.4.camel@suse.com>
         <CAPHs_JLkWmgvWJPyBdugFPfgPMpyeQL1bQe3VLru4BTf9L+iag@mail.gmail.com>
         <1565880737.5780.12.camel@suse.com>
         <CAPHs_JKF0JPQh2+wzS=cMTOLb+xpBnT=RQh4Xc8EJQu_XyuhPg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Freitag, den 16.08.2019, 23:18 +0100 schrieb Jonathan Bell:
> On Thu, Aug 15, 2019 at 3:52 PM Oliver Neukum <oneukum@suse.com> wrote:

> > That is an accident waiting to happen. Please make a patch using
> > a bounce buffer allocated with knalloc() in
> > drivers/media/usb/uvc/uvc_ctrl.c:uvc_ctrl_populate_cache() and friends.
> 
> A patch to uvcvideo will not fix the underlying bug with the host
> controller hardware.

Absolutely correct.

>  There are hundreds of device drivers of varying
> vintages that potentially react badly to having a rogue host
> controller DMA engine writing more bytes than were reported by the
> controller's interrupt status register.

Then these drivers are likely to be buggy. Not guaranteed to,
it is possible to write a driver which is correct and still would
react badly to that, but it is difficult.

> So my original two questions still need answering:
> 1) Does the symptom seen with v4l2-ctl exist on other platforms using
> dwc2 (which implies that this is not a bug specific to Raspberry Pi)
> 2) How do we harden upstream dwc2 against a broken controller DMA?

Unknown and very hard to find out, because you are almost always in a
situation where you have a full cache line, which is larger than 4
bytes.

You must flush all cache lines your buffer is part of. You must
not touch them until DMA is complete. That is easiest to achieve
if you just kmalloc() each buffer separately. Using two parts
of a buffer for subsequent DMA is within the rules, but not worth
the trouble.
Using a bounce buffer in the dwc2 driver is likely not worth
the trouble, as you wouldn't get away with a single buffer and
dynamic allocation would suck (it would have to be atomic).

	Regards
		Oliver

