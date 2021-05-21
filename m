Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 780E038C761
	for <lists+linux-usb@lfdr.de>; Fri, 21 May 2021 15:01:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232627AbhEUNDN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 21 May 2021 09:03:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232761AbhEUNDL (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 21 May 2021 09:03:11 -0400
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CDA4C0613CE
        for <linux-usb@vger.kernel.org>; Fri, 21 May 2021 06:01:47 -0700 (PDT)
Received: by mail-pl1-x64a.google.com with SMTP id y20-20020a1709030114b02900f79b309b48so518988plc.8
        for <linux-usb@vger.kernel.org>; Fri, 21 May 2021 06:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=XB6WwS+0lKAKUB8X9iFCB63NHNERVehyYtthWfTgzQo=;
        b=ifuc64E7n+hjeH1Vwc9PFWPX2f6YHsYlOwL6iHlDosZsTbM4Gh1qEzq/6Z2geWHKeX
         635U4mDa+b/eqKefPEYnIaFe0K+EwbEka7fxzGGI1voLHyGc7S9FMgL7MbIsVzf5bqBi
         5hYeHRMiMsqHDGm8L4Q8Sib7Sa99HCqr0f7OwTyogtPxtkqcawZR8v7WVxUKUrVKgyLl
         qWUnn+0nNgER0TiiCUCtjafqyUWhbpPR1JXHZxM07Pa8nScXqBPST7YCb03vlmMLb4F9
         cCo7Z7QuRSt2mtBcwVl9P2aid7w2J8b5Xf3o9uYoZx3uCAsJUI0P/AVfEHuEpZCnsLKI
         XKsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=XB6WwS+0lKAKUB8X9iFCB63NHNERVehyYtthWfTgzQo=;
        b=nekPtRHyrmgsavDqhepSY18/Ons8MELyn3TpA5zpDj17uXOb7jstTKCjsG2mXOy3TA
         zQUcQHOVsUAkVo3ByFeNw+feOUJqyX7cGezFMhSKCX3FtIguyAtt+uyAv3gyH6Wwy7yW
         2NFmWHwILPZ7KHGXhVj8jRIBnwrBwIn8Ow4cXV2DKGiT+XB5hI4yEIgk/JB2DBFfPpBC
         aYe/Z5LmY++oOhX04wMwaDTUr/f85V7bpIEpilInLsKOHT4uxTrxgU4iF1DAA2m6nxQP
         yhxMFvOhcYjMu4W/f5w4BEu3oY2YPYhxHGHxkkmZgfybmBQGz0kkUX5r8M4DfRXwwGaL
         ublw==
X-Gm-Message-State: AOAM533NC2gBZ+swYWOBqVqdM5lY1IE2joVQ3yBeUpbNiqmlJHQfEWsz
        qua13Fd34c76BDztVqcrktHp6cBDN5qM
X-Google-Smtp-Source: ABdhPJwgjxwtLCvJwINn5pw1iAU2BGKweSExa5mX0lOsxn7M3b27z7Ia9zTJzBOL7ExSgfhTDohhPza62p+2
X-Received: from kyletso.ntc.corp.google.com ([2401:fa00:fc:202:905b:c174:8f59:4851])
 (user=kyletso job=sendgmr) by 2002:a62:4c3:0:b029:27c:892f:8e22 with SMTP id
 186-20020a6204c30000b029027c892f8e22mr9961499pfe.6.1621602106804; Fri, 21 May
 2021 06:01:46 -0700 (PDT)
Date:   Fri, 21 May 2021 21:01:19 +0800
Message-Id: <20210521130121.1470334-1-kyletso@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
Subject: [PATCH 0/2] Fix some VDM AMS handling
From:   Kyle Tso <kyletso@google.com>
To:     linux@roeck-us.net, heikki.krogerus@linux.intel.com,
        gregkh@linuxfoundation.org
Cc:     badhri@google.com, linux-usb@vger.kernel.org,
        linux-kernel@vger.kernel.org, Kyle Tso <kyletso@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

usb: typec: tcpm: Properly interrupt VDM AMS
- If VDM AMS is interrupted by Messages other than VDM, the current VDM
  AMS should be finished before handling the just arrived request. I add
  intercept code in the beginning of the handler of the three types of
  requests (control/data/extended) to ensure that the AMS is finished
  first.

usb: typec: tcpm: Respond Not_Supported if no snk_vdo
- The snk_vdo is for the responses to incoming VDM Discover Identity. If
  there is no data in snk_vdo, it means that the port doesn't even
  support it. According to PD3 Spec "Table 6-64 Response to an incoming
  VDM", the port should send Not_Supported Message as the response. For
  PD2 cases, it is defined in PD2 Spec "Table 6-41 Applicability of
  Structured VDM Commands - Note 3" that the port should "Ignore" the
  command.

Kyle Tso (2):
  usb: typec: tcpm: Properly interrupt VDM AMS
  usb: typec: tcpm: Respond Not_Supported if no snk_vdo

 drivers/usb/typec/tcpm/tcpm.c | 35 ++++++++++++++++++++++++++++++++++-
 1 file changed, 34 insertions(+), 1 deletion(-)

-- 
2.31.1.818.g46aad6cb9e-goog

