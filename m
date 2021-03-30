Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E499734ED4F
	for <lists+linux-usb@lfdr.de>; Tue, 30 Mar 2021 18:18:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231627AbhC3QRf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Mar 2021 12:17:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:52176 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231952AbhC3QR2 (ORCPT <rfc822;linux-usb@vger.kernel.org>);
        Tue, 30 Mar 2021 12:17:28 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id DAC14619C5;
        Tue, 30 Mar 2021 16:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1617121048;
        bh=5BJd+4MeSZ5QSIWOQOtGLkYc3jqEpTRsXBBy4gIgKw4=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=nJSAjqszx3Nplnuqay436n8SxICpF6FA6BT0rFZraK7xdW43I8k3FImVvT/qAH26M
         lfaZTwt/f1+e8ewUFSYYkWNJGr7Hwkiaf9eajjRwNi+RXHfeoD4TLUpduBo8o8nFI4
         h7++qeo/OHMRDRQ0AbwjE7T0FoY0znLrVhmB/vLjhWSQ6hUrMZ1qZqHGQ+cDI4v2Vs
         kOEh1VzHyeQoKv9NZj+KfTphLztvCuxUPP5nJuMhCq2lr95fdXwEWFGac4FgPaUApD
         NsWSPgQp04wbQgLOm82diMTlyJnEEq/FzTVhGZN3QzT3Rwlb2adSDjD30K5dskkv/U
         9qNt6ySh5wlvA==
From:   Felipe Balbi <balbi@kernel.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        USB <linux-usb@vger.kernel.org>, Ferry Toth <fntoth@gmail.com>
Subject: Re: USB network gadget / DWC3 issue
In-Reply-To: <CAHp75VeERhaPGAZc0HVs4fcDKXs+THc=_LFq_iEhWAR8vvURjw@mail.gmail.com>
References: <CAHp75VeERhaPGAZc0HVs4fcDKXs+THc=_LFq_iEhWAR8vvURjw@mail.gmail.com>
Date:   Tue, 30 Mar 2021 19:17:24 +0300
Message-ID: <87pmzgk44r.fsf@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


Hi,

Andy Shevchenko <andy.shevchenko@gmail.com> writes:
> Hi!
>
> I have a platform with DWC3 in Dual Role mode. Currently I'm
> experimenting on v5.12-rc5 with a few patches (mostly configuration)
> applied [1]. I'm using Debian Unstable on the host machine and
> BuildRoot with the above mentioned kernel on the target.
>
> **So, scenario 0:
> 1. Run iperf3 -s on target
> 2. Run iperf3 -c ... -t 0 on the host
> 3.  0.00-10.36  sec   237 MBytes   192 Mbits/sec                  receiver
>
> **Scenario 1:
> 1. Now, detach USB cable, wait for several seconds, attach it back,
> repeat above:
> 0.00-9.94   sec   209 MBytes   176 Mbits/sec                  receiver
>
> Note the bandwidth drop (177 vs. 192).
>
> (Repeating scenario 1 will give now the same result)
>
> **Scenario 2.
> 1. Detach USB cable, attach a device, for example USB stick,
> 2. See it being enumerated and detach it.
> 3. Attach cable from host
> 4 .   0.00-19.36  sec   315 MBytes   136 Mbits/sec                  receiver
>
> Note even more bandwidth drop!
>
> (Repeating scenario 1 keeps the same lower bandwidth)
>
> NOTE, sometimes on this scenario after several seconds the target
> simply reboots (w/o any logs [from kernel] printed)!
>
> So, any pointers on how to debug and what can be a smoking gun here?
>
> Ferry reported this in [2]. There are different kernel versions and
> tools to establish the connection (like connman vs. none in my case).
>
> [1]: https://github.com/andy-shev/linux/
> [2]: https://github.com/andy-shev/linux/issues/31

dwc3 tracepoints should give some initial hints. Look at packets sizes
and period of transmission. From dwc3 side, I can't think of anything we
would do to throttle the transmission, but tracepoints should tell a
clearer story.

-- 
balbi
