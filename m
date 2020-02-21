Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C30591680DC
	for <lists+linux-usb@lfdr.de>; Fri, 21 Feb 2020 15:54:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728901AbgBUOyD (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 Feb 2020 09:54:03 -0500
Received: from iolanthe.rowland.org ([192.131.102.54]:53796 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S1728803AbgBUOyD (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 Feb 2020 09:54:03 -0500
Received: (qmail 1498 invoked by uid 2102); 21 Feb 2020 09:54:02 -0500
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 21 Feb 2020 09:54:02 -0500
Date:   Fri, 21 Feb 2020 09:54:02 -0500 (EST)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Kees Cook <keescook@chromium.org>
cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Felipe Balbi <balbi@kernel.org>,
        Alexander Potapenko <glider@google.com>,
        <linux-usb@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] usb: gadget: net2280: Distribute switch variables
 for initialization
In-Reply-To: <202002201515.DFC51CF@keescook>
Message-ID: <Pine.LNX.4.44L0.2002210952420.1488-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, 20 Feb 2020, Kees Cook wrote:

> Variables declared in a switch statement before any case statements
> cannot be automatically initialized with compiler instrumentation (as
> they are not part of any execution flow). With GCC's proposed automatic
> stack variable initialization feature, this triggers a warning (and they
> don't get initialized). Clang's automatic stack variable initialization
> (via CONFIG_INIT_STACK_ALL=y) doesn't throw a warning, but it also
> doesn't initialize such variables[1]. Note that these warnings (or silent
> skipping) happen before the dead-store elimination optimization phase,
> so even when the automatic initializations are later elided in favor of
> direct initializations, the warnings remain.
> 
> To avoid these problems, move such variables into the "case" where
> they're used or lift them up into the main function body.
> 
> drivers/usb/gadget/udc/net2280.c: In function ‘handle_stat0_irqs_superspeed’:
> drivers/usb/gadget/udc/net2280.c:2871:22: warning: statement will never be executed [-Wswitch-unreachable]
>  2871 |   struct net2280_ep *e;
>       |                      ^
> 
> [1] https://bugs.llvm.org/show_bug.cgi?id=44916
> 
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
> v2: put everything in function body (Alan Stern)
> v1: https://lore.kernel.org/lkml/20200220062315.69253-1-keescook@chromium.org

You might want to remove part of the last sentence in the patch
description.  Aside from that,

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern

