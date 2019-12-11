Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 94E4211A480
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2019 07:27:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728033AbfLKG1L (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Dec 2019 01:27:11 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:46351 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727958AbfLKG1K (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Dec 2019 01:27:10 -0500
Received: by mail-pl1-f196.google.com with SMTP id k20so986816pll.13
        for <linux-usb@vger.kernel.org>; Tue, 10 Dec 2019 22:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=+2OIhcsv7+Ya8FvLqq5aM0OeC7F+VfxerqHBeKPZ98U=;
        b=hY5dH80IcKlg9pZiU1BrkH59S/TNd41X3cqWEBo4nIWNXyuO4UY1sUQmGAG/kXqvPp
         IJQl5Qe0yBS9iZAjStjWIeM4QyTYt6JsO2EPVqfrZhVufe+EPLtu90/27vShlH2X/phb
         U5aGGJu7+jzX0UIk+0HJIpedKobMWkLna2YP4QUKbMyoCD3x/qCvyLU7GOpsyj0gNmPJ
         iZPrwn8Yn+pVIvfL9P0bfwDaav7T+jHOR+bS+Ed8l35zD/kbxsY1BqynFRZDfxPqxM/9
         7Uu4is89/ukp/YgGuzmyL7L5TgRftEm3rKD2E8IZcXI/NxC2ne5EbEPENXy0wEz6tdQt
         VUNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=+2OIhcsv7+Ya8FvLqq5aM0OeC7F+VfxerqHBeKPZ98U=;
        b=gOizRNRSNfNNcNeMV77SN4Vh/b9ZjO5PitMlZh66CDC+Ck9CHpjgeGjSX0bArXIdkN
         PUei3ofaNnicICxYeKkLF8n5CgyEiFPjZNy/+QCIhhvKv+xTDEGRTDEbfI7Qk/nYe7Zd
         m/KygyqnH5aiXhX8pc6KpOJw9xAQN6zAjR63I7yjrsxEP1sA0x5Lmk0ke16kGpbhJd1u
         rBNpg/s5pQLtSQ0WNSssetuP6Xw1hvobJbZSlWVRnpvAqd9iviwXWv690FzoTfTP+0yH
         r0x0mO6Cmwycj2r3v0ihWhIoF4nd3q3loodl1hWDJvkDbx8TEuCFmhZJ5h0pOCK3mutT
         UeWQ==
X-Gm-Message-State: APjAAAUS/E8I9WsPrmYASYoxeCuWodfzFHdPvzkqwpuf4zY8hNw7XwhI
        R9Y+SLRtnq2fgCuFav443jyk8fxo
X-Google-Smtp-Source: APXvYqyhPox4VtlZY7mBAdujGwIfI/KIr+SCTngCT81nj/5tRTn2ZlRPszpMSnziMWyoFj7UBXwJzQ==
X-Received: by 2002:a17:902:9a94:: with SMTP id w20mr1484866plp.54.1576045630095;
        Tue, 10 Dec 2019 22:27:10 -0800 (PST)
Received: from localhost.localdomain ([163.152.162.99])
        by smtp.gmail.com with ESMTPSA id z23sm1119287pgj.43.2019.12.10.22.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 22:27:09 -0800 (PST)
Date:   Wed, 11 Dec 2019 15:27:05 +0900
From:   Suwan Kim <suwan.kim027@gmail.com>
To:     Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= 
        <marmarek@invisiblethingslab.com>
Cc:     linux-usb@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
        Valentina Manea <valentina.manea.m@gmail.com>
Subject: Re: "usbip: Implement SG support to vhci-hcd and stub driver" causes
 a deadlock
Message-ID: <20191211062705.GA11367@localhost.localdomain>
References: <20191206065058.GA9792@localhost.localdomain>
 <20191206205742.GP1122@mail-itl>
 <20191209020130.GA2909@localhost.localdomain>
 <20191209033740.GA27394@mail-itl>
 <20191209063543.GA2473@localhost.localdomain>
 <20191209141959.GC11116@mail-itl>
 <20191210142535.GA4489@localhost.localdomain>
 <20191210153221.GG11116@mail-itl>
 <20191211030754.GA5190@localhost.localdomain>
 <20191211032032.GL11116@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191211032032.GL11116@mail-itl>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 11, 2019 at 04:20:32AM +0100, Marek Marczykowski-Górecki wrote:
> On Wed, Dec 11, 2019 at 12:07:54PM +0900, Suwan Kim wrote:
> > HCD should giveback URB to driver calling usb_hcd_giveback_urb().
> > But in the case of transaction error, vhci_recv_ret_submit()
> > terminates without giveback URB. So, I think the error path in
> > usbip_recv_xbuff and usbip_recv_iso should unlink URB from ep and
> > insert proper error code in urb->status that indicates error
> > status to driver and handle giveback URB to driver.
> > 
> > Then hub_irq doesn't need to flush error URB.
> > That will be helpful to graceful connection shutdown.
> > 
> > 
> > static void vhci_recv_ret_submit(struct vhci_device *vdev,
> > 				 struct usbip_header *pdu)
> > ...
> > ...
> > 	if (usbip_recv_xbuff(ud, urb) < 0) {
> > 		urb->status = -EPIPE;
> > 		goto error;	// goto error path
> > 	}
> > 
> > 	/* recv iso_packet_descriptor */
> > 	if (usbip_recv_iso(ud, urb) < 0) {
> > 		urb->status = -EPIPE;
> > 		goto error;	// goto error path
> > 	}
> > ...
> > ...
> > error://error path
> > 	spin_lock_irqsave(&vhci->lock, flags);
> > 	usb_hcd_unlink_urb_from_ep(vhci_hcd_to_hcd(vhci_hcd), urb);
> > 	spin_unlock_irqrestore(&vhci->lock, flags);
> > 
> > 	usb_hcd_giveback_urb(vhci_hcd_to_hcd(vhci_hcd), urb, urb->status);
> > 
> > 	usbip_dbg_vhci_rx("Leave\n");
> > }
> 
> Yup, that works! Now the error is handled gracefully instead of hanging.

Marek, Could you test if it works too?

Regards,
Suwan Kim


diff --git a/drivers/usb/usbip/vhci_rx.c b/drivers/usb/usbip/vhci_rx.c
index 33f8972ba842..19a807e398eb 100644
--- a/drivers/usb/usbip/vhci_rx.c
+++ b/drivers/usb/usbip/vhci_rx.c
@@ -78,11 +78,11 @@ static void vhci_recv_ret_submit(struct vhci_device *vdev,

        /* recv transfer buffer */
        if (usbip_recv_xbuff(ud, urb) < 0)
-               return;
+               urb->status = -EPIPE;

        /* recv iso_packet_descriptor */
        if (usbip_recv_iso(ud, urb) < 0)
-               return;
+               urb->status = -EPIPE;

        /* restore the padding in iso packets */
        usbip_pad_iso(ud, urb);
