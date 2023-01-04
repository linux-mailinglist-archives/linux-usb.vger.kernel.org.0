Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C291665D8D1
	for <lists+linux-usb@lfdr.de>; Wed,  4 Jan 2023 17:18:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239928AbjADQSk (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 Jan 2023 11:18:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239934AbjADQSc (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 Jan 2023 11:18:32 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id A9C3D3D9EF
        for <linux-usb@vger.kernel.org>; Wed,  4 Jan 2023 08:18:30 -0800 (PST)
Received: (qmail 472424 invoked by uid 1000); 4 Jan 2023 11:18:29 -0500
Date:   Wed, 4 Jan 2023 11:18:29 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Petr =?utf-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Disabling per-device autosuspend
Message-ID: <Y7Wm1UVGMx8ZeqgD@rowland.harvard.edu>
References: <20230104151341.6f937c0c@meshulam.tesarici.cz>
 <20230104164900.31a3243d@meshulam.tesarici.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230104164900.31a3243d@meshulam.tesarici.cz>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jan 04, 2023 at 04:49:00PM +0100, Petr Tesařík wrote:
> On Wed, 4 Jan 2023 15:13:41 +0100
> Petr Tesařík <petr@tesarici.cz> wrote:
> 
> > Hi folks,
> > 
> > I'm struggling with autosuspend on my Samsung phone in download mode,

Wait...  Autosuspend is carried out by the host, but you appear to be 
stating that the Samsung phone is acting as a USB device (i.e., it's 
being autosuspended, not that it is autosuspending something else).  
Is that right?

> > as it apparently breaks heimdall/libusb on my Tumbleweed system. Here's
> > what I'm seeing:
> > 
> > - My device is autosuspended, because it has been idle for long enough.
> > - cd /sys/bus/usb/devices/1-4/  # my device's port
> > - echo -1 > power/autosuspend
> > - The device is reset and gets a new device ID.
> >   The current directory is no longer valid (becomes empty).
> 
> On a second thought, this looks like the actual bug. I don't think
> we're supposed to see a disconnect+reconnect whenever a suspended USB
> device is resumed. Then again, I'm no expert on USB...

In general there should not be a disconnect during a resume.  But it can 
happen, depending on how the device behaves.  Perhaps your phone is 
disconnecting deliberately.

The dmesg log ought to contain some useful information, particularly if 
you enable USB kernel debugging before starting the experiment:

	echo 'module usbcore =p' >/sys/kernel/debug/dynamic_debug/control

Alan Stern
