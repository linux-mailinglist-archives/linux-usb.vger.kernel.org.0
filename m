Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C665E4E8856
	for <lists+linux-usb@lfdr.de>; Sun, 27 Mar 2022 17:08:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229518AbiC0PJ7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 27 Mar 2022 11:09:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235806AbiC0PJ5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 27 Mar 2022 11:09:57 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 3E757186F0
        for <linux-usb@vger.kernel.org>; Sun, 27 Mar 2022 08:08:17 -0700 (PDT)
Received: (qmail 298656 invoked by uid 1000); 27 Mar 2022 11:08:16 -0400
Date:   Sun, 27 Mar 2022 11:08:16 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Tasos Sahanidis <tasos@tasossah.com>
Cc:     linux-usb@vger.kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH v2] usb: core: Don't block while sleeping in
 do_proc_control()
Message-ID: <YkB94MnkBhadLVi8@rowland.harvard.edu>
References: <2450973f-d665-82b9-6734-4b57f95a2be3@tasossah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2450973f-d665-82b9-6734-4b57f95a2be3@tasossah.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Mar 27, 2022 at 02:25:01AM +0200, Tasos Sahanidis wrote:
> Since commit ae8709b296d8 ("USB: core: Make do_proc_control() and
> do_proc_bulk() killable") if a device has the USB_QUIRK_DELAY_CTRL_MSG
> quirk set, it will temporarily block all other URBs (e.g. interrupts)
> while sleeping due to a control.
> 
> This results in noticeable delays when, for example, a userspace usbfs
> application is sending URB interrupts at a high rate to a keyboard and
> simultaneously updates the lock indicators using controls. Interrupts
> with direction set to IN are also affected by this, meaning that
> delivery of HID reports (containing scancodes) to the usbfs application
> is delayed as well.
> 
> This patch fixes the regression by calling msleep() while the device
> mutex is unlocked, as was the case originally with usb_control_msg().
> 
> Fixes: ae8709b296d8 ("USB: core: Make do_proc_control() and do_proc_bulk() killable")
> Signed-off-by: Tasos Sahanidis <tasos@tasossah.com>
> ---

Thanks for identifying and fixing this.

Acked-by: Alan Stern <stern@rowland.harvard.edu>

You might want to change the patch name, however.  "Block" usually means 
pretty much the same thing as "sleep"; i.e., a process is blocked if it 
can't move forward.  The name should be something like "Don't hold the 
device lock while sleeping in do_proc_control()".

Alan Stern
