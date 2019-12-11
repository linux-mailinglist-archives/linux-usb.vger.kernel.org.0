Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9830211A2DB
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2019 04:08:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727217AbfLKDIC (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Dec 2019 22:08:02 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:46866 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727077AbfLKDIB (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Dec 2019 22:08:01 -0500
Received: by mail-pg1-f196.google.com with SMTP id z124so9995766pgb.13
        for <linux-usb@vger.kernel.org>; Tue, 10 Dec 2019 19:08:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=VprKbyHokhvEqzTqmaJlpFDOeUzUQwBx+mZU23gbCpc=;
        b=saAcgV532zBNJ99LKKDpsSe5cXhERsk/ZMlT4IBZ9AZRlAbk+lnkRRuk2UgKI5S/Pe
         kkdgDUSrARrnikjaZ14OBrSfV0oBUyxk2Nmxj8AsqZbw0Ct5WsNxColbV4z5K6BnR8dj
         CbZvhlEV3M/SHaDhDrIcs7iYqmX/xLY5aHvXjLwtG3u9mLfxpt4vGzQjutVVEjtTVIzQ
         xMPKsN0zhaSXNAc45vTy35eIxDCdz0tBBzBaeTXOrA9Ic2AJDRBNhGHY3PgO4xFfeGCA
         lqKS0GSNVai7QM4UGGrkvUA5XkrTlu8fyMTcAo8/tYdSCXX0tUBlQrnFiRGgopowSP9B
         TGbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=VprKbyHokhvEqzTqmaJlpFDOeUzUQwBx+mZU23gbCpc=;
        b=IW/LJz8AYkJO+PAZ3nYAfgy+R8vKm7OEJ+tcV4GYZj6T5fqCaXKmmnsC1/HmAO5xbQ
         G0XvHdD410YWW3fzl08SjM0fNu+k2YrM+RchC2mBJclrisOEIS7Mh6tgrc1P0n5OwL4A
         BO8ZtoBn0spxSYDXQiBlIw66ME+QRk35YVFYeh0f4Aj/6w4JjNFEw94P9ZRq2GXW2pf+
         Zz/BvlLRSWU5G3aNkuZxxMo6C5uSEHBuc1nWQ4IV9FeHjTXsajbrmo3t8WyY4SjrC1Gl
         8yrQpjYzIGEpJ/w9cNM27AoxA8ZyK1+8tgwEdtrM7pwT9oWMkf6UyXqXcY/WZ5Me1fFk
         5ELg==
X-Gm-Message-State: APjAAAWobmhhYJk4ztJwVRMuTqfCrv2cHSFrwiMYldB73lAJm+j7k8q0
        M9veriykrhxz62v+wh2Tg+y0IkZc
X-Google-Smtp-Source: APXvYqzglEVT6wrL9vG9kc1kDM2Oe0ukiI1g3UDLQPtLoOD/rstNM3fE4/NQlzlS2n/QLPzYURgxbQ==
X-Received: by 2002:a63:684a:: with SMTP id d71mr1550000pgc.27.1576033680602;
        Tue, 10 Dec 2019 19:08:00 -0800 (PST)
Received: from localhost.localdomain ([163.152.162.99])
        by smtp.gmail.com with ESMTPSA id h11sm402468pgv.38.2019.12.10.19.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 19:07:59 -0800 (PST)
Date:   Wed, 11 Dec 2019 12:07:54 +0900
From:   Suwan Kim <suwan.kim027@gmail.com>
To:     Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= 
        <marmarek@invisiblethingslab.com>
Cc:     linux-usb@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
        Valentina Manea <valentina.manea.m@gmail.com>
Subject: Re: "usbip: Implement SG support to vhci-hcd and stub driver" causes
 a deadlock
Message-ID: <20191211030754.GA5190@localhost.localdomain>
References: <20191206032406.GE1208@mail-itl>
 <20191206065058.GA9792@localhost.localdomain>
 <20191206205742.GP1122@mail-itl>
 <20191209020130.GA2909@localhost.localdomain>
 <20191209033740.GA27394@mail-itl>
 <20191209063543.GA2473@localhost.localdomain>
 <20191209141959.GC11116@mail-itl>
 <20191210142535.GA4489@localhost.localdomain>
 <20191210153221.GG11116@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191210153221.GG11116@mail-itl>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 10, 2019 at 04:32:21PM +0100, Marek Marczykowski-Górecki wrote:
> On Tue, Dec 10, 2019 at 11:25:35PM +0900, Suwan Kim wrote:
> > On Mon, Dec 09, 2019 at 03:19:59PM +0100, Marek Marczykowski-Górecki wrote:
> > > On Mon, Dec 09, 2019 at 03:35:43PM +0900, Suwan Kim wrote:
> > > > On Mon, Dec 09, 2019 at 04:37:40AM +0100, Marek Marczykowski-Górecki wrote:
> > > > > On Mon, Dec 09, 2019 at 11:01:30AM +0900, Suwan Kim wrote:
> > > > > > On Fri, Dec 06, 2019 at 09:57:42PM +0100, Marek Marczykowski-Górecki wrote:
> > > > > > > [  212.890519] usb 1-1: recv xbuf, 42
> > > > > > 
> > > > > > This message is printed by receive error and before that, driver
> > > > > > canceled URB transmission. we need to know the exact situation
> > > > > > before this message.
> > > > > 
> > > > > I've added some more messages and found recv_size is 0.
> > > > 
> > > > That is the bug point. "size" is urb->actual_length that means
> > > > amount of data actually received from device. And "copy" is
> > > > amount of data received from usbip server. So, in this situation,
> > > > vhci-hcd received all the data from usbip server even if there
> > > > are more sg entries left. So, "copy == 0" means vhci-hcd receives
> > > > all data from the server and we should check "if (copy == 0)" in
> > > > for_each_sg() loop of usbip_recv_xbuff() to exit the loop and not
> > > > to add error event.
> > > 
> > > That makes sense. But I think there is also another issue here: hang in
> > > case of an error. Here it was EINVAL, but there are probably other
> > > reasons why usbip_recv can fail, like network error or misbehaving
> > > server. This definitely should not cause the client to fail this way...
> > > And also, the actual error code is lost.
> > 
> > I agree. I have been taking a look at it and trying to reproduce
> > the same issue on my machine. I guess race condition between hub
> > irq thread and driver (vhci_urb_enqueue or hcd?)
> > But I'm not sure...
> 
> I've tried it some more time and one time I've got a traceback pointing
> at lock_release() called from vhci_urb_dequeue, not lock_acquire(). This
> get me thinking it may not be deadlock on a spinlock, but some infinite
> loop. Looking at the source, I think it's about usb_hcd_flush_endpoint
> looping indefinitely because vhci_urb_dequeue() exit early on this:

That really makes sense. Very good debugging. I can also see the
infinite loop now.

When there is transaction error, vhci rx thread adds error event
and event handler tries to shutdown the connection and also changes
the port status of vhci that kicks hub_irq. Then hub_irq cleans up
the device resources including pending URBs (vhci_urb_dequeue).
But as you pointed out, "priv" is already released in vhci rx
thread.

> 
> 
>     spin_lock_irqsave(&vhci->lock, flags);
> 
>     priv = urb->hcpriv;
>     if (!priv) {
>         /* URB was never linked! or will be soon given back by
>          * vhci_rx. */
>         spin_unlock_irqrestore(&vhci->lock, flags);
>         return -EIDRM;
>     }
> 
> Adding a print there confirms it.
> 
> And I think it's because of vhci_recv_ret_submit():
> 
> 
>     spin_lock_irqsave(&vdev->priv_lock, flags);
>     urb = pickup_urb_and_free_priv(vdev, pdu->base.seqnum);
> 
> // ****** priv freed here
> 
>     spin_unlock_irqrestore(&vdev->priv_lock, flags);
> 
>     if (!urb) {
>         pr_err("cannot find a urb of seqnum %u max seqnum %d\n",
>             pdu->base.seqnum,
>             atomic_read(&vhci_hcd->seqnum));
>         usbip_event_add(ud, VDEV_EVENT_ERROR_TCP);
>         return;
>     }
>     
>     /* unpack the pdu to a urb */
>     usbip_pack_pdu(pdu, urb, USBIP_RET_SUBMIT, 0);
> 
>     /* recv transfer buffer */
>     if (usbip_recv_xbuff(ud, urb) < 0)
> // ***** exit early here
>         return;
> 
>     /* recv iso_packet_descriptor */
>     if (usbip_recv_iso(ud, urb) < 0)
>         return;
> 
> I'm not really sure what should happen, but I think some cleanup in case
> of usbip_recv_xbuff() failure is missing. And probably in case of
> usbip_recv_iso() failure too.

HCD should giveback URB to driver calling usb_hcd_giveback_urb().
But in the case of transaction error, vhci_recv_ret_submit()
terminates without giveback URB. So, I think the error path in
usbip_recv_xbuff and usbip_recv_iso should unlink URB from ep and
insert proper error code in urb->status that indicates error
status to driver and handle giveback URB to driver.

Then hub_irq doesn't need to flush error URB.
That will be helpful to graceful connection shutdown.


static void vhci_recv_ret_submit(struct vhci_device *vdev,
				 struct usbip_header *pdu)
...
...
	if (usbip_recv_xbuff(ud, urb) < 0) {
		urb->status = -EPIPE;
		goto error;	// goto error path
	}

	/* recv iso_packet_descriptor */
	if (usbip_recv_iso(ud, urb) < 0) {
		urb->status = -EPIPE;
		goto error;	// goto error path
	}
...
...
error://error path
	spin_lock_irqsave(&vhci->lock, flags);
	usb_hcd_unlink_urb_from_ep(vhci_hcd_to_hcd(vhci_hcd), urb);
	spin_unlock_irqrestore(&vhci->lock, flags);

	usb_hcd_giveback_urb(vhci_hcd_to_hcd(vhci_hcd), urb, urb->status);

	usbip_dbg_vhci_rx("Leave\n");
}

Regards,
Suwan Kim

> -- 
> Best Regards,
> Marek Marczykowski-Górecki
> Invisible Things Lab
> A: Because it messes up the order in which people normally read text.
> Q: Why is top-posting such a bad thing?


