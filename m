Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5796138365D
	for <lists+linux-usb@lfdr.de>; Mon, 17 May 2021 17:33:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244540AbhEQPbf (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 May 2021 11:31:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245486AbhEQP3o (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 May 2021 11:29:44 -0400
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com [IPv6:2607:f8b0:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC307C00F604
        for <linux-usb@vger.kernel.org>; Mon, 17 May 2021 07:32:01 -0700 (PDT)
Received: by mail-pg1-x52a.google.com with SMTP id m124so4751272pgm.13
        for <linux-usb@vger.kernel.org>; Mon, 17 May 2021 07:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=g1vvev5MnaUyyZ9I99x/LQiVbTb0fYWKAfRRrq+9vSA=;
        b=n7R9YrLNRX9SBZ4p0/uR/mlceSCdYeEVvzL9TdX8aAa551/bmPGtFFJwis3ddoVm4c
         zuXQ3shpOwDXIN/1ebPhbzzBlaoWVFJ+j8L8gLSlUPlM9Brdgo1bsrnF/QMbwIdi/Vu6
         hVRRhhaNN7io5Tk3JOHxPrPn4ZUodeIS9S73jEFSZ34SH4q00GZzmjgmR3prdWJRGUYD
         449W1p+5qDnAVP/PdC6wiFoVZNGQmX1IpVNhN7vt2DWnIuBFpYqYYLBC9/G2uic4HZyM
         oB3gO9wQYAr1YOSiGQdK3beVyLi316OJ11ZKHC0dOHRXYS4aUuNwytHGLQRZHv5Z5ral
         tBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=g1vvev5MnaUyyZ9I99x/LQiVbTb0fYWKAfRRrq+9vSA=;
        b=QuO7gwBhPWVgWoQ8uullozFn4L6JD7lQEmMwF2Iiugz0gUZcOyYjOwfdVGC+KEf5/f
         h5p1R2rexmGYjkA+hhQWGnRgwP7daWhVmDxxLMobIBD3z3OyVA2GkmYeASUtRCesEqqP
         UcwTyJc85pBH+nM3kS6/hXfsZucWvs2C4+LcAiIaB5YiZEwVX3sGYzu+z52qpeuhCmUr
         6q/7sNRsB1EJOo/HKkmzU+iiEPCCaJcTb/FLaKybb1sQC/N90Wr2c2lFLqLLbpLvc2ZP
         P6tI/4sr8GlKqLlmwdz+ucOzMvwPEQRJn9y/HLTCezcy4KZ5pfiIoMZrnvG99S2iRg+f
         UoYg==
X-Gm-Message-State: AOAM53022CRQKKDBcBvxlvdCvF0S9VZ/qMbUI65eiWsKmq6sVi3HzM+9
        ptY/Kw9+O65P8aXpxaKBGotzseA5mJA9vQ==
X-Google-Smtp-Source: ABdhPJwi2uhRgEkDq6UB+od46BADb5MjjNlGrkSuJBnqpU+dqjWKbCVWlUi4Eu3lMZgo6fW7wJOWXw==
X-Received: by 2002:a63:4f4a:: with SMTP id p10mr60890049pgl.432.1621261921200;
        Mon, 17 May 2021 07:32:01 -0700 (PDT)
Received: from [192.168.0.111] ([113.172.200.89])
        by smtp.gmail.com with ESMTPSA id j21sm16090612pjl.27.2021.05.17.07.31.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 May 2021 07:32:00 -0700 (PDT)
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org
From:   Bui Quang Minh <minhquangbui99@gmail.com>
Subject: [BUG REPORT] usb: usb-skeleton: Race condition between skel_open and
 skel_disconnect
Message-ID: <2f3f0176-244c-d76b-3d7d-15b332c87041@gmail.com>
Date:   Mon, 17 May 2021 21:31:57 +0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

I spotted this bug through code review and I don't know how to make a 
Proof of Concept for this bug so maybe I'm wrong.

Between skel_open() and skel_disconnect(), this scenario can happen

skel_open()			skel_disconnect()
dev = usb_get_intfdata(interface);
				usb_set_intfdata(interface, NULL);
				kref_put(&dev->kref, skel_delete);
kref_get(&dev->kref);

In case dev's refcount is 1 before these events, kref_put() in 
skel_disconnect() will call the skel_delete to free dev. As a result, a 
UAF will happen when we try to access dev->kref in skel_open(). I can 
see this pattern in other USB drivers as well such as usblcd.c, yurex.c, ...

Please correct me if I am wrong.

Thank you,
Quang Minh.
