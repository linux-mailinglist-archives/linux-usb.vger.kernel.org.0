Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2E8D011A638
	for <lists+linux-usb@lfdr.de>; Wed, 11 Dec 2019 09:49:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728104AbfLKItg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 11 Dec 2019 03:49:36 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:37138 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726983AbfLKItg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 11 Dec 2019 03:49:36 -0500
Received: by mail-lf1-f67.google.com with SMTP id b15so16020538lfc.4
        for <linux-usb@vger.kernel.org>; Wed, 11 Dec 2019 00:49:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ILBol7V8/ocltobJPNTdHu7FNNC5Oj9wOl2+xDJhLto=;
        b=OiWKp1diOFP8o13EmO6CrCdv81zGTB9D6yGN+5HFq7M4K50Mrm0vSvKnSUj2kHxeyJ
         beMt14xw3ILf4IuumOAp7uiYaO6tzgjJEed5fPUOoqIArfNyhq4LGJ3/Tdn64biap6TU
         +XS/8PdaFlOwzSN5CmcPvPXnFreRmH4Uylxnq1YAHLICL8LGZ1Wd0p65SqSRkzuMgW43
         npat2oIDzwgAE5hmWpaxS8TPvB7iYeE6pNk+QvudjReu00p9bktqDtzcQzr7Ai9g0w24
         lIo/ttNyZaBS23DeqOAHzDkhCUomEDHkJwdaAeI6sLFu6wA1KsZ0S6MIHEXcWm8sHzWc
         NAEg==
X-Gm-Message-State: APjAAAUzzsHYNwdBzh9CwtIy6VK7ZfwNwTwhni1EFOYi6jV7BYIUxrZr
        bX2efAMp6Z9yxMdNoiIwJo8=
X-Google-Smtp-Source: APXvYqy6eozWpdPkGQiimt9ifasW2Jd+FHTETIUXrtU6KZCdB2/Z5Q9/olh3+JTc6aHTxVW15a/t2Q==
X-Received: by 2002:ac2:5975:: with SMTP id h21mr1376955lfp.165.1576054174264;
        Wed, 11 Dec 2019 00:49:34 -0800 (PST)
Received: from xi.terra (c-14b8e655.07-184-6d6c6d4.bbcust.telenor.se. [85.230.184.20])
        by smtp.gmail.com with ESMTPSA id w16sm770758lfc.1.2019.12.11.00.49.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2019 00:49:33 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.92.3)
        (envelope-from <johan@kernel.org>)
        id 1iexgd-0002xj-Qy; Wed, 11 Dec 2019 09:49:35 +0100
Date:   Wed, 11 Dec 2019 09:49:35 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Bin Liu <b-liu@ti.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH 1/2] usb: musb: sunxi: propagate devicetree node to glue
 pdev
Message-ID: <20191211084935.GS10631@localhost>
References: <20191210165454.13772-1-b-liu@ti.com>
 <20191210165454.13772-2-b-liu@ti.com>
 <20191211080528.GA415633@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191211080528.GA415633@kroah.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Wed, Dec 11, 2019 at 09:05:28AM +0100, Greg Kroah-Hartman wrote:
> On Tue, Dec 10, 2019 at 10:54:53AM -0600, Bin Liu wrote:
> > From: Mans Rullgard <mans@mansr.com>
> > 
> > In order for devicetree nodes to be correctly associated with attached
> > devices, the controller node needs to be propagated to the glue device.
> > 
> > Signed-off-by: Mans Rullgard <mans@mansr.com>
> > Signed-off-by: Bin Liu <b-liu@ti.com>
> > ---
> >  drivers/usb/musb/sunxi.c | 2 ++
> >  1 file changed, 2 insertions(+)
> 
> Does this need to go to stable kernel(s)?  If so, what commit does this
> fix fix?

No, I'd say it's a new feature.

Johan
