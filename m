Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F9A855CB37
	for <lists+linux-usb@lfdr.de>; Tue, 28 Jun 2022 14:59:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232753AbiF0HV2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 27 Jun 2022 03:21:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232665AbiF0HV1 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 27 Jun 2022 03:21:27 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32F735FE9
        for <linux-usb@vger.kernel.org>; Mon, 27 Jun 2022 00:21:26 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 9AF46B801BF
        for <linux-usb@vger.kernel.org>; Mon, 27 Jun 2022 07:21:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2C39C341C8;
        Mon, 27 Jun 2022 07:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1656314483;
        bh=gaK1TZrgx9OKJtvxrqK03tnZJtBseD/fLK3HCAS5erc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bg0ks0Fl8RvDL0GZIxyERBKCwfccJo2tlehzS1sV64bKiz+5G8tWVIYqiuV8Rbkej
         E5FDkpH6C4d7rtoDYmeUff6fQuz0GDy0SMhhCjfkJGgLaQIYmHlPWVKPmGekV+Lu9x
         Iz2RU/aW/YM9nzLeKYOBFvtAhpG3J413VY9GFJVQ=
Date:   Mon, 27 Jun 2022 09:21:20 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Cc:     Felipe Balbi <balbi@kernel.org>,
        USB list <linux-usb@vger.kernel.org>
Subject: Re: f_hid GET_REPORT extension
Message-ID: <YrlacG25I8bZZ1VR@kroah.com>
References: <CAOf5uwnJ1Z4k6NSqdLZ0UNkbWMdoYgSRecwWNHXMH24_WVZrOg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOf5uwnJ1Z4k6NSqdLZ0UNkbWMdoYgSRecwWNHXMH24_WVZrOg@mail.gmail.com>
X-Spam-Status: No, score=-7.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jun 27, 2022 at 09:06:05AM +0200, Michael Nazzareno Trimarchi wrote:
> Hi Felipe and Greg
> 
> I'm starting to write some code to extend the GET_REPORT and let the
> userspace on the device side to pre-fill the answer on this request.
> Right now the answer is always 0. The idea is to create a sysfs
> support to fill reports struct on report request on the host side.
> This will help to
> emulate devices that export features report for example. As far as I
> understand the hidg side just use read and write and read is used to
> extract
> the result of SET_REPORT is that the gadget is properly configured. Is
> it the right direction?

Without code, it is very hard to understand what you are doing here,
sorry.

Also, why sysfs?

thanks,

greg k-h
