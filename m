Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DCAE951C22B
	for <lists+linux-usb@lfdr.de>; Thu,  5 May 2022 16:17:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380515AbiEEOUm (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 5 May 2022 10:20:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237840AbiEEOUj (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 5 May 2022 10:20:39 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 0B07A5A2E8
        for <linux-usb@vger.kernel.org>; Thu,  5 May 2022 07:16:58 -0700 (PDT)
Received: (qmail 1158812 invoked by uid 1000); 5 May 2022 10:16:58 -0400
Date:   Thu, 5 May 2022 10:16:58 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     James Dutton <james.dutton@gmail.com>
Cc:     "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
Subject: Re: usb disk drive disconnect making readonly
Message-ID: <YnPcWuhpFrqjeIIs@rowland.harvard.edu>
References: <CAAMvbhGURWPbHUw5gOirJer7-+VwWFL4tTtiSYSJW=3y1G92mw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAMvbhGURWPbHUw5gOirJer7-+VwWFL4tTtiSYSJW=3y1G92mw@mail.gmail.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 04, 2022 at 09:16:55PM +0100, James Dutton wrote:
> Hi,
> 
> Use case:
> Boot from a USB disk and run for a day.
> Sometimes the USB link disconnects and reconnects.
> When it reconnects, Linux cannot use it, and the Linux kernel has set
> the device mount to read only.
> Is there any way to allow a USB disk to disconnect and then reconnect
> it, and Linux carry on using it, and not set it to a read-only mount,
> provided of course, that it knows that the same disk was reconnected
> without being changed.
> For example, I have a usb disk device that goes into power save mode
> if not accessed for more than 15 mins. When I come back to unlock the
> screensaver, it does not wake up the disk, but instead places it in
> read-only mode. This necessitates me to reboot the PC to get it
> working again.
> 
> Any ideas?

There is no way to know what is going on unless you provide a lot more 
information.  The dmesg log showing what happens during one of these 
disconnect/reconnect events would be a good start (although it probably 
won't be enough).

Alan Stern
