Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C918E68E333
	for <lists+linux-usb@lfdr.de>; Tue,  7 Feb 2023 22:58:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbjBGV6L (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 7 Feb 2023 16:58:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbjBGV6J (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 7 Feb 2023 16:58:09 -0500
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18F403BDAB
        for <linux-usb@vger.kernel.org>; Tue,  7 Feb 2023 13:58:09 -0800 (PST)
Received: by mail-pj1-x102b.google.com with SMTP id n20-20020a17090aab9400b00229ca6a4636so237354pjq.0
        for <linux-usb@vger.kernel.org>; Tue, 07 Feb 2023 13:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lODRrBo6/Srodf7L0kUDHgq6mUlBi1HnNAN+4XofQ4E=;
        b=Q09Brw4H6JlF0wIiN3AM+1EhHp7Xp4UGfKJNsIA2yMojuRL4/61GqO/rcYaojljtXN
         5uZnBd0S8/XYLDDH/ZP9L1oOkj4Wcx1GPrFao3tKRwuVEfcjM6cGRyosn8kRqdkIobhN
         VfE/Q0vRFagO50PpvvuEOQWX8nOgZW8NJMj4Zeu9ww/Q9vEPQnXLklnkZ/VGeIiI9Pde
         AH71HOzs5dmZ/ZpHd/tkMcqOVaE0WJDOPYh9pEk396C6GnJRvKiwyPJP9I5xsmDrWUK9
         tKrUWOCaZ9F5WjRleW/5ANuYii8roPoFBQUom4nfuJE7JwplJA6VLXpA/qxjuViVkI65
         0Zjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lODRrBo6/Srodf7L0kUDHgq6mUlBi1HnNAN+4XofQ4E=;
        b=XtkJMrdZGLf4Q3aH6yOcb21E/vNkEUsS+dwFjBG5C7FnZ2U0684uTODbkpS7kd2OGb
         uuIKinLHrd1hfZF75d4IoK+x6rL7YCzTM/Yg5NNau5zhrHZZBRL0Gc3Ib1aJItppA2rY
         FS9zQ8zBY1X796tqJXIAmby5FqoVKrHfi+ZXZ5+TKV6+wZW/uI2bUwNAK2jmFHAz1iT7
         fVw+wykBJPZYitkyMj8XLm2szqQOViqfOp7+Ls27IGcfOr6xhXqC9HemH98CqilfsFjS
         tWf1cEhMoM2DRpbntCPVb9gcDiHfdx5qcBZ3yBrAaPyPxbOhRTsaWeZ2W6CTCX9lmISp
         RKhg==
X-Gm-Message-State: AO0yUKUXgZgq12WP7kc4eSqUFFfTegsWZjWzXmfVlQSAwjiOKnLnOR6N
        M2PUjkubBCJdC/VRoGNY5dlp+w==
X-Google-Smtp-Source: AK7set+g3PPm+9yC4yTnmCwUOncnbAEl2iKWhUfobBiiWLq+S4+EGWVD5kvc9EQefFLEVaPFbdEezg==
X-Received: by 2002:a17:902:8604:b0:198:af50:e4df with SMTP id f4-20020a170902860400b00198af50e4dfmr48944plo.5.1675807088241;
        Tue, 07 Feb 2023 13:58:08 -0800 (PST)
Received: from google.com (30.202.168.34.bc.googleusercontent.com. [34.168.202.30])
        by smtp.gmail.com with ESMTPSA id 7-20020aa79147000000b00592d9d468e6sm1739102pfi.20.2023.02.07.13.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Feb 2023 13:58:07 -0800 (PST)
Date:   Tue, 7 Feb 2023 21:58:03 +0000
From:   Xin Zhao <xnzhao@google.com>
To:     John Keeping <john@metanate.com>
Cc:     Alan Stern <stern@rowland.harvard.edu>, gregkh@linuxfoundation.org,
        jakobkoschel@gmail.com, rdunlap@infradead.org, ira.weiny@intel.com,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] usb: gadget: dummyhcd: Fix use-after-free in
 dummy_free_request
Message-ID: <Y+LJa8ZuBaD1DwlL@google.com>
References: <20230206225258.2302954-1-xnzhao@google.com>
 <Y+GcoFKiAkrCoAsv@rowland.harvard.edu>
 <Y+I9HcPvrm1TzUCw@donbot>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y+I9HcPvrm1TzUCw@donbot>
X-Spam-Status: No, score=-17.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        USER_IN_DEF_DKIM_WL,USER_IN_DEF_SPF_WL autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

On Tue, Feb 07, 2023 at 11:59:25AM +0000, John Keeping wrote:
> On Mon, Feb 06, 2023 at 07:34:40PM -0500, Alan Stern wrote:
> > On Mon, Feb 06, 2023 at 10:52:58PM +0000, Xin Zhao wrote:
> > > DummyHCD assume when dummy_free_request is called, the request
> > > is already detached from request queues. It is correct in most
> > > cases.
> > > But when DummyHCD is detached from gadget configfs with pending
> > > requests and some requests are still in pending queue,
> > > dummy_free_request would free them directly.
> > > Later on, dummy_udc_stop would iterate pending queue to release
> > > the requests again.
> > > 
> > > Stacktrace for dummy_free_reqeust
> > > ```
> > > kfree(const void * x) (slub.c:4200)
> > > dummy_free_request(struct usb_ep * _ep, struct usb_request * _req) (dummy_hcd.c:691)
> > > usb_ep_free_request(struct usb_ep * ep, struct usb_request * req) (core.c:201)
> > > functionfs_unbind(struct ffs_data * ffs) (f_fs.c:1894)
> > 
> > That's the bug right there.  The kerneldoc for usb_ep_free_request() 
> > says "Caller guarantees the request is not queued".  So it looks like 
> > the real solution is to fix functionfs_unbind().
> 
> This is commit ce405d561b02 ("usb: gadget: f_fs: Ensure ep0req is
> dequeued before free_request") IIUC.
> 
> Xin, are you able to test a version with that commit?

Yes John, the commit may fix the issue. Thanks for bring it up.
