Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 147CEB5961
	for <lists+linux-usb@lfdr.de>; Wed, 18 Sep 2019 03:43:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726037AbfIRBns (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 17 Sep 2019 21:43:48 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:39516 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725943AbfIRBns (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 17 Sep 2019 21:43:48 -0400
Received: by mail-pf1-f195.google.com with SMTP id i1so3281716pfa.6
        for <linux-usb@vger.kernel.org>; Tue, 17 Sep 2019 18:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=DJ4VTkF1MgYTEbXhb3vC6Px/TCKyeIkJcpYq3+2Iph4=;
        b=RZ52A2YfsolRKOMKWNwEopwpDohLvAtXVLU7az9iDWA3ab3EE9PC5+e5j5DZfOzKyJ
         g3a0SsxQN3kGrCD1/HhCU2hiwhCR4LpZCWaFYDxSYUK1nhBbpxH7l7m9K8m/OZDhu5RN
         82ukb0tZ3Amglo92GZtP6+w4xf+wLbyfb+EJqX52a9DM8LYzNFfJl43ACaFoEPb9fwY3
         uu2R3B/8S28BfhSeEgG0j1sAlg8VO2nDKqAC1dtRFXXKv7RQy/FyVmMgthe88H9XDJid
         blV9E89yok1IdKO5kNlZJYb2sKQe94YfwiD2VLy8hc+ZvcD2fqrPoIfkYQ3HhF9dqEv+
         PQCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=DJ4VTkF1MgYTEbXhb3vC6Px/TCKyeIkJcpYq3+2Iph4=;
        b=RRiSw7wISBtD8MfOEq6iXKU2YulAaetg8fxlIoZm01YQH3mBsn5RV+Rq7c8cPyp77X
         CXBShvMKAo0iWMDpdLlabEt+LRtLYTXquu3duNYg1EL5e5f3ZyO7F0p0e5Dl6O5VPyJU
         bN1xC6wuDZ5s3K4Mly5DbMfq0Cg9Lpmy6blWhveF27EyWsB59/bolUKLv64UVCSiVT+E
         SD0IoSxCjYrmyewmX2Hy4BCdroWmrfmXV9sYe7zpStGC95o0Qh/CJRHNJEG4POdIvkeA
         XvIsdnRCzXqiyaHjoQcS2U8tpw1iORQdEOznMduqnGjIE/VhrcJa5XcTrMkL5PUFPMzv
         /kdQ==
X-Gm-Message-State: APjAAAXyAhUBPEIp9xjrFPKrE4+5+zhCNhKXmxRun7a8zR8YgkxnilYA
        ZaNyJB3O3UsP+/rJyZ/elXKe/KFl
X-Google-Smtp-Source: APXvYqy0ekjsCLOuSOxoeLQY/tghp2tOYclWml1asfX258WWtlhh1O2nI3R9dow8nYZlWBV11FSTrg==
X-Received: by 2002:a17:90a:f83:: with SMTP id 3mr1126490pjz.90.1568771027446;
        Tue, 17 Sep 2019 18:43:47 -0700 (PDT)
Received: from [192.168.1.5] ([110.78.179.117])
        by smtp.googlemail.com with ESMTPSA id g4sm4070517pfo.33.2019.09.17.18.43.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Sep 2019 18:43:46 -0700 (PDT)
Subject: Re: Failed to connect to 4G modem
To:     JH <jupiter.hce@gmail.com>, Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
References: <CAA=hcWRF00syz8jB1+qdy1pFA7Wk_B=1Z_DT5vYuQrzFKhtZbw@mail.gmail.com>
 <20190917120258.GB489142@kroah.com>
 <CAA=hcWTD2zYD0gVTu6sDuRqUcTOnn42Gm0s1tOGvBQdQ40Q7LA@mail.gmail.com>
From:   Lars Melin <larsm17@gmail.com>
Message-ID: <42e92dcb-0165-7a64-1391-c8ff602878a1@gmail.com>
Date:   Wed, 18 Sep 2019 08:43:43 +0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAA=hcWTD2zYD0gVTu6sDuRqUcTOnn42Gm0s1tOGvBQdQ40Q7LA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 9/18/2019 04:38, JH wrote:
......
> 
> That was always my thought until I tried kernel 5.1 under the same
> platform (nothing changed except the kernel version), the kernel 5.1
> can connect to the 4G modem, I could not tell the hardware engineer if
> it was hardware problem where kernel 5.1 can connect, kernel 4.19
> could not, how would you explain it? Seems some differences between
> kernel 5.1 and kernel 4.19, what I could be missing?

Tell your hardware engineer to log the VBUS supply together with the 
current consumption of the 4G card.
A glitch in the VBUS supply, often caused by an increase in current 
consumption is a common reason for a usb modem to reset and temporarily 
fall off the usb bus.

br
Lars

