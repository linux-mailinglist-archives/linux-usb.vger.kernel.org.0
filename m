Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 90E95655199
	for <lists+linux-usb@lfdr.de>; Fri, 23 Dec 2022 15:50:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236301AbiLWOuc (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Dec 2022 09:50:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230390AbiLWOub (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Dec 2022 09:50:31 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B01FE379EF
        for <linux-usb@vger.kernel.org>; Fri, 23 Dec 2022 06:50:30 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 535A961221
        for <linux-usb@vger.kernel.org>; Fri, 23 Dec 2022 14:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52D81C433EF;
        Fri, 23 Dec 2022 14:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1671807029;
        bh=XnHE831GpXAHuhS0ktZ/tRnCrV9EYuGVPDk7bjHINmk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=0D8ZFAcddPLbTAGjmNNL9pt7ByUxlI8PrTVDQxWPd68i5gGjG3cBWEXcpp4xiCQvz
         5oS1TWYDpZL7Ton89g3Q5cIsaMfSmnkaev+Fk6+qk9AkiwH02J565L2XHFpZckwFSy
         3RKvEMUL2yzdzN7fB4HGox/sd1I6v/Az6P4adHH8=
Date:   Fri, 23 Dec 2022 15:50:26 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     dima.pasechnik@cs.ox.ac.uk
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
Subject: Re: usb 1-3: Product: BBC micro:bit CMSIS-DAP not recognised
Message-ID: <Y6XAMmx7LjDn1J6R@kroah.com>
References: <Y6Bfx+Ksm/Qz3N8y@hilbert>
 <Y6B8jd7dHsa85Wny@kroah.com>
 <Y6CRbgwHzjr2KNxK@hilbert>
 <Y6CpKxZ4KsiYttbL@hilbert>
 <Y6Csfzqvy6GExhVB@kroah.com>
 <Y6DjwFAp4M8I+T4P@hilbert>
 <Y6D1j+AVp8YTJjCd@rowland.harvard.edu>
 <Y6Gz6wWb6bpz0rRb@hilbert>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y6Gz6wWb6bpz0rRb@hilbert>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Dec 20, 2022 at 01:08:59PM +0000, dima.pasechnik@cs.ox.ac.uk wrote:
> On Mon, Dec 19, 2022 at 06:36:47PM -0500, Alan Stern wrote:
> > 
> > It might help if you post the output of "lsusb -v" for this device.
> Please see attached; I also attached the output for an older version of
> this board (V1). The one we talk about is V2. Both versions have the
> same VID, and, weirdly, the same PID (internally they aren't binary
> compatible, even)

That's horrible, someone should talk to the vendor here and get them to
at least bump the device id.

Anyway, I don't see a "serial" device here, just use the cdc-acm driver
and all should be ok, right?  Is there any missing functionality that
you feel is required that only the usb-serial api can provide?

thanks,

greg k-h
