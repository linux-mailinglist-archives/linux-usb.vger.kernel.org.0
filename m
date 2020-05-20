Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 423471DB49B
	for <lists+linux-usb@lfdr.de>; Wed, 20 May 2020 15:08:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726860AbgETNIr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 20 May 2020 09:08:47 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:39922 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726525AbgETNIp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 20 May 2020 09:08:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1589980124;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=P/gKendr0zNppLUJqUiRq2VN8GArGi4m/3tA9Ju98qE=;
        b=KYhN0CMriMEhhiPcS3h2gEHvLFl+69HD4cLHD1BkVgAWIrcFMerKZ9pJNxaAdxQBX6ZGSx
        II8BCTrsJ62SGmkvAuwelq641nhqQiPntRBMxnW7Z271yivERdyINb1sPQO1j1vlltv6YY
        9mE0I70CG6O8Tsj3ZPxeXNqmB+2s7Tg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-dGyQj__5NfKZX75GXBS-Pw-1; Wed, 20 May 2020 09:08:39 -0400
X-MC-Unique: dGyQj__5NfKZX75GXBS-Pw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 133F7A0BE6;
        Wed, 20 May 2020 13:08:38 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.3.128.7])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 41BAE82ED0;
        Wed, 20 May 2020 13:08:36 +0000 (UTC)
Message-ID: <6e83f76cc2e559ec82c1c8fe8a22b7d91338a851.camel@redhat.com>
Subject: Re: ttyACM strange chars appearing at connect
From:   Dan Williams <dcbw@redhat.com>
To:     Joakim Tjernlund <Joakim.Tjernlund@infinera.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Date:   Wed, 20 May 2020 08:08:35 -0500
In-Reply-To: <f317d5942549910c4a92f7d398ada9fc02a26af4.camel@infinera.com>
References: <52b8c126634058e3a455dc0ab8b0c542916db543.camel@infinera.com>
         <20200519125400.GA410029@kroah.com>
         <f317d5942549910c4a92f7d398ada9fc02a26af4.camel@infinera.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.5 (3.32.5-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, 2020-05-20 at 12:43 +0000, Joakim Tjernlund wrote:
> On Tue, 2020-05-19 at 14:54 +0200, Greg KH wrote:
> > CAUTION: This email originated from outside of the organization. Do
> > not click links or open attachments unless you recognize the sender
> > and know the content is safe.
> > 
> > 
> > On Tue, May 19, 2020 at 12:14:55PM +0000, Joakim Tjernlund wrote:
> > > Whenever we connect a Linux laptop(4.19.118) to our ttyACM serial
> > > gadget we can see som strange
> > > chars appearing in our gadget:
> > > 03�`3�03�x�x(in hex: 3033 efbf bd60 33ef bfbd 3033 efbf bd78 efbf
> > > bd78)
> > > They appear witch c.a 1 sec in between.
> > > I assume it is the laptops ACM driver emitting those, but why?
> > > Can these chars be turned off?
> > 
> > It's a program on your laptop probing the device.  Usually
> > modemmanager
> > or something like that.
> > 
> > greg k-h
> 
> Right you were, it was modemmanager :)

If the device has a unique ID that isn't a modem, it can be added to
ModemManager's blacklist.

Also note that recent versions of ModemManager flipped the logic and
will only probe *known* modems, require explicit requests to probe
possible modems, and of course won't probe anything on the blacklist.

Dan

> Fixing that I can occasion se in my DE:
> [Wed May 20 14:03:16 2020] cdc_ether 1-6.2:1.0 usb0: unregister
> 'cdc_ether' usb-0000:00:14.0-6.2, CDC Ethernet Device
> [Wed May 20 14:03:25 2020] usb usb1-port6: disabled by hub (EMI?),
> re-enabling...
> [Wed May 20 14:03:25 2020] usb 1-6: USB disconnect, device number 85
> [Wed May 20 14:03:25 2020] cdc_acm 1-6.3:1.1: acm_ctrl_irq -
> usb_submit_urb failed: -19
> [Wed May 20 14:03:25 2020] usb 1-6-port2: attempt power cycle
> [Wed May 20 14:03:26 2020] usb 1-6.3: USB disconnect, device number
> 86
> [Wed May 20 14:03:26 2020] cdc_acm 1-6.3:1.1: failed to set dtr/rts
> [Wed May 20 14:03:26 2020] usb 1-6: new high-speed USB device number
> 94 using xhci_hcd
> [Wed May 20 14:03:27 2020] hub 1-6:1.0: USB hub found
> [Wed May 20 14:03:27 2020] hub 1-6:1.0: 3 ports detected
> [Wed May 20 14:03:27 2020] usb 1-6.2: new high-speed USB device
> number 95 using xhci_hcd
> [Wed May 20 14:03:27 2020] cdc_ether 1-6.2:1.0 usb0: register
> 'cdc_ether' at usb-0000:00:14.0-6.2, CDC Ethernet Device,
> 7e:1d:06:c0:3f:3c
> [Wed May 20 14:03:27 2020] usb 1-6.3: new high-speed USB device
> number 96 using xhci_hcd
> [Wed May 20 14:03:27 2020] cdc_acm 1-6.3:1.1: ttyACM0: USB ACM device
> 
> This "disabled by hub (EMI?), re-enabling" may be from:
>   EM interference sometimes causes bad shielded USB devices to 
>   be shutdown by the hub, this hack enables them again.
> 
> But a another side effect from this is that I get a lot of garbage
> chars in the other end, like:
>  h�^@^@� ^@^@� ^@
> or
>  X���)H��4Ğ^���
> I wonder if this can be caused by the USB/ACM driver ?
> 
>  Jocke

