Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D27B7687748
	for <lists+linux-usb@lfdr.de>; Thu,  2 Feb 2023 09:26:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232055AbjBBI0I (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 2 Feb 2023 03:26:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231811AbjBBI0H (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 2 Feb 2023 03:26:07 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4BC0A258
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 00:26:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 600486134C
        for <linux-usb@vger.kernel.org>; Thu,  2 Feb 2023 08:26:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 56DEBC433D2;
        Thu,  2 Feb 2023 08:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1675326364;
        bh=pcm28GPsxpE7XO7mrn7XnVOtMzz1kqzK/fhi7xMmeCI=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JDz8GB8ykoxA5kP8yndEnF277NUmkLJyHrPv9FyEfys9v3G0CgSOJIIDpq3sDXnBP
         X/2Th/zcmWFE0tZFNMIDH81X+Syiz9YtKW8wS4H7JuOyuRrvAj9bAiuxrRTM2UETan
         uJF7FE3wB1EA9lk9HB0CcaV9auCax3IjwmbkBUMk=
Date:   Thu, 2 Feb 2023 09:26:01 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     hector@ikatu.com
Cc:     felipe.balbi@linux.intel.com, linux-usb@vger.kernel.org,
        Federico =?iso-8859-1?Q?Nu=F1ez?= <fna@ikatu.com>
Subject: Re: [BUG REPORT] usb: dwc3: Bug while trying to use a RF ID Reader
 connected to USB port
Message-ID: <Y9tzmR0IhJ+1tyeW@kroah.com>
References: <707b75a4895e3fd898b3e516e562d843@ikatu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <707b75a4895e3fd898b3e516e562d843@ikatu.com>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Feb 01, 2023 at 05:32:15PM -0300, hector@ikatu.com wrote:
> Hi!
> 
> thanks in advance if you read this!

Note, Felipe is no longer the maintainer of this driver, you might want
to update your kernel tree.  And along those lines:

> I'm having issues trying to use a RF ID Reader connected to USB port.
> The platform I'm using is based on rockchip rk3328. Linux version:
> 5.15.78-yocto-standard.

That is very old, the dwc3 driver has changed a lot in the years since
the 5.15 kernel was released.  Any chance you can try 6.1 instead?

thanks,

greg k-h
