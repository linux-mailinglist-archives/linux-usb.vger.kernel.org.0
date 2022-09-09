Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B4D405B3EEB
	for <lists+linux-usb@lfdr.de>; Fri,  9 Sep 2022 20:35:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbiIISe7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Sep 2022 14:34:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229727AbiIISe5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Sep 2022 14:34:57 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 247F432DA1
        for <linux-usb@vger.kernel.org>; Fri,  9 Sep 2022 11:34:57 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id B5F98620B3
        for <linux-usb@vger.kernel.org>; Fri,  9 Sep 2022 18:34:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE13FC433C1;
        Fri,  9 Sep 2022 18:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1662748496;
        bh=yZ4MAFCVB+cQNsqJaOyOEF04nxDJME0ywiuUdkUSbNg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KJ7ibX3TjBZlPNl7hcSL/P9ViVd6d41RraV/tuVykys72pE8vUjoYRmkzhc5XnYfY
         WMqFDGrF9+zE02yrGJiKT5JeurV4P0yQmEQRVmHJGE0Dxjt1fGMjrL9Ev6sQFea5d2
         A0kgk6kXy9/4ZnQAnaNXROFI6mkgIjBv2JIsluV4=
Date:   Fri, 9 Sep 2022 20:34:53 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     "stern@rowland.harvard.edu" <stern@rowland.harvard.edu>
Cc:     "zhongling0719@126.com" <zhongling0719@126.com>,
        "zenghongling@kylinos.cn" <zenghongling@kylinos.cn>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "usb-storage@lists.one-eyed-alien.net" 
        <usb-storage@lists.one-eyed-alien.net>
Subject: Re: Re: [PATCH v4 3/3] uas: ignore UAS for Thinkplus chips
Message-ID: <YxuHTRKC3Gv7cemF@kroah.com>
References: <1662720530-32313-1-git-send-email-zenghongling@kylinos.cn>
 <YxsucjOnUkb8NxKo@rowland.harvard.edu>
 <202209092121245768249@126.com>
 <YxuDzEdZX1zrIwOQ@rowland.harvard.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YxuDzEdZX1zrIwOQ@rowland.harvard.edu>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 09, 2022 at 02:19:56PM -0400, stern@rowland.harvard.edu wrote:
> On Fri, Sep 09, 2022 at 09:22:25PM +0800, zhongling0719@126.com wrote:
> > Sorry , I tested it work well on Win7, not good on Win10. 
> 
> I would guess that Windows 7 doesn't use UAS but Windows 10 does.  It's 
> surprising that these devices can be sold nowadays if they don't work 
> with Windows 10 -- who would buy them?
> 
> > I don't have Mac OSX system. We always work on linux environment.
> > Need I resend the version V5 for patch 3  cancel "acked by" ?
> 
> Greg, do you have an opinion?  I don't feel very strongly about this.

I'm going to drop all of these now as they are not being sent properly
despite numerous requests to have them done so :(

So yes, if they want to be applied, we need another version.

But again, I find it very very hard to believe they do not work properly
on Windows 10/11/OSX as well as Windows 10 has been out for a very long
time now and no one would accept such poor performance on those devices.

thanks,

greg k-h
