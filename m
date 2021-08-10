Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4B9613DE2EC
	for <lists+linux-usb@lfdr.de>; Tue,  3 Aug 2021 01:15:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232208AbhHBXPI (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 2 Aug 2021 19:15:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231126AbhHBXPI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 2 Aug 2021 19:15:08 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 911D2C06175F
        for <linux-usb@vger.kernel.org>; Mon,  2 Aug 2021 16:14:57 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id u25so26083549oiv.5
        for <linux-usb@vger.kernel.org>; Mon, 02 Aug 2021 16:14:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TjypnJIGsZivq+AJtxRV91gMpI4hjSbuEGhwWn6yEp0=;
        b=N7eUayXyS8f/dXjID2CZc+xN2hUP0dvrCdcJPVCU0NXTH0GnKWNJgWV5L9MF5BPFCP
         +eilS/z3KOT2ot6uKoSMmal3ammgg0Vpq43fUq8OUyHLz1cbioLTIWbmWTPDIEq4yxqC
         OxAhQeGQ/IZGL6NOZHSMrTLKxEcnLr9FaX5GY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TjypnJIGsZivq+AJtxRV91gMpI4hjSbuEGhwWn6yEp0=;
        b=Uuc11c4JTNI2WXK63g65xw2EWQm2ozy3krjTsoGELCQ+rjgoBo2UqCEzmPtJ9vPOB7
         ARQ62zqD/YsVDcVPZyq72V8qH80sHG0pge3QCCHY01pJS/Xs8KDqVoRbSKVQlpQFZI7g
         frJ0hQdxJE6TpSWm3n5LYR+BVMHYWDYc8kpOKfVYp3Z597CVRhlAqcJSYg6ZA+RtQrOU
         z01mZFThAaf+qADaWVy1zKrUbSYux8HIYJuJ3kJJ9dG2Ef7pdZwtgsJcJ7q4bv5zisfx
         V6IyQofflis6m/zn1j43JFlEBckTdNSfoG11xLg8hcHhxLm5iKWK1G4l8vtMy6t0tM8G
         P6EQ==
X-Gm-Message-State: AOAM5321Op/4SExNKNHA+IsrfgDp7LaVcVvI04Lx1JLyU8q/U2bdpx8O
        VePheUNitX9sf62hlHId8yYm/A==
X-Google-Smtp-Source: ABdhPJwjZ4tzJMTSu6JLvMq3bBSNm8Pyye0xg9C4L6sH6U2CEIMZFfJAwsFhxvNkxF9zcbojC9+WFA==
X-Received: by 2002:a05:6808:8e6:: with SMTP id d6mr12673956oic.45.1627946096985;
        Mon, 02 Aug 2021 16:14:56 -0700 (PDT)
Received: from [172.31.99.103] (c-73-14-2-216.hsd1.co.comcast.net. [73.14.2.216])
        by smtp.gmail.com with ESMTPSA id t24sm21296otq.66.2021.08.02.16.14.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Aug 2021 16:14:56 -0700 (PDT)
Subject: Re: [PATCH v2] vhci_hcd: USB port can get stuck in the disabled state
To:     Michael <msbroadf@gmail.com>
Cc:     valentina.manea.m@gmail.com, shuah@kernel.org,
        gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shuah Khan <skhan@linuxfoundation.org>
References: <20210721235526.10588-1-msbroadf@gmail.com>
 <7b02cb66-d672-ae95-01ea-c6015725e1ac@linuxfoundation.org>
 <CALdjXpA4_eXen6RjhsEBYt8CQs-2gzwYs9h9q0Z2LKZ=rXVp+Q@mail.gmail.com>
 <ad07410b-05d6-6a12-13df-14e31cbf50ff@linuxfoundation.org>
 <CALdjXpBPRraC8xxORgE3SXw4xFnTW-Y6rLbcS+Cx0xYq3+aBeQ@mail.gmail.com>
 <976d34c0-d603-1f16-edbd-ad6c8881ad4e@linuxfoundation.org>
 <CALdjXpAzE3o7Bwdvj1TvsBRpDWDe1FZ8LsmL5q0suxYnRJCOaA@mail.gmail.com>
From:   Shuah Khan <skhan@linuxfoundation.org>
Message-ID: <5165bd84-11af-35dd-8a9b-11c7f219fb88@linuxfoundation.org>
Date:   Mon, 2 Aug 2021 17:14:54 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CALdjXpAzE3o7Bwdvj1TvsBRpDWDe1FZ8LsmL5q0suxYnRJCOaA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 7/30/21 5:52 PM, Michael wrote:
> Yes i think just adding the VDEV_ST_USED check in addition to the
> VDEV_ST_NOT_ASSIGNED state is fine and would fix the issue.
> 

Can you please confirm if this works?

> After many years of writing virtualhere (a similar system to usb/ip
> but cross-platform and different non-kernel way of doing it server
> side) I've seen many drivers that issue reset at any time. Loading
> firmware is usually the reason.  Also sometimes switching
> configurations requires a reset also, for example some gaming wheels
> do this. I don't think you should make this VDEV_ST_USED check
> specific to Wifi devices, as a lot of devices don't follow too closely
> to the USB protocol to begin with from my experience. They primarily
> base their USB interactions assuming the windows platform and its
> quirks.
> 

When sending responses to Linux kernel mailing lists, please use bottom post.
This check will be used for all drivers. We don't add checks for specific cases
in the code.

thanks,
-- Shuah

