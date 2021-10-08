Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 06BF2426420
	for <lists+linux-usb@lfdr.de>; Fri,  8 Oct 2021 07:38:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229582AbhJHFkH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 8 Oct 2021 01:40:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:58440 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229511AbhJHFkG (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Fri, 8 Oct 2021 01:40:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8188061090;
        Fri,  8 Oct 2021 05:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1633671492;
        bh=7zxDJqCuKjOUMQzYl1hkBJUtFDCCti1gO6KQRT+M5a4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=chtG6nTFE936el7PeLj6z48C+W28WzixY6Nq0YIxw0OtIXBQWLvPMjyKbuqxrLPtX
         woT4u64WqxOYM3NQXMLvOwS7Ej3qwghrnAJ0pX9y9zKWkW54RhJ9aECBYZ4R1yEFqK
         WFv5DQrlukahbAFwJCGrb1R+DAQ1dhXbdTqSKo08=
Date:   Fri, 8 Oct 2021 07:38:08 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Jack Pham <quic_jackp@quicinc.com>
Cc:     Linyu Yuan <quic_linyyuan@quicinc.com>,
        Felipe Balbi <balbi@kernel.org>, linux-usb@vger.kernel.org,
        Trilok Soni <quic_tsoni@quicinc.com>
Subject: Re: [PATCH v5 3/3] usb: gadget: configfs: add some trace event
Message-ID: <YV/ZQNsLaPBLQYef@kroah.com>
References: <1630976977-13938-1-git-send-email-quic_linyyuan@quicinc.com>
 <1630976977-13938-4-git-send-email-quic_linyyuan@quicinc.com>
 <YVwz/EY4A/y4rY48@kroah.com>
 <20211008005910.GA7123@jackp-linux.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211008005910.GA7123@jackp-linux.qualcomm.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Thu, Oct 07, 2021 at 06:09:52PM -0700, Jack Pham wrote:
> On Tue, Oct 05, 2021 at 01:16:12PM +0200, Greg Kroah-Hartman wrote:
> > On Tue, Sep 07, 2021 at 09:09:37AM +0800, Linyu Yuan wrote:
> 
> > > Signed-off-by: Linyu Yuan <quic_linyyuan@quicinc.com>
> 
> > > diff --git a/drivers/usb/gadget/configfs_trace.h b/drivers/usb/gadget/configfs_trace.h
> > > new file mode 100644
> > > index 0000000..59d73d5
> > > --- /dev/null
> > > +++ b/drivers/usb/gadget/configfs_trace.h
> > > @@ -0,0 +1,167 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * Copyright (c) 2021 Qualcomm Innovation Center, Inc. All rights reserved.
> > 
> > Wrong copyright notice, right?  I could be wrong, but you might want to
> > check...
> 
> FYI this is correct.  Qualcomm is currently in transition and some
> developers have started sending patches from a @quicinc.com email
> address.  New files sent in this manner will be attributed using this
> copyright notice (and is approved by our legal team).

Thanks for letting me know, is there some guideline as to what code gets
what copyright during the "transition" phase?

thanks,

greg k-h
