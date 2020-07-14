Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 98A7E21E659
	for <lists+linux-usb@lfdr.de>; Tue, 14 Jul 2020 05:36:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726510AbgGNDgL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 13 Jul 2020 23:36:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726456AbgGNDgL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 13 Jul 2020 23:36:11 -0400
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3E8DC061794
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2020 20:36:10 -0700 (PDT)
Received: by mail-yb1-xb49.google.com with SMTP id 8so16399735ybc.23
        for <linux-usb@vger.kernel.org>; Mon, 13 Jul 2020 20:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=zNQV95i7c6JcJLlsny6Fhc23+QJFeBp9C60Maw1tGG4=;
        b=hSE/BPX913HTAs++baLX4mt1JgCuoxgt/V9igV0OR3rWM++ODniXgdSBD7s+jXLHhR
         a452v+zASbCdRzM9C18yCMZHTmFww6nQiHdnKQKfyqeNHa1BxFDBXXrmuQOxFtyDdUUS
         I/1eB5quNOsb0K8jVl1LObnoefnQk5OALxRZ/mYNqe+hzRywAxJEC9JPF2GJ/iwSquYi
         UnM4P0svZlU/mxf+0n83oM1QEM7mV05C2iIGpPhyHlQ6JdIpOwuJleqPTYN9HRjfhlpO
         FRIm6k3tIqAZBXakOrcIk1Env3Kclme5mD5xynU+EKbRHGJ707PPIsAlALWHniOjfPY2
         wIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=zNQV95i7c6JcJLlsny6Fhc23+QJFeBp9C60Maw1tGG4=;
        b=U/0EaDzJB25qdFa6hWfLSAQfAe1ZQc+fJS6T5AhQcDu1M1vYJBnyad7rbDEfu3buI2
         vWizjqbOz5Z9eP/JKxJPvjAQqG1VuAeP7MXv1eJkO97PK8KJvnU4oWocCz4YpNZ+yULS
         Lf9/hZHs+julalcPyPmJbKyqOG44YAHi0ZdfY880+y7r/fooE4Wia6OwZG27Oa0BNY0P
         7MgddMByWKKLckGTgRUD0gFR4rF39AnYccJFEHbeY0MfrjxyFdTuS2Ka+WfRDbvaxoUu
         rfta+kP54mofY1LQ0dtuX7xaC2hOAvDq5jTanG/6XfHQMa1I9y2cjSF3DOQ82sFFRHL+
         Pp+Q==
X-Gm-Message-State: AOAM533PuFHSER3n5zv2uguMrZb7K5dSQ+yohm85/j3oFv3nhvCneZv4
        OBRCQN/RvLqXisfUALZM5wXtTFB84EYM
X-Google-Smtp-Source: ABdhPJxnEf16kvDaLZZB9IfoIH2D+Xb4ovNqya7VkOUTo5ipYiwqV6Qi6ORPMZNHMpsbUnYXRU344QdXRV+v
X-Received: by 2002:a25:803:: with SMTP id 3mr2023649ybi.518.1594697769925;
 Mon, 13 Jul 2020 20:36:09 -0700 (PDT)
Date:   Tue, 14 Jul 2020 11:34:51 +0800
Message-Id: <20200714033453.4044482-1-kyletso@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.27.0.389.gc38d7665816-goog
Subject: [PATCH 0/2] tcpm: Error handling for tcpm_register_partner_altmodes
From:   Kyle Tso <kyletso@google.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc:     badhri@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kyle Tso <kyletso@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-usb-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

*** BLURB HERE ***

Kyle Tso (2):
  usb: typec: Comment correction for typec_partner_register_altmode
  usb: typec: tcpm: Error handling for tcpm_register_partner_altmodes

 drivers/usb/typec/class.c     | 2 +-
 drivers/usb/typec/tcpm/tcpm.c | 4 +++-
 2 files changed, 4 insertions(+), 2 deletions(-)

-- 
2.27.0.389.gc38d7665816-goog

