Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 55DC9228807
	for <lists+linux-usb@lfdr.de>; Tue, 21 Jul 2020 20:15:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727873AbgGUSPT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 21 Jul 2020 14:15:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726763AbgGUSPR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 21 Jul 2020 14:15:17 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC38BC0619DA
        for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2020 11:15:16 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id l17so22379490iok.7
        for <linux-usb@vger.kernel.org>; Tue, 21 Jul 2020 11:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kryo-se.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KVVjAkfV64YN+ezW1WM+0vgwvcTru6dPfbG6aGenKT0=;
        b=ntLBN0rv0yoHIQrjDgVhIvFKkRwg+qM35RkR6fj4PRMEEJpltk9LVVY6yGguLoR0K9
         2JOn5virYAQ8jtWOhvP2RJ7yXsZAzJJcnTrsi76cqMqIKle9CyAgzKrmJYhnl3W80Ofh
         yTujC6GqoRvcPH9ZzX+O4EK/HMyYcBc0QW97+rL1HwLkqu05WgfyolB805OyY0zYTsJq
         Wp499ujZ3q0VMxpwaHbNo9OrJrPqw/PG6abWAgdKIL/Ogscu5Or3BLU4z+UI58WkQSkd
         twar/kG6hnVA9Bv3brUAEGqB9P2RC+AAC1Rs3gBwKuS7ps5TBRMdUoA3k5s82vjG4/cG
         2stA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KVVjAkfV64YN+ezW1WM+0vgwvcTru6dPfbG6aGenKT0=;
        b=F2bWRTe1loOZFKfuObSbqK5FQUVT/eMcmOC+U56ilm/qNZA7VA1mpmJPCgaszPql3G
         ewtnBaABo9LuZe3j3zRYs46rkeE23DaL1h/ass71w1UIztSkSCwm5JDEZm3zzjNc6uvC
         dpicFOQtfo67v2bwy3XK5E4bGmMVEP/92d5wPoV7Z72dMc1wkN8WwoVE6WLwZuWAVXWH
         Zc8XM5SdyIZCiLjpR7h05TrP++pFh7/fiKknMaEwDUoyUXVw0+w0lEDgMIpnCZJ0cG4k
         QDtCYFhdNB6apV58KC3oHsP09vaMQOsVPUwsUyY8AfAJVacVL7MoUfASQwzNEnOQjDo+
         tU3w==
X-Gm-Message-State: AOAM531jFIe1zRORGlLyXjGvC5gsJlyTLjLLQjgOog7c5R+WHXmCfGrN
        cdY0u0ZKQcqk7LjgF1SqrWwu9fCWZonS/4r7/q7Bosp7IdXARP0d
X-Google-Smtp-Source: ABdhPJzGSU5xLvuoSn4Yd8vIZFCiJApcxv1zTfxLAkR3tvZgCVnsFrc4C6sc0qqNh4MJy2EEPxAQU7f2t+4VvayFU6A=
X-Received: by 2002:a05:6602:148f:: with SMTP id a15mr29521465iow.26.1595355315409;
 Tue, 21 Jul 2020 11:15:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200717185118.3640219-1-erik@kryo.se> <20200721072350.GC3634@localhost>
In-Reply-To: <20200721072350.GC3634@localhost>
From:   Erik Ekman <erik@kryo.se>
Date:   Tue, 21 Jul 2020 20:15:04 +0200
Message-ID: <CAGgu=sDBemKU4vzg5xWyWT-OoDuXrxXp2tkB5OOmNW6ncDjpow@mail.gmail.com>
Subject: Re: [PATCH] USB: serial: qcserial: add EM7305 QDL product ID
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, 21 Jul 2020 at 09:23, Johan Hovold <johan@kernel.org> wrote:
>
> On Fri, Jul 17, 2020 at 08:51:18PM +0200, Erik Ekman wrote:
> > When running qmi-firmware-update on the Sierra Wireless EM7305 in a Toshiba
> > laptop, it changed product ID to 0x9062 when entering QDL mode:
> >
> > usb 2-4: new high-speed USB device number 78 using xhci_hcd
> > usb 2-4: New USB device found, idVendor=1199, idProduct=9062, bcdDevice= 0.00
> > usb 2-4: New USB device strings: Mfr=1, Product=2, SerialNumber=0
> > usb 2-4: Product: EM7305
> > usb 2-4: Manufacturer: Sierra Wireless, Incorporated
> >
> > The upgrade could complete after running
> >  # echo 1199 9062 > /sys/bus/usb-serial/drivers/qcserial/new_id
> >
> > qcserial 2-4:1.0: Qualcomm USB modem converter detected
> > usb 2-4: Qualcomm USB modem converter now attached to ttyUSB0
> >
> > Signed-off-by: Erik Ekman <erik@kryo.se>
>
> Applied, thanks.
>
> Would you mind posting the output of "usb-devices" (or "lsusb -v") for
> this device for completeness?
>
(resend as plain text)

from usb-devices:

T:  Bus=02 Lev=01 Prnt=01 Port=03 Cnt=03 Dev#= 30 Spd=480 MxCh= 0
D:  Ver= 2.00 Cls=00(>ifc ) Sub=00 Prot=00 MxPS=64 #Cfgs=  1
P:  Vendor=1199 ProdID=9062 Rev=00.00
S:  Manufacturer=Sierra Wireless, Incorporated
S:  Product=EM7305
C:  #Ifs= 1 Cfg#= 1 Atr=80 MxPwr=2mA
I:  If#=0x0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=ff Driver=(none)

and with the driver it instead ends with:
I:  If#=0x0 Alt= 0 #EPs= 2 Cls=ff(vend.) Sub=ff Prot=ff Driver=qcserial
as expected.

Cheers
/Erik

>
> Johan
