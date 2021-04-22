Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AD3CA367F45
	for <lists+linux-usb@lfdr.de>; Thu, 22 Apr 2021 13:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235863AbhDVLIv (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Apr 2021 07:08:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230285AbhDVLIv (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Apr 2021 07:08:51 -0400
Received: from rin.romanrm.net (rin.romanrm.net [IPv6:2001:bc8:2dd2:1000::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EAA1C06174A
        for <linux-usb@vger.kernel.org>; Thu, 22 Apr 2021 04:08:16 -0700 (PDT)
Received: from natsu (natsu2.home.romanrm.net [IPv6:fd39::e99e:8f1b:cfc9:ccb8])
        by rin.romanrm.net (Postfix) with SMTP id 11A95713;
        Thu, 22 Apr 2021 11:08:12 +0000 (UTC)
Date:   Thu, 22 Apr 2021 16:08:13 +0500
From:   Roman Mamedov <rm@romanrm.net>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
Subject: Re: Not enough bandwidth for new device state -- with Etron USB3
 controller only
Message-ID: <20210422160813.41e26426@natsu>
In-Reply-To: <YIEOcvePnzGlQtoy@kroah.com>
References: <20210421223732.27080321@natsu>
        <YIEOcvePnzGlQtoy@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

On Thu, 22 Apr 2021 07:49:38 +0200
Greg KH <gregkh@linuxfoundation.org> wrote:

> Not a bug, this is how USB works.  Your first hub really does not have
> enough bandwidth for that device.  Well, we think it doesn't, the
> calculation for that is really really tricky and we error on the side of
> "let's not take the risk and just disable the device to be safe".
> 
> Get a better hub :)

But why the calculation is different when the hub is plugged into the onboard
USB 2.0 controller -- and there it works?

I hope you don't take this as a bug report to make it stop working there as
well. :)

If it's because the Etron controller is USB 3.0, and the higher speeds are
somehow accounted for in the bandwidth calculation, that doesn't seem right,
since both of the plugged in downstream hubs are 1.1/2.0-only.

-- 
With respect,
Roman
