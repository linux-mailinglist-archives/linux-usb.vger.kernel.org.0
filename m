Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF3AF50FA70
	for <lists+linux-usb@lfdr.de>; Tue, 26 Apr 2022 12:28:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348785AbiDZKbC convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 26 Apr 2022 06:31:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41772 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240733AbiDZKab (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Apr 2022 06:30:31 -0400
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18ED8EB151
        for <linux-usb@vger.kernel.org>; Tue, 26 Apr 2022 03:07:18 -0700 (PDT)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 241BDE0006;
        Tue, 26 Apr 2022 10:07:15 +0000 (UTC)
Message-ID: <3e6af5eff95968d6a871cc26233328d9890730b3.camel@hadess.net>
Subject: Re: [RFC v1] USB: core: add USBDEVFS_REVOKE ioctl
From:   Bastien Nocera <hadess@hadess.net>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>
Date:   Tue, 26 Apr 2022 12:07:15 +0200
In-Reply-To: <YmbCBwEMvKO5z0Dh@kroah.com>
References: <20220425132315.924477-1-hadess@hadess.net>
         <YmarwaNQYn1GwFbQ@kroah.com>
         <e73035d1bae5d0c355166fb46f0f5f2f07752b3c.camel@hadess.net>
         <Yma3k3lRMIEFypMN@kroah.com>
         <1d82343a5987a308ac9bd3f6fd481bc12a608a24.camel@hadess.net>
         <YmbCBwEMvKO5z0Dh@kroah.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.44.0 (3.44.0-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 2022-04-25 at 17:45 +0200, Greg Kroah-Hartman wrote:
> But back to the original question, what programs would use this that
> today offer direct access to USB devices through libusb?  I can maybe
> think of some fingerprint scanners and some flatbed scanners
> (printers?)
> But those are generally rare and the fingerprint scanners only have
> limited access to the device already.

fingerprint readers are handled through a privileged daemon for the
past 14 years:
https://fprint.freedesktop.org/

Looking through libusb_open() users on the Debian repo[1], I could find
those types of devices that could make use of sandboxing:
- all manners of single-board computers and programmable chips and
devices (avrdude, STLink, sunxi bootloader, flashrom, etc.)
- 3D printers
- scanners
- LCD "displays"
- user-space webcam and still cameras
- game controllers
- video/audio capture devices
- sensors
- software-defined radios
- DJ/music equipment
- protocol analysers

There's also Rio500 support which I'm particularly attached to, and
many many more device types, including one that should eventually get a
kernel driver, because prototyping in user-space in Python or
Javascript is probably easier than in C.

[1]:
https://codesearch.debian.net/search?q=libusb_open&literal=1&perpkg=1
