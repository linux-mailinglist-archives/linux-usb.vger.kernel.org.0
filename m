Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5B70834D06
	for <lists+linux-usb@lfdr.de>; Tue,  4 Jun 2019 18:14:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728244AbfFDQOz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 4 Jun 2019 12:14:55 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:39036 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728166AbfFDQOz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 4 Jun 2019 12:14:55 -0400
Received: by mail-pg1-f194.google.com with SMTP id 196so10643264pgc.6
        for <linux-usb@vger.kernel.org>; Tue, 04 Jun 2019 09:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ONyoIZK130s9i8liosWE3Tarr8V5pbaNzQ/GUTA7YV8=;
        b=TOUimVpRiE1bEGw7vzzlCix27aPaGOZOhTlMK8P6OrKvxLg1CDB7O2Ws2c67MrFfqP
         Tsftc6BuCdo4VHUzj5YAepO1yLC7gpQ2KhnKwCxur6qDEzVY6PoiMbAgDC627Y5660fk
         Wf9UXHjKufqcArgBjKX5MzgKd6Mhm//a/pjodFXbetEeHuZov4OoqB6ddrI+1tOHrkbu
         eakPivrakWcCht/GTa1G5CyCKArZ/PGjnH76kHGyiTt/mQuR+qbzxn6hNoCIwHYsgFS+
         6HIFTJK7gmNQu02IrmubEypRCy1HqPyAadjlcifGqbsAbE7YmgYCnrs+ypF6mopz9dep
         8x2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ONyoIZK130s9i8liosWE3Tarr8V5pbaNzQ/GUTA7YV8=;
        b=lKWb5eRCy3ZnXWW3TBnsN/5GwvzXR9OxsZ717D0tG3RzVT+6lNkgPHGkCXoNYuRZwe
         YOf2uvHCVgi76I6ulp16Uxe30yEGtDP0WngT305VQMCfLK7Stt/dI96D/7JaTSC3Eg3l
         X7fycQbcl6+b3hD0GdPQ4EIwmTLIjf3OvIWPzgZG5IO1r3U40srqyV1eyu/UxOI9ykKC
         UGWFIF2lhVKPLohKk21QCiLLiU5rFHUTB57n8t4J8hi4W49AcKlwUCk1e0MX37RBQVYW
         T7SghPZT9i/zko0u1KzhOhVttY7YMS5T2t3lzkqnrNA8gZhUpIP8CDyvejZ0XLXF8dHW
         4j7g==
X-Gm-Message-State: APjAAAUlvar2bARjmHzcT/AqQbXFfBjsazJA1ieH7+YR6ikrm+oxAAWo
        zT4pEb25F17Ke8kfZWsVA1w=
X-Google-Smtp-Source: APXvYqwoIl7V/WDEtAppgwERg7x7IzSvDjWch2vq/hu8T8BCJVF3vIPgcq6wvPpFKnLqJ8DLg7OjfQ==
X-Received: by 2002:a62:29c7:: with SMTP id p190mr39072330pfp.218.1559664894284;
        Tue, 04 Jun 2019 09:14:54 -0700 (PDT)
Received: from dtor-ws ([2620:15c:202:201:3adc:b08c:7acc:b325])
        by smtp.gmail.com with ESMTPSA id p64sm21904826pfp.72.2019.06.04.09.14.52
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 04 Jun 2019 09:14:53 -0700 (PDT)
Date:   Tue, 4 Jun 2019 09:14:51 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, libusb-devel@lists.sourceforge.net
Subject: Re: Extending USB_CONNECTINFO ioctl
Message-ID: <20190604161451.GB226219@dtor-ws>
References: <20190604002410.GA36666@dtor-ws>
 <Pine.LNX.4.44L0.1906040952480.1731-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1906040952480.1731-100000@iolanthe.rowland.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alan,

On Tue, Jun 04, 2019 at 10:17:25AM -0400, Alan Stern wrote:
> On Mon, 3 Jun 2019, Dmitry Torokhov wrote:
> 
> > Hi Alan, Greg,
> > 
> > When running software in a jailed environment where sysfs or udev is not
> > readily available and one can only have an FD to usbdevfs device passed
> > into the jail, there is a desire to allow libusb working. Alan recently
> > added USBDEVFS_GET_SPEED, but we are still missing bus number and list
> > of port numbers on the way to the root to be able to better identify the
> > device in question.
> > 
> > What do you think about adding a new ioctl:
> > 
> > struct usbdevfs_connectinfo_ex {
> > 	__u32 size;		/* size of the structure from the kernel POV */
> 
> This should be an input/output parameter.  That is, the original value
> says how big the userspace structure is, and the value stored by the
> kernel says how much space was actually filled in.  Or alternatively, 
> have two size fields (one for input and one for output).

The "incoming" size is encoded in the ioctl number (the 'len' argument
in USBDEVFS_CONNINFO_EX()), there is no reason to add it separately (or
make read/write).

> 
> > 	__u32 busnum;
> > 	__u32 devnum;
> > 	__u32 speed;		/* USB_SPEED_* form ch9.h */
> > 	u8 num_ports;		/* Number of entries in port_numbers array */
> > 	u8 port_numbers[31];	/* Current limit in USB3.0 spec is 7 */
> > };
> 
> Yeah, 31 is overkill.  Even the USB-2.0 spec limits the topology to 7
> tiers (including the root hub), meaning that only 6 port numbers are
> needed.

If you insist I can bring it down to 7, but this structure is short
lived, on stack, and there should not be many of them in the kernel, so
if we can avoid extending a particular field in the future I think it is
worth it.
.

> 
> > /*
> >  * Returns struct usbdevfs_connectinfo_ex; length is variable to allow
> >  * extending size of the data returned.
> >  */
> > #define USBDEVFS_CONNINFO_EX(len)  _IOC(_IOC_READ, 'U', 32, len)
> 
> Sounds okay to me.  Have you asked the libusb Linux-port maintainers
> what they think and if they have any suggestions for additional fields?

Why don't we just get them into this conversation? Hopefully
libusb-devel that I just CCed here is not subscription-only.

> 
> Also, if you implement this, remember to add a USBDEVFS_CAP_CONNINFO_EX
> capability flag for the new ioctl (see the USBDEVFS_GET_CAPABILITIES 
> handler).

OK, will do.

Thanks.

-- 
Dmitry
