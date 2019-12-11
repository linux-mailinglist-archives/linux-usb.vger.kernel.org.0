Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77C8311A397
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2019 05:53:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726642AbfLKExW (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Dec 2019 23:53:22 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:46730 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726613AbfLKExV (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Dec 2019 23:53:21 -0500
Received: by mail-pg1-f195.google.com with SMTP id z124so10115678pgb.13
        for <linux-usb@vger.kernel.org>; Tue, 10 Dec 2019 20:53:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=FjDp+SA9KlMjNcZcukoGNADWdAtTB9avElu4ZDKSI3s=;
        b=lL9yWbiJpB+orbPp4xPm0aY6UUPP95TRLDa5zl52U77iDkOYs8rV6OdgcvsueNVBo8
         FZxECcNjhhzkUxUGM8OIprfclNE8ix8DQXz18RgRZ9VMgpk3RnLo0sEDV69gwGcPacDD
         qWL1R7r85wDKEq1Xon/2b73Xbl8AgjIYCS5Kf/Yi3PK5VVfosgUUyyKRs1flPFanda6y
         JMdpbTcJdjx3QhqbK5HNrMKvWM6kKtGuS8tGm4lolLGfSXJZ5W4m+v+Rz1F84zuJwQxq
         cub/Eh9NfDg+FrE/XkyxWONbmwYrA2+Yw66Nvd/X5NFobvBonBUIgTSpeJ6qCp/Net3B
         nfPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=FjDp+SA9KlMjNcZcukoGNADWdAtTB9avElu4ZDKSI3s=;
        b=IkZpOqGMaGep53WpKDNIL8FCVh66XbV9DXDcfVi3vt04b8gBirB3UDTBFFI5EhhKkn
         1f7dkx2gannv7Q9Uz6tevDHtwKbnAF4bZwptL2eKvvp2+rULWHP638jz95BRiyUrA3ru
         zhOEx39ERdwbN1jh1UGIE2GHZJXIbZIYzFH7hHRQRkl+mWYC9yrKf8xaqojDhTSWjZG3
         lnrbMeL6Grll+qvLjDASsB/87AiZusb/BJmlHCnZduhnG4EuHU6omHT+Pi2F8kX1DoKF
         PAJgwsJbxV8GDZsUttYDppQaj5mDFNQoGMEE5wA/FKUeBdBJs9FHG++6U8KnYC33WIyK
         En0Q==
X-Gm-Message-State: APjAAAVTYtSNoY0YcPKPf6Omq287C3zN/a12xGu2aw7BF3ZlD89aGKQZ
        NzaicmwcIgMCRo0KNVCjl1c=
X-Google-Smtp-Source: APXvYqxyDTYflGnZ57KMM9dXxZx1QhsDGAOxR58Zmorn36E5QugKI7QDt+sojimmma39wyB7KqV+UA==
X-Received: by 2002:a63:770c:: with SMTP id s12mr2046805pgc.25.1576040001167;
        Tue, 10 Dec 2019 20:53:21 -0800 (PST)
Received: from localhost.localdomain ([163.152.162.99])
        by smtp.gmail.com with ESMTPSA id g22sm697420pgk.85.2019.12.10.20.53.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 20:53:20 -0800 (PST)
Date:   Wed, 11 Dec 2019 13:53:16 +0900
From:   Suwan Kim <suwan.kim027@gmail.com>
To:     Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= 
        <marmarek@invisiblethingslab.com>
Cc:     linux-usb@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
        Valentina Manea <valentina.manea.m@gmail.com>
Subject: Re: "usbip: Implement SG support to vhci-hcd and stub driver" causes
 a deadlock
Message-ID: <20191211045316.GA7080@localhost.localdomain>
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

Ok, good! I will send a patch including Reported-by tag with you :)
Thanks for reporting the bugs.

Regards,
Suwan Kim
