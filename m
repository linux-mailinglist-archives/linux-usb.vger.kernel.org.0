Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F346CCA0C8
	for <lists+linux-usb@lfdr.de>; Thu,  3 Oct 2019 16:57:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730166AbfJCO5k convert rfc822-to-8bit (ORCPT
        <rfc822;lists+linux-usb@lfdr.de>); Thu, 3 Oct 2019 10:57:40 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:50272 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727587AbfJCO5k (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 3 Oct 2019 10:57:40 -0400
Received: from mail-pg1-f197.google.com ([209.85.215.197])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1iG2Xy-00004r-Mf
        for linux-usb@vger.kernel.org; Thu, 03 Oct 2019 14:57:38 +0000
Received: by mail-pg1-f197.google.com with SMTP id x8so2131253pgq.14
        for <linux-usb@vger.kernel.org>; Thu, 03 Oct 2019 07:57:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=W0SWomT5SY0yDSTtHUSDJc9LHcZaOyfwcQXgQs9p9z4=;
        b=GvpksrGf+T5TksaDUL32F1yORd530BMANz+sPbMMMJ1umqCC6SvAnIm52v3nwjv9G3
         ao4bL5UpUwBQOD1gZ6J7sBqfU95N+TfmwNs18rArnxRih8oZsWg9Vd5VyxsOy4JUSOQj
         q6rMZxe+ZdPkUHkxEttDfvvCXOiHOZdF5QWLH+z5TaMSJFWjMUf+Rm+p+pfgVQhVTbWF
         3HwLtW5YDeLR0s7oWDgWQkFHurUw4jg0B9Ypfhg99S45/IxeUp1Th0S709MguXfYN1yY
         5oNonQYTxCJRdBLJOPHKMndfufz5Y78a/aodJXOePQYEXdXcvsKAuqW/Xv+YIgqqL464
         AhfA==
X-Gm-Message-State: APjAAAX+6V5qEoWNmbljmmbe+c9XhZUQKpnb1JBcBn5aHuhmuvVq+5mo
        hXqniZGSXIjjIWB4ChNx5LSxqpExJPodICDETbnEwwI+e1uo/Xrk9unHGaHa6V2adIFGwnR7Sjr
        yTuxcYEo9cMOGvkX2wfZ+7nlxoRD2v1oXteBzQw==
X-Received: by 2002:a62:2b4d:: with SMTP id r74mr11513013pfr.30.1570114657200;
        Thu, 03 Oct 2019 07:57:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqygWXjUMR1GW5JvI0IYOkgqCblsfxeBPVrb6mAoWUgub2AC/J9+rFS9punoE4zVZDk2PoplcA==
X-Received: by 2002:a62:2b4d:: with SMTP id r74mr11512986pfr.30.1570114656861;
        Thu, 03 Oct 2019 07:57:36 -0700 (PDT)
Received: from 2001-b011-380f-3c42-0c4b-be14-8894-cacf.dynamic-ip6.hinet.net (2001-b011-380f-3c42-0c4b-be14-8894-cacf.dynamic-ip6.hinet.net. [2001:b011:380f:3c42:c4b:be14:8894:cacf])
        by smtp.gmail.com with ESMTPSA id p66sm3205097pfg.127.2019.10.03.07.57.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 Oct 2019 07:57:36 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3594.4.18\))
Subject: Re: [PATCH] Revert "usb: Avoid unnecessary LPM enabling and disabling
 during suspend and resume"
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <Pine.LNX.4.44L0.1910031024410.1797-100000@iolanthe.rowland.org>
Date:   Thu, 3 Oct 2019 22:57:33 +0800
Cc:     mathias.nyman@intel.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 8BIT
Message-Id: <E833DEE2-ADE1-436C-A342-427EA460F276@canonical.com>
References: <Pine.LNX.4.44L0.1910031024410.1797-100000@iolanthe.rowland.org>
To:     Alan Stern <stern@rowland.harvard.edu>
X-Mailer: Apple Mail (2.3594.4.18)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org



> On Oct 3, 2019, at 22:26, Alan Stern <stern@rowland.harvard.edu> wrote:
> 
> On Thu, 3 Oct 2019, Kai-Heng Feng wrote:
> 
>>> On Oct 2, 2019, at 23:47, Alan Stern <stern@rowland.harvard.edu> wrote:
>>> 
>>> On Wed, 2 Oct 2019, Kai-Heng Feng wrote:
>>> 
>>>> This reverts commit d590c23111505635e1beb01006612971e5ede8aa.
>>>> 
>>>> Dell WD15 dock has a topology like this:
>>>> /:  Bus 04.Port 1: Dev 1, Class=root_hub, Driver=xhci_hcd/2p, 10000M
>>>>   |__ Port 1: Dev 2, If 0, Class=Hub, Driver=hub/7p, 5000M
>>>>           |__ Port 2: Dev 3, If 0, Class=Vendor Specific Class, Driver=r8152, 5000M
>>>> 
>>>> Their IDs:
>>>> Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
>>>> Bus 004 Device 002: ID 0424:5537 Standard Microsystems Corp.
>>>> Bus 004 Device 004: ID 0bda:8153 Realtek Semiconductor Corp.
>>>> 
>>>> Ethernet cannot be detected after plugging ethernet cable to the dock,
>>>> the hub and roothub get runtime resumed and runtime suspended
>>>> immediately:
>>>> ...
>>> 
>>>> After some trial and errors, the issue goes away if LPM on the SMSC hub
>>>> is disabled. Digging further, enabling and disabling LPM during runtime
>>>> resume and runtime suspend respectively can solve the issue.
>>>> 
>>>> So bring back the old LPM behavior, which the SMSC hub inside Dell WD15
>>>> depends on.
>>>> 
>>>> Fixes: d590c2311150 ("usb: Avoid unnecessary LPM enabling and disabling during suspend and resume")
>>>> Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
>>> 
>>> Maybe it would be better to have a VID/PID-specific quirk for this?
>> 
>> Re-reading the spec, I think we need some clarification:
>> "If the value is 3, then host software wants to selectively suspend the
>> device connected to this port. The hub shall transition the link to U3
>> from any of the other U states using allowed link state transitions.
>> If the port is not already in the U0 state, then it shall transition the
>> port to the U0 state and then initiate the transition to U3."
>> 
>> The phrase "then it shall transition the port to the U0 state" what does "it" here refer to?
>> Is it the hub or the software?
>> If it's the former then it's indeed a buggy hub, but if it's the latter I think reverting the commit is the right thing to do.
> 
> In my opinion, "it" here refers to the hub.  This is because of the 
> parallel construction with the preceding sentence ("... shall 
> transition the link/port"), which indicates that the subjects should be 
> the same.

Hmm, okay, this is ambiguous to a non-native speaker like me.
I'll use a quirk instead.

Kai-Heng

> 
> Alan Stern
> 

