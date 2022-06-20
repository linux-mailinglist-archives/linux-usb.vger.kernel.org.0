Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56EE8551643
	for <lists+linux-usb@lfdr.de>; Mon, 20 Jun 2022 12:52:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239937AbiFTKwM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 20 Jun 2022 06:52:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236095AbiFTKwL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 20 Jun 2022 06:52:11 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3CA461180E
        for <linux-usb@vger.kernel.org>; Mon, 20 Jun 2022 03:52:10 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-3177f4ce3e2so72482617b3.5
        for <linux-usb@vger.kernel.org>; Mon, 20 Jun 2022 03:52:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vRs5UGEXEzBo3vG7lnGD6TGHEOqRmaEfAKh1aM6DlP0=;
        b=DWaid7byzlDqg5B87caOqpST81kvUsChUOMj/pf15t0N8V881eQHnCkR7aPGAIKd/6
         A2q14V7jH4+kuiJuJTlih7Dvtjh0p5qSpTS5QGUJIVJg5RnBDferUlXYx32OrETFcKP2
         1MiWJ+kFaeStmM/LJd6lOVs5axaSrL7BcmeAQY20AHskAl5BoV3pf+o5QcmiTTEhsN+x
         /y0E7USAqz/XqWOmc7j6WyzHDaHeqir3iCCqhCeTXQVNGbGopIAhh7qee6gZe3R2/OG0
         XtZsLJUYKnPqOJQ6zGjYAvuIGNTcXgVb6gbpRgvcxpnJxBLjn63dYMgvuY2qWI086t6S
         P7RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vRs5UGEXEzBo3vG7lnGD6TGHEOqRmaEfAKh1aM6DlP0=;
        b=roui/mwwRvMeFuH+DYcjEGG+0TnG/pHmdAcSG3wosstkEd0bXj5pZnrHpkAyuwJJc7
         fR1lC/x35VBtAVMKmEKrU7fkKpsXUtI3SUIOXIw/MoshWIHFFnMb1/P79PII9vV4DmYZ
         LZgSqbmHM4N6+7nA2yGnnyBb6odor14B00mpMFmkvpxTtptk5Oy0weRnV7FxUdah9kHB
         vblj+VhkllQy3t2efYGFi0cSFlHftbFi/qORRN68EfXfEd2wwkf26OjRYm7H/dYhlT15
         nIECk6cRGDpkzV+DR9bq9s7TeUcnBi4rUsYKjeylWCphO/6kO6aboQwPDqj4o/ORDidH
         j/Aw==
X-Gm-Message-State: AJIora+0MEY5jjXI+3a9hQt7PtDivBxFxHyUgEUIDzIvxJt3a+vtv4U5
        p1koAvkbucHEh5h55GSXzBl2D+UuaHjGoBiQzM8=
X-Google-Smtp-Source: AGRyM1tW0uu5HDj7qZ8ESXeFMDaPOGzjwDkbhJFSiqPKSYTs8ix1JyGB6NtXYslA4PaGbYH4oQen5Mvvtb7FgP+H4NI=
X-Received: by 2002:a81:a0c5:0:b0:317:323b:64fe with SMTP id
 x188-20020a81a0c5000000b00317323b64femr26515020ywg.292.1655722329407; Mon, 20
 Jun 2022 03:52:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220617133514.357-1-charlesyeh522@gmail.com> <YrBARs5dfARHW9Rl@hovoldconsulting.com>
In-Reply-To: <YrBARs5dfARHW9Rl@hovoldconsulting.com>
From:   Charles Yeh <charlesyeh522@gmail.com>
Date:   Mon, 20 Jun 2022 18:51:58 +0800
Message-ID: <CAAZvQQ4iHB44=Ug7o+=ZqzTCYSM3igSwfi1xBUGqJS1ChzcbUw@mail.gmail.com>
Subject: Re: [PATCH] USB: serial: pl2303: Modify the detection method of
 PL2303HXN (TYPE_HXN)
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
        =?UTF-8?B?WWVoLkNoYXJsZXMgW+iRieamrumRq10=?= 
        <charles-yeh@prolific.com.tw>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> > The setting value of bcdUSB & bcdDevice of PL2303TA is the same as the
> > setting value of bcdUSB & bcdDevice of a certain chip of PL2303HXN
>
> Which ones would that be?

PL2303GT_R4 (chip version: v4) is the same as PL2303TA.

PL2303TA:
Bus 003 Device 002: ID 067b:2303 Prolific Technology, Inc. PL2303
Serial Port / Mobile Action MA-8910P
Couldn't open device, some information will be missing
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            0
  bDeviceSubClass         0
  bDeviceProtocol         0
  bMaxPacketSize0        64
  idVendor           0x067b Prolific Technology, Inc.
  idProduct          0x2303 PL2303 Serial Port / Mobile Action MA-8910P
  bcdDevice            3.00
  iManufacturer           1 Prolific Technology Inc.
  iProduct                2 USB-Serial Controller
  iSerial                 0
  bNumConfigurations      1


PL2303GT_R4 (chip version: v4)
Bus 001 Device 005: ID 067b:23c3 Prolific Technology, Inc. USB-Serial Controller
Couldn't open device, some information will be missing
Device Descriptor:
  bLength                18
  bDescriptorType         1
  bcdUSB               2.00
  bDeviceClass            0
  bDeviceSubClass         0
  bDeviceProtocol         0
  bMaxPacketSize0        64
  idVendor           0x067b Prolific Technology, Inc.
  idProduct          0x23c3
  bcdDevice            3.00
  iManufacturer           1 Prolific Technology Inc.
  iProduct                2 USB-Serial Controller
  iSerial                 3 BGEK6178R45
  bNumConfigurations      1


> > The setting value of bcdUSB & bcdDevice of PL2303TB is the same as the
> > setting value of bcdUSB & bcdDevice of a certain chip of PL2303HXN
>
> Same question here.

PL2303GE_R4 (chip version: v4) is the same as PL2303TB.


> Could you provide a list of the bcdDevice you use for the various HXN
> types instead?

I also hope to have a complete list of all HXN versions..
But it is difficult.. I use PL2303GT as an example.
PL2303GT is currently divided into PL2303GT_R4 / PL2303GT_R5 / PL2303GT_R5+

PL2303GT_R4  : idProduct : 0x23C3, bcdDevice: 0x0300
PL2303GT_R5  : idProduct : 0x23C3, bcdDevice: 0x0305
PL2303GT_R5+ : idProduct : 0x23A3, bcdDevice: 0x0305

The above three kinds of PL2303GT are currently available in the market.

From the bcdUSB & bcdDevice of PL2303GT_R4, it is the same as PL2303TA.
So it needs to be checked again with hx_status check.

As mentioned earlier, some HXNs are currently on sale,
and some HXN versions are coming out (bcdDevice will have other settings),
HXN cannot use bcdDevice to determine the type one by one.


Charles.
