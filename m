Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05C632FC4CA
	for <lists+linux-usb@lfdr.de>; Wed, 20 Jan 2021 00:35:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728133AbhASX1B (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Jan 2021 18:27:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730232AbhASX0Z (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Jan 2021 18:26:25 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 259B0C061573
        for <linux-usb@vger.kernel.org>; Tue, 19 Jan 2021 15:25:45 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id n6so8518638edt.10
        for <linux-usb@vger.kernel.org>; Tue, 19 Jan 2021 15:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nLVmnjsRjsvPfcv+qR81fqQ82nCHzCwJpCr3gMa8qpM=;
        b=dAcWGwcZtOkGl91KAQMik53LuZX6ZSccMFs3bWza9LyO6HI/lLfwFkwQlQ/01ybUmj
         k1wJaO07PHYttGv51JjnNL3KeZKrxz0FkL8MHwZ1+sRHblVhTtD6+8Dk1x86E6CkHLaV
         TwJKIm9tsm8JqdI9B/9cPQbV+eJ/uhc2hIfwDwms0xo/yRuM7KLh1iSazZtCZC8m+/rV
         qZYYudXenbF1RCPDn+tzzpCO9szONFhqvZRVfiR2xmDODdJADrrOnfAfFn8B5A1PVIjr
         Ih1xHbt74jirEAHXok5TvKhEniAJu4BDy1LTrWSK9KdKPcUfCgyUp4VTRaMId/q0jfbM
         ku+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nLVmnjsRjsvPfcv+qR81fqQ82nCHzCwJpCr3gMa8qpM=;
        b=kersT2/94jTvCrSSZaqvNRII+FuPl60tMInuAA2wTqLY32IdxByylV/rRjOv0TiQF7
         NSR8cWmjRyc0oXkBRufpeBwwrEYiFzMznBFRZ5bzVOdyAW0JKBwKQSsU1Cb61L4oPyQX
         0HVbcjSaFMuN1tVLBUducoKdJMhoppsow7Qz1dbqtoIY6kvDsjnwHzULR1IvFclWAMG2
         qumheP76WmdZ3gMXbaFyW46XP909WtV8NXafY+H5iW0MiIJ0Zl4xsK5356wXCDNkxrvz
         iO1rxPxP5FM8WnGIkwVP3ixgIhOSTpVYz1w/jiSkCqTrHNQPfxx6aEehla00uCeAN2b/
         wJgw==
X-Gm-Message-State: AOAM530ly2XslG0e+lHggDBdwVpcGf5Tm5yHlf9vn/CGygGqnefhxYwC
        1r/QNYIoGBQl1IXdmZgo7t0fNS7eXHltJvD9ZI/okQ==
X-Google-Smtp-Source: ABdhPJwmRrrtgu0RFvV2SL4uC48edxmHQXwLDsUMFnVk1a39Rsf61wCV1LIWhaaZmRERT6egGEuA6VFV23bOMKvwWfM=
X-Received: by 2002:a05:6402:60a:: with SMTP id n10mr5096942edv.230.1611098743762;
 Tue, 19 Jan 2021 15:25:43 -0800 (PST)
MIME-Version: 1.0
References: <20210115161907.2875631-1-mathias.nyman@linux.intel.com>
 <20210115161907.2875631-2-mathias.nyman@linux.intel.com> <42c6632e-28f1-9aae-e1a6-3525bb493c58@gmail.com>
 <b70e0bb512d44f00ac5f8380ba450ba6@AcuMS.aculab.com> <f439cf12-106f-3634-397f-dc17a4d0e94d@gmail.com>
 <2722043c-208b-c965-e6cf-8474c698df2c@linux.intel.com>
In-Reply-To: <2722043c-208b-c965-e6cf-8474c698df2c@linux.intel.com>
From:   Ross Zwisler <zwisler@google.com>
Date:   Tue, 19 Jan 2021 16:25:32 -0700
Message-ID: <CAGRrVHxvhUyc=z1W13QUJJ8pJgscTJSLGgjV=1OmOKi0F16uqw@mail.gmail.com>
Subject: Re: [PATCH 1/2] xhci: make sure TRB is fully written before giving it
 to the controller
To:     Mathias Nyman <mathias.nyman@linux.intel.com>
Cc:     Sergei Shtylyov <sergei.shtylyov@gmail.com>,
        David Laight <David.Laight@aculab.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "stable@vger.kernel.org" <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Jan 18, 2021 at 5:05 AM Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:
<>
> True, good point, dma_wmb() should be enough here.
> In fact most other wmb()s in xhci could be turned into dma_wmb().

FWIW I've confirmed in my testing that dma_wmb() does indeed also
solve the problem.
