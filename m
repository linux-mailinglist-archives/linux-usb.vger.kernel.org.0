Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6BDF229128E
	for <lists+linux-usb@lfdr.de>; Sat, 17 Oct 2020 16:57:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438440AbgJQO55 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 17 Oct 2020 10:57:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54608 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438438AbgJQO54 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 17 Oct 2020 10:57:56 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4A5FC061755
        for <linux-usb@vger.kernel.org>; Sat, 17 Oct 2020 07:57:56 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id 1so2778106ple.2
        for <linux-usb@vger.kernel.org>; Sat, 17 Oct 2020 07:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=a9j9Fy1hUDJhH7yVal6XTRnNYzYfoV8FESWiNXu3bTk=;
        b=zlOtqxNslGj/vidwh3JEiS5xT6Y0dF4YG71LTxfNQf2Nl/SIg78SujsUe+RqnYl4jS
         k4mTxfx9u4T65bxrPZWv4b95bWY7lklTO5Of8TPVgh81/420Hrbzof6AiMALsUu4wIDK
         o86zN8mpbGSpg4d7lM15t6s6HzTviGRETupRh5FyNRZkRIlS0hxGjXe4oMoUE75FT6z1
         CUUR5EKogXEryKqJAV1Df1aJqOYUE6K145HiexG9pym0Y9TtZF3fS8Es9wQZQ2A/Dadg
         CHQhZdUpLXSck4SAoC0G4MmmI8OmQ7g5nrDiNlHzVMlw2/moBdeTmIAHIRRZJ4OB5aAe
         nnMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=a9j9Fy1hUDJhH7yVal6XTRnNYzYfoV8FESWiNXu3bTk=;
        b=BD7NE3RkFjhC5ZtGuKWFfNG07rX489qdt+qSYaFjTaRMoyj7/iGsLqUfUbKOjNbtMX
         bN8nGByjdVmcSO+yIseNuXsx56b9JTLI49SWmCZXGF5lh/mM5nExp83WR1tdTutI5XZQ
         /9pAwiNuN4FZyh/s0mrXm179u9MuHC2YfjLQlPUVKr1g0FGH73xZoQPfv1TD3rhZyUVH
         YXIUT0wuxhFK7cU9VPWvBDcySV1seEojB+GjiABO/MdTf3IbBKEwBMa70jWGVNbg7W2l
         pnQQhe3D+V0QmdyfC3IZQGmRwDD7qZj8RSAZTV5SySuuVl800JCRsyYdKZHCBnpG7/qh
         P6BA==
X-Gm-Message-State: AOAM533JaqjgoqEt2GgUlMft/6pkt1UUzCCgX4fOi2nqpVyD61lEaXSN
        pALqIYUQzQAAZxi5Bz/1PYlUlq3+3DUvwbiC
X-Google-Smtp-Source: ABdhPJwt3eKiScrU24Nc2I0S4a3+9DkhxcNfObw2+hTBn0roSPFMmIaUpLDZF4hNY8DYkTQz7PGgbQ==
X-Received: by 2002:a17:90a:e547:: with SMTP id ei7mr8858735pjb.96.1602946675889;
        Sat, 17 Oct 2020 07:57:55 -0700 (PDT)
Received: from [192.168.1.134] ([66.219.217.173])
        by smtp.gmail.com with ESMTPSA id g1sm6196951pfm.124.2020.10.17.07.57.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 Oct 2020 07:57:55 -0700 (PDT)
To:     martin.blumenstingl@googlemail.com,
        Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        USB list <linux-usb@vger.kernel.org>
From:   Jens Axboe <axboe@kernel.dk>
Subject: =?UTF-8?B?d2FybmluZzogbGFiZWwg4oCYZXJyb3JfZGVidWdmc+KAmSBkZWZpbmVk?=
 =?UTF-8?Q?_but_not_used_=5b-Wunused-label=5d?=
Message-ID: <c5e3148d-63c6-17f6-f4f8-1491ce8e6775@kernel.dk>
Date:   Sat, 17 Oct 2020 08:57:53 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

There's a new warning in -git if:

CONFIG_USB_DWC2_PERIPHERAL || CONFIG_USB_DWC2_DUAL_ROLE

isn't set in the .config:

drivers/usb/dwc2/platform.c: In function ‘dwc2_driver_probe’:
drivers/usb/dwc2/platform.c:611:1: warning: label ‘error_debugfs’ defined but not used [-Wunused-label]
  611 | error_debugfs:
      | ^~~~~~~~~~~~~

which was caused by this commit:

commit e1c08cf23172ed6fb228d75efc9f4c80a6812116
Author: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Sat Jul 4 00:50:43 2020 +0200

    usb: dwc2: Add missing cleanups when usb_add_gadget_udc() fails


-- 
Jens Axboe

