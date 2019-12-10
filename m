Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8DA291188C7
	for <lists+linux-usb@lfdr.de>; Tue, 10 Dec 2019 13:47:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727386AbfLJMrZ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 10 Dec 2019 07:47:25 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:40528 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727370AbfLJMrY (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 10 Dec 2019 07:47:24 -0500
Received: by mail-lj1-f194.google.com with SMTP id s22so19719339ljs.7
        for <linux-usb@vger.kernel.org>; Tue, 10 Dec 2019 04:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YlrnZd/4mlbWTYlkVUDQdyjxHkAmnShBmNrnbD3Wr/A=;
        b=YNLN+/hZPa732MM9fFTw9Q+kw/4KSD8DW4vKnthqpYb+XfVZBY0KG/janBGThmLuxa
         1e1SBORlHkZIa+qQfFG5tXohnsqL/sZlEVT23DUChP94PAOO24pTL/o0e+xvvYiwTwle
         fM8Qy/iSASPJbafJrhNJo89t77PcaGwT2stFZWlmHKhbBGtsTkhFuRDNBDhBPDkWDEPP
         jz4HtED0VYyvKILoQWF1XChbScTCG+oH8LORauXCtWDYwPxdHDQ2vzPzMOgt7iuAJnZQ
         aam3WW+Iv4lpktEplAdSVUb4RAqk35CvU7x/ndHPgBtZyMYh4zm1jQjwkdpuho9HnkB/
         Pudg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YlrnZd/4mlbWTYlkVUDQdyjxHkAmnShBmNrnbD3Wr/A=;
        b=Qjc9u5CKi1oqT4mygyGC0ECQmHte6Dps9aeXhYL9ddbpccv6lHKmX5G5jnn6CIAn/q
         rBUKTzAAqUqCFGYbVOC8mUmmJozhGoD8U103objLoBn8pOhOsQsT3ErV/OFKHJQWNIEl
         8SspFgEZ9v/zTfy2CvsU128nFSPvI4aAxRJpAcbEEYpLHFFoZiBjjiEnEkz70XYX5HlG
         gza1JX0MoG+5/AiKXD5KqkJYx7UMMZRxWke9sldPHST7EwtFLfUL64nBOkwnNZwSDce7
         pmw50zyTOHM9+hzh7hBAewJODeAPC2BxfS/GFU0AQ1ZrBc0MEFY1Sp7A/k+rbMaitru8
         +U9w==
X-Gm-Message-State: APjAAAW1wl5aFM+TB1+xvz9y7jKBLvT1jpalqKSz3jAEdf0u5TOSlfjC
        +8/GF1Od5cyYJWi7RalR1EU=
X-Google-Smtp-Source: APXvYqxbGqB2247KMtQDbyeADGDYB86wf+JN8sBoajdMplmNLx/mmrbKUkKAWEY7RFFS16qtR624eg==
X-Received: by 2002:a2e:96da:: with SMTP id d26mr19985573ljj.6.1575982042671;
        Tue, 10 Dec 2019 04:47:22 -0800 (PST)
Received: from google.com ([2620:0:1043:12:60fa:1524:8dd0:6d])
        by smtp.gmail.com with ESMTPSA id n3sm1511338lfk.61.2019.12.10.04.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2019 04:47:21 -0800 (PST)
From:   Lionel Koenig <lionel.koenig@gmail.com>
X-Google-Original-From: Lionel Koenig <lionelk@google.com>
Date:   Tue, 10 Dec 2019 13:47:20 +0100
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Lionel Koenig <lionel.koenig@gmail.com>, linux-usb@vger.kernel.org,
        Felipe Balbi <balbi@kernel.org>,
        Jonas Stenvall <jonas.stenvall.umea@gmail.com>
Subject: Re: [PATCH] USB: gadget: u_audio: Initialize capture memory
Message-ID: <20191210124720.GA259315@google.com>
References: <20191209103435.GA55498@google.com>
 <s5hr21dfxzl.wl-tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <s5hr21dfxzl.wl-tiwai@suse.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Mon, Dec 09, 2019 at 02:07:58PM +0100, Takashi Iwai wrote:
> Below is a totally untested patch.  It re-uses the existing function
> to fill silence for the given stream more generically.
> 
> Let me know if this works.  If it's OK, I'll submit and merge with a
> proper change log.

I tested the provided patch. It does work as I expected.
Thanks a lot for that.
Best regards,
Lionel
