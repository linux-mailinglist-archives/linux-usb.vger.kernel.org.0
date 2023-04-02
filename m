Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D8036D396C
	for <lists+linux-usb@lfdr.de>; Sun,  2 Apr 2023 19:25:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231159AbjDBRZe (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 2 Apr 2023 13:25:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230484AbjDBRZd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 2 Apr 2023 13:25:33 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A33897DB2
        for <linux-usb@vger.kernel.org>; Sun,  2 Apr 2023 10:25:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 5652CB80EC5
        for <linux-usb@vger.kernel.org>; Sun,  2 Apr 2023 17:25:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B40AEC433EF;
        Sun,  2 Apr 2023 17:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1680456330;
        bh=BR5iduZQ1OrWAC2UkvPsnrlNpeM9UifiELtX7lAvZbI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=d56rpWaWp0mRuoyxD5NKgp/a3JSEZlkJJedVy0ZXzKl5jzBzWDF8RJIh72wr/9bCX
         XQ3fZaKSq3Xx2js+WH5H6kbddkQZngEFzwK/uboy2Bn8taGj6aKF4/F/SOmEZr6Z19
         APAj5O63c4WfNJwQFjHXTwpOatQPduU8xe+q4BnM=
Date:   Sun, 2 Apr 2023 19:25:27 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Hans Petter Selasky <hps@selasky.org>
Cc:     bugzilla-daemon@kernel.org, linux-usb@vger.kernel.org
Subject: Re: [Bug 217242] CPU hard lockup related to xhci/dma
Message-ID: <2023040210-armband-spiffy-b5a5@gregkh>
References: <bug-217242-208809@https.bugzilla.kernel.org/>
 <bug-217242-208809-LGiVP9fz4d@https.bugzilla.kernel.org/>
 <7dc47823-01a1-ac19-73d4-4bf7eb07f98d@selasky.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7dc47823-01a1-ac19-73d4-4bf7eb07f98d@selasky.org>
X-Spam-Status: No, score=-5.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Apr 02, 2023 at 05:54:18PM +0200, Hans Petter Selasky wrote:
> While that being said, I wish the Linux USB core would take the example of
> the FreeBSD USB core, and pre-allocate all memory needed for USB transfers,
> also called URB's, during device attach.

Many drivers do that today already, which specific ones do you think
need to have this added that are not doing so?

> Frequently going through allocate
> and free cycles during operation, is not just inefficient, but also greatly
> degrades the ability to debug the system.

Based on the slow USB speeds, "inefficient" isn't anything that I've
been able to measure specifically, have you?

> USB is still quite essential when doing remote server access. Yeah,
> the serial port is great too, but one day inb() and outb() will die

That's what a USB debugging cable is for :)

thanks,

greg k-h
