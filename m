Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 93993561A68
	for <lists+linux-usb@lfdr.de>; Thu, 30 Jun 2022 14:36:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234376AbiF3Mf6 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 30 Jun 2022 08:35:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233647AbiF3Mf6 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 30 Jun 2022 08:35:58 -0400
Received: from out1.migadu.com (out1.migadu.com [IPv6:2001:41d0:2:863f::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79C8F393F4
        for <linux-usb@vger.kernel.org>; Thu, 30 Jun 2022 05:35:56 -0700 (PDT)
Date:   Thu, 30 Jun 2022 22:31:10 +1000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jookia.org; s=key1;
        t=1656592553;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=kfTrzZ8xzck72PaczDt6B1IYOdQ0YGwvzykHLJGbKH8=;
        b=s5KotbGj4//e6gkA4vVtex0DTHKkO5JupQ3exCXT5DOKDmVkE5rAzxBxuwc9tGQbguWhqs
        xhB1VGIbLb5D6knE0PDVC5to/UrrNlxITqR+ycg94ajoVsRaQq7D6ZvgQLxVOZzdwsAK6Z
        UM5WEaCf+i4fIrP5Vjbl2aHCR7txgEacaYzbcgLeXwxKHDLngPDEcV1nKmzCfwsoCALOVL
        gAHqOKfBkvQiYrNjF6tkeIfbizi/7hvEYnZ2pFb9ZC423VRFC6kQco1dLDxFwmGlu6FBQx
        k/buHw/Zv9cWD+VsHRrJxAyN6rVxb+iTGbjH9iFO3qGeO3KwznX0FCWASszYAQ==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Jookia <contact@jookia.org>
To:     Oliver Neukum <oneukum@suse.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: acm_port_shutdown hangs for 30 seconds
Message-ID: <Yr2Xjf8tsKEeZXYe@novena-choice-citizen>
References: <YiynBKeGJCMEkgyO@novena-choice-citizen>
 <78bf969a-2936-1eee-9d07-9c1694b25761@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78bf969a-2936-1eee-9d07-9c1694b25761@suse.com>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: jookia.org
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Jun 29, 2022 at 02:01:18PM +0200, Oliver Neukum wrote:
> You have something in the buffer, which the tty layer will try to send.
> 
> > In userspace the hang happens at a call to close() on the TTY, and using
> 
> The tty layer is supposed to wait a defined amount of time
> if a tty needs to drain.
> This amount (among many other things) is traditionally
> set with the TIOCSSERIAL ioctl()
> 
> > perf and ftrace it looks to be spending a lot of time poisoning urbs in
> > acm_port_shutdown.
> 
> That is a bit odd.
> 
> > - Is this a bug?
> 
> Maybe, but unlikely. If and only it takes much more time than the
> termios say.
> 
> > - Can I reduce the timeout somehow?
> 
> ioctl() TIOCSSERIAL. If that does not work,
> it's a bug.

This sounds like exactly what's happening. Next time I hit this issue
I'll see if changing closing_wait fixes this.

> 	HTH
> 		Oliver
