Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76101526587
	for <lists+linux-usb@lfdr.de>; Fri, 13 May 2022 17:01:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349482AbiEMPBU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 13 May 2022 11:01:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381680AbiEMO72 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 13 May 2022 10:59:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 60FEC419B2
        for <linux-usb@vger.kernel.org>; Fri, 13 May 2022 07:58:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652453921;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xTndKyW4QO52+k2wJhA2YKeGULKQ6aqYmun80CLmluE=;
        b=LmnBl7wMUCFFLV648suqnlPCOLdrCKFkeCaQ4raG5yJPx58jWmIChuDikmdM5GsJ1If/Jq
        4930Z7rwzTi1a2x4bNlP5rJ09KSzwkLRJFbV+WXEW7qM1KtoWIsG0FkWFgpwizAVFToC73
        at48M8b/yqt+//ai2LdwYwsBJQtfHgQ=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-191-e6ukS4KUP_mDVLH11N6cJw-1; Fri, 13 May 2022 10:58:39 -0400
X-MC-Unique: e6ukS4KUP_mDVLH11N6cJw-1
Received: by mail-qv1-f70.google.com with SMTP id j1-20020a0cf9c1000000b0045abd139f01so6994633qvo.23
        for <linux-usb@vger.kernel.org>; Fri, 13 May 2022 07:58:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xTndKyW4QO52+k2wJhA2YKeGULKQ6aqYmun80CLmluE=;
        b=CQM4o2jBPQCn0juWK2K/HW0ehmkikz00HqW2yRme0MXXYYnkb6yl2dPvVu3i8Z0TbX
         BtxYg5T7FEi9JLdkyrPGVNYbCOgxVpkFumbju40CZQ0m4rPz7qnNmBYB5nscod5/4451
         Yqr0kTF0nuKoflotun2l5SljhmlIffEMWJvFL6dMr0Ilfjl+k2u9fdJgJQxlYuZDVJrv
         Hv47JU3yAvb7ojDsTZG6gIvrDUbZSFnxHkFQ0FqovJrZiYhZM6xBW3MtdP1Dly6yXGmy
         mzHZP3lReywfX6ETpebH4QpFa7Wk/ur0YxkCPt25dmdxqXF8p4IrHQQNSA9/JRLAVn6z
         m61A==
X-Gm-Message-State: AOAM530//Ar0wA/zfbmXQfSnJqQAFrfflzP8h09MzP3XcGL9epAjib9Z
        uYhgOq6OzON4t6F0xiLbDLrr7h29sEYbmlGX2Lu+TY7ZiAw/tA6EOoqhm3By/FvpRNgzes5Ep2w
        fNyEl7NWYSxWIERomjwqIfIHYfvkpWuvSFrQV
X-Received: by 2002:a37:be06:0:b0:6a1:429:a49f with SMTP id o6-20020a37be06000000b006a10429a49fmr3945146qkf.6.1652453919229;
        Fri, 13 May 2022 07:58:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbBbYRBYt6TxfaB/9LMlPcbOMoV25ksWNOVTbINt5ZTueCWYbbbRvpkZDcOzoSV2fS70YRwikWyrz6n2S2RSI=
X-Received: by 2002:a37:be06:0:b0:6a1:429:a49f with SMTP id
 o6-20020a37be06000000b006a10429a49fmr3945132qkf.6.1652453918999; Fri, 13 May
 2022 07:58:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220504151647.471885-1-jtornosm@redhat.com> <Ynzz6Jh5OeEikvfh@kroah.com>
 <CABk-BGte9qHwmdqCU6oZ9-E3LvOqcMf3z46e00hypNdD_hPxPQ@mail.gmail.com>
 <Yn5mliJq+7W8khe9@rowland.harvard.edu> <Yn5nc2mSHrdy/8h6@kroah.com>
 <Yn5qerFAcHP3scAZ@rowland.harvard.edu> <Yn5vS3cA4qP3MXfV@kroah.com>
