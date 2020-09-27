Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F3AAF27A11B
	for <lists+linux-usb@lfdr.de>; Sun, 27 Sep 2020 14:56:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726376AbgI0M4O (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 27 Sep 2020 08:56:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726280AbgI0M4O (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 27 Sep 2020 08:56:14 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E95C2C0613CE
        for <linux-usb@vger.kernel.org>; Sun, 27 Sep 2020 05:56:13 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id s12so8699002wrw.11
        for <linux-usb@vger.kernel.org>; Sun, 27 Sep 2020 05:56:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ArxkmQAdAw7KZMU68GgFGuPXJ8v9/OYl5x+2XnTNoj4=;
        b=Ck5kjzFxJ5hXvsjU6b2QLSM92FZx+VbUqNlnUGGK0vVIquTzVd3VeTlpiBb2WQ+Oqs
         UYkaq1nMILdtd/g74+xGAk06Hck1Fqt1qoKsQIj4uTphwo4bxph4R+eN0x1nR14hgM87
         UhbFTNHcW69jTbgZYUKdMFNSAxDKfPu2hYARU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ArxkmQAdAw7KZMU68GgFGuPXJ8v9/OYl5x+2XnTNoj4=;
        b=H9JS96tBcZrfmt+7VfmxCwrpcsLXTJEHdLUvBhkaV4D4SLyas50qtnkpXK7aD/gkhd
         8nEBAuPIulGa2dCo9eBKOpyXwJfFKtpOWpvtSs4bJiooaXZMN38kBxMwTrC268TFuTKu
         BZSu3ifiHScI6A9r2E9+la//cSlpLJzPiUnUMQJkhvHAKrTV4TikMJuXAcXhzSnU1y9j
         44ZrcQWzBB3AxPszu8E3xBhPemBHn4AcX3kfT0OE6KhhF7uokbLb7IgTsuVmUVIeYwdd
         YWGOePPeblzV1moXDHaenJm3IOta6ifjUizYTSn7kyv/VceJQ53iRlDm+V44Rtr/TMDs
         jvfQ==
X-Gm-Message-State: AOAM530SwDNausFrIu8j9FDFfE6dW3qhoQcR+uXwir1SZTSym8DMNKCe
        xY4j56vkp7rWmDrJLx9/1AgmHA==
X-Google-Smtp-Source: ABdhPJyDQKAELcthls1L2d043j9x7GjD+7XTshmGvjApMdY2AVDrsfhQ9Ym826nSBuLJJunNVibHIA==
X-Received: by 2002:adf:ffca:: with SMTP id x10mr14909504wrs.342.1601211372674;
        Sun, 27 Sep 2020 05:56:12 -0700 (PDT)
Received: from carbon ([94.26.108.4])
        by smtp.gmail.com with ESMTPSA id v204sm5438417wmg.20.2020.09.27.05.56.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2020 05:56:12 -0700 (PDT)
Date:   Sun, 27 Sep 2020 15:56:10 +0300
From:   Petko Manolov <petko.manolov@konsulko.com>
To:     Greg KH <gregKH@linuxfoundation.org>
Cc:     Petko Manolov <petkan@nucleusys.com>, oneukum@suse.com,
        linux-usb@vger.kernel.org
Subject: Re: [PATCH v3 0/2] Use the new usb control message API.
Message-ID: <20200927125610.GA6218@carbon>
References: <20200923134348.23862-9-oneukum@suse.com>
 <20200926091327.8021-1-petkan@nucleusys.com>
 <20200927101631.GA85411@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200927101631.GA85411@kroah.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 20-09-27 12:16:31, Greg KH wrote:
> On Sat, Sep 26, 2020 at 12:13:25PM +0300, Petko Manolov wrote:
> > From: Petko Manolov <petko.manolov@konsulko.com>
> > 
> > Open coding, ccasional improper error handling by the caller of 
> > usb_control_msg() and not flagging partial read as an error requires a new 
> > API that takes care of these issues.  It took the form of 
> > usb_control_msg_send/recv() and this patch series is converting Pegasus and 
> > RTL8150 drivers to using the proper calls.
> > 
> > Petko Manolov (2): net: pegasus: Use the new usb control message API. net: 
> >   rtl8150: Use the new usb control message API.
> > 
> >  drivers/net/usb/pegasus.c | 61 ++++++++++----------------------------- 
> >  drivers/net/usb/rtl8150.c | 32 ++++---------------- 2 files changed, 21 
> >  insertions(+), 72 deletions(-)
> 
> Normally drivers/net/ stuff gets sent to the netdev mailing list.
> 
> I don't want to take patches that those maintainers/developers have not seen 
> and acked yet, so can you resend this series and also cc: them?

The changes are entirely in the USB land and thus unrelated to the networking 
part of the driver.  However, getting their ack is perhaps the right thing to do 
so i just followed your advice. :)


cheers,
Petko
