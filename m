Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 35A25105238
	for <lists+linux-usb@lfdr.de>; Thu, 21 Nov 2019 13:21:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbfKUMVo (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 21 Nov 2019 07:21:44 -0500
Received: from mail-yw1-f52.google.com ([209.85.161.52]:38018 "EHLO
        mail-yw1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726197AbfKUMVo (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 21 Nov 2019 07:21:44 -0500
Received: by mail-yw1-f52.google.com with SMTP id m196so1193920ywd.5
        for <linux-usb@vger.kernel.org>; Thu, 21 Nov 2019 04:21:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=s8PJNOeVs3jJLe3BA8xqSB8en66KRMiGR9WwiS3GNso=;
        b=hqWNyPYgqFdLMilYiVMuamnXVyZe3eElW+3gzZx6HTE4Au3VnRUQmOZ9QzLhUuJVuA
         b/w+h2Jx2+J3lmq8fadHNH7F6pJQ469L2OLs8tuxMwl12FZvz5ZzFf4li73ydNpl1hzi
         E2/9urH5tXYYsHeyxbp4XmcVPt99H676T3/9JrMgcGYaIm+B5mVC1OmjdhUUAgUGv3yz
         rPChd+eJ7srvbvkfhrnWBBH3euyGeIw/P4wOu5sUecpmnJhZd5lDKPzSZnsyLMWVT7KM
         CvQIYaera8+KDxqMNNw6/r8P3BVCSzxTycY0/lha3w8g9u5jy23s92+dLnPqBcqm6e7/
         //Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=s8PJNOeVs3jJLe3BA8xqSB8en66KRMiGR9WwiS3GNso=;
        b=YmscxBwUu4fkO6mD/bPUP9ms3nOKthAMckq9QF1LUcTz+RS5zf/8CF5n/FgWFgU4Lx
         8l3mXZSykxYrDZOwJUYbCwqwr+yw+70ygTlo6f4tkR9kVdNBQY8wYN1k4XZACPoMWmla
         5j9FSBsTyjHfp2pRSWoOzL9ATVUZ2AhX75CZ//ddeoY9W+F4swqFQgapX1P+FdtgGhOw
         BOCxANZB6IgF5xJCsbz5B+VFXhYNQ1QVAjRwo7W4ZH3AHXCMbJWPADULjQ5L3SlUMVir
         N8kWlmCF/XilHG9wyQ8AFCQQyuU4TjuhfKzM6FSCNH9hTzkHunNbfKkNkaWqYXcNTDRT
         vFEg==
X-Gm-Message-State: APjAAAVvNf+WTVVb9LmQqPEDiMzQJrWQcm59quQH3y2yd9W9dDqsCkDC
        1UFUqhDJPOTCpqI7akCbDKDgBxyx1u/xtekMmxJ3OwPe
X-Google-Smtp-Source: APXvYqzqjkcbJlm+mxvh1jGR2fgor5jF+dgXRyswhJWrwgOUel1XpaTlYwblUu0Yx6KYbolf2wfozbn9ECwwYiOnYEg=
X-Received: by 2002:a81:a196:: with SMTP id y144mr5261545ywg.507.1574338901324;
 Thu, 21 Nov 2019 04:21:41 -0800 (PST)
MIME-Version: 1.0
References: <CAPSdnVC_OFsSNBmAqSJyHe5giv1n7EpCM9YzuUjye462-60BHQ@mail.gmail.com>
In-Reply-To: <CAPSdnVC_OFsSNBmAqSJyHe5giv1n7EpCM9YzuUjye462-60BHQ@mail.gmail.com>
From:   =?UTF-8?B?0JTQvNC40YLRgNC40Lkg0JzQsNC90LbRg9GA0LA=?= 
        <dimitriusman@gmail.com>
Date:   Thu, 21 Nov 2019 14:22:16 +0200
Message-ID: <CAPSdnVC_708+Fk6enHhcBdOG-iQoyoiDtD9S4sV3LLzk0agJCg@mail.gmail.com>
Subject: Re: Logitech USB wireless reciever m280
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

Logitech wireless receiver m280 not working and not detecting via
lsusb on distros with kernel 5.2+

Bus 004 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 003 Device 002: ID 04f2:b5e0 Chicony Electronics Co., Ltd VGA WebCam
Bus 003 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub
Bus 002 Device 001: ID 1d6b:0003 Linux Foundation 3.0 root hub
Bus 001 Device 002: ID 04ca:3015 Lite-On Technology Corp.
Bus 001 Device 001: ID 1d6b:0002 Linux Foundation 2.0 root hub

On kernel 4.19 its working fine

Once i trace this error

kernel: usb 3-2: new full-speed USB device number 4 using xhci_hcd
kernel: usb 3-2: device descriptor read/all, error -71
kernel: usb 3-2: new full-speed USB device number 5 using xhci_hcd
kernel: usb 3-2: unable to read config index 0 descriptor/start: -71
kernel: usb 3-2: can't read configurations, error -71
kernel: usb usb3-port2: attempt power cycle

Best regards,
Dmitriy Manzhura
