Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6D52A68D16F
	for <lists+linux-usb@lfdr.de>; Tue,  7 Feb 2023 09:26:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229818AbjBGI0M (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Feb 2023 03:26:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229625AbjBGI0L (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Feb 2023 03:26:11 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6D9ACDDE
        for <linux-usb@vger.kernel.org>; Tue,  7 Feb 2023 00:26:06 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id z1so14869493plg.6
        for <linux-usb@vger.kernel.org>; Tue, 07 Feb 2023 00:26:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=connectedcars.dk; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VHx/corE80m1vOV+J8RS9hYh/FKd6muLfNLsIxNrChI=;
        b=kCv1VfBSpRCfXi+YaPxtfDv2knEjfCTmEhBJoQJ4FGilN4xgzYlI503RpKpajMzk6w
         1Szwzzljyjfyw6IrXuKaYOApGzwapd4sIpLONJM1hz6S15rCF3msY0tnPXcEoywDUdU3
         3naLUDm54GQhr6mH7DjMeE3Vb4KDxGGtlthKY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VHx/corE80m1vOV+J8RS9hYh/FKd6muLfNLsIxNrChI=;
        b=ChYKOJ7vhcon7PgWFArV4cn9+sLPe11H17ue4Ea7W5nDi470RMbDSnY2YwgcgcHBFG
         lst8IzXp89wLgUuxNzlL+9qgpIEPSiya//kgJHKfFsUYJrJcfH+wSWnJU1qj6UMHucN3
         cgAdsQdFmDA6Blfn7D9V1PdDqc6aHGWAuB3ckQif6e3o87KMOmr9SmEVjWHotj7fbCJ1
         DouZ+RGYpNIG0/EwcrXZTqxAVt2QAJ7Cx7NKHo/XpIFtKgehfO2nFOyYRxBg+Yfvy1Ws
         84QW+l43rRwg0ND/bC/WNp48mlPlgJ8nRnj0Fdc8Lu3VbPmeJzmzyXtKcc5lhHvDoXFH
         vYyA==
X-Gm-Message-State: AO0yUKUJMSUKYCm09sB4+0xqETbsoxlVLm/TnP45EhN6lxmf/uLnG0/I
        bzxlrj0qY2Oc3TUJH171Eru1wYqtBq+91lDlkw0wFMZ0I4MhOTqF80A=
X-Google-Smtp-Source: AK7set+Zuze669v/fYp4QaV/OiSXPsOYN0h+AgGW/HO9MyXKeXOtZw0/vPCpNlPp1KkYwYshrgBqIcEbmULfxRHCafI=
X-Received: by 2002:a17:902:7fc1:b0:199:38a:aff4 with SMTP id
 t1-20020a1709027fc100b00199038aaff4mr557746plb.4.1675758366316; Tue, 07 Feb
 2023 00:26:06 -0800 (PST)
MIME-Version: 1.0
References: <CAHHqYPMHBuPZqG9Rd9i+hN9Mq89pRn6M_0PLsyWkcK_hZr3xAA@mail.gmail.com>
 <Y9Jwv1ColWNwH4+0@kroah.com> <CAHHqYPONhyKrqMWiw29TRETtiBatNaej8+62Z40fvuj3LX4RWQ@mail.gmail.com>
 <Y9J8VncWSJdVURgB@kroah.com> <CAHHqYPO_A=7V_8Z-qrGy0-eOkPEpyv+vU_8Jpz-ABGg60t244w@mail.gmail.com>
 <Y9KnnH+5O6MtO6kz@rowland.harvard.edu> <CAHHqYPNtVkHoiX1LrxUDa32BgVsgymcPtKVODcVGxEh2f=tYRw@mail.gmail.com>
 <Y9P2tvPkdwHrbPXd@rowland.harvard.edu> <CAHHqYPPWvxMvSU=HMS9C2aPk08j25MBKXS7XC6im5_oz_nXTuw@mail.gmail.com>
 <Y9l85PAcc/i/tgnS@rowland.harvard.edu> <Y9mAYH7L/CcTTSw6@kroah.com>
In-Reply-To: <Y9mAYH7L/CcTTSw6@kroah.com>
From:   Troels Liebe Bentsen <troels@connectedcars.dk>
Date:   Tue, 7 Feb 2023 09:25:55 +0100
Message-ID: <CAHHqYPOkj3oJseEwD3=66zck1LGJGo3DD77cG0E8_GNp3EEDUw@mail.gmail.com>
Subject: Re: All USB tools hang when one descriptor read fails and needs to timeout
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi again,

Did a bit more testing and found another lock that would be nice to remove,
the /dev/bus/usb/$BUS/$DEV file for the hub is also locked:

Bus 003 Device 016: ID 1a40:0201 Terminus Technology Inc. FE 2.1 7-port Hub

strace lsusb -v
...
openat(AT_FDCWD, "/dev/bus/usb/003/016", O_RDWR|O_CLOEXEC...

The openat can not be canceled from userspace and even kill -9 won't stop
the process until the descriptor read times out.

Regards Troels

On Tue, 31 Jan 2023 at 21:56, Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Jan 31, 2023 at 03:41:08PM -0500, Alan Stern wrote:
> > On Tue, Jan 31, 2023 at 04:59:36PM +0100, Troels Liebe Bentsen wrote:
> > > On Fri, 27 Jan 2023 at 17:07, Alan Stern <stern@rowland.harvard.edu> wrote:
> > > > Now that I know the config descriptors won't get reallocated after all,
> > > > I can remove the locking from the descriptors file entirely.  A patch to
> > > > do this is below.  It ought to fix your problem.  Try it and see.
> > >
> > > Thank you very much, I built a new kernel with the patch and can confirm
> > > that it fixes my issue.
> > >
> > > Will the patch make it into any of the LTS kernels as it could seem like a
> > > bugfix depending on how you look at it or is it only destined mainline, fx. 6.2
> > > or 6.3?
> >
> > I don't know.  I will submit it for the -stable kernels, but the
> > decision on whether to accept it will be up to Greg KH.
>
> I'll backport it, as it can help out with systems as Troels said.  But
> will wait until 6.3-rc1 is out as this should get some testing.
>
> thanks,
>
> greg k-h
