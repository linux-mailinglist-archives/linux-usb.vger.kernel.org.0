Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3F25F53AB75
	for <lists+linux-usb@lfdr.de>; Wed,  1 Jun 2022 19:01:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353471AbiFARBV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 1 Jun 2022 13:01:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229509AbiFARBT (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 1 Jun 2022 13:01:19 -0400
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFDEB313B1
        for <linux-usb@vger.kernel.org>; Wed,  1 Jun 2022 10:01:18 -0700 (PDT)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-30c1c9b9b6cso25388157b3.13
        for <linux-usb@vger.kernel.org>; Wed, 01 Jun 2022 10:01:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=F+NuMEuH4IKPBVub7acdVSKn7TIDhmqipKLUAnjj7J9VI+iO/NUmDsRK2Emsj4M+Q6
         hD6FMs6kzqgIuLvt37ZQfqeOfF05owNdiUml9rs8RvCcHqKQ5dcisscqPyICn8x/dvND
         oattXtatqvhXpqF8n39e90Hh7eTKRzivU2JX6TkWeWzV5d94kkiNmekLI3eJRVx5qckr
         16919caOIJSwwq169SSSCarM1YtXBX4ZtxWohZwtfjSIPREfeTRlTLlxER6Xt8T9b2kh
         iRFJzHNHRCeN5hY1hBNssttK3/aqqbPcnUyOkZ89fPTHdT+pB4oqPDcGRKaKw5ppf4nH
         YLQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=r+vv1MeGdJlqJlZ3ETY7IxCr1yUSEZfQ1ghvDxhQPeF7ixnAgTlQrA6V1V1cilEeUE
         u/g8paZkerNJWgbmknWH6SUkw93/CIVd/2BmAfRC6JOHvDFQu2PQ4lLX6sEiAgcDK3ZJ
         xR2JnugW1lkExvS592I0TIiqOAfxktcxKjx+DiEcvXIv436sjC7fVfJem5WGR9xTims0
         2c8OxtpEqqE77WtUUNa31uy3Y5A/MWnd70oW42LdjHwb/kI7MKjxtPNG6wnDs+qAVlEG
         h5SVZbpY+3kA6/kN2kuGVFkWVCe+SJZjD6vtZu+IBwvGzymX1TwEqo7H0zx7bj9Pvyu7
         e8Kw==
X-Gm-Message-State: AOAM533h08cIX3DCfM4vM3WCavCeHAsz/MeP8N+qHOaA9YhnyNcfo53h
        tuPV3wC6lWEHdGh/ARJDZa7guZoDJ7xqHKjOBZI=
X-Google-Smtp-Source: ABdhPJwuaqCyac0o+TumZr8D9ZKy8vIApQzXCsRhwCwdxg4MCsSMPeAFdi3xc2+PLVHYAjrntl1SlQL1DWoUTcvmTAM=
X-Received: by 2002:a81:604:0:b0:2e6:6b45:4812 with SMTP id
 4-20020a810604000000b002e66b454812mr474480ywg.266.1654102877800; Wed, 01 Jun
 2022 10:01:17 -0700 (PDT)
MIME-Version: 1.0
Sender: genbradstanley@gmail.com
Received: by 2002:a05:7010:750e:b0:2d2:2a0e:aa8 with HTTP; Wed, 1 Jun 2022
 10:01:17 -0700 (PDT)
From:   Ahil Lia <mrsliaahil070@gmail.com>
Date:   Wed, 1 Jun 2022 17:01:17 +0000
X-Google-Sender-Auth: iBfL4JVxZubBqeR90butLoKq7as
Message-ID: <CACX0y-XqOER7BSXZ4RS53qZgkcSXWBxa4Rag1jDuaCgp5iDk0A@mail.gmail.com>
Subject: Hello, I need your assistance in this very matter
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_40,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


