Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 42A55145E97
	for <lists+linux-usb@lfdr.de>; Wed, 22 Jan 2020 23:28:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726004AbgAVW0v (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 22 Jan 2020 17:26:51 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:37574 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726054AbgAVW0v (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 22 Jan 2020 17:26:51 -0500
Received: by mail-pj1-f67.google.com with SMTP id m13so226110pjb.2
        for <linux-usb@vger.kernel.org>; Wed, 22 Jan 2020 14:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=cxNVjgQGWzacnqlCZNmJQJkdYDIqlJE10RKfm1uE9mM=;
        b=pOv4DwOm5vOgZ+PrlXxtrPOfWsAyaYxbfU0ipKfrLvdyaCWIZfNb3Tng6PIcTsdm0L
         ptJZCs9pnIt/C29i4j2b84lpo9l50BBU61Ouw2z41al6f33wRE/NdYF2iVzvLlb/6xBZ
         e/xmNQSI16yFl3/XernW55vcPqz8JpeiVTq4YKG9NOrD+4+pJOVyk3xoMA6jnIJwjKQi
         4fs9zHCqRJAdjI2c5RirLb7u0ddIDol/VF//LhFEDDx4xDKLymEfbLlMjiDFaBI99kEV
         pnIxClfbDRiNjxCEHchG1D9XUAl32oxJRBRlSd5OAx/ZLJUOQgaJYg1KXShxMTVer1kH
         x8EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=cxNVjgQGWzacnqlCZNmJQJkdYDIqlJE10RKfm1uE9mM=;
        b=jS3ATWGUxUeOAn6P7zAtC6Way+SQCl6xT1u/acP4vJ45l0Nw5jLElHFUcgcJooZaca
         GxJhGdI3l9iGtzAJE48iLeSUtH/mo/efPXyiO71GuG4DtqKXOSJ8JufFJ3vpgmyxal2z
         6AZOiDqFUG79MjDGx1gxZui1/NdypUIXYeE7hq8frANdWvHUntf55dScD03URt8861Y8
         MhvNdAxUyiSE67keKbtCVtX6qwGJPxFBYmPmmK20euQFYqVlQldjFKbo7gN4Xg80Q7JF
         LkBOMg8p6OigPZH1yIQ8cjZ6fAdZgZcqcEmb0KpmC9OS7xz2mKwOR9GGRMaiBqdQLPoq
         bN8w==
X-Gm-Message-State: APjAAAUHwZT/jP3Kl2y3WUHdSfdieL4tuph+oMsRITI8Mu+h/EaWHEjE
        fobhVAsJ/cqD7qdy/M0tpPiL2g==
X-Google-Smtp-Source: APXvYqwTOHRjwf4d8GAH3/wqyQXJ/KEyA6qmWmh3w2qWEbuYZc+PmC1vhzKke3graUr1g49XLUJdlw==
X-Received: by 2002:a17:90a:d0c5:: with SMTP id y5mr808414pjw.126.1579732010599;
        Wed, 22 Jan 2020 14:26:50 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
        by smtp.gmail.com with ESMTPSA id a28sm47793509pfh.119.2020.01.22.14.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jan 2020 14:26:50 -0800 (PST)
From:   John Stultz <john.stultz@linaro.org>
To:     lkml <linux-kernel@vger.kernel.org>
Cc:     John Stultz <john.stultz@linaro.org>,
        Felipe Balbi <felipe.balbi@linux.intel.com>,
        Yang Fei <fei.yang@intel.com>,
        Thinh Nguyen <thinhn@synopsys.com>,
        Tejas Joglekar <tejas.joglekar@synopsys.com>,
        Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        Jack Pham <jackp@codeaurora.org>, Todd Kjos <tkjos@google.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Linux USB List <linux-usb@vger.kernel.org>,
        stable <stable@vger.kernel.org>
Subject: [RFC][PATCH 0/2] Avoiding DWC3 transfer stalls/hangs when using adb over f_fs
Date:   Wed, 22 Jan 2020 22:26:43 +0000
Message-Id: <20200122222645.38805-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hey all,
  I wanted to send these out for comment and thoughts.

Since ~4.20, when the functionfs gadget enabled scatter-gather
support, we have seen problems with adb connections stalling and
stopping to function on hardware with dwc3 usb controllers.
Specifically, HiKey960, Dragonboard 845c, and Pixel3 devices.

Initally the workaround we used was to simply disable scatter
gather support on the dwc3 by commenting out the
"dwc->gadget.sg_supported = true;" line.

After working with Fei Yang, who was seeing similar trouble on
Intel dwc3 based hardare, Thinh Nguyen mentioned that a fix had
already been found and pointed me to one of Anurag's patches.

This solved the issue on HiKey960 and I sent it out to the list
but didn't get any feedback.

Additional testing with the Dragonboard 845c found that that
first fix was not sufficient, and so I've sat on the fix
thinking something deeper was amiss and went back to the hack
of disabling sg_supported on all dwc3 platforms. 

In the following months Fei's continued and repeated efforts
didn't seem to get enough review to result in a fix, and they've
since moved on to other work.

Recently, I found that folks at qcom have seen similer issues
and pointed me to the second patch in this series, which does
seem to resolve the issue on the Dragonboard 845c, but not the
HiKey960 on its own.

So I wanted to send these patches out for comment. There's
clearly a number of folks seeing broken behavior for ahwile on
dwc3 hardware, and we're all seeemingly working around it in our
own ways, so either those individual fixes need to get upstream
or we need to figure out some deeper solution to the issue.

So I wanted to send these two out for review and feedback.

thanks
-john

Cc: Felipe Balbi <felipe.balbi@linux.intel.com>
Cc: Yang Fei <fei.yang@intel.com>
Cc: Thinh Nguyen <thinhn@synopsys.com>
Cc: Tejas Joglekar <tejas.joglekar@synopsys.com>
Cc: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Cc: Jack Pham <jackp@codeaurora.org>
Cc: Todd Kjos <tkjos@google.com>
Cc: Greg KH <gregkh@linuxfoundation.org>
Cc: Linux USB List <linux-usb@vger.kernel.org>
Cc: stable <stable@vger.kernel.org>

Anurag Kumar Vulisha (2):
  usb: dwc3: gadget: Check for IOC/LST bit in both event->status and
    TRB->ctrl fields
  usb: dwc3: gadget: Correct the logic for finding last SG entry

 drivers/usb/dwc3/gadget.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

-- 
2.17.1

