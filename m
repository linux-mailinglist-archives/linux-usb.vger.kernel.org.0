Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 282C5186582
	for <lists+linux-usb@lfdr.de>; Mon, 16 Mar 2020 08:19:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729862AbgCPHTR (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 16 Mar 2020 03:19:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:48106 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729455AbgCPHTR (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Mon, 16 Mar 2020 03:19:17 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EFADD205ED;
        Mon, 16 Mar 2020 07:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584343156;
        bh=RotL3CgXoR6T5UIHr7aPqpQ44J38JKKkEPnvOHGpZbU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YixRJO0m80NiLVZZzN7qFjNWfZ85DrLh5xJeDSseQlPC4OVu3cmDS3nLMFlG9zcKi
         6bc8R0DMI6HiIL/57C+WL58SthGUvgOleibcSewVCfkR5YgG6x15CFqaIWLr90vC9X
         atXuceLHQAS0BfTKZmL4IfTdRn/b4eC5rs6OtghY=
Date:   Mon, 16 Mar 2020 08:19:13 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Felipe Balbi <balbi@kernel.org>
Cc:     Masahiro Yamada <masahiroy@kernel.org>, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Johan Hovold <johan@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
Subject: Re: [PATCH] usb: get rid of 'choice' for legacy gadget drivers
Message-ID: <20200316071913.GA3019942@kroah.com>
References: <20200315154948.26569-1-masahiroy@kernel.org>
 <875zf42313.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <875zf42313.fsf@kernel.org>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Mar 16, 2020 at 09:05:12AM +0200, Felipe Balbi wrote:
> 
> Hi,
> 
> Masahiro Yamada <masahiroy@kernel.org> writes:
> > drivers/usb/gadget/legacy/Kconfig creates a 'choice' inside another
> > 'choice'.
> >
> > The outer choice: line 17 "USB Gadget precomposed configurations"
> > The inner choice: line 484 "EHCI Debug Device mode"
> >
> > I wondered why the whole legacy gadget drivers reside in such a big
> > choice block.
> >
> > This dates back to 2003, "[PATCH] USB: fix for multiple definition of
> > `usb_gadget_get_string'". [1]
> >
> > At that time, the global function, usb_gadget_get_string(), was linked
> > into multiple drivers. That was why only one driver was able to become
> > built-in at the same time.
> >
> > Later, commit a84d9e5361bc ("usb: gadget: start with libcomposite")
> > moved usb_gadget_get_string() to a separate module, libcomposite.ko
> > instead of including usbstring.c from multiple modules.
> >
> > More and more refactoring was done, and after commit 1bcce939478f
> > ("usb: gadget: multi: convert to new interface of f_mass_storage"),
> > you can link multiple gadget drivers into vmlinux without causing
> > multiple definition error.
> >
> > This is the only user of the nested choice structure ever. Removing
> > this mess will make some Kconfig cleanups possible.
> >
> > [1]: https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/commit/?id=fee4cf49a81381e072c063571d1aadbb29207408
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> 
> Greg, if you want to pick this for v5.7, please go ahead:
> 
> Acked-by: Felipe Balbi <balbi@kernel.org>

Thanks, will take it later today.

greg k-h
