Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2C34591FCC
	for <lists+linux-usb@lfdr.de>; Sun, 14 Aug 2022 14:58:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231613AbiHNM6g (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 14 Aug 2022 08:58:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231326AbiHNM6f (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 14 Aug 2022 08:58:35 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0672AE69
        for <linux-usb@vger.kernel.org>; Sun, 14 Aug 2022 05:58:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 852ADB80B37
        for <linux-usb@vger.kernel.org>; Sun, 14 Aug 2022 12:58:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEF89C433D6;
        Sun, 14 Aug 2022 12:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1660481912;
        bh=deFXasgYxEd0eyBJ3ycHP8kq1oJIlBViv63pUaWDCKY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SsnpvOs7qJlXXhc3QbtUuT3/g7td/ymZa/3wwOsiDHegHZNQkm/cSyhh+l8sQX3Hi
         eJ6omfXcr5S2HMUspOUANEg7qSS2Tz1GmPVF68nW9uGcw9WfPoFm8MS6Psb4GdNGDI
         GawtyEQ3H4yN4ZHcaL9n+eamRFSxw2EmMfx2OUJg=
Date:   Sun, 14 Aug 2022 14:58:29 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Frank Mori Hess <fmh6jj@gmail.com>
Cc:     Minas Harutyunyan <hminas@synopsys.com>, linux-usb@vger.kernel.org
Subject: Re: [BUG] usb: dwc2: split interrupt in transactions silently
 dropped due to driver latency
Message-ID: <YvjxdYDe/SMl1lO+@kroah.com>
References: <CAJz5Opd7VxpLSdvDCivgKbazG-t8uGcqazMVjs864w-AhviuRw@mail.gmail.com>
 <YvdPr0Hn5eOPehIm@kroah.com>
 <CAJz5OpfDH3kJV5e9UqU6Tcw8NWHK5-iGFJHdkCGBzeNW-fCRUQ@mail.gmail.com>
 <Yve+avK9F4dCnvzB@kroah.com>
 <CAJz5Opfcy-P+HbRQ2LK_-9C8Oz5q=26qZ--ZfYV74YtzhFH1Bw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJz5Opfcy-P+HbRQ2LK_-9C8Oz5q=26qZ--ZfYV74YtzhFH1Bw@mail.gmail.com>
X-Spam-Status: No, score=-7.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Sun, Aug 14, 2022 at 05:33:09AM -0700, Frank Mori Hess wrote:
> On Sat, Aug 13, 2022 at 8:08 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > Then please work with your vendor as only they can provide the needed
> > support that you are already paying for.  Take advantage of that,
> > nothing we can do about odd vendor kernels, sorry.
> 
> I'm not looking for support, I've already fixed the bug for myself.
> I'm just trying to provide some useful information to the dwc2
> maintainer in case they care about fixing the bug.  The bug is
> obviously still present in the current mainline kernel.  From the
> dwc2_hc_nyet_intr function, they #ifdef out incrementing the
> error_count (as I tried to explain earlier, even incrementing the
> error_count is not enough, there needs to be a hard error):
> 
> #if 0
> /*
> * Todo: Fix system performance so this can
> * be treated as an error. Right now complete
> * splits cannot be scheduled precisely enough
> * due to other system activity, so this error
> * occurs regularly in Slave mode.
> */
> qtd->error_count++;
> #endif

If you have a fix, please, send it as a normal patch submission so we
can review and accept it like normal.  No need to do anything else here
out-of-the-ordinary.

thanks,

greg k-h
