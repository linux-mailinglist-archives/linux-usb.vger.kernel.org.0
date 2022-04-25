Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AD5E450E30E
	for <lists+linux-usb@lfdr.de>; Mon, 25 Apr 2022 16:27:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242497AbiDYO3M convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Mon, 25 Apr 2022 10:29:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238004AbiDYO3E (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 25 Apr 2022 10:29:04 -0400
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC73925C4E
        for <linux-usb@vger.kernel.org>; Mon, 25 Apr 2022 07:25:43 -0700 (PDT)
Received: (Authenticated sender: hadess@hadess.net)
        by mail.gandi.net (Postfix) with ESMTPSA id 4597740005;
        Mon, 25 Apr 2022 14:25:41 +0000 (UTC)
Message-ID: <32ce06a72253e4b548581c1d8b13e3a9469a8165.camel@hadess.net>
Subject: Re: [RFC v1] USB: core: add USBDEVFS_REVOKE ioctl
From:   Bastien Nocera <hadess@hadess.net>
To:     Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Peter Hutterer <peter.hutterer@who-t.net>
Date:   Mon, 25 Apr 2022 16:25:40 +0200
In-Reply-To: <903b294f-8407-3438-54a9-3c96e361be41@suse.com>
References: <20220425132315.924477-1-hadess@hadess.net>
         <903b294f-8407-3438-54a9-3c96e361be41@suse.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
User-Agent: Evolution 3.44.0 (3.44.0-1.fc36) 
MIME-Version: 1.0
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, 2022-04-25 at 15:49 +0200, Oliver Neukum wrote:
> 
> 
> On 25.04.22 15:23, Bastien Nocera wrote:
> >  struct usb_memory {
> > @@ -237,6 +238,9 @@ static int usbdev_mmap(struct file *file,
> > struct vm_area_struct *vma)
> >         dma_addr_t dma_handle;
> >         int ret;
> >  
> > +       if (!connected(ps) || ps->revoked)
> > +               return -ENODEV;
> > +
> This lacks locking.

I'll look into straightening out the locking, thanks.
