Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83ACD50B882
	for <lists+linux-usb@lfdr.de>; Fri, 22 Apr 2022 15:31:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356983AbiDVNdO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 22 Apr 2022 09:33:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1448200AbiDVNdE (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 22 Apr 2022 09:33:04 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A42B4457B5
        for <linux-usb@vger.kernel.org>; Fri, 22 Apr 2022 06:30:10 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 42115620C2
        for <linux-usb@vger.kernel.org>; Fri, 22 Apr 2022 13:30:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3211DC385A0;
        Fri, 22 Apr 2022 13:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1650634209;
        bh=vGzaIzkjnAmXBjCtbcDTqozWT6FKi8rDvg1K7GseeRs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=u895+EeFg+O8jRxaQbX/atM0Ds4GepTEQ+sRlnauvNCXgLJ72NB15TxV+0Cam1EDO
         kxUPQZRnVKTyVHhJSXn70v59g5sNUX8f3uGNCF8J7TgB/EcAMYO4hvGYdPvrQD47w2
         7RHTBU6Q+/QiNZB7NIjbJ8MSo5iWAp0J2hINf5Js=
Date:   Fri, 22 Apr 2022 15:30:06 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Felipe Balbi <balbi@kernel.org>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [RFC PATCH 0/4] USB: gadget: Create a bus for gadgets
Message-ID: <YmKt3kH+85kjzdbL@kroah.com>
References: <YjeEbHL8ITkW692W@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YjeEbHL8ITkW692W@rowland.harvard.edu>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Mar 20, 2022 at 03:45:48PM -0400, Alan Stern wrote:
> Everyone:
> 
> The following series of patches implements Greg's suggestion that 
> gadgets should be registered on some sort of bus.  It turns out that the 
> best way to do this is to create a new "gadget" bus, with specialized 
> matching and probing routines, rather than using an existing bus.
> 
> Patches 1-3 are simple preparations for the big change.  They stand on 
> their own, make useful little changes, and could be merged by themselves
> without committing to adding the "gadget" bus.  Patch 4 is main one.
> 
> I'm posting this series for feedback from the Gadget/UDC maintainer and 
> others.  If everything works out okay, the patches can be submitted for 
> real once the upcoming merge window closes.

At first glance, this looks good to me, many thanks for working on this!

greg k-h
