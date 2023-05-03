Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2379C6F5A7A
	for <lists+linux-usb@lfdr.de>; Wed,  3 May 2023 16:56:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230053AbjECO4P (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 3 May 2023 10:56:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229701AbjECO4N (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 3 May 2023 10:56:13 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 276FC420B
        for <linux-usb@vger.kernel.org>; Wed,  3 May 2023 07:56:12 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4edcc885d8fso6238855e87.1
        for <linux-usb@vger.kernel.org>; Wed, 03 May 2023 07:56:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683125770; x=1685717770;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=/IH0bXTd7xM4TJ8FNuoToZkbq/2hYCkpo6CUgnIw9FM=;
        b=baL1ifuCHo6ugTjfVgfQDngXo/lnjgBpfO/85+GP9SKM8GCkPo9dTh3n6sOeBivoIG
         xSSrRj55XBLelFhZi0ovB3P3VE7tixzJ6byIMijTMSRSuukx0zCmvxpMTlQFWD3SO6dQ
         casRvcRTQS4M62H65glZ3ZJL6hjOK1Xpj72r52gSmHBsnh2O+ONA67iIklrCV0vsHhp6
         koVESUphh7eAIw4dwaG0eBI47Y45QH7Gba6rJT92ie42lCWxLg0HmHFCCcHU/JtTutvP
         iUdCcLmZD3l74hVAsUUObwgiRy5L70Jj13oXCMCY/osjR1zKu+SXmUf9OEroPEYm3Bhd
         0Fcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683125770; x=1685717770;
        h=content-transfer-encoding:subject:to:from:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/IH0bXTd7xM4TJ8FNuoToZkbq/2hYCkpo6CUgnIw9FM=;
        b=LlUVOO3S2LCmLHMWAvHXMwncKoComFctK5bUVxEHbCoeeS6ox7fHreFgEZ/qIci6XI
         +WgeQzzmJILtf+04QKDX6+weozLh20WPpuTBPxA3vB5EPwgPrYLVLowC69tDBpt5jK7Q
         LJXgRiAaL05+NpvBb+AddextCBazhilPHdXUX8D1FSWXZj++oiQ6N/TQfhYXPnvJ3xP5
         iYU2bV6eIRkoMPFwffDVFHNcMIE1Xmf/as/R/WU+8e4vAF6eWRHhgHTCyzQZBIE4/r5I
         f1aYm/aK4SsUhJl0hSojxj2f/0sEJiy4S3J+phqbr+rO4+v8tA2Vf0/TlV0ugLQ77f0O
         BQZw==
X-Gm-Message-State: AC+VfDwbwvleEl+crMbIYgR7UQ0RWvHVeSEJnuxcJF+9mWpb1LJ8Bqu1
        rWUWmItF8muJHVRR07S/EYBkOzQhxg==
X-Google-Smtp-Source: ACHHUZ6pV0tQ4dUNO01A2o7RBmn1ZuaF5dCemLo79NFzfcouiKbGdhtN8sMMnT3+v/n0/p0+hdr5Tw==
X-Received: by 2002:a19:7616:0:b0:4e9:813e:409c with SMTP id c22-20020a197616000000b004e9813e409cmr969791lff.28.1683125770061;
        Wed, 03 May 2023 07:56:10 -0700 (PDT)
Received: from DESKTOP-BKF2J9E ([203.109.40.79])
        by smtp.gmail.com with ESMTPSA id x24-20020a19f618000000b004db3e7dfb8csm6072101lfe.189.2023.05.03.07.56.09
        for <linux-usb@vger.kernel.org>
        (version=TLS1 cipher=ECDHE-ECDSA-AES128-SHA bits=128/128);
        Wed, 03 May 2023 07:56:09 -0700 (PDT)
Message-ID: <64527609.190a0220.2dfc5.14d5@mx.google.com>
Date:   Wed, 03 May 2023 07:56:09 -0700 (PDT)
X-Google-Original-Date: 3 May 2023 19:56:09 +0500
MIME-Version: 1.0
From:   antonialiu5320@gmail.com
To:     linux-usb@vger.kernel.org
Subject: Cost Estimation
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

=0D=0AHi,=0D=0A=0D=0AIt's  from Crown Estimation, LLC=0D=0A=0D=0A=
We are specializing in full cost estimates and all related biddin=
g services for all construction projects in all 50 states. We pro=
vide our services for general and sub-contractors as well as owne=
rs/developers, architects and engineers.=0D=0A =0D=0AFeel free to=
 contact me if you have any query or you want to see our sample w=
ork.=0D=0A=0D=0ABest Regards!=0D=0AAntonia Liu=0D=0AMarketing Man=
ager=0D=0ACrown Estimation, LLC

