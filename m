Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5CC595236F2
	for <lists+linux-usb@lfdr.de>; Wed, 11 May 2022 17:18:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245700AbiEKPR7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 May 2022 11:17:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245689AbiEKPR6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 May 2022 11:17:58 -0400
Received: from sin.source.kernel.org (sin.source.kernel.org [IPv6:2604:1380:40e1:4800::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8189120D4FF
        for <linux-usb@vger.kernel.org>; Wed, 11 May 2022 08:17:56 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by sin.source.kernel.org (Postfix) with ESMTPS id 81485CE25BF
        for <linux-usb@vger.kernel.org>; Wed, 11 May 2022 15:17:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07053C340EE;
        Wed, 11 May 2022 15:17:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1652282272;
        bh=zotC/W6Dt2ny/Ig5F9uheW/78JqNBstGhsdUSXPqzVI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=a9LRdW5WdIfBAk8vnwqMxCF/fKa3nhXizVZ4gkIfdFcx69crfiMvJ2gkEGUE559YU
         mqyPMEfU21FJLEMXdXa6vCvnrUIB3lLnwgOzlfRaYbP/EiEJRNSk7PPFt6BvBEYOgk
         st9UMd+b7sMFiMlI/x2nbJjgtKtdpfCgd2IyIFvM=
Date:   Wed, 11 May 2022 17:17:48 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Felipe Balbi <balbi@kernel.org>,
        USB mailing list <linux-usb@vger.kernel.org>
Subject: Re: [PATCH] USB: gadget: Add ID numbers to gadget names
Message-ID: <YnvTnHhW/RN+I42i@kroah.com>
References: <YnFO0Qr8RY7peFCg@rowland.harvard.edu>
 <YnaR8LaaPTdLTiok@rowland.harvard.edu>
 <CAMuHMdUpOiHHMktPk_-NauDW2ufvGThnkFU7Pok376pM6OEyYw@mail.gmail.com>
 <Ynkh5eKtfxU+AyZX@rowland.harvard.edu>
 <CAMuHMdVi6jCi=tRBNjBodVcA48ygiqPACQcmHx+1HRYnArJ9tQ@mail.gmail.com>
 <YnktokC8Uk9j53yO@rowland.harvard.edu>
 <YnlAAxT5Lq0NvxX0@kroah.com>
 <YnlFl0M0FRzhxwpK@rowland.harvard.edu>
 <YnoZva+tZa8Ix+aI@kroah.com>
 <YnqKAXKyp9Vq/pbn@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YnqKAXKyp9Vq/pbn@rowland.harvard.edu>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, May 10, 2022 at 11:51:29AM -0400, Alan Stern wrote:
> Putting USB gadgets on a new bus of their own encounters a problem
> when multiple gadgets are present: They all have the same name!  The
> driver core fails with a "sys: cannot create duplicate filename" error
> when creating any of the /sys/bus/gadget/devices/<gadget-name>
> symbolic links after the first.
> 
> This patch fixes the problem by adding a ".N" suffix to each gadget's
> name when the gadget is registered (where N is a unique ID number),
> thus making the names distinct.
> 
> Reported-and-tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Signed-off-by: Alan Stern <stern@rowland.harvard.edu>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Fixes: fc274c1e9973 ("USB: gadget: Add a new bus for gadgets")
> 
> ---
> 
> 
> [as1980]

Thanks, let me run this through the Android test suite first.  You can
see the results here:
	https://android-review.googlesource.com/c/kernel/common/+/2095109

I'll let you know how it goes as I do not know if you are not logged in
if you can see the test results or not, gerrit is odd...

thanks,

greg k-h
