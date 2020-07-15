Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AC6CE2207F2
	for <lists+linux-usb@lfdr.de>; Wed, 15 Jul 2020 10:58:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729812AbgGOI6H (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 15 Jul 2020 04:58:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56750 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727930AbgGOI6G (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 15 Jul 2020 04:58:06 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90869C061755
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2020 01:58:06 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id o2so4791588wmh.2
        for <linux-usb@vger.kernel.org>; Wed, 15 Jul 2020 01:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=davidgf-net.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=HpVG9JyzDpdXdIpMTEWy7KC03/7gq5022Rez0PgRqHg=;
        b=HD2wzMLzVU86J1pFentnlo2MxzbXwNmCTq2b8EZYWgzhxL/X+EI9EGDfzrfuYKyWMd
         wpZ13ftWgHVc6d7rj8zvsnTvm0p8FcExsvpyYXOHpDN8E/bK+wWUrknYVV94MyyCfNSu
         ZoYLHArP5RVMrpYO5lZ1dqPnaYiGpQoHQKYHLGc5AJ8/P0YxajPByVqfjvZxQxp3Oann
         8gNAEffM04rq8Xu/ho8YbRWKt6ZLOHQEhHjPJ/E6Ezl0AJx2ExS26JKmq5JV6PJv/OJW
         wnURjcsRMuHz0d32pug98Vi4F2hP4U26lwlerp3wX2/QxUOZy5Au6rQ9NHAKGzKMOzOs
         p91A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=HpVG9JyzDpdXdIpMTEWy7KC03/7gq5022Rez0PgRqHg=;
        b=Xv44pOMHilxR3MqYEAXQgFR8GLgq3JrBHuWYkijvwQitekwsTG0aYjQnJtf6yfBnTh
         Lhp+YBGTDmo9jot3YYfzawBS9XADZp3zbwfehfOG9x4OXKcf4sLqC2H3i78qLn7UXiGq
         GozyTvk6hLrLKO5ukDntxqvWjpN0WrLxEtfXYJUp0ugAaXxgb0/PnZk/FMdFMKcdKRJC
         9PBauzOdKQWETAX2gwthBqe2lQLvedviq/f+m7ft12X95n3qocxcYeR6y/1NRPcMkqfn
         nSxOYt3T21kPEFnHI4vr/bWo3OHt+diUpj5sPsay/45qXwluzr6WbKqdaJ2v19255+ZS
         ezpg==
X-Gm-Message-State: AOAM532coTBKeE6g7vqjhxiNExawEEZ8rCBr0v2Oio8G+aJj2XgyCaMT
        MczSXyjX0AAGsi/osIzVyYBBhfoZaKZg
X-Google-Smtp-Source: ABdhPJxAr7XHKfo2Kz6Bz5ymvjnyIEkd+hru2LFreApYSz6FlFMHniWPaFSsz7XFWDT57gWyfuYvdQ==
X-Received: by 2002:a7b:c348:: with SMTP id l8mr8063107wmj.54.1594803484858;
        Wed, 15 Jul 2020 01:58:04 -0700 (PDT)
Received: from linux-2.fritz.box (85-195-242-113.fiber7.init7.net. [85.195.242.113])
        by smtp.gmail.com with ESMTPSA id f12sm2491034wrj.48.2020.07.15.01.58.03
        for <linux-usb@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 01:58:04 -0700 (PDT)
Message-ID: <9778f9b8a8604e2c13979ea6909678c23cd286cb.camel@davidgf.net>
Subject: System crash/lockup after plugging CDC ACM device
From:   David Guillen Fandos <david@davidgf.net>
To:     linux-usb@vger.kernel.org
Date:   Wed, 15 Jul 2020 10:58:03 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.3 (3.36.3-1.fc32) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello linux-usb,

I think I might have found a kernel bug related to the USB subsystem
(cdc_acm perhaps).

Context: I was playing around with a device I'm creating, essentially a
USB quad modem device that exposes four modems to the host system. This
device is still a prototype so there's a few bugs here and there, most
likely in the USB descriptors and control requests.

What happens: After plugging the device the system starts spitting
warnings and BUGs and it locks up. Most of the time some CPUs get into
some spinloop and never comes back (you can see it being detected by
the watchdog after a few seconds). Generally after that the USB devices
stop working completely and at some point the machine freezes
completely. In a couple of ocasions I managed to see a bug in dmesg
saying "unable to handle page fault for address XXX" and "Supervisor
read access in kernel mode" "error code (0x0000) not present page". I
could not get a trace for that one since the kernel died completely and
my log files were truncated/lost.

Since it is happening to my two machines (both Intel but rather
different controllers, Sunrise Point-LP USB 3.0 vs 8 Series/C220) and
with different kernel versions I suspect this might be a bug in the
kernel.

I have 4 logs that I collected, they are sort of long-ish, not sure how
to best send them to the list.

Thanks!
David

