Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 405682B2C9C
	for <lists+linux-usb@lfdr.de>; Sat, 14 Nov 2020 11:10:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726630AbgKNKI7 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 14 Nov 2020 05:08:59 -0500
Received: from Galois.linutronix.de ([193.142.43.55]:58216 "EHLO
        galois.linutronix.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726513AbgKNKI7 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 14 Nov 2020 05:08:59 -0500
Date:   Sat, 14 Nov 2020 11:08:56 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1605348537;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=1V50Zg78707rsYoL0SZ7xZ/U9FS3p3fLToTa/VAqyno=;
        b=Qjw1rBfCFcEuR8CnmgQenZRD4keYorw+adBELGSQjv9QGABUKt/cELp+abq/O3YNvMTR6s
        AcNh9+CYREgTzIFo3eEbOCDSuoMO0MOtFPe1X4KBA7gi/Nkw2ariBSC+sSrJiEpBeG4tNl
        4kQ33Fru/VeN5piic4LQs1vD67QOPiXn7nVJj/mLMXgtofdWDy9eAJG5AV5SLH8D2DXEo2
        5Wcf51JPpMXjFeRujaSxVStDgY9hIuOOMZ72XmoRVywBKreG6rfmnUwT/k/p9i7NejZlZT
        Wc8jc9VlFU6kXM2EUZvbHeraWpRZGlu0smsbSzncVzFfU18RqEMcwkQOy6NfwA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1605348537;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=1V50Zg78707rsYoL0SZ7xZ/U9FS3p3fLToTa/VAqyno=;
        b=+mn2N4kZkUVhfImXfwb4ToV2qk8G8UTLvqO0dwReemQmX4NdBjupLHWWHPrcAszZOHCu65
        zszoEwXZoJQDcbAA==
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] usb: Remove RUN_CONTEXT
Message-ID: <20201114100856.ncwcel2zd76n7ocv@linutronix.de>
References: <20201113212704.2243807-1-bigeasy@linutronix.de>
 <X68NBdTy2F/IeZ2Y@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <X68NBdTy2F/IeZ2Y@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 2020-11-13 23:47:33 [+0100], Greg Kroah-Hartman wrote:
> On Fri, Nov 13, 2020 at 10:27:04PM +0100, Sebastian Andrzej Siewior wrote:
> > The last user of RUN_CONTEXT was removed in commit
> >    97c17beb3b668 ("[PATCH] ehci-hcd (1/2):  portability (2.4), tasklet,")
> 
> I don't see that git commit id in Linus's tree, nor in my usb.git tree.
> Where does it live?

As a archaeologist I have the history trees linked in my tree. This is
from:
   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/history.git/commit/?id=97c17beb3b668c79ef5d056b3f687aa0be2d672f

> thanks,
> 
> greg k-h

Sebastian
