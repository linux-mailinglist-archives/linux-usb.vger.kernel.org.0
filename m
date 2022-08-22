Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 120C859B97D
	for <lists+linux-usb@lfdr.de>; Mon, 22 Aug 2022 08:32:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232749AbiHVGbt (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 22 Aug 2022 02:31:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51660 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233051AbiHVGbq (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 22 Aug 2022 02:31:46 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A20CB27FD3
        for <linux-usb@vger.kernel.org>; Sun, 21 Aug 2022 23:31:45 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id bd26-20020a05600c1f1a00b003a5e82a6474so5419302wmb.4
        for <linux-usb@vger.kernel.org>; Sun, 21 Aug 2022 23:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc;
        bh=o31t8HDG7QptfeLJ+04Jkz8j9NFHlDWTE2XxPfy4mY4=;
        b=aXdPXJXtutM3IULQbSw2ryC8oV0qRUJRt5KLedppbobLQqtBa8bwySgimRGeKMpu/d
         HmAwtlVe2plqIFBpZRFczdVo/0QrqgbasUegqMv9iwWL2HoVhzu4+kqlF9UF97SfllMd
         +wjD5nOHZQ4YabVcWpzbIf5TGu4RtIQhgWDIkUnZwDoQU0zqFFKm1tu3BETtQd1jXvBL
         Tg6X5EoHCk7jhfxEu26F/Q6nERDQKSADLkBgYggVpIcnGqAU1UESeq43FiDwZt8+kPTu
         CVN2wi14jpJ9dVsRu7JF6m7wGRZxKrXxQ7FJu7DgVhcG/OXwLtReXnllNpt72+t0Pcx+
         WNzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc;
        bh=o31t8HDG7QptfeLJ+04Jkz8j9NFHlDWTE2XxPfy4mY4=;
        b=5ftlTjuh4ksnaD/BnS4aSxxZoHrGLyCv1HqNlKABUpwcAyKA31SPNN0UL9dpWnSTIf
         8aCH0ZKjq4l200Zz/uU585fQNifVM6hji0AbxRQxcpxgYH1HSyjHYMmER+XHzBtS7Z3U
         SBwphCABNAAIqJ4lwMMRL7XatVSma0CQFM6fR/uqYUlQ8NrQqNMi3RbLf1peGdf/u7KK
         GSCF0kkF1IUrbfFUYIW665YGx7n2+CCT8UNnhSJYaojm+fXJEfdQG6mDa6JliC2Yo8Ku
         ZBfC/lsbzZQC35XtcyFaDr6eXQYdeapusO9xXXTu4QU9o6x1wjCbV9msEfvP8NvsX1EI
         NubQ==
X-Gm-Message-State: ACgBeo2vjMSLuT5mLDEkbAlPQnuDqLqEhKcLJk1dyyzRQqdq5xLYE9x0
        Wx1qVNFPZkoMJvbsFJbe+uHOVzQUkJHg3CvLEIo=
X-Google-Smtp-Source: AA6agR4xHYXpk4IgJXXB5tg8F+eYrTJVnEQHzoqivMeWZanNK+OuXV99ACHdG4Xjy5NyO5GvKjghpdkTWm5uAajlwl8=
X-Received: by 2002:a05:600c:5023:b0:3a6:3f9:a031 with SMTP id
 n35-20020a05600c502300b003a603f9a031mr10687586wmr.131.1661149904095; Sun, 21
 Aug 2022 23:31:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a5d:5444:0:0:0:0:0 with HTTP; Sun, 21 Aug 2022 23:31:43
 -0700 (PDT)
Reply-To: maddahabdwabbo@gmail.com
From:   Abd-jaafari Maddah <sheishenalyeshmanbetovichu@gmail.com>
Date:   Sun, 21 Aug 2022 23:31:43 -0700
Message-ID: <CALX-7+2fMevcgoai1mOHQmRdcDU30Kudnsxb-_684e8bqZhPqQ@mail.gmail.com>
Subject: Why No Response Yet?
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

-- 
Dear,
I had sent you a mail but i don't think you received it that's why am writing
you again,it's important we discuss.
Am waiting,
Abd-Jafaari Maddah
