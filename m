Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4D34D629F80
	for <lists+linux-usb@lfdr.de>; Tue, 15 Nov 2022 17:47:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231976AbiKOQr2 (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Nov 2022 11:47:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232144AbiKOQrX (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Nov 2022 11:47:23 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 288A426101
        for <linux-usb@vger.kernel.org>; Tue, 15 Nov 2022 08:47:23 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id v124-20020a1cac82000000b003cf7a4ea2caso13543055wme.5
        for <linux-usb@vger.kernel.org>; Tue, 15 Nov 2022 08:47:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cFmINEhyGbM7uHzxf1eCXGgs4FcqEpShAwAlqKgu+SI=;
        b=oIhg1e565mdyLPnSC20xyadQ76N7zeF6RaG/EAJIF9kQVkOmvT/gq05XJfMHxqJsBN
         PxxuS8mJpzIIvAKTCZ6jTs/AcPy12mMn0ztMdresLQlc+51+nrtrctH227bAXkV1UwHs
         +Ec3WRyI4wBLdxNtHg6bbUPj5zmatopfQPu0K7GsKNGiMOEudXXKY+gGOfbg5zZpBO6E
         OdAS395hjRzTk9aEX+6tTm0DIY7/CF0KHOSawoARs9Z7msSla3y5k+ebbVsDxT4pKzLd
         aI+ZbV9yzn6IBglD5zshKAU3T/VIincGN2+2z9/aPTyIkjZPZm3gV355sguXJVAeGAmH
         UOCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cFmINEhyGbM7uHzxf1eCXGgs4FcqEpShAwAlqKgu+SI=;
        b=XVrpchLYZx5SiY+Oydi+Pb78stDZaOqV0F1aI0gyjQO8RwtXFAR5vkq0CNfFz/vMud
         yLDZdjSkdnEeWyiEMX3IdRrhvIwad+adnYUmPbNsooePBCHoDTABDynG8NfH/QTm4dma
         2BVHaNGtXDGup3jJ6HoarmyZKpDnDXkQKb79bqGHEg7z5eX2n8xaSHoVLrsxXtCZjzBx
         zzOjBRdVBboc7CSKjafbcr0R061oE0T58dwJSLOUnw4f7RYQ8zLjT45cNiqUXFzY70sE
         sqF5BRO+1C+3ppyXcbNJsdmqTwCc9d1V9FfD8vGFs9LbehueFF1H72WCryxsoEmpAACB
         Lmlg==
X-Gm-Message-State: ANoB5pkhUn3dFq8H/KQmgBJOMQZg/Qo98c5BGbMQSAaRLDvEFyPSQvVR
        dfyXmCZ+bcvaR2Pv90U8MPM=
X-Google-Smtp-Source: AA0mqf6IZgHPgtwcH3BJmtWrj/rAYKbZVCgMbCYMkIMcWQfn/9jfsPfm53Qw8Pw4qE3yugEXRLDURw==
X-Received: by 2002:a7b:cb0c:0:b0:3cf:d08d:3eb2 with SMTP id u12-20020a7bcb0c000000b003cfd08d3eb2mr2207687wmj.129.1668530841569;
        Tue, 15 Nov 2022 08:47:21 -0800 (PST)
Received: from testvm.. ([185.215.195.243])
        by smtp.googlemail.com with ESMTPSA id m6-20020a05600c4f4600b003c6cd82596esm23895514wmq.43.2022.11.15.08.47.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 08:47:21 -0800 (PST)
From:   Davide Tronchin <davide.tronchin.94@gmail.com>
To:     johan@kernel.org
Cc:     cesare.marzano@gmail.com, davide.tronchin.94@gmail.com,
        gregkh@linuxfoundation.org, larsm17@gmail.com,
        linux-usb@vger.kernel.org, marco.demarco@posteo.net
Subject: Re: [PATCH v5 1/3] USB: serial: option: remove old LARA-R6 PID
Date:   Tue, 15 Nov 2022 17:46:54 +0100
Message-Id: <20221115164654.38632-1-davide.tronchin.94@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <Y3NmKk0Xte04qxwS@hovoldconsulting.com>
References: <Y3NmKk0Xte04qxwS@hovoldconsulting.com>
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

My apologies, this is my first attempt to submit a patch to the kernel
community.

> We've asked you repeatedly whether you for u-blox or not, but you keep
> ignoring this question. Knowing this would allow us to better evaluate
> the reasoning and motivation behind this this change.

Yes, i am a u-blox employee and i've been asked to integrate LARA-L6 in
the linux kernel and update the current code for LARA-R6 00B (updating
the PID from 0x90fa to 0x908b).

> The above commit message still does not explain why you want to remove
> it and whether it would be safe to do so. Why was added in the first
> place? What u-blox products used the old PID?

The first prototype of LARA-R6 00B had 0x90fa PID but, just before the
product finalization, it has been decided to adopt a new USB composition
and consequently a change of PID was necessary.
The 0x90fa PID has been used only for some internal prototypes, hence
no u-blox products with that PID have been shipped to customers.
As pointed out in the discussion, the 0x90fa PID is used by other module
vendors which sell Qualcomm based modems, hence i proposed to remove the
association between u-blox (thedefine UBLOX_PRODUCT_R6XX) and 0x90fa,
moving it directly in the option_ids array.

> By just removing the define this is less of an issue, but you should
> not make the life of reviewers harder by ignoring request to properly
> motivate your changes and explain why they are safe to apply.

My apologies again, thanks for the patience.

> You can either put a shared changelog for the whole series in a cover
> letter, or you describe changes to each individual patch. But mixing the
> two styles as you do in this entry is just confusing.

Thanks for the suggestions. In order to simplify the submission process,
i propose to split the submission for the LARA-L6 patches and the update
for LARA-R6 00B.
Do you think could it be feasible?

Davide
