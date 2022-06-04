Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 421D953D6C9
	for <lists+linux-usb@lfdr.de>; Sat,  4 Jun 2022 14:34:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240704AbiFDMeN (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Sat, 4 Jun 2022 08:34:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235668AbiFDMeN (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Sat, 4 Jun 2022 08:34:13 -0400
Received: from mail-vk1-xa36.google.com (mail-vk1-xa36.google.com [IPv6:2607:f8b0:4864:20::a36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6DFA2B270
        for <linux-usb@vger.kernel.org>; Sat,  4 Jun 2022 05:34:11 -0700 (PDT)
Received: by mail-vk1-xa36.google.com with SMTP id u188so4474805vku.3
        for <linux-usb@vger.kernel.org>; Sat, 04 Jun 2022 05:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=Dj+vTAYcYc1uuPly/+GRNQhzsEg2OI2UZaJ2hMKqnMIbCEMaKjyYHYdj31awZ0Jw84
         9NgRdCsUQTCz8h5VUSHpmIEVSl1CyZx/K9foKAPSt1yi8FlOXD+p9PaIh7nZ4ihJF50N
         whXOSmqthWiUilUf4L2XNhHEPoqvLQSmUejNLw5ACpirwtLRgaQ5tS/u0qzoIFxhCxq3
         asT7/hHxb88/FnhPGc90j63khXA3SrfEQAwQyRlWvugvCEugEYW6upZ5AML+D3YIMcU5
         nTVB7LlFu8vYCs+El4oUooGdeKHWXg2GqQyU/HV4fbNxkHg2nb15gwSNWmDwetfv3H1z
         BEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=aVOWP5amdM9NfSwL7v8NBbEueuWQmRMcnIt3FowoThZi6Qe+lnHPskdQFWJphbhWZT
         +jRtphLWzw3T1p5fcPEFsd0bk9nOzQj1LzMDCys6f17Q0bxdmVcx7HJ8Lj8tj0twtgb4
         mg84HjqN7djUh+NUwow2kmWlrNKluQ1mpgATBNFlxjogeV7gSlXk29dXkrpcaClOO6ay
         DEKFSozDs+6nCgMzbKgcfNdEvZ+qK3RmJp6zuQzPBsHTVIAuKcxIbunNqMk6k7da+qqJ
         c5Mjb8Xhh53C5/Yg9h12D4dqOQl0JvwVOjNpCVPhFRE9fOOWOaz+6iG28Ys8m+zqoXs8
         64yQ==
X-Gm-Message-State: AOAM530NA9x2/nKLzsby5J2xUkPmyIR7xi1LsWV/24kcGNF/SZiALBNI
        lQGXqzDhaVx9JmNYx9pgF/rquTwKbSwTZoA6Bpo=
X-Google-Smtp-Source: ABdhPJz3fGZuOWyxC/l3+fZM8T3gULi5zuppc9rcvIXnVDfCFx4d9sGjStv75W/CipfSI7AqJ/9TRFFDCzBtCZ5mFOg=
X-Received: by 2002:a1f:1e57:0:b0:357:8306:1f58 with SMTP id
 e84-20020a1f1e57000000b0035783061f58mr25913522vke.37.1654346050885; Sat, 04
 Jun 2022 05:34:10 -0700 (PDT)
MIME-Version: 1.0
Sender: donaldruby53@gmail.com
Received: by 2002:a9f:2982:0:0:0:0:0 with HTTP; Sat, 4 Jun 2022 05:34:10 -0700 (PDT)
From:   Ahil Lia <mrsliaahil070@gmail.com>
Date:   Sat, 4 Jun 2022 12:34:10 +0000
X-Google-Sender-Auth: rMxNc9-24ZAM3wkXpVlpN_hgIRI
Message-ID: <CAM7X_d=N6vyQPscAZ1rVAn_oRTJUowUMwQ9Cu5R_Fw7eDA7GJQ@mail.gmail.com>
Subject: Hello, I need your assistance in this very matter
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org


