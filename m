Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6359C59185F
	for <lists+linux-usb@lfdr.de>; Sat, 13 Aug 2022 04:28:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234567AbiHMC2C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 12 Aug 2022 22:28:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229719AbiHMC2C (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 12 Aug 2022 22:28:02 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E3F56AA38
        for <linux-usb@vger.kernel.org>; Fri, 12 Aug 2022 19:28:01 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-32269d60830so25655147b3.2
        for <linux-usb@vger.kernel.org>; Fri, 12 Aug 2022 19:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=ZAjMXp027IHeTIuikBsTg3+MY+sGachQOgNyAmmmGh8=;
        b=hkFIfEnR0dDD8djpR0JX5BmU5cVjkUJr/gWj8sgfY82g5x1U1UJd76gIKCK4AFB+n9
         Psl2Ls9Ss/VSsJt4BvDG7+xKNg8zXSNTU2N6CbA8PuC5cauugiXVb/+dSyclI7yr+B+P
         XycrbmVICQKvDLaYiEvzkmSrEblFXf7uIWhxxLtWiE0jd504AZnlWO01Ttk6YWr4zdb2
         2Y5F4kIieqKSRFZJRkbvrf8EktP5JssAes542hZQHkAX28Q2QI+kE/Edgh8FSurhY+Qb
         1e2fnXa556RqmlGBhBtrFLmG/goXLloQd6Tbutr/RDbZsnh3vTUq4r7s+M+2C4969flX
         /SQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=ZAjMXp027IHeTIuikBsTg3+MY+sGachQOgNyAmmmGh8=;
        b=2lFINk9iEWQIX8BGPlezl7PUr4RF//UVyMMM/shn6+m5ArRyUkhwhb5o2JnN1/52N7
         5IVKY1G7q4szX1dWRS5BXmsRwjRceKAYv/TccoWM1NfqE4KkCWPZhCgXSCysmP1/ToDt
         Y/5GThxvgqeVEKNbo9fL1iBadlh2IJHoOipvFZEgYv/GMI8upgUaUsIXVybMFWtKfZYk
         E60GenBKn6u9fb0SZ/Sl/CkbSxle+R2Cq8lQrMigN18aLRpEL2IumDG+Dpx9M5ZtQin9
         hhPShbvMZ3hNxZwFzRB21kS8h5jre6iCRm977XGz95TwSpxha5Q/6mwhQiO4lsaNJyKM
         /h7A==
X-Gm-Message-State: ACgBeo1VquOEsg0cCg5TOUwr9CgeSHFZiNKVroZksVN63MXmgTq3wPLX
        4xFvumUNy/Rya/2DQlsD2uaRa01tCGkvIX7+wWE=
X-Google-Smtp-Source: AA6agR6DpC5HvqYqoeRbx/g5yONnVC3zBASnmFuP1iqDKRh65J5/b1rkSs4gKDgW4PGJR/gQGDtIWzcnqaGPTcOLhoQ=
X-Received: by 2002:a81:a20e:0:b0:322:a052:471e with SMTP id
 w14-20020a81a20e000000b00322a052471emr6158503ywg.183.1660357680384; Fri, 12
 Aug 2022 19:28:00 -0700 (PDT)
MIME-Version: 1.0
From:   Frank Mori Hess <fmh6jj@gmail.com>
Date:   Fri, 12 Aug 2022 22:27:49 -0400
Message-ID: <CAJz5Opf2Sjdx_At8abHwby7w+HxLcZLZ63my-8qOUA3yuS85wQ@mail.gmail.com>
Subject: [BUG] usb: usbhid: after -EPIPE from interrupt urb, input state is
 not resynced
To:     Jiri Kosina <jikos@kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Cc:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

After an interrupt urb with status -EPIPE is seen in the completion
handler hid_irq_in, there is no  GetReport performed over the control
endpoint to compensate for potentially lost interrupt urbs.  So the
state of my keyboard does not get synced up with Linux until the next
interrupt urb is sent (when I next press or release a key).  So for
example, Linux can think I am holding down a key when no key is being
pressed, due to missing a report of the key release.

-- 
Frank
