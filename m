Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 618B35A11B8
	for <lists+linux-usb@lfdr.de>; Thu, 25 Aug 2022 15:17:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242217AbiHYNRX (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Thu, 25 Aug 2022 09:17:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242350AbiHYNRU (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Thu, 25 Aug 2022 09:17:20 -0400
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB46EAA345
        for <linux-usb@vger.kernel.org>; Thu, 25 Aug 2022 06:16:59 -0700 (PDT)
Received: by mail-vs1-xe32.google.com with SMTP id q67so12123874vsa.1
        for <linux-usb@vger.kernel.org>; Thu, 25 Aug 2022 06:16:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc;
        bh=OhrrxA0+VtUH2OMYp4JdnIujQjBusCdPTL4Hk4sQ+XM=;
        b=c2EBu/xlUgvFfCXw6bhPFYwwBqX4Xb/5Z9rFPjKKsdMiiU3e7lX+/FvfldD1Evv5/g
         BmT8pBW5hUxcuSZMakPP6Fy/IVjuLNX7WQx9CdOYt55tjWQDoxmjnLLzoGXacTd+4ODX
         uEqUWsCWfSl2VEDmziwoQI9qJGDzBWH1MvlmvbjT7FCJycbWj/ZtdiIvPCtAvnBnz1uo
         yldmDePBLaGm96YJ/koO4MrplKtizsaiAy94jKF+WWrcXjo2rwhylgTXcumgos6+G4sc
         U9P6PTROz0BkgAAhdn5IBy3I0ZMklYBrZdbhDMrAIOpN3KyYN4vmilJX5xamjqoOZo8c
         wMsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc;
        bh=OhrrxA0+VtUH2OMYp4JdnIujQjBusCdPTL4Hk4sQ+XM=;
        b=WL2hAy3wOlzDMVLurAAErg9/jrObdAbzlaMMEyU0zVdfmaYjWmf80wauScxlQztGWW
         r4K3JJ3u1mWvI9Fq+H6DCq6NMSGaIEhJOiDuTKnzTQKSaLa3hou+rC5fwsWbVuAHr5ud
         HMJFmR/MpOC0Gf/yekB3u3PHa+1g1b6PGgFuNOAM2llYonBGRl3n3E2lPLd9kP3Q5+cH
         DLiZgxngx5rrxCWevSbxuI/d3KTpdht8uWfwqf3VRkb67CeyVoXZhjBEm5xrSkXO3H4R
         iucCsm+X/XpQmOqpvW83RU+5QSmLBaXuUPLEj3PJHHIv07XbmoAFpKukwauXsq3s6A6I
         9Khw==
X-Gm-Message-State: ACgBeo36cbA+GD5qjPMyRQt/lwqeOa72a3dllYdbVoGl4TJPs4MFiRpJ
        jKYWxyWDiCv7XmtyxEq8HPi1ucpAObkQ/3uAXAY=
X-Google-Smtp-Source: AA6agR6VDlwIITTEnlsZOHyGjzRARQZgOBnTRj/b0zDFjBd8oQjZvxe487l6LSWdZzeIjvNKlLj4Tgr6ksMLgCBjDHo=
X-Received: by 2002:a05:6102:7c6:b0:390:7f43:7473 with SMTP id
 y6-20020a05610207c600b003907f437473mr1462913vsg.73.1661433418904; Thu, 25 Aug
 2022 06:16:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a59:dd84:0:b0:2da:1bbe:5176 with HTTP; Thu, 25 Aug 2022
 06:16:57 -0700 (PDT)
Reply-To: franca.rose3@yahoo.com
From:   Franca Rose <roseharri3@gmail.com>
Date:   Thu, 25 Aug 2022 13:16:57 +0000
Message-ID: <CAGs5tX7fAjGUdYf7AwbQ9_mAvc045T8KpiQCXAieA3oSuQYWDg@mail.gmail.com>
Subject: Hello
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:e32 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [roseharri3[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [roseharri3[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [franca.rose3[at]yahoo.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.2 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

-- 
Hello,

i am trying to reach you hope this message get to
you.from Franca Rose
