Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BC7054F108D
	for <lists+linux-usb@lfdr.de>; Mon,  4 Apr 2022 10:12:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377919AbiDDINr (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 4 Apr 2022 04:13:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58324 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377922AbiDDINp (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 4 Apr 2022 04:13:45 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09C9331902
        for <linux-usb@vger.kernel.org>; Mon,  4 Apr 2022 01:11:49 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id z1so874896wrg.4
        for <linux-usb@vger.kernel.org>; Mon, 04 Apr 2022 01:11:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=ySLN6QOhbB8jet0inIF/Iva/LCsITkioLF6rTupWuLY=;
        b=GUOp4u0Sgr2agMAatLzKkfsf6+4DwKSmpQbro4q3UGhvANvJF2+r2Hc3BBel6XyScn
         /n5bd6rQgj8BJcgiXei9sd6+2sP3uEBrKJqqbo/yoA/w+I+UYgPfcV32lOts41wAmU9v
         /aFzyQ8CFQstVT3lSRNwGJ2Tpg6GjeuKhrWg2GCnUI6+7PaGSmYVpTpDfVItdztRhgS0
         /aQRLlOVXGyJwO3Ezy1fvSNg9SC78lhlqdHTxl9y2L9cjOTU4XA+aeOxyeI4UwbXHYsy
         ABTidSc5VIJ8gzJPuenJ5ErxNh/gkwdQ8ivKp2dCw+ADCbLJfk5aAfppd0ZXrdshzcdH
         vFdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=ySLN6QOhbB8jet0inIF/Iva/LCsITkioLF6rTupWuLY=;
        b=Csn4pvvU5NspA64cbz2WyUMpNi7uAj5CdTnxM55B+sJYO5yPTQnR6pI9oCB883BLGy
         C/Ik6fkXj2AQ8YcMeSgGLFtHwSvXYaz/bBiBazUmXQJFOXbv1RisMj9Eq4/alYc9YQ4q
         K33M03dwq2v1Ukf6aTWslCRPYudNwBsd/Ou7mGR8hx7H9699NDWEnb46uaC3mhlldfvj
         kMXTFtLAOGF6mMvuMdasVd2dEYuFKR0qrseJNi8I5ljcJz9MTuZpCAyABXhT5QqG3pzD
         T+VYR32Yb4PxjeRp55uJ3Uctnn7ohuFa9yNlgdrBd1Y+nUonELuvw8xYpYDOM9QG5DcO
         6J2A==
X-Gm-Message-State: AOAM531vt7vG/itEhZ3b557yEmdqtUO2SerCOP7RYhAfxfdd5vhViDoq
        qiGXBIl+wVBs9tyMe1NP5tILf2TihcF99eG89cU=
X-Google-Smtp-Source: ABdhPJyU+8veVxev/BuFrRMwEY4BSqwFcQWznSjrORpsalsSyhBMLQzMxPgEFvGxeWMgoa9K6T0aaxeMDAQ5TfXKTH0=
X-Received: by 2002:a05:6000:144e:b0:205:9a80:b4c3 with SMTP id
 v14-20020a056000144e00b002059a80b4c3mr16039999wrx.179.1649059907655; Mon, 04
 Apr 2022 01:11:47 -0700 (PDT)
MIME-Version: 1.0
Sender: murielledabire080@gmail.com
Received: by 2002:a5d:6da6:0:0:0:0:0 with HTTP; Mon, 4 Apr 2022 01:11:42 -0700 (PDT)
From:   Mrs Katherine Pascal <mrskatherinepascal9@gmail.com>
Date:   Mon, 4 Apr 2022 01:11:42 -0700
X-Google-Sender-Auth: xpN88P9Gdo0eKb7jvJMbwODM11k
Message-ID: <CAEYYs7ReM6exzcK25r_aXUgLp-XuYxwUH0p1eRhakLxt=8eE=Q@mail.gmail.com>
Subject: Greetings,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

-- 
Greetings,

I am Mrs. Katherine Pascal, I write to relate to you of my intention to use my
funds for charity work in your country.

I have been suffering from cancer I want to know if I can trust you to
use these funds for charity / orphanage. You will receive 30%
compensation for the work.

Please contact me on my direct Email:(mrskatherinepascal9@gmail.com )
if you are interested, so that I will give you more details.

Yours in the Lord,
Mrs. Katherine Pascal
