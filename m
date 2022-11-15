Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DA294629F8F
	for <lists+linux-usb@lfdr.de>; Tue, 15 Nov 2022 17:50:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231867AbiKOQuY (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 15 Nov 2022 11:50:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60684 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230145AbiKOQuW (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 15 Nov 2022 11:50:22 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC43426DE
        for <linux-usb@vger.kernel.org>; Tue, 15 Nov 2022 08:50:21 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id w14so25283242wru.8
        for <linux-usb@vger.kernel.org>; Tue, 15 Nov 2022 08:50:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R1dU2NyTTNO2wWije6ed09Uz0s0kksKbsB3P4fJPE+0=;
        b=myBrtUR2r9Zphyy2Qw5cXHI23b7nWn/3ROAdZEMC47eStI+VKHdxsNXmQ/2bsj5Q4I
         snjsoFonXlTFGhP0C310UbzXtE1BKptxklAlGZ7zt/2jCmFLmZKNWSxtZj0Nu2hXGxmZ
         J/DsZrzE6Kga30bcp1KPM45SX/Z3me6DY9Kq/9IXcx5luvyqsyrboeRpSK/uACluXv2C
         G/JIbiEbOvBlwvMZPFK3kyAj12qEqwtuzG7cgc4y3dDMYEbVneNuuB3M8JqRd/kdSC4p
         8uPw+jbqa0Kv10aBsHDBAFMSzq7nKEhddfMcaCArMzUCNHIdZPvJ1cn6V1DgesBL3VUw
         jglg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R1dU2NyTTNO2wWije6ed09Uz0s0kksKbsB3P4fJPE+0=;
        b=Ur2QDWHy7KuoZr3WES/l2ks5Byz00KBcJ0dhdmg5G7uRozc01+ZGv1AsOhKlcWq/bx
         dSKYlU7lJuW0N/ESsjk2AQ/cPFwaC1Nplesdl0jkTGqomEsoEkqPh+5eM9us9IA+E7h8
         Qx3JnM4Oqo+99zQL6u/mti7O4NwOwxnj4/2r5b7qC/ociMGAjFg61qTNX7zZAeKrgXWj
         y3YAqfYEuVd3/l+QaPnVUWvh4r1nVIF0NnpvEa+KGMOjv+8lrMd86TAawV/fnxsFSEcJ
         1EGr5dpUOjWg2mXJ3ialyc1qhEGBo9t+DVkziN5hkAbx/hO86TIYNita5Er50gX8h2eq
         8P9A==
X-Gm-Message-State: ANoB5pnm19BbGD3GEiIZkip+BAntv9jtacAY1E1grbCufB3zXfgX1l+H
        f9dRXH2DIPchG6VMKLl9BJ0=
X-Google-Smtp-Source: AA0mqf5TXYv2PPOergyEmrjfl7spFidGrb063nyNkwqLyH92K9pCw30CmcElSEYwhGy3TQEGJ9nXeA==
X-Received: by 2002:a5d:538e:0:b0:236:71fe:c9c6 with SMTP id d14-20020a5d538e000000b0023671fec9c6mr10833331wrv.501.1668531020472;
        Tue, 15 Nov 2022 08:50:20 -0800 (PST)
Received: from testvm.. ([185.215.195.243])
        by smtp.googlemail.com with ESMTPSA id m29-20020a05600c3b1d00b003c6b7f5567csm2919611wms.0.2022.11.15.08.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Nov 2022 08:50:20 -0800 (PST)
From:   Davide Tronchin <davide.tronchin.94@gmail.com>
To:     johan@kernel.org
Cc:     cesare.marzano@gmail.com, davide.tronchin.94@gmail.com,
        gregkh@linuxfoundation.org, larsm17@gmail.com,
        linux-usb@vger.kernel.org, marco.demarco@posteo.net
Subject: Re: [PATCH v4 3/3] USB: serial: option: add u-blox LARA-L6 modem
Date:   Tue, 15 Nov 2022 17:50:00 +0100
Message-Id: <20221115165000.38682-1-davide.tronchin.94@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <Y3NodufBpWHAl1qG@hovoldconsulting.com>
References: <Y3NodufBpWHAl1qG@hovoldconsulting.com>
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

Sorry i have not commented because i tought the latest v5 patch version
was sufficient to understand.
RSVD(4) has been removed because in normal mode interface 4 is not used.

Davide
