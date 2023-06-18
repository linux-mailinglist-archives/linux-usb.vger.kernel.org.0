Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 875807344CE
	for <lists+linux-usb@lfdr.de>; Sun, 18 Jun 2023 05:34:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbjFRDeL (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 17 Jun 2023 23:34:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjFRDeI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 17 Jun 2023 23:34:08 -0400
Received: from mail-oo1-xc2c.google.com (mail-oo1-xc2c.google.com [IPv6:2607:f8b0:4864:20::c2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06EEBA9
        for <linux-usb@vger.kernel.org>; Sat, 17 Jun 2023 20:34:07 -0700 (PDT)
Received: by mail-oo1-xc2c.google.com with SMTP id 006d021491bc7-55af44f442dso1548632eaf.1
        for <linux-usb@vger.kernel.org>; Sat, 17 Jun 2023 20:34:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687059246; x=1689651246;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wWTmMQSsiLodfdKu7C8lcuyX7WesZia949PML8BXbEI=;
        b=KW0kMtD2liIU/cJHUPe9aUXPpQx+mJjvgQCaoptoVV8rmVKzVsSzqHqqg1wnsyL13K
         0SQSiBqZ2arx/4RXBoOA6GtDc3GJwRuydd9RW9QGWXOrLpcovnFPcT5HLAqhfQ9OrMp9
         NrtDMxqgL2w3BujjgDM4s3bk588VITGylAdNoHDvN281j6w9tL5cO0Dyr2tKQvulLSVv
         DujUdEGi0OmKHTR0lfrcLXK17SZ6hA55op20/9yfvPm7wjoyybNMR2EK8dFfqhd/4SqW
         bGTsLMeI3gWp9GeBqudZLQJntK/UW/0GK9M6zPyQtDkNfaSTOwnwyTT4Tk/PQCo1f0Sq
         h+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687059246; x=1689651246;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wWTmMQSsiLodfdKu7C8lcuyX7WesZia949PML8BXbEI=;
        b=XDgPVZiJKZiQm8ofmfAKDXJMilvvDZMJTRS42sgvnHHYe46QAhBenOvCzbkg0toHjP
         ncQ3ndVQcdWtqVfVKMwPKcBpHL6/KcAUVYLmlTxpaamk20zOBRZuvICzyDIZTE20sxTe
         oiQ3XMmNrSy9vdP8nCOsfVG7ouIz0RHmkI+iUAXQ2GDrufa/3Y1NqwS/Yj4jqaT8KyJB
         LYtXuMm9KVOdMMuNLmsCFwYS95rVP8FXWMsBGJ8gqxnfNTqAyfwNhWSwAv+2l236jZV1
         /AJQb3Pnk4L0NAz7urCX0K8Ci6AKyQUyLtPeim0OTmqEnzLpve7yJ2QGESuiGD5gxqOx
         /6cw==
X-Gm-Message-State: AC+VfDxhCVy4xceZ9c6BUDpNXxHexwsimfQTTFwgYPV7Cm9BzsgJGbJY
        JDJyeDUuFb00h5uNBzbH1teXkxyuzULzggAR2gA=
X-Google-Smtp-Source: ACHHUZ5DBs3XXTqQKk+CeBZexfJG9aplfcRhSLvqGwNxioo61wS+qmDAdYRlUtTQlvpdzYplhcdg5olHblx7gckfITE=
X-Received: by 2002:a4a:dd18:0:b0:55d:be61:c9c5 with SMTP id
 m24-20020a4add18000000b0055dbe61c9c5mr2047256oou.3.1687059246282; Sat, 17 Jun
 2023 20:34:06 -0700 (PDT)
MIME-Version: 1.0
Sender: hubertinecoul@gmail.com
Received: by 2002:ac9:5b55:0:b0:4d9:6a76:96b3 with HTTP; Sat, 17 Jun 2023
 20:34:05 -0700 (PDT)
From:   "Mrs. Ruth Roberto" <robertoruth48@gmail.com>
Date:   Sat, 17 Jun 2023 19:34:05 -0800
X-Google-Sender-Auth: MArP0QmGXixMB3kKPmHcfAirw2c
Message-ID: <CAAEzwM=Y8=t50hrRCTJeigheEav4Zsuj_xrhm0mquKi6ofVGPg@mail.gmail.com>
Subject: I trust in God
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,LOTS_OF_MONEY,
        MONEY_FRAUD_3,NA_DOLLARS,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Dear,
It is true we do not know each other before but please bear with me,
I=E2=80=99m writing you this mail from a Hospital bed. My name is Mrs.
Ruth Roberto. I am a widow and very sick now. I am suffering from
Endometrial Cancer which my doctor has confirmed that I will not
survive it because of some damages. Now because of the condition of my
health I have decided to donate out my late husband hard earn money
the sum of ($3, 500,000.00) Three Million, Five Hundred Thousand Us
Dollars on Charity Purpose through your help.if you are interested get
back for more details.
Mrs. Ruth Roberto
