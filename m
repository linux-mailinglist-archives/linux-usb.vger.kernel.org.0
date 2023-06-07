Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B26E6726302
	for <lists+linux-usb@lfdr.de>; Wed,  7 Jun 2023 16:39:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241064AbjFGOj1 convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Wed, 7 Jun 2023 10:39:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33386 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240396AbjFGOj1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 7 Jun 2023 10:39:27 -0400
X-Greylist: delayed 357 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 07 Jun 2023 07:39:25 PDT
Received: from voltaic.bi-co.net (voltaic.bi-co.net [134.119.3.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BC2B172E
        for <linux-usb@vger.kernel.org>; Wed,  7 Jun 2023 07:39:25 -0700 (PDT)
Received: from smtpclient.apple (mila-dock.ap.pc2.uni-paderborn.de [131.234.92.213])
        by voltaic.bi-co.net (Postfix) with ESMTPSA id 8E77520BA1;
        Wed,  7 Jun 2023 16:33:26 +0200 (CEST)
Content-Type: text/plain;
        charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.600.7\))
Subject: Re: Cypress CDC ACM serial port not working correctly with
 autosuspend
From:   =?utf-8?Q?Michael_La=C3=9F?= <bevan@bi-co.net>
In-Reply-To: <9f8df0d2-f2af-8e62-fe34-7d826678ac7e@suse.com>
Date:   Wed, 7 Jun 2023 16:33:11 +0200
Cc:     linux-usb@vger.kernel.org, wtogami@gmail.com
Content-Transfer-Encoding: 8BIT
Message-Id: <90A08EC3-74E3-4E11-A6EF-2E7E35CA229B@bi-co.net>
References: <8be9b56c6becd0981d1cd9c13742df6ba2975b56.camel@bi-co.net>
 <0db2a0a4-6ed4-fe06-217a-cb564f1d4a8c@suse.com>
 <bde43a1913cf55e580e77ac0e059fff3c26dc093.camel@bi-co.net>
 <2f98290f-995b-89ff-8ba2-1463fcf78297@suse.com>
 <9a1381abe0e2b605786bc9c3b2daa3f7bdc3b64c.camel@bi-co.net>
 <e977c0e1-4604-47cc-9c53-619bc897d418@suse.com>
 <646eb1bb5218b9ce5df21e89081b09b84dbd46fd.camel@bi-co.net>
 <46e50745-63e4-7e97-739c-338f9a6445d2@suse.com>
 <c93512db198b14ff8892102cfecec3bea8688aaf.camel@bi-co.net>
 <9f8df0d2-f2af-8e62-fe34-7d826678ac7e@suse.com>
To:     Oliver Neukum <oneukum@suse.com>
X-Mailer: Apple Mail (2.3731.600.7)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Sorry, I totally missed responding to your mail in March. Seeing the most recent mails on this topic, let me answer the open questions:

> Am 27.03.2023 um 10:05 schrieb Oliver Neukum <oneukum@suse.com>:
> 
> On 23.03.23 22:32, Michael Laß wrote:
>> Am Donnerstag, dem 23.03.2023 um 14:53 +0100 schrieb Oliver Neukum:
> 
>>> I am asking because the device says that it is bus powered.
>>> That is, are we putting the device into some sleep state?
>> This got me thinking. I am observing the behavior on a ZedBoard, a
>> development board that contains a Xilinx Zynq SoC and the Cypress UART
>> chip connected to that SoC. I now looked into the schematic of that
>> board.
> 
> Are those devices out in the wild? That is can one buy them or did
> you get it through development channels?

Those are development boards for the first generation of Xilinx/AMD Zynq SoCs. The board is still listed in some online shops and should be readily available, however it's now nearly ten years old and probably not used a lot anymore as there are more modern SoCs available by now.

>> The chip is a CY7C64225-28PVXC and the datasheet has a section on USB
>> suspend and resume: When suspended, a separate WAKE input pin has to be
>> set high to issue a remote wake-up. The designers of the ZedBoard have
>> tied this pin to ground...
> 
> That is technically allowed, though disappointing, but then you cannot advertise
> "remote wakeup" in the device descriptor.

Right. Although I'm not sure if the board vendor has any chance to disable advertisement of that feature using that specific chip.

>> So the chip behaves as documented. If any, this is an issue with the
>> board design. Nothing the kernel could work around. Sorry, I hope I
>> haven't stolen too much of your time.
> 
> The kernel could work around it. We could quirk the device to ignore
> the remote wakeup bit from this particular device based on ID.
> RESET_RESUME would do that, albeit with side effects.
> 
> If such devices are found on sale we need to do something.

Seeing that there is now at least a second device suffering from this issue, it's maybe more wide spread than I thought. Introducing the proposed quirk for those chips would of course mean that other devices that use them and implement remote wakeup properly will not be able to make use of auto suspend. But that may be a smaller issue compared to having broken functionality on some devices.

I'll test your proposed patch with my board in the next couple of days.

Best regards,
Michael
