Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0BE32726D5
	for <lists+linux-usb@lfdr.de>; Mon, 21 Sep 2020 16:21:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726991AbgIUOVU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 21 Sep 2020 10:21:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726395AbgIUOVU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 21 Sep 2020 10:21:20 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F0C1C061755
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2020 07:21:20 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id m6so12999076wrn.0
        for <linux-usb@vger.kernel.org>; Mon, 21 Sep 2020 07:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:from:to:cc:subject:references:date:in-reply-to
         :user-agent:mime-version;
        bh=kG9PVZt8TI/mohHYdbBHZIPwETVwga4jxqzUAV3tfVE=;
        b=RQst07R4tpxqB6YGZ63G8WRlUWY2LvKA9943QUyuWIG/CoiexmEiSXxmiQ6JM5u35i
         8zWCCSn1Zya2S8CLT3x57/de202Kx1IUVAC5Q14QPP16H+6hRc8a0XUKQRB7gEZa3Efu
         01hp6R40cCi+U/Tjg7vxQ4gk6WIcegNpZvhII6Xjfb8NCDocqrrk9wkkFSnRCQ1Gvtf1
         Q9Hl63f6OKn/WwZgoUtZMx2VTcf96JJysOrbjBw48Z0JCICuROXk/yOTcTgf+KyC6xCA
         P4d8LmITYnA90BiDc03cH4SJqcPkk9onVqsun2gO7KwsGAFUTvHrbhsEtgvECCcWokqh
         VRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:from:to:cc:subject:references:date
         :in-reply-to:user-agent:mime-version;
        bh=kG9PVZt8TI/mohHYdbBHZIPwETVwga4jxqzUAV3tfVE=;
        b=m7W3eglWgKQw43B6P+9kI5r5e8CcM6Nd7WpY1TiG4nzyFb8p8PiK5gzLcQtLFOksSt
         h9yx94GnVp7Sqs+hQyWqJyUQHEpn+4tBs2RCwtQf0rX9aSFbHExanMfCZpYOPDPm6krp
         cs67H9WxPjuRJ7SlqI4Ym5o1jAu6fmE2TQBw1XF30yI+4Ko8EC86eRMDrm5nG5IBZLcR
         6ERPrp15K9+7MFCmvG3me4dSgWrXgMh1m0xVbH8pbAyyENOpSm0JNrr1azBwOCcxgOLN
         oHh81KAEtJrJSpfzISHlaV7ork1Ne3VO5y6l4ZduvMuaDWEztxwThu3i88kz/j+v1Ufe
         1NZA==
X-Gm-Message-State: AOAM533fTCphExeKVxSwc1EhIwwaOLQ5HPQS2PReIm4EUPeFwCa9DCgz
        zpOZqc0CC5gWpHwDv7f2W3k=
X-Google-Smtp-Source: ABdhPJwer63SD/wMZC0W6IhXYsR0SjXLLV3ddoimiKYmAKDhj54LkzHbTrJiNJuH/srZtQwAa0BRZQ==
X-Received: by 2002:adf:a18c:: with SMTP id u12mr36783wru.90.1600698078916;
        Mon, 21 Sep 2020 07:21:18 -0700 (PDT)
Received: from daniel-ThinkPad-X230 ([2a01:e35:1387:1640:704e:efe7:8752:596a])
        by smtp.gmail.com with ESMTPSA id u66sm236501wme.1.2020.09.21.07.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2020 07:21:18 -0700 (PDT)
Message-ID: <5f68b6de.1c69fb81.1d08f.0a89@mx.google.com>
X-Google-Original-Message-ID: <878sd3b482.fsf@gmail.com>>
From:   <f1rmb.daniel@gmail.com> (<Daniel Caujolle-Bert>)
To:     Johan Hovold <johan@kernel.org>
Cc:     Oliver Neukum <oneukum@suse.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-usb@vger.kernel.org,
        Daniel Caujolle-Bert <f1rmb.daniel@gmail.com>
Subject: Re: [PATCH v2 0/4] USB: cdc-acm: handle broken union descriptors
References: <20200921135951.24045-1-johan@kernel.org>
Date:   Mon, 21 Sep 2020 16:21:17 +0200
In-Reply-To: <20200921135951.24045-1-johan@kernel.org> (Johan Hovold's message
        of "Mon, 21 Sep 2020 15:59:47 +0200")
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi Johan,


   Yes, sure. Patching....


Cheers.
---
Daniel
