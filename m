Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 512772741D4
	for <lists+linux-usb@lfdr.de>; Tue, 22 Sep 2020 14:11:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726550AbgIVMLM (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 22 Sep 2020 08:11:12 -0400
Received: from mx2.suse.de ([195.135.220.15]:49278 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726505AbgIVMLL (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 22 Sep 2020 08:11:11 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1600776670;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ixF9c+z/unmfEj6OGF+/pDUyaTJ8vYdDVd2OqyFf+uc=;
        b=XbIZFEX5kdJgbFTgQC3BZLH082UFnz3umpJvB2PbuTWDZhGRlLXaq9k3//fBuDPNBMs5JG
        jqYBA5mrYBjUbNtO8mUd9k6CuDIBZvAwaHy0L/1MTKcMH4uhsGGh0SFm8Lim/aXLiFmNQI
        OZ0tk7nnd0QaVQrSk5TcgT3r0k6/zWE=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 80E79B52E;
        Tue, 22 Sep 2020 12:11:47 +0000 (UTC)
Message-ID: <1600776653.6926.21.camel@suse.com>
Subject: Re: [PATCH v2 0/4] USB: cdc-acm: handle broken union descriptors
From:   Oliver Neukum <oneukum@suse.com>
To:     Johan Hovold <johan@kernel.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Daniel Caujolle-Bert <f1rmb.daniel@gmail.com>
Date:   Tue, 22 Sep 2020 14:10:53 +0200
In-Reply-To: <20200921135951.24045-1-johan@kernel.org>
References: <20200921135951.24045-1-johan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Am Montag, den 21.09.2020, 15:59 +0200 schrieb Johan Hovold:
> This series adds support for handling broken union descriptors by
> falling back to "combined-interface" probing.
> 
> The first patch drops some bogus altsetting sanity checks which would
> otherwise have had to be needlessly reproduced for consistency. The
> third patch drops the driver specific data class define in favour of the
> common one. The last one, cleans up the no-union-descriptor handling by
> probing for a "combined-interface" before falling back to the
> call-management descriptor.
> 
> Note that I changed my mind on the stable tag; we can't be overly
> paranoid about a theoretical risk of breaking some quirky devices. And
> if we do, we still want to know about it, right?

Acked-by: Oliver Neukum <oneukum@suse.com>
