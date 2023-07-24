Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CCDC75FA71
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jul 2023 17:10:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230388AbjGXPKh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Jul 2023 11:10:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229717AbjGXPKg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Jul 2023 11:10:36 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 8E3B610D3
        for <linux-usb@vger.kernel.org>; Mon, 24 Jul 2023 08:10:34 -0700 (PDT)
Received: (qmail 1850597 invoked by uid 1000); 24 Jul 2023 11:10:33 -0400
Date:   Mon, 24 Jul 2023 11:10:33 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Johan Hovold <johan@kernel.org>, gregkh@linuxfoundation.org,
        liulongfang@huawei.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: hub: make sure stale buffers are not enumerated
Message-ID: <1788c38e-5ad1-4e93-8f3f-0f6284cf2e2b@rowland.harvard.edu>
References: <20230724124057.12975-1-oneukum@suse.com>
 <ZL6CHnYEmxssGXRG@hovoldconsulting.com>
 <1ae1ad1c-34ad-3a1d-baa7-529832ed42eb@suse.com>
 <1fa217a4-0150-4658-bf13-eaf34d300d65@rowland.harvard.edu>
 <1f4090e2-7658-da50-334a-69e09f635d7e@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1f4090e2-7658-da50-334a-69e09f635d7e@suse.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 24, 2023 at 04:31:08PM +0200, Oliver Neukum wrote:
> On 24.07.23 16:29, Alan Stern wrote:
> > How can it?  bDescriptorType is at the start of the device descriptor,
> > whereas bMaxPacketSize0 is more towards the end.  If the later part get
> > transferred from the device, the earlier part must have been transferred
> > as well.  Even if the transfer was short.
> 
> Do we really guarantee that in an error case the buffer is filled from front
> to back?

We don't guarantee anything in an error case.  But for short transfers 
with no other errors, yes, this is guaranteed.

However if you still want to address this concern, just set 
buf->bDescriptorType to 0 at the same time as buf->bMaxPacketSize0.

Alan Stern
