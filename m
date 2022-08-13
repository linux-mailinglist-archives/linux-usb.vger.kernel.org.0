Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC02F59192B
	for <lists+linux-usb@lfdr.de>; Sat, 13 Aug 2022 09:14:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235100AbiHMHOz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 13 Aug 2022 03:14:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229507AbiHMHOx (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 13 Aug 2022 03:14:53 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BE95459B1
        for <linux-usb@vger.kernel.org>; Sat, 13 Aug 2022 00:14:52 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8F69D60B1F
        for <linux-usb@vger.kernel.org>; Sat, 13 Aug 2022 07:14:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26C43C433D7;
        Sat, 13 Aug 2022 07:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1660374891;
        bh=/dB1yvm3krNBxS/0znrrgchb4mu5dTWN1dQTUk8KfIQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Om4T9kCbpttzCtdwPsalDmOHeni8y75rST3Jh2MP5JEB7+MJU+wh/5QmFZkaNmrKa
         J+XWhlO3kYsKkPP0ySUWH0hGzhN07rGbiHt6J6ovCNSverCrdWc7DSn0Y2Atm7ZmA1
         ipnbvsfiCdxJZ7SvDaFngJASiFiVoAI2plKFj+zA=
Date:   Sat, 13 Aug 2022 09:14:48 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Frank Mori Hess <fmh6jj@gmail.com>
Cc:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        linux-usb@vger.kernel.org
Subject: Re: [BUG] usb: usbhid: after -EPIPE from interrupt urb, input state
 is not resynced
Message-ID: <YvdPaHchFlmWVevN@kroah.com>
References: <CAJz5Opf2Sjdx_At8abHwby7w+HxLcZLZ63my-8qOUA3yuS85wQ@mail.gmail.com>
 <CAJz5Opd-p5MoNyTXqPwoQ1+zTHV_hWeb+yhZgh7PbQMJMW7PoA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJz5Opd-p5MoNyTXqPwoQ1+zTHV_hWeb+yhZgh7PbQMJMW7PoA@mail.gmail.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Aug 12, 2022 at 10:31:53PM -0400, Frank Mori Hess wrote:
> On Fri, Aug 12, 2022 at 10:27 PM Frank Mori Hess <fmh6jj@gmail.com> wrote:
> >
> > After an interrupt urb with status -EPIPE is seen in the completion
> > handler hid_irq_in, there is no  GetReport performed over the control
> > endpoint to compensate for potentially lost interrupt urbs.
> 
> Oh, and I should mention I'm using an old kernel 5.4.13, actually not
> sure if new kernels behave differently.

Please try something more modern, the 5.4 kernel was from 2019.

thanks,

greg k-h
