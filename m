Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A14DA6756DC
	for <lists+linux-usb@lfdr.de>; Fri, 20 Jan 2023 15:19:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231220AbjATOTp (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 20 Jan 2023 09:19:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231221AbjATOT3 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 20 Jan 2023 09:19:29 -0500
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AA511CD208
        for <linux-usb@vger.kernel.org>; Fri, 20 Jan 2023 06:18:59 -0800 (PST)
Received: by mail-ej1-x62e.google.com with SMTP id hw16so14245730ejc.10
        for <linux-usb@vger.kernel.org>; Fri, 20 Jan 2023 06:18:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5TS776QSf+XZfy673cDJNFU1tHVWrzQdFJV93jLAyIM=;
        b=cHUrU1PwJJpAwkCQdhFOq01C/OPJQZwHUQUAmN3wnQjvIPONFfaX7gWZLVAmiKBt9u
         yBlZsJTBXoESLzRKccHaWHjgHAj0hk/XfXpbIYN+1jKfyq6iHFqcceNr6UOOJDuuHX17
         VVGmi1upFlOZtWYQw5rkNsSh5OmbLGWEKuiakXtcJAj1b719TWvwmZQSF1hQzBqZXRQW
         NHmo1DyySEqScfRH6e4mox4RzdfYcJDdhEbdJEc3t56OSKgvivPnWVZpderSN031mk2P
         KNu6tyJ9Gq4M5heul4YhP1LsA9oE2uVbPPHaf0tt93TYxcaDmDr26ZtB1z8bKHRC2wg5
         U+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5TS776QSf+XZfy673cDJNFU1tHVWrzQdFJV93jLAyIM=;
        b=ltGcrxJAPPWu1wu++tOabt5ISV/efaJv2zLB38qiTOCJNAYMdZ4mheta2rFJw9kcV9
         4ZPzJWa4qbjzrusEZ9ZUO4R+h3mfxhjaeHMx79ly9hwxG7K3MJ/SRO6Iw7RCyNk6AwJM
         TlUXus01UlCmU7Qd5gdXH/0YuWZAIDir95H4oklW1Hlu87jJoo4UwYs34ixfxTdToC/5
         dz+uj2BAk/KLjp+eJ+dqdbIc3owCeaQqX697c7vl5dDyeaisrjSF5Uk74soQHS/K5LP5
         Eay+cl/vs06uU4ODhhN9NsP2ik6d2f0ey1xQMTPUBXd6X03yOtouqlNQJ3ay3proNIoe
         CxIw==
X-Gm-Message-State: AFqh2koAOKudK9gQb10M8KE2BK9Uf7wLpWRHqnzya7C8TTDugl2iCb9i
        uENQ5mvWkVOmVj4RNGYAHBRn3WdnuXSpKCDUZg==
X-Google-Smtp-Source: AMrXdXvTHitYZlxHMX5kUCvmSBPBz32ILTuWf0WFRX0q+TqHP6IyPDK82j1XcgZKIA1uUP47WSLVkwH75yDV5ppjpPE=
X-Received: by 2002:a17:906:194f:b0:7c0:688a:6251 with SMTP id
 b15-20020a170906194f00b007c0688a6251mr1723541eje.274.1674224260246; Fri, 20
 Jan 2023 06:17:40 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6f02:c3a4:b0:46:50a5:c4c5 with HTTP; Fri, 20 Jan 2023
 06:17:39 -0800 (PST)
Reply-To: illuminatiinitiationcenter7@gmail.com
From:   Garry Lee <email.legezarichard@gmail.com>
Date:   Fri, 20 Jan 2023 06:17:39 -0800
Message-ID: <CAApAuVx6K=r=XnwcuFCYnMHPMT+hqO7HcW3AU0UkoCwugxbeKQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_FILL_THIS_FORM_SHORT,UNDISC_FREEM,UPPERCASE_75_100 autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

-- 
DO YOU WANT TO BE RICH AND FAMOUS? JOIN THE GREAT ILLUMINATI ORDER OF
RICHES, POWER/FAME  NOW AND ACHIEVE ALL YOUR DREAMS? IF YES EMAIL US :
MAIL: illuminatiinitiationcenter7@gmail.com

YOUR FULL NAME:
PHONE NUMBER :
COUNTRY :
GENDER:
