Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF8C46E4F90
	for <lists+linux-usb@lfdr.de>; Mon, 17 Apr 2023 19:47:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230519AbjDQRrH (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 17 Apr 2023 13:47:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230137AbjDQRrF (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 17 Apr 2023 13:47:05 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 932145BBA
        for <linux-usb@vger.kernel.org>; Mon, 17 Apr 2023 10:47:04 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id fw30so13559229ejc.5
        for <linux-usb@vger.kernel.org>; Mon, 17 Apr 2023 10:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681753623; x=1684345623;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ftUK28jNeVbZI1YwnxbSCR+OUeG4rzKxSuPLKinIHUU=;
        b=rGQ+7vUD/ahMLXanrMPXH1HprNU/cZEbztflAzWShO9fgFun9OaHI5LBHP7jbix6jk
         L3Ed5cZcvWzqhiJmAkb6H/H/4aSd1s+XyjBVZHGKZwjU4l+4J8dz2FPr8sOV8xxFuEOa
         0u0OseRsNufJBy1YpR1jupLeJfdMR3JfRP2YQTTQZSBc457oo8omEKUcktMYCBsZ61kH
         zEbHhspbg/dJ9WKKBeSEZdgLYCu7L3yOHe4nNyh9IwPBgWPIB/RtC0ZaOhybx4+SpDaD
         7duJoCa8fitSwg/sQVRfD6C9YPgfVbe4F+fAOJ8ZvyuKA+o7nKY4Wpcdbr3O+klND1Ns
         PrKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681753623; x=1684345623;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ftUK28jNeVbZI1YwnxbSCR+OUeG4rzKxSuPLKinIHUU=;
        b=VH8yi4JG5kryYm/WQGqohGEVBtksuzimLpyvCmjlN8q5Sh4pQbKuKqPg2hE+vslELS
         XrbsAodqw/TXdfHz1LWQ0iH39l0xttnNOA5vwvXcK6WQpmEv8JOhEE44rxBawqWIqc7E
         5pCqRRplZt5LKW9sH4jMGK2v4qN7vWaNz78PSMeoQM63G+JwYAUT1sItU/gI/FSauWan
         ByZ0+jY8256/UxnHTrNR1Kv+yZGGA86Qgpk0bMTtHPSfnKB3YimSWzD7KKBi39aHvDFm
         W3D45QVYwvLUsu9embTmR3gVd9Nx81THJhnGKw087caBIwGOgzRJSO3v7HFD8qLtkoY0
         cd9g==
X-Gm-Message-State: AAQBX9eiH8PWNsoQdj6JLZfmcnXw36CPzEejbvNl3hqc6PqDvmB2S0FM
        ttSixUz7msI69tWCQOs2I71MzjWA0ZRMmkbU0p8=
X-Google-Smtp-Source: AKy350Yllvj8kI8iCCbPaPRdxSeiRmIye2XtCjaBxnecaa9g5xfkxOyf0KghyfCy7x1dwZU9rlTfjR9gxo1ZRZjuSyw=
X-Received: by 2002:a17:907:6e24:b0:94f:8aff:c8ab with SMTP id
 sd36-20020a1709076e2400b0094f8affc8abmr1554990ejc.10.1681753622751; Mon, 17
 Apr 2023 10:47:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a98:8c84:0:b0:1c6:885b:bb8d with HTTP; Mon, 17 Apr 2023
 10:47:01 -0700 (PDT)
Reply-To: wormer.amos@aol.com
From:   Wormer Amos <koumbandiayekouba@gmail.com>
Date:   Mon, 17 Apr 2023 17:47:01 +0000
Message-ID: <CAMcBcCVbrdYKJstsVCSAZPOAwmhKGhZoLDJhyDwSQC+NHpQyXw@mail.gmail.com>
Subject: FRIEND
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Good friend i want to know if you are capable for investment project in
your country. please i
need a serious partner with good background, kindly reply
me to discuss details immediately. Thanks and awaiting your quick respond,

Amos?
