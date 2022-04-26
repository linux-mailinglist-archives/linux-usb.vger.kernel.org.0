Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A6EFE50FA6F
	for <lists+linux-usb@lfdr.de>; Tue, 26 Apr 2022 12:28:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348933AbiDZKbF convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Tue, 26 Apr 2022 06:31:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348807AbiDZKaf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 26 Apr 2022 06:30:35 -0400
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 086E5EDB44
        for <linux-usb@vger.kernel.org>; Tue, 26 Apr 2022 03:07:31 -0700 (PDT)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id ADE4D24000D;
        Tue, 26 Apr 2022 10:07:28 +0000 (UTC)
Message-ID: <65edbf6e81f0f1109fe2de01ca12cf14353d2307.camel@hadess.net>
Subject: Re: [RFC v1] USB: core: add USBDEVFS_REVOKE ioctl
From:   Bastien Nocera <hadess@hadess.net>
To:     Peter Hutterer <peter.hutterer@who-t.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Date:   Tue, 26 Apr 2022 12:07:27 +0200
In-Reply-To: <YmdYfK5Vi+lEl7FX@quokka>
References: <20220425132315.924477-1-hadess@hadess.net>
         <YmarwaNQYn1GwFbQ@kroah.com>
         <e73035d1bae5d0c355166fb46f0f5f2f07752b3c.camel@hadess.net>
         <Yma3k3lRMIEFypMN@kroah.com>
         <1d82343a5987a308ac9bd3f6fd481bc12a608a24.camel@hadess.net>
         <YmbCBwEMvKO5z0Dh@kroah.com> <YmdYfK5Vi+lEl7FX@quokka>
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

On Tue, 2022-04-26 at 12:27 +1000, Peter Hutterer wrote:
> The primary focus of all this are joystick devices (unless I missed
> some other
> grand plans Bastien had that I'm not aware of), that should put
> things in
> context a bit. 

It's for every USB device out there:
https://github.com/flatpak/xdg-desktop-portal/issues/227
https://github.com/flatpak/xdg-desktop-portal/pull/559
including support for Chrome's WebUSB:

https://wicg.github.io/webusb/

The end goal (with the portals and the revoke support) is sandboxed
applications being able to enumerate USB devices, access them, and
revoke access to them without full devices access, or overly broad user
access.

> I have a very simple hidraw tester here:
> https://github.com/whot/hidiocrevoke-test/blob/master/revoke.c
> Updating that to take usb devices can't be that hard :)

It just requires me finding the right device to test with ;)
