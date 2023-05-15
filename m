Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D78CE70241E
	for <lists+linux-usb@lfdr.de>; Mon, 15 May 2023 08:08:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238374AbjEOGIS (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Mon, 15 May 2023 02:08:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238378AbjEOGH4 (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Mon, 15 May 2023 02:07:56 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97A2D3ABD
        for <linux-usb@vger.kernel.org>; Sun, 14 May 2023 23:06:03 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f27977aed6so3552906e87.2
        for <linux-usb@vger.kernel.org>; Sun, 14 May 2023 23:06:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684130761; x=1686722761;
        h=to:subject:message-id:date:from:sender:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ikNQkrdrAJGCNAvergzNJwqSJvekujKYKl5hFESSnUY=;
        b=EKXVUTUTriHmUgh+qSGooFfpgsIh+mTO4nw6Qa2EbMkRWT77OwdkDQ4iFiH25fE5op
         03763HyXOTZXwec9ufUxsRY2iKU+rbibsZSp3SJZMtJmx0tRS/IeATDUVcfo9TfImd3/
         Yf/q2GIfc41ITkRZ7YcVSX3QJg6nyuOkeNAP2lZJIvPzJu5/CPUigjO+tkR0gOTpT5iV
         ZcqW56QNBrBnEWWzSeSK8XerfFpGytc7z4rh4EQtnoM+11nT7nMJsOOyZqjXI2MRB/6k
         hy+mwVX964jdxBbNW/Eipkr+a51S8PBFzmBjwPB9F/Jm4ij9c8bIqzvFJ86qRlOfYK+4
         LZAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684130761; x=1686722761;
        h=to:subject:message-id:date:from:sender:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ikNQkrdrAJGCNAvergzNJwqSJvekujKYKl5hFESSnUY=;
        b=FMXo0Kc2QLqX7cxCLWPwgrDAV9QiWAYkGlCmxghXDDcmZGY1LTS0jA14X3zwY77gJD
         QhGUqhueOCyscZm/klIUK3Ux+P37dvAN0G/+nK8qfEMcrgqWY4go9oHWyZ1ttGmYOgUX
         puXZagPBn2ba0gWpeKc96yCdqoqC5X6ANW6fFUM5ZZUR+65i130qB24M52ll9bxAMGDc
         OtGvolLurPQKVox+5pHcvN4iuEUNx3CdYbN2eRdvfTBrHHsTLVVG63YwlRa97zCZufID
         TyHkCn7w/le4XqV8NEARGn+ezzj1Xr8Vt3r4ihEqlE5BgbLyc0RzpSAXtEsrEDeyZLga
         wtdA==
X-Gm-Message-State: AC+VfDx8N8bXN8pdu2co7jsyUBswxNd2qmLLj042hWOTF6Kp//tM315g
        TDSrRFENxOl58Xbym2rLSCpecWxASasRlTdk7MQ=
X-Google-Smtp-Source: ACHHUZ67kGlnLEVTsEqyit+X3AiJBq8D1zm3v6DKD3Db/DcVbo9yrZ35RaRs1ZRzO/yofsfT9eNQEMBL5c1hMj4VgO0=
X-Received: by 2002:a05:6512:21a6:b0:4e9:cfd2:e2d with SMTP id
 c6-20020a05651221a600b004e9cfd20e2dmr5511791lft.65.1684130761032; Sun, 14 May
 2023 23:06:01 -0700 (PDT)
MIME-Version: 1.0
Sender: aminataouedraoga057@gmail.com
Received: by 2002:a2e:9bcd:0:b0:2a8:c1ab:1c8a with HTTP; Sun, 14 May 2023
 23:06:00 -0700 (PDT)
From:   Wolfgang Hermann <wolfgangtrebsch4@gmail.com>
Date:   Sun, 14 May 2023 23:06:00 -0700
X-Google-Sender-Auth: KP9Dc2XgDriITtbll2BdGIjdGlw
Message-ID: <CAMjNxnsc0_NzSdsBUYEYMLvPaevwWjS4FnVmq+LAMzN1AsxfmA@mail.gmail.com>
Subject: Awaiting your response
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=6.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,LOTS_OF_MONEY,MONEY_FRAUD_5,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:132 listed in]
        [list.dnswl.org]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [aminataouedraoga057[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [wolfgangtrebsch4[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.7 UNDISC_MONEY Undisclosed recipients + money/fraud signs
        *  2.6 MONEY_FRAUD_5 Lots of money and many fraud phrases
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Hello,

I am Mr Wolfgang Hermann Triebsch, a dua Citizen of Germany and
Canada, but living in Burkina Faso. I am 80 years old, I lost my wife
and two daughters during the Burkina Faso Political unrest that
happened in August 2016 you can view the link below:

I am a philanthropist and a God fearing devoted Christian, a Crude Oil
dealer and Architecture.

Due to the shock of their death that resulted in me being diagnosed
with High Blood Pressure (HBP) also with Paralysis.

I cannot walk or stand, I have been bedridden for (4) years now,
recently I was diagnosed with Prostate Cancer, and I have concluded
that I will donate all my savings to charities and churches.

Since I know that I have very limited time to stay on earth before I
die according to my Doctors, I have been helping and contributing some
amounts of money to Orphanage Homes and to Charity Organizations, as
well as Foundations with the help of the Priest of the Catholic church
where i worship, I have given donations to over 10 Charity
Organizations and Foundations, in Africa, Asia, South America, etc. at
this moment I have the balance deposit sum of $6,000,000,00 USD,
 in one of the prime bank here in Burkina Faso which i
want to entrust in you or your church or your foundation for charity
project in your country with my name.

As soon as I receive your reply I shall give you the contact of my
bank where you will send your bank details and other requirements they
may need from you .I want you and the church to always pray for me.

Thanks for your understanding.

Best regards,
Mr. Wolfgang Hermann Triebsch
