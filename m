Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 56C824D78B0
	for <lists+linux-usb@lfdr.de>; Mon, 14 Mar 2022 00:13:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235637AbiCMXOn (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sun, 13 Mar 2022 19:14:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41186 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233316AbiCMXOm (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sun, 13 Mar 2022 19:14:42 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA97E2B188
        for <linux-usb@vger.kernel.org>; Sun, 13 Mar 2022 16:13:33 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id q5so19499217ljb.11
        for <linux-usb@vger.kernel.org>; Sun, 13 Mar 2022 16:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=efxDK1uU7DkE4cVJ9myazVuQ4eaJnIyftNcM+xFzvi0=;
        b=l7lEhbuCFMuPP9xZOCDbemNTrx0aG0mlLDwZvuHI5Wb3AqfXuWxZ3gD6FsZwc1XOnb
         C3m2UqxBQnwIY7HOtJmRzmLYepLZsFjl+D6qhoajbaz29klgVRKceniv5qZs57wbLjV0
         yJlJcq9F7QuSuM1GH6O7ja4BdxvnQhaxPXVR95+bhFFisQGgP7h2CR9OYbB8VAf9lTdB
         1BxkJlmN1xrp1sMZEmSkCpKyZWqTb6bLiR4AoORn8Y1bwj1C0o4hWI+1yZ5ORsFl+9OD
         a7X5vvQaL5NtViDtn0tb0zfsCfxgMacJ3qptau+q2x6w1tHrzCc5SsNM4VHqgDiP9Nno
         5xvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=efxDK1uU7DkE4cVJ9myazVuQ4eaJnIyftNcM+xFzvi0=;
        b=riO4aHxlXgP8lrF9RCIRArSNYnE97tKShiBe7Jh8yCKn27rBAAH1TRxx4eD2ga+Ym9
         nh/V5aQkPK1xuBNFk+YcmLkPnJ8son9zGg309ws7qy2vYUBJKnuaIg9RbFPOwcGnCgVz
         bzGHN7rfl2rEexsuNJ7jnj+ib1Rbdm/4bgpt9rhq1UDU+dQISk+PZReu61Zae6GdMvC0
         /HgUwrICXG9saSl00qpMsr2DZB7YMcN3l5rynxyVN0dhfFXma0zCg4qqzNmn+MdzZsWc
         ELcB7mCOjMyhiqxw+3T1kMnzmeYRqcSZOuBIDquKF8zzW/giFZx/rU6wonrkBCVPiagC
         PnDg==
X-Gm-Message-State: AOAM533qqTzQhvSJKHf/hJpANSvLnsDRYnFZMEMXP1rXIt9qXovJEuYw
        JDxquLeumdRbDan2Ysk+mj7O0K/xD8LWvmKKRg==
X-Google-Smtp-Source: ABdhPJzgElBlPcuDeQrjQA3FErE7xHbU0dtUeD6LpafVyM4kkic0xdAQ/u62qa/7d+q1Cab6CDosUo5eqohuGjOexSo=
X-Received: by 2002:a2e:bf1d:0:b0:247:dea7:f657 with SMTP id
 c29-20020a2ebf1d000000b00247dea7f657mr12678600ljr.454.1647213212141; Sun, 13
 Mar 2022 16:13:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6512:68c:0:0:0:0 with HTTP; Sun, 13 Mar 2022 16:13:31
 -0700 (PDT)
Reply-To: fionahill.usa@outlook.com
From:   Fiona Hill <xaviervives77@gmail.com>
Date:   Sun, 13 Mar 2022 16:13:31 -0700
Message-ID: <CAPB_yMTPnYdjXvy=GLLQ8z_JjsVeckUEt1YPP5fC1kc_bg06XQ@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

-- 
Diid you see my  message i send to you ? I'm waiting for your urgent respond,
