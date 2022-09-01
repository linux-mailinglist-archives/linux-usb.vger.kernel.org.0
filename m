Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DD1235A9A5E
	for <lists+linux-usb@lfdr.de>; Thu,  1 Sep 2022 16:32:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234582AbiIAOc1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Sep 2022 10:32:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234104AbiIAOc0 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Sep 2022 10:32:26 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B25E572B6B
        for <linux-usb@vger.kernel.org>; Thu,  1 Sep 2022 07:32:25 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4A4C661D21
        for <linux-usb@vger.kernel.org>; Thu,  1 Sep 2022 14:32:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38500C433D6;
        Thu,  1 Sep 2022 14:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1662042744;
        bh=bFlTwOoof4OBLvFR+zi31qCdKorAk+yKk7zPo5ps7LE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i8c3MXZGRP2Kg0ZXCY5BZZGEHFNjsuAXIzfvNgtzO84PXpPvNy6sr8Y4+s+w0tA0W
         rOZCK3rAYKtOFtX28icDffL9yz6fu5vhCq+BXtkIXvSYo5XOcu28QrTymv/6xPJz2q
         3A+nyzJ4s+rZ7j0E0NKvCcBuih4DSd310vhdo8f4=
Date:   Thu, 1 Sep 2022 16:32:21 +0200
From:   gregkh <gregkh@linuxfoundation.org>
To:     "zhongling0719@126.com" <zhongling0719@126.com>
Cc:     zenghongling <zenghongling@kylinos.cn>,
        stern <stern@rowland.harvard.edu>,
        linux-usb <linux-usb@vger.kernel.org>,
        usb-storage <usb-storage@lists.one-eyed-alien.net>
Subject: Re: Re: [PATCH v4] uas: add no-uas quirk for Thinkplus and Hiksemi
 usb-storage
Message-ID: <YxDCdQ885wdyr8wG@kroah.com>
References: <1662015653-12976-1-git-send-email-zenghongling@kylinos.cn>
 <YxBvNEn0jEEd0lXV@kroah.com>
 <2022090120371974113815@126.com>
 <YxCtyOUkRlIqcC4d@kroah.com>
 <2022090121570194160929@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2022090121570194160929@126.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
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

On Thu, Sep 01, 2022 at 09:58:03PM +0800, zhongling0719@126.com wrote:
> Some UASP capable USB-to-SATA bridge controllers are not compatible,this problem has always existed.

What problem is this exactly?  Why is this failing on only Linux?

> you can refer to other auther submit the similar patch.

What other author and other patch?

> this patch is fixed no speed,not slow speed.

I do not understand, sorry.

thanks,

greg k-h
