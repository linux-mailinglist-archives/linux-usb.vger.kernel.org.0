Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8034981A12
	for <lists+linux-usb@lfdr.de>; Mon,  5 Aug 2019 14:58:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726811AbfHEM6k (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 5 Aug 2019 08:58:40 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:35201 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726559AbfHEM6k (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 5 Aug 2019 08:58:40 -0400
Received: from mail-pg1-f200.google.com ([209.85.215.200])
        by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1hucZS-00075O-F0
        for linux-usb@vger.kernel.org; Mon, 05 Aug 2019 12:58:38 +0000
Received: by mail-pg1-f200.google.com with SMTP id p15so9038865pgl.18
        for <linux-usb@vger.kernel.org>; Mon, 05 Aug 2019 05:58:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=kLQHkY6IzjLJ/SxKbqZprYGcodxnQqbLc6H8ulCgR/0=;
        b=V9bqZG/3+pqbzyKkwJjW3e67/BiY70DqcW6uqc5O+WU71qhQEEhtcZWskGEMX3+ZIl
         IyXetQvauLieoD71xMPR9qb8Ho8tATkboqWLfBZ6+a3xwG94vJ1o0FQ5x1qqGhNd4vxg
         iwIy/ZiZS7b2x/WOL2yXKzCjVcqbLhq00w+qLEHeONyTgU2EhnorGKJKeTGYSmqfQDYO
         8j9RfozuraVAitzeMZnSrgtdWs84rRd3SBIk7sHHR5+RXbCiWHjDC1iebzO3o7W4RXL9
         Gx0nb51ZIUIr/257amATj9Jiqs4NbZ94uTSyxVNQu2L06yR+sgVN/0SAxBrHAB+5enFW
         skvw==
X-Gm-Message-State: APjAAAV4XIgSihPqN69hnZrlneP/l5DrJzVoYfe0zlqVQhSbNUIM7jBU
        T4VBu0GdVlCY7M39ytFjrRllnijdR4gu9DPe8TD8FMcrUs8EpyV3sT/9tIniAJCAx0xlpZqV1YG
        0XyeqdJhNVp1x3mUiIvygHAn7OR+jcs61JuT9hw==
X-Received: by 2002:a17:90a:cb8e:: with SMTP id a14mr17818349pju.124.1565009916983;
        Mon, 05 Aug 2019 05:58:36 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy6wB7RQJuS893yP0lCto2JC6p6RMOWq5tsJVXCzjroOijdAwdM4YtEXc5wZU7Uw3eYJjb+Ow==
X-Received: by 2002:a17:90a:cb8e:: with SMTP id a14mr17818334pju.124.1565009916772;
        Mon, 05 Aug 2019 05:58:36 -0700 (PDT)
Received: from 2001-b011-380f-37d3-1da7-2297-19d9-489e.dynamic-ip6.hinet.net (2001-b011-380f-37d3-1da7-2297-19d9-489e.dynamic-ip6.hinet.net. [2001:b011:380f:37d3:1da7:2297:19d9:489e])
        by smtp.gmail.com with ESMTPSA id x24sm81693897pgl.84.2019.08.05.05.58.35
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 05 Aug 2019 05:58:36 -0700 (PDT)
Content-Type: text/plain;
        charset=utf-8;
        delsp=yes;
        format=flowed
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [PATCH v2] USB: Disable USB2 LPM at shutdown
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <46147522-7BC2-4C30-B3E5-6568E9642982@canonical.com>
Date:   Mon, 5 Aug 2019 20:58:33 +0800
Cc:     Alan Stern <stern@rowland.harvard.edu>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Linux USB List <linux-usb@vger.kernel.org>,
        lkml <linux-kernel@vger.kernel.org>
Content-Transfer-Encoding: 8bit
Message-Id: <27A5C1CC-E0A4-4CAF-B81E-90EE76C8A887@canonical.com>
References: <Pine.LNX.4.44L0.1906061013490.1641-100000@iolanthe.rowland.org>
 <46147522-7BC2-4C30-B3E5-6568E9642982@canonical.com>
To:     Greg KH <gregkh@linuxfoundation.org>
X-Mailer: Apple Mail (2.3445.104.11)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Greg,

at 17:22, Kai-Heng Feng <kai.heng.feng@canonical.com> wrote:

> at 22:17, Alan Stern <stern@rowland.harvard.edu> wrote:
>>
>> I agree with Kai-Heng, this seems like a fairly light-weight solution
>> to a reasonable problem.
>
> Thanks for your review.
>
>> As to the issue of how much it will slow down system shutdowns, I have
>> no idea.  Probably not very much, unless somebody has an unusually
>> large number of USB devices plugged in, but only testing can give a
>> real answer.
>
> In addition to that, only USB2 devices that enable LPM will slow down  
> shutdown process.
> Right now only internally connected USB2 devices enable LPM, so the  
> numbers are even lower.
>
>> I suppose we could add an HCD flag for host controllers which require
>> this workaround.  Either way, it's probably not a very big deal.
>
> IMO this is not necessary. Only xHCI that reports hw_lpm_support will be  
> affected. At least for PC, this only became true after Whiskey Lake.
>
> Kai-Heng
>
>> Alan Stern

This patch is included in Ubuntu’s kernel for a while now, and there’s no  
regression report so far.
Please consider merge this patch.

Kai-Heng
