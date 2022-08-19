Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86616599CDE
	for <lists+linux-usb@lfdr.de>; Fri, 19 Aug 2022 15:29:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348779AbiHSN2d (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Fri, 19 Aug 2022 09:28:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231129AbiHSN2b (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Fri, 19 Aug 2022 09:28:31 -0400
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com [IPv6:2607:f8b0:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 211F740E04
        for <linux-usb@vger.kernel.org>; Fri, 19 Aug 2022 06:28:30 -0700 (PDT)
Received: by mail-pf1-x431.google.com with SMTP id x15so3437335pfp.4
        for <linux-usb@vger.kernel.org>; Fri, 19 Aug 2022 06:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc;
        bh=mjQeTomHVrOSB5APVgBKREJ3dps36GHUHw+LvLfvxds=;
        b=iczXKdchhRzJuV+sZqVpcxARt2IoKRB24bEay7I7FqIoKRH3vKUdKze2GywctD4qFl
         YltAFlmX9DLy9vFQnTDU9qW1NXFUdCnufddDWYOqWeECb3LMpeBUFEpO0hmp8Ief5Gqo
         JpZG3wXRLfUSlXH8uPj8iU8gubYFeYHkS8OettnRxostEkajdCfRX7l2utXStG49rh+1
         fvUQ+VCGTtrPl1y82QcXMmvagPBLU/TlqH+2+ty809FC+Suyq+36ldf43F/r7n55szgD
         Y0KLCvfmmEKqG5mBu/VYbjDmdvUPvcLYkd5b+0EZdUyAKCsQVl8rEvq88EP7W58cJ0mI
         MM7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc;
        bh=mjQeTomHVrOSB5APVgBKREJ3dps36GHUHw+LvLfvxds=;
        b=rP2PpPdAe8h2Uynu+mpweixRU6LSYBUXZKHDcezAR/JhSSnpb4ZWkYhBBUxC7gnEo/
         DoLfGQZQpH1XKzgW3M20fJBNWmO6sbhFWnWcsN7Lb1K2Myeu7+AICVOZOxp4whyBvMUn
         UOAhcuf6y6TUVIG27K96zH8hoS1myu2VFsSnZvaTu1h/JOiKQ/5yT+qaAClo1knvo6Cv
         RYDbhRUJMFcG7FhKwQ5ZrYp8U0I1wkZpB5TMulqBBwxY0pzt85eyRsYg/9piLP3nLfcf
         ip5GsGDaVQHHnffjV+dwbvZDy7RfFZEMOCBXNN3M/vVSJY7271aTHE+oV30+B9enxgEr
         ENSA==
X-Gm-Message-State: ACgBeo0WETdrMfiCMqIEAUuhfPAbMxkKDDNFM9O/5ohLLb5c++cr7LFS
        lAhjLhl6N1D5qqeQ8+iy+s9/q+iTtd3Bu/8sOzg=
X-Google-Smtp-Source: AA6agR6VAryMJBCWH6fZ7rtRMfA5r4/fR1raNVRiBjMwpGxhfeejz1AACkbGGCb06myOCbM6BBp0VLTy2vpejmzn0fQ=
X-Received: by 2002:a05:6a00:428d:b0:52e:6305:14c with SMTP id
 bx13-20020a056a00428d00b0052e6305014cmr7893033pfb.10.1660915709700; Fri, 19
 Aug 2022 06:28:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac4:9b84:0:b0:550:edb8:faf0 with HTTP; Fri, 19 Aug 2022
 06:28:29 -0700 (PDT)
Reply-To: wongshiule@gmail.com
From:   Wong Shiu <sadewayne837@gmail.com>
Date:   Fri, 19 Aug 2022 15:28:29 +0200
Message-ID: <CAB_n_kCfRZLncx0NpK+_MsAOy0-jWHxfJhvLadfyW40UOt=irg@mail.gmail.com>
Subject: Good Day
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:431 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4977]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [sadewayne837[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [sadewayne837[at]gmail.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  2.2 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

-- 
Good day

I found your email in the Google database,

Is your email address still valid? I have a good business proposal for you,

If you are interested, please contact me for more information at:
wongshiule@gmail.com

Wong Shiu
