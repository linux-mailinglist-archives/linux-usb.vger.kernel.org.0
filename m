Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BAD7D729569
	for <lists+linux-usb@lfdr.de>; Fri,  9 Jun 2023 11:36:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241167AbjFIJgf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 9 Jun 2023 05:36:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241128AbjFIJgU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 9 Jun 2023 05:36:20 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C3107297
        for <linux-usb@vger.kernel.org>; Fri,  9 Jun 2023 02:31:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A33C2655CE
        for <linux-usb@vger.kernel.org>; Fri,  9 Jun 2023 09:30:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA546C433EF;
        Fri,  9 Jun 2023 09:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1686303053;
        bh=pOghqFbd881hzqlmNXKrWsrKmmmORgNaVH72VcxbygE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=W2lwxf4p5rqaXUlnO3sQ6bm7kvg94w3F1pTBMFSL3EiSB5IVAeM+E4bEi+x+asSqF
         8clFuTeRI6MZMbVnJqZJgkpyJp7CnLP6KLorTCEjS8Y7WJeXdvyE3sagQwofg2xdcF
         6M92vZUNiwyMlCmQ9S+ul4sAhqWt5hK3RmUMey8E=
Date:   Fri, 9 Jun 2023 11:30:50 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Dmitry Antipov <dmantipov@yandex.ru>
Cc:     Michael Jamet <michael.jamet@intel.com>, linux-usb@vger.kernel.org,
        lvc-project@linuxtesting.org
Subject: Re: [PATCH] thunderbolt: handle possible NULL pointer from
 get_device()
Message-ID: <2023060924-grating-console-95be@gregkh>
References: <20230609061619.57756-1-dmantipov@yandex.ru>
 <2023060911-expose-unplanned-964a@gregkh>
 <d68c759a-e44c-0c6f-03cc-1e07418424eb@yandex.ru>
 <2023060903-unashamed-proactive-8bc9@gregkh>
 <d4ce3fc8-fdc7-109e-f8d6-d1de71639c5e@yandex.ru>
 <2023060939-undead-nuptials-3fc1@gregkh>
 <5048b185-7b8d-a3b4-baf2-2c5e923aac5d@yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5048b185-7b8d-a3b4-baf2-2c5e923aac5d@yandex.ru>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jun 09, 2023 at 12:19:02PM +0300, Dmitry Antipov wrote:
> On 6/9/23 11:20, Greg KH wrote:
> 
> > So far I have seen more and more false-positives from this "tool" of
> > your group that I am very inclined to just tell all kernel maintainers
> > to ignore them for a very long time as you are not following the
> > documented rules for such patches as outlined in
> > Documentation/process/researcher-guidelines.rst
> > 
> > Please read that and fix your tool, and your submission process, I've
> > said this many times already.
> 
> There might be a lot of definitions of what "research" actually is.
> I realize that the maintainers may be very busy, but is it completely
> illegal to sent a patch just to raise the flag and ask to share an
> expertise? Note this was not a private e-mail, and it looks a bit
> strange to treat it just like an attempt to waste your personal time.

As a maintainer, you are asking for others to check your work.  If you
are sending stuff that is incorrect, yes, that is wasting their time.

> And don't you think that such a policy definitely cuts off the
> beginners and makes the community less friendly?

Again, you are asking me to verify that your random tool is somehow
actually sending out correct messages by asking me to review a patch for
it?  It's your responsibility to verify that your tool works properly,
as you are in control of it, so yes, you MUST follow those research
guidelines as that is EXACTLY what they were written for due to problems
exactly like this.

I have pointed out how broken this "tool" is numerous times in the past,
this should not come as a surprise to you at all.

greg k-h
