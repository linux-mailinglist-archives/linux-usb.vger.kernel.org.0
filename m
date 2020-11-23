Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C413B2C0E1C
	for <lists+linux-usb@lfdr.de>; Mon, 23 Nov 2020 15:51:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730142AbgKWOtR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 23 Nov 2020 09:49:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34907 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728649AbgKWOtQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 23 Nov 2020 09:49:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606142954;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Jx0e387EU8Y8QGi626Zz2QkBXc0rICaXyds9sJ3z3xc=;
        b=iUx6CnHwKEHjgKXOgGgF3CSepsWWVCdCaFDvvWHXy8kcCXc0sRx+1yTcN8NexhEl1wxSLP
        r6OkVb2tfR6CGsoujjRj4grvSVOdFbO7v8wUvnnY5Guhc5Vm9nlU7CT2HhnztncwWcDYz6
        f94OFGwDc3ZxrH/cU61FJdFuIG7IIsY=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-380-Ggg6HhOXMsaVKeHMw6dX1A-1; Mon, 23 Nov 2020 09:49:12 -0500
X-MC-Unique: Ggg6HhOXMsaVKeHMw6dX1A-1
Received: by mail-ej1-f69.google.com with SMTP id k2so3906907eji.21
        for <linux-usb@vger.kernel.org>; Mon, 23 Nov 2020 06:49:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Jx0e387EU8Y8QGi626Zz2QkBXc0rICaXyds9sJ3z3xc=;
        b=SUe1YAKTtGjlBlPxknjmHfvpfcXAn+9Kmgx2TzUshLTOsQ0jF+TwBUqQsQT2f6ZANT
         1hO0MT5dGm1mB6uAzSopbYzo/anmqew6TzdypYglUkk/Pdrk+GHaCiiIz7pFWVPB2DIT
         ll4AbVZKkMZf9QHreKp0ak0Bs0QQBiBEGUFC1/W/8U1UtQfz7d0pDh9Au1ZI1o3whZSG
         IaaZw7VUVI19ewXwI5ZC0dq9VlCTFTFRuEp+LQr+2mR7Pulw8ltudHUypToegcKQa5kg
         qqxfQaI8EMtsIu8Tk8yom+u8XacSrEo3EfFVbg3ulGRGIzfH/FahHHG//KCBCagE7QrX
         VXrw==
X-Gm-Message-State: AOAM5324RYTnInKBDPZUPxDc2vD78u9hVHOHbpSx5c6q57Tcnro8p68Z
        ibTRkFZJoHJw+zoNcjac9ga9W+vK2OQKvIQLuYiKudZRLPcOdwA5gdAWCpMh1TyJ8Zl3RMyCoJ+
        1uvH63gAcfCdPCtQxwoIt
X-Received: by 2002:a17:906:34c3:: with SMTP id h3mr44342898ejb.132.1606142951014;
        Mon, 23 Nov 2020 06:49:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxxZbyXGfQnU6e1Iz1byKZPi+kKZ/Xi1qd7ffpRUxuGiEndpGF59D1Wg50E4fd2o/f5XNyoWw==
X-Received: by 2002:a17:906:34c3:: with SMTP id h3mr44342885ejb.132.1606142950839;
        Mon, 23 Nov 2020 06:49:10 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id u13sm5094947ejz.74.2020.11.23.06.49.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2020 06:49:09 -0800 (PST)
Subject: Re: 5.10 regression, many XHCI swiotlb buffer is full / DMAR: Device
 bounce map failed errors on thunderbolt connected XHCI controller
From:   Hans de Goede <hdegoede@redhat.com>
To:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Christoph Hellwig <hch@lst.de>
Cc:     linux-usb <linux-usb@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-pci@vger.kernel.org
References: <b046dd04-ac4f-3c69-0602-af810fb1b365@redhat.com>
Message-ID: <be031d15-201f-0e5c-8b0f-be030077141f@redhat.com>
Date:   Mon, 23 Nov 2020 15:49:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <b046dd04-ac4f-3c69-0602-af810fb1b365@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

+Cc Christoph Hellwig <hch@lst.de>

Christoph, this is still an issue, so I've been looking around a bit and think this
might have something to do with the dma-mapping-5.10 changes.

Do you have any suggestions to debug this, or is it time to do a git bisect
on this before 5.10 ships with regression?

Regards,

Hans




