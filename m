Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F738367099
	for <lists+linux-usb@lfdr.de>; Wed, 21 Apr 2021 18:49:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242112AbhDUQuB (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 21 Apr 2021 12:50:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237358AbhDUQty (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 21 Apr 2021 12:49:54 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE9A1C06138A
        for <linux-usb@vger.kernel.org>; Wed, 21 Apr 2021 09:49:19 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id f29so30417948pgm.8
        for <linux-usb@vger.kernel.org>; Wed, 21 Apr 2021 09:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=YofVd7h9TTAUtJm02RuQ1uMGb1tLcZYg66RQ0VMaxfY=;
        b=xfSYFpqTi/9rUNUnLj17Pm+oOiO4ZNx/7pIFtcGrpx1QnLk2CLsr2a3NP6gQ5B3hBk
         zun7saLACyQv1gE6VMIGwU8pg6i8est8ZfLgshxAA3A6zhqTMLWLzoaDQUZxL/rUpYrF
         5htV8tVWrOky+0yt2IRuHgKM4vnuC63CtzUej9s8lW1VrSDKk5eVOUSScozPV9/hB9SO
         OZSKOofjF/Ix4gfUiruryNlwEZ5xykppFmIeMpYA2vcBA3b6vJ2NHxAfADqc1aPRFOtv
         DSvlruZgE4lTJ6y0ksqyJaNbHzfkDNPf0cU1hlMhz40tUMYLsQapIJfQy6hDZuCY5AJK
         iviA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-transfer-encoding;
        bh=YofVd7h9TTAUtJm02RuQ1uMGb1tLcZYg66RQ0VMaxfY=;
        b=J1+7ukMOcZfchj+qQmP363cDjW2T1LgEQXiP8T/E7CbkeFVL0+oCKUIyRSeuAPH9TD
         OkTIjtGXh63AeNI71zHoDeYOGbbAB+jhVBCqHQsRwdmkxvycts5Et6vdzYJ0bQaX109y
         lgzEUYyCjAO3vSAwaieZswlLtdsladF+SvXr9h9fSTUcAokkiOU9THivnz0afWiZR4MO
         i3yYfiPxKDee/ic0Loz/0vMH6U9R7uHjaA52EL+74izgij2WpVGAU/RtFvbeQtkR8Q04
         FrfhVkHO5reXUbZOO5+Gg0PTgA8zdfvvnbX5RtuPNIp++i2l1krcZn9cjVTmp7rWQDYX
         x4+A==
X-Gm-Message-State: AOAM532yOLDsCESGCIA0LQ8/UoeCc8KklwxMyUMCKa2l8Wxi/+8Njv/U
        Cd5i5pR2Ux67kV1/jTd0onXbmj+CTLf55A==
X-Google-Smtp-Source: ABdhPJwUTqChCRKwNoPq0hyrTxaRFa9tk2NiLG9lg/Q8Q6NrC1j6MZdQ3Zy7nf64HdqhrvCUbFV//g==
X-Received: by 2002:a17:90a:db15:: with SMTP id g21mr11930635pjv.113.1619023758819;
        Wed, 21 Apr 2021 09:49:18 -0700 (PDT)
Received: from hermes.local (76-14-218-44.or.wavecable.com. [76.14.218.44])
        by smtp.gmail.com with ESMTPSA id kk7sm2706279pjb.11.2021.04.21.09.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Apr 2021 09:49:18 -0700 (PDT)
Date:   Wed, 21 Apr 2021 09:49:10 -0700
From:   Stephen Hemminger <stephen@networkplumber.org>
To:     linux-usb@vger.kernel.org, netdev@vger.kernel.org
Subject: Fw: [Bug 212741] New: unregister_netdevice: waiting for enp0s20f0u1
 to become free.
Message-ID: <20210421094910.2ccf58b3@hermes.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Looks like a USB driver network device ref count bug.

Begin forwarded message:

Date: Wed, 21 Apr 2021 08:39:38 +0000
From: bugzilla-daemon@bugzilla.kernel.org
To: stephen@networkplumber.org
Subject: [Bug 212741] New: unregister_netdevice: waiting for enp0s20f0u1 to become free.


https://bugzilla.kernel.org/show_bug.cgi?id=212741

            Bug ID: 212741
           Summary: unregister_netdevice: waiting for enp0s20f0u1 to
                    become free.
           Product: Networking
           Version: 2.5
    Kernel Version: 5.11.14
          Hardware: All
                OS: Linux
              Tree: Mainline
            Status: NEW
          Severity: normal
          Priority: P1
         Component: Other
          Assignee: stephen@networkplumber.org
          Reporter: dexter+kernelbugzilla@beetjevreemd.nl
        Regression: No

This problem exists for years by now, I could work around it until now.
Somewhere around kernel 4.9 ish this problem started to appear.

I have an USB network adapter and whenever the connection is severed (because I
touch the cable, USB reset, sleep, cosmic rays) the kernel starts logging below
message every 10~ish seconds. The usagecount is always different, but increases
with uptime. I can replicate this on all my laptops and workstations.

My setup is quite straigtforward, just (networkmanager)DHCP and a wireguard
VPN. Running Fedora 33 (but exists since like 26 or so).


[  992.787930] unregister_netdevice: waiting for enp0s20f0u1 to become free.
Usage count = 8113

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are the assignee for the bug.
