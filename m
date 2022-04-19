Return-Path: <linux-usb-owner@vger.kernel.org>
X-Original-To: lists+linux-usb@lfdr.de
Delivered-To: lists+linux-usb@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBEF1506FC0
	for <lists+linux-usb@lfdr.de>; Tue, 19 Apr 2022 16:07:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347184AbiDSOJU (ORCPT <rfc822;lists+linux-usb@lfdr.de>);
        Tue, 19 Apr 2022 10:09:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52236 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351293AbiDSOJS (ORCPT
        <rfc822;linux-usb@vger.kernel.org>); Tue, 19 Apr 2022 10:09:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7AFD22A701
        for <linux-usb@vger.kernel.org>; Tue, 19 Apr 2022 07:06:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1650377194;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=UrvBWaRXV3DlLVU6RimSG2jNQYfccJ/kwX+dgBkIis4=;
        b=dhWVkO0z5IhByvCWbQ3TO8Qm2V1gZDYcPXki3l2UFdqWUUD/Mm4vSq3H+1Vpm4pGQfXJAJ
        HlVidfvAKEDhHFpyRehX7B6UQLJneE762ummu9gyNV9Q/4bVTdfeIvDh7AyYL6E88B/Jr6
        nxxXQKovb+NMG5eXZX/UsmdhoWSM87U=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-325-_614p9wsOPyF2k89PzLABQ-1; Tue, 19 Apr 2022 10:06:32 -0400
X-MC-Unique: _614p9wsOPyF2k89PzLABQ-1
Received: by mail-qk1-f197.google.com with SMTP id s63-20020a372c42000000b0069ec0715d5eso1708406qkh.10
        for <linux-usb@vger.kernel.org>; Tue, 19 Apr 2022 07:06:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=UrvBWaRXV3DlLVU6RimSG2jNQYfccJ/kwX+dgBkIis4=;
        b=kBUeyBly4bhL0HmeqRNT6XKoI8pt4SBVJXP1P4UiM2hxJNQx1SF/MGzhhHHDR07Mn9
         fo1EebNbcij/KuXdr1uwWIL2FnIRKwzgkYlHQ3JPpNt5CA9PPQnb//xgfWaoFm5UH5XR
         1l5WqaDKDeZw9YJ2l1lF+nq3eXRM84qM0OiRPTE5AIiaqzaZXuXfiMlYn9Xo/418X/qX
         NhQUDJowlGWISW+ml5CJpeQZOtdd2d1w1mu9lDT9Ndr0Gm4gRaFBC4Z0nY+cQeaWUBip
         2VOvwEC3QsRZHTOpuoKF2Ssv1Z5unDowv63oG9vXCVFlqP6sUICJ86mFL0CBVvPqSJk0
         FLew==
X-Gm-Message-State: AOAM532pc4g8Z0/QrgRmZ+f2WBXmRJ+wmNXijY2NpEQ+Z7+WpMKeQq4z
        PjSvugd4P9M2wOvOQHZVwtoiDSAvoQKrUwLDMf5YrcCf0T9glum1mBCCc9kfOymqyDu0tip/dlM
        C1KoQL059KT6eV57drMds
X-Received: by 2002:a05:620a:258b:b0:680:f66e:3381 with SMTP id x11-20020a05620a258b00b00680f66e3381mr9472894qko.291.1650377192266;
        Tue, 19 Apr 2022 07:06:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyB9cTVt0zydUHqWyNffYIDfCm9PGrZ/QTxmXsfj7ORbXn7UsWYrkuGD73ZFStBSxvCCJ7yOg==
X-Received: by 2002:a05:620a:258b:b0:680:f66e:3381 with SMTP id x11-20020a05620a258b00b00680f66e3381mr9472870qko.291.1650377192017;
        Tue, 19 Apr 2022 07:06:32 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id 2-20020a05620a06c200b0069ea498aec7sm59151qky.16.2022.04.19.07.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 07:06:31 -0700 (PDT)
From:   Tom Rix <trix@redhat.com>
To:     davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com
Cc:     linux-usb@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tom Rix <trix@redhat.com>
Subject: [PATCH] USB2NET : SR9800 : change SR9800_BULKIN_SIZE from global to static
Date:   Tue, 19 Apr 2022 10:06:25 -0400
Message-Id: <20220419140625.2886328-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-usb.vger.kernel.org>
X-Mailing-List: linux-usb@vger.kernel.org

Smatch reports this issue
sr9800.h:166:53: warning: symbol 'SR9800_BULKIN_SIZE' was not declared. Should it be static?

Global variables should not be defined in header files.
This only works because sr9800.h in only included by sr9800.c
Change the storage-class specifier to static.
And since it does not change add type qualifier const.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/net/usb/sr9800.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/usb/sr9800.h b/drivers/net/usb/sr9800.h
index 18f670251275..952e6f7c0321 100644
--- a/drivers/net/usb/sr9800.h
+++ b/drivers/net/usb/sr9800.h
@@ -163,7 +163,7 @@
 #define SR9800_MAX_BULKIN_24K		6
 #define SR9800_MAX_BULKIN_32K		7
 
-struct {unsigned short size, byte_cnt, threshold; } SR9800_BULKIN_SIZE[] = {
+static const struct {unsigned short size, byte_cnt, threshold; } SR9800_BULKIN_SIZE[] = {
 	/* 2k */
 	{2048, 0x8000, 0x8001},
 	/* 4k */
-- 
2.27.0

