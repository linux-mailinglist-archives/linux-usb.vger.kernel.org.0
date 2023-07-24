Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0179275F9E3
	for <lists+linux-usb@lfdr.de>; Mon, 24 Jul 2023 16:29:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229887AbjGXO3S (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Jul 2023 10:29:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229692AbjGXO3R (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Jul 2023 10:29:17 -0400
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id B5915E6
        for <linux-usb@vger.kernel.org>; Mon, 24 Jul 2023 07:29:16 -0700 (PDT)
Received: (qmail 1849056 invoked by uid 1000); 24 Jul 2023 10:29:16 -0400
Date:   Mon, 24 Jul 2023 10:29:16 -0400
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     Johan Hovold <johan@kernel.org>, gregkh@linuxfoundation.org,
        liulongfang@huawei.com, linux-usb@vger.kernel.org
Subject: Re: [PATCH] USB: hub: make sure stale buffers are not enumerated
Message-ID: <1fa217a4-0150-4658-bf13-eaf34d300d65@rowland.harvard.edu>
References: <20230724124057.12975-1-oneukum@suse.com>
 <ZL6CHnYEmxssGXRG@hovoldconsulting.com>
 <1ae1ad1c-34ad-3a1d-baa7-529832ed42eb@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ae1ad1c-34ad-3a1d-baa7-529832ed42eb@suse.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_PASS,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jul 24, 2023 at 04:24:55PM +0200, Oliver Neukum wrote:
> On 24.07.23 15:52, Johan Hovold wrote:
> 
> > 
> > This patch is neither correct or needed. The current implementation sets
> > 	
> > 	buf->bMaxPacketSize0 = 0
> > 
> > before reading the descriptor and makes sure that that field is non-zero
> > before accessing buf->bDescriptorType which lies before bMaxPacketSize0.
> > 
> > It may be subtle, but it looks correct.
> 
> True, but I am afraid not sufficient. It neglects the case of getting
> a partial read. That is
> 
> buf->bMaxPacketSize0
> 
> can be genuine, but the later test
> if (buf->bDescriptorType ==
>             USB_DT_DEVICE) {
> 
> still spuriously succeed

How can it?  bDescriptorType is at the start of the device descriptor, 
whereas bMaxPacketSize0 is more towards the end.  If the later part get 
transferred from the device, the earlier part must have been transferred 
as well.  Even if the transfer was short.

Alan Stern
