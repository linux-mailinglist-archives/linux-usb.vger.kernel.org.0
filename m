Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A4BD751ACAF
	for <lists+linux-usb@lfdr.de>; Wed,  4 May 2022 20:24:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245733AbiEDS2A (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 4 May 2022 14:28:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1376767AbiEDS1o (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 4 May 2022 14:27:44 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id BE774B0A59
        for <linux-usb@vger.kernel.org>; Wed,  4 May 2022 10:54:09 -0700 (PDT)
Received: (qmail 1131655 invoked by uid 1000); 4 May 2022 13:54:08 -0400
Date:   Wed, 4 May 2022 13:54:08 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        marcel@holtmann.org
Subject: Re: [PATCH v5] USB: core: skip unconfiguration if device doesn't
 support it
Message-ID: <YnK9wBQXPB+LuHVP@rowland.harvard.edu>
References: <20220504151647.471885-1-jtornosm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220504151647.471885-1-jtornosm@redhat.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 04, 2022 at 05:16:47PM +0200, Jose Ignacio Tornos Martinez wrote:
> Some devices like Bluetooth Dongles with CSR chip (i.e. USB
> Bluetooth V4.0 Dongle by Trust) hang when they are unbound from
> 'unbind' sysfs entry and can not be bound again.
> 
> For these devices, CSR chip hangs when usb configuration command
> with index 0 (used to unconfigure) is sent during disconnection.
> 
> To avoid this unwanted result, it is necessary not to send this
> command, so a new quirk has been created. By default, quirk is
> not applied for any device and needs to be enabled by user.
> 
> For these devices, athough device is not unconfigured, it is
> better to avoid device hanging to be able to operate. Even
> bluetooth can be previously turned off.
> On the other hand, this is not important if usb device is going to
> be bound again (normal behavior), i.e. with usbip.
> 
> Signed-off-by: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
> ---

Acked-by: Alan Stern <stern@rowland.harvard.edu>