On 11/10/20 12:36 PM, Hans de Goede wrote:
> Hi All,
> 
> Not sure if this is a XHCI driver problem at all, but I needed to start
> somewhere with reporting this so I went with:
> 
> scripts/get_maintainer.pl -f drivers/usb/host/xhci-pci.c
> 
> And added a Cc: linux-pci@vger.kernel.org as bonus.
> 
> I'm seeing the following errors and very slow network performance with
> the USB NIC in a Lenovo Thunderbolt gen 2 dock.
> 
> Note that the USB NIC is connected to the XHCI controller which is
> embedded inside the dock and is connected over thunderbolt!
> 
> So the errors are:
> 
> [ 1148.744205] swiotlb_tbl_map_single: 6 callbacks suppressed
> [ 1148.744210] xhci_hcd 0000:0a:00.0: swiotlb buffer is full (sz: 8192 bytes), total 32768 (slots), used 16 (slots)
> [ 1148.744218] xhci_hcd 0000:0a:00.0: DMAR: Device bounce map: 16ea@1411c0000 dir 1 --- failed
> [ 1148.744226] r8152 4-2.1.2:1.0 ens1u2u1u2: failed tx_urb -11
> [ 1148.744368] xhci_hcd 0000:0a:00.0: swiotlb buffer is full (sz: 8192 bytes), total 32768 (slots), used 16 (slots)
> [ 1148.744375] xhci_hcd 0000:0a:00.0: DMAR: Device bounce map: 16ea@10aabc000 dir 1 --- failed
> [ 1148.744381] r8152 4-2.1.2:1.0 ens1u2u1u2: failed tx_urb -11
> [ 1148.745141] xhci_hcd 0000:0a:00.0: swiotlb buffer is full (sz: 8192 bytes), total 32768 (slots), used 16 (slots)
> [ 1148.745148] xhci_hcd 0000:0a:00.0: DMAR: Device bounce map: 118e@1411c0000 dir 1 --- failed
> [ 1148.745155] r8152 4-2.1.2:1.0 ens1u2u1u2: failed tx_urb -11
> [ 1148.951282] xhci_hcd 0000:0a:00.0: swiotlb buffer is full (sz: 8192 bytes), total 32768 (slots), used 16 (slots)
> [ 1148.951388] xhci_hcd 0000:0a:00.0: DMAR: Device bounce map: 118e@140988000 dir 1 --- failed
> [ 1148.951420] r8152 4-2.1.2:1.0 ens1u2u1u2: failed tx_urb -11
> [ 1151.013342] xhci_hcd 0000:0a:00.0: swiotlb buffer is full (sz: 8192 bytes), total 32768 (slots), used 16 (slots)
> [ 1151.013357] xhci_hcd 0000:0a:00.0: DMAR: Device bounce map: 1d2a@1411c0000 dir 1 --- failed
> [ 1151.013373] r8152 4-2.1.2:1.0 ens1u2u1u2: failed tx_urb -11
> [ 1151.018660] xhci_hcd 0000:0a:00.0: swiotlb buffer is full (sz: 8192 bytes), total 32768 (slots), used 18 (slots)
> [ 1151.018696] xhci_hcd 0000:0a:00.0: DMAR: Device bounce map: 11da@1411c0000 dir 1 --- failed
> [ 1151.018711] r8152 4-2.1.2:1.0 ens1u2u1u2: failed tx_urb -11
> [ 1151.223022] xhci_hcd 0000:0a:00.0: swiotlb buffer is full (sz: 8192 bytes), total 32768 (slots), used 16 (slots)
> [ 1151.223102] xhci_hcd 0000:0a:00.0: DMAR: Device bounce map: 11da@10aabc000 dir 1 --- failed
> [ 1151.223133] r8152 4-2.1.2:1.0 ens1u2u1u2: failed tx_urb -11
> [ 1151.228810] xhci_hcd 0000:0a:00.0: swiotlb buffer is full (sz: 8192 bytes), total 32768 (slots), used 16 (slots)
> [ 1151.228870] xhci_hcd 0000:0a:00.0: DMAR: Device bounce map: 11da@10aabc000 dir 1 --- failed
> [ 1151.228898] r8152 4-2.1.2:1.0 ens1u2u1u2: failed tx_urb -11
> [ 1151.234792] xhci_hcd 0000:0a:00.0: swiotlb buffer is full (sz: 8192 bytes), total 32768 (slots), used 16 (slots)
> [ 1151.234852] xhci_hcd 0000:0a:00.0: DMAR: Device bounce map: 11da@10aabc000 dir 1 --- failed
> [ 1151.234882] r8152 4-2.1.2:1.0 ens1u2u1u2: failed tx_urb -11
> 
> etc.
> 
> This happens as soon as I generate any serious amount of outgoing network traffic. E.g. rsyncing files
> to another machine.
> 
> Regards,
> 
> Hans
> 

