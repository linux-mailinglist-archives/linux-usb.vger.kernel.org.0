Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 089014810F6
	for <lists+linux-usb@lfdr.de>; Wed, 29 Dec 2021 09:33:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234577AbhL2IdF (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 29 Dec 2021 03:33:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40604 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234530AbhL2IdF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 29 Dec 2021 03:33:05 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F13FC061574
        for <linux-usb@vger.kernel.org>; Wed, 29 Dec 2021 00:33:05 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id A663E613C5
        for <linux-usb@vger.kernel.org>; Wed, 29 Dec 2021 08:33:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99948C36AE9;
        Wed, 29 Dec 2021 08:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1640766784;
        bh=k5bWHLTvl+600i9ss+XPEZJ7n15j2MzYfLXtm2iOfhc=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=WtkWMBGcnqqk+U2Bh1HXDRiRwCVcupTH1coqxnRbfiPRZ1XYuOhioshKhnhQl921R
         t97tf8Z7Flyw3+lkzAHF8BvGPQRqF3ncNa72gbsuyM1Xi5K5eHs/3GsEBXi6lS6iLe
         H0t7H6a7gDREQ4bP52qQNuekH08JJj1sDBrBU4p8=
Date:   Wed, 29 Dec 2021 09:32:54 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Christian <tostc6@gmail.com>
Cc:     linux-usb@vger.kernel.org
Subject: Re: PROBLEM: USB stops working
Message-ID: <YcwdNmKsR9tLAA3I@kroah.com>
References: <2d6aeefb-97ea-c6e9-0824-a918f6ec5b4c@gmail.com>
 <083d3bab-df88-d2e2-9334-c8367da39e7b@gmail.com>
 <Ycs0AJDaRkJwTZI9@kroah.com>
 <f8fa9af6-bcd0-3bea-59b9-a698ad2e2bce@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8fa9af6-bcd0-3bea-59b9-a698ad2e2bce@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On Tue, Dec 28, 2021 at 09:37:24PM +0100, Christian wrote:
> Unfortunately there is no notification if something crashes. Only my USB
> devices no longer work. To be honest, I haven't looked in the log files for
> a crash until now. In addition, I could not provoke the complete crash now.
> For testing I switched from the nvidia driver to the nouveau driver and the
> problems are gone. Now I have other issues but these are related to the
> Nouveau driver and the fact that I haven't set it up accordingly. So can I
> assume that this is not a USB problem, but rather an nvidia problem?

Yes, it looks like the issue is due to the closed source nvidia driver,
sorry.  Please contact nvidia about this, as there's nothing we can do.

greg k-h
