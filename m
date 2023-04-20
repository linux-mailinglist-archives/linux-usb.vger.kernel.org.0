Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 44B866E9B91
	for <lists+linux-usb@lfdr.de>; Thu, 20 Apr 2023 20:25:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230089AbjDTSZS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 20 Apr 2023 14:25:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229661AbjDTSZR (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 20 Apr 2023 14:25:17 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C67FC272C
        for <linux-usb@vger.kernel.org>; Thu, 20 Apr 2023 11:25:16 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-247122e9845so908211a91.0
        for <linux-usb@vger.kernel.org>; Thu, 20 Apr 2023 11:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682015116; x=1684607116;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xQIffIkqtd6hNHJB4rxz+31IegGCQwc44vhkiOJj92s=;
        b=Cu+0B+PK0MYjzW2+i39kldcN/aIaCuQSrcf6eHv158AOp3/C82ldUrcadYPioAd8cg
         8oS44bwIyEEtz0GeHTU7gSeXuFqH56+gqEdkHK2rflMfP/toGQXPsfy/n5Zq/0mZaGLh
         4puPiIkNOG+mc7CXImqhd1dcahBPxw1rNwYgphWLeTKU+Cext4qvjZ872AKHJ6Q62Kbn
         /oK4xcmMZ9q0Ytc5iNPa0VMb6AasZ5QmZrJr4l8f0Dg8Pn2c+B5MAqf+pIZhQmM5aGQ1
         I6pOYiXDcombtpkrj0aDrwopntvC5IZZKoZBmbUDxjZY4A6TrcqTvJvtfH9JpeIiAnL4
         miiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682015116; x=1684607116;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xQIffIkqtd6hNHJB4rxz+31IegGCQwc44vhkiOJj92s=;
        b=ZihTmQQ6vI9I4N6XBHLblKEHVmAFkgAZegtgxq2F/yrXRi4sAjg64frwbsEsKIFGHE
         pQOiZTVGlorHqj1LaSj9pTM5nCdAEzCmNVBsmsfyplfXIcTH5XSWmmUs2y4DAPIqK4vS
         LdxVExqD78NPtzz75KvTRlRhec5GG77HA/1c2sk72iThSZj66i7pGRFnbwLzJYIXpxTs
         GTv/mcQdS1POAqN8ftCNhX49NTEs4ghzkV6wTF8ERafT+x0pS0N0baTJP7jHA8RJHiQK
         Uobc6nt3kb3fpOm5zCtKIvW/Sz95/hBKemZpJ6KaXO6KpN6WQB+kFs1Md+3Mkg3NKcM5
         z9Tg==
X-Gm-Message-State: AAQBX9f8LAoZvWX0C5n3o70qLvxwsho3d04eEUh7J+m4yaWPKJSs5m8V
        pbmdiNgEXt9ihEsf+KKHF+wLYzU7yInLFRq3FXo=
X-Google-Smtp-Source: AKy350brJO/zNn8d4ey0DD2/QmHk/6Wt3Kn/ImgDOGHKVt0z6+jMqv8kbReO+gSOwv0Shhyf2EhFmdPqtEfajXKmb8k=
X-Received: by 2002:a17:90a:fd17:b0:247:1de8:8263 with SMTP id
 cv23-20020a17090afd1700b002471de88263mr2755705pjb.4.1682015116262; Thu, 20
 Apr 2023 11:25:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7022:2082:b0:61:d1d:be20 with HTTP; Thu, 20 Apr 2023
 11:25:15 -0700 (PDT)
Reply-To: jennifertrujillo735@gmail.com
From:   Jennifer Trujillo <williamsjohn0967@gmail.com>
Date:   Thu, 20 Apr 2023 19:25:15 +0100
Message-ID: <CABDAQzRU5GdoorNn-wKsOOm7GSwBcyWwiGW0MSg+O=E6ZLi87Q@mail.gmail.com>
Subject: HALLO
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=2.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

-- 
Hallo,
Wie geht es dir?
