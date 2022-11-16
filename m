Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9507962B6E9
	for <lists+linux-usb@lfdr.de>; Wed, 16 Nov 2022 10:51:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbiKPJvT (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Wed, 16 Nov 2022 04:51:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbiKPJvS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Wed, 16 Nov 2022 04:51:18 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BFD563A7
        for <linux-usb@vger.kernel.org>; Wed, 16 Nov 2022 01:51:17 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id w14so28979438wru.8
        for <linux-usb@vger.kernel.org>; Wed, 16 Nov 2022 01:51:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EmNY9q9DX97g2St/O30t2bUNctOXRrK6tcjOyVP/O74=;
        b=f9nYnagLQ49/D/j0di/jae0cIH4o4i15RzHwffiQAKuJo4R6HbzCD67UEwleWTq4bj
         5rSvupCCv8VC3aq05io6wFZB+v3MJ2b/la9D+Ko3fXj9IuN/O02HD6G+gB+Iqc/pdFeA
         V81yMaBj9LggBMQd75TzaABt9poAicRftwMD5ZrZW4QskEOA/XAQt9QyihzuM/nqh7X5
         Q/7xE/vg6CMk5n01NAI8uYZZ6FT/eSAj9/hef70Tu0CIyMoheucjHz2kh0YYJh03HMMU
         q7I0oiuD8R6XKdzelYxTdXHq1q/s/kCXFckY98MKznD063DaY/8SYOV26HiiIzEwQ5lo
         B1iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EmNY9q9DX97g2St/O30t2bUNctOXRrK6tcjOyVP/O74=;
        b=IBh86K4r4y56I9H3JolJ7ZMIMJ0wb//RF8WzQ6BbDXgAFiTwzzoSQrdvviPb2gxQtM
         99vzn5Q2XTnT04JyqsWT8S5u7s1l28JkhgDD2zwLTaeXDedS55dUrC8Sx36MUkwU+ggo
         EDAakdwXSr4YstDkca3Z32M3UgQTkstfdNCXpTqA3EzZRYQ5CwHXY62rAhja0YxDHV7z
         ArpC1ypByX+ilgWnMUYe3EQKSqX/0eWZwh+UTUYXV1e/QPfjQcXJXMP+WEwGL+hPkc0F
         MulI+49j8B/9hhWTgfhDh6lUNBwkQB+SUOgSvMkFMbKVSyvPZQ4Vi2jsN0SZVoPERbJS
         ekuA==
X-Gm-Message-State: ANoB5pk1g08WU7fr1YTv/ohG/D8JoUUmpyUKN9/NUpYQ30X0Vcr6YHxj
        tLbigVbwy5DUh6cCeezhIQk=
X-Google-Smtp-Source: AA0mqf5l8sAeb+nLsVFVeAGd+EsZg9bfHqk5Z0Vr1+gBOCpk1aJbNw/1SD+AxP1dUnOHCNVihENLEg==
X-Received: by 2002:a05:6000:1363:b0:241:9a82:a44c with SMTP id q3-20020a056000136300b002419a82a44cmr4766202wrz.37.1668592275950;
        Wed, 16 Nov 2022 01:51:15 -0800 (PST)
Received: from testvm.. ([185.215.195.243])
        by smtp.googlemail.com with ESMTPSA id m42-20020a05600c3b2a00b003cf47556f21sm1690562wms.2.2022.11.16.01.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 01:51:15 -0800 (PST)
From:   Davide Tronchin <davide.tronchin.94@gmail.com>
To:     johan@kernel.org
Cc:     cesare.marzano@gmail.com, davide.tronchin.94@gmail.com,
        gregkh@linuxfoundation.org, larsm17@gmail.com,
        linux-usb@vger.kernel.org, marco.demarco@posteo.net
Subject: Re: [PATCH v5 1/3] USB: serial: option: remove old LARA-R6 PID
Date:   Wed, 16 Nov 2022 10:50:42 +0100
Message-Id: <20221116095042.57026-1-davide.tronchin.94@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <Y3SZsdUk1L9v6SUs@hovoldconsulting.com>
References: <Y3SZsdUk1L9v6SUs@hovoldconsulting.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

> > Yes, i am a u-blox employee and i've been asked to integrate LARA-L6 in
> > the linux kernel and update the current code for LARA-R6 00B (updating
> > the PID from 0x90fa to 0x908b).
>
> Thanks. Was it it also a colleague of yours that submitted the initial
> PID then?

Correct, the initial PID has been submitted by another u-blox employee.

> > The first prototype of LARA-R6 00B had 0x90fa PID but, just before the
> > product finalization, it has been decided to adopt a new USB composition
> > and consequently a change of PID was necessary.
> > The 0x90fa PID has been used only for some internal prototypes, hence
> > no u-blox products with that PID have been shipped to customers.
> > As pointed out in the discussion, the 0x90fa PID is used by other module
> > vendors which sell Qualcomm based modems, hence i proposed to remove the
> > association between u-blox (thedefine UBLOX_PRODUCT_R6XX) and 0x90fa,
> > moving it directly in the option_ids array.
>
> Thanks, this is the kind of details we've been asking for. Please put
> some of this in the commit in some form so that it is obvious from just
> reading the commit message that the patch is correct and safe to apply.
>
> Make sure to mention that this Qualcomm PID is used by other products
> and that's why you're leaving it in. Perhaps a Link tag with a
> reference to Lars message pointing this out is in place. For example:

Ok thanks for the suggestions. I will add all the details to the v6 1/3
patch.

> > Thanks for the suggestions. In order to simplify the submission process,
> > i propose to split the submission for the LARA-L6 patches and the update
> > for LARA-R6 00B.
> > Do you think could it be feasible?
>
> I don't think that's necessary now that you've provided some more
> details. Just respin the series and address the review comments given
> so far (either by rejecting a suggestion and explaining why, or by
> incorporating it in your next submission).
>
> It seems you only need to tweak some of the commit messages in a v6.

I will submit a v6 version of the patch with the provided suggestions.

I have just one doubt, in patch v6, should i edit also the previous
sent changelog by describing changes to each indiviual sub-patch?

Thank you for the patience.
Davide
