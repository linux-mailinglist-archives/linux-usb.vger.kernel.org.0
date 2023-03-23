Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5F516C725D
	for <lists+linux-usb@lfdr.de>; Thu, 23 Mar 2023 22:32:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbjCWVcc convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 23 Mar 2023 17:32:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49894 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229877AbjCWVcb (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Mar 2023 17:32:31 -0400
Received: from voltaic.bi-co.net (voltaic.bi-co.net [134.119.3.22])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 979C4BDC9
        for <linux-usb@vger.kernel.org>; Thu, 23 Mar 2023 14:32:29 -0700 (PDT)
Received: from [192.168.0.36] (ip-037-201-145-251.um10.pools.vodafone-ip.de [37.201.145.251])
        by voltaic.bi-co.net (Postfix) with ESMTPSA id A5BF320F70;
        Thu, 23 Mar 2023 22:32:27 +0100 (CET)
Message-ID: <c93512db198b14ff8892102cfecec3bea8688aaf.camel@bi-co.net>
Subject: Re: Cypress CDC ACM serial port not working correctly with
 autosuspend
From:   Michael =?ISO-8859-1?Q?La=DF?= <bevan@bi-co.net>
To:     Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
Date:   Thu, 23 Mar 2023 22:32:25 +0100
In-Reply-To: <46e50745-63e4-7e97-739c-338f9a6445d2@suse.com>
References: <8be9b56c6becd0981d1cd9c13742df6ba2975b56.camel@bi-co.net>
         <0db2a0a4-6ed4-fe06-217a-cb564f1d4a8c@suse.com>
         <bde43a1913cf55e580e77ac0e059fff3c26dc093.camel@bi-co.net>
         <2f98290f-995b-89ff-8ba2-1463fcf78297@suse.com>
         <9a1381abe0e2b605786bc9c3b2daa3f7bdc3b64c.camel@bi-co.net>
         <e977c0e1-4604-47cc-9c53-619bc897d418@suse.com>
         <646eb1bb5218b9ce5df21e89081b09b84dbd46fd.camel@bi-co.net>
         <46e50745-63e4-7e97-739c-338f9a6445d2@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.46.4 
MIME-Version: 1.0
X-Spam-Status: No, score=0.0 required=5.0 tests=SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Donnerstag, dem 23.03.2023 um 14:53 +0100 schrieb Oliver Neukum:
> 
> On 23.03.23 13:52, Michael Laß wrote:
> > 
> > Yes, the remote device is programmed to print "Hello World" every
> > three
> > seconds. Nothing should have stopped it from doing that.
> 
> I am asking because the device says that it is bus powered.
> That is, are we putting the device into some sleep state?

This got me thinking. I am observing the behavior on a ZedBoard, a
development board that contains a Xilinx Zynq SoC and the Cypress UART
chip connected to that SoC. I now looked into the schematic of that
board.

The chip is a CY7C64225-28PVXC and the datasheet has a section on USB
suspend and resume: When suspended, a separate WAKE input pin has to be
set high to issue a remote wake-up. The designers of the ZedBoard have
tied this pin to ground...

So the chip behaves as documented. If any, this is an issue with the
board design. Nothing the kernel could work around. Sorry, I hope I
haven't stolen too much of your time.

Kind regards,
Michael
