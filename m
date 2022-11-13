Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 38130626D5F
	for <lists+linux-usb@lfdr.de>; Sun, 13 Nov 2022 02:50:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235123AbiKMBuw (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 12 Nov 2022 20:50:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235106AbiKMBuu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 12 Nov 2022 20:50:50 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 4C0B7F000
        for <linux-usb@vger.kernel.org>; Sat, 12 Nov 2022 17:50:48 -0800 (PST)
Received: (qmail 83294 invoked by uid 1000); 12 Nov 2022 20:50:47 -0500
Date:   Sat, 12 Nov 2022 20:50:47 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Gabriel Oliveira Santos <gabrielos@dcomp.ufs.br>
Cc:     linux-usb@vger.kernel.org
Subject: Re: How to configure a Linux USB driver to have higher precedence
 than usbhid?
Message-ID: <Y3BNd1wmhplguCn2@rowland.harvard.edu>
References: <CAGoM2ZU1ez0sCi5GuTd44xnCM8oVmxWTjUMbi_2L+0S=ERN8BQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGoM2ZU1ez0sCi5GuTd44xnCM8oVmxWTjUMbi_2L+0S=ERN8BQ@mail.gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sat, Nov 12, 2022 at 07:24:43PM -0300, Gabriel Oliveira Santos wrote:
> Hi! My name is Gabriel Santos and I'm developing a USB driver based on
> https://github.com/torvalds/linux/blob/master/drivers/hid/usbhid/usbmouse.c
> for a USB joystick.

Why are you doing this instead of using the kernel's own joystick 
drivers?  Or modifying one of them to do what you want?  Wouldn't that 
be easier?

> I changed the device table to use the joystick's vendor and product
> id, like the table in
> https://github.com/torvalds/linux/blob/master/drivers/usb/usb-skeleton.c.
> 
> Currently, if I rmmod usbhid, insmod my driver and plug in the
> joystick, everything works. But I do need to rmmod usbhid in order for
> my driver to be probed.
> 
> Is there a way to make my driver have higher precedence than usbhid,
> so I don't need to rmmod usbhid?

In short, there is not.  When two drivers claim to be able to manage the 
same device, which one binds to the device is arbitrary.

If you want, you can unbind usbhid and bind your driver by hand (or by a 
script) using sysfs.  But that's not the same thing.

Alan Stern
