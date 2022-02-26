Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 067B34C52CF
	for <lists+linux-usb@lfdr.de>; Sat, 26 Feb 2022 02:01:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240597AbiBZBBb (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 25 Feb 2022 20:01:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240677AbiBZBBa (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 25 Feb 2022 20:01:30 -0500
Received: from mail-qt1-x841.google.com (mail-qt1-x841.google.com [IPv6:2607:f8b0:4864:20::841])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E52752036D5
        for <linux-usb@vger.kernel.org>; Fri, 25 Feb 2022 17:00:55 -0800 (PST)
Received: by mail-qt1-x841.google.com with SMTP id 11so4071666qtt.9
        for <linux-usb@vger.kernel.org>; Fri, 25 Feb 2022 17:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=xLb3TQx9KxuMxtf3xcCBiCwA8sPGsTzld99AYCOXRKI=;
        b=eSYnZ6PUV5iovuTH6dz79EG6pMqriqgNhlUvVUk8vBXJRpOB2Sd9Rl/af6SoooCN7J
         YfceXIQHg+1ZcsU3/bR8ZGoWx3pzODwpSo7+N0onjdGbp/VMUv8M531MNuRTTnF27f+i
         4MDN5vGqBq+3dqI8VQQQxSvPqpJTt1FJP+Un9SrW46kkSZ2QVqTxh2ZF0SkvSYDeO/BW
         j5oumikRlg63Gf6L6pE2vJeQ3r29HYP7jF/z6hGZAqe1gFmTAcgjbav6CfOjRqBBqTA1
         H/lU+Sk/wXZSas0R8ybklWwwdD3zfhhCMmizN+RtyF082lQIeG02bRlzsTUwOaKBcaOC
         6rvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=xLb3TQx9KxuMxtf3xcCBiCwA8sPGsTzld99AYCOXRKI=;
        b=QFQCZ6gN9BPHHnfOCTLLxqP/NjaqHxs/UZPygc4xyArgTKAMa+XkRW2/heE398VOId
         BkcrK6tmUrb+iOg/ItetmAw8eG1KNI9vTC9khgMph5q135FlJWBoYr7K4BNczwa+7ngc
         xoyQ6qpKyLTqXtRmIZcCwg46CxqTdjAOxjOEfgZTcCQeXs8bz4/jat2/66sX0SM6Fp+4
         vU9lo6bdKmhBe9E6PI3uaAuX2NSuS8Jidfg8gq4eQT1att272GutrePFT2lZCBYbw1NC
         BokEsik7Wl7c50sS9KghCgrcAdCutMBLsimY8kzdn4Yk4S/eoG1SElrRnvtuUDEDKXz7
         wFjQ==
X-Gm-Message-State: AOAM532/ZJTHA5SUoItPdC/3svCXf0a3daqeTsvy9zLb6W6mZW/OH2xV
        AS3kRiP25qosZSz0H5zMY8Hk130IaXQ34pnWo7o=
X-Google-Smtp-Source: ABdhPJztkQvP9pSHNNpPHzEk+7F19AsTJQLX9BJYf9HWEk4MuSrnahAD8PthLtGFipFRpzFEv0qAXC7aAImPDuUCsPM=
X-Received: by 2002:ac8:4d92:0:b0:2d7:fd80:8903 with SMTP id
 a18-20020ac84d92000000b002d7fd808903mr9190758qtw.294.1645837255158; Fri, 25
 Feb 2022 17:00:55 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6214:d62:0:0:0:0 with HTTP; Fri, 25 Feb 2022 17:00:54
 -0800 (PST)
From:   Miss Reacheal <zemegnisse@gmail.com>
Date:   Sat, 26 Feb 2022 01:00:54 +0000
Message-ID: <CANkd_0zjf=O2SXyu6p8a16ShZ7G1_k1PtBTQb1qcW-aT8+7ZnQ@mail.gmail.com>
Subject: Re: Hallo ihr Lieben, wie geht es euch?
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=0.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_HK_NAME_FM_MR_MRS,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hallo,

Sie haben meine vorherige Nachricht erhalten? Ich habe Sie schon
einmal kontaktiert, aber die Nachricht ist fehlgeschlagen, also habe
ich beschlossen, noch einmal zu schreiben. Bitte best=C3=A4tigen Sie, ob
Sie dies erhalten, damit ich fortfahren kann.

warte auf deine Antwort.

Gr=C3=BC=C3=9Fe,
Fr=C3=A4ulein Reachal
