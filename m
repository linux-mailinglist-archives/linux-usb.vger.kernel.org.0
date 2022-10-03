Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BA2675F3573
	for <lists+linux-usb@lfdr.de>; Mon,  3 Oct 2022 20:18:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230012AbiJCSSE (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 3 Oct 2022 14:18:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229697AbiJCSRv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 3 Oct 2022 14:17:51 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 4C0F22BB15
        for <linux-usb@vger.kernel.org>; Mon,  3 Oct 2022 11:17:45 -0700 (PDT)
Received: (qmail 680091 invoked by uid 1000); 3 Oct 2022 14:17:44 -0400
Date:   Mon, 3 Oct 2022 14:17:44 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     James Dutton <james.dutton@gmail.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: USB disk disconnect problems
Message-ID: <YzsnSPEfBesJRr9R@rowland.harvard.edu>
References: <CAAMvbhFJ+jdFPh5dMV+_jjYUYYgWhCpv5E43Bh=Eoo6su80cUA@mail.gmail.com>
 <CAAMvbhEV_ssOwsWU-37pauDSfM3Ekv2mrKWTjCP0vov84dMDMQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAMvbhEV_ssOwsWU-37pauDSfM3Ekv2mrKWTjCP0vov84dMDMQ@mail.gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Oct 03, 2022 at 07:04:05PM +0100, James Dutton wrote:
> I have done some more tests.
> With the device plugged in, and me manually send a command to reset
> the USB device.
> Using instructions listed here:
> https://askubuntu.com/questions/645/how-do-you-reset-a-usb-device-from-the-command-line
> 
> The reset fails.
> It never recovers.
> So, I think there is some problem relating to USB 3.x reset, and maybe
> just my specific device which is an NVME storage in a USB dock.
> I think the problem is more to do with the Linux kernel's USB 3.x
> reset procedure, rather than any other cause.
> Is there any quirk or test I can add, that would remove power from the
> USB port and return it, as part of the reset procedure?
> Or, is there any extra debug logging I can enable to help diagnose
> where the reset function is failing?

You can try collecting a usbmon trace of the reset (instructions on the 
web or in Documentation/usb/usbmon.rst in the kernel source).  That will 
provide some clues as to whether the problem lies in the reset itself or 
in the activities that follow the reset.

Have you tried running a similar test using, say, a plain old USB thumb 
drive in place of the NVME storage device?

Alan Stern
