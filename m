Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9827426FE01
	for <lists+linux-usb@lfdr.de>; Fri, 18 Sep 2020 15:15:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726747AbgIRNOz (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 18 Sep 2020 09:14:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726392AbgIRNOz (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 18 Sep 2020 09:14:55 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0853DC06174A
        for <linux-usb@vger.kernel.org>; Fri, 18 Sep 2020 06:14:55 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id x23so5285245wmi.3
        for <linux-usb@vger.kernel.org>; Fri, 18 Sep 2020 06:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:from:to:cc:subject:references:date:in-reply-to
         :user-agent:mime-version;
        bh=z7NMCQr4uWwmRgVH1pXE8o0sMQE/3b7OCzwOg+vd0GQ=;
        b=C1MjyQCPDuCvsPiKsk2Gl10QEtjkIxxuzON1SgNGAiBC69A3CuzKcbW+uePN9wXQ8w
         YmJsaYWDL/hDJQxpxM3RVSoVJC5OfYACHjSqlZGP2TgiFC0B/VXgO4G1sC9FR7V5NYs1
         fPyM+rtuAWH+FgsKujKhKnhqejMNJ+DOg1NIFoZHp2yf+JNjvuJzLPtksuRKYYjdQ4CK
         oZCacNz5aG64Oh7+zR8+fNV/TxeObrllYB9fSH8GpdTmIRxPcpsePQstep0HO+cvEZBk
         8KY2aGz/MUiCe54O3R0t8tUDfZAxkq0ewIuyTIAIdJ90ypFURqpsg+UPEnx6iWUWmE8i
         kp8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:from:to:cc:subject:references:date
         :in-reply-to:user-agent:mime-version;
        bh=z7NMCQr4uWwmRgVH1pXE8o0sMQE/3b7OCzwOg+vd0GQ=;
        b=nNijRg+nHh6Eb2mFZdkBOFDPb3bzln0Kls4I/3PB88CwGb2aw57cTyUS7ulyPZ8E/z
         lYvewZmPGcClVn5H4Q5tsrsT1c+8pHENlO4OFoN4lP/SDRsf3xl0+VU/SPKLmIp7ZvPG
         dF7FkIgxS3/wDKMTcBmBtYC6ikn4rwiGCD2JusMG1Dn4YBEwiYqjqdR8IjRtTFe613nb
         7iwNIscM0p/HLyFc7jHaMQEW+RtX6MgCMXO82tPcaw4dK9HQSuH61BHk5eEaDw1jzBea
         yAj8L9hC7VNB2lt2gmzULq0lyDEWJvJaVe1vd8wHHYHkA/EzYOuqeE3T3FL5gU27EZxK
         /zvg==
X-Gm-Message-State: AOAM530I7W0x6DhkIx/meKDO0YZJPXxZepN1BYk1XJfyQc+mJWDBNKUL
        TZ/fhlQiNN2QCq043eOU2JQWte6ESj1YdA==
X-Google-Smtp-Source: ABdhPJxbIkRQXTOepJnmglC6OxKMlZ1shJjebOJqGevCwyhSdY/m2sjgxcdg5FOgJgiEG/KjVhfMtw==
X-Received: by 2002:a1c:3d44:: with SMTP id k65mr15018761wma.132.1600434893488;
        Fri, 18 Sep 2020 06:14:53 -0700 (PDT)
Received: from daniel-ThinkPad-X230 (lns-bzn-35-82-250-215-35.adsl.proxad.net. [82.250.215.35])
        by smtp.gmail.com with ESMTPSA id 76sm5545768wma.42.2020.09.18.06.14.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2020 06:14:52 -0700 (PDT)
Message-ID: <5f64b2cc.1c69fb81.67f97.d907@mx.google.com>
X-Google-Original-Message-ID: <87lfh7446t.fsf@gmail.com>>
From:   <f1rmb.daniel@gmail.com> (<Daniel Caujolle-Bert>)
To:     Johan Hovold <johan@kernel.org>
Cc:     "\<Daniel Caujolle-Bert\>" <f1rmb.daniel@gmail.com>,
        Oliver Neukum <oneukum@suse.com>, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb-serial-simple: Add Whistler radio scanners TRX serie support.
References: <5f4ca4f8.1c69fb81.a4487.0f5f@mx.google.com>
        <20200918074519.GN24441@localhost>
Date:   Fri, 18 Sep 2020 15:14:50 +0200
In-Reply-To: <20200918074519.GN24441@localhost> (Johan Hovold's message of
        "Fri, 18 Sep 2020 09:45:19 +0200")
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Johan,

  I just tried your patch, and it works, /dev/ttyACM0 is there and
  usable.


Cheers.
---
Daniel
