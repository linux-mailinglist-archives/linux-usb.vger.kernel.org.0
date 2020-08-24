Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B2BC24FC61
	for <lists+linux-usb@lfdr.de>; Mon, 24 Aug 2020 13:17:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbgHXLRg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 Aug 2020 07:17:36 -0400
Received: from mail-lj1-f196.google.com ([209.85.208.196]:40273 "EHLO
        mail-lj1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726473AbgHXLQg (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 Aug 2020 07:16:36 -0400
Received: by mail-lj1-f196.google.com with SMTP id 185so9155168ljj.7;
        Mon, 24 Aug 2020 04:16:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NTTAy7/Bk79COqVPp1Evjr43+xke8os2MtHi98vP9iY=;
        b=EicSrsq40uhZY2B4Fju319uhPtB9IEiKtSpNgKtkSayTVZ0wX/OETsRRS3NeZ3ID2Q
         /u9d+d5oeFM9YDAXLRg5uFGC/dd1FtZoYfUpQkOFICEFKiA1U7BybRjuW8pU+25svI5h
         R2dTQUQo756TSYwLDfcOLA4OY7iIcyBQ0jCfrhGurrxGShFkv48e489Hr8vJKwBu3Pk2
         +qN1q+mZKNePps5y6uK1wq0yYMnAHXr818D39SOcl3zrF937pRWw+VGbr6R4A4Huw9p1
         B/iCFHA/QX9iHsLdv0aUZkbMiXM5nN88maQWUIJomvyn7l2FRlfN1+1aLe1qRma1DLSG
         3FHw==
X-Gm-Message-State: AOAM533hd10f2e6yuzBbet5S02wbvCgYdflU5mx/tjtk1Fbuw/XzPzkQ
        5oyaiy6vomdAr/rWE0K0yHQ=
X-Google-Smtp-Source: ABdhPJyHfYHFFrcReSj2HlMjvtCdInEhju5DvqSiAdCGwddCP5Ek/MLooLRPYf6uKVvsqC4FWvA0MA==
X-Received: by 2002:a2e:912:: with SMTP id 18mr2491547ljj.429.1598267793081;
        Mon, 24 Aug 2020 04:16:33 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id r25sm2018243lfn.93.2020.08.24.04.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 04:16:32 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1kAASl-0000Z9-GD; Mon, 24 Aug 2020 13:16:32 +0200
Date:   Mon, 24 Aug 2020 13:16:31 +0200
From:   Johan Hovold <johan@kernel.org>
To:     "Wang, Sheng Long" <shenglong.wang.ext@siemens.com>
Cc:     Johan Hovold <johan@kernel.org>,
        Sheng Long Wang <china_shenglong@163.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "Kiszka, Jan" <jan.kiszka@siemens.com>
Subject: Re: [PATCH v3] usb-serial:cp210x: add support to software flow
 control
Message-ID: <20200824111631.GG21288@localhost>
References: <20200820075240.13321-1-china_shenglong@163.com>
 <97836b78-740b-cf70-4803-27305b6e0a4d@siemens.com>
 <20200824090948.GC21288@localhost>
 <f21d4cc8b12d4ec6870623472ca7df09@siemens.com>
 <faddf44e-db1d-46e5-b6db-88168b0cc808@siemens.com>
 <20200824094307.GE21288@localhost>
 <8f7594e92e464bd4bd2e51218541ed58@siemens.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8f7594e92e464bd4bd2e51218541ed58@siemens.com>
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Aug 24, 2020 at 10:16:13AM +0000, Wang, Sheng Long wrote:
> Hi, Johan
> 
>   So, Is it currently possible for me to use which Branch?  :)
>  
>   https://github.com/torvalds/linux  master branch
> 
>  Or use  https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git

Please use the usb-next branch from 

	https://git.kernel.org/pub/scm/linux/kernel/git/johan/usb-serial.git

Johan
