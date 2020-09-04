Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C0E125D6AF
	for <lists+linux-usb@lfdr.de>; Fri,  4 Sep 2020 12:44:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729961AbgIDKo1 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 4 Sep 2020 06:44:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:57878 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726171AbgIDKo0 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 4 Sep 2020 06:44:26 -0400
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6D5F520770;
        Fri,  4 Sep 2020 10:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599216265;
        bh=3++H5FLh2C1YKek3cWv88BHDHieTeA4Y8dH+wVehUno=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RmdexBTFilHLSNIkaHvBO/F2/GuyHKDcS+HqsCNopLYZoCfCz5wYTnApFBMmRoxEZ
         Dj/U4cNhG8+LwERuak5e6kX2BkeZO8HF1Ppqdm21oI5H1zqqFPlojhDeGFnAnW/JZE
         6VrMndJL1PMyZuGO33R0viJowxGpn111DpfVFa90=
Date:   Fri, 4 Sep 2020 12:44:47 +0200
From:   Greg KH <gregkh@linuxfoundation.org>
To:     PengHao <penghao@uniontech.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, johan@kernel.org, dlaz@chromium.org,
        stern@rowland.harvard.edu, kerneldev@karsmulder.nl,
        jonathan@jdcox.net, tomasz@meresinski.eu
Subject: Re: [PATCH v3] HID: quirks: Add USB_QUIRK_IGNORE_REMOTE_WAKEUP quirk
 for BYD zhaoxin notebook
Message-ID: <20200904104447.GA2727177@kroah.com>
References: <20200904091322.30426-1-penghao@uniontech.com>
 <f519d8a0-9082-13c5-0222-40dd9a1fac36@redhat.com>
 <bd5674f2-67dc-b386-f639-97ddce13b8af@uniontech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bd5674f2-67dc-b386-f639-97ddce13b8af@uniontech.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Fri, Sep 04, 2020 at 06:38:21PM +0800, PengHao wrote:
> Hi, Hans
> 
> Thanks for the review. And sorry for I'm not really familiar with
> mailing list, so didn't reply early.
> 
> Actually the reason why I submit this patch, is the vendor ask we do
> this, they do not want enable touchpad wakeup.

That says _what_ they want to do, but we need to know _why_ this is the
case.

What is wrong with the existing touchpad wakeup functionality that is
broken on this device?  Why does this quirk have to be added, what goes
wrong if it is not added?

Please put that information in the changelog text.

thanks,

greg k-h
