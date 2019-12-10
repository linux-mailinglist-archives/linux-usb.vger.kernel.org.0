Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C48EC118AC3
	for <lists+linux-usb@lfdr.de>; Tue, 10 Dec 2019 15:25:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727320AbfLJOZl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Dec 2019 09:25:41 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:37440 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727178AbfLJOZl (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Dec 2019 09:25:41 -0500
Received: by mail-pj1-f68.google.com with SMTP id ep17so7477902pjb.4
        for <linux-usb@vger.kernel.org>; Tue, 10 Dec 2019 06:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=14LYD2q7RsktPtjbsTEsOoEn7NX+Ssm2lUaHPetmU4E=;
        b=Zcrfc8kKCaHjLSY4ZWjJf3MyoaD8b/8e/DBXcJkgrhcMk7TmXJcF5G8sL+N4ishtFk
         hdn19tE+ObqraLf23ZbdkQf+W35knoA631QucW+K04+HS6EzBhQQGwSSMA+u8U/CI9QS
         R+laZCZo6KMUBWXYR/0S9/yb90jVgYuHM6haKvGy3hlY35d19GvZqOpcMKz5FNLVSnts
         dPecNwv64/7xBAGqa1r8ESUob7C4xobaeAz9GP60Cae0pntTyIUt3Cggp4yVuGO/aXtP
         IVZ7K/pCC2yp6cgt7kvFEdX3FRU+5zpr48uSgQjm1/4dEOGzBoKotvIPrYCloREhegGF
         HOHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=14LYD2q7RsktPtjbsTEsOoEn7NX+Ssm2lUaHPetmU4E=;
        b=f91NBjXIQ0EyC1mvLuqDU46aR6PCKZvaq4Cx/p0qGIko/IPmLFrE6Xfs/v3UH7/era
         P0aCE/q4KC4LKMLIIeVJLtw9zxVqpjoZD/H3fDuECDNpqQrO21rICoUtfYun9FPOX1/L
         1qDuMCCAQGnjT1avUBOSmDLiCW4HqW6TjYVyafZpqZR9dlaUuCJsyuoeYUqY2RJoyN3q
         RN88FG1qu7ubGVcu5nwG2UnXBT3+v1un0O+5CNRdN+EWToNreRPMjIXCCVCoztD7gAh/
         JTp3jHoSb6jTxvolsVANKzBtoe157OBwlRXcAeLgNjkgMqyT0ySfFN1QW5J5m1mrguf1
         Ncew==
X-Gm-Message-State: APjAAAUxuYn4SsOP50wablxWCerVxG5ztvGkqXXEFtxLhvn7j/XDyHx+
        zkj+2AoCHnQFuFAdFM3KG6Y=
X-Google-Smtp-Source: APXvYqxRIcAiDFSpCB4LiXM5gSxIzT90yPuHXk/gJdGXObxserU8X8DQX9227CNToZv8kIwe5wfs8g==
X-Received: by 2002:a17:902:b908:: with SMTP id bf8mr35487213plb.175.1575987939888;
        Tue, 10 Dec 2019 06:25:39 -0800 (PST)
Received: from localhost.localdomain ([221.155.202.134])
        by smtp.gmail.com with ESMTPSA id p17sm3942366pfn.31.2019.12.10.06.25.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 06:25:39 -0800 (PST)
Date:   Tue, 10 Dec 2019 23:25:35 +0900
From:   Suwan Kim <suwan.kim027@gmail.com>
To:     Marek =?iso-8859-1?Q?Marczykowski-G=F3recki?= 
        <marmarek@invisiblethingslab.com>
Cc:     linux-usb@vger.kernel.org, Shuah Khan <skhan@linuxfoundation.org>,
        Valentina Manea <valentina.manea.m@gmail.com>
Subject: Re: "usbip: Implement SG support to vhci-hcd and stub driver" causes
 a deadlock
Message-ID: <20191210142535.GA4489@localhost.localdomain>
References: <20191206032406.GE1208@mail-itl>
 <20191206065058.GA9792@localhost.localdomain>
 <20191206205742.GP1122@mail-itl>
 <20191209020130.GA2909@localhost.localdomain>
 <20191209033740.GA27394@mail-itl>
 <20191209063543.GA2473@localhost.localdomain>
 <20191209141959.GC11116@mail-itl>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191209141959.GC11116@mail-itl>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 09, 2019 at 03:19:59PM +0100, Marek Marczykowski-Górecki wrote:
> On Mon, Dec 09, 2019 at 03:35:43PM +0900, Suwan Kim wrote:
> > On Mon, Dec 09, 2019 at 04:37:40AM +0100, Marek Marczykowski-Górecki wrote:
> > > On Mon, Dec 09, 2019 at 11:01:30AM +0900, Suwan Kim wrote:
> > > > On Fri, Dec 06, 2019 at 09:57:42PM +0100, Marek Marczykowski-Górecki wrote:
> > > > > [  212.890519] usb 1-1: recv xbuf, 42
> > > > 
> > > > This message is printed by receive error and before that, driver
> > > > canceled URB transmission. we need to know the exact situation
> > > > before this message.
> > > 
> > > I've added some more messages and found recv_size is 0.
> > 
> > That is the bug point. "size" is urb->actual_length that means
> > amount of data actually received from device. And "copy" is
> > amount of data received from usbip server. So, in this situation,
> > vhci-hcd received all the data from usbip server even if there
> > are more sg entries left. So, "copy == 0" means vhci-hcd receives
> > all data from the server and we should check "if (copy == 0)" in
> > for_each_sg() loop of usbip_recv_xbuff() to exit the loop and not
> > to add error event.
> 
> That makes sense. But I think there is also another issue here: hang in
> case of an error. Here it was EINVAL, but there are probably other
> reasons why usbip_recv can fail, like network error or misbehaving
> server. This definitely should not cause the client to fail this way...
> And also, the actual error code is lost.

I agree. I have been taking a look at it and trying to reproduce
the same issue on my machine. I guess race condition between hub
irq thread and driver (vhci_urb_enqueue or hcd?)
But I'm not sure...

> 
> > > > Could you send me a longer log messages showing the situation
> > > > before "[  212.890519] usb 1-1: recv xbuf, 42"?
> > > 
> > > Sure, with added extra messages (debug patch below).
> > > 
> > > [  131.397522] usb 1-1: num_sgs 0
> > > [  131.406588] usb 1-1: num_sgs 0
> > > [  131.410621] usb 1-1: num_sgs 0
> > > [  131.411950] usb 1-1: num_sgs 0
> > > [  131.413186] usb 1-1: num_sgs 0
> > > [  131.414590] usb 1-1: num_sgs 0
> > > [  131.417086] usb 1-1: num_sgs 0
> > > [  131.418188] usb 1-1: num_sgs 0
> > > [  131.419228] usb 1-1: num_sgs 0
> > > [  131.420248] usb 1-1: num_sgs 0
> > > [  131.457315] usb 1-1: num_sgs 5
> > > [  131.457345] usb 1-1: size 42, copy 42 recv 42, recv_size 42, sg->length 16384
> > 
> > Device sent 42 bytes data (size 42) and vhci-hcd received 42 bytes
> > data from the server. vhci-hcd received all the data and It should
> > exit the loop.
> > 
> > > [  131.457359] usb 1-1: size 42, copy 0 recv -22, recv_size 0, sg->length 16384
> > > [  131.457372] usb 1-1: recv xbuf, 42 size 42
> > > [  131.458263] vhci_hcd: vhci_shutdown_connection:1024: stop threads
> > > [  131.458318] vhci_hcd: vhci_shutdown_connection:1032: release socket
> > > [  131.458431] vhci_hcd: vhci_shutdown_connection:1058: disconnect device
> > > [  131.460171] usb 1-1: USB disconnect, device number 2
> > > 
> > > (...)
> > > 
> > > If I add "if (!recv_size) continue;" there, it works!
> > 
> > I think we should check "copy" not the "recv_size" because "copy"
> > shows the amount of data received from the server.
> > 
> > int usbip_recv_xbuff(struct usbip_device *ud, struct urb *urb)
> > ...
> > ...
> > 	if (urb->num_sgs) {
> > 		copy = size;
> > 		for_each_sg(urb->sg, sg, urb->num_sgs, i) {
> > 			int recv_size;
> > 
> > 			if (copy < sg->length)
> > 				recv_size = copy;
> > 			else
> > 				recv_size = sg->length;
> > 
> > 			recv = usbip_recv(ud->tcp_socket, sg_virt(sg),
> > 						recv_size);
> > 
> > 			if (recv != recv_size)
> > 				goto error;
> > 
> > 			copy -= recv;
> > 			ret += recv;
> > 			
> > 			/* Add here */
> > 			if (!copy)
> > 				break;
> > 			^^^^^^^^^^^^^^
> > 		}
> 
> This helps too.

Good. We should fix this issue first. I will submit a patch soon.

Regrads,
Suwan Kim
