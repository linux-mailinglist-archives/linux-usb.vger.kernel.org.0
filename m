Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 643B1523B00
	for <lists+linux-usb@lfdr.de>; Wed, 11 May 2022 18:58:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345237AbiEKQ6z (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 May 2022 12:58:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345231AbiEKQ6x (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 May 2022 12:58:53 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56FD513C4D6
        for <linux-usb@vger.kernel.org>; Wed, 11 May 2022 09:58:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 1621AB82527
        for <linux-usb@vger.kernel.org>; Wed, 11 May 2022 16:58:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EB9EC340EE;
        Wed, 11 May 2022 16:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1652288329;
        bh=MFyx3jlHxGnYLx6AEw97nvbi0segfIJE7X5BQtNQ52k=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Mh1n+FJ/x030Bk7iqG6nkPtfhmvGsScfwsP+uCwYMK+HWKHpgRywdG0wK91wrq7fE
         FFBSQa/1/sPoAUOvXGWE+N6LaH+aSPO1V6PaKJGr7BV5QYp3reVKsKaAWU/i/pgWmT
         Yr+H7/igt2cXhV+eaY7JWaCMO6frPKR7x0WRH+Fw=
Date:   Wed, 11 May 2022 18:58:46 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Felipe Balbi <balbi@kernel.org>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: gadget: Add ID numbers to gadget names
Message-ID: <YnvrRnHZpAm8+QSG@kroah.com>
References: <YnaR8LaaPTdLTiok@rowland.harvard.edu>
 <CAMuHMdUpOiHHMktPk_-NauDW2ufvGThnkFU7Pok376pM6OEyYw@mail.gmail.com>
 <Ynkh5eKtfxU+AyZX@rowland.harvard.edu>
 <CAMuHMdVi6jCi=tRBNjBodVcA48ygiqPACQcmHx+1HRYnArJ9tQ@mail.gmail.com>
 <YnktokC8Uk9j53yO@rowland.harvard.edu>
 <YnlAAxT5Lq0NvxX0@kroah.com>
 <YnlFl0M0FRzhxwpK@rowland.harvard.edu>
 <YnoZva+tZa8Ix+aI@kroah.com>
 <YnqKAXKyp9Vq/pbn@rowland.harvard.edu>
 <YnvTnHhW/RN+I42i@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YnvTnHhW/RN+I42i@kroah.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, May 11, 2022 at 05:17:48PM +0200, Greg KH wrote:
> On Tue, May 10, 2022 at 11:51:29AM -0400, Alan Stern wrote:
> > Putting USB gadgets on a new bus of their own encounters a problem
> > when multiple gadgets are present: They all have the same name!  The
> > driver core fails with a "sys: cannot create duplicate filename" error
> > when creating any of the /sys/bus/gadget/devices/<gadget-name>
> > symbolic links after the first.
> > 
> > This patch fixes the problem by adding a ".N" suffix to each gadget's
> > name when the gadget is registered (where N is a unique ID number),
> > thus making the names distinct.
> > 
> > Reported-and-tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Fixes: fc274c1e9973 ("USB: gadget: Add a new bus for gadgets")
> > 
> > ---
> > 
> > 
> > [as1980]
> 
> Thanks, let me run this through the Android test suite first.  You can
> see the results here:
> 	https://android-review.googlesource.com/c/kernel/common/+/2095109
> 
> I'll let you know how it goes as I do not know if you are not logged in
> if you can see the test results or not, gerrit is odd...

All passed, so I'll go queue this up now, thanks!

greg k-h
