Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C258B34E796
	for <lists+linux-usb@lfdr.de>; Tue, 30 Mar 2021 14:38:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231761AbhC3MiU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 30 Mar 2021 08:38:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231873AbhC3MiI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 30 Mar 2021 08:38:08 -0400
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ECEBDC061574
        for <linux-usb@vger.kernel.org>; Tue, 30 Mar 2021 05:38:07 -0700 (PDT)
Received: by mail-pf1-x42e.google.com with SMTP id g15so12082297pfq.3
        for <linux-usb@vger.kernel.org>; Tue, 30 Mar 2021 05:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=JUI6kx58R7+PWdipLhirBYCrPbjRRV1in99dPO8NdGQ=;
        b=JOfq+VnHxFm1MMvJ83bg8GwojSSKSlbxvORcrHq8Rr2VXAREcfEALosCBkQOc2VQhn
         TdjVOGxWQvx8Yt8pBf7dsiU1utfdBowIinXF7YYTGY+gAFGe6RyenoaO71mLSWP6odOQ
         zIHA9rtVN7REfqfxjB//iYoRT6+FEDGPfGg2xL+cAKIItiJhTKVx7y6RvjY5gjBSpvmY
         KP2zzSyLhLbMGr3x1lmzmqR2YnKto78b2cMWRzRCDHZo92V4XaJ7sQt8Zi/9BvAuz8bW
         EUdeJFQIVOD0XVVA2OYOTLbgdQ2SQf9gnpdWwW+RHRflTU8sjrQBqPMXd+9t71ANTsj/
         JbxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=JUI6kx58R7+PWdipLhirBYCrPbjRRV1in99dPO8NdGQ=;
        b=PqiClg3nqTMvPEEVtsv9jajQCn4bkTBFbctnlqpck7Ut9U/XxE9KxquDeHg0ovZtnT
         8LSMlClLdpvz1PhJ3O2pwbnU6xLFr3JRPEIa7/S66H7NAj11J3Y1/7adnJ9GsFF+ItOG
         9clNoqEu63KYmyX54CgpXAIWmLHgzb4w6Vb4odtEqKKuGYm/2XDAdi85m595k5uTqCe+
         aWYGPmwFH4g7qbxhQ+8W/WWab/2g40Xn5kO1aZNQT6hoXW/rqSBIbXFMvO47yiUC6Zzl
         3Kg47ZPFsqE48OXNauulQJpCoT1m/BZLjY5A63wLoh9ckxp2+fF9B1vO/a/lRyiWJ9nI
         EPRA==
X-Gm-Message-State: AOAM5325WohQ3bXYLQMXhiXZufnxQ0ejV1KkGkUhEOJ7L3EZnsJZBD8I
        ANvGsVaJHwMAG9GIFSbYgjjVGTmG/4Cj69b/CdM=
X-Google-Smtp-Source: ABdhPJy9XNFfg4YIfp1/SgpzJc5A8ewDBl6bCkQA+249R+59q08f8NW6hYWiKZtpO0jgbkaqwSf029xSfhHJ08Z3FGo=
X-Received: by 2002:a63:cb44:: with SMTP id m4mr5703915pgi.4.1617107887426;
 Tue, 30 Mar 2021 05:38:07 -0700 (PDT)
MIME-Version: 1.0
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 30 Mar 2021 15:37:51 +0300
Message-ID: <CAHp75VeERhaPGAZc0HVs4fcDKXs+THc=_LFq_iEhWAR8vvURjw@mail.gmail.com>
Subject: USB network gadget / DWC3 issue
To:     Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        USB <linux-usb@vger.kernel.org>, Ferry Toth <fntoth@gmail.com>,
        Felipe Balbi <balbi@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi!

I have a platform with DWC3 in Dual Role mode. Currently I'm
experimenting on v5.12-rc5 with a few patches (mostly configuration)
applied [1]. I'm using Debian Unstable on the host machine and
BuildRoot with the above mentioned kernel on the target.

**So, scenario 0:
1. Run iperf3 -s on target
2. Run iperf3 -c ... -t 0 on the host
3.  0.00-10.36  sec   237 MBytes   192 Mbits/sec                  receiver

**Scenario 1:
1. Now, detach USB cable, wait for several seconds, attach it back,
repeat above:
0.00-9.94   sec   209 MBytes   176 Mbits/sec                  receiver

Note the bandwidth drop (177 vs. 192).

(Repeating scenario 1 will give now the same result)

**Scenario 2.
1. Detach USB cable, attach a device, for example USB stick,
2. See it being enumerated and detach it.
3. Attach cable from host
4 .   0.00-19.36  sec   315 MBytes   136 Mbits/sec                  receiver

Note even more bandwidth drop!

(Repeating scenario 1 keeps the same lower bandwidth)

NOTE, sometimes on this scenario after several seconds the target
simply reboots (w/o any logs [from kernel] printed)!

So, any pointers on how to debug and what can be a smoking gun here?

Ferry reported this in [2]. There are different kernel versions and
tools to establish the connection (like connman vs. none in my case).

[1]: https://github.com/andy-shev/linux/
[2]: https://github.com/andy-shev/linux/issues/31


-- 
With Best Regards,
Andy Shevchenko
