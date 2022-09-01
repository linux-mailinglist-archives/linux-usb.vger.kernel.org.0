Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DC3C35A93D8
	for <lists+linux-usb@lfdr.de>; Thu,  1 Sep 2022 12:03:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233867AbiIAKDH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 1 Sep 2022 06:03:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233588AbiIAKC5 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 1 Sep 2022 06:02:57 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 574EF155A5D
        for <linux-usb@vger.kernel.org>; Thu,  1 Sep 2022 03:02:48 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 76479B8255E
        for <linux-usb@vger.kernel.org>; Thu,  1 Sep 2022 10:02:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB498C433C1;
        Thu,  1 Sep 2022 10:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1662026565;
        bh=45DSY3xPoOwg/iyKAJpPMQOatHzInrzxLnPAAX5Zdbc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=1mBbkIiTBa7VEqhQ2Nanr1L68GYzc/bQZNYNjVrb58XHwmIB6hG4BQ8wEer0I0WtL
         Kj+b1QEdZtzNtPg6MnXWAw6ocVkJBTwEZX0n+s1gbCvMr87eWo5O5T2u0JNIgopkq0
         fV/IDRIe5GaT+WjgVzxMpOdpKTN1JwBKTQUNb32c=
Date:   Thu, 1 Sep 2022 12:02:42 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     dd <zhongling0719@126.com>
Cc:     zenghongling <zenghongling@kylinos.cn>, stern@rowland.harvard.edu,
        linux-usb@vger.kernel.org, usb-storage@lists.one-eyed-alien.net
Subject: Re: Re: [PATCH v4] uas: add no-uas quirk for Thinkplus and Hiksemi
 usb-storage
Message-ID: <YxCDQi3TpXbcwCQ5@kroah.com>
References: <1662015653-12976-1-git-send-email-zenghongling@kylinos.cn>
 <YxBvNEn0jEEd0lXV@kroah.com>
 <409cbf8b.5b1a.182f8682364.Coremail.zhongling0719@126.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <409cbf8b.5b1a.182f8682364.Coremail.zhongling0719@126.com>
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

On Thu, Sep 01, 2022 at 05:35:50PM +0800, dd wrote:
> Hi:

Please fix your email client to not send html email, as that is rejected
by the mailing list and will not show up to anyone :(

Can you fix that up and respond again?

thanks,

greg k-h
