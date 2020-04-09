Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4DC891A3838
	for <lists+linux-usb@lfdr.de>; Thu,  9 Apr 2020 18:48:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726951AbgDIQsO (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 9 Apr 2020 12:48:14 -0400
Received: from mail-pl1-f182.google.com ([209.85.214.182]:33830 "EHLO
        mail-pl1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726574AbgDIQsO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 9 Apr 2020 12:48:14 -0400
Received: by mail-pl1-f182.google.com with SMTP id a23so4039664plm.1
        for <linux-usb@vger.kernel.org>; Thu, 09 Apr 2020 09:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=qwZ3Mkn0+WqnEMg5Qw/XYUr4qG6J0t1ERkeUYlewFvI=;
        b=lgmaO78q7PxpWiJ2l3nrTZsJs/3pZZ8aicyBnqO5ejP7iKNeQLq1O94LhAUigvdcN/
         nE9AP1SkTtMB9isAdssYa4SAO9ykpkBGdGas/ReJXecftE8Bwy7/FtOJJAX61Lm9PeBZ
         96Kqjh8ykr4hLjscyMsYJOvlwg2M2sHvy6+GYCN4PQGGDdDfQhSodWV4g+cyd9LT5Pp4
         ZTeLEuDPR6qRro0Y012h0PeRT2EE1YzkPDe18Yq6uOb4A6RCzO2VuMs6BqmC/aLs9TmK
         U3Z9aVjEOlL4T+50ye1QGffM0IczxB0icaYvDQlaMktwBe/tj6mN1Dntvlo9d1dski0B
         NIvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=qwZ3Mkn0+WqnEMg5Qw/XYUr4qG6J0t1ERkeUYlewFvI=;
        b=CSXEbNNLRnxm4R+zcmh8O/0e7Kl78auRQIql9YIbFOU8L9fki9fQYSHRKjNGa7RCS1
         gnToBqLCA+jYOQi5kB/xMq1pd3PWvgo9rCQjCgcawONgqu1cML3nAv4EhbwZryhc76GJ
         GYWm6VPA8wen3SFw4ao/PuYZ4wKRH65Zdj7oWO/MicvhPt7dRwj2/nB2yfTpiZqotgjK
         EpZRw2xmct39aQlKeNGdmIEIbowPaX7FvKkC6P0UXQxfOXdrYTNCbfBDy2NGwzgezFi8
         5+ftpL+jZEaNNlOtRXudlz6N0Ac29vBtQO5ITVJhEGr61O4eMVe2e3qaBGGmqLIjnHPG
         1G0Q==
X-Gm-Message-State: AGi0PuY0Ct1AxMCrymtCED+Gx4hR3mvGRRv5VE8AuZxsu/q5GdzEs6qC
        rtadmVK2P4mHf2BzprLZh6slDTlYvWEwPHfbfiDOVxha4Mw=
X-Google-Smtp-Source: APiQypKoXmzHNXEs6oKIehTWFuDD8nTmDndtPVcFymrY6Y2RWGA0e7IvxiOPyCI4JFVo/LUG9jhjQvMkKtEclbvxJQY=
X-Received: by 2002:a17:90b:11c9:: with SMTP id gv9mr382769pjb.90.1586450891821;
 Thu, 09 Apr 2020 09:48:11 -0700 (PDT)
MIME-Version: 1.0
From:   Andrey Konovalov <andreyknvl@google.com>
Date:   Thu, 9 Apr 2020 18:48:00 +0200
Message-ID: <CAAeHK+x7Fihwriocp8Kpr+AQks6h3syZa+g0Wd+Q62fg-y93Lg@mail.gmail.com>
Subject: Testing endpoint halt support for raw-gadget
To:     Alan Stern <stern@rowland.harvard.edu>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     USB list <linux-usb@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Alan and Greg,

I've been thinking about what kind of features raw-gadget might be
missing, that would allow more flexibility in emulating USB devices.
One of the things that is currently missing is halting endpoints.
Adding this functionality seems to be fairly easy, but it's unclear to
me how to test it. Any suggestions?

Also, are there some other features that might make sense to add? I
see that e.g. GadgetFS has GADGETFS_FIFO_STATUS/FLUSH ioctls. Are
those useful?

Thanks!
