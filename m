Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1B29651C5AC
	for <lists+linux-usb@lfdr.de>; Thu,  5 May 2022 19:04:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243295AbiEERIP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 May 2022 13:08:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240110AbiEERIO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 May 2022 13:08:14 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 62E5B2BA
        for <linux-usb@vger.kernel.org>; Thu,  5 May 2022 10:04:34 -0700 (PDT)
Received: (qmail 12271 invoked by uid 1000); 5 May 2022 13:04:33 -0400
Date:   Thu, 5 May 2022 13:04:33 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Cc:     Oliver Neukum <oneukum@suse.com>,
        Marcel Holtmann <marcel@holtmann.org>,
        Jose Ignacio Tornos Martinez <jtornosm@redhat.com>,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v4] USB: core: skip unconfiguration if device doesn't
 support it
Message-ID: <YnQDoc0JETR3KA8A@rowland.harvard.edu>
References: <20220504083612.143463-1-jtornosm@redhat.com>
 <6A6E8A20-1994-44AD-981A-C8CF472541AC@holtmann.org>
 <15f82796-fa82-fa26-ed38-f0785f39f87e@suse.com>
 <87levgkyjy.fsf@miraculix.mork.no>
 <YnPb04ynkSTlhg4H@rowland.harvard.edu>
 <875ymkknqy.fsf@miraculix.mork.no>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <875ymkknqy.fsf@miraculix.mork.no>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, May 05, 2022 at 05:22:45PM +0200, Bjørn Mork wrote:
> Alan Stern <stern@rowland.harvard.edu> writes:
> 
> > Please pardon me for butting in, but I don't see how this tests the 
> > condition that Jose is worried about.
> ..
> > And presumably the device is working again.  However, none of this shows 
> > what happens when the device is unconfigured.  To test that, you would 
> > have to do:
> >
> > 	echo 0 >/sys/bus/usb/devices/1-8/bConfigurationValue
> > 	echo 1 >/sys/bus/usb/devices/1-8/bConfigurationValue
> >
> > and then see if the device continues to work.
> 
> Ah, sorry. Scanned briefly, saw "bind", and assumed too much.  Making an
> ass out of... you know.
> 
> Actually I didn't understand the part about unconfiguration since I
> can't see how that would happen during normal usage?  Anyway,

Jose was exporting his device over usbip, which perhaps does not count 
as "normal" usage.

> unconfiguring also works for me:
> 
> canardo:/tmp# hciconfig hci0
> hci0:   Type: Primary  Bus: USB
>         BD Address: 00:1A:7D:DA:71:15  ACL MTU: 310:10  SCO MTU: 64:8
>         UP RUNNING 
>         RX bytes:660 acl:0 sco:0 events:43 errors:0
>         TX bytes:2178 acl:0 sco:0 commands:43 errors:0
> 
> canardo:/tmp# echo 0 >/sys/bus/usb/devices/1-8/bConfigurationValue
> canardo:/tmp# hciconfig hci0
> Can't get device info: No such device
> canardo:/tmp# echo 1 >/sys/bus/usb/devices/1-8/bConfigurationValue
> 
> 
> Not entirely sure how to validate that "everything" works at this point?

If it weren't, you would know.  Error messages would have shown up at 
this point.

> I can use the rfcomm session the adapter usually handles and also run
> lescan after this.  So I guess both BLE and BDR works.
> 
> And the counters count something:
> 
> canardo:/tmp# hciconfig hci0
> hci0:   Type: Primary  Bus: USB
>         BD Address: 00:1A:7D:DA:71:15  ACL MTU: 310:10  SCO MTU: 64:8
>         UP RUNNING 
>         RX bytes:3883 acl:40 sco:0 events:81 errors:0
>         TX bytes:2518 acl:19 sco:0 commands:50 errors:0
> 
> 
> I can see an error like this logged every time I unconfigure the device:
> 
> Bluetooth: hci0: urb 00000000e66a2492 failed to resubmit (2)

That's normal.  The driver probably could avoid giving that error 
message under these circumstances, but it's not a big deal.

> There is nothing else logged in kernel log

Okay, thanks for testing.

Alan Stern