In-Reply-To: <Yn5vS3cA4qP3MXfV@kroah.com>
From:   Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Date:   Fri, 13 May 2022 16:58:28 +0200
Message-ID: <CABk-BGshsdCNKAYa2NscR=uZKK1_JeFb+FNTthdGNsFLkzQ=Tw@mail.gmail.com>
Subject: Re: [PATCH v5] USB: core: skip unconfiguration if device doesn't
 support it
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
        Marcel Holtmann <marcel@holtmann.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

>> Come to think of it, maybe there is a simple workaround.  If userspace
>> resets the device after it is unconfigured, there's a good chance that
>> will get it to start working again.  Jose, can you try this?  There is a
>> usbreset program you can use, floating around on the web.  (Greg, did
>> that program or something like it ever get added to the usbutils
>> package?)

> Yes, it is in the usbutils package.  I don't think many distros package
> the prebuilt binary, but the .c file can be found here:
>        https://github.com/gregkh/usbutils/blob/master/usbreset.c

Of course, I can also try that way and I will comment on the result.
I would like to identify in some way, I have some ideas related to the
initial configuration but I have to research more.
If not possible, if there is a user workaround like this, it would be great=
.

Thank you very much

Jos=C3=A9 Ignacio

On Fri, May 13, 2022 at 4:46 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Fri, May 13, 2022 at 10:26:02AM -0400, Alan Stern wrote:
> > On Fri, May 13, 2022 at 04:13:07PM +0200, Greg KH wrote:
> > > On Fri, May 13, 2022 at 10:09:26AM -0400, Alan Stern wrote:
> > > > On Fri, May 13, 2022 at 11:50:26AM +0200, Jose Ignacio Tornos Marti=
nez wrote:
> > > > > Ok, I will try to identify the "bad" devices in some way.
> > > > >
> > > > > Thanks
> > > > >
> > > > > Jos=C3=A9 Ignacio
> > > > >
> > > > >
> > > > > On Thu, May 12, 2022 at 1:48 PM Greg KH <gregkh@linuxfoundation.o=
rg> wrote:
> > > > > >
> > > > > > I'll drop this for now as there are no in-kernel users for this=
 quirk
> > > > > > yet.  When there is a need for one, please resubmit it.
> > > >
> > > > Hold on; Greg's comment doesn't seem fair.  There are no in-kernel
> > > > users for this quirk because it is meant to be a user API.  (Just a=
s
> > > > there are no in-kernel users for read(2) -- it is there so that
> > > > userspace can call it).
> > >
> > > True, but the kernel calls read(2) itself as well in places, it just
> > > looks a bit different, kernel_read_file()  :)
> >
> > Okay, but you get the point.  :-)
> >
> > > > Jose does have users for the new quirk: Anybody with one of the bad
> > > > Bluetooth CSR knockoff chips.  Now I agree; it would be great if th=
ere
> > > > was some way to identify them automatically.  But if that's not
> > > > possible, the only alternative is to allow userspace to set the qui=
rk
> > > > flag whenever it knows the quirk is needed.
> > >
> > > Is that the case here that we know how to identify this?  I thought
> > > Marcel said something else was happening here.
> > >
> > > If the bluetooth developers/maintainers say this is needed for some
> > > devices to work properly and they will be handled in userspace someho=
w
> > > through a udev rule or the like, I will gladly add this.  But I thoug=
ht
> > > this thread died out as it was determined that this wasn't needed at
> > > this point in time which is why I dropped it.
> >
> > It's kind of an odd situation.  In ordinary usage the device works okay=
.
> > But it stops working after it has been exported over usbip; that is wha=
t
> > Jose wants to fix.
> >
> > Come to think of it, maybe there is a simple workaround.  If userspace
> > resets the device after it is unconfigured, there's a good chance that
> > will get it to start working again.  Jose, can you try this?  There is =
a
> > usbreset program you can use, floating around on the web.  (Greg, did
> > that program or something like it ever get added to the usbutils
> > package?)
>
> Yes, it is in the usbutils package.  I don't think many distros package
> the prebuilt binary, but the .c file can be found here:
>         https://github.com/gregkh/usbutils/blob/master/usbreset.c
>

