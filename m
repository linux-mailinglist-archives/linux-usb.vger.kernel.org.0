Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3AB76546D4B
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jun 2022 21:32:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347869AbiFJTcg (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Jun 2022 15:32:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346441AbiFJTce (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Jun 2022 15:32:34 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 080FA35DF7
        for <linux-usb@vger.kernel.org>; Fri, 10 Jun 2022 12:32:34 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-3137c877092so1597267b3.13
        for <linux-usb@vger.kernel.org>; Fri, 10 Jun 2022 12:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=CBSi5G2Z6FF7o0IMejGxaLaEb83plwxI2IWkMVeVjqY=;
        b=CmNm5MRpRTD+KKxO81RA+i6fPQ3N+y5wqFmTy8q6fr2FMnFFbZwFhGnyfAO74S8Izj
         4ICXAkHu8lip2NibGxKv26bZHVKlOPAu8NUnbmAXdw525TcTHa/3n6paVrfynL0OF1/J
         2RYP8e8AuNJ6FkbIQWLvRu5zetVNyd45Bl1YN7pBzSuNXgrT3TAxaGvO48g2OM3aDE0D
         MxeI9Rs9eaNJWNinda4sB0wy0wceyAN4nrLBrYC7PUfmSc+UNSkbrKXxQfxheEmywC+i
         lTii3EN3YfMa3RdkJFfuK7J7c/HXnPqLOpLhbp5D+pN1uasAAc3EQiEFiwXAvZJrphkz
         0AHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=CBSi5G2Z6FF7o0IMejGxaLaEb83plwxI2IWkMVeVjqY=;
        b=R5KDFECjIhV1M0u2muHxXCMy0wjdW7AR+QGa24QHe89XXqk+Z4/ejCkqBqZIks6uxV
         JJkaCp+dhQayxkmdFdUzQ8wVVH80H+5ydPCrl4mGixaUkH8UJegRHuokOA+OpvDLM/pC
         BZEjp6PCOktK7VNiepiXA4yLJkv1hP9ZcYbgP2W+zDWWoE2lQvXXcFr+5gKtuUVbVD9k
         JsXyJ3c15xIUbDcBWCSLzEcx2arJIK01rfEdAoe5JsY9Esb/vRDWrFFQNkqQj6fZfgJ2
         v6SKodsVbw4Mi+wZNugBwkhgWgj9UOoB4BqHQL9fHZK2OiCUg50KkO54Q6L06v1Sjmpu
         z9sw==
X-Gm-Message-State: AOAM532uIeA+p2HseKMn8tCluJ4y5EQon3syqBpPkf5xCuoCLNLygBQL
        kfu6d258JkAVzxUz7mQA76o9c6AiYbu2+iEPivdXShjV
X-Google-Smtp-Source: ABdhPJzaKyn4x3IsNv1YfxxXM3mmYPJZjJhFNdVfeTkfoayYsM/gg1vzFpGJNpdRVBILoECU84QeAsD6p6LMr/dDZNo=
X-Received: by 2002:a81:a243:0:b0:30c:37ed:52ff with SMTP id
 z3-20020a81a243000000b0030c37ed52ffmr38628427ywg.508.1654889553101; Fri, 10
 Jun 2022 12:32:33 -0700 (PDT)
MIME-Version: 1.0
From:   Sylvain Munaut <246tnt@gmail.com>
Date:   Fri, 10 Jun 2022 21:32:22 +0200
Message-ID: <CAHL+j08f4PJd64d5OQY730QH7AvJkf97HaCrJBF_vVR5-DmSjQ@mail.gmail.com>
Subject: pps-ldisc support for cdc-acm
To:     linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        FROM_STARTS_WITH_NUMS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,

AFAICT the pps-ldisc support is done for proprietary USB serial
adapters (ch341/ftdi/pl2023/...) but is not supported for class
standard CDC-ACM devices ?

Is that correct ? Did I miss something ?

Cheers,

    Sylvain
