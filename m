Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3CE40557EB2
	for <lists+linux-usb@lfdr.de>; Thu, 23 Jun 2022 17:36:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229863AbiFWPgJ (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 23 Jun 2022 11:36:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231477AbiFWPgI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 23 Jun 2022 11:36:08 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C6202F035
        for <linux-usb@vger.kernel.org>; Thu, 23 Jun 2022 08:36:07 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id q9so28505245wrd.8
        for <linux-usb@vger.kernel.org>; Thu, 23 Jun 2022 08:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:from:to:subject
         :content-transfer-encoding;
        bh=huGUmFfLPum0FCsmxsz1YgbazVouSWQtaf5OKwQFlVA=;
        b=FQ/9vJ7VCXpyPKWhkgLaC/Q2KbwOBQI3McOLi8sIPlTXaqC6M11OZRR8bSrBZsStQm
         OGZR0txO8rpiUM+kMUWqslPPjRQ8pdlFBlqBSdp2ugOQLeKrALcmpZeCiMCarpWxzYp3
         kolGO2Qo4plGkNJvaP8bBIf+mXBzZIOPGDM9CM7/LAMQApVRJs5/sW80ebCers6hbf7/
         Z1F9CXfMW/LF01PGoPTdVfC8bAXaMCY3L2fegpAA8UUzK4Y2LyIeIb/QboMr7t/1BWzg
         09A4AFjxw95oSDWZGTczJdDBuyKh3cCw9t9y1yT6x58fqS5gRTdfz+hYihtACU7EgwIc
         rXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:from:to:subject
         :content-transfer-encoding;
        bh=huGUmFfLPum0FCsmxsz1YgbazVouSWQtaf5OKwQFlVA=;
        b=39aF8TGy5sKonA5Nl9mtPOlaM5FQlGjvkK4jkl09J+vNyk14P2xw8tiEsOl8sttGgB
         V5FFbvr+8QBIKEpuBFLKW2Czqq+TwlrYtAz0ZLOS/ehvAdpiE9SjzZe5915UiEQBiSJk
         s3Fjeqcze3I0ozQ1BDxG5ci4BN5KHFTylIS+D0pyuCL2TwY7YSXO9znIEAJxKQitPgkp
         vOsL2f8M2eT0dLXqqMbjXZYDK81YUM/QDzuH/ZwCit8YCJDL47C3UEcCTL6n9hDSEDoL
         ta40BkkwT78sOmAevZgHPZ2/OhwpyXQc83GCqjvPIKv4Cg3bhV7FwRTcjiGXhM/brpVo
         myig==
X-Gm-Message-State: AJIora+PuJOWL8C8BoEtp0NqRy9wYO3BejrBk2Tvj5Hh8C4QmzbsWDQ+
        ieC3vntqxzD0ZdldgGM6ifQ2zAfl2Ww=
X-Google-Smtp-Source: AGRyM1ulUCrkSM1tWtSiU8kL5x2KcOiAIqbOJTTb2q1mHSrFUjbnhJmg+XLU9AZvwOGcN+oe06/aXA==
X-Received: by 2002:a05:6000:1ac8:b0:21b:923a:1c44 with SMTP id i8-20020a0560001ac800b0021b923a1c44mr8823958wry.31.1655998565982;
        Thu, 23 Jun 2022 08:36:05 -0700 (PDT)
Received: from DESKTOP-DLIJ48C ([39.42.130.216])
        by smtp.gmail.com with ESMTPSA id j10-20020adfd20a000000b0021b9cc87aa9sm5889465wrh.111.2022.06.23.08.36.05
        for <linux-usb@vger.kernel.org>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Thu, 23 Jun 2022 08:36:05 -0700 (PDT)
Message-ID: <62b48865.1c69fb81.e9519.b410@mx.google.com>
Date:   Thu, 23 Jun 2022 08:36:05 -0700 (PDT)
X-Google-Original-Date: 23 Jun 2022 11:36:07 -0400
MIME-Version: 1.0
From:   kermit.crosslandestimation@gmail.com
To:     linux-usb@vger.kernel.org
Subject: Quote To Bid
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hi,=0D=0A=0D=0AWe provide estimation & quantities takeoff service=
s. We are providing 98-100 accuracy in our estimates and take-off=
s. Please tell us if you need any estimating services regarding y=
our projects.=0D=0A=0D=0ASend over the plans and mention the exac=
t scope of work and shortly we will get back with a proposal on w=
hich our charges and turnaround time will be mentioned=0D=0A=0D=0A=
You may ask for sample estimates and take-offs. Thanks.=0D=0A=0D=0A=
Kind Regards=0D=0AKermit Dooley=0D=0ACrossland Estimating, INC=20

