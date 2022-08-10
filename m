Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2D5758EBF0
	for <lists+linux-usb@lfdr.de>; Wed, 10 Aug 2022 14:27:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231773AbiHJM1C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 10 Aug 2022 08:27:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229511AbiHJM1B (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 10 Aug 2022 08:27:01 -0400
Received: from mail-oa1-x33.google.com (mail-oa1-x33.google.com [IPv6:2001:4860:4864:20::33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77DB36E8B1
        for <linux-usb@vger.kernel.org>; Wed, 10 Aug 2022 05:27:00 -0700 (PDT)
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-10ea9ef5838so17600054fac.3
        for <linux-usb@vger.kernel.org>; Wed, 10 Aug 2022 05:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :reply-to:mime-version:from:to:cc;
        bh=7CJ2H+mwqwi3qTSuDIQlMPG5AfOpvwm6RnkGrDapEZ4=;
        b=BaeRHttG85xFxPSRnbqQ6P9DTrn+nrrIbXa6r7YgigBfwgNuvkSeThf02eXaLgz5HH
         yTPKMfDvGuM90LG0RVnklZ5J5xmqbmxXddTgSKjX4S00Wu7z42S4scOsl5mIZOgeN6j1
         qqdDOd7Zgtmp85pXGC8YhQNClXIlXQDd62qbDkbtoMlCpi335lJ+kMCIV9NbuTvmtHG+
         x/TdQsZFvG7SLsX3nJ1w9eYi58MCq/6b7DB3C44qXkRvzW08tvRplZNLwugIsMFFu+wR
         iOScdHlKVqTx0M2/zqOveF8hd2chxdSNLKHz9fiuv6SV4nsZoF3evAGDm2scIYBJnSaX
         /6jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:sender
         :reply-to:mime-version:x-gm-message-state:from:to:cc;
        bh=7CJ2H+mwqwi3qTSuDIQlMPG5AfOpvwm6RnkGrDapEZ4=;
        b=etvCZXSkv45SEZBenpj6Zf3pt6n6hzLet705gDX07QCVkWgKxuFimF+/03Laa2MpsF
         vLKB3xyyeA2wKHfMN37jqofLTOgK6ZsVzohl7MyqydmiFN0Zsu8LfZ/ld4141EjJUnu4
         pSZ6+nXBLjtiGImiFRauY8p6IMSswldti3adJLe30dEGMeWjsXObI+mz0NoCBUO8mn1I
         JSunPy+rAjcco3DCUdqo66KdMcFUKYQyIfpUpQZPKzOXLlydZcXQE52D9ELohRpHnk2f
         UO/46seCqJAdm1Bbm6FiV1+J6NhW6+mOmyVTTuRzAN+LLDMzWb0MvaIIZbE4dMdzph3V
         sTAw==
X-Gm-Message-State: ACgBeo0Vmunr732lSdLVvPpuFBE9UqVbm0E02V7o0iTdZAroO+ihFDf3
        7LVFQv4Vln9LUdg7+RYME1K5AFwAMqFXgsn4/fc=
X-Google-Smtp-Source: AA6agR6FdqpP46+uSxo5Dqj0xJoBbzQAkM7jopC9jtegeGHlXJ5/s+hLX1YAlx1KkIrsf5UmcgVe5xyTinYz7kO4SWo=
X-Received: by 2002:a05:6870:968d:b0:113:610d:67b with SMTP id
 o13-20020a056870968d00b00113610d067bmr1317556oaq.30.1660134419902; Wed, 10
 Aug 2022 05:26:59 -0700 (PDT)
MIME-Version: 1.0
Reply-To: sgtkaylama@gmail.com
Sender: yakoubougourou90@gmail.com
Received: by 2002:a05:6358:2115:b0:ab:8d56:1c23 with HTTP; Wed, 10 Aug 2022
 05:26:59 -0700 (PDT)
From:   sgtkaylama <sgtkaylama@gmail.com>
Date:   Wed, 10 Aug 2022 12:26:59 +0000
X-Google-Sender-Auth: jHx2eckfveWkkarCup5CZObvAM8
Message-ID: <CANcDhOC4jWmqBT3QAtmdXjYv_19rz1w-hfoV6Ce-Ca8Z03Wzpw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=0.0 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

16nXnNeV150sINeU15DXnSDXp9eZ15HXnNeqINeQ16og16nXqteZINeU15TXldeT16LXldeqINeU
16fXldeT157XldeqINep15zXmT8g15HXkden16nXlCDXqteR15PXldenINeV16rXoteg15Qg15zX
mQ0K
