Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 57CA073BB35
	for <lists+linux-usb@lfdr.de>; Fri, 23 Jun 2023 17:11:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232583AbjFWPLl (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 23 Jun 2023 11:11:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232569AbjFWPLQ (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 23 Jun 2023 11:11:16 -0400
Received: from mail-yb1-xb4a.google.com (mail-yb1-xb4a.google.com [IPv6:2607:f8b0:4864:20::b4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CE572D4A
        for <linux-usb@vger.kernel.org>; Fri, 23 Jun 2023 08:10:44 -0700 (PDT)
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-bff1f2780ebso1041925276.1
        for <linux-usb@vger.kernel.org>; Fri, 23 Jun 2023 08:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687533042; x=1690125042;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xDW512AMWN2/l8Gl/XnRAjtww3e9CB3zNKNI+7nHZzU=;
        b=2XRCyitvwHsFaseO2qHq/bXJOkP4xrmj5rEBBjiRGnqTp1l+mA57nY3tu5XumWk4QZ
         mPN5wN2mTl2S+TRIuHPmM1nZm8jwfZGdifN5ah2itJnX0ehHHdh4fD2NRfTUXKDcOQdB
         E22KFdK5y7Q3PweNqkeEWv//t3Y2eslsPp6Z+LQceN0RPTdo7a/5J/DtYCVFukS2lTEN
         PCu+XcV2FNF/8Wkkvr/aqtJfqRmSLM2oBJi0FZaywwvTcf3j5jg9fRLkh2MwSC3aCcSJ
         6TMpzkwpjn9bK1rLCBhnQUYK8W0LI0Mh8huoa5EllWkTsjSY3geq6Ennn+4OAEea/Suy
         /BTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687533042; x=1690125042;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xDW512AMWN2/l8Gl/XnRAjtww3e9CB3zNKNI+7nHZzU=;
        b=IedmudTInNMnuV8HflWy6pEmp8hLgVu0LFzDegUrxyfCF+h0K+jXCdTBPR6+5Yf5kF
         +rKG5dwyClSTflKTDhjnBZJ5wqZXDeQkORllT3Nzk1jcB6q6St1A0fhP7lqJZ90WLAju
         g9411FW0NOJH9wlGPfwLID5c+YVk4XtQo0vsTre2pbTZtCFsE1yUtoo+GEpdoNSbhEoN
         ia5JdCkQKoeaFGbmowdPLIKj88X32Gg9ybbSD0FSymLtvwMh2ajXLVzKTx+55AvHCPjS
         WTmEkxtGDhp/X8eiZJ6UAsbwkTskmBVUzmU+K3CsLMbaNZiMwjbQ1cg6XLC/lH1wiRpZ
         wxYA==
X-Gm-Message-State: AC+VfDx2QZoy5T3gbyOJRAoa1V1LXcZ+1UzPWb/T8+7IPwwVJ5tgbZ+D
        hq2GLwTwhLZyh98UsE3fCqF8wTtrq3z+
X-Google-Smtp-Source: ACHHUZ5duT0Q2E0Bc88n4bLv6s1lkYEBuH2PD0kd/fBAJAijrWkmtz0YR1Rc4REacVm35/dVvpMG24QtfW80
X-Received: from kyletso-p620lin01.ntc.corp.google.com ([2401:fa00:fc:202:5d47:84a:2819:bba4])
 (user=kyletso job=sendgmr) by 2002:a5b:ccd:0:b0:bd1:7934:b4fe with SMTP id
 e13-20020a5b0ccd000000b00bd17934b4femr9439305ybr.13.1687533042671; Fri, 23
 Jun 2023 08:10:42 -0700 (PDT)
Date:   Fri, 23 Jun 2023 23:10:33 +0800
Mime-Version: 1.0
X-Mailer: git-send-email 2.41.0.162.gfafddb0af9-goog
Message-ID: <20230623151036.3955013-1-kyletso@google.com>
Subject: [PATCH v2 0/3] Some fixes for select_usb_power_delivery
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

Update v2

- Add "Cc: stable@vger.kernel.org" to each patch

== original cover letter ==

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

