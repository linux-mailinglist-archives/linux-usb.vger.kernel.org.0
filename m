Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E38774CAF37
	for <lists+linux-usb@lfdr.de>; Wed,  2 Mar 2022 20:57:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242626AbiCBT6C (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 2 Mar 2022 14:58:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242982AbiCBT5x (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 2 Mar 2022 14:57:53 -0500
Received: from mail-qk1-x72a.google.com (mail-qk1-x72a.google.com [IPv6:2607:f8b0:4864:20::72a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D09DDA850
        for <linux-usb@vger.kernel.org>; Wed,  2 Mar 2022 11:57:10 -0800 (PST)
Received: by mail-qk1-x72a.google.com with SMTP id q4so2199571qki.11
        for <linux-usb@vger.kernel.org>; Wed, 02 Mar 2022 11:57:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=c3P4r2Qz0VdfRBuStsXVpcJEgpWE5t0Sgi1SeeHIl+U=;
        b=LkTuChizRLAgkV/+evVouJnrZlFRZFijmN6IbNZYjcK2+6KvfrJmmcMKXnM6c9Nj0b
         NZYJXj753gpZQKCGqI1ktzTlI1N6Inw+rans5dBGbi5UapRSKXrtGEpyo/X9gbpncngB
         5X7FI/wPoh/bFIMQcYv3oznHeUTFexl18whNrgk7Vjoh4ZygFyBhSZ+VcidiZOaEzrIE
         D/BsPb6p+NkmYnp6jRKmhYo0P/d8WSzIYuTn9VxzlkgsXI/LmYyhhhfdcrUAgMKGBP8z
         XWjy+GbLzXiC8XJj91DT2m8fEAQ9esLvaTwMrCVnNFIFFHtJG/3Y+jjbQHNtoa0OVwp4
         qCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=c3P4r2Qz0VdfRBuStsXVpcJEgpWE5t0Sgi1SeeHIl+U=;
        b=tlAkY/dSv7IUcll92W6DYnHkxZCcAMzjOZveFf4LbQQDtLhMBSbQmv/+UaVU3uc797
         fHRjqiooYzOf99cQwm+Uvx2GXR6PmwYLzOWowxDsbUuAyBdgktNh2nipQRVVD2WhZR7z
         oMGyuEXpv5htHGdPx0VKcSMK/RKgNtQ1RGZjkfeCa1I2LfHLaxEAVHyRrqi+OK0NnlB7
         se4QGOssiYcu+sWNhuWhBAZcZM+uRG53eHs/OK/83FKXmrdQ6P7NV38d7icNM50l80IQ
         ozM3zePf8nooklkuSglyuqqb7cUknaCCCbQ/ilKvG7j0IBUaZ1dV9rdFbZiwc0jMc3z1
         4Z7w==
X-Gm-Message-State: AOAM531Cv/mlg8z7aagMFomQagb1nTWJNLFCudf3lwpq4IwcHBBg0Ghw
        TDJ3G0q+9NcPDdNclhjj1HKxlq8KgVte3+uMBNk=
X-Google-Smtp-Source: ABdhPJxFYn0TEM5usZcHaziQ7VKEnqc6DAIldcWIN0Jb22Xrr1c5GqkfDYP6+TpE9UigjXrpUCjunLXFoex94+47Rxw=
X-Received: by 2002:a05:620a:1353:b0:648:a98e:e98f with SMTP id
 c19-20020a05620a135300b00648a98ee98fmr16985139qkl.112.1646251029249; Wed, 02
 Mar 2022 11:57:09 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:622a:1354:0:0:0:0 with HTTP; Wed, 2 Mar 2022 11:57:08
 -0800 (PST)
Reply-To: info.tiffanywiffany@gmail.com
From:   Tiffany Wiffany <fernadezl768@gmail.com>
Date:   Wed, 2 Mar 2022 11:57:08 -0800
Message-ID: <CA+J-fD6qp2OoSTyM1_PMRGp5dGx1pF=7Rx-CVpmk4dx00821ig@mail.gmail.com>
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
Please with honesty did you receive our message we send to you?
