Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3449D80189
	for <lists+linux-usb@lfdr.de>; Fri,  2 Aug 2019 22:03:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406896AbfHBUD2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 2 Aug 2019 16:03:28 -0400
Received: from mail-pl1-f181.google.com ([209.85.214.181]:40605 "EHLO
        mail-pl1-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406875AbfHBUD2 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 2 Aug 2019 16:03:28 -0400
Received: by mail-pl1-f181.google.com with SMTP id a93so33976773pla.7
        for <linux-usb@vger.kernel.org>; Fri, 02 Aug 2019 13:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gnarbox-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LV4zBYHqP471tiMJhzxPidpLmDFGjtfCHjj0feLQ6RQ=;
        b=1GhN8oCfyS5Geb//fx/sQ68mln1B0tE3WFvr99IMl0o3nOBxdtn7K4xyIBPGz/mHaK
         0MY5cx5kNL7vfikQ5SSrGrjwIpoSTjq3u2W33o3Ea+MFP7AvO0HAT0m7BMFmY5DWtGu1
         tAFLxw62YAnwog8Nn5QGzn2lXUTsPq7LqEZ5T2/kS43Y6GnKwbVFarla52UASgfJUeEs
         Pwsha4dbXX8IMBft0dq7kdQWTRwILAH+lCZFA2/90SmnbiqnXRB+UWTbgE8Sc7tCPir4
         V4c8nAL+rwJxE+WFB9f8hbLtaJFy1KAqhIBxxWGFvcLkskuEYBnk3zXg9TRDWAn0cJ1t
         v/YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=LV4zBYHqP471tiMJhzxPidpLmDFGjtfCHjj0feLQ6RQ=;
        b=auVygU5jFLw0tSk1A5dZNLsibDGIWmD7r7I/YKoIUL66AKRuyUIiG6KCq80iQQl1A8
         NyktBrC5IOM2WQmUAmsgnO0YUuLnFGjfbf+HYX6fpH9PTg8Vu4eqPCp+cZbMXImbG2F7
         leFGw1Ol/Ka1iuOPC3w3XZA7OZw3awxdgbXDGDvDp7DSjq8+bM0fdEemWK7uw8ln46s2
         36VmZximjZQPKY1y6GDuqUZP8g+9mTensm7jc3jMbhHCXUnS0wVL7MTF1PL5UHPo5ogW
         5Ds3vxrlAo8/zxgr+R1tKEeBeBRDdkhVPOKN2TakjC3EMakpXN93V7IxVE4sd8k2V6DW
         mH/w==
X-Gm-Message-State: APjAAAU34tUJteiVAEh5NQCngCNFEfwsBgRSKYB2s4fM9Ye1vz3+/kIH
        iVUI3yCEq/qooI4qaOemJ/v3zQCvOlU=
X-Google-Smtp-Source: APXvYqzCW3YsUv+4Wtn99ubZ/Ezkw3k+KMU2EhR/bIFyesSbtSlAlJ8IKzOtsVkBb0i02BfwgEUfYQ==
X-Received: by 2002:a17:902:102c:: with SMTP id b41mr130391778pla.204.1564776207332;
        Fri, 02 Aug 2019 13:03:27 -0700 (PDT)
Received: from gnarnia.home ([47.180.176.91])
        by smtp.gmail.com with ESMTPSA id y11sm78148725pfb.119.2019.08.02.13.03.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 02 Aug 2019 13:03:26 -0700 (PDT)
From:   Evan Gates <evan@gnarbox.com>
To:     linux-usb@vger.kernel.org, rob@gnarbox.com, evan@gnarbox.com
Subject: EHSET USB testing
Date:   Fri,  2 Aug 2019 13:03:25 -0700
Message-Id: <20190802200325.22897-1-evan@gnarbox.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

I'm trying to get my device to pass the EHSET tests.  I found the thread
"Using EHSET module" from March.  I'm having similar issues.

I don't have access to the PID VID board that the lab uses.  Instead I'm
using another computer setup as a mass storage gadget but set the VID:PID
to 1a0a:0102 (TEST_J).  If that sounds like a problem or there is another,
better way to do this please let me know.

> The usb-storage driver bound to your device first.  Try building a
> kernel without that driver and then it shoudl bind to the other driver.
>
> Or manually bind the ehset driver to your device through sysfs.  Read up
> on the documentation for the "new_id" and "bind" and "unbind" sysfs
> files for how to do that.

I did this.  I was able to unbind from usb-storage but binding to
usb_ehset_test failed with error -32 (AFAICT EPIPE).  I tried both the
usb_ehset_test/bind and usb_ehset_test/new_id methods.  In both cases
I got the same error.

I did another build without usb-storage.  Now I don't have to go through
the unbind step but I still get the same error while probing.

	[  296.089877] usb 1-1: new high-speed USB device number 2 using xhci_hcd
	[  296.271081] usb_ehset_test: probe of 1-1:1.0 failed with error -32

I notice that it says "using xhci_hcd."  Is that a problem?  Does it
need to be ehci?  I tried a build without xhci but that caused other
problems for me.

1) Can I use a computer in device mode to present a VID:PID to get into
EHSET mode?  If so how should I do that?

2) What else do I need to do in order to get my box into EHSET mode?
