Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41B475E62D5
	for <lists+linux-usb@lfdr.de>; Thu, 22 Sep 2022 14:52:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231599AbiIVMwf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Sep 2022 08:52:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231580AbiIVMwd (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Sep 2022 08:52:33 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73384E11C1
        for <linux-usb@vger.kernel.org>; Thu, 22 Sep 2022 05:52:29 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 24A6DB8277A
        for <linux-usb@vger.kernel.org>; Thu, 22 Sep 2022 12:52:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 693BEC433D6;
        Thu, 22 Sep 2022 12:52:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1663851146;
        bh=DUpNfNto5iMslyXn6lVhhQziwGzeix4tvZPsaDMIA2A=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=wD8iAyRwh+c4vBbo4atKYn/UAfrrXjTX+rc/MK9rpXz4z7jzLuWHdKVa3kp6M9yIj
         wdIsH44clIad2YTKdEfyWebt4wsp4tD31Z/lZIzfBiXdlnKQjX3GC1TAnl8jXe2ReK
         2QIX1eiUx1QvZ5gwWtTkFIJMvDfkjNZ5sMjmqj8U=
Date:   Thu, 22 Sep 2022 14:52:23 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: [PATCH 0/6] xhci features and fixes for usb-next
Message-ID: <Yyxah7xmBulM2vf/@kroah.com>
References: <20220921123450.671459-1-mathias.nyman@linux.intel.com>
 <YyxQMtJCLdgWuCsu@kroah.com>
 <2b0dde2d-d00d-4dff-094f-e5207ce39a38@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b0dde2d-d00d-4dff-094f-e5207ce39a38@linux.intel.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Sep 22, 2022 at 03:43:04PM +0300, Mathias Nyman wrote:
> On 22.9.2022 15.08, Greg KH wrote:
> > On Wed, Sep 21, 2022 at 03:34:44PM +0300, Mathias Nyman wrote:
> > > Hi Greg
> > > 
> > > Some xhci features and fixes for usb-next.
> > > Both fixing some possible memory leaks that are too late for usb-linus,
> > > and simple code cleanups for usb-next
> > 
> > Did you miss this one:
> > 	https://lore.kernel.org/r/20220915011134.58400-1-liulongfang@huawei.com
> > 
> > or was there some issue with it?
> 
> Got distracted while looking at it.
> 
> Can be added but probably not that useful.
> 
> In a host controller error (HCE) case all host activity stops, so it would
> make more sense to check HCE bit in timeout cases than in interrupt handler.

Ok, no worries, I'll drop it from my review queue, but you should
respond to the patch submission with this information.

thanks,

greg k-h
