Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3774D6558C2
	for <lists+linux-usb@lfdr.de>; Sat, 24 Dec 2022 07:54:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbiLXGyD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 24 Dec 2022 01:54:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbiLXGyC (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 24 Dec 2022 01:54:02 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 057D56340
        for <linux-usb@vger.kernel.org>; Fri, 23 Dec 2022 22:54:00 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 7119060303
        for <linux-usb@vger.kernel.org>; Sat, 24 Dec 2022 06:54:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A658C433EF;
        Sat, 24 Dec 2022 06:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1671864839;
        bh=tfI5gDB5i2b6xUXMenqqjNkx935byJG2g/wJUjizNpA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=HF5B6cm6JLnsWz7gpcEZZGgLDszxJQ4nXWJ4Txvec2Cyp/p7V20ExIFpjYuTX4TWu
         HRbaS2auQXmHSptPsUyh0j7opyGHIFBSB6zCEL5UTzez/k9UekRZPle3k4cyRcWXkr
         sDyNFIKCzrQfp0aX5rgRXMGC4bu4yA733PkN97q0=
Date:   Sat, 24 Dec 2022 07:53:54 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     dima.pasechnik@cs.ox.ac.uk
Cc:     Alan Stern <stern@rowland.harvard.edu>, linux-usb@vger.kernel.org
Subject: Re: usb 1-3: Product: BBC micro:bit CMSIS-DAP not recognised
Message-ID: <Y6aiAtZUd56VfS8i@kroah.com>
References: <Y6Bfx+Ksm/Qz3N8y@hilbert>
 <Y6B8jd7dHsa85Wny@kroah.com>
 <Y6CRbgwHzjr2KNxK@hilbert>
 <Y6CpKxZ4KsiYttbL@hilbert>
 <Y6Csfzqvy6GExhVB@kroah.com>
 <Y6DjwFAp4M8I+T4P@hilbert>
 <Y6D1j+AVp8YTJjCd@rowland.harvard.edu>
 <Y6Gz6wWb6bpz0rRb@hilbert>
 <Y6XAMmx7LjDn1J6R@kroah.com>
 <Y6Y/FB1IS6BrKsCW@hilbert>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y6Y/FB1IS6BrKsCW@hilbert>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Dec 23, 2022 at 11:51:48PM +0000, dima.pasechnik@cs.ox.ac.uk wrote:
> On Fri, Dec 23, 2022 at 03:50:26PM +0100, Greg KH wrote:
> > On Tue, Dec 20, 2022 at 01:08:59PM +0000, dima.pasechnik@cs.ox.ac.uk wrote:
> > > On Mon, Dec 19, 2022 at 06:36:47PM -0500, Alan Stern wrote:
> > > > 
> > > > It might help if you post the output of "lsusb -v" for this device.
> > > Please see attached; I also attached the output for an older version of
> > > this board (V1). The one we talk about is V2. Both versions have the
> > > same VID, and, weirdly, the same PID (internally they aren't binary
> > > compatible, even)
> > 
> > That's horrible, someone should talk to the vendor here and get them to
> > at least bump the device id.
> 
> The vendor is ARM (https://www.arm.com/) - I guess Linux Foundation is a good "someone"
> to talk to the vendor in this case.

I do not understand here, are you asking me to talk to someone?  If so,
great, who?  If not, who are you asking?

> Can PID be bumped up by a firmware update?

Depends on how the hardware was designed.  Most can, some can not.  Is
the hardware design and firmware source available anywhere?

thanks,

greg k-h
