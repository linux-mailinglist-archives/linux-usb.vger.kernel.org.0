Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BA144D07FF
	for <lists+linux-usb@lfdr.de>; Mon,  7 Mar 2022 20:53:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245180AbiCGTyV (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 7 Mar 2022 14:54:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238451AbiCGTyU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 7 Mar 2022 14:54:20 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44E0E54FA9
        for <linux-usb@vger.kernel.org>; Mon,  7 Mar 2022 11:53:25 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id s10so271070edd.0
        for <linux-usb@vger.kernel.org>; Mon, 07 Mar 2022 11:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=zI3YMoABJRyR+odt0AbJrQOCfTLDDuwNt2ksIU5nkFY=;
        b=dpEw9x78APOEbjTC5L38uYIr4Syz7DSkFqs2aZMogOCDNdtzFom+mp1r+x36Gamx6+
         IwlNgFx5NT6nN/IjMqaCGdF54zmzQFZLaM5X7/wnMiZHdCTZ7bGt+gZ7cEu4GKATgTxX
         WCt1y2/X5Lkutescz3KLif8usHEBUMfN5ZJRQT4QcWoaTJHsoI4ksXE9fe6Gh0X2iffY
         pKKrunt/cDmJ2ns7GjUpIg+VdIfUHfBpSKeCGSWNpl1rKxFtprh/LjTh0jC9rKy78OuC
         qJAIhVVXrlxTdklXI3hgpidTbXunS1LaOIDkggN+P0KtRnuRAPEH5zo/1or35chB63Qx
         P8qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=zI3YMoABJRyR+odt0AbJrQOCfTLDDuwNt2ksIU5nkFY=;
        b=xAL/BffZcuaZ+Z/r9QYyK7ozqOPxZIV5ltobLUhYI/14888K87QSJ+16ldc3pFy7ky
         8JnaFBtvl2nDE0Uu3podyObl1WXcF1prIqOGQKh00uiIBvZt0cLeNfH6suMPJnTOPlTy
         ghV2PPru6HQg8rRmQYHcyxuR/OnfgRijHQPk4dauWiSs5itcn3YWe10fKPpZs3S2pIhU
         85dC48N0FhR3VZyN0lbxwzqI6gImUGM6+3KSfWqrbZSSkgDKhO+JAEaJE5nbp9xmMSPN
         YQ5VLSVSx0/fJpepYC3iPxj5HRcUy2V+oHi/qlF9rnXO9XqRtV+ofQGhd4j1Gq4ByMmQ
         vImQ==
X-Gm-Message-State: AOAM530dOjvKpvJZp8Zfs2deDsaTJfKCZgnv+bbpJrWhJqNPsCZ2Wn/L
        u2l40qisf0+zLwmj2Osmw1bz3Fa3bE/nQ4r/C5M=
X-Google-Smtp-Source: ABdhPJwekVLiO7U16bI9jGL1/WRIlboI2TWJlng/U48GG2D90b9DyKcLGVBMWKOCEe/pcXxerEcC/RK8x+Rv74UEG1Y=
X-Received: by 2002:a05:6402:354c:b0:416:476a:e642 with SMTP id
 f12-20020a056402354c00b00416476ae642mr6242014edd.237.1646682803862; Mon, 07
 Mar 2022 11:53:23 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a17:906:7313:0:0:0:0 with HTTP; Mon, 7 Mar 2022 11:53:21
 -0800 (PST)
Reply-To: fionahill.usa@outlook.com
From:   Fiona Hill <drivanrobert81@gmail.com>
Date:   Mon, 7 Mar 2022 11:53:21 -0800
Message-ID: <CAJp5pikHZCn_RNZpE0r9Zvwm03PU2fWL=SH=W+FGcQ0wtVDX+A@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
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
Please with honesty did you receive my message i sent to you?
