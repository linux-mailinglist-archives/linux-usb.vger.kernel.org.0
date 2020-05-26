Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98C201A8E8D
	for <lists+linux-usb@lfdr.de>; Wed, 15 Apr 2020 00:27:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391958AbgDNW1e (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 14 Apr 2020 18:27:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2391951AbgDNW1b (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 14 Apr 2020 18:27:31 -0400
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B62EEC061A0E
        for <linux-usb@vger.kernel.org>; Tue, 14 Apr 2020 15:27:29 -0700 (PDT)
Received: by mail-oi1-x242.google.com with SMTP id s202so8680036oih.3
        for <linux-usb@vger.kernel.org>; Tue, 14 Apr 2020 15:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=twQcgd45+lQrfSmknnbfL+q1fVsuWdz4au5BKw4Z1+E=;
        b=Ag+q6kwnWCx1+ljpNf+qWVNNl+ZCr0Jt4Zxhl+xA3bdNcKAf9D3xTp6BQPmR3zDu/D
         f1EF1AWUA4/IrGWbrLkM1icj9HaicqA7TMgplrqDARzA1s1GEBxqkZUgoivvYv6PaG42
         P9I3715KufTjTXe2O6GP+cmbcebtgJCxLHiK3Fra6AaQQCNhYS5+fAVv/dEBA87isWqq
         +B2U2eIRA5bvWMi2NiwE4A5mRLXC7g/cBpW6eBgQA8WLakqQkZYlrIrP6c7D8rU58DeF
         HllT6cDV6y4AL0EIHdo7LWOpdFon884yN4XiXLwD2n6uXPuIV2F7NDLvIwZEG7Lsst4D
         BgjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=twQcgd45+lQrfSmknnbfL+q1fVsuWdz4au5BKw4Z1+E=;
        b=c1TQfyAX/mPmmVUK1Dzh3K1C2OxYLWzwO8tb/TMGH4qVd/+6FDak22qxzo+FH1WTZS
         T2cIigJykz8z4M9JpWQJtcXTwHDqQrCibM/XMS2/Oy5UnfaJhOVA3Ub+p2gyj3qg70zT
         W1lze5Jkh9RgU+k4lQrSX4CDVByWRPPVqVsS9F1ySlC0Gv9b8Xrl9Pcld2g3FS4tgPtO
         kRsW2mTCXoi5TYelcH8QeO8aM8tADTIcJUobEV73N9ohEZKFJiEXozYNV0Hvr7YR7k/5
         EuRAHyNG2JM5Z0h/wOJuBfN1HvAZyhMSaJEJIvQB7ACYLRUDwtHjssLrJLErYpAQNWWc
         5ntw==
X-Gm-Message-State: AGi0PuYrGcFSKmjipo7Sj4nlngkbRB1XyQUYXMsEIaDupPi8xBG9ICxn
        iRlVCgKSsp6WuD7HLkY4KBVpb4hWp0b0Bjh7evWVEA==
X-Google-Smtp-Source: APiQypLX2IaDo4jxUH5+hqW48erJPfzTcMuX6kUFwIkYAk9KI1BFjp3NH7sHJfEf0m88KG1UCKAc0hmGm375Z8Z24VI=
X-Received: by 2002:a05:6808:a0a:: with SMTP id n10mr17407259oij.10.1586903249039;
 Tue, 14 Apr 2020 15:27:29 -0700 (PDT)
MIME-Version: 1.0
References: <20200414164152.2786474-1-vkoul@kernel.org>
In-Reply-To: <20200414164152.2786474-1-vkoul@kernel.org>
From:   John Stultz <john.stultz@linaro.org>
Date:   Tue, 14 Apr 2020 15:27:17 -0700
Message-ID: <CALAqxLWpkf92nXcRp02W0G+Z5Lb+mHVc2ZkLPntwi6GpRx9b0Q@mail.gmail.com>
Subject: Re: [PATCH v9 0/5] usb: xhci: Add support for Renesas USB controllers
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Mathias Nyman <mathias.nyman@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Christian Lamparter <chunkeey@googlemail.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        =?UTF-8?Q?Andreas_B=C3=B6hler?= <dev@aboehler.at>,
        Linux USB List <linux-usb@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Apr 14, 2020 at 9:42 AM Vinod Koul <vkoul@kernel.org> wrote:
>
> This series add support for Renesas USB controllers uPD720201 and uPD720202.
> These require firmware to be loaded and in case devices have ROM those can
> also be programmed if empty. If ROM is programmed, it runs from ROM as well.
>
> This includes patches from Christian which supported these controllers w/o
> ROM and later my patches for ROM support and debugfs hook for rom erase and
> export of xhci-pci functions.
>
> Changes in v9:
>  Make fw load a sync call and have single instance of probe execute,
>    elimating probe/remove races
>  Add quirk for renesas and use that for loading

Validated on db845c.

Tested-by: John Stultz <john.stultz@linaro.org>

thanks
-john
