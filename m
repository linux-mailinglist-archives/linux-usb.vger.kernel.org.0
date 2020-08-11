Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 42DB42421BF
	for <lists+linux-usb@lfdr.de>; Tue, 11 Aug 2020 23:14:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726479AbgHKVOP (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 11 Aug 2020 17:14:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725987AbgHKVOO (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 11 Aug 2020 17:14:14 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A55C1C06174A
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2020 14:14:13 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id h19so15101825ljg.13
        for <linux-usb@vger.kernel.org>; Tue, 11 Aug 2020 14:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=wXHhCL/Jq5S+dl4cIE+xDbFsMy78sqh/mLA767qJV0A=;
        b=Dc4ZanxbY1dI/ypn9xgkpMgrpM2psJoB4E4w2tpk47WIUjwhgTLlcO9L4zJIzTU3rE
         C0AHx5L7G+Yr53YZdRFHuRwIU+sKCE+OqpICudPW3Jwakkwb1TbqUMAwsIbkaGiOTUP8
         tIM8CdfJLt0ucCLc0Tf/wdiCbudTZFXiLpjEEBdGsbZ+qM8MA1+IwARUFkMkQl8wv8rM
         KETeqty80R2HC3sx+MT0tNFYXxqv8hOQev+GRMyZ99i9UlZtXRwK8x27d48uiTOJ+JIS
         yiuDo3GPSvVzgo3wvGyIdk0KfbtUD5Hivgjpfbjj5J4ovgyxbyLvxC0QtCmELAuVFn/v
         nW/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=wXHhCL/Jq5S+dl4cIE+xDbFsMy78sqh/mLA767qJV0A=;
        b=rh8twyAPUS5Z/kQ98PL/oztawD4aQfBDcNGTSWRNPQBlEfCUa0MzXdXk+vollvN94d
         RKdr2nZVvhTSU+S1YwQe78q3pTP++EqHqVKmV1SHcSMU2tThf+7+h8Sgjh31EbOCUEYn
         +I6anEadTdTIhST/R/8iRlROYT2G0PMkii45mG4j4nIm6+ERfnSOiygL+BAMrCC/4Mcn
         xBHB8M+j0Q1Pao1VpZr8tgC4pjadrulp+LYD0jluOfxxzGMg7P4yCPMy64pifLBpe1xd
         oBEEACRdK1s6w5OwXZpVg6ntQTLPrGrKR1CDcZr52LojgsPbdSX4NZgr3vHxhjfMu+Wq
         djww==
X-Gm-Message-State: AOAM531HnSZPJCYuNDt2lrpRxk4GNXytPW/saU9d6JyZzTyVAu8/84O5
        g/lBHi+vMNAjesUEGm63NzE=
X-Google-Smtp-Source: ABdhPJzRjsongTG+JYR2doA6GNxyEU2qWlx3I2GSC3z2Knzmqn+jf40J/uRt6IsJX/pfNqUREMTq6g==
X-Received: by 2002:a2e:9f4e:: with SMTP id v14mr4078738ljk.72.1597180452170;
        Tue, 11 Aug 2020 14:14:12 -0700 (PDT)
Received: from [10.10.0.8] ([185.213.154.162])
        by smtp.googlemail.com with ESMTPSA id o24sm191426ljg.69.2020.08.11.14.14.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Aug 2020 14:14:11 -0700 (PDT)
Subject: Re: high speed data to usb disk makes the kernel think that is has
 been unmounted
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     Greg KH <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org
References: <a161e45d-6ce8-2077-c513-380b67c4dfd8@gmail.com>
 <20200811175655.GB828356@kroah.com>
 <47a5804c-835a-f1a2-abce-50b3531f2556@gmail.com>
 <20200811193150.GA344152@rowland.harvard.edu>
From:   Patrik Nilsson <nipatriknilsson@gmail.com>
Message-ID: <ef2937d6-f8a8-fbc6-decd-eeb4af94e863@gmail.com>
Date:   Tue, 11 Aug 2020 23:14:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200811193150.GA344152@rowland.harvard.edu>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


On 11/08/2020 21:31, Alan Stern wrote:
> On Tue, Aug 11, 2020 at 08:34:53PM +0200, Patrik Nilsson wrote:
>> Hi Greg,
>>> Can you provide kernel logs?  Odds are the disk disconnects itself as it
>>> takes too much power or something.
>> udev-kernel logs can be found:
>> https://bugs.launchpad.net/ubuntu/+source/linux/+bug/1886172
> The bug report doesn't seem to contain any dmesg kernel logs showing
> what happens when the problem occurs.
I'm compiling the latest kernel to supply the kernel logs when done 
testing. It takes a while.
>
> Also, the bug report indicates that you started to do a bisection
> looking for the kernel version where the problem first appears, but
> there's no mention of the final result.

There were no result. For an unknown reason I haven't the bug behavior 
in the 4.15 series of the kernel (Ubuntu Mate Bionic), but when I tried 
later I had. Maybe it was when I ran Ubuntu Mate Focal with 4.15 series 
of kernel that triggered the bug.

It was a failed attempt to iterate to the kernel version that worked.

It is the same hardware.

> The bug report also indicates that one of your tests involves copying
> /dev/zero to a mounted disk device!  That is highly likely to crash the
> kernel regardless of what the hardware does.  What happens if you
> unmount the disk before running the test?
The ssd disk contains no partition data. It is not mounted.
> Alan Stern
Patrik

-- 
PGP-key fingerprint: 1B30 7F61 AF9E 538A FCD6  2BE7 CED7 B0E4 3BF9 8D6C

