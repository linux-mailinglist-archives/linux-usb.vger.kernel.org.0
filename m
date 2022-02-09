Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4BC3B4AF480
	for <lists+linux-usb@lfdr.de>; Wed,  9 Feb 2022 15:55:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235266AbiBIOyK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 9 Feb 2022 09:54:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231990AbiBIOyK (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 9 Feb 2022 09:54:10 -0500
Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
        by lindbergh.monkeyblade.net (Postfix) with SMTP id 8BB50C06157B
        for <linux-usb@vger.kernel.org>; Wed,  9 Feb 2022 06:54:08 -0800 (PST)
Received: (qmail 563326 invoked by uid 1000); 9 Feb 2022 09:54:08 -0500
Date:   Wed, 9 Feb 2022 09:54:08 -0500
From:   Alan Stern <stern@rowland.harvard.edu>
To:     Ingo Rohloff <ingo.rohloff@lauterbach.com>
Cc:     gregkh@linuxfoundation.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v2 0/1] USB: usbfs: replace atomic64 accesses by spinlock
Message-ID: <YgPVkOF6H2D0UD4p@rowland.harvard.edu>
References: <20220209123303.103340-1-ingo.rohloff@lauterbach.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220209123303.103340-1-ingo.rohloff@lauterbach.com>
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,
        HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_PASS,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Feb 09, 2022 at 01:33:02PM +0100, Ingo Rohloff wrote:
> V2: 
> Incorporated Alan Sterns review comments: 
> Thanks for mentioning the READ_ONCE() semantics; I really had no clue.
> 
> Note: 
> I think it's also correct to NOT use the "irqsave" variants
> of spin_lock_irq/spin_unlock_irq in "usbfs_increase_memory_usage()".
> 
> I am not sure if it's worth it?

I checked the file, and it does look as though these routines are called 
only in contexts that can sleep.  But using the _irq variants doesn't 
hurt much, so you might as well keep it that way.

Alan Stern
