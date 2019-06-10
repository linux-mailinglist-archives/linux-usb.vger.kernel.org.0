Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AEBF73BF85
	for <lists+linux-usb@lfdr.de>; Tue, 11 Jun 2019 00:31:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390139AbfFJWbx (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 10 Jun 2019 18:31:53 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:33369 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388328AbfFJWbw (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 10 Jun 2019 18:31:52 -0400
Received: by mail-pl1-f196.google.com with SMTP id g21so4227066plq.0
        for <linux-usb@vger.kernel.org>; Mon, 10 Jun 2019 15:31:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=f4Ty7tCC1x1ecWBNDg2uTgmlEQrSVcBuucVk8ao86zY=;
        b=u5QJCQ/0FQfpNVpn4zNjhdGMPj+QHNMeOGYKaFmsJ6EYBWgyDvzLB33AZAUKGWRY2r
         NDf7vVVlp4RIUEWdZRKImYdXUqaoPPc+QUltJEnwGyBeI9STTkuRKo5O7Lm5dlRVQPeP
         6Am6Em40tgp5TaNlif6g5/4NNrcTIeMJGt5Dx+1zEZFpbrOrtCBrDlcb/F08xHphEjvJ
         Tr9bX+uuMKfgl4yTrncMIGIfysalQP7XOm6vKZuV+W74ZMQjOQ4l3YBO89AjgvW/OUNT
         QWfnDiPs6SP4P/tqOrPPFTcG7I+lGgluMVT0f/oo6OZYljHQIYEWDESPH25chwNaivz6
         DuRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=f4Ty7tCC1x1ecWBNDg2uTgmlEQrSVcBuucVk8ao86zY=;
        b=IrqnmJSa5PEP5RuHO4NgKD+NX5nyNdQ10JNLXq0fnkoPmxEhhAwLZW+kslA5tudke2
         BUQGNilitd2gUGXVxpyiH/JXRY1NPL7kcr+G3bGxPfh/BI/RrNUEn6N5nGaWJUwhJG1P
         LnT6omQZ04vIrv9x2wDhty+qz1vigPmxYfDBHGupg0Qs0XKsJJ06t25Ft55D71HTBCLH
         MAHafnTQcVGDUXDlVBECUQxyxN2Oo4ctZvRvY3A2udJ3xkadhAesIxI5lFucAXpwwZZs
         kXCuzQZg6pFE7rFROgBJIKsZeni7UoytkWcLsjTUxYByZJJeqWQyGfUbBuNEphgB8oat
         yH6g==
X-Gm-Message-State: APjAAAX1v7MMMsV3ktY033PgT+pRa7UtcMyu5fCmO3k5/HAXy28kXIg7
        ECscK81KpaZbSYRnA/WLN3E=
X-Google-Smtp-Source: APXvYqzkWWgsl53lwR7GZrnI3Ews7y0G/ROY27ZW9Y9QonBXZKwc7nUpC96PoFUjlUrbKg9/9WwpLw==
X-Received: by 2002:a17:902:121:: with SMTP id 30mr69575856plb.314.1560205911563;
        Mon, 10 Jun 2019 15:31:51 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id a25sm12403343pfo.112.2019.06.10.15.31.50
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Mon, 10 Jun 2019 15:31:50 -0700 (PDT)
Date:   Mon, 10 Jun 2019 15:31:48 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
        libusb-devel@lists.sourceforge.net
Subject: Re: Extending USB_CONNECTINFO ioctl
Message-ID: <20190610223148.GA10147@dtor-ws>
References: <20190604002410.GA36666@dtor-ws>
 <Pine.LNX.4.44L0.1906040952480.1731-100000@iolanthe.rowland.org>
 <20190604161451.GB226219@dtor-ws>
 <20190604164853.GA14605@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190604164853.GA14605@kroah.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Jun 04, 2019 at 06:48:53PM +0200, Greg Kroah-Hartman wrote:
> On Tue, Jun 04, 2019 at 09:14:51AM -0700, Dmitry Torokhov wrote:
> > Hi Alan,
> > 
> > On Tue, Jun 04, 2019 at 10:17:25AM -0400, Alan Stern wrote:
> > > On Mon, 3 Jun 2019, Dmitry Torokhov wrote:
> > > 
> > > > Hi Alan, Greg,
> > > > 
> > > > When running software in a jailed environment where sysfs or udev is not
> > > > readily available and one can only have an FD to usbdevfs device passed
> > > > into the jail, there is a desire to allow libusb working. Alan recently
> > > > added USBDEVFS_GET_SPEED, but we are still missing bus number and list
> > > > of port numbers on the way to the root to be able to better identify the
> > > > device in question.
> > > > 
> > > > What do you think about adding a new ioctl:
> > > > 
> > > > struct usbdevfs_connectinfo_ex {
> > > > 	__u32 size;		/* size of the structure from the kernel POV */
> > > 
> > > This should be an input/output parameter.  That is, the original value
> > > says how big the userspace structure is, and the value stored by the
> > > kernel says how much space was actually filled in.  Or alternatively, 
> > > have two size fields (one for input and one for output).
> > 
> > The "incoming" size is encoded in the ioctl number (the 'len' argument
> > in USBDEVFS_CONNINFO_EX()), there is no reason to add it separately (or
> > make read/write).
> > 
> > > 
> > > > 	__u32 busnum;
> > > > 	__u32 devnum;
> > > > 	__u32 speed;		/* USB_SPEED_* form ch9.h */
> > > > 	u8 num_ports;		/* Number of entries in port_numbers array */
> > > > 	u8 port_numbers[31];	/* Current limit in USB3.0 spec is 7 */
> > > > };
> > > 
> > > Yeah, 31 is overkill.  Even the USB-2.0 spec limits the topology to 7
> > > tiers (including the root hub), meaning that only 6 port numbers are
> > > needed.
> > 
> > If you insist I can bring it down to 7, but this structure is short
> > lived, on stack, and there should not be many of them in the kernel, so
> > if we can avoid extending a particular field in the future I think it is
> > worth it.
> 
> I don't know what USB 4 has in it (and if I did, I couldn't mention it),
> but someone who can see those specs might want to take a look at them to
> just say "yeah, 31 looks like a good number" or "nope, make it a bit
> bigger please!"

OK, I believe 7 tiers should be enough, so I'll cut it down to 7 from
31.

Thanks.

-- 
Dmitry
