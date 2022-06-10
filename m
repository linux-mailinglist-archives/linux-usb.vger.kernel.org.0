Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2CC70545C61
	for <lists+linux-usb@lfdr.de>; Fri, 10 Jun 2022 08:38:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243967AbiFJGiK (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 10 Jun 2022 02:38:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60012 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243486AbiFJGiI (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 10 Jun 2022 02:38:08 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 301474B413
        for <linux-usb@vger.kernel.org>; Thu,  9 Jun 2022 23:38:06 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id cx11so23276540pjb.1
        for <linux-usb@vger.kernel.org>; Thu, 09 Jun 2022 23:38:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=jb8ugQP6rcowkzhIHnQGDRcogVpuuUr42b2mYG4LZJA=;
        b=JuBjL8VTiAmSuGsNEL45qu8Y/X1/RxDli1gXp2WWtgn6xYBgs7iecpoZCxRkyCHs+6
         7nd5kV1N8F7jAiRd6eE7R9iL/LDMbtwcnj6r2gKPWFRMiEfIVvjXmo6ckxTsWTrOvxgb
         Kb42WU6RtD5GvOCkjNInhwxKC8fkYHkTzPjxfW0mxWiCkaKYiSLc5fLFogKqYnD69MOk
         uV82NWOPqtjmUbejxT+jWB4xxjiUXDAj4y0xpOst1T+E2ChcS11DIcGgPX2CCk3G7XUE
         4k/jJjuy2mqUjqAbafjAEKX56UuxO8geEsADRsoGQptxsWJ0i+VFPBmgumoH/IYhyFjp
         63jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=jb8ugQP6rcowkzhIHnQGDRcogVpuuUr42b2mYG4LZJA=;
        b=ohPfLf2vojZywR5dQwFOdukBK98zspF/wi4l4xpK9snIe2d1S1ikksTjI+MBtHdvWi
         lSNKMnd7kdtSPmJEpjHr+5gjntjDEQIQbU0+s83bBXWlHyK5JqR0snVizeSZsNqobjC/
         cpxCJdLhCCSL9cjXOxDySax8w69O5doAKKW6yx9eX/zJ1hFS6pRA6ScXR5w04MfOq1J7
         ThlL1Q9ZzoCcDFMO3Jqv7GrY88IRPw5UWrSebAr7Noheclq7xSL2OM5e2V10GssrZC14
         99cE3SNiicInUswQcUtsasc6Qoawj/9LuV+3WAMz0UgOMLq5vzqlmb3VTpfeR8ABGr+M
         U4PQ==
X-Gm-Message-State: AOAM533P9t1Jf7Xmx/X0Lu51FQLo0Uay1oApYkWwU72EefCm4kD19nmt
        0eyMqAqR8fh8FT/6oDyEQi5mvZV/iyU0ECxK+s0=
X-Google-Smtp-Source: ABdhPJx0kJ7LtLcMc58AXBT9G6aZjPwYfhpybMBWMynLahxrJuI+fH4xamLRrwLuavBoFUJ66cy6ZrDazlRUcDKsYS4=
X-Received: by 2002:a17:902:f2ca:b0:167:8898:bad0 with SMTP id
 h10-20020a170902f2ca00b001678898bad0mr20973296plc.170.1654843085668; Thu, 09
 Jun 2022 23:38:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a10:8703:b0:2a4:a8f1:7164 with HTTP; Thu, 9 Jun 2022
 23:38:04 -0700 (PDT)
Reply-To: CharlotteLauren@mail.com
From:   Charlotte Lauren <info.heleneelisabeth.info.bl@gmail.com>
Date:   Fri, 10 Jun 2022 13:38:04 +0700
Message-ID: <CAJsbKVSh7kZzVfqDmpoSztoNREdTbj3jHcZhgsfQM1ZWc99fvg@mail.gmail.com>
Subject: Donation
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=3.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ***
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello Friend
it's really great to come across over your e-mail my name is Charlotte
Lauren  please kindly get back to me ASAP for urgent information

Best Regards,
Charlotte Lauren
