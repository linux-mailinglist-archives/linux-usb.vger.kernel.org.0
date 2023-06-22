Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 024B473A195
	for <lists+linux-usb@lfdr.de>; Thu, 22 Jun 2023 15:13:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231571AbjFVNNh (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 22 Jun 2023 09:13:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229437AbjFVNNf (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 22 Jun 2023 09:13:35 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D3841BD2
        for <linux-usb@vger.kernel.org>; Thu, 22 Jun 2023 06:13:34 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4f7677a94d1so9894900e87.0
        for <linux-usb@vger.kernel.org>; Thu, 22 Jun 2023 06:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687439612; x=1690031612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RI/5ffYKsEHHHxNTGooqFSd7XsY9L1LTHRzS037PzHU=;
        b=q3uQmeJsnm6V0zgh+dPRNTZ7qMWDkhamkWJNn00ViD84+HKuhjiuVOIGErm+xIB9F+
         +62WQ0ke7ebdgpnnZLN348Cdt2S8Y2Bm/MtUnOha5dpk7xQkdRFLi0vomNinrnTD4abC
         hDXYT+HfoXMMXHZ2v/JcPo20x+QYFF8vvlN8H9HgB4RF4zIwY35gTvvq/GB/M7VGDWoa
         JazbdMimzr048rvdEZBbpFkXRyuJWfyKjIMwDfr1fxdPNoOmW43cZcpnbfakYwyWpB5N
         GXzobQWCTBJ9vlqF3QP38UVKtPVHZUJ4x5sYFOsNwE9pUHXaOC59zHTrU3wqncjv23ek
         3d9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687439612; x=1690031612;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RI/5ffYKsEHHHxNTGooqFSd7XsY9L1LTHRzS037PzHU=;
        b=VdYVB6DWWBbkSrFSSniFFduX+l3deCRg6HovxwRweQxH6xyQAAVPB54I7rMMNk9Sib
         CmRNcCDehPVx6wuFy508ATv9bm7fkuxt3s6X2nS9s2GpgEfRHY0nUfU2lmQHbhKPaFi+
         clR06PW3yZiCzrAWT8t5mwl40tJIemqmlOcsYUqxMtpuzWBrgOOHKKk++zoVfdsT1iIJ
         RoMS1qG2dwkEM58QOXQgm8goZUaOHFUWak3gOYZGgIsyzL5qiVvOevOq0T36paJ1lznZ
         OU6Yyo9nLotLfzExtYt2ZBxx9eWpnaaUMcOXzI6DFQya5xRqubrBmjH7mY58YnQi8Jg2
         pOcA==
X-Gm-Message-State: AC+VfDx1FzAJljKqyaETIwjc+kRlnB3BmoeOHdzFJWBJLehQd5S51Itl
        GsQN44NR+5/SRXLPWKBEwCw=
X-Google-Smtp-Source: ACHHUZ5SjMi1/jCleFQn5FjPL+u52LQ9XopB61csnVamhVM2nUpgQAg6SH7ipbLFRlR1kRwk4mPHgQ==
X-Received: by 2002:a19:e050:0:b0:4f8:453d:e56 with SMTP id g16-20020a19e050000000b004f8453d0e56mr10184309lfj.5.1687439611877;
        Thu, 22 Jun 2023 06:13:31 -0700 (PDT)
Received: from testvm.ubxad.u-blox.com (mob-5-90-138-76.net.vodafone.it. [5.90.138.76])
        by smtp.googlemail.com with ESMTPSA id f1-20020adfdb41000000b0030ae499da59sm7031440wrj.111.2023.06.22.06.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jun 2023 06:13:31 -0700 (PDT)
From:   Davide Tronchin <davide.tronchin.94@gmail.com>
To:     johan@kernel.org
Cc:     davide.tronchin.94@gmail.com, gregkh@linuxfoundation.org,
        linux-usb@vger.kernel.org, marco.demarco@posteo.net
Subject: Re: [PATCH v2] Add LARA-R6 01B PIDs for three different USB compositions.
Date:   Thu, 22 Jun 2023 15:13:20 +0200
Message-Id: <20230622131320.15083-1-davide.tronchin.94@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <ZJQ10DKDic-FEKM6@hovoldconsulting.com>
References: <ZJQ10DKDic-FEKM6@hovoldconsulting.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> You forgot the commit summary prefix so I added that and shortened the
> summary to make it more succinct:
>
>	USB: serial: option: add LARA-R6 01B PIDs
>
> I also reduced the indentation of the product comments which appeared
> excessive for the first two entries.

Thanks a lot!
Best regards,

Davide
