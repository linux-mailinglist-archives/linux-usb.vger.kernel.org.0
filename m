Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3A39552A40D
	for <lists+linux-usb@lfdr.de>; Tue, 17 May 2022 15:59:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348146AbiEQN7J (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 May 2022 09:59:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52430 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345358AbiEQN6y (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 May 2022 09:58:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 407F13C4A1
        for <linux-usb@vger.kernel.org>; Tue, 17 May 2022 06:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652795932;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ukeO+chojejO5U66l0m6Ah065bZNkB6pLCe+hSam94Q=;
        b=YRUf8F2s54VALEemvWXHEImUstp+0Uq6qklZ5dpC/g7BDfEwteF1bICsCfHCPIEYfLA+0q
        qML5ByN6MCyYk75Qpi/mTadlu8aLVFpZ3MfjyBSr/cYC3nykqGjzkSXYYaKI7X4oZmXX2O
        1q1JTMTFhqA7Ku9Sz2Udx5kgBB1N1BM=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-fEBvWjBhNX2cKWkxSXjGhg-1; Tue, 17 May 2022 09:58:51 -0400
X-MC-Unique: fEBvWjBhNX2cKWkxSXjGhg-1
Received: by mail-qt1-f199.google.com with SMTP id m6-20020ac866c6000000b002f52f9fb4edso9811232qtp.19
        for <linux-usb@vger.kernel.org>; Tue, 17 May 2022 06:58:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=ukeO+chojejO5U66l0m6Ah065bZNkB6pLCe+hSam94Q=;
        b=F6UrpE8LblI+At9QxvZjz5U436TW2ul74wjL4WzlaqHFPH0KXLcq+XHIwBao1AmtCY
         8EVEy8NIXzR+lXu8gVwp3/PGOB4Jm7AydG+uPLUvexC26t7JVm3vusxcgDPe++uqE3Zh
         LJiTCTiQs8kyx9avqBOjj+pfQuGxlSUvWJaGW+CpPuBz7tu28TBWibfJrC4Xl6LYS2yH
         PUXA6J0OSFDYfs6l2KK1J3LvvEukZLVe/rRJAgFPstXCyZSOLA01HvOOysghY7BZ0Xrr
         whx6Msh2aOmMF7vPyQlow4UykEdbPROYFBan3V+nl+K3BpCgd3NPESLkXbmfp8ueuruX
         mPDw==
X-Gm-Message-State: AOAM530fOSB/h0ZA0KDbMxoe9JCIYaoySugez1tSbXsP1yYtI2J/s+bW
        3nmt0InLBW0WDSNhNBuUmS3VYDwTD9oYlv69Z26+BM6akiQ/lTW/3pr5ZoLja3m/+C4/ID7mEJT
        LOXj7mZj/YRyJ/M0lGWv7Vd0mhE4pHIYlSran
X-Received: by 2002:a05:622a:1a90:b0:2f3:bb56:5a1d with SMTP id s16-20020a05622a1a9000b002f3bb565a1dmr20118410qtc.127.1652795930439;
        Tue, 17 May 2022 06:58:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2zBodzxHa33jTBL+UZf9iNv8rDUEnYwNDL0n44EjWpIL8v21zxIkEcOLfUSfa5FNtcd/EnSPgKvYvJ57XxPw=
X-Received: by 2002:a05:622a:1a90:b0:2f3:bb56:5a1d with SMTP id
 s16-20020a05622a1a9000b002f3bb565a1dmr20118376qtc.127.1652795930021; Tue, 17
 May 2022 06:58:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220504151647.471885-1-jtornosm@redhat.com> <Ynzz6Jh5OeEikvfh@kroah.com>
 <CABk-BGte9qHwmdqCU6oZ9-E3LvOqcMf3z46e00hypNdD_hPxPQ@mail.gmail.com>
 <Yn5mliJq+7W8khe9@rowland.harvard.edu> <Yn5nc2mSHrdy/8h6@kroah.com>
 <Yn5qerFAcHP3scAZ@rowland.harvard.edu> <Yn5vS3cA4qP3MXfV@kroah.com> <CABk-BGshsdCNKAYa2NscR=uZKK1_JeFb+FNTthdGNsFLkzQ=Tw@mail.gmail.com>
In-Reply-To: <CABk-BGshsdCNKAYa2NscR=uZKK1_JeFb+FNTthdGNsFLkzQ=Tw@mail.gmail.com>
From:   Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Date:   Tue, 17 May 2022 15:58:38 +0200
Message-ID: <CABk-BGsnx9UdC1cMninPNAhxAnnAdh-xoT7=4WKOwZ-8A9LyeQ@mail.gmail.com>
Subject: Re: [PATCH v5] USB: core: skip unconfiguration if device doesn't
 support it
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org,
        Marcel Holtmann <marcel@holtmann.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I have been trying to identify the chips that I have in some way, but
as I do not have a big sampling or more information, it is difficult.
And I have verified again the datasheets for CSR (Qualcomm) and they
do not comment anything related to the problem.

All the devices contain this information:
manufacturer 10
hci_rev 22bb
lmp_subver 22bb
hci_ver 6 (BLUETOOTH_VER_4_0)
And two of them contain bcdDevice=3D88.91 (Trust and unknown) and the
other 75.58 (EDR)
Following the code and comments to detect fakes in btusb.c, the
devices are correct although it comments that 0x7558, 0x8891 are known
fake bcdDevices.
In fact, the unconfigure issue is the only problem that I have found.

So, I think the only solution, at least to be able to work, would be
to add the user quirk with the patch.
Of course, if you consider.

Thanks again

Best regards
Jos=C3=A9 Ignacio

On Fri, May 13, 2022 at 4:58 PM Jose Ignacio Tornos Martinez
<jtornosm@redhat.com> wrote:
>
> >> Come to think of it, maybe there is a simple workaround.  If userspace
> >> resets the device after it is unconfigured, there's a good chance that
> >> will get it to start working again.  Jose, can you try this?  There is=
 a
> >> usbreset program you can use, floating around on the web.  (Greg, did
> >> that program or something like it ever get added to the usbutils
> >> package?)
>
> > Yes, it is in the usbutils package.  I don't think many distros package
> > the prebuilt binary, but the .c file can be found here:
> >        https://github.com/gregkh/usbutils/blob/master/usbreset.c
>
> Of course, I can also try that way and I will comment on the result.
> I would like to identify in some way, I have some ideas related to the
> initial configuration but I have to research more.
> If not possible, if there is a user workaround like this, it would be gre=
at.
>
> Thank you very much
>
> Jos=C3=A9 Ignacio
>
> On Fri, May 13, 2022 at 4:46 PM Greg KH <gregkh@linuxfoundation.org> wrot=
e:
> >
> > On Fri, May 13, 2022 at 10:26:02AM -0400, Alan Stern wrote:
> > > On Fri, May 13, 2022 at 04:13:07PM +0200, Greg KH wrote:
> > > > On Fri, May 13, 2022 at 10:09:26AM -0400, Alan Stern wrote:
> > > > > On Fri, May 13, 2022 at 11:50:26AM +0200, Jose Ignacio Tornos Mar=
tinez wrote:
> > > > > > Ok, I will try to identify the "bad" devices in some way.
> > > > > >
> > > > > > Thanks
> > > > > >
> > > > > > Jos=C3=A9 Ignacio
> > > > > >
> > > > > >
> > > > > > On Thu, May 12, 2022 at 1:48 PM Greg KH <gregkh@linuxfoundation=
.org> wrote:
> > > > > > >
> > > > > > > I'll drop this for now as there are no in-kernel users for th=
is quirk
> > > > > > > yet.  When there is a need for one, please resubmit it.
> > > > >
> > > > > Hold on; Greg's comment doesn't seem fair.  There are no in-kerne=
l
> > > > > users for this quirk because it is meant to be a user API.  (Just=
 as
> > > > > there are no in-kernel users for read(2) -- it is there so that
> > > > > userspace can call it).
> > > >
> > > > True, but the kernel calls read(2) itself as well in places, it jus=
t
> > > > looks a bit different, kernel_read_file()  :)
> > >
> > > Okay, but you get the point.  :-)
> > >
> > > > > Jose does have users for the new quirk: Anybody with one of the b=
ad
> > > > > Bluetooth CSR knockoff chips.  Now I agree; it would be great if =
there
> > > > > was some way to identify them automatically.  But if that's not
> > > > > possible, the only alternative is to allow userspace to set the q=
uirk
> > > > > flag whenever it knows the quirk is needed.
> > > >
> > > > Is that the case here that we know how to identify this?  I thought
> > > > Marcel said something else was happening here.
> > > >
> > > > If the bluetooth developers/maintainers say this is needed for some
> > > > devices to work properly and they will be handled in userspace some=
how
> > > > through a udev rule or the like, I will gladly add this.  But I tho=
ught
> > > > this thread died out as it was determined that this wasn't needed a=
t
> > > > this point in time which is why I dropped it.
> > >
> > > It's kind of an odd situation.  In ordinary usage the device works ok=
ay.
> > > But it stops working after it has been exported over usbip; that is w=
hat
> > > Jose wants to fix.
> > >
> > > Come to think of it, maybe there is a simple workaround.  If userspac=
e
> > > resets the device after it is unconfigured, there's a good chance tha=
t
> > > will get it to start working again.  Jose, can you try this?  There i=
s a
> > > usbreset program you can use, floating around on the web.  (Greg, did
> > > that program or something like it ever get added to the usbutils
> > > package?)
> >
> > Yes, it is in the usbutils package.  I don't think many distros package
> > the prebuilt binary, but the .c file can be found here:
> >         https://github.com/gregkh/usbutils/blob/master/usbreset.c
> >

