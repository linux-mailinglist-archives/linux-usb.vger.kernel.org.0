Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 518C356BA24
	for <lists+linux-usb@lfdr.de>; Fri,  8 Jul 2022 14:55:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237642AbiGHMzP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Jul 2022 08:55:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232561AbiGHMzO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 8 Jul 2022 08:55:14 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 152BF1F62C
        for <linux-usb@vger.kernel.org>; Fri,  8 Jul 2022 05:55:14 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A3EC162765
        for <linux-usb@vger.kernel.org>; Fri,  8 Jul 2022 12:55:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7370C341C0;
        Fri,  8 Jul 2022 12:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1657284913;
        bh=nleWThCOvk+ho8uMx/lGDG4yD5Yr5RMgzx2maD+KSMM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SGh6DnPwlrYpCOyfonmQQM3s372l+8pSSFNvVKG+6gE4jAlg81uv80UG6yDOLlHNl
         +CX/uIX63fIvIdPygPS+yXDSKGvjFr4rINkmkmDHugDIkv7JQEWvnNk/eisXhPm9Gg
         2ldfD3Bb/1EwldD2FeHUPvfyTVwybpVzMKTFKcys=
Date:   Fri, 8 Jul 2022 14:55:10 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc:     linux-usb@vger.kernel.org, faizel.kb@dicortech.com,
        baihaowen@meizu.com
Subject: Re: [PATCH 0/3] tools: usb: testusb: Fix reported gadget speeds
Message-ID: <YsgpLmE4xbUiuapB@kroah.com>
References: <20220708115859.2095714-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220708115859.2095714-1-bryan.odonoghue@linaro.org>
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Jul 08, 2022 at 12:58:56PM +0100, Bryan O'Donoghue wrote:
> Using the testusb utility on a qcom platform which supports
> super-speed-plus I found that "??" was being reported instead of
> super speed or super-plus speed.
> 
> This is easily solved by aligning the test tool speeds with
> include/uapi/linux/usb/ch9.h::enum usb_device_speed{}
> 
> Before:
> sudo ./testusb -a -t 0
> ?? speed	/dev/bus/usb/004/027	0
> /dev/bus/usb/004/027 test 0,    0.000004 secs
> 
> After:
> sudo ./testusb -a -t 0
> super-plus speed	/dev/bus/usb/004/027	0
> /dev/bus/usb/004/027 test 0,    0.000004 secs

Nice, thanks for fixing these, all now queued up.

greg k-h
