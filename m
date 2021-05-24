Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F69738F33F
	for <lists+linux-usb@lfdr.de>; Mon, 24 May 2021 20:50:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233045AbhEXSvu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 24 May 2021 14:51:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232746AbhEXSvu (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 24 May 2021 14:51:50 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B6CDC061574
        for <linux-usb@vger.kernel.org>; Mon, 24 May 2021 11:50:21 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id ep16-20020a17090ae650b029015d00f578a8so11697626pjb.2
        for <linux-usb@vger.kernel.org>; Mon, 24 May 2021 11:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fQgHvnfIC6ECXr/JZNhUc4xHmYDETUNJEbI4WCNlKJ4=;
        b=AQxrTgiRwV25d4OHYDxMnBkKHtkIzePoDNyvsSm2daB6J1FXuECrte7Rn0vl13l//X
         87/84APa6vR0EPGBJ91bQ8LKfLi5SL+FRYWuyAPo+RukbKfCbd94+NKFhmKsZh86FSfs
         sn2sz31Q6nZvHEHXE+IotQbx/Rs6KiUiAXyNl3QpQYJ1/Y8EHr4TJe1POqFkNKN1s/P6
         pbjkxTjPrv5SEUhQMPxgPpZ03q20CyvdcflhcHKkhsXC/aVFdSZf3rygaCuy5LG1l++X
         7+wq2AFYGBONNMfenzNmLfyZv0yYBk2KZYDhRiwfqPdNqal40OAxZoEiTJ7mTG968RSn
         S++w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fQgHvnfIC6ECXr/JZNhUc4xHmYDETUNJEbI4WCNlKJ4=;
        b=PvbHH8pGADKiE8e8GrGdvYd3wyeWzP303kV7iNbb7bCYsWxcUJb55AKCeqvRfkOu+D
         wZMH5u0bmuG6iv7w6ohoFItB+JBrelcGVuVxUoWtrasAD2rlMSzG0ZP49yJeRTE8gHIx
         dYErSjDK6oZHcX/15WyWdlEbeSVZvMWMAE4TxeTzH7gpakInES2INg7b0HJQiIUGSCy7
         HvVuXbL4hrRdBL4BLcRIWiSCI2QM9KcW+5ldFVCAbdKVNjX6L+LHDilSQscY1VNJ2fDZ
         uV05yfwZMxD841DZqY1+apItR6HoDofvcjfBy9KE2Ls0CGtAZN1XpVntuP03YXgekLOV
         +4Vg==
X-Gm-Message-State: AOAM533TeaZLMhIiIA0lcp5lilSnrkJOy0dAnNvfN6n4Po/eMzHNEljP
        j2tSX+hMfufJpeCvdJFuAHg=
X-Google-Smtp-Source: ABdhPJzxeSsOQjRMhPQr78up8q9/1X745LDof09uXAN1RSz+SdOqU3+447W/de+5a96IodwbelF/Ng==
X-Received: by 2002:a17:902:b70f:b029:f4:5445:cd9f with SMTP id d15-20020a170902b70fb02900f45445cd9fmr27115533pls.32.1621882220529;
        Mon, 24 May 2021 11:50:20 -0700 (PDT)
Received: from google.com ([2620:15c:202:201:870d:a395:9098:674])
        by smtp.gmail.com with ESMTPSA id o24sm12043940pgl.55.2021.05.24.11.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 11:50:19 -0700 (PDT)
Date:   Mon, 24 May 2021 11:50:17 -0700
From:   Dmitry Torokhov <dmitry.torokhov@gmail.com>
To:     Bui Quang Minh <minhquangbui99@gmail.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org
Subject: Re: [BUG REPORT] usb: usb-skeleton: Race condition between skel_open
 and skel_disconnect
Message-ID: <YKv1aYqdGWopI2fp@google.com>
References: <2f3f0176-244c-d76b-3d7d-15b332c87041@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2f3f0176-244c-d76b-3d7d-15b332c87041@gmail.com>
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

On Mon, May 17, 2021 at 09:31:57PM +0700, Bui Quang Minh wrote:
> Hi,
> 
> I spotted this bug through code review and I don't know how to make a Proof
> of Concept for this bug so maybe I'm wrong.
> 
> Between skel_open() and skel_disconnect(), this scenario can happen
> 
> skel_open()			skel_disconnect()
> dev = usb_get_intfdata(interface);
> 				usb_set_intfdata(interface, NULL);
> 				kref_put(&dev->kref, skel_delete);
> kref_get(&dev->kref);
> 
> In case dev's refcount is 1 before these events, kref_put() in
> skel_disconnect() will call the skel_delete to free dev. As a result, a UAF
> will happen when we try to access dev->kref in skel_open(). I can see this
> pattern in other USB drivers as well such as usblcd.c, yurex.c, ...
> 
> Please correct me if I am wrong.

I think it is mostly OK. As far as I can see the minor_rwsem in
drivers/usb/core/file.c makes sure that usb_open()/skel_open() either
complete if they happen before call to usb_deregister_dev() in
skel_disconnect() or usb_open() errors out and not call into skel_open()
if usb_deregister_dev() already completed. So there is no issue with
bumping refcount while the structure is being deleted.

This only leaves usb_get_intfdata() returning NULL because we set it to
NULL too early in skel_disconnect(). I'd recommend moving
"usb_set_intfdata(interface, NULL)" to happen after call to
usb_deregister_dev() in skel_disconnect().

Thanks.

-- 
Dmitry
