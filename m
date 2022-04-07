Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C81A64F8228
	for <lists+linux-usb@lfdr.de>; Thu,  7 Apr 2022 16:52:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241226AbiDGOyU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 7 Apr 2022 10:54:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241089AbiDGOyR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 7 Apr 2022 10:54:17 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24C47EF0BB
        for <linux-usb@vger.kernel.org>; Thu,  7 Apr 2022 07:52:16 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id CAB4EB8278A
        for <linux-usb@vger.kernel.org>; Thu,  7 Apr 2022 14:52:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2BB8CC385A4;
        Thu,  7 Apr 2022 14:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1649343130;
        bh=1PTdJMT7CkpRzpQj/ZoxZHhSg2F87Oszis7kRMudXh4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WST7NwRmNyq5hkosJ7bIhAO4mVQosadykCThzkmqBbb8xtrhBvdPA30H7hd9y+lYM
         ikRpG3BIF2Go7Pa5wC8sLQ5mS94NrfwXjuYrHwtnD4H5GO3y6mYmwQap029nrHhVyR
         WjP0DJ3hsbOIxYnPT4JujEYUMyvqQYPcNZFymKEM=
Date:   Thu, 7 Apr 2022 16:52:07 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Michael Grzeschik <mgr@pengutronix.de>
Cc:     linux-usb@vger.kernel.org, balbi@kernel.org,
        paul.elder@ideasonboard.com, kieran.bingham@ideasonboard.com,
        nicolas@ndufresne.ca, laurent.pinchart@ideasonboard.com,
        kernel@pengutronix.de
Subject: Re: [PATCH v7 0/7] usb: gadget: uvc: use configfs entries for
 negotiation and v4l2 VIDIOCS
Message-ID: <Yk76l8XLvDuln++E@kroah.com>
References: <20220315143356.3919911-1-m.grzeschik@pengutronix.de>
 <20220407143429.GC27216@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220407143429.GC27216@pengutronix.de>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

A: http://en.wikipedia.org/wiki/Top_post
Q: Were do I find info about this thing called top-posting?
A: Because it messes up the order in which people normally read text.
Q: Why is top-posting such a bad thing?
A: Top-posting.
Q: What is the most annoying thing in e-mail?

A: No.
Q: Should I include quotations after my reply?

http://daringfireball.net/2007/07/on_top

On Thu, Apr 07, 2022 at 04:34:29PM +0200, Michael Grzeschik wrote:
> Hi!
> 
> This series is laying around another two weeks after it was sent.

The merge window happened when we can not do anything.  You know that :(

> Some feedback would be appreciated to get this code mainline.

Why did you not cc: the v4l mailing list as well?

thanks,

greg k-h
