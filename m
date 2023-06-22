Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BCAC073A436
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jun 2023 17:05:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232228AbjFVPEu (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Jun 2023 11:04:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41896 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232199AbjFVPEt (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Jun 2023 11:04:49 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D50D41BD3
        for <linux-usb@vger.kernel.org>; Thu, 22 Jun 2023 08:04:43 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-5704e551e8bso88211867b3.3
        for <linux-usb@vger.kernel.org>; Thu, 22 Jun 2023 08:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687446283; x=1690038283;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=w+6uYkThe/W8HPuyx8xxQFAX2gbyzykRpFiwJl6HZOs=;
        b=bM+pB7s/Qfzjy79n6ApAUHi+jfEUXjw1OLK62sCKhwsx/9116MIsOgi0TbJGw+Tr3c
         ut97MuyoJ2+bhuP2Rq3LoVXj+nGeuMg+WNnuhXzKqEPPOpV9I4H5XZ190RQ92NZnr++N
         omxyD5ynIDIAIp7X9tOELRrk3fk/+VwJ7jctUqvVxQUg81LUW3cyeMKg9e5zDHUS1R1V
         /xrrI1wh8XCCdfNYDoY20RZbIn8sxrw7b1L++GKrOC+O+GJlPyAniSBrICp93FN6CWXn
         hySq7Z4tEwHlehAcIZS6A97KgY/pGsSa7rZ/rG1EC8WdVjw77VP7xBS3TbkN0u58E95i
         EEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687446283; x=1690038283;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=w+6uYkThe/W8HPuyx8xxQFAX2gbyzykRpFiwJl6HZOs=;
        b=JgBIBgxYHQfpQSoZSxuN3hYq9yFnIKs+kVjIQFxWmpRyzZyIxfY0UpjCO3nOqarydq
         9xrnYmAiCyCzUjgyzOka1YtABacjEcnC58rvpokFJdkeX5U+It7JqJbNAro+gmlABfnC
         o+spseu/b0ASCra3kUeadBTW7m6WZX8OEVyYjt6vSnvHAzN7R4djLa1S4aRq6IAz1g0H
         6DdFy9UdYMeCi6f4TcdnuPfnSLBtGjzjw3TPZ8BknZpCG8ubqk4HwMxxWFaC7/VkzQ+E
         1PWzZTWrC7790AIkjLAhpedX4x5IOtOCdDS34ynQkgYe26/vOnwNYvVu+iVHR3zb4CTt
         tAfg==
X-Gm-Message-State: AC+VfDyYdDZTfnYSsYiYZSsqtBCe0/7X/fJeP643wrLZn/eulGthEQlb
        EdQ+S6wFCX1wTO+lNfevHfoPWMpPGh0x
X-Google-Smtp-Source: ACHHUZ4Dbh55Qlwoo7KyNgECwZgM5ueBnsnP5U3yrU4JI8BL4wET8+kX/90WUwIrhVyKAYKrAMV9hEUAJ5sV
X-Received: from kyletso-p620lin01.ntc.corp.google.com ([2401:fa00:fc:202:b1ba:4098:b043:5e54])
 (user=kyletso job=sendgmr) by 2002:a05:6902:15c4:b0:be4:d646:48d8 with SMTP
 id l4-20020a05690215c400b00be4d64648d8mr2348639ybu.8.1687446282975; Thu, 22
 Jun 2023 08:04:42 -0700 (PDT)
Date:   Thu, 22 Jun 2023 23:04:20 +0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
Message-ID: <20230622150423.3726894-1-kyletso@google.com>
Subject: [PATCH 0/3] Some fixes for select_usb_power_delivery
From:   Kyle Tso <kyletso@google.com>
To:     heikki.krogerus@linux.intel.com, gregkh@linuxfoundation.org
Cc:     badhri@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kyle Tso <kyletso@google.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-9.6 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,USER_IN_DEF_DKIM_WL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi, here are some fixes about the attribute "select_usb_power_delivery"
in typec/class.c

===

usb: typec: Set port->pd before adding device for typec_port

This one is about the visibility of the attribute. port->pd should be
set before device_add otherwise the visibility will be false because
port->pd is NULL.

===

usb: typec: Iterate pds array when showing the pd list

This patch fixes a problem about the incorrect fetching of the pointers
to each usb_power_delivery handle.

===

usb: typec: Use sysfs_emit_at when concatenating the string

This patch changes the use of the API from sysfs_emit to sysfs_emit_at
because the buffer address is not aligned to PAGE_SIZE.

===

Kyle Tso (3):
  usb: typec: Set port->pd before adding device for typec_port
  usb: typec: Iterate pds array when showing the pd list
  usb: typec: Use sysfs_emit_at when concatenating the string

 drivers/usb/typec/class.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

-- 
2.41.0.162.gfafddb0af9-goog

