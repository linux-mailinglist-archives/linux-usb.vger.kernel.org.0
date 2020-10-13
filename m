Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E14A928D281
	for <lists+linux-usb@lfdr.de>; Tue, 13 Oct 2020 18:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728050AbgJMQof (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 13 Oct 2020 12:44:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727958AbgJMQof (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 13 Oct 2020 12:44:35 -0400
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com [IPv6:2607:f8b0:4864:20::d34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1EBFEC0613D0
        for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2020 09:44:34 -0700 (PDT)
Received: by mail-io1-xd34.google.com with SMTP id u19so23604000ion.3
        for <linux-usb@vger.kernel.org>; Tue, 13 Oct 2020 09:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=hRzKNz6GpqTn3QIDkZVGVPdtyycOeebQ+u78K9K/K6Y=;
        b=ty/kdzOmoyO3tGfZPAXYgIlngqlM7pW/IqBOjZ0v068lkOQaDw9gbETEsQMBwgADAz
         Rc8YDeds1z7hgBBLkH1bnda+nAhB3pVynXvkwJLM2w9nq55VsrIyl6rWJLfCXd5awkOE
         8PYELO9lFyjiPNDjt6RFUI0Vvm2EvOiVOqDR8dzRmnWVWjvVfBx6E3ZEtYf/AVLRc5OV
         4Lp/yb6pThHiN1GvA5ExLEAEny/Xasb2Dp1Y6x/jMeiJSB2SNAG9spbzBGIUg0aSj3l7
         wYuSrcE41ML+pDPqMDsMCbvfWIBOsGCVSjQc7Vu/ECecGVDfttB/ZPjMSYFZwZy9lydW
         drQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=hRzKNz6GpqTn3QIDkZVGVPdtyycOeebQ+u78K9K/K6Y=;
        b=JNU7zeUlbXYAx2ozhUsxCnin6cZ3NaqGTISp2EgESZ8DrC5EYWYPaO8if5ayy7hXUm
         gN1IKmNKyTdE5E140QW0+SA5uY07hNy9g/oLW8+/xXT4WS8bG+mCdR338Av0K5hGycml
         E8PvUQ02tUH0EYdVjd6BkQN2ym8A71wmPgaOAANDT2W0zGCgWz1Z8gGm7B7cXqKAFNnu
         qMDPESv58rVfZEpifWfN093MRE+0fgXP1ZWXohkZ6+s2EZeLbxiFNyyA9U6Gd1S0uO/W
         /9/+j4CngnJr4fwgGt22gKgGz/RLqqPoN029VPg8SE7k9+5D5dUV+4AwkuFqGWYa3kn3
         MS2g==
X-Gm-Message-State: AOAM530YQSJKcn3/7kjIWrQwTTG2vJm9eu+Vno6VFGGIS8wI4lZf6EYu
        N3Yz2n+PnM9Y2IFn0ysnfGx8AFwIq/Ap0w==
X-Google-Smtp-Source: ABdhPJzE9v3e7obcS75LuQ4RpCNjE8UhB3inLjCcAndZpFXb0tfF3JGbvS/swdUktSS0dydIDjHHbA==
X-Received: by 2002:a6b:b208:: with SMTP id b8mr249170iof.36.1602607473033;
        Tue, 13 Oct 2020 09:44:33 -0700 (PDT)
Received: from google.com ([2601:285:8380:9270::a07d])
        by smtp.gmail.com with ESMTPSA id t10sm349829iog.49.2020.10.13.09.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 09:44:32 -0700 (PDT)
Date:   Tue, 13 Oct 2020 10:44:30 -0600
From:   zwisler@google.com
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc:     Mathias Nyman <mathias.nyman@linux.intel.com>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "kernel@collabora.com" <kernel@collabora.com>
Subject: Re: xhci problem -> general protection fault
Message-ID: <20201013164430.GA3633291@google.com>
References: <a6364bd9-58d9-e66e-5595-7d887a8f3fc9@linux.intel.com>
 <8230c2a2-719c-ef81-e85d-5921bf8e98e6@collabora.com>
 <133c123e-e857-7f83-d146-f39c00afe39f@linux.intel.com>
 <20200925210517.GA4487@google.com>
 <7e38c533-6ea1-63a6-fc92-2ecef7ee1f84@linux.intel.com>
 <20201001164352.GA13249@google.com>
 <69f8cbc3-0ae7-cfb2-2fdd-556ada77381f@linux.intel.com>
 <20201012215348.GA3324220@google.com>
 <ad976018-31ec-3b1e-464c-363a08538ef5@linux.intel.com>
 <48f2e022-1937-6ecc-ad8e-ef293fd2bfe1@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <48f2e022-1937-6ecc-ad8e-ef293fd2bfe1@collabora.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Oct 13, 2020 at 10:29:51AM +0200, Andrzej Pietrasiewicz wrote:
> W dniu 13.10.2020 o 09:49, Mathias Nyman pisze:
> > On 13.10.2020 0.53, zwisler@google.com wrote:
> > > On Mon, Oct 12, 2020 at 10:20:31PM +0300, Mathias Nyman wrote:
> > > > On 1.10.2020 19.43, zwisler@google.com wrote:
> > > > > On Tue, Sep 29, 2020 at 01:35:31AM +0300, Mathias Nyman wrote:
> > > 
> > > > I'm rewriting how xhci driver handles halted and canceled transfers.
> > > > While looking into it I found an older case where hardware gives bad data
> > > > in the output context. This was 10 years ago and on some specic hardware,
> > > > see commit:
> > > > 
> > > > ac9d8fe7c6a8 USB: xhci: Add quirk for Fresco Logic xHCI hardware.
> > > > 
> > > > > 
> > > > > I'm happy to gather logs with more debug or run other experiments, if that
> > > > > would be helpful.  As it is I don't really know how to debug the internal
> > > > > state of the HC further, but hopefully the knowledge that the patch below
> > > > > makes a difference will help us move forward.
> > > > 
> > > > Great thanks, it will take some time before rewrite is ready.
> > > 
> > > Should we/I invest time in trying to create a quirk similar to
> > > 
> > > > ac9d8fe7c6a8 USB: xhci: Add quirk for Fresco Logic xHCI hardware.
> > > 
> > > in the mean time, or should we just wait for your rewrite?
> > > 
> > 
> > I've been focusing on this part so rewrite shouldn't take long.
> 
> Thank you for doing that!
> 
> Should you be sending your patches not as a reply in this thread
> kindly Cc me andrzej.p@collabora.com.

Please CC me as well, and I'd be happy to test for you.  Thanks again!
