Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5678D1ADFC2
	for <lists+linux-usb@lfdr.de>; Fri, 17 Apr 2020 16:26:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727801AbgDQOZs (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 17 Apr 2020 10:25:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727121AbgDQOZp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 17 Apr 2020 10:25:45 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A146EC061A0F
        for <linux-usb@vger.kernel.org>; Fri, 17 Apr 2020 07:25:43 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id r20so1122458pfh.9
        for <linux-usb@vger.kernel.org>; Fri, 17 Apr 2020 07:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=L6cWP5WK6ujku9y43wjaNC6S0VeElTh4yenPv8t29Ak=;
        b=gKw5eoYUIpd77RsZ9EA4/OBI5it3b4QtTk5w0WNiaVsQlhU0AvTC99Kwb6pyQrnZwb
         8mkxqNjg6VEOZTZqnkLOebZlO/n/v5mMNjfkBB1cGO3Fx7O3pVDrmTfYyuyYufQ9ccR3
         RtPWKLjDzCOGMUWt9saeSwmpszseuFa+iiXqlLA7QMz5NdgXvU//k288EsKe0YfAzi6u
         dvmxk+qgp7K7fE2PnVT7fvqSgeWduMN7B1pblLGgZqKs3H1NpzAxQ5FN/ffFSwvnE0Dr
         z0qCKxdTOrenMDSXdIXvCN19QGBDvsZe/1e/6pTgbuMcknn8YL4CeODkrzae32Dl8ywr
         FA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=L6cWP5WK6ujku9y43wjaNC6S0VeElTh4yenPv8t29Ak=;
        b=BiZr+QT1UERWaP3t56SP0DLbUF2lY1NFZ/uG1A8qz/nY9Kzanp2RF50JlwSexzWfLn
         qiGuUSLOIgJ9D6nxk14Yk/QtzYqxJhL36QxIny+MTbISUPjhJd3U8KCnctMTzuO9hYBR
         StcDPlsu/47BWxtQgABlQuIikg0R08JTWFpMEZKbLoVuPVZUPh4rvV7MHyvYV0XUaJhy
         qxcjnt/u/aaGW6Ti6ECEogGQyWgChAPjrdX7z8uWsfXOcxNdGj461+qhoTWx0GIy0FT5
         l4g+O23rQDLx7Vm4Yjt30Yt7Jv+BjqMShu3LNgsGR+D5WNXJ8+7BJp1TMYcBMx1xPKma
         V1Aw==
X-Gm-Message-State: AGi0PuYbnBM3BjAc0+++kCW39YZRcypgQObmoi5LwN4RG6UMuKp26cO3
        Zx4VNGNXUtjbhuDuz2EWuxThgA==
X-Google-Smtp-Source: APiQypLk3UKQ7IlVU68RBsk4YcfumTB0+HNr5I6KmasWP50lwGXPB60OmHhJAmy9VXUBKXWGkLn5iw==
X-Received: by 2002:a63:1662:: with SMTP id 34mr3312317pgw.117.1587133542614;
        Fri, 17 Apr 2020 07:25:42 -0700 (PDT)
Received: from [192.168.1.188] ([66.219.217.145])
        by smtp.gmail.com with ESMTPSA id r18sm579944pfg.120.2020.04.17.07.25.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Apr 2020 07:25:41 -0700 (PDT)
Subject: Re: improve use_mm / unuse_mm v2
To:     Christoph Hellwig <hch@lst.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Al Viro <viro@zeniv.linux.org.uk>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Zhenyu Wang <zhenyuw@linux.intel.com>,
        Zhi Wang <zhi.a.wang@intel.com>,
        Felipe Balbi <balbi@kernel.org>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>, linux-kernel@vger.kernel.org,
        amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, linux-usb@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        linux-fsdevel@vger.kernel.org, io-uring@vger.kernel.org,
        linux-mm@kvack.org
References: <20200416053158.586887-1-hch@lst.de>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <8d314bc3-ea59-684d-2d34-20b152a36f4f@kernel.dk>
Date:   Fri, 17 Apr 2020 08:25:38 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200416053158.586887-1-hch@lst.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On 4/15/20 11:31 PM, Christoph Hellwig wrote:
> Hi all,
> 
> this series improves the use_mm / unuse_mm interface by better
> documenting the assumptions, and my taking the set_fs manipulations
> spread over the callers into the core API.
> 
> Changes since v1:
>  - drop a few patches
>  - fix a comment typo
>  - cover the newly merged use_mm/unuse_mm caller in vfio

You can add my reviewed-by/tested-by to the patches, passes the
io_uring regression tests.

-- 
Jens Axboe

